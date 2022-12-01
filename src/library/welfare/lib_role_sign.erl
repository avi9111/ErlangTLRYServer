%%% ----------------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     签到
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_sign).

-include("role.hrl").
-include("sign.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_304.hrl").

%% API
-export([
    send_info/1,
    init/1,
    do/3,
    cross_day/1,
    save/1,
    handle_info/2,
    gm_add_times/2
]).

handle_info(add_times, PS) ->
    add_times(PS);
handle_info(_, _) ->
    skip.

do(30401, PS, _Req) ->
    send_info(PS);
do(30403, PS, #cs_sign_get_daily{}) ->
    get_daily(PS);
do(30405, PS, #cs_sign_get_acc{id = ID}) ->
    get_acc(PS, ID);
do(30407, PS, #cs_sign_bu_qian{}) ->
    buqian(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{is_get := IsGet, acc := Acc, daily := Daily, times := Times, bq_times := BqTimes} = RoleData,
    SignDay = ?iif(IsGet =:= 0, length(Daily) + 1, length(Daily)),
    Rec = #sc_sign_info{
        sign_day = SignDay,
        is_get = IsGet,
        daily = Daily,
        acc = Acc,
        bq_times = BqTimes,
        times = Times
    },
    {ok, Bin} = prot_msg:encode_msg(30402, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 领取每日奖励
get_daily(PS) ->
    case catch check_get_daily(PS) of
        {ok, RoleData, Reward, Daily, Acc} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_DAILY_SIGN),
            update_role_data(PS#role_state.id, RoleData),
            Rec = #sc_sign_get_daily{
                is_get = 1,
                daily = Daily,
                acc = Acc
            },
            {ok, Bin} = prot_msg:encode_msg(30404, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_daily(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{is_get := IsGet, daily := Daily, acc := Acc} = RoleData,
    IsGet =:= 0 orelse erlang:throw({error, ?RC_SIGN_REWARD_GOT}),
    SignDay = length(Daily) + 1,
    Conf = conf_daily_sign:get(SignDay),
    Conf =/= undefined orelse erlang:throw({error, ?RC_SIGN_NO_DAILY_CONF}),
    LastDay = get_mon_last_day(time:unixtime()),
    SignDay =< LastDay orelse erlang:throw({error, ?RC_SIGN_ALL_SIGN}),
    #{reward := Reward} = Conf,
    NewDaily = [SignDay | Daily],
    NewIsGet = 1,
    NewAcc = convert_acc_state(Acc, length(NewDaily), []),
    NewRoleData = RoleData#{is_get => NewIsGet, daily => NewDaily, acc => NewAcc},
    {ok, NewRoleData, Reward, NewDaily, NewAcc}.

%% @doc 获取累计签到奖励
get_acc(PS, ID) ->
    case catch check_get_acc(PS, ID) of
        {ok, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_ACC_SIGN),
            update_role_data(PS#role_state.id, RoleData),
            Rec = #sc_sign_get_acc{id = ID},
            {ok, Bin} = prot_msg:encode_msg(30406, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_acc(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{acc := Acc} = RoleData,
    State = util:prop_get_value(ID, Acc, ?REWARD_STATE_NOT),
    State =:= ?REWARD_STATE_CAN orelse erlang:throw({error, ?RC_SIGN_ACC_DAYS_LIMIT}),
    Conf = conf_acc_sign:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_SIGN_NO_ACC_CONF}),
    #{reward := Reward} = Conf,
    NewAcc = util:prop_store(ID, ?REWARD_STATE_GOT, Acc),
    NewRoleData = RoleData#{acc => NewAcc},
    {ok, NewRoleData, Reward}.

%% @doc 补签
buqian(PS) ->
    case catch check_buqian(PS) of
        {ok, RoleData, Reward, Times, BqTimes, Daily, Acc} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_SIGN_BQ),
            update_role_data(PS#role_state.id, RoleData),
            Rec = #sc_sign_bu_qian{
                times = Times,
                bq_times = BqTimes,
                daily = Daily,
                acc = Acc
            },
            {ok, Bin} = prot_msg:encode_msg(30408, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_buqian(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{daily := Daily, acc := Acc, is_get := IsGet, bq_times := BqTimes, times := Times} = RoleData,
    Now = time:unixtime(),
    {{_Y1, _M1, NowDay}, _} = time:unixtime_to_localtime(Now),
    IsGet =:= 1 orelse erlang:throw({error, ?RC_SIGN_NOT_SIGN}),
    SignDay = length(Daily),
    SignDay < NowDay orelse erlang:throw({error, ?RC_SIGN_NOT_CAN_BQ}),
    Times > 0 orelse erlang:throw({error, ?RC_SIGN_NOT_BQ_TIMES}),
    MaxBqTimes = config:get_sys_config(sign_max_bq_times),
    BqTimes < MaxBqTimes orelse erlang:throw({error, ?RC_SIGN_BQ_MAX_TIMES}),
    BqDay = SignDay + 1,
    Conf = conf_daily_sign:get(BqDay),
    Conf =/= undefined orelse erlang:throw({error, ?RC_SIGN_NO_DAILY_CONF}),
    #{reward := Reward} = Conf,
    NewBqTimes = BqTimes + 1,
    NewTimes = Times - 1,
    NewDaily = [BqDay | Daily],
    NewAcc = convert_acc_state(Acc, length(NewDaily), []),
    NewRoleData = RoleData#{daily => NewDaily, acc => NewAcc, bq_times => NewBqTimes, times => NewTimes},
    {ok, NewRoleData, Reward, NewTimes, NewBqTimes, NewDaily, NewAcc}.

%% @doc 跨天操作
cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewRoleData = reset_role_data(RoleData),
    update_role_data(RoleID, NewRoleData).

%% @doc 增加补签次数
add_times(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times} = RoleData,
    NewTimes = Times + 1,
    NewRoleData = RoleData#{times => NewTimes},
    update_role_data(RoleID, NewRoleData),
    Rec = #sc_sign_change{times = NewTimes},
    {ok, Bin} = prot_msg:encode_msg(30409, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

convert_acc_state(List, SDay, Acc) ->
    IDList = conf_acc_sign:get_ids(),
    convert_acc_state(IDList, List, SDay, Acc).

convert_acc_state([], _List, _SDay, Acc) ->
    Acc;
convert_acc_state([ID | T], List, SDay, Acc) ->
    #{day := Day} = conf_acc_sign:get(ID),
    State =
        case util:prop_get_value(ID, List) of
            ?REWARD_STATE_GOT ->
                ?REWARD_STATE_GOT;
            _ when Day =:= 0 ->
                LastDay = get_mon_last_day(time:unixtime()),
                ?iif(length(List) >= LastDay, ?REWARD_STATE_CAN, ?REWARD_STATE_NOT);
            _ when SDay >= Day ->
                ?REWARD_STATE_CAN;
            _ ->
                ?REWARD_STATE_NOT
        end,
    convert_acc_state(T, List, SDay, [{ID, State} | Acc]).

%% 本月最后一天
get_mon_last_day(Now) ->
    {{Year, Month, _}, _} = time:unixtime_to_localtime(Now),
    calendar:last_day_of_the_month(Year, Month).

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_SIGN, [RoleID]),
    case ?DB:get_row(SQL) of
        [DbDaily, DbAcc, BqTimes, IsGet, Times, LastCheck] ->
            Daily = type:convert_db_field(list, DbDaily, []),
            Acc = type:convert_db_field(list, DbAcc, []),
            RoleData = reset_role_data(?role_sign#{
                daily => Daily, acc => Acc, bq_times => BqTimes, is_get => IsGet, last_check => LastCheck, times => Times
            });
        [] ->
            RoleData = ?role_sign#{}
    end,
    set_role_data(RoleID, RoleData).

reset_role_data(RoleData) ->
    #{last_check := LastCheck} = RoleData,
    Now = time:unixtime(),
    {{Y1, M1, D1}, _} = time:unixtime_to_localtime(LastCheck),
    {{Y2, M2, D2}, _} = time:unixtime_to_localtime(Now),
    if
        {Y1, M1} =/= {Y2, M2} ->
            RoleData#{daily => [], acc => [], bq_times => 0, is_get => 0, times => 0, last_check => Now, updated => true};
        {Y1, M1, D1} =/= {Y2, M2, D2} ->
            RoleData#{is_get => 0, bq_times => 0, last_check => Now, updated => true};
        true ->
            RoleData
    end.

save(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            #{daily := Daily, acc := Acc, times := Times, is_get := IsGet, bq_times := BqTimes, last_check := LastCheck} = RoleData,
            DbDaily = type:term_to_bitstring(Daily),
            DbAcc = type:term_to_bitstring(Acc),
            SQL = io_lib:format(?SQL_SET_ROLE_SIGN, [RoleID, DbDaily, DbAcc, BqTimes, IsGet, Times, LastCheck]),
            db:execute(SQL),
            set_role_data(RoleID, RoleData#{updated => false});
        _ ->
            ignore
    end.

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).

gm_add_times(RoleID, Add) ->
    RoleData = get_role_data(RoleID),
    #{times := Times} = RoleData,
    NewTimes = Times + Add,
    NewRoleData = RoleData#{times => NewTimes},
    update_role_data(RoleID, NewRoleData),
    Rec = #sc_sign_change{times = NewTimes},
    {ok, Bin} = prot_msg:encode_msg(30409, Rec),
    lib_role_send:send_to_role(RoleID, Bin),
    ok.

%%gm_add_sign(RoleID) ->
%%    RoleData = get_role_data(RoleID),
%%    #{daily := Daily, acc := Acc} = RoleData,
%%    SignDay = length(Daily) + 1,
%%    LastDay = get_mon_last_day(time:unixtime()),
%%    case SignDay > LastDay of
%%        false ->
%%            NewDaily = [{SignDay, ?REWARD_STATE_CAN} | Daily],
%%
%%    end,
%%gm_reset_bq(RoleID) ->
%%    RoleData = get_role_data(RoleID),
%%    NewRoleData = RoleData#{bq_times => 0},
%%    update_role_data(RoleID, NewRoleData).
