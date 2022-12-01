%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%      逞凶打图
%%% @end
%%% Created : 13. 十一月 2018 14:41
%%%-------------------------------------------------------------------
-module(lib_role_daily_robber).
-author("Tom").

-include("op_type.hrl").
-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_516.hrl").

%% API
-export([
    init/1,
    save/1,
    cross_day/1,
    event/2,
    handle_info/2,

    send_info/1,
    accept_task/1,
    submit_task/1,
    abandon_task/1,
    get_daily_times/1
]).

%% 缓存数据结构
-record(robber, {
    max_times = 0,              %% 每天任务最大次数
    times = 0,                  %% 当天已完成任务次数
    scene_id = 0,               %% 目标场景id
    line_pid = 0,               %% 目标场景的pid
    x = 0,                      %% 目标点x
    y = 0,                      %% 目标点y
    id = 0,                     %% 怪物唯一id
    mon_id = 0,                 %% 怪物模型id
    state = 0,                  %% 任务状态
    last_abandon_time = 0,      %% 上次放弃任务的时间戳
    last_accept_time = 0,       %% 上次接取任务时间戳

    updated = false
}).

-define(TASK_STATE_IDLE, 0).        %% 未接任务
-define(TASK_STATE_RUNNING, 1).     %% 任务进行中
-define(TASK_STATE_DONE, 2).        %% 任务完成等待交任务

-define(RE_ACCEPT_TASK_TIME_GAP, 300).   %% 放弃任务后再次接取的时间间隔，单位秒


%% 玩家进程分发过来的处理
handle_info({check_create_mon, SceneId}, State) ->
    check_create_monster(State, SceneId, true);
handle_info(_Info, _State) ->
    undefined.


%% 初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    init_role_db_data(RoleID),
    %% 检查是否跨天
    RoleData = get_role_data(RoleID),
    #robber{last_accept_time = LastAcceptTime} = RoleData,
    case time:is_today(LastAcceptTime) of
        false ->
            refresh_task(PS);
        _ -> skip
    end.
