%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林悬赏令
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_prize).
-author("Ryuu").

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_426.hrl").

%% API
-export([
    do/3,
    init/1,
    event/2,
    cross_day/1,
    send_info/1,
    get_role_data/1,
    task_finished/2
]).

-define(VERSION, 2).

-define(role_prize, #{
    role_id => 0,
    version => ?VERSION,
    grade => 0,
    tasks => [],
    times => 0,
    time => 0
}).

do(42601, PS, _Req) ->
    send_info(PS);
do(42603, PS, #cs_prize_accept{grade = Grade}) ->
    accept(PS, Grade);
do(_Cmd, _PS, _Req) ->
    ignore.

event(PS, 'level_up') ->
    upgrade(PS);
event(_PS, _) ->
    ignore.

send_info(PS) ->
    RoleData = get_role_data(PS#role_state.id),
    send_info(PS, RoleData).

send_info(PS, RoleData) ->
    #{times := Times, grade := Grade, tasks := Tasks} = RoleData,
    Rec = #sc_prize_info{times = Times, grade = Grade, tasks = Tasks},
    {ok, Bin} = prot_msg:encode_msg(42602, Rec),
    lib_role_send:send_to_role(PS, Bin).

accept(PS, Grade) ->
    case catch check_accept(PS, Grade) of
        {ok, RoleID, RoleData, Costs, TaskID, Times} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_PRIZE_ACCEPT),
            update_role_data(RoleID, RoleData),
            PS2 = lib_role_task:add_task(PS1, TaskID),
            Rec = #sc_prize_accept{grade = Grade, times = Times},
            {ok, Bin} = prot_msg:encode_msg(42604, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_accept(PS, Grade) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times, grade := _CGrade, tasks := Tasks} = RoleData,
    lib_role_task:has_prize_task(RoleID) andalso erlang:throw({error, ?RC_TASK_HAS_PRIZE_TASK}),
    MaxTimes = config:get_sys_config(prize_task_max_times),
    Times < MaxTimes orelse erlang:throw({error, ?RC_TASK_PRIZE_MAX_TIMES}),
    LvLimit = config:get_sys_config(prize_task_level_limit),
    PioneerLv = util_svr:get_pioneer_lv(),
    PioneerLv >= LvLimit orelse erlang:throw({error, ?RC_TASK_PRIZE_LEVEL_LIMIT}),
    util_svr:has_pioneer_eff(RoleLv) orelse erlang:throw({error, ?RC_TASK_PIONEER_LV_LIMIT}),
    Conf = conf_prize_task:get({RoleLv, Grade}),
    Conf =/= undefined orelse erlang:throw({error, ?RC_TASK_PRIZE_NO_SUCH_GRADE}),
    #{tasks := List, costs := Costs} = Conf,
    List =/= [] orelse erlang:throw({error, ?RC_TASK_PRIZE_DB_EMPTY}),
    TaskID = ?iif(Tasks =/= [], util:prop_get_value(Grade, Tasks), util:list_rand(List)),
    lib_role_assets:check_items_enough(PS, Costs),
    NewTimes = Times + 1,
    NewData = RoleData#{grade => Grade, times => NewTimes},
    {ok, RoleID, NewData, Costs, TaskID, NewTimes}.

task_finished(PS, _TaskID) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    RoleData = get_role_data(RoleID),
    #{grade := Grade} = RoleData,
    ConfLevel = conf_level:get(RoleLv),
    #{prize_reward := Rewards} = ConfLevel,
    Exp = util:prop_get_value(Grade, Rewards, 0),
    NewData = RoleData#{grade => 0, tasks => alloc_task(RoleLv)},
    update_role_data(RoleID, NewData),
    send_info(PS, NewData),
    lib_role_daily_lively:trigger_event(RoleID, 1013, 1),
    lib_role_assets:add_items_notify(PS, [{?AST_EXP, Exp}], ?OPT_TASK_REWARD).

upgrade(PS) ->
    check_alloc(PS, true).

check_alloc(PS, Force) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    RoleData = get_role_data(RoleID),
    case RoleData of
        #{grade := 0, tasks := CTasks} when CTasks =:= [] orelse Force ->
            NewData = RoleData#{tasks => alloc_task(RoleLv)},
            update_role_data(RoleID, NewData),
            send_info(PS);
        _ ->
            ok
    end.

alloc_task(RoleLv) ->
    Grades = conf_prize_task:get_grades(),
    alloc_task(Grades, RoleLv, []).

alloc_task([], _RoleLv, Acc) ->
    Acc;
alloc_task([Grade | T], RoleLv, Acc) ->
    Conf = conf_prize_task:get({RoleLv, Grade}),
    #{tasks := List} = Conf,
    TaskID = util:list_rand(List),
    alloc_task(T, RoleLv, [{Grade, TaskID} | Acc]).

%% -----------------------------------------------------------------------------

cross_day(PS) ->
    renew_role_data(PS).

init(PS) ->
    renew_role_data(PS),
    check_alloc(PS, false).

renew_role_data(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{time := Time} = RoleData,
    Now = time:unixtime(),
    case time:is_same_day(Time, Now) of
        false ->
            NewData = RoleData#{times => 0, time => Now},
            update_role_data(RoleID, NewData);
        true ->
            RoleData
    end.

get_role_data(RoleID) ->
    case lib_role_data:get_value(RoleID, ?MODULE) of
        #{version := 1} = RoleData ->
            RoleData#{tasks => [], version => 2};
        #{version := ?VERSION} = RoleData ->
            RoleData;
        _ ->
            ?role_prize#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData).

set_role_data(RoleID, RoleData) ->
    lib_role_data:put_value(RoleID, ?MODULE, RoleData).
