%%-------------------------------------------------------
%% @File     : router_521
%% @Brief    : 帮派护送协议组
%% @Author   : cablsbs
%% @Date     : 2018-11-23
%%-------------------------------------------------------

-module(router_521).

-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_521.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
% 护送信息请求
do(52101, State, #carry_info_req{}) ->
    lib_role_guild_carry:send_carry_info(State),
    ok;

% 请求接镖
do(52103, State, #book_carry_req{}) ->
    case catch lib_role_guild_carry:book_carry(State) of
        ok ->
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 请求刷镖
do(52105, State, #refresh_carry_req{type = Type}) ->
    case catch lib_role_guild_carry:refresh_carry(State, Type) of
        {ok, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 开始护送
do(52106, State, #start_carry_req{}) ->
    case catch lib_role_guild_carry:start_carry(State) of
        {ok, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 提交护送
do(52107, State, #submit_carry_req{}) ->
    case catch lib_role_guild_carry:submit_carry(State) of
        {ok, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 传送到镖车所在场景
do(52108, State, #transfer_to_carry_req{}) ->
    case catch lib_role_guild_carry:transfer_to_carry(State) of
        {ok, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

%% 处理未定义协议
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).


%% Privates ---------------------------------------------
