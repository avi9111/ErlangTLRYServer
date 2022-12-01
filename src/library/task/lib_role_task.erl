%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     任务
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_task).
-author("Ryuu").

-include("role.hrl").
-include("task.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_423.hrl").

-export([
    do/3,
    init/1,
    save/1,
    event/2,
    action/2,
    add_task/2,
    del_task/2,
    fin_task/2,
    cls_tasks/2,
    send_info/1,
    handle_info/2,
    is_finished/2,
    get_role_data/1
]).

-export([
    gm_clear_task/1,
    gm_finish_till/2,
    gm_accept_task/2
]).

-export([
    has_prize_task/1,
    get_circle_task/1,
    has_circle_task/1,
    get_daily_task/1,
    has_daily_task/1,
    has_metall_task/1,
    get_metall_task/1
]).

fire(_PS, Action) ->
    lib_role:mod_after(0, ?MODULE, {fire, Action}).

event(PS, 'level_up') ->
    refresh(PS),
    fire(PS, 'upgrade');
event(PS, {timer, ?TIMER_DEFAULT}) ->
    save(PS);
event(PS, {'func_open', FuncID}) ->
    refresh(PS, conf_task:get_by_func(FuncID));
event(PS, {'coll_collect', #{scene := SceneID, id := CollID}}) ->
    fire(PS, {'collect', SceneID, CollID});
event(_PS, _) ->
    ok.

handle_info({'fire', Action}, PS) ->
    lib_task_util:action(PS, Action);
handle_info('refresh', PS) ->
    refresh(PS);
handle_info({'refresh', IDList}, PS) ->
    refresh(PS, IDList);
handle_info(_Info, _PS) ->
    ignore.

do(42301, PS, _) ->
    send_info(PS);
do(42303, PS, #cs_task_accept{id = TaskID}) ->
    accept_task(PS, TaskID);
do(42307, PS, #cs_task_get_reward{id = TaskID, grid = Grid}) ->
    get_reward(PS, TaskID, Grid);
do(_, _PS, _) ->
    ignore.

send_info(PS) ->
    RoleData = get_role_data(PS#role_state.id),
    #{tasks := Tasks, last := Last} = RoleData,
    Rec = #sc_task_info{
        tasks = convert_tasks(Tasks, []),
        last = Last
    },
    {ok, Bin} = prot_msg:encode_msg(42302, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_tasks([], Acc) ->
    Acc;
convert_tasks([Task | T], Acc) ->
    convert_tasks(T, [convert_task(Task) | Acc]).

convert_task(Task) ->
    #{id := ID, stat := Stat, masks := Masks} = Task,
    Proc = [{C, T} || #{current := C, total := T} <- Masks],
    #clt_task{id = ID, stat = Stat, masks = Proc}.

accept_task(PS, TaskID) ->
    case catch check_accept_task(PS, TaskID) of
        {ok, RoleID, RoleData, Task} ->
            update_role_data(RoleID, RoleData),
            Rec = #sc_task_accept{task = convert_task(Task)},
            {ok, Bin} = prot_msg:encode_msg(42304, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_accept_task(PS, TaskID) ->
    #role_state{id = RoleID, career = _Career} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    case map:keyfind(TaskID, id, Tasks) of
        #{stat := Stat0, masks := Masks} = Task when Stat0 =:= ?TASK_STAT_PREPARE ->
            Stat = ?iif(Masks =/= [] andalso lib_task_util:mask_done(Masks), ?TASK_STAT_FINISHED, ?TASK_STAT_ACCEPTED),
            NewTask = Task#{stat => Stat};
        #{} ->
            NewTask = erlang:throw({error, ?RC_TASK_ALREADY_ACCEPTED});
        _ ->
            NewTask = erlang:throw({error, ?RC_TASK_NOT_ACCEPTABLE})
    end,
    NewTasks = map:keystore(TaskID, id, Tasks, NewTask),
    NewData = RoleData#{tasks => NewTasks},
    {ok, RoleID, NewData, NewTask}.

check_accept_conds([], _PS) ->
    true;
check_accept_conds([Cond | T], PS) ->
    check_accept_cond(Cond, PS),
    check_accept_conds(T, PS).

check_accept_cond({?TASK_COND_LEVEL, Lv}, PS) ->
    #role_state{level = Level} = PS,
    Level >= Lv orelse erlang:throw({error, ?RC_TASK_ROLE_LEVEL_LMT});
check_accept_cond({?TASK_COND_FUNC, FuncId}, PS) ->
    Active = lib_role_func:is_active(PS#role_state.id, FuncId),
    Active orelse erlang:throw({error, ?RC_TASK_OPEN_FUNC_LMT});
check_accept_cond({?TASK_COND_MARRY, _}, PS) ->
    Married = lib_marriage:is_married(PS#role_state.id),
    Married orelse erlang:throw({error, ?RC_TASK_OPEN_NOT_MARRY});
check_accept_cond(_, _PS) ->
    true.

get_reward(PS, TaskID, Grid) ->
    case catch check_get_reward(PS, TaskID, Grid) of
        {ok, RoleID, RoleData, Costs, DropID, Next, ConfTask} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_TASK_REWARD),
            lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_TASK_REWARD),
            update_role_data(RoleID, RoleData),
            ?EVENT(RoleID, {'finish_task', TaskID}),
            Rec = #sc_task_get_reward{id = TaskID},
            {ok, Bin} = prot_msg:encode_msg(42308, Rec),
            lib_role_send:send_to_role(PS1, Bin),
            #{trans := Trans} = ConfTask,
            PS2 = ?iif(Trans > 0, lib_role_trans:dismiss(PS1), PS1),
            task_finished(PS2, ConfTask, Next);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, TaskID, Grid) ->
    #role_state{id = RoleID, career = Career} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, finished := Finished, last := Last} = RoleData,
    Task = map:keyfind(TaskID, id, Tasks),
    Task =/= false orelse erlang:throw({error, ?RC_TASK_NOT_ACCEPT}),
    #{stat := Stat, masks := Masks} = Task,
    ConfTask = conf_task:get({TaskID, Career}),
    #{rewards := DropID, costs := Items, next := NextID, cate := Cate, seq := Seq} = ConfTask,
    Costs = ?iif(Grid > 0, [{?AST_PET_C, [Grid]}], [{?AST_ITEM, Items}]),
    lib_role_assets:check_items_enough(PS, Costs),
    Done = Masks =:= [] orelse Stat =:= ?TASK_STAT_FINISHED,
    Done orelse erlang:throw({error, ?RC_TASK_NOT_COMPLETE}),
    NewTasks = map:keydelete(TaskID, id, Tasks),
    NewLast = ?iif(Cate =:= ?TASK_CATE_MAIN andalso Seq > Last, Seq, Last),
    NewData = RoleData#{
        tasks => NewTasks, finished => sets:add_element(TaskID, Finished),
        last => NewLast
    },
    Next = ?iif(NextID > 0, [NextID], []),
    {ok, RoleID, NewData, Costs, DropID, Next, ConfTask}.

task_finished(PS, ConfTask, Next) ->
    refresh(PS, Next),
    case task_finished(PS, ConfTask) of
        PS1 when is_record(PS1, role_state) ->
            PS1;
        _ ->
            PS
    end.

task_finished(PS, #{id := TaskID, type := Type}) when Type >= ?TASK_TYPE_CIRCLE_HELP ->
    lib_role_circle:task_finished(PS, TaskID);
task_finished(PS, #{id := TaskID, type := ?TASK_TYPE_PRIZE}) ->
    lib_role_prize:task_finished(PS, TaskID);
task_finished(_PS, _ConfTask) ->
    ok.

refresh(PS) ->
    IDList = conf_task:get_by_lv(PS#role_state.level),
    refresh(PS, IDList).

refresh(_PS, []) ->
    ignore;
refresh(PS, IDList) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, finished := Finished, last := Last} = RoleData,
    case refresh_tasks(IDList, PS, Tasks, Finished, Last, []) of
        [] ->
            ignore;
        List ->
            NewTasks = List ++ Tasks,
            NewData = RoleData#{tasks => NewTasks},
            update_role_data(RoleID, NewData),
            notify_new_tasks(PS, List)
    end.

refresh_tasks([], _PS, _Tasks, _Finished, _Last, Acc) ->
    Acc;
refresh_tasks([ID | T], PS, Tasks, Finished, Last, Acc) ->
    case catch refresh_task(PS, ID, Tasks, Finished, Last) of
        {ok, Task} ->
            refresh_tasks(T, PS, Tasks, Finished, Last, [Task | Acc]);
        _Err ->
            refresh_tasks(T, PS, Tasks, Finished, Last, Acc)
    end.

refresh_task(PS, ID, Tasks, Finished, Last) ->
    #role_state{career = Career} = PS,
    sets:is_element(ID, Finished) andalso erlang:throw({error, ?RC_TASK_ALREADY_FINISHED}),
    map:keyfind(ID, id, Tasks) =:= false orelse erlang:throw({error, ?RC_TASK_ALREADY_ACCEPTED}),
    ConfTask = conf_task:get({ID, Career}),
    #{cate := Cate, accept_cond := AcceptCond, seq := Seq, prev := PrevID} = ConfTask,
    if
        Cate =:= ?TASK_CATE_MAIN ->
            Seq > Last orelse erlang:throw({error, ?RC_TASK_SMALLER_THAN_LAST});
        Cate =:= ?TASK_CATE_BRANCH ->
            ok;
        true ->
            erlang:throw({error, ?RC_TASK_NOT_AUTO_TYPE})
    end,
    PrevID =:= 0 orelse sets:is_element(PrevID, Finished) orelse erlang:throw({error, ?RC_TASK_PREV_NOT_FINISHED}),
    check_accept_conds(AcceptCond, PS),
    Task = init_task(PS, ConfTask),
    {ok, Task}.

%% -----------------------------------------------------------------------------

add_task(PS, TaskID) ->
    #role_state{id = RoleID, career = Career} = PS,
    ConfTask = conf_task:get({TaskID, Career}),
    #{trans := Trans} = ConfTask,
    Task = init_task(PS, ConfTask),
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    NewTasks = map:keystore(TaskID, id, Tasks, Task),
    NewData = RoleData#{tasks => NewTasks},
    PS1 = ?iif(Trans > 0, lib_role_trans:trans(PS, Trans), PS),
    update_role_data(RoleID, NewData),
    notify_new_tasks(PS, [Task]),
    PS1.

del_task(PS, TaskID) ->
    #role_state{id = RoleID, career = Career} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    case map:keytake(TaskID, id, Tasks) of
        {value, Task, NewTasks} ->
            ConfTask = conf_task:get({TaskID, Career}),
            #{trans := Trans} = ConfTask,
            NewData = RoleData#{tasks => NewTasks},
            update_role_data(RoleID, NewData),
            notify_del_tasks(PS, [Task]),
            ?iif(Trans > 0, lib_role_trans:dismiss(PS), PS);
        _ ->
            PS
    end.

fin_task(PS, TaskID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    Task = map:keyfind(TaskID, id, Tasks),
    #{masks := Masks} = Task,
    NewMasks = [Mask#{current => Total} || #{total := Total} = Mask <- Masks],
    NewTask = Task#{state => ?TASK_STAT_FINISHED, masks => NewMasks},
    NewTasks = map:keystore(TaskID, id, Tasks, NewTask),
    NewData = RoleData#{tasks => NewTasks},
    update_role_data(RoleID, NewData),
    notify_new_tasks(PS, [NewTask]).

cls_tasks(PS, List) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, finished := Finished} = RoleData,
    {NewTasks, NewFinished, RTasks} = cls_tasks(List, Tasks, Finished, []),
    NewData = RoleData#{tasks => NewTasks, finished => NewFinished},
    update_role_data(RoleID, NewData),
    notify_new_tasks(PS, RTasks),
    refresh(PS).

cls_tasks([], Tasks, Finished, Acc) ->
    {Tasks, Finished, Acc};
cls_tasks([TaskID | T], Tasks, Finished, Acc) ->
    NewFinished = sets:del_element(TaskID, Finished),
    case map:keytake(TaskID, id, Tasks) of
        {value, Task, NewTasks} ->
            cls_tasks(T, NewTasks, NewFinished, [Task#{state => ?TASK_STAT_FINISHED} | Acc]);
        _ ->
            cls_tasks(T, Tasks, NewFinished, Acc)
    end.

%% -----------------------------------------------------------------------------
%% Task Proc
%% -----------------------------------------------------------------------------

gen_init_task(PS) ->
    FirstID = conf_task:get_first(),
    #role_state{career = Career} = PS,
    Task = lib_task_util:init_task(PS, conf_task:get({FirstID, Career})),
    Task.

init_task(PS, ConfTask) ->
    #{start_talk := StartTalk} = ConfTask,
    InitStat = ?iif(StartTalk > 0, ?TASK_STAT_PREPARE, ?TASK_STAT_UNDEFINED),
    lib_task_util:init_task(PS, ConfTask, InitStat).

action(PS, Action) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    {NewTasks, Changes} = lib_task_util:task_actions(Tasks, PS, Action),
    NewData = RoleData#{tasks => NewTasks},
    update_role_data(RoleID, NewData),
    notify_new_tasks(PS, Changes).

%% -----------------------------------------------------------------------------

notify_new_tasks(_PS, []) ->
    ignore;
notify_new_tasks(PS, List) ->
    Rec = #sc_task_refresh{tasks = convert_tasks(List, [])},
    {ok, Bin} = prot_msg:encode_msg(42309, Rec),
    lib_role_send:send_to_role(PS, Bin).

notify_del_tasks(_PS, []) ->
    ignore;
notify_del_tasks(PS, List) ->
    notify_new_tasks(PS, [Task#{stat => ?TASK_STAT_DONE} || Task <- List]).

%% -----------------------------------------------------------------------------
%% 通用
%% -----------------------------------------------------------------------------

is_finished(RoleID, TaskID) ->
    RoleData = get_role_data(RoleID),
    #{finished := Finished} = RoleData,
    sets:is_element(TaskID, Finished).

has_circle_task(RoleID) ->
    get_circle_task(RoleID) =/= [].

get_circle_task(RoleID) ->
    get_cate_tasks(RoleID, ?TASK_CATE_CIRCLE).

has_daily_task(RoleID) ->
    get_daily_task(RoleID) =/= [].

get_daily_task(RoleID) ->
    get_type_tasks(RoleID, ?TASK_TYPE_DAILY).

has_metall_task(RoleID) ->
    get_metall_task(RoleID) =/= [].

get_metall_task(RoleID) ->
    case get_type_tasks(RoleID, ?TASK_TYPE_SMETALL) of
        [] ->
            get_type_tasks(RoleID, ?TASK_TYPE_BMETALL);
        Data ->
            Data
    end.

has_prize_task(RoleID) ->
    get_type_tasks(RoleID, ?TASK_TYPE_PRIZE) =/= [].

get_type_tasks(RoleID, Type) ->
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    Fun = fun(Task) -> lib_task_util:task_type(Task) =:= Type end,
    lists:filter(Fun, Tasks).

get_cate_tasks(RoleID, Type) ->
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    Fun = fun(Task) -> lib_task_util:task_cate(Task) =:= Type end,
    lists:filter(Fun, Tasks).

%% -----------------------------------------------------------------------------
%% GM
%% -----------------------------------------------------------------------------

gm_finish_till(PS, TaskID) ->
    #role_state{id = RoleID, level = Level, career = Career} = PS,
    ConfTask = conf_task:get({TaskID, Career}),
    ConfTask =/= undefined orelse erlang:throw({error, ?RC_TASK_NO_TASK_CONF}),
    #{type := TaskType} = ConfTask,
    TaskType  =:= ?TASK_TYPE_MAIN orelse erlang:throw({error, ?RC_TASK_NOT_MAIN_TASK}),
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, finished := Finished} = RoleData,
    IDList = conf_task:get_by_lv(Level),
    lists:member(TaskID, IDList) orelse erlang:throw({error, ?RC_TASK_LEVEL_EXCEED}),
    Filter = fun(FTask) -> lib_task_util:task_type(FTask) =/= ?TASK_TYPE_MAIN end,
    {Tasks1, DTasks} = lists:partition(Filter, Tasks),
    NewFinished = sets:from_list(lists:filter(Filter, sets:to_list(Finished)) ++ coll_prev(TaskID, [])),
    Task = init_task(PS, ConfTask),
    NewTasks = map:keystore(TaskID, id, Tasks1, Task),
    NewData = RoleData#{tasks => NewTasks, finished => NewFinished},
    update_role_data(RoleID, NewData),
    notify_del_tasks(PS, DTasks),
    notify_new_tasks(PS, [Task]).

coll_prev(TaskID, Acc) ->
    case conf_task:get({TaskID, 1}) of
        #{prev := PrevID} when PrevID > 0 ->
            coll_prev(PrevID, [PrevID | Acc]);
        _ ->
            Acc
    end.

gm_clear_task(PS) ->
    gm_clear_task(PS, [?TASK_TYPE_MAIN, ?TASK_TYPE_BRANCH, ?TASK_TYPE_DAILY]).

gm_clear_task(PS, Types) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    Fun = fun(Task) -> lists:member(lib_task_util:task_type(Task), Types) end,
    {DTasks, NewTasks} = lists:partition(Fun, Tasks),
    NewData = RoleData#{tasks => NewTasks},
    update_role_data(RoleID, NewData),
    notify_del_tasks(PS, DTasks),
    refresh(PS).

gm_accept_task(PS, TaskID) ->
    #role_state{id = RoleID, career = Career} = PS,
    ConfTask = conf_task:get({TaskID, Career}),
    ConfTask =/= undefined orelse erlang:throw({error, ?RC_TASK_NO_TASK_CONF}),
    #{type := Type} = ConfTask,
    if
        Type =:= ?TASK_TYPE_MAIN ->
            gm_clear_task(PS, [?TASK_TYPE_MAIN]);
        Type =:= ?TASK_TYPE_BRANCH ->
            ok;
        true ->
            erlang:throw({error, ?RC_TASK_NOT_ACCEPTABLE})
    end,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, finished := Finished} = RoleData,
    NewFinished = sets:del_element(TaskID, Finished),
    Task = init_task(PS, ConfTask),
    NewTasks = map:keystore(TaskID, id, Tasks, Task),
    NewData = RoleData#{tasks => NewTasks, finished => NewFinished},
    update_role_data(RoleID, NewData),
    notify_new_tasks(PS, [Task]).

%% -----------------------------------------------------------------------------
%% role data
%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_TASK, [RoleID]),
    lib_role:mod_info(RoleID, ?MODULE, refresh),
    case db:get_row(SQL) of
        [DbTasks, LastID, DbFinished, Time] ->
            Tasks = type:convert_db_field(list, DbTasks, []),
            Finished = sets:from_list(type:convert_db_field(list, DbFinished, [])),
            RoleData = ?role_task#{tasks => Tasks, last => LastID, finished => Finished, time => Time},
            set_role_data(RoleID, RoleData);
        _ ->
            RoleData = ?role_task#{tasks => [gen_init_task(PS)], time => time:unixtime()},
            update_role_data(RoleID, RoleData)
    end.

save(#role_state{id = RoleID}) ->
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, last := Last, finished := Finished, time := Time} = RoleData,
    DbTasks = type:term_to_bitstring(Tasks),
    DbFinished = type:term_to_bitstring(sets:to_list(Finished)),
    Sql = io_lib:format(?SQL_SET_ROLE_TASK, [
        RoleID, DbTasks, Last, DbFinished, Time
    ]),
    db:execute(Sql).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData#{updated => true}).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
