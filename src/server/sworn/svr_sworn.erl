%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     结拜系统
%%% @end
%%% Created : 16. 二月 2019 9:31
%%%-------------------------------------------------------------------
-module(svr_sworn).
-author("Tom").

-behaviour(gen_server).

-include("sworn.hrl").
-include("friend.hrl").
-include("common.hrl").
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
    code_change/3
]).

-export([
    permanent/0,
    get_group/1,
    get_person/1,
    create_group/1,
    update_group/1,
    delete_group/1,
    confirm_start/3,
    delete_person/1,
    register_person/1,
    get_rand_persons/2,
    get_confirm_data/2,
    save_person_to_db/1,
    clear_confirm_data/2,
    get_rand_reg_groups/2,
    change_senior_start/2,
    get_change_senior_data/1,
    clear_change_senior_data/1,

    do_handle_cast/2,
    do_handle_call/3
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

%% @doc 注册平台个人信息
register_person(Person) ->
    cast({'register_person', Person}).

%% @doc 获取个人平台信息
%%get_person(0) ->
%%    unicode;
get_person(RoleID) ->
    call({'get_person', RoleID}).

%% @doc 删除个人平台信息
delete_person(RoleID) ->
    cast({'delete_person', RoleID}).

%% @doc 将个人平台数据持久化
save_person_to_db(RoleID) ->
    cast({'save_person_to_db', RoleID}).

%% @doc 创建结拜组
create_group(Group) ->
    call({'create_group', Group}).

%% @doc 获取结拜组
get_group(GroupID) ->
    call({'get_group', GroupID}).

%% @doc 更新结拜组
update_group(Group) ->
    cast({'update_group', Group}).

%% @doc  删除结拜组
delete_group(GroupID) ->
    cast({'delete_group', GroupID}).

%% @doc 发起确认
confirm_start(Type, TeamID, ConfirmData) ->
    cast({'confirm_start', Type, TeamID, ConfirmData}).

%% @doc 获取确认缓存
get_confirm_data(Type, TeamID) ->
    call({'get_confirm_data', Type, TeamID}).

%% @doc 清除确认缓存
clear_confirm_data(Type, TeamID) ->
    cast({'clear_confirm_data', Type, TeamID}).

%% @doc 发起改变辈分
change_senior_start(GroupID, ChangeSeniorData) ->
    cast({'change_senior_start', GroupID, ChangeSeniorData}).

%% @doc 获取改变辈分数据
get_change_senior_data(GroupID) ->
    call({'get_change_senior_data', GroupID}).

%% @doc 清除改变辈分数据
clear_change_senior_data(GroupID) ->
    cast({'clear_change_senior_data', GroupID}).

%% @doc 获取随机平台登记结拜组列表
get_rand_reg_groups(RoleID, Number) ->
    call({'get_rand_reg_groups', RoleID, Number}).

%% @doc 获取随机平台登记个人列表
get_rand_persons(RoleID, Number) ->
    call({'get_rand_persons', RoleID, Number}).

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
    erlang:send_after(?LOGIC_INTERVAL, self(), 'logic_tick'),
    lib_sworn:init_cache(),
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


do_handle_call({'get_rand_persons', RoleID, Number}, _From, State) ->
    Persons = lib_sworn:get_rand_persons(RoleID, Number),
    {reply, Persons, State};
do_handle_call({'get_rand_reg_groups', RoleID, Number}, _From, State) ->
    Groups = lib_sworn:get_rand_reg_groups(RoleID, Number),
    {reply, Groups, State};
do_handle_call({'get_person', RoleID}, _From, State) ->
    Person = lib_sworn:get_person(RoleID),
    {reply, Person, State};
do_handle_call({'create_group', Group}, _From, State) ->
    GroupId = lib_sworn:create_group(Group),
    {reply, GroupId, State};
do_handle_call({'get_group', GroupID}, _From, State) ->
    Group = lib_sworn:get_group(GroupID),
    {reply, Group, State};
do_handle_call({'get_confirm_data', Type, TeamID}, _From, State) ->
    Data = lib_sworn:get_confirm_data(Type, TeamID),
    {reply, Data, State};
do_handle_call({'get_change_senior_data', GroupID}, _From, State) ->
    Data = lib_sworn:get_change_senior_data(GroupID),
    {reply, Data, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.


do_handle_cast('permanent', State) ->
    lib_sworn:save_cache(true),
    {noreply, State};
do_handle_cast({'register_person', Person}, State) ->
    lib_sworn:register_person(Person),
    {noreply, State};
do_handle_cast({'delete_person', RoleID}, State) ->
    lib_sworn:delete_person(RoleID),
    {noreply, State};
do_handle_cast({'save_person_to_db', RoleID}, State) ->
    lib_sworn:save_person_to_db(RoleID),
    {noreply, State};
do_handle_cast('save_cache', State) ->
    erlang:send_after(?SAVE_CACHE_INTERVAL, self(), 'save_cache'),
    lib_sworn:save_cache(false),
    {noreply, State};
do_handle_cast('logic_tick', State) ->
    erlang:send_after(?LOGIC_INTERVAL, self(), 'logic_tick'),
    lib_sworn:logic_tick(),
    {noreply, State};
do_handle_cast({'confirm_start', Type, TeamID, ConfirmData}, State) ->
    lib_sworn:confirm_start(Type, TeamID, ConfirmData),
    {noreply, State};
do_handle_cast({'update_group', Group}, State) ->
    lib_sworn:update_group(Group),
    {noreply, State};
do_handle_cast({'delete_group', GroupID}, State) ->
    lib_sworn:delete_group(GroupID),
    {noreply, State};
do_handle_cast({'clear_confirm_data', Type, TeamID}, State) ->
    lib_sworn:clear_confirm_data(Type, TeamID),
    {noreply, State};
do_handle_cast({'change_senior_start', GroupID, ChangeSeniorData}, State) ->
    lib_sworn:change_senior_start(GroupID, ChangeSeniorData),
    {noreply, State};
do_handle_cast({'clear_change_senior_data', GroupID}, State) ->
    lib_sworn:clear_change_senior_data(GroupID),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.