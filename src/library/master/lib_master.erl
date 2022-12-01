%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_master).
-author("Ryuu").

-include("rank.hrl").
-include("guild.hrl").
-include("common.hrl").
-include("master.hrl").
-include("auction.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("proto/prot_310.hrl").

%% API
-export([
    rob/3,
    chap/2,
    info/1,
    init/0,
    loop/2,
    get_log/2,
    get_info/2,
    get_rank/2,
    register/3,
    settle_up/2,
    rob_result/4,
    chap_result/3,
    stop_activity/1,
    start_activity/1,
    remove_activity/1
]).

-export([
    rob_scene/0,
    is_ongoing/0,
    is_rob_scene/1,
    is_chap_scene/1,
    is_master_scene/1
]).

%% @doc get activity info
info(State) ->
    [
        {state, State}
    ].

%% @doc init
init() ->
    %% load info
    ?master_info#{
    }.

%% @doc start activity
start_activity(State) ->
    svr_timer:register(),
    WorldLv = util_svr:get_world_lv(),
    BossID = conf_master:get_by_lv(WorldLv),
    BossHp = lib_scene_api:get_mon_hp(BossID),
    Rumor = config:get_sys_config(master_start_rumor),
    svr_rumor:publish(world, Rumor),
    State#{
        boss_id => BossID, init_hp => BossHp, boss_hp => BossHp, hp_pert => 100,
        state => ?MASTER_ONGOING, world_lv => WorldLv, register => sets:new(),
        roles => dict:new(), guilds => dict:new(), rank_role => [],
        rank_guild => [], rank_cache_r => [], rank_cache_g => [],
        rank_list_g => [], rank_list_r => []
    }.

%% @doc stop activity
stop_activity(#{state := ?MASTER_ONGOING} = State) ->
    master_end(State, ?MASTER_FIN_TIMEOUT);
stop_activity(State) ->
    State.

%% @doc remove activity
remove_activity(State) ->
    settle_up(State, ?MASTER_FIN_GM).

master_end(State, EndType) ->
    erlang:send_after(20 * 1000, self(), {settle_up, EndType}),
    kick_all_role(),
    State#{state => ?MASTER_SETTLE}.

%% @doc settle up
settle_up(State0, _EndType) ->
    State = refresh_rank(State0),
    #{hp_pert := HpPert, world_lv := WorldLv, roles := Roles, rank_role := RankR,
        guilds := Guilds, rank_guild := RankG, rank_list_r := RankListR,
        rank_list_g := RankListG} = State,
    notify_boss_hp(State, HpPert),
    notify_rank(State),
    RMailID = config:get_sys_config(master_settle_mail_role),
    settle_up_roles(dict:to_list(Roles), RMailID, WorldLv, RankR),
    GMailID = config:get_sys_config(master_settle_mail_guild),
    settle_up_guilds(dict:to_list(Guilds), GMailID, WorldLv, RankG),
    svr_rank:reset_rank(?RANK_MASTER_ROLE, RankListR),
    svr_rank:reset_rank(?RANK_MASTER_GUILD, RankListG),
    kick_all_role(),
    State#{state => ?MASTER_FINISH}.

settle_up_roles([], _MailID, _WorldLv, _RankR) ->
    ok;
settle_up_roles([{_, RoleData} | T], MailID, WorldLv, RankR) ->
    #{id := RoleID, name := RoleName, score := Score} = RoleData,
    Rank = util:dict_find(RoleID, RankR, 0),
    case Rank of
        1 ->
            Rumor = config:get_sys_config(master_stop_rumor),
            svr_rumor:publish(world, Rumor, [RoleName]);
        _ ->
            ignore
    end,
    Score > 0 andalso lib_role_daily_lively:trigger_event(RoleID, 3, 1),
    case conf_master_role:get({WorldLv, Rank}) of
        #{reward := Reward} ->
            svr_mail:sys2p(RoleID, MailID, [Rank], Reward, ?OPT_MASTER_SETTLE);
        _ ->
            ignore
    end,
    settle_up_roles(T, MailID, WorldLv, RankR).

settle_up_guilds([], _MailID, _WorldLv, _RankG) ->
    ok;
