%%-------------------------------------------------------
%% @File     : svr_change_scene.erl
%% @Brief    : 排队切场景进程
%% @Author   : cablsbs
%% @Date     : 2018-11-15
%%-------------------------------------------------------
-module(svr_change_scene).

-behaviour(gen_server).

-include("common.hrl").

-export([
    start_link/0,
    push/1
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-record(state, {
    change_list = [],
    loop_ref = undefined
}).


%% Apis -------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

push(ChangeSceneCmd) ->
    gen_server:cast(?MODULE, {'push', ChangeSceneCmd}).


%% Callbacks --------------------------------------------
init([]) ->
    process_flag(trap_exit, true),
    Ref = start_loop(60000),
    {ok, #state{loop_ref = Ref}}.

% 默认匹配
handle_call(Req, _From, State) ->
    ?ERROR("Recv unexpected call request: ~p", [Req]),
    {reply, undefined, State}.

% 切场景
handle_cast({'push', ChangeSceneCmd}, State) ->
    ChangeListN = [ChangeSceneCmd | State#state.change_list],
    {noreply, State#state{change_list = ChangeListN}};

% 默认匹配
handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

% 循环处理
handle_info('loop', State) ->
    NowTimeMS = time:unixtime_ms(),
    PartFun = fun({Time, _Cmd}) -> Time =< NowTimeMS end,
    {ToHandle, RestCmds} = lists:partition(PartFun, State#state.change_list),
    [
        lib_role:apply_cast2(RoleId, {lib_scene_api, change_scene, ChangeSceneArgs})
        || {_Time, [RoleId | ChangeSceneArgs]} <- ToHandle
    ],
    StateN = State#state{
        change_list = RestCmds,
        loop_ref = start_loop(200)
    },
    {noreply, StateN};

% 默认匹配
handle_info(Info, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Info]),
    {noreply, State}.

terminate(shutdown, _State) ->
    ok;
terminate(Reason, State) ->
    ?ERROR("Terminate with Reason: ~p, State: ~p", [Reason, State]).

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
start_loop(Time) ->
    erlang:send_after(Time, self(), 'loop').
