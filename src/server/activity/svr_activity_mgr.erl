%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     活动
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_activity_mgr).
-author("Ryuu").

-include("common.hrl").
-include("activity.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    call/1,
    cast/1,
    loop/1,
    start_link/2,
    stop_activity/1,
    stop_activity/2,
    sync_activity/1,
    start_activity/1,
    expire_activity/1,
    remove_activity/1,
    remove_activity/2,
    exp_specify_type/1,
    gm_stop_activity/1,
    prepare_activity/1,
    schedule_activity/1,
    schedule_activity/2,
    stop_specify_type/1,
    get_activity_flag/0,
    get_activity_info/1,
    gm_start_activity/1,
    gm_remove_activity/1
]).

-export([
    add_operation_activity/1,
    update_operation_activity/1,
    remove_operation_activity/1
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    code_change/3,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SERVER, ?MODULE).

-record(state, {
    node_id = 0
}).

%% =============================================================================
%% API
%% =============================================================================

start_link(NodeID, SvrType) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [NodeID, SvrType], []).

%% @doc GM启动活动
gm_start_activity(ActID) when is_integer(ActID) ->
    Act = conf_activity:get(ActID),
    gm_start_activity(Act);
gm_start_activity(ActConf) when is_map(ActConf) ->
    #{id := ActID, prepare := Prepare} = ActConf,
    Now = time:unixtime(),
    NewTime = (Now + 60) div 60 * 60 + ?iif(Prepare > 0, 60, 0),
    NewActivity = lib_activity:schedule(?activity#{}, ActConf, NewTime, NewTime + 1800),
    IsCrossAct = lib_activity:is_cross_activity(ActID),
    IsOperation = lib_activity:is_operation_activity(ActID),
    IsCrossSvr = util_svr:is_cross_server(),
    IsGroupSvr = util_svr:is_group_server(),
    if
        IsOperation ->
            ignore;
        IsCrossAct andalso IsCrossSvr andalso (not IsGroupSvr) ->
            ignore;
        IsCrossAct andalso IsCrossSvr -> %% 跨服，跨服中心
            schedule_activity(NewActivity);
        IsCrossAct -> %% 跨服，游戏线
            lib_kf:cast_to_center(svr_activity_mgr, schedule_activity, [NewActivity]);
        true ->
            schedule_activity(NewActivity)
    end;
gm_start_activity(_) ->
    ignore.

%% @doc GM结束活动
gm_stop_activity(ActID) ->
    IsCrossAct = lib_activity:is_cross_activity(ActID),
    IsCrossSvr = util_svr:is_cross_server(),
    IsGroupSvr = util_svr:is_group_server(),
    if
        IsCrossAct andalso IsCrossSvr andalso (not IsGroupSvr) ->
            ignore;
        IsCrossAct andalso IsCrossSvr -> %% 跨服，跨服中心
            stop_activity(ActID, true);
        IsCrossAct -> %% 跨服，游戏线
            lib_kf:cast_to_center(svr_activity_mgr, stop_activity, [ActID, true]);
        true ->
            stop_activity(ActID, true)
    end.

%% @doc GM移除活动
gm_remove_activity(ActID) ->
    IsCrossAct = lib_activity:is_cross_activity(ActID),
    IsCrossSvr = util_svr:is_cross_server(),
    IsGroupSvr = util_svr:is_group_server(),
    if
        IsCrossAct andalso IsCrossSvr andalso (not IsGroupSvr) ->
            ignore;
        IsCrossAct andalso IsCrossSvr -> %% 跨服，跨服中心
            remove_activity(ActID, true);
        IsCrossAct -> %% 跨服，游戏线
            lib_kf:cast_to_center(svr_activity_mgr, remove_activity, [ActID]);
        true ->
            remove_activity(ActID, true)
    end.

%% @doc info
i() ->
    call(info).

%% @doc pid
p() ->
    dist:whereis_name(local, ?SERVER).

%% @doc 准备活动 [internal]
prepare_activity(Activity) ->
    cast({prepare_activity, Activity}).

%% @doc 启动活动 [internal]
start_activity(Activity) ->
    start_activity(Activity, false).

%% @doc 启动活动 [internal]
start_activity(Activity, Immediately) ->
    cast({start_activity, Activity}),
    Immediately andalso loop(time:unixtime()).

%% @doc 调度活动
schedule_activity(Activity) ->
    schedule_activity(Activity, false).

%% @doc 调度活动
schedule_activity(Activity, Immediately) ->
    cast({schedule_activity, Activity}),
    Immediately andalso loop(time:unixtime()).

%% @doc 同步活动
sync_activity(Activity) ->
    cast({sync_activity, Activity}).

%% @doc 停止活动
stop_activity(ActID) ->
    stop_activity(ActID, false).

stop_activity(ActID, Force) ->
    cast({stop_activity, ActID, Force}).

%% @doc 移除活动
remove_activity(ActID) ->
    remove_activity(ActID, false).

remove_activity(ActID, Force) ->
    cast({remove_activity, ActID, Force}).

%% @doc 使指定类型的活动失效 [不会走活动停止逻辑]
expire_activity(ActID) ->
    cast({expire_activity, ActID}).

%% @doc 停止指定类型的活动 [会走活动停止逻辑]
stop_specify_type(Type) ->
    cast({stop_specify_type, Type}).

%% @doc 使指定类型的活动失效 [不会走活动停止逻辑]
exp_specify_type(Type) ->
    cast({exp_specify_type, Type}).

%% @doc 获取活动标记
get_activity_flag() ->
    call(get_activity_flag).

%% @doc 获取活动信息
get_activity_info(ActID) ->
    call({get_activity_info, ActID}).

%% @doc 更新运营活动
update_operation_activity(ActID) ->
    cast({update_operation_activity, ActID}).

add_operation_activity(Fields) ->
    cast({add_operation_activity, Fields}).

remove_operation_activity(ActID) ->
    cast({remove_operation_activity, ActID}).

%% @doc 循环检查
loop(Now) ->
    cast({loop, Now}).

cast(Request) ->
    ?cast(Request).

call(Request) ->
    ?call(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([NodeID, SvrType]) ->
    erlang:process_flag(trap_exit, true),
    lib_activity:init_server(NodeID, SvrType),
    {ok, #state{node_id = NodeID}}.

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

do_handle_call(info, _From, State) ->
    Reply = lib_activity:info(),
    {reply, Reply, State};
do_handle_call(get_activity_flag, _From, State) ->
    Reply = lib_activity:get_activity_flag(),
    {reply, Reply, State};
do_handle_call({get_activity_info, ActID}, _From, State) ->
    Reply = lib_activity:get_activity_info(ActID),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({schedule_activity, Activity}, State) ->
    lib_activity:schedule_activity(Activity),
    {noreply, State};
do_handle_cast({prepare_activity, Activity}, State) ->
    lib_activity:prepare_activity(Activity),
    {noreply, State};
do_handle_cast({start_activity, Activity}, State) ->
    lib_activity:start_activity(Activity),
    {noreply, State};
do_handle_cast({sync_activity, Activity}, State) ->
    lib_activity:sync_activity(Activity),
    {noreply, State};
do_handle_cast({stop_activity, ActID, Force}, State) ->
    lib_activity:stop_activity(ActID, Force),
    {noreply, State};
do_handle_cast({remove_activity, ActID, Force}, State) ->
    lib_activity:remove_activity(ActID, Force),
    {noreply, State};
do_handle_cast({add_operation_activity, Fields}, State) ->
    lib_activity:add_operation_activity(Fields),
    {noreply, State};
do_handle_cast({update_operation_activity, ActID}, State) ->
    lib_activity:update_operation_activity(ActID),
    {noreply, State};
do_handle_cast({remove_operation_activity, ActID}, State) ->
    lib_activity:remove_operation_activity(ActID),
    {noreply, State};
do_handle_cast({stop_specify_type, Type}, State) ->
    lib_activity:stop_specify_type(Type),
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_activity:loop(State#state.node_id, Now),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