settle_up_guilds([{_, GuildData} | T], MailID, WorldLv, RankG) ->
    #{id := GuildID, roles := Roles} = GuildData,
    Rank = util:dict_find(GuildID, RankG, 0),
    IDList = proplists:get_keys(Roles),
    case conf_master_guild:get({WorldLv, Rank}) of
        #{reward := Reward} ->
            svr_mail:sys2select(IDList, MailID, [Rank], Reward, ?OPT_MASTER_SETTLE);
        _ ->
            ignore
    end,
    case conf_master_auction:get({WorldLv, Rank}) of
        #{group := Groups} ->
            Items = auction_items(Groups, []),
            Ratios = auction_bonus(Roles),
            svr_auction:auction(?AUCTION_TYPE_MASTER, ?AUCTION_SCOPE_GUILD, GuildID, Ratios, Items);
        _ ->
            ignore
    end,
    settle_up_guilds(T, MailID, WorldLv, RankG).

%% @doc loop
loop(State, Now) ->
    if
        Now rem 5 =:= 1 ->
            State1 = refresh_rank(State),
            notify_rank(State1);
        true ->
            State1 = State
    end,
    State1.

%% @doc refresh rank
refresh_rank(State) ->
    sort_role_data(State).

sort_role_data(State) ->
    #{roles := Roles, guilds := Guilds0} = State,
    %% 统计帮派数据
    Guilds1 = reset_guild_statics(Guilds0),
    Fun1 = fun(_, RoleData, {RoleAcc, GuildAcc}) ->
        #{id := RoleID, hurt := Hurt, score := Score, guild_id := GuildID} = RoleData,
        case Score > 0 of
            true -> NewRoleAcc = [{-Hurt, -Score, RoleID, RoleData} | RoleAcc];
            _ -> NewRoleAcc = RoleAcc
        end,
        case GuildID > 0 of
            true ->
                Guild = util:dict_find(GuildID, GuildAcc, ?master_guild#{id => GuildID}),
                #{hurt := GHurt, roles := GRoles, score := GScore} = Guild,
                NewGuild = Guild#{hurt => GHurt + Hurt, roles => [{RoleID, Score} | GRoles], score => GScore + Score},
                NewGuildAcc = dict:store(GuildID, NewGuild, GuildAcc);
            _ ->
                NewGuildAcc = GuildAcc
        end,
        {NewRoleAcc, NewGuildAcc}
    end,
    {RoleList, Guilds2} = dict:fold(Fun1, {[], Guilds1}, Roles),
    Fun2 = fun({_Hurt, _Score, RoleID, RoleData}, {Rank, RankCache, RankAcc, RoleRank}) ->
        #{name := RName, career := Career, guild_name := GName, score := Score, hurt := Hurt} = RoleData,
        %% 个人(ID,名字,职业,帮派,积分)
        Cache = {Rank, RoleID, RName, Career, GName, Score},
        NewRankCache = [Cache | RankCache],
        RankItem = ?rank_master_role#{
            key => RoleID, rank => Rank, name => RName, career => Career, guild_name => GName,
            score => Score, hurt => Hurt
        },
        NewRoleRank = dict:store(RoleID, Rank, RoleRank),
        {Rank + 1, NewRankCache, [RankItem | RankAcc], NewRoleRank}
    end,
    {_, CacheList0, RankList, RoleRank} = lists:foldl(Fun2, {1, [], [], dict:new()}, lists:sort(RoleList)),
    CacheList = lists:reverse(CacheList0),
    sort_guild_data(State#{
        guilds => dict:erase(0, Guilds2), rank_cache_r => CacheList, rank_list_r => RankList,
        rank_role => RoleRank
    }).

