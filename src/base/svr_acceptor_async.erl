%%%-----------------------------------
%%% @Module         : svr_acceptor_async
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2018.06.15
%%% @Description    : tcp acceptor_async
%%%-----------------------------------
-module(svr_acceptor_async).

-behaviour(gen_server).

-include("common.hrl").

-export([start_link/1]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-record(state, {sock, ref}).


%% Apis -------------------------------------------------
start_link(LSock) ->
    gen_server:start_link(?MODULE, {LSock}, []).


%% Callbacks --------------------------------------------
init({LSock}) ->
    gen_server:cast(self(), 'accept_async'),
    {ok, #state{sock=LSock}}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast('accept_async', State) ->
    accept_async(State);

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info({'inet_async', LSock, Ref, {ok, Sock}}, State = #state{sock=LSock, ref=Ref}) ->
    case set_sockopt(LSock, Sock) of
        ok -> ok;
        {error, Reason} -> exit({set_sockopt, Reason})
    end,
    try
        start_client(Sock)
    catch
        Type:Error ->
            ?ERROR("start_client(~p) error !~nType:~p, Error:~p", [Sock, Type, Error])
    end,
    accept_async(State);

handle_info({'inet_async', LSock, Ref, {error, closed}}, State=#state{sock=LSock, ref=Ref}) ->
    {stop, normal, State};

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, State) ->
    gen_tcp:close(State#state.sock),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
% @doc 设置socket
set_sockopt(LSock, Sock) ->
    true = inet_db:register_socket(Sock, inet_tcp),
    case prim_inet:getopts(LSock, [nodelay, keepalive, delay_send, priority, tos]) of
        {ok, Opts} ->
            case prim_inet:setopts(Sock, Opts) of
                ok ->
                    ok;
                Error ->
                    ?ERROR("Socket: ~p set_sockopt error, Error:~p", [Sock, Error]),
                    gen_tcp:close(Sock),
                    Error
            end;
        Error ->
            ?ERROR("Socket: ~p cannot accept, close it !!!~nError: ~p", [LSock, Error]),
            gen_tcp:close(Sock),
            Error
    end.

% @doc 异步接受连接
accept_async(State = #state{sock=LSock}) ->
    case prim_inet:async_accept(LSock, -1) of
        {ok, Ref} ->
            {noreply, State#state{ref=Ref}};
        Error ->
            {stop, {cannot_accept, Error}, State}
    end.

% @doc 开启客户端服务
start_client(Sock) ->
    {ok, Child} = supervisor:start_child(sup_route, []),
    ok = gen_tcp:controlling_process(Sock, Child),
    Child ! {ok, Sock}.
