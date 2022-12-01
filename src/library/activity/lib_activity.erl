%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     活动
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_activity).
-author("Ryuu").

-include("timer.hrl").
-include("common.hrl").
-include("activity.hrl").
-include("proto/prot_301.hrl").

%% API
-export([
    loop/2,
    info/0,
    ongoing/0,
    schedule/4,
    get_index/1,
    get_op_id/1,
    is_ongoing/1,
    init_server/2,
    get_group_id/1,
    get_end_time/1,
    get_act_type/1,
    is_scheduled/1,
    act_need_sync/1,
    get_open_days/1,
    get_stop_time/1,
    stop_activity/2,
    sync_activity/1,
    get_start_time/1,
    router_cluster/4,
    start_activity/1,
    get_activity_id/1,
    remove_activity/2,
    prepare_activity/1,
    get_activity_flag/0,
    get_activity_info/1,
    is_cross_activity/1,
    is_group_activity/1,
    schedule_activity/1,
    stop_specify_type/1,
    get_activity_state/1,
    set_permanent_check/1,
    is_operation_activity/1,
    get_next_daily_activity/2,
    get_last_daily_activity/2
]).

%% 运营活动
-export([
    add_operation_activity/1,
    update_operation_activity/1,
    remove_operation_activity/1
]).

%% @doc 服务信息
info() ->
    [
        {node_id, get_node_id()},
        {svr_type, get_svr_type()},
        {ongoing, ongoing_list()},
        {all, ets:tab2list(?ETS_ACTIVITY)},
        {permanent_check, permanent_check()}
    ].

%% @doc 初始化
init_server(NodeID, SvrType) ->
    erlang:put(node_id, NodeID),
    erlang:put(svr_type, SvrType),
    load_operation_activity(NodeID),
    svr_timer:register(?TIMER_MIN),
    ok.

%% =============================================================================
%% 运营活动管理
%% =============================================================================

%% @doc 加载运营活动配置
load_operation_activity(NodeID) when
    NodeID =:= ?NODE_ID_GAME orelse
        NodeID =:= ?NODE_ID_KFGROUP -> %% 跨服分组节点、公共节点
    Now = time:unixtime(),
    Category = ?iif(NodeID =:= ?NODE_ID_GAME, 4, 6),
    SQL = io_lib:format(?SQL_GET_ALL_OPERATION_ACTIVITY, [Category]),
    List = ?DB:get_all(SQL),
    Fun = fun(Fields) ->
        case convert_operation_activity(Fields) of
            #{op_id := OpID, end_time := EndTime, valid := Valid} = Activity
                when Now < EndTime andalso Valid =:= 1 ->
                util:put_ets(?ETS_OPERATION_ACTIVITY, OpID, Activity);
            _ ->
                ok
        end
    end,
    lists:foreach(Fun, List);
load_operation_activity(_NodeID) ->
    ignore.

convert_operation_activity([OpID, ActID, Timing, CBeginTime, CEndTime, Index, Valid]) ->
    {BeginTime, EndTime} = op_activity_time(Timing, CBeginTime, CEndTime),
    ?operation_activity#{
        op_id => OpID, act_id => ActID, start_time => BeginTime,
        end_time => EndTime, valid => Valid, index => Index
    };
convert_operation_activity(_) ->
    undefined.

op_activity_time(?ACTIVITY_TIME_NORMAL, BeginTime, EndTime) ->
    {BeginTime, EndTime};
op_activity_time(?ACTIVITY_TIME_START, StartDay, EndDay) ->
    Time = {0, 0, 0},
    StartDate = util:get_date_since_open(StartDay),
    StartTime = time:unixtime({StartDate, Time}),
    EndDate = util:get_date_since_open(EndDay),
    EndTime = time:unixtime({EndDate, Time}),
    {StartTime, EndTime};
op_activity_time(?ACTIVITY_TIME_MERGE, _StartDay, _EndDay) ->
    {0, 0};
op_activity_time(_Type, _StartDay, _EndDay) ->
    {0, 0}.

%% @doc 增加运营活动
add_operation_activity([OpID, ActID, Timing, CBeginTime, CEndTime, Index, Valid]) ->
    SQL = io_lib:format(?SQL_SET_OPERATION_ACTIVITY, [OpID, ActID, Timing, CBeginTime, CEndTime, Index, Valid]),
    db:execute(SQL),
    case Valid of
        1 ->
            update_operation_activity([OpID, ActID, Timing, CBeginTime, CEndTime, Index, Valid]);
        _ ->
            remove_operation_activity(OpID)
    end.

%% @doc 更新（含 新增）运营活动
update_operation_activity(OpID) when is_integer(OpID) ->
    SQL = io_lib:format(?SQL_GET_OPERATION_ACTIVITY, [OpID]),
    Fields = ?DB:get_row(SQL),
    update_operation_activity(Fields);
update_operation_activity([OpID | _] = Fields) when is_list(Fields) ->
    case convert_operation_activity(Fields) of
        #{valid := Valid} = Activity when Valid =:= 1 ->
            update_operation_activity(Activity);
        _ ->
            remove_operation_activity(OpID)
    end;