sort_guild_data(State) ->
    #{guilds := Guilds2} = State,
    Fun3 = fun(GuildID, GuildData, Acc) ->
        #{hurt := Hurt, score := Score} = GuildData,
        [{-Hurt, -Score, GuildID, GuildData} | Acc]
    end,
    GuildList = dict:fold(Fun3, [], Guilds2),
    Fun4 = fun({_Hurt, _Score, GuildID, GuildData}, {Rank, RankCache, RankAcc, RoleRank}) ->
        #{roles := Roles, score := Score, hurt := Hurt} = GuildData,
        %% 帮派(ID,名字,人数,帮主,积分)
        Guild = lib_guild:get_guild_info(GuildID),
        #guild{name = GName, chief_name = Chief} = Guild,
        RoleNum = length(Roles),
        Cache = {Rank, GuildID, GName, RoleNum, Chief, Score},
        NewRankCache = [Cache | RankCache],
        RankItem = ?rank_master_guild#{
            key => GuildID, rank => Rank, name => GName, chief => Chief,
            num => RoleNum, score => Score, hurt => Hurt
        },
        NewRoleRank = dict:store(GuildID, Rank, RoleRank),
        {Rank + 1, NewRankCache, [RankItem | RankAcc], NewRoleRank}
    end,
    {_, CacheList0, RankList, GuildRank} = lists:foldl(Fun4, {1, [], [], dict:new()}, lists:sort(GuildList)),
    CacheList = lists:reverse(CacheList0),
    State#{rank_cache_g => CacheList, rank_list_g => RankList, rank_guild => GuildRank}.

reset_guild_statics(Guilds) ->
    dict:fold(fun(GuildID, Guild, Acc) ->
        dict:store(GuildID, Guild#{hurt => 0, roles => [], score => 0}, Acc)
    end, dict:new(), Guilds).

%% @doc get info
get_info(State, RoleID) ->
    #{roles := RoleDict, state := S, hp_pert := HpPert} = State,
    RoleData = get_role_data(RoleID, RoleDict),
    #{score := Score, last_rob := LastRob, last_chap := LastChap,
        last_robbed := LastRobbed} = RoleData,
    Rec = #sc_master_info{
        score = Score, last_rob = LastRob, last_chap = LastChap,
        last_robbed = LastRobbed, state = S, hp_pert = HpPert
    },
    {ok, Bin} = prot_msg:encode_msg(31002, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc get log
get_log(State, RoleID) ->
    #{roles := RoleDict, guilds := GuildDict} = State,
    RoleData = get_role_data(RoleID, RoleDict),
    #{logs := RLogs} = RoleData,
    GuildID = lib_guild:get_role_guild_id(RoleID),
    GuildData = get_guild_data(GuildID, GuildDict),
    #{logs := GLogs} = GuildData,
    Rec = #sc_master_log{
        role = RLogs, guild = GLogs
    },
    {ok, Bin} = prot_msg:encode_msg(31004, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc get rank list
get_rank(State, RoleID) ->
    #{rank_cache_r := RankL, rank_cache_g := RankG} = State,
    Rec = #sc_master_rank{role = RankL, guild = RankG},
    {ok, Bin} = prot_msg:encode_msg(31006, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc register change notify
register(State, RoleID, Opt) ->
    #{register := RegSet} = State,
    NewRegSet = ?iif(Opt =:= 1, sets:add_element(RoleID, RegSet), sets:del_element(RoleID, RegSet)),
    Rec = #sc_master_register{opt = Opt},
    {ok, Bin} = prot_msg:encode_msg(31010, Rec),
    lib_role_send:send_to_role(RoleID, Bin),
    State#{register => NewRegSet}.

%% @doc challenge boss
chap(State, RoleInfo) ->
    #{id := RoleID} = RoleInfo,
    case catch check_chap(State, RoleInfo) of
        {ok, NewState, MonID} ->
            SceneID = chap_scene(),
            {LineID, _} = svr_scene_mgr:add_scene_line(SceneID),
            MonPos = config:get_sys_config(master_boss_born_pos),
            lib_scene_api:create_mon_async(MonID, SceneID, LineID, [{xy, MonPos}]),
            {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
            lib_scene_api:change_scene_async(RoleID, SceneID, LineID, X, Y),
            Rec = #sc_master_chap{},
            {ok, Bin} = prot_msg:encode_msg(31022, Rec),
            lib_role_send:send_to_role(RoleID, Bin),
            NewState;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code),
            State
    end.

%% @doc handle challenge result
check_chap(State, RoleInfo) ->
    #{roles := RoleDict, boss_id := MonID, hp_pert := HpPert, state := S} = State,
    S =:= ?MASTER_ONGOING orelse erlang:throw({error, ?RC_MASTER_ACTIVITY_FINISH}),
    RoleData = init_role_data(RoleInfo, RoleDict),
    #{id := RoleID, last_chap := LastChap} = RoleData,
    Now = time:unixtime(),
    ChapCD = config:get_sys_config(master_chap_cd),
    Now - LastChap > ChapCD orelse erlang:throw({error, ?RC_MASTER_CHAP_IN_CD}),
    NewData = RoleData#{last_chap => Now, hp_pert => HpPert},
    NewDict = dict:store(RoleID, NewData, RoleDict),
    NewState = State#{roles => NewDict},
    {ok, NewState, MonID}.

chap_result(State, RoleID, Hurt) ->
    #{roles := RoleDict, guilds := GuildDict, boss_hp := BossHp,
        init_hp := InitHp, hp_pert := HpPert} = State,
    RoleData = util:dict_find(RoleID, RoleDict, ?master_role#{id => RoleID}),
    #{hurt := OldHurt, score := OldScore, name := RoleName, guild_id := RGuildID,
        hp_pert := HpPert0} = RoleData,
    NewHurt = OldHurt + Hurt,
    NewBossHp = erlang:max(BossHp - Hurt, 0),
    NewBossHp =:= 0 andalso erlang:send(self(), {master_end, ?MASTER_FIN_KILL}),
    NewHpPert = hp_pert(InitHp, NewBossHp),
    HpPert =/= NewHpPert andalso notify_boss_hp(State, NewHpPert),
    ChapScore = chap_score(HpPert0, Hurt),
    NewScore = OldScore + ChapScore,
    Log = fmt_log(?MASTER_LOG_CHAP, [RoleName, ChapScore]),
    NewRoleData = add_log(RoleData#{hurt => NewHurt, score => NewScore}, Log),
    NewRoleDict = dict:store(RoleID, NewRoleData, RoleDict),
    NewGuildDict = add_scores([{RGuildID, ChapScore, Log}], ?master_guild, GuildDict),
    notify_chap_result(RoleID, NewScore, ChapScore),
    NewState = State#{
        roles => NewRoleDict, guilds => NewGuildDict, boss_hp => NewBossHp,
        hp_pert => NewHpPert
    },
    case NewBossHp =:= 0 of
        true ->
            master_end(NewState, ?MASTER_FIN_KILL);
        _ ->
            NewState
    end.

%% @doc rob role resource
rob(State, RoleInfo, TargetID) ->
    #{id := RoleID} = RoleInfo,
    case catch check_rob(State, RoleInfo, TargetID) of
        {ok, NewState, Image} ->
            SceneID = rob_scene(),
            % RoomID = svr_scene_mgr:get_line_id(SceneID),
            {RoomID, _} = svr_scene_mgr:add_scene_line(SceneID),
            lib_role:mod_info(RoleID, lib_role_master, {rob_begin, RoomID, Image}),
            NewState;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code),
            State
    end.

