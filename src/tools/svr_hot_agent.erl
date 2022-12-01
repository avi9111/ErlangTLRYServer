%%-------------------------------------------------------
%% @File     : svr_hot_agent
%% @Brief    : 热更代理模块
%% @Author   : cablsbs
%% @Date     : 2018-9-21
%%-------------------------------------------------------
-module(svr_hot_agent).

-behaviour(gen_server).

-include("log.hrl").

-export([
    start_link/0,
    hot/0
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).



%% Apis -------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

hot() ->
    gen_server:cast(?MODULE, 'hot_reload').


%% Callbacks --------------------------------------------
init([]) ->
    {ok, ?MODULE}.

handle_call(_Msg, _From, State) ->
    {reply, reply, State}.

handle_cast('hot_reload', State) ->
    ?INFO("Recv hot_reload request, start hot ..."),
    case hot:hot_reload() of
        [] ->
            skip;
        ChangedMods ->
            Fmt = lists:flatten(["~p~n" || _ <- ChangedMods]),
            ?INFO("Successfully hot the following Modules:~n"++Fmt, ChangedMods)
    end,
    {noreply, State}.

handle_info(_Msg, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
