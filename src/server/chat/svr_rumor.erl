%%%-----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     传闻
%%% @end
%%%-----------------------------------------------------------------------------
-module(svr_rumor).
-author("Ryuu").

-include("rumor.hrl").
-include("common.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    cast/1,
    loop/1,
    publish/2,
    publish/3,
    re_init/0,
    start_link/0,
    gm_del_rumor/1,
    gm_rumor_change/1,
    public_loop_rumor/4
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    code_change/3,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SERVER, ?MODULE).
-define(SCORE, local).

-record(state, {}).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({?SCORE, ?SERVER}, ?MODULE, [], []).

%% @doc 服务信息
i() ->
    ?call(info).

p() ->
    dist:whereis_name(?SCORE, ?SERVER).

%% @doc 发布传闻 [后端只填参数，前端负责格式化]
publish(Scope, TempID) ->
    Rumor = lib_rumor:format(Scope, TempID),
    publish(Rumor).

publish(Scope, TempID, Args) ->
    Rumor = lib_rumor:format(Scope, TempID, Args),
    publish(Rumor).

publish(Rumor) ->
    is_record(Rumor, rumor) andalso cast({publish, Rumor}).

%% @doc 发送循环传闻
public_loop_rumor(Content, BeginTime, Interval, EndTime) ->
    Rumor = #rumor{
        type = ?RUMOR_TYPE_LOOP, temp_id = 0, scope = world, args = [Content],
        begin_time = BeginTime, end_time = EndTime, interval = Interval
    },
    cast({publish, Rumor}).

%% @doc 秒循环
loop(Now) ->
    cast({loop, Now}).

%% @doc 重新初始化 [gm]
re_init() ->
    cast(re_init).

%% @doc 传闻变化 [gm, 数据库中读取]
gm_rumor_change(ID) ->
    cast({rumor_change, ID}).

%% @doc 删除传闻 [gm]
gm_del_rumor(ID) ->
    Key = {?RUMOR_CATEGORY_GM, ID},
    cast({del_rumor, Key}).

cast(Request) ->
    ?cast(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    erlang:send_after(1000, self(), init_for_start),
    svr_timer:register(),
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

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call(info, _From, State) ->
    Reply = lib_rumor:info(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({loop, Now}, State) ->
    lib_rumor:loop(Now),
    {noreply, State};
do_handle_cast({publish, Rumor}, State) ->
    lib_rumor:publish(Rumor),
    {noreply, State};
do_handle_cast(init_for_start, State) ->
    lib_rumor:init_for_start(),
    {noreply, State};
do_handle_cast(re_init, State) ->
    lib_rumor:re_init(),
    {noreply, State};
do_handle_cast({del_rumor, Key}, State) ->
    lib_rumor:del_rumor(Key),
    {noreply, State};
do_handle_cast({rumor_change, ID}, State) ->
    lib_rumor:rumor_change(ID),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
