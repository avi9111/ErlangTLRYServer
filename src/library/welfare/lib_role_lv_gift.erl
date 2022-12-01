%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     等级礼包(乾坤袋)
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_lv_gift).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_305.hrl").

%% API
-export([
    do/3,
    send_info/1,
    get_role_data/1
]).

do(30501, PS, _) ->
    send_info(PS);
do(30503, PS, #cs_level_gift_get{lv = Lv}) ->
    get_gift(PS, Lv);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取等级礼包信息
send_info(PS) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    States = get_role_data(RoleID),
    IDList = conf_level_gift:get_ids(),
    List = convert_info(IDList, States, RoleLv, []),
    Rec = #sc_level_gift_info{states = List},
    {ok, Bin} = prot_msg:encode_msg(30502, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_info([], _States, _RoleLv, Acc) ->
    Acc;
convert_info([Lv | T], States, RoleLv, Acc) ->
    Got = lists:member(Lv, States),
    if
        Got -> State = ?REWARD_STATE_GOT;
        RoleLv >= Lv -> State = ?REWARD_STATE_CAN;
        true -> State = ?REWARD_STATE_NOT
    end,
    convert_info(T, States, RoleLv, [{Lv, State} | Acc]).

%% @doc 领取等级礼包
get_gift(PS, Lv) ->
    case catch check_get_gift(PS, Lv) of
        {ok, RoleID, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_LEVEL_GIFT),
            set_role_data(RoleID, RoleData),
            Rec = #sc_level_gift_get{lv = Lv},
            {ok, Bin} = prot_msg:encode_msg(30504, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_gift(PS, Lv) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    RoleLv >= Lv orelse erlang:throw({error, ?RC_LEVEL_GIFT_LV_LIMIT}),
    Conf = conf_level_gift:get(Lv),
    Conf =/= undefined orelse erlang:throw({error, ?RC_LEVEL_GIFT_NO_CONF}),
    #{reward := Reward} = Conf,
    States = get_role_data(RoleID),
    lists:member(Lv, States) andalso erlang:throw({error, ?RC_LEVEL_GIFT_REWARD_GOT}),
    NewStates = [Lv | States],
    {ok, RoleID, NewStates, Reward}.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

get_role_data(RoleID) ->
    case lib_role_kv:get_kv(RoleID, ?KEY_LEVEL_GIFT) of
        States when is_list(States) ->
            States;
        _ ->
            []
    end.

set_role_data(RoleID, RoleData) ->
    lib_role_kv:set_kv(RoleID, ?KEY_LEVEL_GIFT, RoleData).
