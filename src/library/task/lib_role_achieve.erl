%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     玩家成就
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_achieve).
-author("Ryuu").

-include("func.hrl").
-include("role.hrl").
-include("task.hrl").
-include("achieve.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_427.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    action/2,
    finish/2,
    send_info/1,
    finish_all/1,
    finish_type/2,
    handle_info/2,
    get_role_data/1
]).

do(42701, PS, _) ->
    send_info(PS);
do(42703, PS, #cs_achieve_get_reward{id = ID}) ->
    get_reward(PS, ID);
do(_Cmd, _PS, _Req) ->
    ok.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save(PS);
event(PS, {func_open, ?FUNC_ACHIEVE}) ->
    refresh_task(PS, false),
    send_info(PS);
event(_PS, _Event) ->
    ignore.

handle_info(init_refresh, PS) ->
    refresh_task(PS, false);
handle_info(_Info, _PS) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, types := Types} = RoleData,
    Rec = #sc_achieve_info{
        tasks = convert_tasks(Tasks, []),
        types = convert_types(Types, [])
    },
    {ok, Bin} = prot_msg:encode_msg(42702, Rec),
    lib_role_send:send_to_role(PS, Bin).

get_reward(PS, ID) ->
    case catch check_get_reward(PS, ID) of
        {ok, RoleID, RoleData, Rewards, Task, Type} ->
            lib_drop_api:give_drop_asyn(RoleID, Rewards, ?OPT_ACHIEVE_REWARD),
            update_role_data(RoleID, RoleData),
            Rec = #sc_achieve_get_reward{id = ID},
            {ok, Bin} = prot_msg:encode_msg(42704, Rec),
            lib_role_send:send_to_role(PS, Bin),
            notify_achieve(PS, [Task], [Type]);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    ConfTask = conf_achieve_task:get(ID),
    ConfTask =/= undefined orelse erlang:throw({error, ?RC_ACHIEVE_NO_CONF}),
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, types := Types} = RoleData,
    Task = map:keyfind(ID, id, Tasks),
    case Task of
        #{stat := Stat} when Stat =:= ?TASK_STAT_FINISHED ->
            ok;
        #{stat := Stat} when Stat =:= ?TASK_STAT_DONE ->
            erlang:throw({error, ?RC_ACHIEVE_ALREADY_GOT});
        _ ->
            erlang:throw({error, ?RC_ACHIEVE_NOT_FINISH})
    end,
    #{star := Star, type := TypeID, reward := AReward} = ConfTask,
    NewTask = Task#{stat => ?TASK_STAT_DONE},
    NewTasks = map:keystore(ID, id, Tasks, NewTask),
    {NewTypes, NewType, TReward} = refresh_type(Types, TypeID, Star),
    NewData = RoleData#{tasks => NewTasks, types => NewTypes},
    Rewards = [Reward || Reward <- [AReward, TReward], Reward > 0],
    {ok, RoleID, NewData, Rewards, NewTask, NewType}.

