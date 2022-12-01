%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     排行榜
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_rank).
-author("Ryuu").

-include("rank.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/1,
    p/1,
    cast/2,
    call/2,
    stop/1,
    get_rank/3,
    get_rank/4,
    clear_rank/1,
    reset_rank/2,
    start_link/1,
    delete_rank/2,
    update_rank/3,
    refresh_rank/1,
    % get_cross_rank/5,
    get_target_rank/3
]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    do_handle_call/3,
    do_handle_cast/2,
    terminate/2,
    code_change/3
]).

-define(SCOPE, local).
-define(SERVER, ?MODULE).

-record(state, {type = 0}).

%% =============================================================================
%% API
%% =============================================================================

start_link(RankID) ->
    RegName = get_reg_name(RankID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [RankID], []).

%% @doc 停止
stop(RankID) ->
    cast(RankID, {'stop', RankID}).

%% @doc 获取排行榜
get_rank(RankID, Page, Key) ->
    call(RankID, {'get_rank', RankID, Page, Key}).

%% @doc 获取排行榜 [异步]
get_rank(RoleID, RankID, Page, Key) ->
    cast(RankID, {'get_rank', RoleID, RankID, Page, Key}).

%% @doc 获取玩家排行榜排名
get_target_rank(RoleID, RankID, Key) ->
    cast(RankID, {'get_target_rank', RoleID, RankID, Key}).

% %% @doc 获取跨服排行榜
% get_cross_rank(SvrNum, RoleID, RankID, Page, Key) ->
%     cast(RankID, {'get_cross_rank', SvrNum, RoleID, RankID, Page, Key}).

%% @doc 更新排行榜
update_rank(RankID, Key, Val) ->
    cast(RankID, {'update_rank', RankID, Key, Val}).

delete_rank(RankID, Key) ->
    cast(RankID, {'delete_rank', RankID, Key}).

%% @doc 刷新排行榜
refresh_rank(RankID) ->
    cast(RankID, {'refresh_rank', RankID}).

%% @doc 清除排行榜
clear_rank(RankID) ->
    cast(RankID, {'clear_rank', RankID}).

%% @doc 重置排行榜
reset_rank(RankID, RankList) ->
    cast(RankID, {'reset_rank', RankID, RankList}).

%% @doc 排行榜信息
i(RankID) ->
    call(RankID, {'info', RankID}).

%% @doc 进程ID
p(RankID) ->
    RegName = get_reg_name(RankID),
    dist:whereis_name(?SCOPE, RegName).

%% @doc cast
cast(RankID, Request) ->
    ?cast(RankID, Request).

%% @doc call
call(RankID, Request) ->
    ?call(RankID, Request).

%% @doc 注册名
get_reg_name(RankID) ->
    erlang:list_to_atom(lists:concat(["rank_", RankID])).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([RankID]) ->
    erlang:process_flag(trap_exit, true),
    {ok, #state{type = RankID}}.

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

do_handle_call({'get_rank', RankID, Page, Key}, _From, State) ->
    Reply = lib_rank:get_rank(RankID, Page, Key),
    {reply, Reply, State};
do_handle_call({'info', RankID}, _From, State) ->
    Reply = lib_rank:info(RankID),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast('timer_refresh', State) ->
    lib_rank:timer_refresh(State#state.type),
    {noreply, State};
do_handle_cast('refresh_rank', State) ->
    lib_rank:refresh_rank(State#state.type),
    {noreply, State};
do_handle_cast({'refresh_rank', RankID}, State) ->
    lib_rank:refresh_rank(RankID),
    {noreply, State};
do_handle_cast({'role_delete', RoleIDs}, State) ->
    lib_rank:role_delete(State#state.type, RoleIDs),
    {noreply, State};
do_handle_cast({'stop', _RankID}, State) ->
    {stop, normal, State};
do_handle_cast({'clear_rank', RankID}, State) ->
    lib_rank:clear_rank(RankID),
    {noreply, State};
do_handle_cast({'reset_rank', RankID, RankList}, State) ->
    lib_rank:reset_rank(RankID, RankList),
    {noreply, State};
do_handle_cast({'update_rank', RankID, Key, Val}, State) ->
    lib_rank:update_rank(RankID, Key, Val),
    {noreply, State};
do_handle_cast({'delete_rank', RankID, Key}, State) ->
    lib_rank:delete_rank(RankID, Key),
    {noreply, State};
do_handle_cast({'get_rank', RoleID, RankID, Page, Key}, State) ->
    lib_rank:get_rank(RoleID, RankID, Page, Key),
    {noreply, State};
do_handle_cast({'get_target_rank', RoleID, RankID, Key}, State) ->
    lib_rank:get_role_target_rank(RoleID, RankID, Key),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