update_operation_activity(NewAct) when is_map(NewAct) ->
    #{op_id := OpID, act_id := ActID} = NewAct,
    OldAct = util:get_ets(?ETS_OPERATION_ACTIVITY, OpID),
    util:put_ets(?ETS_OPERATION_ACTIVITY, OpID, NewAct),
    case OldAct of
        #{schedule := Ongoing} when Ongoing =:= true -> %% 活动排期中，更新
            update_operation_activity(util:get_ets(?ETS_ACTIVITY, ActID), NewAct);
        _ ->
            ignore
    end;
update_operation_activity(_) ->
    ignore.

update_operation_activity(undefined, _NewAct) -> %% something is wrong
    error;
update_operation_activity(Activity, OpAct) ->
    #{start_time := _BeginTime, end_time := _EndTime} = OpAct,
    #{id := ActID, state := CurState} = Activity,
    case CurState of
        ?ACT_STATE_ONGOING ->
            NewActivity = Activity#{},
            util:put_ets(?ETS_ACTIVITY, ActID, NewActivity);
        ?ACT_STATE_UNDEFINED ->
            util:del_ets(?ETS_ACTIVITY, ActID);
        ?ACT_STATE_PREPARE -> %% 需要重新计算开始时间等。。暂时没有活动处于准备状态不处理
            ignore;
        _ -> %% 正常终止（延长时间处理：结束回调已经调用了，只能重新开启）
            ignore
    end.

%% @doc 删除运营活动
remove_operation_activity(OpID) when is_integer(OpID) ->
    SQL = io_lib:format(?SQL_DEL_OPERATION_ACTIVITY, [OpID]),
    db:execute(SQL),
    Activity = util:get_ets(?ETS_OPERATION_ACTIVITY, OpID),
    remove_operation_activity(Activity);
remove_operation_activity(Activity) when is_map(Activity) ->
    #{op_id := OpID, act_id := ActID, schedule := Ongoing} = Activity,
    Ongoing andalso remove_operation_activity(util:get_ets(?ETS_ACTIVITY, ActID), Activity),
    util:del_ets(?ETS_OPERATION_ACTIVITY, OpID);
remove_operation_activity(_) ->
    ignore.

remove_operation_activity(undefined, _OpAct) -> %% something is wrong
    ignore;
remove_operation_activity(Activity, _OpAct) ->
    #{id := ActID, state := CurState} = Activity,
    case CurState of
        ?ACT_STATE_UNDEFINED ->
            util:del_ets(?ETS_ACTIVITY, ActID);
        State when State =< ?ACT_STATE_ONGOING ->
            stop_activity(ActID, true);
        _ -> %% 正常终止
            ok
    end.

%% =============================================================================
%% 活动状态管理
%% =============================================================================

%% @doc 定时检查
loop(NodeID, Now) when
    NodeID =:= ?NODE_ID_GAME orelse
        NodeID =:= ?NODE_ID_KFGROUP -> %% 跨服分组节点、公共节点
    %% 检查活动，将本应进行中的活动或下一次活动加入排期中
    check_daily_activity(NodeID, Now),
    %% 只有游戏服才有开服、合服活动
    NodeID =:= ?NODE_ID_GAME andalso begin
        check_open_activity(Now),
        check_merge_activity(Now)
    end,
    %% 只有跨服才有永久活动
    NodeID =:= ?NODE_ID_KFGROUP andalso begin
        condition_check_permanent(Now) andalso check_permanent_activity(Now)
    end,
    check_operation_activity(Now),
    %% 活动状态切换
    ets:safe_fixtable(?ETS_ACTIVITY, true),
    switch_state(ets:first(?ETS_ACTIVITY), Now),
    ets:safe_fixtable(?ETS_ACTIVITY, false),
    ok;
loop(_NodeID, _Now) ->
    ignore.

condition_check_permanent(Now) ->
    (catch condition_check_permanent2(Now)).

condition_check_permanent2(Now) ->
    CanMiJi = config:can_miji(),
    CanMiJi andalso erlang:throw(true),
    SvrStartTime = util_svr:get_start_time(),
    Timeout = (Now - SvrStartTime) > ?ACTIVITY_START_CHECK_PERMANENT,
    Timeout = Now > 0,
    Timeout andalso erlang:throw(true),
    FlagSet = permanent_check(),
    FlagSet andalso erlang:throw(true),
    false.

%% ----------------------------------------------------------------------------
%% 日常活动
%% ----------------------------------------------------------------------------

%% @doc 检查日常活动状态
check_daily_activity(NodeID, Now) ->
    check_daily_activity_(get_daily_activity_id(NodeID), Now).

check_daily_activity_([], _Now) ->
    ignore;
check_daily_activity_([ActID | T], Now) ->
    case has_activity(ActID) of
        true -> ignore;
        _ ->
            Conf = conf_activity:get(ActID),
            Activity = select_next_daily_activity(ActID, Now),
            add_daily_activity(ActID, Activity, Conf)
    end,
    check_daily_activity_(T, Now).

select_next_daily_activity(ActID, Now) when ?ACT_IS_CROSS(ActID) ->
    select_next_cross_daily(ActID, Now);