check_rob(State, RoleInfo, TargetID) ->
    #{roles := RoleDict, state := S} = State,
    RoleData = init_role_data(RoleInfo, RoleDict),
    TargetData = get_role_raw(TargetID, RoleDict),
    S =:= ?MASTER_ONGOING orelse erlang:throw({error, ?RC_MASTER_ACTIVITY_FINISH}),
    TargetData =/= undefined orelse erlang:throw({error, ?RC_MASTER_TARGET_NOT_EXISTS}),
    #{id := RoleID, last_rob := LastRob, guild_id := RGuildID} = RoleData,
    RoleID =/= TargetID orelse erlang:throw({error, ?RC_MASTER_CAN_NOT_ROB_SELF}),
    Now = time:unixtime(),
    RobCD = config:get_sys_config(master_rob_cd),
    Now - LastRob > RobCD orelse erlang:throw({error, ?RC_MASTER_ROB_IN_CD}),
    #{last_robbed := LastRobbed, guild_id := TGuildID} = TargetData,
    is_same_guild(RGuildID, TGuildID) andalso erlang:throw({error, ?RC_MASTER_ROB_SAME_GUILD}),
    RobbedCD = config:get_sys_config(master_rob_protect),
    Now - LastRobbed > RobbedCD orelse erlang:throw({error, ?RC_MASTER_ROB_IN_PROTECT}),
    View = lib_cache:get_role_view(TargetID),
    View =/= undefined orelse erlang:throw({error, ?RC_MASTER_NO_TARGET_DATA}),
    #{fight := TargetFight} = View,
    RoleFight = lib_cache:get_role_fight(RoleID),
    HLim = config:get_sys_config(master_rob_fight_limit),
    TargetFight >= HLim * RoleFight andalso erlang:throw({error, ?RC_MASTER_TARGET_TOO_STRONG}),
    NewRoleData = RoleData#{last_rob => Now},
    NewTargetData = TargetData#{last_robbed => Now},
    NewRoleDict = util:dict_store([{RoleID, NewRoleData}, {TargetID, NewTargetData}], RoleDict),
    NewState = State#{roles => NewRoleDict},
    {ok, NewState, View}.

