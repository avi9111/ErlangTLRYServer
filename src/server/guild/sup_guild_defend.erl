%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派守卫战
%%% @end
%%% Created : 24. 十月 2018 15:22
%%%-------------------------------------------------------------------
-module(sup_guild_defend).

-behaviour(supervisor).

%% API
-export([
    info_all/1,
    stop_all/0,
    start_link/0,
    stop_child/1,
    start_child/1,
    children_procs/0
]).

%% Supervisor callbacks
-export([
    init/1
]).

-define(SERVER, ?MODULE).

%% =============================================================================
%% API functions
%% =============================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% @doc 启动帮派守卫战进程 每个符合条件的帮派一个进程
start_child(GuildID) ->
    supervisor:start_child(?SERVER, [GuildID]).

%% @doc 结束一个分组管理进程 [simple_one_for_one]
stop_child(Pid) ->
    _ = supervisor:terminate_child(?SERVER, Pid).

stop_all() ->
    [stop_child(Proc) || Proc <- children_procs()],
    check_clean_data().

%% @doc 检查并清理数据
check_clean_data() ->
    WorkersNum = workers_num(),
    WorkersNum =:= 0 andalso lib_role_guild_defend:clean_up().

workers_num() ->
    Counts = supervisor:count_children(?SERVER),
    util:prop_get_value(workers, Counts, 0).

%% @doc 向所有Boss进程发送消息
info_all(Info) ->
    [Pid ! Info || Pid <- children_procs()].

children_procs() ->
    [Child || {_Id, Child, _Type, _Modules} <- supervisor:which_children(?SERVER)].
%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    AChild = {'svr_guild_defend', {'svr_guild_defend', start_link, []},
        permanent, 2000, worker, ['svr_guild_defend']},

    {ok, {SupFlags, [AChild]}}.

%% =============================================================================
%% Internal functions
%% =============================================================================