select_next_daily_activity(ActID, Now) ->
    get_next_daily_activity(ActID, Now).

select_next_cross_daily(ActID, Now) ->
    IDList = conf_daily_activity_schedule:get_act(ActID),
    ConfList = classify_cross_daily(IDList, []),
    ActList = expand_next_cross_daily(ConfList, Now),
    get_next_daily_activity2(ActList, Now).

classify_cross_daily([], Acc) ->
    Acc;
classify_cross_daily([ID | T], Acc) ->
    Conf = conf_daily_activity_schedule:get(ID),
    #{start_time := StartTime, end_time := EndTime, open_day := OpenDay,
        close_day := CloseDay, repeat := Repeat, open_week := OpenWeek} = Conf,
    Schedule =
        case lists:keyfind(StartTime, 1, Acc) of
            {_, _, Val} -> Val;
            _ -> Conf
        end,
    OpenList = maps:get(open_list, Schedule, []),
    NewCloseDay = ?iif(CloseDay =:= 0, -1, CloseDay),
    NewOpenList = [{OpenDay, NewCloseDay, OpenWeek, Repeat} | OpenList],
    NewSchedule = Schedule#{open_list => NewOpenList},
    NewAcc = lists:keystore(StartTime, 1, Acc, {StartTime, EndTime, NewSchedule}),
    classify_cross_daily(T, NewAcc).

expand_next_cross_daily(ActList, Now) when is_list(ActList) ->
    DeepList = [expand_next_cross_daily(Act, Now) || Act <- ActList],
    FlattenList = lists:flatten(DeepList),
    lists:sort(FlattenList);
expand_next_cross_daily({StartTime, EndTime, Zone}, Now) ->
    CurDate = date(),
    get_next_schedule_cross_daily(-6, CurDate, StartTime, EndTime, Zone, Now).

get_next_schedule_cross_daily(7, _CurDate, _StartTime, _EndTime, _Activity, _Now) ->
    [];
get_next_schedule_cross_daily(Day, CurDate, StartTime, EndTime, Activity, Now) ->
    NewDate = time:add_days(CurDate, Day),
    NewStartTime = time:unixtime({NewDate, StartTime}),
    NewEndTime = ?iif(is_integer(EndTime), NewStartTime + EndTime * 60, time:unixtime({NewDate, EndTime})),
    case Now < NewEndTime of
        true ->
            {NewStartTime, NewEndTime, Activity};
        _ ->
            get_next_schedule_cross_daily(Day + 1, CurDate, StartTime, EndTime, Activity, Now)
    end.

%% @doc 进行中的活动或下一次活动
get_next_daily_activity(ActID, Now) ->
    IDList = conf_daily_activity_schedule:get_act(ActID),
    ConfList = [conf_daily_activity_schedule:get(ID) || ID <- IDList],
    ActList = expand_next_daily_schedule(ConfList, Now),
    get_next_daily_activity2(ActList, Now).

expand_next_daily_schedule(ActList, Now) when is_list(ActList) ->
    DeepList = [expand_next_daily_schedule(Activity, Now) || Activity <- ActList],
    FlattenList = lists:flatten(DeepList),
    lists:sort(FlattenList);
