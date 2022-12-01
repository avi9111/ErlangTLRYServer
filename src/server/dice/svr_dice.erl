%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     骰子
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_dice).
-author("Ryuu").

-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    start_link/0,
    create_dice/3,
    roll_dice/3,
    loop/1,
    i/0
]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    do_handle_call/3,
    do_handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-record(state, {}).

%% Apis -------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%% @doc 创建骰子
create_dice(Targets, ValidTime, Callback) ->
    gen_server:call(?MODULE, {'create_dice', Targets, ValidTime, Callback}).

%% @doc 投掷骰子
roll_dice(RoleID, RoleName, DiceID) ->
    gen_server:call(?MODULE, {'roll_dice', RoleID, RoleName, DiceID}).

%% @doc 秒循环
loop(Now) ->
    gen_server:cast(?MODULE, {'loop', Now}).

%% @doc 服务状态
i() ->
    gen_server:call(?MODULE, 'info').


%% Callbacks --------------------------------------------
init([]) ->
    erlang:process_flag(trap_exit, true),
    erlang:put(dict_id, 0),
    {ok, #state{}}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
do_handle_call({'create_dice', Targets, ValidTime, Callback}, _From, State) ->
    Reply = lib_dice:create_dice(Targets, ValidTime, Callback),
    {reply, Reply, State};
do_handle_call({'roll_dice', RoleID, RoleName, DiceID}, _From, State) ->
    Reply = lib_dice:roll_dice(RoleID, RoleName, DiceID),
    {reply, Reply, State};
do_handle_call('info', _From, State) ->
    Reply = lib_dice:info(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast('loop', State) ->
    Now = time:unixtime(),
    lib_dice:loop(Now),
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_dice:loop(Now),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
