%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂战斗
%%% @end
%%% Created : 13. 十一月 2018 19:29
%%%-------------------------------------------------------------------
-module(lib_jousts_hall_battle).

-include("role.hrl").
-include("title.hrl").
-include("op_type.hrl").
-include("jousts_hall.hrl").
-include("scene_objs.hrl").
-include("mask.hrl").
-include("proto/prot_517.hrl").
-include("battle.hrl").

%% API
-export([
    init/1,
    info/3,
    enter/3,
    leave/3,
    prapare/4,
    loop/2,
    poison_begin/0,
    poison_end/1,
    enter_next_war/1,
    mon_die/2,
    role_die/3,
    get_rank/3,
    get_score/2,
    team_changed/2
]).

-export([
    boss_die/2,
    finish/1,
    boss_hurt/4
]).
%% ==========================data=========================

%% @doc 获取所有玩家数据 dict
get_all_role_data() ->
    case erlang:get(all_role_data) of
        undefined -> dict:new();
        V -> V
    end.

set_all_role_data(Dict) ->
    erlang:put(all_role_data, Dict).

%% @doc 获取玩家数据 #{}
get_role_data(RoleID) ->
    Dict = get_all_role_data(),
    case dict:find(RoleID, Dict) of
        {ok, V} -> V;
        _ -> ?jousts_l_role_data#{id => RoleID}
    end.

%% @doc 设置玩家数据
set_role_data(RoleID, RoleData) ->
    Dict = get_all_role_data(),
    NewDict = dict:store(RoleID, RoleData, Dict),
    set_all_role_data(NewDict).

%% @doc 删除玩家数据
remove_role_data(RoleID) ->
    Dict = get_all_role_data(),
    NewDict = dict:erase(RoleID, Dict),
    set_all_role_data(NewDict).

%% ================================API==========================
init([SceneID, WorldLv]) ->
    WarID = conf_jousts_hall_war:get_scene_war(SceneID),
    #jousts_b{scene_id = SceneID, world_lv = WorldLv, war_id = WarID}.

%% 查看信息
info(RoleID, RoleSid, State) ->
    #jousts_b{war_id = WarID, score_rank = ScoreRank, boss_hp = BossHp} = State,
    case WarID =< ?ROUND_THREE of
        true ->
            ScoreRankN = ?iif(ScoreRank =:= [], make_score_rank(), ScoreRank),
            TargetRank = get_target_rank(RoleID, ScoreRankN),
            #{score := Score} = get_role_data(RoleID),
            Rec = #sc_jousts_hall_battle_info{score = Score, target_rank = TargetRank},
            {ok, Bin} = prot_msg:encode_msg(51712, Rec),
            lib_role_send:send_to_sid(RoleSid, Bin);
        _ ->
            Rec = #sc_jousts_hall_boss_info{boss_hp = BossHp, hurt_rank = []},
            {ok, Bin} = prot_msg:encode_msg(51713, Rec),
            lib_role_send:send_to_sid(RoleSid, Bin)
    end.

