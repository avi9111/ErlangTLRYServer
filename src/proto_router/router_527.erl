%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     个人说明信息
%%% @end
%%% Created : 06. 十二月 2018 14:27
%%%-------------------------------------------------------------------
-module(router_527).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_527.hrl").


-export([
    do/3
]).


do(52701, State, #cs_personal_info{}) ->
    case lib_role_introduction:info(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52702, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        _ -> skip
    end;

do(52703, State, #cs_personal_info_change{msg = Msg}) ->
    case catch lib_role_introduction:change_msg(State, Msg) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52704, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).