%%-------------------------------------------------------
%% @File     : svr_global_timer
%% @Brief    : 全局使用的定时器(不做集体逻辑，只做定时通知)
%% @Author   : cablsbs
%% @Date     : 2018-7-5
%%--------------------------------------------------------
-module(svr_global_timer).

-include("log.hrl").
-include("common.hrl").

-behaviour(gen_server).

-export([
    start_link/1,
    stop/0
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

% state 定义
-record(sl_timer, {
    node_id = 0
}).


%% Apis --------------------------------------------------
%% 启动服务器
start_link(NodeId) ->
    ?INFO("Starting [~w] ...", [?MODULE]),
    gen_server:start_link({local, ?MODULE}, ?MODULE, [NodeId], []).

%% 关闭服务器时回调
stop() ->
    ?INFO("Stoping [~w] ...", [?MODULE]),
    gen_server:cast(?MODULE, 'stop').


%% Callbacks ---------------------------------------------
init([NodeId]) ->
    {_H, _M, S} = time(),
    erlang:send_after(60000 - S * 1000, self(), 'loop'),
    {ok, #sl_timer{node_id = NodeId}}.

handle_call(_Msg, _From, State) ->
    {reply, reply, State}.

handle_cast('stop', State) ->
    {stop, normal, State};

handle_cast(_Msg, State) ->
    {noreply, State}.

% 每分钟loop
handle_info('loop', State) ->
    erlang:send_after(60000, self(), 'loop'),
    do_loop_logic(State#sl_timer.node_id),
    {noreply, State};

handle_info(_Msg, State) ->
    {noreply, State}.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

terminate(Reason, State) ->
    (Reason =:= normal orelse Reason =:= shutdown) orelse
        ?ERROR("~p terminate with reason: ~p~nstate: ~p", [?MODULE, Reason, State]),
    ok.


%% Privates ----------------------------------------------
do_loop_logic(NodeId) ->
    {H, M, _S} = time(),
    Now = time:unixtime(),
    do_minutely_logic(NodeId, Now),
    Date = date(),
    DayOfWeek = calendar:day_of_the_week(Date),
    do_activity_logic(DayOfWeek, H, M),
    M =:= 0 andalso do_hourly_logic(NodeId, DayOfWeek, H),
    H =:= 0 andalso M =:= 0 andalso begin
        do_daily_logic(NodeId),
        do_weekly_logic(NodeId, DayOfWeek)
    end.

%% 游戏服每分钟触发的逻辑
do_minutely_logic(?NODE_ID_GAME, _Now) ->
    ok;
%% 跨服中心每分钟触发的逻辑
do_minutely_logic(?NODE_ID_KFCENTER, _Now) ->
    ok.

%% 游戏服每小时触发的逻辑
do_hourly_logic(?NODE_ID_GAME, DayOfWeek, H) ->
    svr_rank_mgr:refresh_rank(),
    DayOfWeek =< 5 andalso H =:= 12 andalso svr_territory:daily_auction(),
    ok;
%% 跨服中心每小时触发的逻辑
do_hourly_logic(?NODE_ID_KFCENTER, _, _H) ->
    ok.

%% TODO 扁平化通知
%% 游戏服每天0点触发逻辑
do_daily_logic(?NODE_ID_GAME) ->
    ?INFO("svr_logic_timer, do_daily_logic"),
    svr_role_agent:info_online('zero_hour'),
    svr_global_data:daily_clear(),
    svr_examine:daily_clear(),
    router_105:refresh_world_lv(),
    svr_guild_mgr:cross_day_reset(),
    svr_hero_dungeon:refresh(),
    ok;
%% 跨服中心每天0点触发逻辑
do_daily_logic(?NODE_ID_KFCENTER) ->
    ?INFO("svr_logic_timer, do_daily_logic"),
    ok.

%% 游戏服每周任一天0点执行一次逻辑
do_weekly_logic(?NODE_ID_GAME, WD) ->
    if
        WD =:= 1 -> %% 周一0点
            svr_guild_mgr:guild_weekly_reset(),
            ok;
        WD =:= 6 ->
            svr_territory:reset_round(),
            ok;
        true -> % 其他
            ok
    end;
%% 跨服中心每周任一天0点执行一次逻辑
do_weekly_logic(?NODE_ID_KFCENTER, WD) ->
    if
        WD =:= 2 -> %% 周二0点
            ok;
        true -> % 其他
            ok
    end.

%% 活动相关逻辑 每周任意一天的任意一个时间点
do_activity_logic(_DayOfWeek, H, M) ->
    if
        H =:= 0 andalso M =:= 10 -> %% 每天0点10分
            lib_role_dividend:top_guild_reward();
        true ->
            skip
    end.
