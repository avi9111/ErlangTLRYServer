%%%-------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     邮件系统
%%% @end
%%%-------------------------------------------------------------------
-module(svr_mail).
-author("Ryuu").

-behaviour(gen_server).

-include("mail.hrl").
-include("common.hrl").
-include("ret_code.hrl").

%% API
-export([
    i/0,
    p/0,
    sys2p/4,
    sys2p/5,
    sys2common/3,
    sys2common/4,
    sys2common/5,
    sys2online/3,
    sys2online/4,
    sys2online/5,
    sys2select/4,
    sys2select/5,
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

i() ->
    ?call(info).

%% @doc 服务进程Pid
p() ->
    dist:whereis_name(?SCORE, ?MODULE).

%% @doc 系统 -> 个人
%% Items 支持掉落ID 和 lib_role_assets:add_items/3支持的物品类型
sys2p(RoleID, TempID, Fun, OpType) when
    is_function(Fun, 2), is_integer(OpType) ->
    sys2p(RoleID, TempID, Fun, [], OpType);
sys2p(RoleID, TempID, Items, OpType) ->
    {Title, Content} = lib_mail:get_mail_temp(TempID),
    sys2p(RoleID, Title, Content, Items, OpType).

sys2p(RoleID, TempID, Fun, Items, OpType) when
    is_integer(TempID), is_function(Fun, 2) -> %% 个人邮件支持可定制模板
    {Title, Content} = lib_mail:format_mail_temp(TempID, Fun),
    sys2p(RoleID, Title, Content, Items, OpType);
sys2p(RoleID, TempID, Args, Items, OpType) when
    is_integer(TempID), is_list(Args) ->
    Fun = fun(Title, Content) -> {Title, io_lib:format(Content, Args)} end,
    sys2p(RoleID, TempID, Fun, Items, OpType);
sys2p(RoleID, Title, Content, Items, OpType) when
    ?VALID_STR(Title), ?VALID_STR(Content), ?VALID_MAIL_ITEMS(Items) ->
    NewItems = lib_mail:valid_items(Items),
    cast({sys2p, RoleID, Title, Content, NewItems, OpType}).

%% @doc 系统 -> 全服
sys2common(TempID, Items, OpType) ->
    {Title, Content} = lib_mail:get_mail_temp(TempID),
    sys2common(Title, Content, Items, OpType).

sys2common(Title, Content, Items, OpType) ->
    sys2common(all, Title, Content, Items, OpType).

sys2common(Scope, Title, Content, Items, OpType) when
    ?VALID_STR(Title), ?VALID_STR(Content), ?VALID_MAIL_ITEMS(Items) ->
    NewItems = lib_mail:valid_items(Items),
    cast({sys2common, Scope, Title, Content, NewItems, OpType}).

%% @doc 系统 -> 在线玩家
sys2online(TempID, Items, OpType) ->
    {Title, Content} = lib_mail:get_mail_temp(TempID),
    sys2online(Title, Content, Items, OpType).

sys2online(Title, Content, Items, OpType) ->
    sys2online(online, Title, Content, Items, OpType).

sys2online(Scope, Title, Content, Items, OpType) when
    ?VALID_STR(Title), ?VALID_STR(Content), ?VALID_MAIL_ITEMS(Items) ->
    cast({sys2online, Scope, Title, Content, Items, OpType}).

%% @doc 系统 -> 指定玩家列表
sys2select([], _TempID, _Items, _OpType) ->
    ignore;
sys2select(RoleList, TempID, Items, OpType) ->
    {Title, Content} = lib_mail:get_mail_temp(TempID),
    sys2select(RoleList, Title, Content, Items, OpType).

sys2select([], _Title, _Content, _Items, _OpType) ->
    ingore;
sys2select(RoleList, TempID, Args, Items, OpType) when is_integer(TempID), is_list(Args) ->
    Fun = fun(Title, Content) -> {Title, io_lib:format(Content, Args)} end,
    {Title, Content} = lib_mail:format_mail_temp(TempID, Fun),
    sys2select(RoleList, Title, Content, Items, OpType);
sys2select(RoleList, Title, Content, Items, OpType) when
    is_list(RoleList), ?VALID_STR(Title), ?VALID_STR(Content), ?VALID_MAIL_ITEMS(Items) ->
    NewItems = lib_mail:valid_items(Items),
    cast({sys2select, RoleList, Title, Content, NewItems, OpType});
sys2select(_Unknown, _Title, _Content, _Items, _OpType) ->
    ignore.

%% @doc 异步
cast(Req) ->
    ?cast(Req).

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

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({sys2p, RoleID, Title, Content, Items, OpType}, State) ->
    lib_mail:sys_personal(RoleID, Title, Content, Items, OpType),
    {noreply, State};
do_handle_cast({sys2common, Scope, Title, Content, Items, OpType}, State) ->
    lib_mail:sys_share({sys2common, Scope, Title, Content, Items, OpType}),
    {noreply, State};
do_handle_cast({sys2online, Scope, Title, Content, Items, OpType}, State) ->
    lib_mail:sys_share({sys2online, Scope, Title, Content, Items, OpType}),
    {noreply, State};
do_handle_cast({sys2select, RoleList, Title, Content, Items, OpType}, State) ->
    lib_mail:sys_share({sys2select, RoleList, Title, Content, Items, OpType}),
    {noreply, State};
do_handle_cast({split_send, RoleList, Mail}, State) ->
    lib_mail:split_send(RoleList, Mail),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
