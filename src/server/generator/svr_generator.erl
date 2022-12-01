%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     ID生成
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_generator).
-author("Ryuu").

-include("common.hrl").
-include("generator.hrl").

-behaviour(gen_server).

%% API
-export([
    i/1,
    p/1,
    call/2,
    gen_id/1,
    start_link/1,
    gen_mail_id/0,
    gen_role_id/0,
    gen_team_id/0,
    gen_guild_id/0,
    gen_marry_id/0,
    gen_group_id/0,
    gen_market_id/0,
    gen_auction_id/0,
    gen_sworn_group_id/0
]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).


%% =============================================================================
%% API
%% =============================================================================

start_link(ID) ->
    RegName = reg_name(ID),
    gen_server:start_link({local, RegName}, ?MODULE, [ID], []).

i(Type) ->
    call(Type, info).

p(ID) ->
    RegName = reg_name(ID),
    dist:whereis_name(local, RegName).

reg_name(ID) ->
    erlang:list_to_atom(lists:concat(["generator_", ID])).

%% @doc 生成id
gen_id(Type) ->
    call(Type, gen_id).

%% @doc 玩家ID
gen_role_id() ->
    gen_id(?GEN_ROLE).

%% @doc 帮派ID
gen_guild_id() ->
    gen_id(?GEN_GUILD).

%% @doc 婚姻ID
gen_marry_id() ->
    gen_id(?GEN_MARRY).

%% @doc 拍卖行ID
gen_auction_id() ->
    gen_id(?GEN_AUCTION).

%% @doc 队伍ID
gen_team_id() ->
    gen_id(?GEN_TEAM).

%% @doc 群组ID
gen_group_id() ->
    gen_id(?GEN_GROUP).

gen_market_id() ->
    gen_id(?GEN_MARKET).

gen_mail_id() ->
    gen_id(?GEN_MAIL).

%% @doc 结拜组ID
gen_sworn_group_id() ->
    gen_id(?GEN_SWORN_GROUP).

call(Type, Request) ->
    ?call(Type, Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([Type]) ->
    erlang:process_flag(trap_exit, true),
    State = lib_generator:init(Type),
    {ok, State}.

handle_call(info, _From, State) ->
    Reply = lib_generator:info(State),
    {reply, Reply, State};
handle_call(gen_id, _From, State) ->
    {NewState, ID} = lib_generator:gen_id(State),
    {reply, ID, NewState};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================
