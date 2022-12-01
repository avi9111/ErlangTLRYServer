%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     变身 TODO 任务变身
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_trans).
-author("Ryuu").

-include("role.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_428.hrl").
-include("proto/prot_902.hrl").

%% API
-export([
    init/1,
    trans/2,
    trans/3,
    event/2,
    dismiss/1,
    trans_t/3,
    handle_info/2
]).

event(_PS, _) ->
    ignore.

handle_info(expire_check, PS) ->
    expire_check(PS);
handle_info(_Info, _PS) ->
    ignore.

init(PS) ->
    #role_state{id = RoleID} = PS,
    {ID, Time} = get_role_data(RoleID),
    start_timer(Time),
    PS#role_state{tran_stat = ID}.

expire_check(PS) ->
    #role_state{id = RoleID} = PS,
    {ID, Time} = get_role_data(RoleID),
    Now = time:unixtime(),
    case ID > 0 andalso Time > 0
        andalso Time < Now of
        true ->
            set_role_data(RoleID, 0, 0),
            dismiss(PS);
        _ ->
            start_timer(Time)
    end.

trans(PS, 0) ->
    dismiss(PS);
trans(PS, ID) ->
    trans(PS, ID, 0).

trans_t(PS, ID, Time) ->
    case check_trans(PS, ID, Time) of
        ok ->
            trans(PS, ID, Time);
        {error, Code} ->
            {error, Code}
    end.

check_trans(_PS, ID, _Time) ->
    Conf = conf_transform:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_TRANS_CONF_NOT_FOUND}),
    ok.

trans(PS, ID, Time0) ->
    #role_state{id = RoleID} = PS,
    NewPS = PS#role_state{tran_stat = ID},
    ValidTime = valid_time(Time0),
    set_role_data(RoleID, ID, ValidTime),
    refresh_scene(NewPS, ValidTime).

dismiss(PS) ->
    #role_state{id = RoleID} = PS,
    NewPS = PS#role_state{tran_stat = 0},
    set_role_data(RoleID, 0, 0),
    refresh_scene(NewPS, 0).

refresh_scene(PS, Time) ->
    #role_state{id = RoleID, tran_stat = ID} = PS,
    start_timer(Time),
    Rec = #sc_trans_tran{role_id = RoleID, tran_stat = ID},
    {ok, Bin} = prot_msg:encode_msg(42802, Rec),
    lib_scene_api:update({trans, ID, Bin}, PS),
    lib_role_send:send_to_role(PS, Bin),
    PS.

valid_time(0) ->
    0;
valid_time(Time) ->
    time:unixtime() + Time.

start_timer(Time) ->
    stop_timer(),
    if
        Time =:= 0 ->
            ignore;
        true ->
            Now = time:unixtime(),
            Ref = lib_role:mod_after((Time - Now) * 1000, ?MODULE, expire_check),
            erlang:put({?MODULE, timer}, Ref)
    end.

stop_timer() ->
    Ref = erlang:erase({?MODULE, timer}),
    util:cancel_timer(Ref).

set_role_data(RoleID, ID, Time) ->
    lib_role_data:put_value(RoleID, ?KEY_ROLE_TRANS, {ID, Time}).

get_role_data(RoleID) ->
    case lib_role_data:get_value(RoleID, ?KEY_ROLE_TRANS) of
        {_, _} = RoleData ->
            RoleData;
        _ ->
            {0, 0}
    end.
