%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     成长基金
%%% @end
%%% Created : 13. 十二月 2018 10:02
%%%-------------------------------------------------------------------
-module(lib_role_grow_fund).

-include("common.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("recharge.hrl").
-include("assets.hrl").
-include("welfare.hrl").
-include("proto/prot_531.hrl").
-include("shop.hrl").
%% API
-export([
    send_info/1,
    get_reward/3,
    handle_info/2,
    buy_fund/2,
    buy/2
]).

handle_info({buy_fund, Grade}, PS) ->
    buy(PS, Grade);
handle_info(_, _) ->
    skip.

send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{grade := Grade, got_list := GotList} = RoleData,
    MsgRecord = #sc_grow_fund_info{grade = Grade, get_list = GotList},
    {ok, Bin} = prot_msg:encode_msg(53111, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

buy_fund(PS, Type) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    case catch check_buy_fund(PS, Type) of
        {_, Costs, Log} ->
            RoleData = #{grade => Type, got_list => []},
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_SHOP_BUY_ITEM),
            MsgRecord = #sc_grow_fund_info{grade = Type, get_list = []},
            {ok, Bin} = prot_msg:encode_msg(53111, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin),
            set_role_data(RoleID, RoleData),
            save_data(RoleID, RoleData),
            ?LOG(io_lib:format(?SQL_LOG_ROLE_SHOP, Log)),
            {ok, PS1};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_buy_fund(PS, Type) ->
    Type =:= ?CHARGE_TYPE_GROW_FUND_ONE orelse throw({error, ?RC_CARD_ARGS_ERROR}),
    ConsumeType = ?AST_GOLD,
    #role_state{id = RoleID} = PS,
    #{grade := Grade} = get_role_data(RoleID),
    Grade =:= 0 orelse throw({error, ?RC_GROW_FUND_BUYED}),
    #{gold := Gold} = conf_grow_fund_info:get(Type),
    Costs = [{ConsumeType, Gold}],
    lib_role_assets:check_items_enough(PS, Costs),
    Log = [RoleID, ?CHARGE_SHOP_GWK, Type, Gold, ConsumeType, 1, time:unixtime()],
    {true, Costs, Log}.

%% 领取奖励
get_reward(PS, Grade, ID) ->
    case catch check_get_reward(PS, Grade, ID) of
        {ok, RoleData, GetItems} ->
            NewPS = lib_role_assets:add_items_notify(PS, GetItems, ?OPT_GROW_FUND),
            set_role_data(PS#role_state.id, RoleData),
            save_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_grow_fund_get{grade = Grade, id = ID},
            {ok, Bin} = prot_msg:encode_msg(53113, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% 购买成长基金
buy(PS, Grade) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = #{grade => Grade, got_list => []},
    MsgRecord = #sc_grow_fund_info{grade = Grade, get_list = []},
    {ok, Bin} = prot_msg:encode_msg(53111, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    set_role_data(RoleID, RoleData),
    save_data(RoleID, RoleData),
    ok.

check_get_reward(PS, Grade, ID) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #{grade := CurGrade, got_list := GotList} = RoleData,
    (CurGrade =:= Grade andalso CurGrade > 0) orelse erlang:throw({error, ?RC_GROW_FUND_GRADE_NOT_RIGHT}),
    not lists:member(ID, GotList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    Conf = conf_grow_fund:get(Grade, ID),
    Conf =/= undefiend orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{level := NeedLv, bgold := GetBgold} = Conf,
    Lv >= NeedLv orelse erlang:throw({error, ?RC_LEVEL_GIFT_LV_LIMIT}),
    GetItems = [{?AST_BGOLD, GetBgold}],
    NewGotList = [ID | GotList],
    NewRoleData = RoleData#{got_list := NewGotList},
    {ok, NewRoleData, GetItems}.

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        Data when is_map(Data) ->
            Data;
        _ ->
            get_role_db_data(RoleID)
    end.

save_data(RoleID, RoleData) ->
    #{grade := Grade, got_list := GotList} = RoleData,
    save_role_data(RoleID, Grade, GotList).

get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_GROW_FUND_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [Grade, DbGotList] ->
            GotList = type:convert_db_field(list, DbGotList, []),
            #{grade => Grade, got_list => GotList};
        [] ->
            #{grade => 0, got_list => []}
    end.

save_role_data(RoleID, Grade, GotList) ->
    DbGotList = type:term_to_bitstring(GotList),
    SQL = io_lib:format(?SQL_SET_GROW_FUND_DATA, [RoleID, Grade, DbGotList]),
    ?DB:execute(SQL).