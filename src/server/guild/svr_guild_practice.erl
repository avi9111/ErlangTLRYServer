%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派练功
%%% @end
%%% Created : 21. 十一月 2018 10:13
%%%-------------------------------------------------------------------
-module(svr_guild_practice).

-behaviour(gen_server).

-author("Tom").
-include("common.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("guild_practice.hrl").

-define(TIMEOUT, 10000).
-define(SERVER, ?MODULE).

%% External API
-export([
    prepare_activity/1,
    start_activity/1,
    stop_activity/1,
    start_link/1
]).

% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

%% API
-export([
    get_lv_gap/1,
    set_lv_gap/2,

    do_handle_cast/2,
    do_handle_call/3
]).

% --------------------------------------------------------------------
% External API
% --------------------------------------------------------------------
%% 活动准备
prepare_activity(_Activity) ->
%%    io:format("~p.prepare_activity.~n", [?MODULE]),
    %% 全服广播练功即将开始的传闻
    svr_rumor:publish(world, ?RUMOR_PREPARE_PRACTICE),
    ok.

%% 开启活动
start_activity(_Activity) ->
    sup_activity:stop_activity(?SERVER), %% 有可能运营没有停止上一个运营活动就，开启下一个的不同活动，确保停掉上一个活动
    Child = {?SERVER, {?MODULE, start_link, [_Activity]},
        transient, ?TIMEOUT, worker, [?MODULE]},
    _ = sup_activity:start_activity(Child),
    start_event().

%% 停止活动
stop_activity(_Activity) ->
    sup_activity:stop_activity(?SERVER),
    stop_event().

start_link(Activity) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [Activity], []).

start_event() -> ok.

stop_event() -> ok.

%%--------------------------功能调用接口-----------------------------------
%% @doc 获取等级差
get_lv_gap(TeamID) ->
    call({get_lv_gap, TeamID}).

%% @doc 设置等级差
set_lv_gap(TeamID, LvGap) ->
    cast({set_lv_gap, TeamID, LvGap}).

%%------------------------------------------------------------------------

call(Req) ->
    case dist:whereis_name(local, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Req, ?TIMEOUT);
        _ -> {error, ?RC_ACTIVITY_NOT_GOING}
    end.

cast(Req) ->
    case dist:whereis_name(local, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Req),
            ok;
        _ -> {error, ?RC_ACTIVITY_NOT_GOING}
    end.

% --------------------------------------------------------------------
% Function: init/1
% Description: Initiates the server
% Returns: {ok, State}          |
%          {ok, State, Timeout} |
%          ignore               |
%          {stop, Reason}
% --------------------------------------------------------------------
init([Activity]) ->
    {ok, State} = init_state(Activity),
    NewState1 = init_data(State),
    %% 全服广播练功已经开始的传闻
    svr_rumor:publish(world, ?RUMOR_BEGIN_PRACTICE),

    erlang:process_flag(trap_exit, true),
    {ok, NewState1}.

init_state(Activity) ->
    StartTime = lib_activity:get_start_time(Activity),
    EndTime = lib_activity:get_end_time(Activity),
    State = #guild_practice{start_time = StartTime, end_time = EndTime},
%%    io:format("guild_practice: StartTime=~w, EndTime=~w~n", [StartTime, EndTime]),
    {ok, State}.

init_data(State) ->
    State.

%%---------------------gen_server callback--------------------------------------
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



do_handle_call({get_lv_gap, TeamID}, _From, #guild_practice{gap_lv_list = GapLvList} = State) ->
    {_, LvGap} = util:list_find(TeamID, 1, GapLvList, {0, 0}),
    {reply, LvGap, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.



do_handle_cast({set_lv_gap, TeamID, LvGap}, #guild_practice{gap_lv_list = GapLvList} = State) ->
    GapLvListN = lists:keystore(TeamID, 1, GapLvList, {TeamID, LvGap}),
    StateN = State#guild_practice{gap_lv_list = GapLvListN},
    {noreply, StateN};
do_handle_cast(_Request, State) ->
    {noreply, State}.