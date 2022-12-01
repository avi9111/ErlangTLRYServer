%%-------------------------------------------------------
%% @File     : lib_role_guild_carry
%% @Brief    : 帮派运镖
%% @Author   : cablsbs
%% @Date     : 2018-11-23
%%-------------------------------------------------------
-module(lib_role_guild_carry).

-include("log.hrl").
-include("role.hrl").
-include("title.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("guild_carry.hrl").
-include("guild.hrl").
-include("proto/prot_521.hrl").
-include("scene_objs.hrl").

-export([
    init/1,
    save/1,
    role_login/1,
    role_logout/1,
    be_kill/3,
    restore_carry/4,
    next_scene/1,
    timeout/1,
    handle_info/2,
    is_carrying/0
]).


-export([
    send_carry_info/1,
    book_carry/1,
    refresh_carry/2,
    start_carry/1,
    submit_carry/1,
    transfer_to_carry/1
]).


%% Apis -------------------------------------------------
init(#role_state{id = RoleId}) ->
    init_from_db(RoleId).

save(#role_state{id = RoleId}) ->
    RoleData = get_role_data(),
    save_to_db(RoleId, RoleData).

role_login(RoleState) ->
    RoleData = get_role_data(),
    LinePid = maps:get(line_pid, RoleData, undefined),
    is_pid(LinePid) andalso create_carry(RoleState, RoleData),
    ok.

role_logout(PS) ->
    RoleData = get_role_data(),
    LinePid = maps:get(line_pid, RoleData, undefined),
    delete_carry(PS#role_state.id, LinePid),
    ok.

be_kill(KillerId, KillerGuildID, RoleState) ->
    case get_role_data() of
        #{quality := Quality, line_pid := LinePid, stat := Stat} = RoleData when is_pid(LinePid) ->
            %% 击杀方帮派设置了被击杀方帮派为敌对帮派且被击杀方正在运镖才有劫镖奖励
            #role_state{guild_name = DGuildID} = RoleState,
            IsHostileGuild = lib_role_guild:is_hostile_guild(KillerGuildID, DGuildID),
            case IsHostileGuild andalso Stat =/= ?CARRY_ST_DEAD of
                true ->
                    KillerId > 0 andalso lib_role:mod_info(KillerId, ?MODULE, {'rob_reward', Quality, DGuildID}),
                    sync_carry_header(RoleState, ?HEADER(?TITLE_ID_BROKEN_CARRY, 0)),
                    set_role_data(RoleData#{stat => ?CARRY_ST_DEAD});
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

restore_carry(RoleId, PathIndex, X, Y) ->
    lib_role:mod_info(RoleId, ?MODULE, {'restore_carry', PathIndex, X, Y}).

next_scene(RoleId) ->
    lib_role:mod_info(RoleId, ?MODULE, 'next_scene').

timeout(RoleId) ->
    lib_role:mod_info(RoleId, ?MODULE, 'timeout').

% 运镖定时回存
handle_info({'restore_carry', PathIndex, X, Y}, RoleState) ->
    case get_role_data() of
        #{stat := Stat} = RoleData when Stat >= ?CARRY_ST_ING ->
            SceneId = maps:get(scene_id, RoleData),
            RoleDataN = RoleData#{x => X, y => Y, path_index => PathIndex},
            notify_carry_pos(RoleState#role_state.sid, SceneId, X, Y),
            set_role_data(RoleDataN);
        _ ->
            skip
    end,
    ok;
% 运镖切场景
handle_info('next_scene', RoleState) ->
    case get_role_data() of
        #{stat := Stat} = RoleData when Stat > 0 ->
            #{carry_line := CarryLine, scene_id := SceneId} = RoleData,
            case conf_guild_carry_scene:get_carry_scene(CarryLine, SceneId) of
                #{next_scene := NextSceneId} when NextSceneId > 0 ->
                    carry_change_scene(RoleState, RoleData, NextSceneId);
                _ ->
                    StatN = max(Stat, ?CARRY_ST_SUCCEED),
                    set_role_data(RoleData#{stat => StatN}),
                    send_carry_info(RoleState)
            end;
        _ ->
            ok
    end;
% 运镖超时失败
handle_info('timeout', RoleState) ->
    RoleData = get_role_data(),
    LinePid = maps:get(line_pid, RoleData, undefined),
    is_pid(LinePid) andalso begin
        sync_carry_header(RoleState, 0),
        set_role_data(?carry)
    end,
    send_carry_info(RoleState),
    ok;
% 劫镖成功
handle_info({'rob_reward', Quality, DGuildID}, RoleState) ->
    MaxRobTimes = conf_guild_carry_common:get(rob_times),
    DailyRob = lib_role_kv:get_counter(RoleState#role_state.id, ?KEY_DAILY_CARRY_ROB),
    #role_state{guild_id = GuildId} = RoleState,
    GuildId > 0 andalso svr_guild:add_rob_times(GuildId, DGuildID),
    if
        DailyRob < MaxRobTimes ->
            {Contrib0, DropId, Funds0} = conf_guild_carry_reward:rob_rewards(Quality),
            #role_state{id = RoleId} = RoleState,
            %% 帮派科技影响
            Contrib1 = lib_guild:guild_study_effect(GuildId, ?GUILD_STUDY_108, Contrib0),
            Funds1 = lib_guild:guild_study_effect(GuildId, ?GUILD_STUDY_108, Funds0),
            %% 劫镖次数影响
            Contrib = lib_guild:rob_times_effect(GuildId, DGuildID, Contrib1),
            Funds = lib_guild:rob_times_effect(GuildId, DGuildID, Funds1),
            GuildId > 0 andalso Funds > 0 andalso
                svr_guild:add_funds(GuildId, RoleId, Funds, ?OPT_GUILD_CARRY_ROB),
%%            Funds > 0 andalso
%%                svr_guild:add_rob(GuildId, Funds),
            AddAssets = [{?AST_CONT, Contrib}],
            RoleState1 = lib_role_assets:add_items_notify(RoleState, AddAssets, ?OPT_GUILD_CARRY_ROB),
            {RoleStateN, _} = lib_drop_api:give_drop_sync(RoleState1, DropId, ?OPT_GUILD_CARRY_ROB),
            lib_role_kv:set_kv(RoleId, ?KEY_DAILY_CARRY_ROB, DailyRob + 1),
            {ok, RoleStateN};
        true ->
            ok
    end;
handle_info(_ModInfo, _RoleState) ->
    ?ERROR("Recv unexpected ModInfo: ~p", [_ModInfo]),
    ok.


%% Apis -------------------------------------------------
% @doc 发送护送数据
send_carry_info(#role_state{id = RoleId, sid = RoleSid}) ->
    DailyCarry = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_CARRY),
    DailyRob = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_CARRY_ROB),
    DailyRefresh = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_CARRY_REFRESH),
    #{quality := Quality} = RoleData = get_role_data(),
    RespMsg = if
        Quality > 0 ->
            #{carry_line := CarryLine, scene_id := SceneId, x := X, y := Y, stat := Stat, expire_time := ExpireTime} = RoleData,
            #carry_info_resp{
                carry_times = DailyCarry, rob_times = DailyRob, line = CarryLine,
                quality = Quality, stat = Stat, expire_time = ExpireTime,
                carry_scene = SceneId, carry_x = X, carry_y = Y, refresh_times = DailyRefresh
            };
        true ->
            #carry_info_resp{carry_times = DailyCarry, rob_times = DailyRob, refresh_times = DailyRefresh}
    end,
    {ok, RespBin} = prot_msg:encode_msg(52102, RespMsg),
    lib_role_send:send_to_sid(RoleSid, RespBin),
    ok.

% @doc 接镖
book_carry(#role_state{id = RoleId, sid = RoleSid, guild_id = GuildId, level = Lv}) ->
    lib_activity:is_ongoing(?ACT_ID_GUILD_CARRY) orelse throw({error, ?RC_ACTIVITY_NOT_GOING}),
    GuildId > 0 orelse throw({error, ?RC_CARRY_JOIN_GUILD_FIRST}),
    #{level := NeedLv} = conf_activity_hall:get(11),
    Lv >= NeedLv orelse erlang:throw({error, ?RC_LEVEL_GIFT_LV_LIMIT}),
    #{quality := CurQuality} = RoleData = get_role_data(),
    CurQuality =:= 0 orelse throw({error, ?RC_CARRY_FINISH_THIS_CARRY_FIRST}),
    DailyCarry = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_CARRY),
    MaxCarryTimes = conf_guild_carry_common:get(carry_times),
    DailyCarry < MaxCarryTimes orelse throw({error, ?RC_CARRY_NO_MORE_CARRY_TIMES}),
    QualityRatio = conf_guild_carry_common:get(quality_ratio),
    {Quality, _} = util:rand_by_weight(QualityRatio, 2),
    RoleDataN = RoleData#{quality => Quality},
    set_role_data(RoleDataN),
    RefreshTimes = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_CARRY_REFRESH),
    NotifyMsg = #notify_carry{quality = Quality, refresh_times = RefreshTimes},
    {ok, NotifyBin} = prot_msg:encode_msg(52104, NotifyMsg),
    lib_role_send:send_to_sid(RoleSid, NotifyBin),
    ok.

% @doc 刷镖
refresh_carry(#role_state{id = RoleId, sid = RoleSid} = RoleState, RefreshType) ->
    lib_activity:is_ongoing(?ACT_ID_GUILD_CARRY) orelse throw({error, ?RC_ACTIVITY_NOT_GOING}),
    RoleState#role_state.guild_id > 0 orelse throw({error, ?RC_CARRY_JOIN_GUILD_FIRST}),
    #{quality := CurQuality, scene_id := SceneId} = RoleData = get_role_data(),
    CurQuality =/= 0 orelse throw({error, ?RC_CARRY_BOOK_CARRY_FIRST}),
    SceneId =:= 0 orelse throw({error, ?RC_CARRY_ALREADY_START_CARRY}),
    (CurQuality < ?QUALITY_ORANGE) orelse throw({error, ?RC_CARRY_ALREADY_MAX_QUALITY}),
    RefreshTimes = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_CARRY_REFRESH),

    {NewQuality, RoleStateN, RefreshTimesN} = case RefreshType of
        ?REFRESH_NORMAL ->
            RoleStateT = if
                RefreshTimes > 0 ->
                    RefreshBGold = conf_guild_carry_common:get(refresh_cost),
                    Cost = [{?AST_BGOLD, RefreshBGold}],
                    lib_role_assets:check_items_enough(RoleState, Cost),
                    lib_role_assets:cost_items_notify(RoleState, Cost, ?OPT_GUILD_CARRY_REFRESH);
                true ->
                    RoleState
            end,
            NewRefreshTimes = RefreshTimes + 1,
            lib_role_kv:set_kv(RoleId, ?KEY_DAILY_CARRY_REFRESH, NewRefreshTimes),
            RefreshRatio = conf_guild_carry_common:get(quality_ratio),
            RefreshRatioF = [{Q, W} || {Q, W} <- RefreshRatio, Q >= CurQuality],
            {Quality, _} = util:rand_by_weight(RefreshRatioF, 2),
            {Quality, RoleStateT, NewRefreshTimes};
        ?REFRESH_ORANGE ->
            OnekeyRefreshItem = conf_guild_carry_common:get(onekey_refresh_item),
            CostItem = [{?AST_ITEM, [{OnekeyRefreshItem, 1}]}],
            RoleStateT = case lib_role_assets:is_items_enough(RoleState, CostItem) of
                true ->
                    lib_role_assets:cost_items_notify(RoleState, CostItem, ?OPT_GUILD_CARRY_REFRESH);
                false ->
                    OnekeyRefreshBGold = conf_guild_carry_common:get(onekey_refresh_cost),
                    CostBGold = [{?AST_BGOLD, OnekeyRefreshBGold}],
                    lib_role_assets:check_items_enough(RoleState, CostBGold),
                    lib_role_assets:cost_items_notify(RoleState, CostBGold, ?OPT_GUILD_CARRY_REFRESH)
            end,
            {?QUALITY_ORANGE, RoleStateT, RefreshTimes};
        _ ->
            throw({error, ?RC_CARRY_NO_SUCH_REFRESH_TYPE})
    end,
    RoleDataN = RoleData#{quality => NewQuality},
    set_role_data(RoleDataN),
    NotifyMsg = #notify_carry{quality = NewQuality, refresh_times = RefreshTimesN},
    {ok, NotifyBin} = prot_msg:encode_msg(52104, NotifyMsg),
    lib_role_send:send_to_sid(RoleSid, NotifyBin),
    {ok, RoleStateN}.

% @doc 运镖
start_carry(#role_state{id = RoleId, role_scene = RoleScene} = RoleState) ->
    lib_activity:is_ongoing(?ACT_ID_GUILD_CARRY) orelse throw({error, ?RC_ACTIVITY_NOT_GOING}),
    DailyCarry = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_CARRY),
    MaxCarryTimes = conf_guild_carry_common:get(carry_times),
    DailyCarry < MaxCarryTimes orelse throw({error, ?RC_CARRY_NO_MORE_CARRY_TIMES}),
    RoleState#role_state.guild_id > 0 orelse throw({error, ?RC_CARRY_JOIN_GUILD_FIRST}),
    #{quality := Quality, scene_id := CSceneId} = RoleData = get_role_data(),
    Quality =/= 0 orelse throw({error, ?RC_CARRY_BOOK_CARRY_FIRST}),
    CSceneId =:= 0 orelse throw({error, ?RC_CARRY_ALREADY_START_CARRY}),
    NpcId = conf_guild_carry_common:get(carry_npc),
    check_npc_distance(RoleState#role_state.role_scene, NpcId),

    Foregift = conf_guild_carry_foregift:get(Quality, RoleState#role_state.level),
    ForegiftCost = [{?AST_COIN, Foregift}],
    lib_role_assets:check_items_enough(RoleState, ForegiftCost),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, ForegiftCost, ?OPT_GUILD_CARRY_FOREGIFT),
    LineRatio = conf_guild_carry_common:get(line_ratio),
    {CarryLine, _} = util:rand_by_weight(LineRatio, 2),
    CarryScene = conf_guild_carry_scene:get_init_scene(CarryLine),
    #{scene := SceneId, start_pos := {X, Y}} = CarryScene,
    #role_scene{line_id = LineId, line_pid = LinePid} = RoleScene,
    CarryExpire = conf_guild_carry_common:get(carry_expire),
    ExpireTime = time:unixtime() + CarryExpire,
    RoleDataN = RoleData#{
        carry_line => CarryLine, foregift => Foregift,
        stat => ?CARRY_ST_ING, scene_id => SceneId, line_id => LineId,
        line_pid => LinePid, path_index => 1,
        x => X, y => Y, expire_time => ExpireTime
    },
    set_role_data(RoleDataN),
    create_carry(RoleStateN, RoleDataN),
    sync_carry_header(RoleState, ?HEADER(?TITLE_ID_CARRY, 0)),
    lib_role_kv:set_kv(RoleId, ?KEY_DAILY_CARRY, DailyCarry + 1),
    {ok, RoleStateN}.

% @doc 交镖
submit_carry(RoleState) ->
    #{stat := Stat, expire_time := ExpireTime} = RoleData = get_role_data(),
    Stat > 0 orelse throw({error, ?RC_CARRY_NO_CARRY_TO_SUBMIT}),
    Stat > ?CARRY_ST_ING orelse throw({error, ?RC_CARRY_NOT_FINISH_CARRY}),
    case ExpireTime >= time:unixtime() of
        true ->
            RoleStateN = do_carry_settle(RoleState, RoleData),
            ?TASK_EVENT(RoleState#role_state.id, part_guild_carry),
            {ok, RoleStateN};
        false ->
            set_role_data(?carry),
            {error, ?RC_CARRY_NO_CARRY_TO_SUBMIT}
    end.


% @doc 传送到镖车所在场景
transfer_to_carry(#role_state{role_scene = RoleScene} = RoleState) ->
    CurLinePid = RoleScene#role_scene.line_pid,
    case get_role_data() of
        #{scene_id:=SceneId, line_pid:=LinePid} = RoleData when SceneId > 0 andalso LinePid =/= CurLinePid ->
            #{carry_line:=CarryLine, line_id:=LineId} = RoleData,
            #{start_pos := {X, Y}} = conf_guild_carry_scene:get_carry_scene(CarryLine, SceneId),
            lib_scene_api:change_scene(RoleState, SceneId, LineId, X, Y);
        #{scene_id:=SceneId} when SceneId > 0 ->
            {error, ?RC_CARRY_ALREADY_IN_CARRY_SCENE};
        _ ->
            {error, ?RC_CARRY_NOT_IN_CARRY}
    end.

is_carrying() ->
    case get_role_data() of
        #{stat := Stat} when Stat >= ?CARRY_ST_ING ->
            true;
        _ ->
            false
    end.

%% Privates ---------------------------------------------

get_role_data() ->
    get(?MODULE).

set_role_data(RoleData) ->
    erlang:put(?MODULE, RoleData#{updated => true}).

init_from_db(RoleId) ->
    NowTime = time:unixtime(),
    Sql = io_lib:format(?SQL_GET_CARRY_DATA, [RoleId]),
    RoleData = case db:get_row(Sql) of
        [Quality, CarryLine, SceneId, LineId, ExpireTime, PathIndex, X, Y, Stat] when Quality > 0 ->
            case SceneId > 0 of
                false ->
                    ?carry#{quality => Quality};
                true when ExpireTime > NowTime ->
                    {LineIdN, LinePid} = case svr_scene_mgr:get_line_pid(SceneId, LineId) of
                        LPid when is_pid(LPid) ->
                            {LineId, LPid};
                        _ ->
                            LineIdT = svr_scene_mgr:get_line_id(SceneId),
                            LPid = svr_scene_mgr:get_line_pid(SceneId, LineIdT),
                            {LineIdT, LPid}
                    end,
                    LinePidFix = ?iif(Stat =/= ?CARRY_ST_SUCCEED, LinePid, 0),
                    ?carry#{
                        quality => Quality, carry_line => CarryLine,
                        scene_id => SceneId, line_id => LineIdN,
                        line_pid => LinePidFix, x => X, y => Y,
                        path_index => PathIndex, stat => Stat,
                        expire_time => ExpireTime
                    };
                true ->
                    ?carry
            end;
        _ ->
            ?carry
    end,
    put(?MODULE, RoleData),
    ok.

save_to_db(RoleId, RoleData) ->
    #{
        quality := Quality, carry_line := CarryLine,
        scene_id := SceneId, line_id := LineId,
        x := X, y := Y, path_index := PathIndex,
        expire_time := ExpireTime, stat := Stat
    } = RoleData,
    Sql = io_lib:format(?SQL_SET_CARRY_DATA, [RoleId, Quality, CarryLine, SceneId, LineId, ExpireTime, PathIndex, X, Y, Stat]),
    db:execute(Sql),
    ok.

create_carry(RoleState, RoleData) ->
    send_carry_info(RoleState),
    LinePid = maps:get(line_pid, RoleData),
    #role_state{
        id = RoleId, sid = RoleSid, name = RoleName,
        guild_id = GuildId, guild_name = GuildName
    } = RoleState,
    Owner = #{
        id => RoleId, sid => RoleSid, name => RoleName,
        guild_id => GuildId, guild_name => GuildName
    },
    CreateCarryMsg = {'create_carry', RoleData, Owner, ?CARRY_TYPE_GUILD},
    svr_scene_agent:cast_scene(LinePid, CreateCarryMsg).

delete_carry(RoleId, LinePid) when is_pid(LinePid) ->
    DelCarryMsg = {'delete_carry', RoleId},
    svr_scene_agent:cast_scene(LinePid, DelCarryMsg);
delete_carry(_RoleId, _LinePid) ->
    ok.

% 检测与运镖npc的距离
check_npc_distance(RoleScene, NpcId) ->
    IsNearBy = lib_scene_api:is_nearby_npc(RoleScene, [NpcId]),
    IsNearBy orelse throw({error, ?RC_CARRY_FAR_FROM_CARRY_NPC}).

% 运镖结算
do_carry_settle(RoleState, #{quality := Quality, stat := Stat} = RoleData) ->
    CarryRewards = conf_guild_carry_reward:carry_rewards(Quality),
    {Contrib, Drop, Funds, FailFunds} = calc_settle_reward(CarryRewards, RoleState#role_state.guild_id),
    %% 帮派祝福加成
    Mul = lib_guild:activity_is_blessed(RoleState#role_state.guild_id, ?BLESS_TYPE_CARRY),
    RoleStateN = case Stat of
        ?CARRY_ST_DEAD ->
            AddAssets = [{?AST_CONT, Contrib * Mul}],
            #role_state{id = RoleId, guild_id = GuildId} = RoleState,
            (GuildId > 0 andalso FailFunds > 0) andalso
                svr_guild:add_funds(GuildId, RoleId, FailFunds, ?OPT_GUILD_CARRY),
            RoleState1 = lib_role_assets:add_items_notify(RoleState, AddAssets, ?OPT_GUILD_CARRY),
            {RoleStateT, _} = lib_drop_api:give_drop_sync(RoleState1, Drop, ?OPT_GUILD_CARRY),
            RoleStateT;
        ?CARRY_ST_SUCCEED ->
            Foregift = maps:get(foregift, RoleData, 0),
            AddAssets = [{?AST_CONT, Contrib * Mul}, {?AST_COIN, Foregift}],
            #role_state{id = RoleId, guild_id = GuildId} = RoleState,
            GuildId > 0 andalso svr_guild:add_funds(GuildId, RoleId, Funds, ?OPT_GUILD_CARRY),
            RoleState1 = lib_role_assets:add_items_notify(RoleState, AddAssets, ?OPT_GUILD_CARRY),
            {RoleStateT, _} = lib_drop_api:give_drop_sync(RoleState1, Drop, ?OPT_GUILD_CARRY),
            RoleStateT
    end,
    set_role_data(?carry),
    send_carry_info(RoleStateN),
    sync_carry_header(RoleState, 0),
    lib_role_daily_lively:trigger_event(RoleState#role_state.id, 11, 1),
    RoleStateN.

% 镖车传送场景
carry_change_scene(RoleState, RoleData, SceneId) ->
    #{carry_line := CarryLine} = RoleData,
    #{start_pos := {X, Y}} = conf_guild_carry_scene:get_carry_scene(CarryLine, SceneId),
    LineId = svr_scene_mgr:get_line_id(SceneId),
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    RoleDataN = RoleData#{
        scene_id => SceneId, line_id => LineId,
        line_pid => LinePid, path_index => 1,
        x => X, y => Y
    },
    set_role_data(RoleDataN),
    create_carry(RoleState, RoleDataN).

% 通知镖车位置
notify_carry_pos(RoleSid, SceneId, X, Y) ->
    Msg = #notify_carry_pos{scene_id = SceneId, x = X, y = Y},
    {ok, Bin} = prot_msg:encode_msg(52109, Msg),
    lib_role_send:send_to_sid(RoleSid, Bin).

calc_settle_reward({Contrib, Drop, Funds, FailFunds}, GuildID) ->
    Contrib1 = lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_104, Contrib),
    Funds1 = lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_104, Funds),
    FailFunds1 = lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_104, FailFunds),
    Effect = lib_guild:get_study_value(GuildID, ?GUILD_STUDY_104),
    Drop1 = [{Drop, 1 + Effect / 100}],
    {Contrib1, Drop1, Funds1, FailFunds1}.

%% 同步运镖Header
sync_carry_header(PS, Header) ->
    RoleKvList = [{#scene_role.header, Header}],
    PetKvList = [{header, Header}],
    Bin = lib_role_title:header_bin(PS#role_state.id, Header),
    lib_scene_api:send_to_role_area_scene(PS, Bin),
    lib_scene_api:update({'sync_role_and_pet', RoleKvList, PetKvList}, PS),
    ok.
