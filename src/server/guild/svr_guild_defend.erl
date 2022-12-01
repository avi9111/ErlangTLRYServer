%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派守卫战
%%% @end
%%% Created : 24. 十月 2018 16:25
%%%-------------------------------------------------------------------
-module(svr_guild_defend).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("guild_defend.hrl").
-include("guild.hrl").
-include("scene_objs.hrl").
-include("proto/prot_511.hrl").
-include("scene.hrl").
-include("ets_defines.hrl").

-behaviour(gen_server).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2
]).

-export([
    enter/2,
    leave/2,
    panel_info/2,
    mon_die/3,
    tripod_hurt/4,
    update_harm/4,
    update_cure/4,
    score_rank/2,
    tripod_mon_num/2,
    get_stat/1
]).

-export([
    start_activity/1,
    stop_activity/1,
    prepare_activity/1,
    p/1,
    cast/2,
    call/2
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

%%%===================================================================
%%% API
%%%===================================================================

start_link(GuildID) ->
    RegName = reg_name(GuildID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [GuildID], []).


prepare_activity(Activity) ->
    GuildIDList = lib_guild:select_open_guild_defend(),
    #{scene_id := SceneID} = conf_guild_defend:get(),
    [begin
        svr_scene_mgr:add_scene_line(SceneID, GuildID),
        sup_guild_defend:start_child(GuildID)
    end || GuildID <- GuildIDList],
    erlang:spawn(
        fun() ->
            timer:sleep(3000),
            sup_guild_defend:info_all({prepare_activity, Activity})
        end),
    ok.

%% @doc 开启活动
start_activity(_Activity) ->
    sup_guild_defend:info_all(start_activity),
    ok.


%% @doc 结束活动
stop_activity(_Activity) ->
    #{scene_id := SceneID} = conf_guild_defend:get(),
    case ets:lookup(?ETS_SCENE_MGR, SceneID) of
        [#ets_scene{}] ->
            svr_scene_mgr:close_scene(SceneID);
        _ ->
            skip
    end,
    sup_guild_defend:info_all(stop_activity),
    sup_guild_defend:stop_all(),
    ok.

%% 进入
enter(GuildID, EnterInfo) ->
    cast(GuildID, {enter, EnterInfo}).

%% 退出
leave(GuildID, RoleID) ->
    cast(GuildID, {leave, RoleID}).

%% 面板信息
panel_info(GuildID, RoleSid) ->
    cast(GuildID, {panel_info, RoleSid}).

%% 鼎受攻击
tripod_hurt(40005, MID, GuildID, NewHp) ->
    IDs = conf_guild_defend_tripod:get_triopd_ids(),
    IsTripod = lists:member(MID, IDs),
    IsTripod andalso begin
        cast(GuildID, {tripod_hurt, MID, NewHp})
   end;
tripod_hurt(_, _MID, _GuildID, _NewHp) ->
    ignore.

%% 小怪或鼎死亡
mon_die(40005, MID, GuildID) ->
    IDs = conf_guild_defend_tripod:get_triopd_ids(),
    IsTripod = lists:member(MID, IDs),
    case IsTripod of
        true ->
            cast(GuildID, {tripod_die, MID});
        _ ->
            cast(GuildID, {mon_die, MID})
    end;
mon_die(_, _MID, _GuildID) ->
    ignore.

%% 更新伤害
update_harm(RoleID, SceneID, GuildID, Harm) ->
    case lib_role_guild_defend:is_activity_scene(SceneID) of
        true ->
            cast(GuildID, {update_harm, RoleID, Harm});
        _ ->
            skip
    end.

%% 更新治疗
update_cure(RoleID, SceneID, GuildID, Recover) ->
    case lib_role_guild_defend:is_activity_scene(SceneID) of
        true ->
            cast(GuildID, {update_cure, RoleID, Recover});
        _ ->
            skip
    end.

%% 积分排行
score_rank(GuildID, RoleSid) ->
    cast(GuildID, {score_rank, RoleSid}).

%% 获得状态
get_stat(GuildID) ->
    call(GuildID, get_stat).

%% @doc call
call(GuildID, Request) ->
    case p(GuildID) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(GuildID, Request) ->
    case p(GuildID) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% @doc 获取Boss Pid
p(Pid) when is_pid(Pid) ->
    Pid;
p(GuildID) ->
    RegName = reg_name(GuildID),
    dist:whereis_name(?SCOPE, RegName).

reg_name(GuildID) ->
    dist:get_local_name([?MODULE, "_", GuildID]).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([GuildID]) ->
    erlang:process_flag(trap_exit, true),
    {ok, #guild_defend{guild_id = GuildID}}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call(get_stat, _From, State) ->
    Reply = is_activity_close(State),
    {reply, Reply, State};

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({prepare_activity, Activity}, #guild_defend{guild_id = GuildID} = State) ->
    #{state := ActivityState, schedule := Schedule} = Activity,
    %% 计算下波刷新时间
    PreareTime = util:prop_get_value(ActivityState, Schedule, 0),
    NextRefresh = time:unixtime() + get_refresh_interavl() + PreareTime,
    #{scene_id := SceneID} = conf_guild_defend:get(),
    GuildLevel = lib_guild:get_guild_level(GuildID),
    IDList = conf_guild_defend_tripod:get_lv_ids(GuildLevel),
    %% 创建鼎
    {TripodMon, TripodPos} =
        lists:foldl(fun(ID, {Acc, PosAcc}) ->
            #{mon_id := MID, x := X, y := Y} = conf_guild_defend_tripod:get(GuildLevel, ID),
            Args = [{xy, {X, Y}}, {realm, ?REALM_DEENFD}],
            lib_scene_api:create_mon_async(MID, SceneID, GuildID, Args),
            InitHp = lib_scene_api:get_mon_hp(MID),
            {[{MID, InitHp, InitHp} | Acc], [{MID, X, Y} | PosAcc]}
        end, {[], []}, IDList),
    svr_rumor:publish({guild, GuildID}, 20301),
    NewState = State#guild_defend{tripod_mon = TripodMon, scene_id = SceneID, refresh_time = NextRefresh, tripod_pos = TripodPos},
    {noreply, NewState};

do_handle_cast(start_activity, State) ->
    %% 开启定时器
    Interval = get_refresh_interavl(?DEFEND_STATE_BEGIN),
    Ref = erlang:send_after(Interval * 1000, self(), {refresh, ?DEFEND_STATE_READY}),
    NewState = State#guild_defend{ref = Ref},
    {noreply, NewState};

do_handle_cast(stop_activity, #guild_defend{guild_id = GuildID, data = Data, wave = Wave, leave_mon_num = MonNum, ref = Ref} = State) ->
    util:cancel_timer(Ref),
    WorldLv = util_svr:get_world_lv(),
    RealWave = ?iif(MonNum =:= 0, Wave, max(0, Wave - 1)),
    case RealWave > 0 of
        true ->
            #{wave_reward := Reward, assets := AssetsList, funds := Funds} = conf_guild_defend_mon:get(WorldLv, RealWave),
            %% 帮派祝福加成
            Mul = lib_guild:activity_is_blessed(GuildID, ?BLESS_TYPE_DEFEND),
            AddItems = lib_drop_base:get_drop_goods(Reward),
            lists:foreach(fun(#guild_defend_role{id = RoleID, score = Score, lv = Lv}) ->
                lib_role_daily_lively:trigger_event(RoleID, 4, 1),
                {Exp, Cont} = util:get_zone_config(AssetsList, Lv),
                GetCont = Cont * Mul,
                AddAssets = [{?AST_EXP, Exp}, {?AST_CONT, GetCont}],
                svr_mail:sys2p(RoleID, 901, [?STR(Score)], AddAssets ++ AddItems, ?OPT_GUILD_DEFEND),
                ?TASK_EVENT(RoleID, {'guild_defend', RealWave})
            end, Data),
            FundsN = lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_105, Funds),
            svr_guild:add_funds(GuildID, 0, FundsN, ?OPT_GUILD_DEFEND);
        _ ->
            skip
    end,
    %% 发送到拍卖行
    to_auction(Data, RealWave, WorldLv, GuildID),
    svr_timer:unregister(),
    svr_rumor:publish({guild, GuildID}, 20304),
    {noreply, State#guild_defend{ref = undefined}};

do_handle_cast({panel_info, RoleSid}, #guild_defend{wave = Wave, refresh_time = RefreshTime, tripod_mon = TripodMon} = State) ->
    TripodInfo = [{MID, erlang:floor(Hp / InitHp) * 100} || {MID, InitHp, Hp} <- TripodMon],
    Rec = #sc_guild_defend_panel{wave = Wave, refresh_time = RefreshTime, tripod_info = TripodInfo},
    {ok, Bin} = prot_msg:encode_msg(51115, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {noreply, State};

do_handle_cast({enter, #guild_defend_role{id = RoleID} = EnterInfo}, #guild_defend{data = Data, online = Online} = State) ->
    NewData =
        case lists:keyfind(RoleID, #guild_defend_role.id, Data) of
            false ->
                [EnterInfo | Data];
            RoleData ->
                NewRoleData = RoleData#guild_defend_role{
                    career = EnterInfo#guild_defend_role.career,
                    lv = EnterInfo#guild_defend_role.lv
                },
                lists:keystore(RoleID, #guild_defend_role.id, Data, NewRoleData)
        end,
    NewOnline = sets:add_element(RoleID, Online),
    {noreply, State#guild_defend{data = NewData, online = NewOnline}};

do_handle_cast({leave, RoleID}, #guild_defend{online = Online} = State) ->
    NewOnline = sets:del_element(RoleID, Online),
    {noreply, State#guild_defend{online = NewOnline}};

do_handle_cast({refresh, ?DEFEND_STATE_READY}, #guild_defend{online = Online, ref = Ref, refresh_time = RefreshTime} = State) ->
    util:cancel_timer(Ref),
    Rec = #sc_guild_defend_publish{refresh_time = RefreshTime},
    {ok, Bin} = prot_msg:encode_msg(51111, Rec),
    notify_online(Online, Bin),
    Interval = get_refresh_interavl(?DEFEND_STATE_READY),
    NewRef = erlang:send_after(Interval * 1000, self(), {refresh, ?DEFEND_STATE_REFRESH}),
    {noreply, State#guild_defend{ref = NewRef}};

do_handle_cast({refresh, ?DEFEND_STATE_REFRESH}, #guild_defend{online = Online, ref = Ref, wave = Wave, scene_id = SceneID, guild_id = GuildID, leave_mon_num = MonNum} = State) ->
    util:cancel_timer(Ref),
    NewWave = ?iif(Wave =:= 0, 1, Wave + 1),
    %% 刷怪
    {AddMonNum, MonIDSets} = refresh_mon(NewWave, SceneID, GuildID),
    notify_cur_wave_mon_change2(AddMonNum, AddMonNum, SceneID, GuildID),
    NewMonNum = AddMonNum + MonNum,
    NextRefresh = time:unixtime() + get_refresh_interavl(),
    Rec = #sc_guild_defend_refresh{wave = NewWave, refresh_time = NextRefresh},
    {ok, Bin} = prot_msg:encode_msg(51112, Rec),
    notify_online(Online, Bin),
    #{wave := MaxWave} = conf_guild_defend:get(),
    NewRef =
        case NewWave >= MaxWave of
            false ->
                Interval = get_refresh_interavl(?DEFEND_STATE_REFRESH),
                erlang:send_after(Interval * 1000, self(), {refresh, ?DEFEND_STATE_READY});
            _ ->
                undefined
        end,
    svr_timer:register(),
    svr_rumor:publish({guild, GuildID}, 20302, [?STR(NewWave)]),
    {noreply, State#guild_defend{ref = NewRef, wave = NewWave, refresh_time = NextRefresh, leave_mon_num = NewMonNum, cur_mon_id_list = MonIDSets, cur_wave_init_num = AddMonNum, cur_wave_leave_num = AddMonNum}};

do_handle_cast({tripod_hurt, MID, NewHp}, #guild_defend{tripod_mon = TripodMon, online = Online} = State) ->
    {_, InitHp, _} =
        case lists:keyfind(MID, 1, TripodMon) of
            false ->
                InitHpN = lib_scene_api:get_mon_hp(MID),
                {MID, InitHpN, 1};
            TripodData ->
                TripodData
        end,
    Pert = erlang:floor(NewHp / InitHp * 100),
    broad_tripod_hp(MID, Pert, Online, false),
    NewTripodInfo = {MID, InitHp, NewHp},
    NewTripodMon = lists:keystore(MID, 1, TripodMon, NewTripodInfo),
    {noreply, State#guild_defend{tripod_mon = NewTripodMon}};

do_handle_cast({tripod_die, MID}, #guild_defend{tripod_mon = TripodMon, online = Online, ref = Ref, scene_id = SceneID, guild_id = GuildID} = State) ->
    {_, InitHp, _} =
        case lists:keyfind(MID, 1, TripodMon) of
            false ->
                InitHpN = lib_scene_api:get_mon_hp(MID),
                {MID, InitHpN, 1};
            TripodData ->
                TripodData
        end,
    broad_tripod_hp(MID, 0, Online, true),
    NewTripodInfo = {MID, InitHp, 0},
    NewTripodMon = lists:keystore(MID, 1, TripodMon, NewTripodInfo),
    IsAllTripodDie =
        lists:all(fun({_, _, Hp}) ->
            Hp =:= 0
        end, NewTripodMon),
    NewState =
        case IsAllTripodDie of
            true ->
                util:cancel_timer(Ref),
                lib_scene_api:clear_scene_mon(SceneID, GuildID, true),
                Rec = #sc_guild_defend_close{end_time = time:unixtime() + 10},
                {ok, Bin} = prot_msg:encode_msg(51120, Rec),
                notify_online(Online, Bin),
                svr_scene_mgr:close_line_later(SceneID, GuildID, 10000),
                State#guild_defend{refresh_time = 0, ref = undefined};
            _ ->
                State
        end,
    #mon{name = Name} = conf_mon:get(MID),
    svr_rumor:publish({guild, GuildID}, 20303, [Name]),
    {noreply, NewState#guild_defend{tripod_mon = NewTripodMon}};

do_handle_cast({mon_die, MID}, #guild_defend{leave_mon_num = MonNum, ref = Ref, online = Online, wave = Wave} = State) ->
    #{wave := MaxWave} = conf_guild_defend:get(),
    IsMaxWave = MaxWave =:= Wave,
    NewMonNum = MonNum - 1,
    NewState =
        case NewMonNum > 0 of
            true ->
                notify_cur_wave_mon_change(State, MID);
            _ when (not IsMaxWave) ->
                util:cancel_timer(Ref),
                Interval = get_refresh_interavl(?DEFEND_STATE_READY),
                NewRef = erlang:send_after(Interval * 1000, self(), {refresh, ?DEFEND_STATE_REFRESH}),
                RefreshTime = time:unixtime() + 10,
                Rec = #sc_guild_defend_publish{refresh_time = RefreshTime},
                {ok, Bin} = prot_msg:encode_msg(51111, Rec),
                notify_online(Online, Bin),
                State#guild_defend{ref = NewRef, refresh_time = RefreshTime};
            _ ->
                State
        end,
    {noreply, NewState};

do_handle_cast({update_harm, RoleID, Hurt}, #guild_defend{data = Data} = State) ->
    NewData =
        case is_activity_close(State) of
            false ->
                case lists:keyfind(RoleID, #guild_defend_role.id, Data) of
                    false ->
                        Data;
                    RoleData ->
                        #guild_defend_role{hurt = OldHurt} = RoleData,
                        NewRoleData = RoleData#guild_defend_role{hurt = OldHurt + Hurt},
                        NewRoleData2 = calc_role_score(NewRoleData),
                        update_rank(RoleID, NewRoleData2, Data)
                end;
            _ ->
                Data
        end,
    {noreply, State#guild_defend{data = NewData}};

do_handle_cast({update_cure, RoleID, Recover}, #guild_defend{data = Data} = State) ->
    NewData =
        case is_activity_close(State) of
            true ->
                case lists:keyfind(RoleID, #guild_defend_role.id, Data) of
                    false ->
                        Data;
                    RoleData ->
                        #guild_defend_role{recover = OldRecover} = RoleData,
                        NewRoleData = RoleData#guild_defend_role{recover = OldRecover + Recover},
                        NewRoleData2 = calc_role_score(NewRoleData),
                        update_rank(RoleID, NewRoleData2, Data)
                end;
            _ ->
                Data
        end,
    {noreply, State#guild_defend{data = NewData}};

do_handle_cast({score_rank, RoleSid}, #guild_defend{data = Data, wave = Wave, leave_mon_num = MonNum} = State) ->
    ClientData = make_client_sort_rank(Data),
    RealWave = ?iif(MonNum =:= 0, Wave, max(0, Wave - 1)),
    Rec = #sc_guild_defend_score{score_list = ClientData, repel_wave = RealWave},
    {ok, Bin} = prot_msg:encode_msg(51117, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {noreply, State};

do_handle_cast({loop, _Now}, #guild_defend{scene_id = SceneID, guild_id = GuildID, tripod_pos = Pos} = State) ->
    #{tripod_nearly_dist := Dist} = conf_guild_defend:get(),
    Pos =/= [] andalso svr_scene_agent:apply_cast(SceneID, GuildID, ?MODULE, tripod_mon_num, [Pos, Dist]),
    {noreply, State};

do_handle_cast(_Request, State) ->
    {noreply, State}.

%%====================private===============
%% 判断活动是否提前结束
is_activity_close(State) ->
    #{wave := MaxWave} = conf_guild_defend:get(),
    #guild_defend{leave_mon_num = MonNum, wave = Wave, tripod_mon = TripodMon} = State,
    IsAllTripodDie =
        lists:all(fun({_, _, Hp}) ->
            Hp =:= 0
        end, TripodMon),
    (Wave >= MaxWave andalso MonNum =:= 0) orelse IsAllTripodDie.

%% 计算玩家积分
calc_role_score(RoleData) ->
    #guild_defend_role{career = Career, hurt = Hurt, recover = Recover} = RoleData,
    #{hurt_ratio := HurtRatio, cure_ratio := CureRatio} = conf_guild_defend:get(),
    HRatio = util:prop_get_value(Career, HurtRatio, 1),
    RRatio = util:prop_get_value(Career, CureRatio, 1),
    Score = erlang:floor(Hurt * HRatio / 10000 + Recover * RRatio / 10000),
    RoleData#guild_defend_role{score = Score}.

notify_cur_wave_mon_change(State, MID) when is_record(State, guild_defend) ->
    #guild_defend{cur_mon_id_list = CurIDList, cur_wave_init_num = InitNum, cur_wave_leave_num = LeaveNum, scene_id = SceneID, guild_id = GuildID} = State,
    case sets:is_element(MID, CurIDList) of
        true ->
            NewLeaveNum = LeaveNum - 1,
            notify_cur_wave_mon_change2(InitNum, NewLeaveNum, SceneID, GuildID),
            State#guild_defend{cur_wave_leave_num = NewLeaveNum};
        _ ->
            State
    end.
notify_cur_wave_mon_change2(InitNum, LeaveNum, SceneID, LineID) ->
    Rec = #sc_guild_defend_cur_num{total_num = InitNum, leave_num = LeaveNum},
    {ok, Bin} = prot_msg:encode_msg(51119, Rec),
    lib_scene_api:send_to_scene(SceneID, LineID, Bin),
    ok.

%% 广播鼎的血量
%% @doc
broad_tripod_hp(MID, Pert, Online, Instance) ->
    Fun = fun() ->
        Rec = #sc_guild_defend_tripod_hurt{
            tripod_id = MID,
            hp_pert = Pert
        },
        {ok, Bin} = prot_msg:encode_msg(51113, Rec),
        notify_online(Online, Bin)
    end,
    action_limit({broad_tripod_hp, MID}, 1, Fun, Instance).


action_limit(Key, Span, Fun, Instance) ->
    Now = time:unixtime(),
    case erlang:get({action_limit, Key}) of
        Time when (is_integer(Time) andalso Now - Time < Span) andalso not Instance ->
            ignore;
        _ ->
            erlang:put({action_limit, Key}, Now),
            Fun()
    end.

%% 通知前端鼎周围怪物数量
tripod_mon_num(Pos, Dist) ->
    List =
    lists:map(fun({MID, X, Y}) ->
        MonList = lib_mon_agent:get_scene_mons_by_area(X, Y, Dist),
        {MID, length([Mon || Mon <- MonList, Mon#mon.mid =/= MID])}
    end, Pos),
    Rec = #sc_guild_defend_mon_num{tripod_mon_num = List},
    {ok, Bin} = prot_msg:encode_msg(51118, Rec),
    lib_scene_agent:send_to_local_scene(Bin),
    ok.

get_refresh_interavl() ->
    #{refresh_interval := Interval} = conf_guild_defend:get(),
    Interval.

get_refresh_interavl(Flag) when Flag =:= ?DEFEND_STATE_BEGIN orelse Flag =:= ?DEFEND_STATE_REFRESH ->
    #{refresh_interval := Interval} = conf_guild_defend:get(),
    Interval - 10;
get_refresh_interavl(_Flag) ->
    10.

%% 刷怪
refresh_mon(Wave, SceneID, GuildID) ->
    WorldLv = util_svr:get_world_lv(),
    #{mon_create := MonCreate} = conf_guild_defend_mon:get(WorldLv, Wave),
    lists:foldl(fun({X, Y, MonList}, {NumAcc2, IDAcc}) ->
        {NumAcc1, IDAcc1} =
        lists:foldl(fun({MID, Num}, {NumAcc0, IDAcc2}) ->
            MonL = lists:duplicate(Num, {MID, X, Y}),
            lib_scene_api:create_mon_async_by_group(MonL, SceneID, GuildID, [{realm, ?REALM_ATTACK}]),
            {NumAcc0 + Num, sets:add_element(MID, IDAcc2)}
        end, {0, sets:new()}, MonList),
        {NumAcc2 + NumAcc1, sets:union(IDAcc1, IDAcc)}
    end, {0, sets:new()}, MonCreate).


%% 通知在线玩家
notify_online(OnlineSets, Bin) ->
    [begin
        lib_role_send:send_to_role(RoleID, Bin)
    end || RoleID <- sets:to_list(OnlineSets)].

%% @doc 更新排行榜
update_rank(Key, Val, List) ->
    sort_rank(lists:keystore(Key, #guild_defend_role.id, List, Val)).

%% @doc 排序
sort_rank(List) ->
    Fun = fun(A, B) -> compare_rank(A, B) end,
    lists:sort(Fun, List).

compare_rank(RankA, RankB) ->
    #guild_defend_role{id = RoleIDA, score = ScoreA} = RankA,
    #guild_defend_role{id = RoleIDB, score = ScoreB} = RankB,
    cmp([{ScoreA, ScoreB}, {RoleIDB, RoleIDA}]).

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
    #guild_defend_role{id = RoleID, lv = Lv, career = Career, hurt = Hurt, recover = Recover, score = Score} = RoleData,
    RoleName = lib_cache:get_role_name(RoleID),
    NewAcc = [{Rank, RoleName, Career, Lv, Hurt, Recover, Score} | Acc],
    assign_rank(T, NewAcc, Rank + 1).

to_auction(Data, Wave, WorldLv, GuildID) ->
    ItemInfo = conf_guild_defend_auction:get(WorldLv, Wave),
    AuctionItems = lists:foldl(fun({ItemID, List}, Acc) ->
        {ItemNum, _} = util:rand_by_weight(List, 2),
        lists:duplicate(ItemNum, ItemID) ++ Acc
    end, [], ItemInfo),
    BonusRatio = config:get_sys_config(guild_defend_bonus_ratio),
    {_, Roles} = lists:foldl(fun(#guild_defend_role{id = RoleID}, {Rank, Acc}) ->
        Ratio = util:get_zone_config(BonusRatio, Rank),
        {Rank + 1, [{RoleID, Ratio} | Acc]}
    end, {1, []}, Data),
    ?iif(AuctionItems =/= [], lib_auction_util:defend_auction(GuildID, AuctionItems, Roles), skip).
