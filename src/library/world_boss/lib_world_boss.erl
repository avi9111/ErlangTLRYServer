%%-------------------------------------------------------
%% @File     : lib_world_boss.erl
%% @Brief    : 世界boss
%% @Author   : cablsbs
%% @Date     : 2018-10-17
%%-------------------------------------------------------
-module(lib_world_boss).

-include("dice.hrl").
-include("scene.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("world_boss.hrl").
-include("proto/prot_309.hrl").

-export([
    init_boss_fields/1,
    create_boss_line/1,

    get_line/2,
    ranking/3,
    settle_up/4,
    do_summon_boss/4,
    summon_boss_on_field/2,
    update_boss_rank/4,
    send_dice_reward/3,
    dice_reward_callback/3,

    bcast_wb_activity_data/2,
    bcast_wb_guild_rank/1
]).


%% Apis -------------------------------------------------
init_boss_fields(FieldIds) ->
    InitFun = fun(FieldId, {AccFields, AccExtraSceneLines}) ->
        Field = conf_world_boss_field:get_field(FieldId),
        #{
            scene_id := SceneId, max_lines := MaxLines,
            role_lmt := RoleLmt, field_name := FieldName
        } = Field,
        BossField0 = #boss_field{
            field_id = FieldId, scene_id = SceneId,
            role_lmt = RoleLmt, field_name = FieldName
        },
        case catch create_boss_line(BossField0) of
            {_Line, BossField} ->
                AccFieldsN = [BossField | AccFields],
                AccExtraSceneLinesN = case MaxLines > 1 of
                    true -> [{SceneId, MaxLines-1} | AccExtraSceneLines];
                    false -> AccExtraSceneLines
                end,
                {AccFieldsN, AccExtraSceneLinesN};
            _ ->
                ?ERROR("Bad Scene: ~p in WorldBoss Field: ~p", [SceneId, FieldId]),
                {AccFields, AccExtraSceneLines}
        end
    end,
    {BossFields, ExtraSceneLines} = lists:foldl(InitFun, {[], []}, FieldIds),
    SceneSeq = gen_scene_seq([], ExtraSceneLines, []),
    {BossFields, SceneSeq}.

create_boss_line(BossField) ->
    #boss_field{scene_id = SceneId, lines = Lines} = BossField,
    ConfScene = conf_scene:get(SceneId),
    is_record(ConfScene, scene) orelse throw(bad_scene),
    #scene{x = X, y = Y} = ConfScene,
    {LineId, LinePid} = svr_scene_mgr:add_scene_line(SceneId),
    NewLine = {LineId, LinePid, 0, []},
    BossFieldN = BossField#boss_field{
        lines = [NewLine | Lines],
        born_xy = {X, Y},
        is_full = false
    },
    {NewLine, BossFieldN}.

