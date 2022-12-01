%%%-----------------------------------
%%% @Module         : svr_acceptor_sync
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2018.06.05
%%% @Description    : tcp acceptor_sync
%%%-----------------------------------
-module(svr_acceptor_sync).

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

-record(state, {sock}).


%% Apis -------------------------------------------------
start_link(LSock) ->
    gen_server:start_link(?MODULE, {LSock}, []).


%% Callbacks --------------------------------------------
init({LSock}) ->
    gen_server:cast(self(), 'accept'),
    {ok, #state{sock=LSock}}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

%% 同步接受连接
handle_cast('accept', #state{sock=LSock} = State) ->
    case gen_tcp:accept(LSock) of
        {ok, Sock} ->
            case set_sockopt(LSock, Sock) of
                ok -> ok;
                {error, Reason} -> exit({set_sockopt, Reason})
            end,
            try
                start_client(Sock)
            catch
                Type:Error ->
                    ?ERROR(
                        "\nstart_sync_client error, Type:~p, Error:~p~nStarcktrace:~p",
                        [Type, Error, erlang:get_stacktrace()]
                    )
            end,
            gen_server:cast(self(), 'accept'),
            {noreply, State};
        Error ->
            ?ERROR("Socket: ~p cannot accept, close it !!!~nError: ~p", [LSock, Error]),
            {stop, {cannot_accept, Error}, State}
    end;

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, State) ->
    gen_tcp:close(State#state.sock),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
%% 设置socket
set_sockopt(LSock, Sock) ->
    case inet:getopts(LSock, [nodelay, keepalive, delay_send, priority, tos]) of
        {ok, Opts} ->
            case inet:setopts(Sock, [{active, false} | Opts]) of
                ok    ->
                    ok;
                Error ->
                    ?ERROR(
                        "\nset_sockopt error, Error:~p~nStarcktrace:~p",
                        [Error, erlang:get_stacktrace()]
                    ),
                    gen_tcp:close(Sock),
                    Error
            end;
        Error ->
            ?ERROR("Socket: ~p cannot accept, close it !!!~nError: ~p", [LSock, Error]),
            gen_tcp:close(Sock),
            Error
    end.


%% 开启客户端服务
start_client(Sock) ->
    {ok, Child} = supervisor:start_child(sup_route, []),
    ok = gen_tcp:controlling_process(Sock, Child),
    Child ! {ok, Sock}.
