%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     功能开放、新手步骤
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_func).

-include("func.hrl").
-include("role.hrl").
-include("common.hrl").
-include("proto/prot_251.hrl").

-export([
    do/3,
    init/1,
    save/1,
    event/2,
    active/2,
    refresh/1,
    cross_day/1,
    is_active/2,
    active_all/1,
    handle_info/2,
    get_role_data/1,
    is_step_active/2,
    send_func_info/1,
    login_send_info/1,
    update_new_step/3,
    send_newbie_info/1
]).

handle_info({active, ID}, PS) ->
    active(PS, ID);
handle_info(refresh, PS) ->
    lib_func_util:refresh(PS);
handle_info(_Req, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(PS, 'level_up') ->
    lib_func_util:refresh(PS);
event(PS, {'finish_task', _TaskId}) ->
    lib_func_util:refresh(PS);
event(_PS, _) ->
    ignore.

do(25101, PS, #cs_func_info{}) ->
    send_func_info(PS);
do(25141, State, #get_newbie_guide_info_req{}) ->
    send_newbie_info(State#role_state.sid);
do(25143, State, #update_newbie_guide_req{id = Id, num = Num}) ->
    update_new_step(State#role_state.id, Id, Num);
do(_Cmd, _PS, _req) ->
    ignore.

cross_day(PS) ->
    lib_role:mod_info(PS, ?MODULE, refresh).

%% @doc 发送功能开放数据(最早发送给客户端)
login_send_info(PS) ->
    send_func_info(PS),
    send_newbie_info(PS).

send_func_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{funcs := Funcs} = RoleData,
    Msg = #sc_func_info{funcs = sets:to_list(Funcs)},
    {ok, BinData} = prot_msg:encode_msg(25102, Msg),
    lib_role_send:send_to_role(PS, BinData).

send_newbie_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{guide := Guide} = RoleData,
    Msg = #get_newbie_guide_info_resp{newbie_guide = Guide},
    {ok, BinData} = prot_msg:encode_msg(25142, Msg),
    lib_role_send:send_to_sid(RoleSid, BinData).

%% @doc 刷新功能开放
refresh(PS) ->
    IDList = conf_func:get_ids(),
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{funcs := Funcs} = RoleData,
    NewList = lib_func_util:open_list(IDList, PS, Funcs, conf_func, []),
    active(PS, RoleData, NewList).

%% @doc 根据ID激活新功能
active(RoleID, ID) when is_integer(RoleID) ->
    lib_role:mod_info(RoleID, ?MODULE, {active, ID});
active(PS, ID) when is_integer(ID) ->
    active(PS, [ID]);
active(PS, IDList) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    active(PS, RoleData, IDList).

active(PS, _RoleData, []) ->
    PS;
active(PS, RoleData, IDList) ->
    #{funcs := Funcs} = RoleData,
    #role_state{level = RoleLv, id = RoleID} = PS,
    Fun = fun(FuncID, {Acc, ListAcc}) ->
        case not sets:is_element(FuncID, Acc) andalso
            is_map(conf_func:get(FuncID)) of
            true ->
                ?EVENT(PS, {func_open, FuncID}),
                {sets:add_element(FuncID, Acc), [FuncID | ListAcc]};
            _ ->
                {Acc, ListAcc}
        end
    end,
    {NewFuncs, NewList} = lists:foldl(Fun, {Funcs, []}, IDList),
    NewRoleData = RoleData#{funcs => NewFuncs},
    update_role_data(RoleID, NewRoleData),
    RoleLv > 1 andalso NewList =/= [] andalso begin
        Msg = #sc_func_opened{funcs = NewList},
        {ok, BinData} = prot_msg:encode_msg(25103, Msg),
        lib_role_send:send_to_role(RoleID, BinData)
    end,
    PS.

%% @doc 功能是否已经开启
is_active(RoleID, SysID) ->
    RoleData = get_role_data(RoleID),
    #{funcs := Funcs} = RoleData,
    sets:is_element(SysID, Funcs).

%% @doc 更新新手步骤
update_new_step(RoleID, Id, Num) ->
    RoleData = get_role_data(RoleID),
    #{guide := Guide} = RoleData,
    NewGuide = lists:keystore(Id, 1, Guide, {Id, Num}),
    NewRoleData = RoleData#{guide => NewGuide},
    update_role_data(RoleID, NewRoleData),
    case conf_new_step:get(Id) of
        #{times := Times} when Num >= Times ->
            ?TASK_EVENT(RoleID, {new_step, Id});
        _ ->
            ignore
    end.

is_step_active(RoleID, ID) ->
    RoleData = get_role_data(RoleID),
    #{guide := Guide} = RoleData,
    case conf_new_step:get(ID) of
        #{times := Times} ->
            util:prop_get_value(ID, Guide, 0) >= Times;
        _ ->
            false
    end.

%% -----------------------------------------------------------------------------
%% GM 秘籍
%% -----------------------------------------------------------------------------

%% @doc 根据ID激活新功能 [GM，在线]
active_all(PS) ->
    IDList = conf_func:get_ids(),
    active(PS, IDList).

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 玩家上线初始化数据
init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_FUNC, [RoleID]),
    RoleData = case ?DB:get_row(SQL) of
        [DbFuncs, DbGuide] ->
            Funcs = type:convert_db_field(list, DbFuncs, []),
            Guide = type:convert_db_field(list, DbGuide, []),
            ?role_func#{funcs => sets:from_list(Funcs), guide => Guide};
        [] ->
            InitIDs = conf_func:get_init_ids(),
            ?role_func#{funcs => sets:from_list(InitIDs), updated => true}
    end,
    set_role_data(RoleID, RoleData),
    lib_role:mod_info(RoleID, ?MODULE, refresh).

%% @doc
save(PS) ->
    save_(PS).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            save_role_data(RoleID, RoleData);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleData) ->
    #{funcs := Funcs0, guide := Guide} = RoleData,
    Funcs = sets:to_list(Funcs0),
    DbFuncs = type:term_to_bitstring(Funcs),
    DbGuide = type:term_to_bitstring(Guide),
    SQL = io_lib:format(?SQL_SET_ROLE_FUNC, [RoleID, DbFuncs, DbGuide]),
    ?DB:execute(SQL),
    NewRoleData = RoleData#{updated => false},
    set_role_data(RoleID, NewRoleData).

update_role_data(RoleID, RoleData) ->
    NewRoleData = RoleData#{updated => true},
    set_role_data(RoleID, NewRoleData).

%% @doc 获取玩家数据
get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) -> RoleData;
        _ -> ?role_func#{role_id => RoleID}
    end.

%% @doc 保存玩家数据
set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
