%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     逞凶打图
%%% @end
%%% Created : 13. 十一月 2018 14:12
%%%-------------------------------------------------------------------
-module(router_516).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_516.hrl").

-export([
    do/3,
    send_update_info/2
]).


do(51601, State, #cs_daily_robber_info{}) ->
    case lib_role_daily_robber:send_info(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(51602, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin);
        _ -> skip
    end;

do(51603, State, #cs_daily_robber_accept_task{}) ->
    case catch lib_role_daily_robber:accept_task(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(51604, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(51605, State, #cs_daily_robber_abandon_task{}) ->
    case catch lib_role_daily_robber:abandon_task(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(51606, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(51608, State, #cs_daily_robber_submit_task{}) ->
    case catch lib_role_daily_robber:submit_task(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;


do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

send_update_info(RoleSid, MsgRecord) ->
    {ok, Bin} = prot_msg:encode_msg(51607, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin).