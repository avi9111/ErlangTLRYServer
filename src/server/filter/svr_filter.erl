%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     过滤词
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_filter).
-author("Ryuu").

-include("filter.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-export([
    call/1,
    cast/1,
    load_word/1,
    start_link/0,
    delete_word/1,
    load_word_group/0,
    load_word_group/1,
    match_word_group/1,
    update_all_words/0,
    delete_word_group/0,
    delete_word_group/1
]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SERVER, ?MODULE).
-record(state, {}).

%% -----------------------------------------------------------------------------
%% 接口
%% -----------------------------------------------------------------------------

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% @doc 更新所有词库
update_all_words() ->
    cast(update_all_words).

%% @doc 加载单个词
load_word(ID) ->
    cast({load_word, ID}).

%% @doc 删除一个词
delete_word(Word) ->
    cast({delete_word, Word}).

%% @doc 加载所有词组
load_word_group() ->
    cast(load_word_group).

%% @doc 加载单个词组
load_word_group(ID) ->
    cast({load_word_group, ID}).

%% @doc 删除所哟过滤词组
delete_word_group() ->
    cast(delete_word_group).

%% @doc 删除过滤词组
delete_word_group(ID) ->
    cast({delete_word_group, ID}).

%% @doc 是否匹配过滤词组
match_word_group(Talk) ->
    call({match_word_group, Talk}).

%% @doc call
call(Info) ->
    case erlang:whereis(?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Info);
        _ ->
            {error, ?RC_SERVICE_UNAVAILABLE}
    end.

%% @doc cast
cast(Info) ->
    case erlang:whereis(?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Info);
        _ ->
            ignore
    end.

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    erlang:send_after(1000, self(), init_for_start),
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

do_handle_call({match_word_group, Talk}, _From, State) ->
    Reply = match_word_group(Talk),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(init_for_start, State) ->
    lib_filter:init(),
    {noreply, State};
do_handle_cast({delete_word, Word}, State) ->
    lib_filter:delete_word(Word),
    {noreply, State};
do_handle_cast(update_all_words, State) ->
    lib_filter:update_all(),
    {noreply, State};
do_handle_cast({load_word, ID}, State) ->
    lib_filter:import_words_by_id(ID),
    {noreply, State};
do_handle_cast(delete_word_group, State) ->
    lib_filter:delete_word_group(),
    {noreply, State};
do_handle_cast({delete_word_group, ID}, State) ->
    lib_filter:delete_word_group(ID),
    {noreply, State};
do_handle_cast(load_word_group, State) ->
    lib_filter:load_word_groups(),
    {noreply, State};
do_handle_cast({load_word_group, ID}, State) ->
    lib_filter:load_word_group(ID),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