expand_next_daily_schedule(#{repeat := []}, _Now) ->
    [];
expand_next_daily_schedule(Activity, Now) ->
    #{open_day := NeedDays, close_day := CloseDay} = Activity,
    CurDate = erlang:date(),
    OpenDate = util:get_date_since_open(NeedDays),
    StartDate = erlang:max(CurDate, OpenDate),
    CloseDate = ?iif(CloseDay =:= 0, 0, util:get_date_since_open(CloseDay)),
    get_next_schedule_daily_activity(-6, StartDate, OpenDate, CloseDate, Activity, Now).

get_next_schedule_daily_activity(7, _StartDate, _OpenDate, _CloseDate, _Activity, _Now) ->
    [];
get_next_schedule_daily_activity(Day, StartDate, OpenDate, CloseDate, Activity, Now) ->
    #{start_time := StartTime, end_time := EndTime, repeat := Repeat} = Activity,
    NewDate = time:add_days(StartDate, Day),
    DoW = calendar:day_of_the_week(NewDate),
    NewStartTime = time:unixtime({NewDate, StartTime}),
    NewEndTime = ?iif(is_integer(EndTime), NewStartTime + EndTime * 60, time:unixtime({NewDate, EndTime})),
    case NewDate >= OpenDate
        andalso (CloseDate =:= 0 orelse NewDate =< CloseDate)
        andalso lists:member(DoW, Repeat)
        andalso Now < NewEndTime
    of
        true ->
            {NewStartTime, NewEndTime, Activity};
        _ ->
            get_next_schedule_daily_activity(Day + 1, StartDate, OpenDate, CloseDate, Activity, Now)
    end.

get_next_daily_activity2([], _Now) ->
    undefined;
get_next_daily_activity2([{StartTime, EndTime, Act} | _T], Now) when Now < EndTime ->
    {StartTime, EndTime, Act};
get_next_daily_activity2([_ | T], Now) ->
    get_next_daily_activity2(T, Now).

%% @doc 进行中的活动或上一次活动
get_last_daily_activity(ActID, Now) ->
    IDList = conf_daily_activity_schedule:get_act(ActID),
    ConfList = [conf_daily_activity_schedule:get(ID) || ID <- IDList],
    ActList = expand_last_daily_schedule(ConfList, Now),
    get_last_daily_activity2(ActList, Now).

expand_last_daily_schedule(ActList, Now) when is_list(ActList) ->
    DeepList = [expand_last_daily_schedule(Activity, Now) || Activity <- ActList],
    FlattenList = lists:flatten(DeepList),
    lists:reverse(lists:sort(FlattenList));
expand_last_daily_schedule(#{repeat := []}, _Now) ->
    [];
expand_last_daily_schedule(Activity, Now) ->
    #{open_day := NeedDays, close_day := CloseDay} = Activity,
    CurDate = erlang:date(),
    OpenDate = util:get_date_since_open(NeedDays),
    StartDate = erlang:max(CurDate, OpenDate),
    CloseDate = ?iif(CloseDay =:= 0, 0, util:get_date_since_open(CloseDay)),
    get_last_schedule_daily_activity(0, StartDate, OpenDate, CloseDate, Activity, Now).

get_last_schedule_daily_activity(7, _StartDate, _OpenDate, _CloseDate, _Activity, _Now) ->
    [];
get_last_schedule_daily_activity(Day, StartDate, OpenDate, CloseDate, Activity, Now) ->
    #{start_time := StartTime, end_time := EndTime, repeat := Repeat} = Activity,
    NewDate = time:add_days(StartDate, -Day),
    DoW = calendar:day_of_the_week(NewDate),
    NewStartTime = time:unixtime({NewDate, StartTime}),
    NewEndTime = ?iif(is_integer(EndTime), NewStartTime + EndTime * 60, time:unixtime({NewDate, EndTime})),
    case NewDate >= OpenDate
        andalso (CloseDate =:= 0 orelse NewDate =< CloseDate)
        andalso lists:member(DoW, Repeat)
        andalso Now >= NewStartTime of
        true ->
            {NewStartTime, NewEndTime, Activity};
        _ ->
            get_last_schedule_daily_activity(Day + 1, StartDate, OpenDate, CloseDate, Activity, Now)
    end.

get_last_daily_activity2([], _Now) ->
    undefined;
get_last_daily_activity2([{StartTime, EndTime, Act} | _T], Now) when Now >= StartTime ->
    {StartTime, EndTime, Act};
get_last_daily_activity2([_ | T], Now) ->
    get_next_daily_activity2(T, Now).

%% @doc 添加日常活动
add_daily_activity(_ActID, undefined, _ActConf) ->
    ignore;
add_daily_activity(_ActID, _Schedule, undefined) ->
    ignore;
add_daily_activity(ActID, {BeginTime, EndTime, Schedule}, ActConf) ->
    OpenList = maps:get(open_list, Schedule, []),
    SortList = lists:sort(OpenList),
    Activity = ?activity#{
        id => ActID, type => ?ACT_TYPE_DAILY, open_list => SortList
    },
    schedule_activity(schedule(Activity, ActConf, BeginTime, EndTime)).

%% ----------------------------------------------------------------------------
%% 开服活动
%% ----------------------------------------------------------------------------

%% @doc 检查开服活动
check_open_activity(_Now) ->
    OpenDay = util:get_open_days(),
    check_open_activity(conf_open_activity_schedule:get_ids(), OpenDay).

check_open_activity([], _OpenDay) ->
    ignore;
check_open_activity([ID | T], OpenDay) ->
    Conf = conf_open_activity_schedule:get(ID),
    #{act_id := ActID} = Conf,
    case has_activity(ActID) of
        true -> ignore;
        _ ->
            Act = conf_activity:get(ActID),
            add_open_activity(Conf, Act, OpenDay)
    end,
    check_open_activity(T, OpenDay).

%% @doc 添加开服活动
add_open_activity(undefined, _ActConf, _CurOpenDay) ->
    ignore;
add_open_activity(_Schedule, undefined, _CurOpenDay) ->
    ignore;
add_open_activity(Schedule, ActConf, CurOpenDay) ->
    #{act_id := ActID, open_day := ConfOpenDay, last_day := LastDay} = Schedule,
    if
        CurOpenDay >= ConfOpenDay andalso CurOpenDay =< (ConfOpenDay + LastDay - 1) ->
            StartDate = util:get_date_since_open(ConfOpenDay),
            BeginTime = time:unixtime({StartDate, {0, 0, 0}}),
            EndData = util:get_date_since_open(ConfOpenDay + LastDay),
            EndTime = time:unixtime({EndData, {0, 0, 0}}) - 1,
            Activity = ?activity#{id => ActID, type => ?ACT_TYPE_OPEN},
            schedule_activity(schedule(Activity, ActConf, BeginTime, EndTime));
        true ->
            ignore
    end.

%% ----------------------------------------------------------------------------
%% 合服活动
%% ----------------------------------------------------------------------------

%% @doc 检查合服活动
check_merge_activity(_Now) ->
    MergeDay = util:get_merge_days(),
    check_merge_activity(conf_merge_activity_schedule:get_ids(), MergeDay).

check_merge_activity([], _MergeDay) ->
    ignore;
check_merge_activity([ID | T], MergeDay) ->
    Conf = conf_merge_activity_schedule:get(ID),
    #{act_id := ActID} = Conf,
    case has_activity(ActID) of
        true -> ignore;
        _ ->
            Act = conf_activity:get(ActID),
            add_merge_activity(Conf, Act, MergeDay)
    end,
    check_merge_activity(T, MergeDay).

%% @doc 添加合服活动
add_merge_activity(undefined, _ActConf, _CurMergeDay) ->
    ignore;
add_merge_activity(_Schedule, undefined, _CurMergeDay) ->
    ignore;
add_merge_activity(Schedule, ActConf, CurMergeDay) ->
    #{act_id := ActID, merge_day := ConfMergeDay, last_day := LastDay} = Schedule,
    if
        CurMergeDay > 0 andalso CurMergeDay >= ConfMergeDay
            andalso CurMergeDay =< (ConfMergeDay + LastDay - 1) ->
            StartDate = util:get_date_since_merge(ConfMergeDay),
            BeginTime = time:unixtime({StartDate, {0, 0, 0}}),
            EndData = util:get_date_since_merge(ConfMergeDay + LastDay),
            EndTime = time:unixtime({EndData, {0, 0, 0}}) - 1,
            Activity = ?activity#{id => ActID, type => ?ACT_TYPE_MERGE},
            schedule_activity(schedule(Activity, ActConf, BeginTime, EndTime));
        true ->
            ignore
    end.

%% ----------------------------------------------------------------------------
%% 运营活动
%% ----------------------------------------------------------------------------

%% @doc 运营活动
check_operation_activity(Now) ->
    List = ets:tab2list(?ETS_OPERATION_ACTIVITY),
    SortList = sort_operation_activity(List),
    Fun = fun({OpID, Activity}) ->
        #{act_id := ActID, schedule := Ongoing, valid := Valid, end_time := EndTime} = Activity,
        case Valid =/= 1 orelse has_activity(ActID)
            orelse Ongoing orelse Now >= EndTime of
            true -> ignore;
            _ ->
                NewActivity = Activity#{schedule => true},
                util:put_ets(?ETS_OPERATION_ACTIVITY, OpID, NewActivity),
                ActConf = conf_activity:get(ActID),
                add_operation_activity(Activity, ActConf, OpID)
        end
    end,
    lists:foreach(Fun, SortList).

%% @doc 对运营活动进行排序
sort_operation_activity(List) ->
    Fun = fun({_OpIDA, ActA}, {_OpIDB, ActB}) ->
        #{start_time := StartTimeA} = ActA,
        #{start_time := StartTimeB} = ActB,
        util:cmp([{StartTimeB, StartTimeA}])
    end,
    lists:sort(Fun, List).

%% @doc 增加运营活动
add_operation_activity(_Schedule, undefined, _OpID) ->
    ignore;
add_operation_activity(Schedule, ActConf, OpID) ->
    #{act_id := ActID, start_time := BeginTime, end_time := EndTime,
        index := Index} = Schedule,
    Activity = ?activity#{
        id => ActID, type => ?ACT_TYPE_OPERA, op_id => OpID,
        index => Index
    },
    schedule_activity(schedule(Activity, ActConf, BeginTime, EndTime)).

