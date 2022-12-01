%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     英雄副本
%%% @end
%%% Created : 01. 三月 2019 11:35
%%%-------------------------------------------------------------------
-module(svr_hero_dungeon).

-behaviour(gen_server).
-include("role.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_252.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2
]).

-export([
    cast/1,
    call/1,
    refresh/0,
    hero_dung_info/1,
    today_hero_dung_id/0
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

-record(state, {
    dung_id = 0
}).
%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

refresh() ->
    cast(refresh).

hero_dung_info(RoleSid) ->
    cast({hero_dung_info, RoleSid}).

today_hero_dung_id() ->
    call(get_dung_id).

%% @doc call
call(Request) ->
    case dist:whereis_name(?SCOPE, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(Request) ->
    case dist:whereis_name(?SCOPE, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    DungID = init_dung_id(),
    erlang:process_flag(trap_exit, true),
    {ok, #state{dung_id = DungID}}.

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

do_handle_call(get_dung_id, _From, #state{dung_id = DungID} = State) ->
    {reply, DungID, State};

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(refresh, State) ->
    DungID = get_dung_id(),
    lib_role_kv:set_kv(0, ?KEY_HERO_DUNG, {DungID, time:unixtime()}),
    NewState = State#state{dung_id = DungID},
    {noreply, NewState};

do_handle_cast({hero_dung_info, RoleSid}, #state{dung_id = DungID} = State) ->
    MsgRecord = #sc_dung_hero_info{dung_id = DungID},
    {ok, Bin} = prot_msg:encode_msg(25214, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {noreply, State};

do_handle_cast(_Request, State) ->
    {noreply, State}.

init_dung_id() ->
    {DungID, LastCheck} = lib_role_kv:get_kv(0, ?KEY_HERO_DUNG, {0, 0}),
    case DungID > 0 andalso time:is_today(LastCheck) of
        true ->
            DungID;
        _ ->
            NewDungID = get_dung_id(),
            lib_role_kv:set_kv(0, ?KEY_HERO_DUNG, {NewDungID, time:unixtime()}),
            NewDungID
    end.

get_dung_id() ->
    IDs = conf_hero_dung:get_ids(),
    OpenDay = util:get_open_days(),
    List =
        lists:foldl(fun(ID, Acc) ->
            NeedOpenDay = conf_hero_dung:get(ID),
            ?iif(OpenDay >= NeedOpenDay, [ID | Acc], Acc)
        end, [], IDs),
    util:list_rand(List).