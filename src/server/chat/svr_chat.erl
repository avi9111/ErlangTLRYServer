%%%-------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     聊天服务 [缓存，禁言等]
%%% @end
%%%-------------------------------------------------------------------
-module(svr_chat).
-author("Ryuu").

-include("chat.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    ban/3,
    mfa/2,
    mfa/3,
    call/1,
    cast/1,
    unban/1,
    start_link/0,
    public_chat/7,
    expire_check/0,
    private_chat/6,
    clear_chat_cache/2
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
    call(info).

p() ->
    dist:whereis_name(?SCORE, ?SERVER).

%% @doc MFA
mfa(M, F) ->
    mfa(M, F, []).

mfa(M, F, A) when is_list(A) ->
    ?call({mfa, M, F, A}).

%% @doc 记录私聊
public_chat(Channel, RoleID, Target, Content, Voice, VoiceTime, Extra) when
    Channel =:= ?CHAT_CHANNEL_WORLD orelse Channel =:= ?CHAT_CHANNEL_GUILD
    orelse Channel =:= ?CHAT_CHANNEL_GROUP ->
    cast({public_chat, Channel, RoleID, Target, Content, Voice, VoiceTime, Extra});
public_chat(_Channel, _RoleID, _Target, _Content, _Voice, _VoiceTime, _Extra) ->
    ignore.

%% @doc 记录私聊
private_chat(RoleID, TargetID, Content, Voice, VoiceTime, Extra) ->
    cast({private_chat, RoleID, TargetID, Content, Voice, VoiceTime, Extra}).

%% @doc 清除聊天缓存
clear_chat_cache(RoleID, TargetID) ->
    cast({clear_chat_cache, RoleID, TargetID}).

%% @doc 禁言
ban(RoleID, Type, Time) ->
    cast({ban, RoleID, Type, Time}).

%% @doc 禁言
unban(RoleID) ->
    cast({unban, RoleID}).

%% @doc 过期检查
expire_check() ->
    cast(expire_check).

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

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({private_chat, RoleID, TargetID, Content, Voice, VoiceTime, Extra}, State) ->
    lib_chat:private_chat(RoleID, TargetID, Content, Voice, VoiceTime, Extra),
    {noreply, State};
do_handle_cast({public_chat, Channel, RoleID, Target, Content, Voice, VoiceTime, Extra}, State) ->
    lib_chat:public_chat(Channel, RoleID, Target, Content, Voice, VoiceTime, Extra),
    {noreply, State};
do_handle_cast({ban, RoleID, Type, Reason}, State) ->
    lib_chat:ban(RoleID, Type, Reason),
    {noreply, State};
do_handle_cast({unban, RoleID}, State) ->
    lib_chat:unban(RoleID),
    {noreply, State};
do_handle_cast({clear_chat_cache, RoleID, TargetID}, State) ->
    lib_chat:clear_chat_cache(RoleID, TargetID),
    {noreply, State};
do_handle_cast(expire_check, State) ->
    lib_chat:expire_check(),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