%% ----------------------------------------------------------------------------
%% 永久活动
%% ----------------------------------------------------------------------------

%% @doc 永久活动
check_permanent_activity(Now) ->
    List = get_act_by_type(?ACT_TYPE_PERMANENT),
    check_permanent_activity(List, Now).

check_permanent_activity([], _Now) ->
    ignore;
check_permanent_activity([Conf | T], Now) ->
    %% 已经有相同的活动在排期了
    #{id := ActID} = Conf,
    case has_activity(ActID) of
        true -> ignore;
        _ ->
            add_permanent_activity(Conf, Now)
    end,
    check_permanent_activity(T, Now).

add_permanent_activity(ActConf, Now) ->
    #{id := ActID} = ActConf,
    Activity = ?activity#{
        id => ActID, type => ?ACT_TYPE_PERMANENT
    },
    schedule_activity(schedule(Activity, ActConf, Now, forever)).

%% =============================================================================
%% 调度活动
%% =============================================================================

%% @doc schedule
schedule(Activity, ActConf, _BeginTime, _EndTime) ->
    #{id := ActID, type := Type, callback := Mod, prepare := Prepare,
        finish := Finish, cluster := Cluster} = ActConf,
    _Now = time:unixtime(),
    Now = erlang:ceil(_Now / 60) * 60,
    {BeginTime, Schedule1} =
        if
            Prepare > 0 andalso _BeginTime - Now >= Prepare * 60 ->
                {_BeginTime - Prepare * 60, [{?ACT_STATE_PREPARE, Prepare * 60}]};
            Prepare > 0 andalso _BeginTime - Now >= 60 ->
                {Now, [{?ACT_STATE_PREPARE, _BeginTime - Now}]};
            true ->
                {_BeginTime, []}
        end,
    Schedule =
        if
            _EndTime =:= forever -> %% 永久活动
                [{?ACT_STATE_ONGOING, forever}];
            _EndTime > _BeginTime -> %% 合法活动
                Schedule2 = [{?ACT_STATE_ONGOING, _EndTime - _BeginTime}, {?ACT_STATE_FINISH, Finish * 60}],
                Schedule1 ++ Schedule2;
            true ->
                []
        end,
    Activity#{
        id => ActID, type => Type, end_time => BeginTime, state => ?ACT_STATE_UNDEFINED,
        callback => Mod, schedule => Schedule, group => Cluster
    }.