%%    %% 生成任务怪物
%%    SceneId == 0 orelse MonId == 0 orelse
%%        begin
%%            {ID, LinePid} = create_monster_in_scene(RoleID, Name, SceneId, X, Y, MonId ),
%%            update_role_data(RoleID, RoleData#robber{ id = ID, line_pid = LinePid })
%%        end.


%% 下线保存
save(PS) ->
    RoleData = get_role_data(PS#role_state.id),
    #robber{updated = Updated, line_pid = _LinePid, id = _Id} = RoleData,

    %% 下线前先将任务怪物销毁
%%    LinePid == 0 orelse Id == 0 orelse lib_scene_api:is_mon_in_scene(LinePid, Id) =:= false orelse lib_scene_api:clear_scene_mon_by_ids(LinePid, [Id], true),

    ?iif(Updated, save_role_db_data(PS#role_state.id, RoleData), skip).

%% 跨天逻辑
cross_day(PS) ->
    {RoleSid, NewRoleData} = refresh_task(PS),
    update_task_info(RoleSid, NewRoleData).

%% 杀怪回调
event(PS, {'kill_mon', MonID}) ->
    check_kill_robber(PS, MonID);
event(_, _) ->
    skip.

%%----------------------------接口功能--------------------------------
%% 刷新任务信息
refresh_task(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    NewRoleData = RoleData#robber{times = 0, last_accept_time = time:unixtime()},
    update_role_data(RoleID, NewRoleData),
    {RoleSid, NewRoleData}.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    MsgRecord = #sc_daily_robber_info{
        times = RoleData#robber.times,
        max_times = RoleData#robber.max_times,
        scene_id = RoleData#robber.scene_id,
        x = RoleData#robber.x,
        y = RoleData#robber.y,
        state = RoleData#robber.state,
        mon_id = RoleData#robber.id
    },
    {ok, MsgRecord}.

%% 接受任务
accept_task(PS) ->
    #role_state{id = RoleID, level = Lv, role_scene = #role_scene{scene_id = CurSceneId}} = PS,
    RoleData = get_role_data(RoleID),
    CurTime = time:unixtime(),
    #{open_lv := OpenLv} = conf_daily_robber:get(),
    #robber{
        max_times = MaxTimes,
        times = Times,
        state = State,
        last_abandon_time = LastAbandonTime,

        scene_id = SceneId,
        x = X,
        y = Y,
        mon_id = MonId
    } = RoleData,

    Lv >= OpenLv orelse erlang:throw({error, ?RC_DAILY_ROBBER_LACK_OF_LV}),
    Times < MaxTimes orelse erlang:throw({error, ?RC_DAILY_ROBBER_LACK_OF_TIMES}),
    State =:= ?TASK_STATE_IDLE orelse erlang:throw({error, ?RC_DAILY_ROBBER_TASK_RUNNING}),
    CurTime - LastAbandonTime > ?RE_ACCEPT_TASK_TIME_GAP orelse erlang:throw({error, ?RC_DAILY_ROBBER_WAIT_ACCEPT}),

    {SceneId_N, X_N, Y_N, RandMonId} = create_random_info(Lv, SceneId, X, Y, MonId),
    State_N = ?TASK_STATE_RUNNING,
    update_role_data(RoleID, RoleData#robber{last_accept_time = time:unixtime(), state = State_N, scene_id = SceneId_N, x = X_N, y = Y_N, mon_id = RandMonId}),
    %% 生成任务怪物
%%    LinePid = get_scene_linePid(SceneId_N),
%%    Args = [{xy, {X_N, Y_N}}, {owner, #{id => RoleID, name => Name}}],
%%    ID = lib_scene_api:create_mon(RandMonId, LinePid, Args),
    check_create_monster(PS, CurSceneId),
%%    {ID, LinePid} = create_monster_in_scene(RoleID, Name, SceneId_N, X_N, Y_N, RandMonId ),
    
    RoleDataN = get_role_data(RoleID),
    MsgRecord = #sc_daily_robber_accept_task{
        scene_id = SceneId_N,
        x = X_N,
        y = Y_N,
        state = State_N,
        mon_id = RoleDataN#robber.id
    },
    {ok, MsgRecord}.

%% 生成随机数据
create_random_info(Lv, SceneId, X, Y, MonId) ->
    #{mon_id := MonIdList, monster_pos := PosList} = conf_daily_robber_by_lv:get(Lv),
    PosList_N = lists:delete({SceneId, X, Y}, PosList),
    {SceneId_N, X_N, Y_N} = util:list_rand(PosList_N),
    MonIdList_N = lists:delete(MonId, MonIdList),
    RandMonId = util:list_rand(MonIdList_N),
    {SceneId_N, X_N, Y_N, RandMonId}.

%% 放弃任务
abandon_task(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    CurTime = time:unixtime(),

    RoleData#robber.state =:= ?TASK_STATE_RUNNING orelse erlang:throw({error, ?RC_DAILY_ROBBER_TASK_NOT_RUNNING}),
    lib_scene_api:clear_scene_mon_by_ids(RoleData#robber.line_pid, [RoleData#robber.id], true),
    SceneId = 0, X = 0, Y = 0, MonId = 0, State = ?TASK_STATE_IDLE,
    update_role_data(RoleID, RoleData#robber{state = State, scene_id = SceneId, x = X, y = Y, mon_id = MonId, last_abandon_time = CurTime}),

    MsgRecord = #sc_daily_robber_abandon_task{
        scene_id = SceneId,
        x = X, y = Y,
        state = State
    },
    {ok, MsgRecord}.

%% 提交任务
submit_task(PS) ->
    #role_state{id = RoleID, sid = RoleSid, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    RoleData#robber.state =:= ?TASK_STATE_DONE orelse erlang:throw({error, ?RC_DAILY_ROBBER_TASK_NOT_DONE}),
    RoleDataN = RoleData#robber{state = ?TASK_STATE_IDLE},

    update_role_data(RoleID, RoleDataN),
    update_task_info(RoleSid, RoleDataN),
    %% 发放奖励
    #{box_reward := BoxReward} = conf_daily_robber_by_lv:get(Lv),
    lib_drop_api:give_drop_asyn(RoleID, [BoxReward], ?OPT_DAILY_ROBBER),
    ok.

%% 更新任务信息给客户端
update_task_info(RoleSid, NewRoleData) ->
    MsgRecord = #sc_daily_robber_update_task{
        times = NewRoleData#robber.times,
        scene_id = NewRoleData#robber.scene_id,
        x = NewRoleData#robber.x,
        y = NewRoleData#robber.y,
        state = NewRoleData#robber.state,
        mon_id = NewRoleData#robber.id
    },
    router_516:send_update_info(RoleSid, MsgRecord).

%% 检查是否击杀了强盗
check_kill_robber(PS, MonID) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = #role_scene{scene_id = CurSceneId}, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #robber{max_times = MaxTimes, times = Times, scene_id = SceneId, x = X, y = Y, mon_id = MonIDT, state = State} = RoleData,

    MonID =:= MonIDT andalso State =:= ?TASK_STATE_RUNNING andalso
        begin
            TimesNew = Times + 1,
            {SceneIdS, XS, YS, MonIdS, StateS} = case TimesNew < MaxTimes of
                true ->
                    {SceneIdN, XN, YN, RandMonId} = create_random_info(Lv, SceneId, X, Y, MonIDT),
%%                    {ID, LinePid} = create_monster_in_scene(RoleID, Name, SceneIdN, XN, YN, RandMonId ),
                    {SceneIdN, XN, YN, RandMonId, ?TASK_STATE_RUNNING};
                false -> {0, 0, 0, 0, ?TASK_STATE_DONE}
            end,
            RoleDataN = RoleData#robber{
                times = TimesNew,
                state = StateS,
                scene_id = SceneIdS,
                x = XS,
                y = YS,
                mon_id = MonIdS
            },
            update_role_data(RoleID, RoleDataN),
            SceneIdS =/= 0 andalso check_create_monster(PS, CurSceneId),
            RoleDataM = get_role_data(RoleID),
            update_task_info(RoleSid, RoleDataM),

            %% 发放奖励
            #{normal_reward := NormalRewards, box_reward := _BoxReward} = conf_daily_robber_by_lv:get(Lv),
            RewardList = case lists:keyfind(RoleDataN#robber.times, 1, NormalRewards) of
                {_, NormalReward} ->
                    [NormalReward];
                _ ->
                    ?ERROR("[daily_robber]No.~w normal reward not exist!!!~n", [RoleDataN#robber.times]),
                    []
            end,
%%            RewardListN = ?iif(RoleDataN#robber.times >= RoleDataN#robber.max_times, [BoxReward|RewardList], RewardList),
            lib_drop_api:give_drop_asyn(RoleID, RewardList, ?OPT_DAILY_ROBBER),
            %% 每日活跃
            lib_role_daily_lively:trigger_event(RoleID, 1007, 1),
            ?TASK_EVENT(RoleID, part_robber)
        end,
    ok.

%% 在场景创建怪物
create_monster_in_scene(RoleID, Name, SceneId, X, Y, MonId) ->
    LineId = svr_scene_mgr:get_line_id(SceneId),
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    Args = [{xy, {X, Y}}, {owner, #{id => RoleID, name => Name}}],
    ID = lib_scene_api:create_mon(MonId, LinePid, Args),
    {ID, LinePid}.

%% 检查是否需要创建怪物
check_create_monster(PS, SceneId) ->
    check_create_monster(PS, SceneId, false).

check_create_monster(PS, SceneId, Refresh) ->
    #role_state{id = RoleID, sid = RoleSid, name = Name} = PS,
    RoleData = get_role_data(RoleID),
    #robber{scene_id = SceneId_R, mon_id = MonId, x = X, y = Y} = RoleData,
    SceneId =/= SceneId_R orelse MonId =:= 0 orelse begin
        {ID, LinePid} = create_monster_in_scene(RoleID, Name, SceneId_R, X, Y, MonId),
        RoleDataN = RoleData#robber{id = ID, line_pid = LinePid},
        update_role_data(RoleID, RoleDataN),
        Refresh andalso update_task_info(RoleSid, RoleDataN)
    end.

get_daily_times(RoleID) ->
    RoleData = get_role_data(RoleID),
    #robber{times = Times} = RoleData,
    Times.

%%----------------------------------------------------------------------

-define(SQL_GET_ROLE_DATA,
    <<"SELECT `max_times`, `times`, `scene_id`, `x`, `y`, `mon_id`, `state`, "
    "`last_abandon_time`, `last_accept_time` FROM `role_daily_robber` WHERE `role_id` = ~w">>
).

init_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    RoleData = case ?DB:get_row(SQL) of
        [MaxTimes, Times, SceneID, X, Y, MonId, State, LastAbandonTime, LastAcceptTime] ->
            #robber{
                max_times = MaxTimes,
                times = Times,
                scene_id = SceneID,
                x = X,
                y = Y,
                mon_id = MonId,
                state = State,
                last_abandon_time = LastAbandonTime,
                last_accept_time = LastAcceptTime
            };
        [] ->
            #{one_round_times := MaxTimes} = conf_daily_robber:get(),
            #robber{max_times = MaxTimes}
    end,
    set_role_data(RoleID, RoleData).

-define(SQL_SET_ROLE_DATA,
    <<"REPLACE INTO `role_daily_robber` (`role_id`, `max_times`, `times`, `scene_id`, "
    " `x`, `y`, `mon_id`, `state`, `last_abandon_time`, `last_accept_time`) "
    " VALUES (~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w)">>
).
save_role_db_data(RoleID, RoleData) ->
    #robber{
        max_times = MaxTimes,
        times = Times,
        scene_id = SceneID,
        x = X,
        y = Y,
        mon_id = MonId,
        state = State,
        last_abandon_time = LastAbandonTime,
        last_accept_time = LastAcceptTime
    } = RoleData,
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, MaxTimes, Times, SceneID, X, Y, MonId, State, LastAbandonTime, LastAcceptTime]),
    ?DB:execute(SQL),
    set_role_data(RoleID, RoleData#robber{updated = false}).


update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#robber{updated = true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).