%% @doc handle rob result
rob_result(State, RoleID, TargetID, Succ) ->
    #{roles := RoleDict, guilds := GuildDict} = State,
    RoleData = get_role_data(RoleID, RoleDict),
    TargetData = get_role_raw(TargetID, RoleDict),
    case TargetData =/= undefined of
        true ->
            #{score := OldRScore, name := RName, guild_id := RGuildID} = RoleData,
            #{score := OldTScore, name := TName, guild_id := TGuildID} = TargetData,
            RobScore = rob_score(Succ, OldTScore),
            NewRScore = OldRScore + RobScore,
            NewTScore = erlang:max(OldTScore - RobScore, 0),
            {Log1, Log2} = rob_logs(Succ, RName, TName, RobScore),
            NewRoleData = add_log(RoleData#{score => NewRScore}, Log1),
            NewTargetData = add_log(TargetData#{score => NewTScore}, Log2),
            NewRoleDict = util:dict_store([{RoleID, NewRoleData}, {TargetID, NewTargetData}], RoleDict),
            NewGuildDict = add_scores([{RGuildID, RobScore, Log1}, {TGuildID, -RobScore, Log2}], ?master_guild, GuildDict),
            NewState = State#{roles => NewRoleDict, guilds => NewGuildDict},
            Succ1 = ?iif(Succ, 1, 0),
            notify_rob_result(RoleID, TargetID, TName, Succ1, NewRScore, RobScore),
            notify_robbed_result(TargetID, RoleID, RName, Succ1, NewTScore, RobScore),
            NewState;
        _ ->
            State
    end.

%% -----------------------------------------------------------------------------
%% 消息
%% -----------------------------------------------------------------------------

notify_chap_result(RoleID, Score, ChapScore) ->
    Rec = #sc_master_chap_result{score = Score, chap_score = ChapScore},
    {ok, Bin} = prot_msg:encode_msg(31029, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

notify_rob_result(RoleID, TargetID, TName, Succ, Score, RobScore) ->
    Rec1 = #sc_master_rob_result{
        id = TargetID, name = TName, score = Score, rob_score = RobScore,
        succ = Succ
    },
    {ok, Bin1} = prot_msg:encode_msg(31030, Rec1),
    lib_role_send:send_to_role(RoleID, Bin1).

notify_robbed_result(TargetID, RoleID, RName, Succ, NewTScore, RobScore) ->
    Rec2 = #sc_master_notify_rob{
        id = RoleID, name = RName, score = NewTScore, robbed_score = RobScore,
        succ = Succ
    },
    {ok, Bin2} = prot_msg:encode_msg(31031, Rec2),
    lib_role_send:send_to_role(TargetID, Bin2).

notify_boss_hp(State, HpPert) ->
    Rec = #sc_master_notify_hp{hp_pert = HpPert},
    {ok, Bin} = prot_msg:encode_msg(31008, Rec),
    broadcast(State, Bin).

notify_rank(State) ->
    #{rank_cache_r := RankR, rank_cache_g := RankG} = State,
    Rec = #sc_master_notify_rank{role = RankR, guild = RankG},
    {ok, Bin} = prot_msg:encode_msg(31007, Rec),
    broadcast(State, Bin).

broadcast(State, Bin) ->
    #{register := RegSet} = State,
    lib_role_send:broadcast(sets:to_list(RegSet), Bin).

%% -----------------------------------------------------------------------------
%% 通用
%% -----------------------------------------------------------------------------

kick_all_role() ->
    RobScene = rob_scene(),
    ChapScene = chap_scene(),
    svr_scene_mgr:kick_all_role(RobScene),
    svr_scene_mgr:kick_all_role(ChapScene),
    ok.

is_ongoing() ->
    lib_activity:is_ongoing(?ACT_ID_MASTER).

is_master_scene(SceneID) ->
    SceneID =:= chap_scene() orelse
        SceneID =:= rob_scene().

is_rob_scene(SceneID) ->
    SceneID =:= rob_scene().

is_chap_scene(SceneID) ->
    SceneID =:= chap_scene() orelse
        SceneID =:= rob_scene().

chap_scene() ->
    config:get_sys_config(master_chap_scene).

rob_scene() ->
    config:get_sys_config(master_rob_scene).

is_same_guild(GuildID, GuildID) when GuildID > 0 ->
    true;
is_same_guild(_, _) ->
    false.

hp_pert(_InitHp, 0) ->
    0;
hp_pert(InitHp, BossHp) ->
    erlang:max(erlang:floor(BossHp * 100 / InitHp), 1).

chap_score(HpPert, Hurt) ->
    FixRatio = config:get_sys_config(master_chap_fix_ratio),
    HpRatios = config:get_sys_config(master_chap_hp_ratio),
    HpRatio = util:get_zone_config(HpRatios, HpPert, 0),
    erlang:floor(Hurt * FixRatio * HpRatio).

rob_score(false, _) ->
    0;
rob_score(true, Score) ->
    RobPert = config:get_sys_config(master_rob_pert),
    erlang:floor(Score * RobPert).

add_scores([], _Def, Dict) ->
    Dict;
add_scores([{0, _Score, _Log} | T], Def, Dict) ->
    add_scores(T, Def, Dict);
add_scores([{ID, Score, Log} | T], Def, Dict) ->
    Data = util:dict_find(ID, Dict, Def),
    #{score := OldScore} = Data,
    NewScore = erlang:max(OldScore + Score, 0),
    NewData = add_log(Data#{id => ID, score => NewScore}, Log),
    add_scores(T, Def, dict:store(ID, NewData, Dict)).

fmt_log(TempID, Args) ->
    case conf_master_log:get(TempID) of
        #{template := Template} ->
            util:safe_format(Template, Args);
        _ ->
            ""
    end.

rob_logs(true, RName, TName, RobScore) ->
    {fmt_log(?MASTER_LOG_ROB_SUCC, [RName, TName, RobScore]),
        fmt_log(?MASTER_LOG_ROBBED_SUCC, [TName, RName, RobScore])};
rob_logs(_, RName, TName, _RobScore) ->
    {fmt_log(?MASTER_LOG_ROB_FAIL, [RName, TName]),
        fmt_log(?MASTER_LOG_ROBBED_FAIL, [TName, RName])}.

add_log(RoleData, Log) ->
    #{logs := Logs} = RoleData,
    NewLogs = lists:sublist([Log | Logs], 1, ?MASTER_LOG_NUM),
    RoleData#{logs => NewLogs}.

auction_items([], Acc) ->
    Acc;
auction_items([{ItemID, Ratios} | T], Acc) ->
    {Num, _} = util:rand_by_weight(Ratios, 2),
    case Num of
        0 -> NewAcc = Acc;
        _ -> NewAcc = lists:duplicate(Num, ItemID) ++ Acc
    end,
    auction_items(T, NewAcc).

auction_bonus(RoleList) ->
    SortList = lists:reverse(lists:sort([{Score, RoleID} || {RoleID, Score} <- RoleList])),
    SortRole = [RoleID || {_, RoleID} <- SortList],
    auction_bonus(SortRole, 1, []).

auction_bonus([], _Rank, Acc) ->
    Acc;
auction_bonus([RoleID | T], Rank, Acc) ->
    Ratio = conf_master_bonus:get(Rank),
    auction_bonus(T, Rank + 1, [{RoleID, Ratio} | Acc]).

%% -----------------------------------------------------------------------------

init_role_data(InitInfo, RoleDict) ->
    #{id := RoleID} = InitInfo,
    RoleData = get_role_data(RoleID, RoleDict),
    maps:merge(RoleData, InitInfo).

get_role_data(RoleID, RoleDict) ->
    case get_role_raw(RoleID, RoleDict) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?master_role#{id => RoleID}
    end.

get_role_raw(RoleID, RoleDict) ->
    util:dict_find(RoleID, RoleDict).

get_guild_data(GuildID, GuildDict) ->
    case get_role_raw(GuildID, GuildDict) of
        GuildData when is_map(GuildData) ->
            GuildData;
        _ ->
            ?master_guild#{id => GuildID}
    end.