%% @doc 调度活动 [GM]
schedule_activity(Activity) ->
    #{id := ActID} = Activity,
    remove_conflict(ActID),
    util:put_ets(?ETS_ACTIVITY, ActID, Activity).

%% @doc 同步活动
sync_activity(ActList) ->
    [start_activity(Activity) || Activity <- ActList].

%% @doc 停止指定类型的活动
stop_specify_type(Type) when
    Type =:= ?ACT_TYPE_MERGE orelse Type =:= ?ACT_TYPE_OPEN orelse Type =:= ?ACT_TYPE_DAILY ->
    List = get_id_by_type(Type),
    [stop_activity(ActID, true) || ActID <- List];
stop_specify_type(_Type) ->
    ignore.

%% =============================================================================
%% 活动状态切换
%% =============================================================================

%% @doc 活动状态切换
switch_state('$end_of_table', _Now) ->
    ok;
switch_state(Key, Now) ->
    Activity = util:get_ets(?ETS_ACTIVITY, Key),
    #{end_time := EndTime, state := State, schedule := Schedule} = Activity,
    case Now >= EndTime of
        true ->
            {NextState, Timeout} = get_next_state(State, Schedule),
            case NextState =:= ?ACT_STATE_REMOVE of
                true ->
                    activity_state_changed(NextState, Activity);
                _ ->
                    %% 在activity_state_changed中修改当前状态
                    NewEndTime = ?iif(Timeout =:= forever, forever, EndTime + Timeout),
                    NewActivity = Activity#{
                        start_time := EndTime, end_time := NewEndTime
                    },
                    activity_state_changed(NextState, NewActivity)
            end;
        _ ->
            next
    end,
    switch_state(ets:next(?ETS_ACTIVITY, Key), Now).

%% @doc 新状态
get_next_state(?ACT_STATE_REMOVE, _Schedule) -> %% 移除状态
    {?ACT_STATE_REMOVE, 0};
get_next_state(CurState, Schedule) ->
    NewState = CurState + 1,
    case util:prop_get_value(NewState, Schedule, -1) of
        V when V >= 0 -> {NewState, V};
        _ -> get_next_state(NewState, Schedule)
    end.

%% @doc 状态变化
activity_state_changed(?ACT_STATE_PREPARE, Activity) ->
    prepare_activity(Activity);
activity_state_changed(?ACT_STATE_ONGOING, Activity) ->
    start_activity(Activity);
activity_state_changed(?ACT_STATE_FINISH, Activity) ->
    stop_activity(Activity, false);
activity_state_changed(?ACT_STATE_REMOVE, Activity) ->
    remove_activity(Activity, false);
activity_state_changed(_StateName, _Activity) ->
    ignore.

%% @doc 准备活动
prepare_activity(Activity) ->
    #{id := _ActID, group_id := GroupID, group := Group} = Activity,
    Cross = util_svr:is_cross_server(),
    ActID = ?iif(Cross andalso GroupID =/= 0 andalso Group, {_ActID, GroupID}, _ActID),
    remove_conflict(ActID),
    ?INFO("prepare activity ~w in ~w~n", [ActID, time:unixtime_to_localtime(time:unixtime())]),
    NewActivity = Activity#{state => ?ACT_STATE_PREPARE},
    callback(prepare_activity, NewActivity),
    util:put_ets(?ETS_ACTIVITY, ActID, NewActivity),
    Cross orelse add_activity_flag(NewActivity),
    ok.

%% @doc 启动活动
start_activity(Activity) when is_map(Activity) ->
    #{id := _ActID, group_id := GroupID, group := Group} = Activity,
    Cross = util_svr:is_cross_server(),
    ActID = ?iif(Cross andalso GroupID =/= 0 andalso Group, {_ActID, GroupID}, _ActID),
    remove_conflict(ActID),
    ?INFO("start activity ~w in ~w~n", [ActID, time:unixtime_to_localtime(time:unixtime())]),
    NewActivity = Activity#{state => ?ACT_STATE_ONGOING},
    callback(start_activity, NewActivity),
    util:put_ets(?ETS_ACTIVITY, ActID, NewActivity),
    Cross orelse add_activity_flag(NewActivity),
    ok.

%% @doc 结束活动
stop_activity(undefined, _Force) ->
    ignore;
stop_activity(ActID, Force) when is_integer(ActID) orelse is_tuple(ActID) ->
    stop_activity(util:get_ets(?ETS_ACTIVITY, ActID), Force);
