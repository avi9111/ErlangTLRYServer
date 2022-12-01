%%-------------------------------------------------------
%% @File     : statem_coll_becollect.erl
%% @Brief    : 采集物被采集状态
%% @Author   : cablsbs
%% @Date     : 2018-9-11
%%-------------------------------------------------------
-module(statem_coll_becollect).

-include("scene_objs.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter(_Param, State) ->
    State.

state_update(NowTimeMS, _ElapseTime, #coll{type = ?COLL_TERRITORY} = State) ->
    #coll{collectors = Collectors, duration = Duration} = State,
    FinishLine = NowTimeMS - Duration,
    Finished = [{CollectStart, RID} || {RID, CollectStart} <- Collectors, CollectStart =< FinishLine],
    case lists:sort(Finished) of
        [{_, RoleID} | _] ->
            lib_obj_coll:interrupt_roles(State, [Collector || {RID, _} = Collector <- Collectors, RID =/= RoleID]),
            lib_statem:change_state(?STATE_BEOCCUPY, [[RoleID]], #coll.statem, State#coll{collectors = []});
        _ ->
            State
    end;
state_update(NowTimeMS, _ElapseTime, #coll{type = ?COLL_SHARING} = State) ->
    #coll{collectors = Collectors, duration = Duration} = State,
    FinishLine = NowTimeMS - Duration,
    PartitionFun = fun({_RoleId, CollectStart}) -> CollectStart =< FinishLine end,
    {Finished, CollectorsN} = lists:partition(PartitionFun, Collectors),
    if
        Finished =:= [] ->
            State;
        true ->
            FinishedRoleIds = [RoleId || {RoleId, _} <- Finished],
            lib_statem:change_state(?STATE_BEOCCUPY, [FinishedRoleIds], #coll.statem, State#coll{collectors = CollectorsN})
    end;
state_update(NowTimeMS, _ElapseTime, #coll{type = ?COLL_MONOPOLY} = State) ->
    #coll{collectors = [{CollectorId, CollectStart}], duration = Duration} = State,
    FinishTime = CollectStart + Duration,
    case NowTimeMS < FinishTime of
        true -> State;
        false -> lib_statem:change_state(?STATE_BEOCCUPY, [[CollectorId]], #coll.statem, State#coll{collectors = []})
    end.

state_quit(State) ->
    State.


%% Privates ---------------------------------------------
