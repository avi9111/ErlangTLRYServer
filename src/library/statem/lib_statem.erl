%%-------------------------------------------------------
%% @File     : lib_statem
%% @Brief    : 状态机
%% @Author   : cablsbs
%% @Date     : 2018-6-28
%%-------------------------------------------------------
-module(lib_statem).

-include("common.hrl").
-include("role.hrl").
-include("statem.hrl").
-include("scene_objs.hrl").

-export([
    init/0,
    get_cur_state/2,
    get_cur_state_id/2,
    change_state/4,
    update/4
]).

-export([
    in_sit/1,
    in_idle/1
]).

%% 说明 =================================================
%% 处理场景进程内的 人物 怪物等状态
%% 每个state Module需要提供以下接口
%% Module:state_enter(Param, State)
%% Module:state_update(Time, ElapseTime, State)
%% Module:state_quit(State)
%% State    :: #scene_role{}    人物
%%             #mon{}           怪物
%%             #pet{}           珍兽
%%             #coll{}          采集物
%%             #carry{}         镖车
%% 说明 =================================================


%% Apis -------------------------------------------------
init() ->
    #statem{cur_state_id = -1}.

get_cur_state(Pos, State) ->
    MachineState = element(Pos, State),
    MachineState#statem.cur_state.

get_cur_state_id(Pos, State) ->
    MachineState = element(Pos, State),
    MachineState#statem.cur_state_id.

change_state(Id, Param, Pos, State) ->
    MachineState = element(Pos, State),
    StmType = ?statem_type(State),
    ToStateModule = conf_statem:get_state_mod(StmType, Id),
    StateN1 = case MachineState#statem.cur_state_id =/= -1 of
        true -> (MachineState#statem.cur_state):state_quit(State);
        false -> State
    end,
    MachineStateN = #statem{cur_state_id = Id, cur_state = ToStateModule},
    StateN2 = setelement(Pos, StateN1, MachineStateN),
    StateN3 = ToStateModule:state_enter(Param, StateN2),
    StateN3.

update(NowTimeMs, ElapseTime, Pos, State) ->
    MachineState = element(Pos, State),
    StateTimeN = MachineState#statem.state_time + ElapseTime,
    MachineStateN = MachineState#statem{state_time = StateTimeN},
    StateN = setelement(Pos, State, MachineStateN),
    case MachineStateN#statem.cur_state_id =/= -1 of
        true -> (MachineStateN#statem.cur_state):state_update(NowTimeMs, ElapseTime, StateN);
        false -> StateN
    end.


%% Apis ------------------------------------------------
% @doc 是否在打坐
% @spec in_sit(SceneObjInfo) -> boolean().
% SceneObjInfo  :: #scene_role{}
in_sit(State) ->
    in_state(?STATE_SIT, State).

% @doc 是否空闲
% @spec in_sit(SceneObjInfo) -> boolean().
% SceneObjInfo  :: #mon{} | #pet{} | #mon{}
in_idle(State) ->
    in_state(?STATE_IDLE, State).


%% Privates ---------------------------------------------
in_state(StateId, #mon{} = State) ->
    CurStateId = get_cur_state_id(#mon.statem, State),
    StateId =:= CurStateId;
in_state(StateId, #scene_role{} = State) ->
    CurStateId = get_cur_state_id(#scene_role.statem, State),
    StateId =:= CurStateId;
in_state(StateId, #pet{} = State) ->
    CurStateId = get_cur_state_id(#pet.statem, State),
    StateId =:= CurStateId;
in_state(StateId, #coll{} = State) ->
    CurStateId = get_cur_state_id(#coll.statem, State),
    StateId =:= CurStateId;
in_state(StateId, #carry{} = State) ->
    CurStateId = get_cur_state_id(#carry.statem, State),
    StateId =:= CurStateId.