%% 获得积分
get_score(RoleID, RoleSid) ->
    RoleData = get_role_data(RoleID),
    #{score := Score} = RoleData,
    Rec = #sc_jousts_hall_score{score = Score},
    {ok, Bin} = prot_msg:encode_msg(51718, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 玩家被传入战场
enter(RoleID, RoleData, State) ->
    #jousts_b{role_sets = RoleSets} = State,
    #{score := Score} = RoleData,
    ScoreN = max(40, Score),
    RoleDataN = RoleData#{score => ScoreN},
    set_role_data(RoleID, RoleDataN),
    NewRoleSets = sets:add_element(RoleID, RoleSets),
    State#jousts_b{role_sets = NewRoleSets}.

%% 离开战斗场景or下线
leave(RoleID, Type, State) ->
    #jousts_b{role_sets = RoleSets, world_lv = WorldLv} = State,
    NewRoleSets = sets:del_element(RoleID, RoleSets),
    #{score := Score} = get_role_data(RoleID),
    #{score_reward := Rewards} = conf_jousts_hall:get(WorldLv),
    Reward = util:get_zone_config(Rewards, Score),
    svr_mail:sys2p(RoleID, 1401, [Score], Reward, ?OPT_JOUSTS_HALL),
    case Type =:= 1 of
        true ->
            svr_jousts_hall_lounge:die_enter(RoleID, Score),
            #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
            {X, Y} = lib_scene_api:get_scene_born_pos(ForyerScene),
            lib_scene_api:change_scene_async(RoleID, ForyerScene, 0, X, Y);
        _ ->
            skip
    end,
    State#jousts_b{role_sets = NewRoleSets}.

%% 获取排行榜
get_rank(RoleID, RoleSid, State) ->
    #jousts_b{score_rank = ScoreRank} = State,
    ScoreRankN = ?iif(ScoreRank =:= [], make_score_rank(), ScoreRank),
    TargetRank = get_target_rank(RoleID, ScoreRankN),
    Rec = #sc_jousts_hall_rank{score_rank = ScoreRankN, target_rank = TargetRank},
    {ok, Bin} = prot_msg:encode_msg(51715, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 准备阶段开始
prapare(WarID, Stage, StageEndTime, State) ->
    #jousts_b{scene_id = SceneID, role_sets = RoleSets, loop_times = LoopTimes} = State,
    LinePid = svr_scene_mgr:get_line_pid(SceneID, 1),
    SceneRoleNum = lib_scene_api:get_scene_roler_num(LinePid),
    IsAllIn = sets:size(RoleSets) =:= SceneRoleNum,
    case IsAllIn of
        false when LoopTimes < ?MAX_LOOP_TIMES ->
            %% 玩家还没有全部传进来，延迟1秒再检查，最多3次
            erlang:send_after(1000, self(), {prapare, WarID, Stage, StageEndTime}),
            State#jousts_b{loop_times = LoopTimes + 1};
        _ ->
            Rec = #sc_jousts_hall_stage_change{war_id = WarID, stage = Stage, end_time = StageEndTime, is_new_war = 1},
            {ok, Bin} = prot_msg:encode_msg(51716, Rec),
            lib_scene_api:send_to_scene(LinePid, Bin),
            ClientRank = make_score_rank(),
            State#jousts_b{score_rank = ClientRank}
    end.

%% 毒圈出现
poison_begin() ->
    svr_timer:register(),
    ok.

%% 毒圈消失
poison_end(State) ->
    svr_timer:unregister(),
    State#jousts_b{is_poison_open = 0}.

%% 毒圈出现后 秒循环
loop(_Now, State) ->
    #jousts_b{scene_id = SceneID} = State,
    ?iif(State#jousts_b.is_poison_open =:= 1,
        svr_scene_agent:apply_cast(SceneID, 1, lib_scene_jousts, poison_check, [SceneID]),
        skip
    ).


%% 将玩家送入下一轮战场
enter_next_war(State) ->
    #jousts_b{role_sets = RoleSets} = State,
    ScoreRank = sort_rank(),
    FilterRoleList = select_win_role_list(ScoreRank, RoleSets, []),
    svr_jousts_hall_lounge:collect_round_res(FilterRoleList),
    ok.

%% 小怪死亡
mon_die(Roles, State) ->
    #{mon_score := MonScore} = conf_jousts_hall_info:get(),
    handle_add_score(Roles, MonScore, State, 0).

%% 玩家死亡
role_die(Roles, DieRoleID, State) ->
    #jousts_b{world_lv = WorldLv, role_sets = RoleSets} = State,
    #{score := Score} = get_role_data(DieRoleID),
    #{score_reward := Rewards} = conf_jousts_hall:get(WorldLv),
    Reward = util:get_zone_config(Rewards, Score),
    svr_mail:sys2p(DieRoleID, 1401, [Score], Reward, ?OPT_JOUSTS_HALL),
    svr_jousts_hall_lounge:die_enter(DieRoleID, Score),
    remove_role_data(DieRoleID),
    NewState = ?iif(Roles =/= [], handle_add_score(Roles, Score, State, 1), State#jousts_b{score_rank = make_score_rank()}),
    NewRoleSets = sets:del_element(DieRoleID, RoleSets),
    NewState#jousts_b{role_sets = NewRoleSets}.

%% 队伍变化
team_changed(RoleID, TeamID) ->
    RoleData = get_role_data(RoleID),
    NewRoleData = RoleData#{team_id => TeamID},
    set_role_data(RoleID, NewRoleData),
    ok.

%% ===========================第四轮专用============================
%% BOSS受伤
boss_hurt(GuildID, Hurt, _NewHp, State) ->
    #jousts_b{boss_hurt = BossHurt, boss_hp = InitHp, scene_id = SceneID} = State,
    OldHurt = util:prop_get_value(GuildID, BossHurt, 0),
    NewHurt = OldHurt + Hurt,
    NewBossHurt = util:prop_store(GuildID, NewHurt, BossHurt),
    SortFun = fun({_, V1}, {_, V2}) -> V1 > V2 end,
    SortHurtList = lists:sort(SortFun, NewBossHurt),
    [{GuildID, GuildHurt} | _] = SortHurtList,
    WinGuildID = ?iif(GuildHurt >= InitHp * 0.2, GuildID, 0),
    board_boss_hurt(NewBossHurt, InitHp, SceneID, false),
    State#jousts_b{boss_hurt = SortHurtList, win_guild_id = WinGuildID}.

%% BOSS提前死亡
boss_die(KillerRole, State) ->
    #jousts_b{world_lv = WorldLv, role_sets = RoleSets, boss_hurt = HarmList, win_guild_id = WinGuildID, scene_id = SceneID, boss_hp = InitHp} = State,
    board_boss_hurt(HarmList, InitHp, SceneID, true),
    #{last_hurt_reward := Reward} = conf_jousts_hall:get(WorldLv),
    KillerRole > 0 andalso svr_mail:sys2p(KillerRole, 1402, Reward, ?OPT_JOUSTS_HALL),
    KillerRole > 0 andalso svr_rumor:publish(world, 20803, [lib_cache:get_role_name(KillerRole)]),
    WinGuildID > 0 andalso to_auction(WorldLv, RoleSets, WinGuildID),
    WinGuildID > 0 andalso svr_rumor:publish(world, 20804, [lib_guild:get_guild_name(WinGuildID)]),
    erlang:put({?MODULE, boss_die}, 1),
    settle_up(RoleSets, WorldLv),
    State#jousts_b{win_guild_id = 0, role_sets = sets:new(), score_rank = [], boss_hurt = []}.

%% 自然结束
finish(State) ->
    #jousts_b{world_lv = WorldLv, role_sets = RoleSets, win_guild_id = WinGuildID} = State,
    case erlang:get({?MODULE, boss_die}) of
        1 ->
            State;
        _ ->
            WinGuildID > 0 andalso to_auction(WorldLv, RoleSets, WinGuildID),
            WinGuildID > 0 andalso svr_rumor:publish(world, 20804, [lib_guild:get_guild_name(WinGuildID)]),
            erlang:put({?MODULE, boss_die}, 1),
            settle_up(RoleSets, WorldLv),
            State#jousts_b{win_guild_id = 0, role_sets = sets:new(), score_rank = []}
    end.

%% 结算
settle_up(RoleSets, WorldLv) ->
    RoleList = sets:to_list(RoleSets),
    #{score_reward := Rewards} = conf_jousts_hall:get(WorldLv),
    #{foyer_scene := SceneID} = conf_jousts_hall_info:get(),
    {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
    lists:foreach(fun(RoleID) ->
        #{score := Score} = get_role_data(RoleID),
        Reward = util:get_zone_config(Rewards, Score),
        svr_mail:sys2p(RoleID, 1401, [Score], Reward, ?OPT_JOUSTS_HALL),
        svr_jousts_hall_lounge:die_enter(RoleID, Score),
        lib_scene_api:change_scene_async(RoleID, SceneID, 0, X, Y, [{full_hpmp, 0}])
    end, RoleList).
%% ============================private=============================
%% 筛选出进入下一轮玩家
select_win_role_list([], _, List) -> List;
select_win_role_list([RoleData | T], RoleSets, List) ->
    #{id := RoleID} = RoleData,
    IsMax = length(List) =:= 50,
    case sets:is_element(RoleID, RoleSets) of
        true when IsMax ->
            List;
        true ->
            select_win_role_list(T, RoleSets, [{RoleID, RoleData} | List]);
        _ ->
            select_win_role_list(T, RoleSets, List)
    end.

%% 处理杀怪or杀人积分变化
handle_add_score(Roles, TotalScore, State, AddKillRole) ->
    AddScore = erlang:floor(TotalScore / length(Roles)),
    #jousts_b{scene_id = SceneID} = State,
    LineID = 1,
    lists:foreach(fun(RoleID) ->
        RoleData = get_role_data(RoleID),
        #{score := OldScore, kill_role := OldKillRole} = RoleData,
        NewScore = OldScore + AddScore,
        %% 积分变化处理
        ScoreRec = #sc_jousts_hall_score_change{score = NewScore},
        {ok, ScoreBin} = prot_msg:encode_msg(51719, ScoreRec),
        lib_scene_api:send_to_role_area_scene(SceneID, LineID, RoleID, ScoreBin),

        NewKillRole = OldKillRole + AddKillRole,
        NewRoleData = RoleData#{score => NewScore, kill_role => NewKillRole, time => time:unixtime()},

        lib_scene_api:update_header(SceneID, LineID, RoleID, ?HEADER(?TITLE_ID_JOUSTS, NewScore)),
        set_role_data(RoleID, NewRoleData)
    end, Roles),
    ClientRank = make_score_rank(),
    lists:foreach(fun({RoleRank, RoleID, _, _, _, RoleScore, _}) ->
        Rec = #sc_jousts_hall_battle_info{target_rank = RoleRank, score = RoleScore},
        {ok, Bin} = prot_msg:encode_msg(51712, Rec),
        lib_role_send:send_to_role(RoleID, Bin)
    end, ClientRank),
    State#jousts_b{score_rank = ClientRank}.

make_score_rank() ->
    SortScoreRank = sort_rank(),
    make_client_sort_rank(SortScoreRank).

%% @doc 排序
sort_rank() ->
    List = dict:to_list(get_all_role_data()),
    ListN = [RoleData || {_, RoleData} <- List],
    sort_rank(ListN).
sort_rank(List) ->
    Fun = fun(A, B) -> compare_rank(A, B) end,
    lists:sort(Fun, List).

compare_rank(RankA, RankB) ->
    #{time := TimeA, score := ScoreA} = RankA,
    #{time := TimeB, score := ScoreB} = RankB,
    cmp([{ScoreA, ScoreB}, {TimeB, TimeA}]).

cmp([]) ->
    true;
cmp([{Ka, Kb} | T]) ->
    if
        Ka > Kb -> true;
        Ka < Kb -> false;
        true -> cmp(T)
    end.

%% 生成客户端协议数据
make_client_sort_rank(List) ->
    assign_rank(List, [], 1).

assign_rank([], Acc, _Rank) ->
    lists:reverse(Acc);
assign_rank([RoleData | T], Acc, Rank) ->
    #{id := RoleID, career := Career, score := Score, guild_name := GuildName, kill_role := KillRole} = RoleData,
    RoleName = lib_cache:get_role_name(RoleID),
    NewAcc = [{Rank, RoleID, Career, RoleName, GuildName, Score, KillRole} | Acc],
    assign_rank(T, NewAcc, Rank + 1).

get_target_rank(RoleID, Data) ->
    case lists:keyfind(RoleID, 2, Data) of
        false ->
            0;
        Info ->
            element(1, Info)
    end.

%% 生成BOSS伤害排行榜,未到百分之20不上榜
board_boss_hurt(HarmList, InitHp, SceneID, Instance) ->
    Fun =
        fun() ->
            ClientHurtRank = make_hurt_rank(HarmList, InitHp),
            Rec = #sc_jousts_hall_boss_info{hurt_rank = ClientHurtRank, boss_hp = 0},
            {ok, Bin} = prot_msg:encode_msg(51713, Rec),
            lib_scene_api:send_to_scene(SceneID, 1, Bin)
        end,
    util:action_limit({?MODULE, boss}, 1, Fun, Instance).

make_hurt_rank(HarmList, InitHp) ->
    make_hurt_rank(HarmList, InitHp, [], 1).

make_hurt_rank([], _, List, _) -> lists:reverse(List);
make_hurt_rank([{GuildID, Hurt} | T], InitHp, List, Rank) ->
    GuildName = lib_guild:get_guild_name(GuildID),
    NewList = [{Rank, GuildID, GuildName, erlang:floor(Hurt / InitHp * 10000)} | List],
    make_hurt_rank(T, InitHp, NewList, Rank + 1).

%% 发送给拍卖行
to_auction(WorldLv, RoleSets, HarmList) when is_list(HarmList) ->
    [{GuildID, _} | _] = HarmList,
    to_auction(WorldLv, RoleSets, GuildID);
to_auction(WorldLv, RoleSets, GuildID) ->
    #{auction_reward := ItemInfo} = conf_jousts_hall:get(WorldLv),
    AuctionItems = lists:foldl(fun({ItemID, List}, Acc) ->
        {ItemNum, _} = util:rand_by_weight(List, 2),
        lists:duplicate(ItemNum, ItemID) ++ Acc
    end, [], ItemInfo),
    Roles = calc_guild_role_bouns(GuildID, RoleSets),
    ?iif(AuctionItems =/= [], lib_auction_util:jousts_auction(GuildID, AuctionItems, Roles), skip).

calc_guild_role_bouns(WinGuildID, RoleSets) when is_integer(WinGuildID) ->
    AllRoleData = get_all_role_data(),
    WinRoleList =
        lists:foldl(fun({_, RoleData}, Acc) ->
            #{id := RoleID, guild_id := GuildID, score := Score} = RoleData,
            case sets:is_element(RoleID, RoleSets) andalso GuildID =:= WinGuildID of
                true ->
                    [{RoleID, Score} | Acc];
                _ ->
                    Acc
            end
        end, [], dict:to_list(AllRoleData)),
    SortFun = fun({_, V1}, {_, V2}) -> V1 > V2 end,
    SortRoleList = lists:sort(SortFun, WinRoleList),
    calc_guild_role_bouns(SortRoleList, 1, []).

calc_guild_role_bouns([], _, List) -> List;
calc_guild_role_bouns([{RoleID, _} | T], Rank, List) ->
    Ratio = conf_jousts_hall_bonus:get(Rank),
    NewList = [{RoleID, Ratio} | List],
    calc_guild_role_bouns(T, Rank + 1, NewList).