stop_activity(Activity, Force) when is_map(Activity) ->
    #{id := _ActID, op_id := OpID, group_id := GroupID, group := Group} = Activity,
    Cross = util_svr:is_cross_server(),
    ActID = ?iif(Cross andalso GroupID =/= 0 andalso Group, {_ActID, GroupID}, _ActID),
    ?INFO("stop activity ~w in ~w~n", [ActID, time:unixtime_to_localtime(time:unixtime())]),
    NewActivity = Activity#{state => ?ACT_STATE_FINISH},
    util:put_ets(?ETS_ACTIVITY, ActID, NewActivity),
    OpID > 0 andalso operation_activity_stopped(OpID, Force),
    callback(stop_activity, NewActivity),
    Cross orelse remove_activity_flag(ActID),
    Force andalso remove_activity(NewActivity, true),
    ok.

%% @doc 移除活动
remove_activity(undefined, _Force) ->
    ignore;
remove_activity(ActID, Force) when is_integer(ActID) orelse is_tuple(ActID) ->
    remove_activity(util:get_ets(?ETS_ACTIVITY, ActID), Force);
remove_activity(Activity, Force) ->
    #{id := _ActID, op_id := OpID, group_id := GroupID,
        group := Group} = Activity,
    Cross = util_svr:is_cross_server(),
    ActID = ?iif(Cross andalso GroupID =/= 0 andalso Group, {_ActID, GroupID}, _ActID),
    ?INFO("remove activity ~w in ~w~n", [ActID, time:unixtime_to_localtime(time:unixtime())]),
    util:del_ets(?ETS_ACTIVITY, ActID),
    OpID > 0 andalso operation_activity_stopped(OpID, Force),
    callback(remove_activity, Activity),
    ok.

%% @doc 移出冲突活动
remove_conflict(ActID) ->
    is_ongoing(ActID) andalso stop_activity(ActID, true),
    get_activity_state(ActID) =:= ?ACT_STATE_FINISH andalso remove_activity(ActID, true).

%% @doc 回调
callback(F, Activity) -> %% 跨服分组逻辑处理节点
    #{id := ActID, callback := M} = Activity,
    A = [Activity],
    N = get_node_id(),
    Cluster = act_need_cluster(ActID),
    if
        N =:= ?NODE_ID_KFGROUP andalso Cluster ->
            svr_group:cast({dispatch_activity, F, Activity});
        N =:= ?NODE_ID_KFGROUP ->
            ignore;
%%        N >= ?NODE_ID_CLUSTER ->
%%            valid_callback(M, F, A) andalso ?TRY_CATCH(erlang:apply(M, F, A));
        true ->
            valid_callback(M, F, A) andalso ?TRY_CATCH(erlang:apply(M, F, A))
    end.

valid_callback(undefined, _F, _A) ->
    false;
valid_callback(M, F, A) ->
    case code:ensure_loaded(M) of
        {module, _} ->
            erlang:function_exported(M, F, length(A));
        _ ->
            false
    end.

operation_activity_stopped(undefined, _Force) ->
    ignore;
operation_activity_stopped(OpID, Force) when is_integer(OpID) ->
    OpAct = util:get_ets(?ETS_OPERATION_ACTIVITY, OpID),
    operation_activity_stopped(OpAct, Force);
operation_activity_stopped(OpAct, _Force) ->
    #{op_id := OpID} = OpAct,
    NewOpAct = OpAct#{schedule => false},
    util:put_ets(?ETS_OPERATION_ACTIVITY, OpID, NewOpAct).

%% -----------------------------------------------------------------------------
%% 活动标记
%% -----------------------------------------------------------------------------

%% @doc 增加活动标记
add_activity_flag(#{end_time := EndTime} = Activity) when is_integer(EndTime) ->
    Rec = #sc_activity_add_flag{
        flags = [convert_flag(Activity)]
    },
    {ok, Bin} = prot_msg:encode_msg(30103, Rec),
    lib_role_send:broadcast(Bin);
add_activity_flag(_) ->
    ignore.

%% @doc 移除活动标记
remove_activity_flag(ActID) ->
    Rec = #sc_activity_remove_flag{id = ActID},
    {ok, Bin} = prot_msg:encode_msg(30104, Rec),
    lib_role_send:broadcast(Bin).

%% @doc 获取所有的活动标记
get_activity_flag() ->
    Fun = fun({_, Act}, Acc) ->
        #{state := State, end_time := EndTime} = Act,
        case (State =:= ?ACT_STATE_ONGOING
            orelse State =:= ?ACT_STATE_PREPARE)
            andalso is_integer(EndTime) of
            true ->
                Flag = convert_flag(Act),
                [Flag | Acc];
            _ ->
                Acc
        end
    end,
    ets:foldl(Fun, [], ?ETS_ACTIVITY).

convert_flag(Activity) ->
    #{id := ActID, state := State, start_time := StartTime,
        end_time := EndTime, index := Index} = Activity,
    {ActID, State, StartTime, EndTime, Index}.


%% =============================================================================
%% 通用方法
%% =============================================================================

