%%%-----------------------------------
%%% @Module         : svr_listener
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2018.06.05
%%% @Description    : tcp listener
%%%-----------------------------------
-module(svr_listener).

-behaviour(gen_server).

-export([
    start_link/2
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).


-ifdef(async_net).

-define(TCP_OPTIONS, [
    binary,
    {packet, raw},
    {active, false},
    {reuseaddr, true},
    {nodelay, false},
    {delay_send, true},
    {send_timeout, 10000},
    {keepalive, true},
    {exit_on_close, true}
]).

-else.

-define(TCP_OPTIONS, [
    binary,
    {packet, raw},
    {active, false},
    {reuseaddr, true},
    {nodelay, false},
    {delay_send, true},
    {send_timeout, 10000},
    {keepalive, true},
    {exit_on_close, true}
]).

-endif.

%% Apis ----------------------------------------------------------
start_link(AcceptorCount, Port) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, {AcceptorCount, Port}, []).


%% Callbacks -----------------------------------------------------
init({AcceptorCount, Port}) ->
    process_flag(trap_exit, true),
    case gen_tcp:listen(Port, ?TCP_OPTIONS) of
        {ok, LSock} ->
            StartChildFun = fun(_) ->
                {ok, _APid} = supervisor:start_child(sup_acceptor, [LSock])
            end,
            lists:foreach(StartChildFun, lists:duplicate(AcceptorCount, dummy)),
            {ok, LSock};
        {error, Reason} ->
            {stop, {cannot_listen, Reason}}
    end.

handle_call(_Request, _From, State) ->
    {reply, State, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, State) ->
    gen_tcp:close(State),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ------------------------------------------------------