% 当前层级所有boss已满
get_line(#boss_field{is_full = true}, _ReqLine) ->
    failed;
% 随机分线
get_line(#boss_field{lines = Lines, role_lmt = {BusyRoleNum, MaxRoleNum}} = BossField, 0) ->
    case Lines of
        [{LineId, LinePid, RoleNum, BossList} | RestLines] when RoleNum < BusyRoleNum ->
            LinesN = [{LineId, LinePid, RoleNum + 1, BossList} | RestLines],
            BossFieldN = BossField#boss_field{lines = LinesN},
            {LineId, BossFieldN};
        Lines ->
            case lists:keysort(3, Lines) of
                [{LineId, LinePid, RoleNum, BossList} | Rest] when RoleNum < MaxRoleNum ->
                    LinesN = [{LineId, LinePid, RoleNum + 1, BossList} | Rest],
                    BossFieldN = BossField#boss_field{lines = LinesN},
                    {LineId, BossFieldN};
                _SortedLines ->
                    BossFieldN = BossField#boss_field{is_full = true},
                    {0, BossFieldN}
            end
    end;
get_line(#boss_field{lines = Lines, role_lmt = {_BusyRoleNum, MaxRoleNum}} = BossField, ReqLine) ->
    case lists:keyfind(ReqLine, 1, Lines) of
        {ReqLine, ReqLinePid, RoleNum, BossList} when RoleNum < MaxRoleNum ->
            LinesN = lists:keystore(ReqLine, 1, Lines, {ReqLine, ReqLinePid, RoleNum+1, BossList}),
            BossFieldN = BossField#boss_field{lines = LinesN},
            {ReqLine, BossFieldN};
        _ ->
            failed
    end;
get_line(_BossField, _ReqLine) ->
    ?ERROR("Illegal enter world boss field request, no such field !"),
    failed.

ranking(BossFields, RoleGuilds, GuildNames) ->
    RankFun = fun(BossField) ->
        #boss_field{lines = Lines, harm = Harm} = BossField,
        UpdateLineFun = fun
            ({LineId, LinePid, RoleNum, BossList}) when RoleNum > 0 ->
                % 场景内有玩家
                {LineId, BossHarms} = lists:keyfind(LineId, 1, Harm),
                BossListN = [
                    begin
                        BossId = element(1, Boss),
                        BossHarm = lists:keyfind(BossId, #boss_harm.boss_id, BossHarms),
                        update_boss_rank(Boss, RoleGuilds, GuildNames, BossHarm)
                    end || Boss <- BossList
                ],
                {LineId, LinePid, RoleNum, BossListN};
            (Line) ->
                % 场景内没有玩家
                Line
        end,
        LinesN = lists:map(UpdateLineFun, Lines),
        bcast_wb_guild_rank(LinesN),
        BossField#boss_field{lines = LinesN}
    end,
    lists:map(RankFun, BossFields).

% 结算
settle_up(BossFields, RoleGuilds, GuildNames, WorldLv) ->
    SettleFieldFun = fun(BossField, {AccBossDatas, AccRoleContrib}) ->
        #boss_field{lines = Lines, harm = Harm, recover = Recover} = BossField,
        SettleLineFun = fun({LineId, _LinePid, _RoleNum, BossList}, {TmpBossDatas, TmpRoleContrib}) ->
            {LineId, BossHarms} = lists:keyfind(LineId, 1, Harm),
            {LineId, RecoverMap} = lists:keyfind(LineId, 1, Recover),
            TmpRoleContribN = calc_contribute(BossHarms, RecoverMap, TmpRoleContrib),
            NewBossData = [
                begin
                    GuildHarmList = case IsDead of
                        true ->
                            GHarmList;
                        false ->
                            BossHarm = lists:keyfind(BossId, #boss_harm.boss_id, BossHarms),
                            BossN = update_boss_rank(Boss, RoleGuilds, GuildNames, BossHarm),
                            element(5, BossN)
                    end,
                    SortFun = fun({_GId1, _GName1, GHarm1}, {_GId2, _GName2, GHarm2}) -> GHarm1 >= GHarm2 end,
                    GuildHarmRank = lists:sort(SortFun, GuildHarmList),
                    HarmRate = conf_world_boss_level:get_harm_rate(BossId, WorldLv),
                    GuildHarmPercentRank = [
                        begin
                            GuildHarmPercent = ?iif(GuildHarmHp > 0, max(1, (GuildHarmHp * 100 div HpLim)), 0),
                            GuildHarmScore = HarmRate * GuildHarmHp,
                            {GuildId, GuildName, GuildHarmPercent, GuildHarmScore}
                        end || {GuildId, GuildName, GuildHarmHp} <- GuildHarmRank
                    ],
                    % case IsDead of
                    %     true ->
                    %         #mon{name = BossName} = conf_mon:get(BossId),
                    %         [{_OwnerGuildId, OwnerGuildName, _, _} | _] = GuildHarmPercentRank,
                    %         svr_rumor:publish(world, ?RUMOR_WORLD_BOSS_KILL_OWNER, [OwnerGuildName, BossName]);
                    %     false ->
                    %         skip
                    % end,
                    {BossId, IsDead, GuildHarmPercentRank}
                end || {BossId, IsDead, _TotalHarm, HpLim, GHarmList} = Boss <- BossList
            ],
            TmpBossDatasN = NewBossData ++ TmpBossDatas,
            {TmpBossDatasN, TmpRoleContribN}
        end,
        lists:foldl(SettleLineFun, {AccBossDatas, AccRoleContrib}, Lines)
    end,
    {BossSettleDataList, RoleContribMap} = lists:foldl(SettleFieldFun, {[], #{}}, BossFields),
    RoleContribListByGuild = seperate_by_guild(RoleGuilds, RoleContribMap),
    {BossSettleDataList, RoleContribListByGuild}.

do_summon_boss({_LineId, LinePid, _RoleNum, _}, WorldLv, BossIds, BossPosList) ->
    GenBossFun = fun(BossId, XY) ->
        BossAttr = conf_world_boss_level:get_boss_attr(BossId, WorldLv),
        HpLim = element(#bt_attr.hp_lim, BossAttr),
        lib_scene_api:create_mon(BossId, LinePid, [{xy, XY}, {attr, BossAttr}]),
        {BossId, false, 0, HpLim, []}
    end,
    BossList = lists:zipwith(GenBossFun, BossIds, BossPosList),
    BossHarms = [gen_boss_harm(BossId, WorldLv) || BossId <- BossIds],
    {BossList, BossHarms}.

summon_boss_on_field(BossField, WorldLv) ->
    #boss_field{field_id = FieldId, lines = Lines} = BossField,
    #{boss_list := OrderBossIds, born_pos := BornPosList} = conf_world_boss_field:get_field(FieldId),
    Recover = [{element(1, Line), #{}} || Line <- Lines],
    SummonFun = fun(Line, {AccMonSeq, AccLines, AccBossHarms}) ->
        BossIds = util:list_disorder(OrderBossIds),
        {BossList, BossHarms} = do_summon_boss(Line, WorldLv, BossIds, BornPosList),
        LineN = setelement(4, Line, BossList),
        lib_world_boss:bcast_wb_activity_data(BossIds, LineN),
        AccMonSeqN = [{element(1, Line), BossIds} | AccMonSeq],
        AccBossHarmsN = [{element(1, Line), BossHarms} | AccBossHarms],
        {AccMonSeqN, [LineN | AccLines], AccBossHarmsN}
    end,
    {BossSeqList, LinesN, Harm} = lists:foldl(SummonFun, {[], [], []}, Lines),
    BossField#boss_field{boss_seq = BossSeqList, lines = LinesN, harm = Harm, recover = Recover}.


% boss未死亡
update_boss_rank(Boss, RoleGuilds, GuildNames, BossHarm) when not element(2, Boss) ->
    SumHarmFun = fun(RoleId, Harm, GuildHarmDict) ->
        GuildId = maps:get(RoleId, RoleGuilds),
        dict:update_counter(GuildId, Harm, GuildHarmDict)
    end,
    GuildHarmDict = maps:fold(SumHarmFun, dict:new(), BossHarm#boss_harm.harm_map),

    MapNameFun = fun(GuildId, Harm, AccList) ->
        GuildName = maps:get(GuildId, GuildNames),
        [{GuildId, GuildName, Harm} | AccList]
    end,
    GuildHarmList = dict:fold(MapNameFun, [], GuildHarmDict),
    {BossId, IsDead, _, HpLim, _} = Boss,
    {BossId, IsDead, BossHarm#boss_harm.acc_harm, HpLim, GuildHarmList};
% boss已死亡
update_boss_rank(Boss, _GuildNames, _RoleGuilds, _BossHarm) ->
    Boss.

% 开启掷骰子
send_dice_reward(LinePid, BossId, WorldLv) ->
    RoleIds = svr_scene_agent:apply_call(LinePid, lib_scene_agent, get_scene_roler_ids, []),
    Callback = fun(Dice) -> dice_reward_callback(BossId, WorldLv, Dice) end,
    svr_dice:create_dice(RoleIds, ?WORLD_BOSS_DICE_VALID_TIME, Callback),
    ok.

% 发送掷骰子奖励
dice_reward_callback(BossId, WorldLv, Dice) ->
    #dice{best = {Winner, WinnerName, _}} = Dice,
    #mon{name = BossName} = conf_mon:get(BossId),
    DiceDrop = conf_world_boss_level:get_dice_drop(BossId, WorldLv),
    Fun = fun(Title, Content) -> {Title, io_lib:format(Content, [BossName])} end,
    Winner > 0 andalso begin
        RewardGoods = lib_drop_base:get_drop_goods(DiceDrop),
        svr_mail:sys2p(Winner, ?WORLD_BOSS_DICE_MAIL, Fun, RewardGoods, ?OPT_WORLD_BOSS_DICE),
        GoodsName = lib_role_assets:format_items(RewardGoods),
        svr_rumor:publish(world, ?RUMOR_WORLD_BOSS_DICE, [WinnerName, BossName, GoodsName])
    end.

% 活动开启，推送活动数据给场景内的玩家
bcast_wb_activity_data(BossIds, {_LineId, LinePid, RoleNum, BossList}) when RoleNum > 0 ->
    BossSeqMsg = #get_world_boss_seq_resp{boss_ids = BossIds},
    {ok, BossSeqBin} = prot_msg:encode_msg(30910, BossSeqMsg),
    {ok, RankBin} = make_wb_guild_rank_bin(BossList),
    Bin = <<BossSeqBin/binary, RankBin/binary>>,
    lib_scene_api:send_to_scene(LinePid, Bin);
bcast_wb_activity_data(_BossSeq, _Line) ->
    ok.

bcast_wb_guild_rank([{_LineId, LinePid, RoleNum, BossList} | Rest]) when RoleNum > 0 ->
    {ok, Bin} = make_wb_guild_rank_bin(BossList),
    lib_scene_api:send_to_scene(LinePid, Bin),
    bcast_wb_guild_rank(Rest);
bcast_wb_guild_rank([_Line | Rest]) ->
    bcast_wb_guild_rank(Rest);
bcast_wb_guild_rank([]) ->
    ok.


%% Privates ---------------------------------------------
gen_scene_seq([{SceneId, Lines} | Rest], AccExtraSceneLines, AccSeq) when Lines > 1 ->
    AccExtraSceneLinesN = [{SceneId, Lines-1} | AccExtraSceneLines],
    gen_scene_seq(Rest, AccExtraSceneLinesN, [SceneId | AccSeq]);
gen_scene_seq([{SceneId, _Lines} | Rest], AccExtraSceneLines, AccSeq) ->
    gen_scene_seq(Rest, AccExtraSceneLines, [SceneId | AccSeq]);
gen_scene_seq([], AccExtraSceneLines, AccSeq) when AccExtraSceneLines =/= [] ->
    ExtraSceneLines = lists:keysort(1, AccExtraSceneLines),
    gen_scene_seq(ExtraSceneLines, [], AccSeq);
gen_scene_seq([], [], AccSeq) ->
    lists:reverse(AccSeq).

% 计算玩家贡献
% @spec calc_contribute(BossHarms, RecoverMap, RoleContribMap) -> RoleContribMapN.
% RecoverMap = RoleContribMap = RoleContribMapN :: #{ RoleId => Num }
% BossHarms                                     :: [#boss_harm{}]
% RoleId = Num                                  :: integer()
calc_contribute(BossHarms, RecoverMap, RoleContribMap) ->
    HarmMapList = [{1, HarmMap} || #boss_harm{harm_map = HarmMap} <- BossHarms],
    SumMapFun = fun({ScoreRate, ScoreMap}, AccContribMap) ->
        SumScoreFun = fun(RoleId, Score, TmpContribMap) ->
            Contribute = maps:get(RoleId, TmpContribMap, 0),
            ContributeN = Score * ScoreRate + Contribute,
            maps:put(RoleId, ContributeN, TmpContribMap)
        end,
        maps:fold(SumScoreFun, AccContribMap, ScoreMap)
    end,
    lists:foldl(SumMapFun, RoleContribMap, [{1, RecoverMap} | HarmMapList]).

% 按帮派将贡献分组
seperate_by_guild(RoleGuilds, RoleContribMap) ->
    SepFun = fun(RoleId, Contrib, AccContribList) ->
        GuildId = maps:get(RoleId, RoleGuilds),
        case lists:keytake(GuildId, 1, AccContribList) of
            {value, {GuildId, RoleContribs}, Rest} ->
                [{GuildId, [{RoleId, Contrib} | RoleContribs]} | Rest];
            false ->
                [{GuildId, [{RoleId, Contrib}]} | AccContribList]
        end
    end,
    maps:fold(SepFun, [], RoleContribMap).

make_wb_guild_rank_bin(BossList) ->
    BossRankList = [
        #wb_guild_rank{
            boss_id = BossId, total_harm = TotalHarm,
            boss_hp_lmt = HpLim, rank_list = RankList
        }
        || {BossId, _IsDead, TotalHarm, HpLim, RankList} <- BossList
    ],
    Msg = #notify_wb_guild_ranks{boss_rank_list = BossRankList},
    prot_msg:encode_msg(30908, Msg).

gen_boss_harm(BossId, WorldLv) ->
    #bt_attr{hp_lim = HpLim} = conf_world_boss_level:get_boss_attr(BossId, WorldLv),
    #boss_harm{
        boss_id = BossId,
        dice_harm1 = HpLim * 40 div 100,
        dice_harm2 = HpLim * 70 div 100
    }.