%% @doc 获取缓存起来的Node ID
get_node_id() ->
    erlang:get(node_id).

%% @doc 获取缓存起来的Node ID
get_svr_type() ->
    erlang:get(svr_type).

set_permanent_check(Flag) ->
    erlang:put(permanent_check, Flag).

%% @doc
permanent_check() ->
    erlang:get(permanent_check) =:= true.

%% @doc 日常活动ID
get_daily_activity_id(?NODE_ID_KFGROUP) ->
    get_id_by_type(?ACT_TYPE_CROSS_DAILY);
get_daily_activity_id(?NODE_ID_GAME) ->
    get_id_by_type(?ACT_TYPE_DAILY).

%% @doc 是否是跨服活动
is_cross_activity(ActID) ->
    ActID > ?ACT_ID_BOUNDARY.

%% @doc 是否是分组活动
is_group_activity(ActID) ->
    get_conf_field(ActID, group, false) =:= true.

%% @doc 是否是运营活动
is_operation_activity(ActID) ->
    get_act_type(ActID) =:= ?ACT_TYPE_OPERA.

%% @doc 根据类型获取活动ID
get_id_by_type(Type) ->
    conf_activity:get_id_by_type(Type).

%% @doc 根据类型获取活动ID
get_act_by_type(Type) ->
    [conf_activity:get(ID) || ID <- get_id_by_type(Type)].

%% @doc 获取活动类型
get_act_type(ActID) ->
    get_conf_field(ActID, type, -1).

%% @doc 获取活动sync
act_need_sync(ActID) ->
    get_conf_field(ActID, sync, false).

%% @doc 获取活动sync
act_need_cluster(ActID) ->
    get_conf_field(ActID, cluster, false).

get_conf_field(ActID, Key, Def) ->
    case conf_activity:get(ActID) of
        #{} = ActConf -> maps:get(Key, ActConf, Def);
        _ -> Def
    end.

%% @doc 是否有活动
has_activity(ActID) ->
    util:get_ets(?ETS_ACTIVITY, ActID) =/= undefined.

%% @doc 活动是否进行中
is_ongoing(ActID) ->
    get_activity_state(ActID) =:= ?ACT_STATE_ONGOING.

%% @doc 活动是否进行中
is_scheduled(ActID) ->
    case get_activity_state(ActID) of
        State when State =:= ?ACT_STATE_ONGOING
            orelse State =:= ?ACT_STATE_PREPARE ->
            true;
        _ ->
            false
    end.

%% @doc 进行中的活动ID列表
ongoing_list() ->
    [get_activity_id(Act) || Act <- ongoing()].

%% @doc 进行中的活动
ongoing() ->
    Fun = fun({_ActID, Activity}) ->
        case get_activity_state(Activity) of
            ?ACT_STATE_ONGOING -> {true, Activity};
            _ -> false
        end
    end,
    lists:filtermap(Fun, ets:tab2list(?ETS_ACTIVITY)).

%% @doc 获取活动信息
get_activity_info(ActID) ->
    util:get_ets(?ETS_ACTIVITY, ActID).

%% @doc 提取活动ID
get_activity_id(Activity) ->
    maps:get(id, Activity, 0).

%% @doc 提取开始时间
get_start_time(Activity) ->
    get_activity_field(Activity, start_time, 0).

%% @doc 提取结束时间
get_stop_time(Activity) ->
    get_activity_field(Activity, end_time, 0).

%% @doc 提取结束时间
get_end_time(Activity) ->
    maps:get(end_time, Activity, 0).

%% @doc 获取活动第几天
get_open_days(ActID) ->
    StartTime = get_start_time(ActID),
    case StartTime of
        0 -> 0;
        _ ->
            OpenDate = time:unixdate(StartTime),
            Today = time:unixdate(),
            if
                Today - OpenDate < 0 -> 0;
                true -> (Today - OpenDate) div 86400 + 1
            end
    end.

%% @doc 提取活动状态
get_activity_state(Activity) ->
    get_activity_field(Activity, state, ?ACT_STATE_FINISH).

%% @doc 获取运营活动唯一ID（数据库自增ID）
get_op_id(Activity) ->
    get_activity_field(Activity, op_id, 0).

%% @doc 获取运营活动index
get_index(Activity) ->
    get_activity_field(Activity, index, 0).

%% @doc 获取分组ID
get_group_id(Activity) ->
    get_activity_field(Activity, group_id, 0).

%% @doc 提取活动字段
get_activity_field(ActID, Field, Default) when is_integer(ActID) orelse is_tuple(ActID) ->
    Activity = get_activity_info(ActID),
    get_activity_field(Activity, Field, Default);
get_activity_field(Activity, Field, Default) when is_map(Activity) ->
    maps:get(Field, Activity, Default);
get_activity_field(_Activity, _Field, Default) -> %% 活动未找到
    Default.

router_cluster(ID, M, F, A) ->
    case lib_activity:get_activity_info(ID) of
        #{group_id := GroupID, cluster := Cluster} when Cluster > 0 ->
            lib_kf:cast_to_cluster(Cluster, M, F, [GroupID] ++ A);
        _ ->
            ignore
    end.
