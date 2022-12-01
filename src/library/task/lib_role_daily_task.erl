%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     每日任务
%%% @end
%%% Created : 18. 十二月 2018 14:43
%%%-------------------------------------------------------------------
-module(lib_role_daily_task).

-include("common.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("task.hrl").
-include("op_type.hrl").
-include("proto/prot_532.hrl").

%% API
-export([
    do/3,
    send_info/1,
    get_task/2,
    event/2
]).

event(PS, {'finish_task', TaskID}) ->
    handle_finish_task(PS, TaskID);
event(_, _) ->
    skip.

do(53201, PS, _Req) ->
    send_info(PS);
do(53203, PS, _Req) ->
    get_task(PS, 0);
do(_, _, _) ->
    skip.

send_info(#role_state{id = RoleID, sid = RoleSid}) ->
    Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_TASK_TIMES),
    TaskID = get_cur_task_id(RoleID),
    MsgRecord = #sc_daily_task_info{times = Times, task_id = TaskID},
    {ok, Bin} = prot_msg:encode_msg(53202, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 接任务
get_task(PS, GmTaskID) ->
    case catch check_get_task(PS, GmTaskID) of
        {ok, TaskID} ->
            PS1 = lib_role_task:add_task(PS, TaskID),
            MsgRecord = #sc_daily_task_get{task_id = TaskID},
            {ok, Bin} = prot_msg:encode_msg(53204, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_task(PS, GmTaskID) ->
    #role_state{id = RoleID, level = Lv} = PS,
    not lib_role_task:has_daily_task(RoleID) orelse erlang:throw({error, ?RC_THIEF_HAVE_TASK}),
    Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_TASK_TIMES),
    TaskID = get_cur_task_id(RoleID),
    MaxTimes = config:get_sys_config(daily_task_max_times),
    Times < MaxTimes orelse erlang:throw({error, ?RC_TASK_ALREADY_FINISHED}),
    TaskID =:= 0 orelse erlang:throw({error, ?RC_TASK_ALREADY_ACCEPTED}),
    List = conf_daily_task_bank:get(Lv),
    TaskIDN = ?iif(GmTaskID > 0, GmTaskID, util:list_rand(List)),
    {ok, TaskIDN}.

%% 完成任务
handle_finish_task(PS, TaskID) ->
    #role_state{id = RoleID, sid = RoleSid, level = Lv, career = Career} = PS,
    List = conf_daily_task_bank:get(Lv),
    #{type := Type} = conf_task:get({TaskID, Career}),
    case Type =:= ?TASK_TYPE_DAILY of
        true ->
            Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_TASK_TIMES),
            NewTimes = Times + 1,
            MaxTimes = config:get_sys_config(daily_task_max_times),
            BoxReward = config:get_sys_config(daily_task_box),
            #{daily_task_reward := Rewards} = conf_level:get(Lv),
            Reward = util:prop_get_value(NewTimes, Rewards, []),
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_TASK_TIMES, NewTimes),
            ?TASK_EVENT(RoleID, fin_daily_task),
            lib_role_daily_lively:trigger_event(RoleID, 1012, 1),
            case NewTimes >= MaxTimes of
                true ->
                    TaskIDN = 0,
                    lib_drop_api:give_drop_asyn(RoleID, BoxReward, ?OPT_DAILY_TASK),
                    PS1 = PS;
                _ ->
                    TaskIDN = util:list_rand(List),
                    PS1 = lib_role_task:add_task(PS, TaskIDN)
            end,
            NewPS = lib_role_assets:add_items_notify(PS1, Reward, ?OPT_DAILY_TASK),
            MsgRecord = #sc_daily_task_info{times = NewTimes, task_id = TaskIDN},
            {ok, Bin} = prot_msg:encode_msg(53202, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin),
            NewPS;
        _ ->
            PS
    end.

get_cur_task_id(RoleID) ->
    List = lib_role_task:get_daily_task(RoleID),
    case List of
        [] ->
            0;
        _ ->
            [#{id := ID} | _] = List,
            ID
    end.