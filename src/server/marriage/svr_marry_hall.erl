%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     结婚礼堂
%%% @end
%%% Created : 01. 三月 2019 19:23
%%%-------------------------------------------------------------------
-module(svr_marry_hall).
-include("role.hrl").
-include("ret_code.hrl").
-include("marriage.hrl").
-include("proto/prot_544.hrl").

-behaviour(gen_server).

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
    do_handle_cast/2,
    p/0,
    call/1,
    cast/1
]).

-export([
    up/2,
    info/1,
    open/4,
    enter/1,
    sleep/2,
    check_sleep/1,
    enter_check/1,
    have_hall_check/1
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

enter_check(MarryID) ->
    call({enter_check, MarryID}).

have_hall_check(MarryID) ->
    call({have_hall_check, MarryID}).

check_sleep(MarryID) ->
    call({check_sleep, MarryID}).

info(RoleSid) ->
    cast({info, RoleSid}).

open(MarryID, MaleID, FemaleID, EndTime) ->
    cast({open, MarryID, MaleID, FemaleID, EndTime}).

enter(MaleID) ->
    cast({enter, MaleID}).

sleep(RoleID, Gender) ->
    cast({sleep, RoleID, Gender}).

up(RoleID, Gender) ->
    cast({up, RoleID, Gender}).

%% @doc call
call(Request) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(Request) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    State = #marry_hall{},
    {ok, State}.

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

do_handle_call({enter_check, MarryID}, _From, #marry_hall{halls = Halls} = State) ->
    Now = time:unixtime(),
    #{role_limit := RoleLimit} = conf_marry_hall_info:get(),
    Reply =
    case get_role_data(MarryID, marry_id, Halls) of
        #{end_time := EndTime, num := Num} when EndTime > Now ->
            ?iif(RoleLimit > Num, ok, {error, ?RC_MARRY_HALL_ROLE_LIMIT});
        _ -> {error, ?RC_MARRY_HALL_CLOSE}
    end,
    {reply, Reply, State};

do_handle_call({have_hall_check, MarryID}, _From, #marry_hall{halls = Halls} = State) ->
    Now = time:unixtime(),
    Reply =
    case get_role_data(MarryID, marry_id, Halls) of
        #{end_time := EndTime} when EndTime > Now ->
            ok;
        _ ->
            {error, ?RC_MARRY_HALL_CLOSE}
    end,
    {reply, Reply, State};

do_handle_call({check_sleep, MarryID}, _From, #marry_hall{halls = Halls} = State) ->
    Now = time:unixtime(),
    Reply =
        case get_role_data(MarryID, marry_id, Halls) of
            #{end_time := EndTime, male_stat := MStat, female_stat := FStat} when EndTime > Now ->
                ?iif(MStat =:= 1 andalso FStat =:= 1, ok, {error, ?RC_MARRY_HALL_NOT_ON_BED});
            _ ->
                {error, ?RC_MARRY_HALL_CLOSE}
        end,
    {reply, Reply, State};

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({info, RoleSid}, #marry_hall{halls = Halls} = State) ->
    Info = [{MaleID, FemaleID, lib_cache:get_role_name(MaleID), lib_cache:get_role_name(FemaleID), EndTime} ||
        #{male_id := MaleID, female_id := FemaleID, end_time := EndTime} <- Halls],
    MsgRecord = #sc_marry_hall_info{open_list = Info},
    {ok, Bin} = prot_msg:encode_msg(54452, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {noreply, State};

do_handle_cast({open, MarryID, MaleID, FemaleID, EndTime}, #marry_hall{halls = Halls} = State) ->
    Hall = ?hall#{
        marry_id => MarryID,
        male_id => MaleID,
        female_id => FemaleID,
        end_time => EndTime
    },
    Conf = conf_marry_hall_info:get(),
    #{last_time := LastTime} = Conf,
    erlang:send_after(LastTime * 1000, self(), {'close', MarryID}),
    NewHalls = set_role_data(MaleID, male_id, Hall, Halls),
    NewState = State#marry_hall{halls = NewHalls},
    {noreply, NewState};

do_handle_cast({enter, MaleID}, #marry_hall{halls = Halls} = State) ->
    Hall = get_role_data(MaleID, male_id, Halls),
    #{num := Num} = Hall,
    NewHall = Hall#{num => Num + 1},
    NewHalls = set_role_data(MaleID, male_id, NewHall, Halls),
    NewState = State#marry_hall{halls = NewHalls},
    {noreply, NewState};

do_handle_cast({sleep, RoleID, Gender}, #marry_hall{halls = Halls} = State) ->
    Key = ?iif(Gender =:= ?MALE, male_id, female_id),
    Hall = get_role_data(RoleID, Key, Halls),
    NewHall = ?iif(Gender =:= ?MALE, Hall#{male_stat => 1}, Hall#{female_stat => 1}),
    NewHalls = set_role_data(RoleID, Key, NewHall, Halls),
    NewState = State#marry_hall{halls = NewHalls},
    {noreply, NewState};

do_handle_cast({up, RoleID, Gender}, #marry_hall{halls = Halls} = State) ->
    Key = ?iif(Gender =:= ?MALE, male_id, female_id),
    Hall = get_role_data(RoleID, Key, Halls),
    NewHall = ?iif(Gender =:= ?MALE, Hall#{male_stat => 0}, Hall#{female_stat => 0}),
    NewHalls = set_role_data(RoleID, Key, NewHall, Halls),
    NewState = State#marry_hall{halls = NewHalls},
    {noreply, NewState};

do_handle_cast({'close', MarryID}, #marry_hall{halls = Halls} = State) ->
    svr_scene_mgr:close_line(?MARRY_HALL_SCENE, MarryID),
    NewHalls = map:keydelete(MarryID, marry_id, Halls),
    NewState = State#marry_hall{halls = NewHalls},
    {noreply, NewState};

do_handle_cast(_Request, State) ->
    {noreply, State}.


get_role_data(KeyValue, Key, Data) ->
    map:keyfind(KeyValue, Key, Data).

set_role_data(KeyValue, Key, RoleData, Data) ->
    map:keystore(KeyValue, Key, Data, RoleData).