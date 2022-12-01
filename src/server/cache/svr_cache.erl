%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     缓存
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_cache).
-author("Ryuu").

-include("cache.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    insert/4,
    lookup/2,
    delete/2,
    role_delete/2,
    access/2,
    expire_all/0,
    start_link/0,
    check_expire/1
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
    call(info).

p() ->
    dist:whereis_name(?SCORE, ?SERVER).

%% @doc 插入
insert(Type, ID, Val, ValTime) ->
    Now = time:unixtime(),
    CacheItem = #cache_item{
        key = {Type, ID}, type = Type, id = ID, val = Val,
        valid_period = ValTime, last_access = Now
    },
    cast({insert, CacheItem}).

%% @doc 查找
lookup(Type, ID) ->
    Key = {Type, ID},
    call({lookup, Key}).

role_delete(Types, RoleIDs) ->
    cast({role_delete, Types, RoleIDs}).
%% @doc 删除
delete(Type, ID) ->
    Key = {Type, ID},
    cast({delete, Key}).

%% @doc 更新访问时间
access(Type, ID) ->
    Key = {Type, ID},
    cast({access, Key}).

%% @doc 定时检查删除过期条目
check_expire(Time) ->
    cast({check_expire, Time}).

%% @doc 清除所有的数据
expire_all() ->
    cast(expire_all).

call(Request) ->
    ?call(Request).

cast(Request) ->
    ?cast(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
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

do_handle_call({lookup, Key}, _From, State) ->
    Reply = do_lookup(Key),
    {reply, Reply, State};
do_handle_call(info, _From, State) ->
    Reply = do_info(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({insert, CacheItem}, State) ->
    do_update(CacheItem),
    {noreply, State};
do_handle_cast({role_delete, Types, RoleIDs}, State) ->
    lists:foreach(fun(ID) ->
        [do_delete({Type, ID}) || Type <- Types]
    end, RoleIDs),
    {noreply, State};
do_handle_cast({delete, Key}, State) ->
    do_delete(Key),
    {noreply, State};
do_handle_cast({access, Key}, State) ->
    do_access(Key),
    {noreply, State};
do_handle_cast({check_expire, Time}, State) ->
    do_check_expire(Time),
    {noreply, State};
do_handle_cast(expire_all, State) ->
    do_expire_all(),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.

%% @doc 服务信息
do_info() ->
    [
        {cache_num, ets:info(?ETS_CACHE, size)}
    ].

%% @doc 更新缓存内容
do_update(CacheItem) ->
    ets:insert(?ETS_CACHE, CacheItem).

%% @doc 查找
do_lookup(Key) ->
    case ets:lookup(?ETS_CACHE, Key) of
        [CacheItem] ->
            NewCacheItem = CacheItem#cache_item{last_access = time:unixtime()},
            do_update(NewCacheItem),
            {ok, CacheItem#cache_item.val};
        _ ->
            undefined
    end.

%% @doc 删除
do_delete(Key) ->
    ets:delete(?ETS_CACHE, Key).

%% @doc 更新访问时间
do_access(Key) ->
    do_lookup(Key).

%% @doc 过期数据检查
do_check_expire(Time) ->
    MatchSpec = ets:fun2ms(fun(#cache_item{valid_period = ValidPeriod, last_access = LastAccess})
        when ValidPeriod + LastAccess =< Time ->
        true
    end),
    ets:select_delete(?ETS_CACHE, MatchSpec).

%% @doc 清除所有的数据
do_expire_all() ->
    ets:delete_all_objects(?ETS_CACHE).
