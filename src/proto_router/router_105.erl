%%-------------------------------------------------------
%% @File     : router_105
%% @Brief    : 通用
%% @Author   : cablsbs
%% @Date     : 2018-7-5
%%-------------------------------------------------------

-module(router_105).

-include("log.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_105.hrl").

-export([
    do/3,
    response/3,

    refresh_world_lv/0,
    send_commonly_keyvalue/3
]).


%% Apis -------------------------------------------------
do(10503, #role_state{sid = RoleSid, time_data = TimeData}, #cs_get_op_and_mer_day{}) ->
    #time_data{login_days = LoginDays} = TimeData,
    OpenDay = util:get_open_days(),
    MergeDay = util:get_merge_days(),
    MsgRecord = #sc_get_op_and_mer_day{op_day = OpenDay, merge_day = MergeDay, login_days = LoginDays},
    {ok, Bin} = prot_msg:encode_msg(10504, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok;
do(10505, #role_state{id = RoleId, sid = RoleSid}, #cs_get_commonly_key_value{key = Key}) ->
    Value = lib_role_kv:get_kv(RoleId, Key),
    send_commonly_keyvalue(RoleSid, Key, Value),
    ok;
do(10507, #role_state{id = RoleId}, #cs_set_commonly_key_value{key = Key, value = Value}) ->
    case Key >= ?KEY_SETTABLE_BEG andalso Key =< ?KEY_SETTABLE_END of
        true -> lib_role_data:put_value(RoleId, Key, Value);
        false -> skip
    end,
    ok;
do(10508, #role_state{sid = RoleSid}, #cs_get_world_lv{}) ->
    lib_role_send:send_to_sid(RoleSid, world_level_bin());
do(10510, #role_state{sid = RoleSid} = PS, #cs_today_onlie_time{}) ->
    TodayOnlineTime = lib_role:get_today_online(PS),
    Msg = #sc_today_onlie_time{today_online_time = TodayOnlineTime},
    {ok, Bin} = prot_msg:encode_msg(10511, Msg),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok;
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).

send_commonly_keyvalue(RoleSid, Key, Value) when not is_integer(Value) ->
    send_commonly_keyvalue(RoleSid, Key, 0);
send_commonly_keyvalue(RoleSid, Key, Value) ->
    MsgRecord = #sc_get_commonly_key_value{
        key = Key, value = Value
    },
    {ok, Bin} = prot_msg:encode_msg(10506, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin).

refresh_world_lv() ->
    lib_role_send:broadcast(world_level_bin()).

world_level_bin() ->
    WorldLv = util_svr:get_world_lv(),
    PioneerLv = util_svr:get_pioneer_lv(),
    Msg = #sc_get_world_lv{world_lv = WorldLv, pioneer_lv = PioneerLv},
    {ok, Bin} = prot_msg:encode_msg(10509, Msg),
    Bin.
