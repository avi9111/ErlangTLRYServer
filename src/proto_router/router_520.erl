%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派练功
%%% @end
%%% Created : 21. 十一月 2018 19:49
%%%-------------------------------------------------------------------
-module(router_520).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_520.hrl").

%% API
-export([
    do/3
]).


do(52001, State, #cs_guild_begin_practice{}) ->
    case catch lib_role_guild_practice:begin_practice(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52003, State, #cs_guild_join_in_practice{}) ->
    case catch lib_role_guild_practice:join_in_practice(State) of
        ok ->
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52004, State, #cs_guild_send_team_invite{}) ->
    lib_role_guild_practice:send_team_invite(State),
    ok;


do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).