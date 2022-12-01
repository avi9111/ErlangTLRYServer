%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     师徒系统
%%% @end
%%% Created : 28. 二月 2019 16:33
%%%-------------------------------------------------------------------
-module(svr_mentor).
-author("Tom").

-behaviour(gen_server).

-include("common.hrl").
-include("mentor.hrl").
-include("friend.hrl").
-include("ret_code.hrl").


%% API
-export([
    start_link/0
]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_cast/2,
    do_handle_call/3
]).

-export([
    permanent/0,
    get_person/1,
    update_person/1,
    delete_person/1,
    confirm_start/3,
    get_confirm_data/2,
    get_rand_persons/4,
    save_person_to_db/1,
    clear_confirm_data/2
]).

-define(TIMEOUT, 10000).
-define(SERVER, ?MODULE).


%%%===================================================================
%%% API
%%%===================================================================
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%%%===================================================================
%%% External functions
%%%===================================================================
%% @doc 持久化离线数据
permanent() ->
    cast('permanent').

%% @doc 获取师父数据
get_person(0) ->
    undefined;
get_person(MentorID) ->
    call({'get_person', MentorID}).

%% @doc 更新师父数据
update_person(MentorPerson) ->
    cast({'update_person', MentorPerson}).

%% @doc 删除师父数据
delete_person(MentorID) ->
    cast({'delete_person', MentorID}).

%% @doc 发起确认
confirm_start(Type, Key, ConfirmData) ->
    cast({'confirm_start', Type, Key, ConfirmData}).

%% @doc 获取确认缓存
get_confirm_data(Type, Key) ->
    call({'get_confirm_data', Type, Key}).

%% @doc 清除确认缓存
clear_confirm_data(Type, Key) ->
    cast({'clear_confirm_data', Type, Key}).

%% @doc 获取随机的师父列表
get_rand_persons(RoleID, Lv, Number, QuizList) ->
    call({'get_rand_persons', RoleID, Lv, Number, QuizList}).

%% @doc 持久化师父数据
save_person_to_db(MentorID) ->
    cast({'save_person_to_db', MentorID}).

%%%===================================================================
%%% Internal functions
%%%===================================================================
pid() ->
    case dist:whereis_name(local, ?SERVER) of
        Pid when is_pid(Pid) -> Pid;
        _ -> erlang:throw({error, ?RC_SYS_ERROR})
    end.

call(Req) ->
    gen_server:call(pid(), Req, ?TIMEOUT).

cast(Req) ->
    gen_server:cast(pid(), Req).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init([]) ->
    erlang:process_flag(trap_exit, true),
    erlang:send_after(?SAVE_CACHE_INTERVAL, self(), 'save_cache'),
    erlang:send_after(?MENTOR_LOGIC_INTERVAL, self(), 'logic_tick'),
    lib_mentor:init_cache(),
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


do_handle_call({'get_person', MentorID}, _From, State) ->
    Reply = lib_mentor:get_person(MentorID),
    {reply, Reply, State};
do_handle_call({'get_confirm_data', Type, Key}, _From, State) ->
    Data = lib_mentor:get_confirm_data(Type, Key),
    {reply, Data, State};
do_handle_call({'get_rand_persons', RoleID, Lv, Number, QuizList}, _From, State) ->
    Reply = lib_mentor:get_rand_persons(RoleID, Lv, Number, QuizList),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.


do_handle_cast('permanent', State) ->
    lib_mentor:save_cache(true),
    {noreply, State};
do_handle_cast('save_cache', State) ->
    erlang:send_after(?SAVE_CACHE_INTERVAL, self(), 'save_cache'),
    lib_mentor:save_cache(false),
    {noreply, State};
do_handle_cast('logic_tick', State) ->
    erlang:send_after(?MENTOR_LOGIC_INTERVAL, self(), 'logic_tick'),
    lib_mentor:logic_tick(),
    {noreply, State};
do_handle_cast({'confirm_start', Type, Key, ConfirmData}, State) ->
    lib_mentor:confirm_start(Type, Key, ConfirmData),
    {noreply, State};
do_handle_cast({'clear_confirm_data', Type, Key}, State) ->
    lib_mentor:clear_confirm_data(Type, Key),
    {noreply, State};
do_handle_cast({'update_person', MentorPerson}, State) ->
    lib_mentor:update_person(MentorPerson),
    {noreply, State};
do_handle_cast({'delete_person', MentorID}, State) ->
    lib_mentor:delete_person(MentorID),
    {noreply, State};
do_handle_cast({'save_person_to_db', MentorID}, State) ->
    lib_mentor:save_person_to_db(MentorID),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