refresh_type(Types, TypeID, Star) ->
    ConfType = conf_achieve_type:get(TypeID),
    #{reward := CTReward, star := MaxStar} = ConfType,
    Type = map:keyfind(TypeID, type, Types, ?achieve_type#{type => TypeID}),
    #{star := CurStar, stat := TStat} = Type, NewStar = CurStar + Star,
    case CTReward > 0 andalso NewStar >= MaxStar andalso TStat =:= 0 of
        true ->
            {TReward, NewStat} = {CTReward, 1};
        _ ->
            {TReward, NewStat} = {0, TStat}
    end,
    NewType = Type#{star => NewStar, stat => NewStat},
    NewTypes = map:keystore(TypeID, type, Types, NewType),
    {NewTypes, NewType, TReward}.

%% -----------------------------------------------------------------------------

refresh_task(PS, Notify) ->
    FuncOpen = lib_role_func:is_active(PS#role_state.id, ?FUNC_ACHIEVE),
    FuncOpen andalso refresh_task1(PS, Notify).

refresh_task1(PS, Notify) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    Accepted = sets:from_list([ID || #{id := ID} <- Tasks]),
    IDList = conf_achieve_task:get_ids(),
    List = refresh_tasks2(IDList, PS, Accepted, []),
    NewData = RoleData#{tasks => List ++ Tasks},
    update_role_data(RoleID, NewData),
    Notify andalso notify_achieve(PS, List, []).

refresh_tasks2([], _PS, _Accepted, Acc) ->
    Acc;
refresh_tasks2([ID | T], PS, Accepted, Acc) ->
    case sets:is_element(ID, Accepted) of
        false ->
            Conf = conf_achieve_task:get(ID),
            Task = lib_task_util:init_task(PS, Conf),
            refresh_tasks2(T, PS, sets:add_element(ID, Accepted), [Task | Acc]);
        _ ->
            refresh_tasks2(T, PS, Accepted, Acc)
    end.

action(PS, Action) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    {NewTasks, Changes} = lib_task_util:task_actions(Tasks, PS, Action),
    NewData = RoleData#{tasks => NewTasks},
    update_role_data(RoleID, NewData),
    notify_achieve(PS, Changes, []).

notify_achieve(_PS, [], []) ->
    ignore;
notify_achieve(PS, Tasks, Types) ->
    Rec = #sc_achieve_notify_task{
        tasks = convert_tasks(Tasks, []),
        types = convert_types(Types, [])
    },
    {ok, Bin} = prot_msg:encode_msg(42705, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_tasks([], Acc) ->
    Acc;
convert_tasks([Task | T], Acc) ->
    #{id := ID, masks := Masks, stat := State} = Task,
    [#{current := Current} | _] = Masks,
    convert_tasks(T, [{ID, Current, State} | Acc]).

convert_types([], Acc) ->
    Acc;
convert_types([Type | T], Acc) ->
    #{type := TypeID, star := Star, stat := Stat} = Type,
    convert_types(T, [{TypeID, Star, Stat} | Acc]).

%% -----------------------------------------------------------------------------
%% GM
%% -----------------------------------------------------------------------------

finish(RoleID, ID) ->
    finish_achieves(RoleID, [ID]).

finish_all(RoleID) ->
    finish_achieves(RoleID, conf_achieve_task:get_ids()).

finish_type(RoleID, Type) ->
    finish_achieves(RoleID, conf_achieve_task:get_by_type(Type)).

finish_achieves(RoleID, List) ->
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks} = RoleData,
    {NewTasks, FinTasks} = finish_achieves(List, Tasks, []),
    NewData = RoleData#{tasks => NewTasks},
    update_role_data(RoleID, NewData),
    notify_achieve(RoleID, FinTasks, []),
    ok.

finish_achieves([], Tasks, FAcc) ->
    {Tasks, FAcc};
finish_achieves([ID | T], Tasks, FAcc) ->
    case map:keyfind(ID, id, Tasks) of
        #{stat := Stat, masks := Masks} = Task when Stat < ?TASK_STAT_FINISHED ->
            NewMasks = lib_task_util:finish_masks(Masks),
            NewTask = Task#{stat => ?TASK_STAT_FINISHED, masks => NewMasks},
            finish_achieves(T, map:keystore(ID, id, Tasks, NewTask), [NewTask | FAcc]);
        _ ->
            finish_achieves(T, Tasks, FAcc)
    end.

%% -----------------------------------------------------------------------------
%% data
%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID} = PS,
    case db:get_row(io_lib:format(?SQL_GET_ROLE_ACHIEVE, [RoleID])) of
        [DbTasks, DbTypes] ->
            Tasks = type:convert_db_field(list, DbTasks, []),
            Types = type:convert_db_field(list, DbTypes, []),
            RoleData = ?role_achieve#{
                role_id => RoleID, tasks => Tasks, types => Types
            };
        _ ->
            RoleData = ?role_achieve#{role_id => RoleID}
    end,
    set_role_data(RoleID, RoleData),
    lib_role:mod_after(0, ?MODULE, init_refresh).

save(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            save_role_data(RoleID, RoleData);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleData) ->
    #{tasks := Tasks, types := Types} = RoleData,
    DbTasks = type:term_to_bitstring(Tasks),
    DbTypes = type:term_to_bitstring(Types),
    db:execute(io_lib:format(?SQL_SET_ROLE_ACHIEVE, [RoleID, DbTasks, DbTypes])),
    set_role_data(RoleID, RoleData#{updated => false}).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        #{} = RoleData ->
            RoleData;
        _ ->
            ?role_achieve#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData#{updated => true}).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
