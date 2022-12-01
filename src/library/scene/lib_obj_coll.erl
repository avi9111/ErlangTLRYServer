%%-------------------------------------------------------
%% @File     : lib_obj_coll
%% @Brief    : 采集物OBJ
%% @Author   : cablsbs
%% @Date     : 2018-9-10
%%-------------------------------------------------------
-module(lib_obj_coll).

-include("scene.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("proto/prot_902.hrl").
-include("proto/prot_903.hrl").

-export([
    init/1,
    on_update/3,
    on_becollect/2,
    on_delete/1,

    interrupt_roles/2,
    do_clear_belonger/1,
    bcast_state_change/1
]).


%% Apis -------------------------------------------------
% @doc 初始化
init([CId, X, Y, Args] = CollInit) ->
    case conf_coll:get(CId) of
        #{} = ConfColl ->
            #{
                name := Name, type := Type, interruptable := Interrupt,
                duration := Duration, disappear := Disappear, survive := Survive
            } = ConfColl,
            Owner = util:prop_get_value(owner, Args, #{}),
            Interruptable = ?iif(Interrupt =:= 0, false, true),
            IsDisappear = ?iif(Disappear =:= 0, false, true),
            DieTime = ?iif(Survive =:= 0, infinity, time:unixtime_ms() + Survive),

            CollId = gen_auto_id(),
            Coll = #coll{
                id = CollId, type = Type, cid = CId,
                name = Name, owner = Owner, duration = Duration,
                interruptable = Interruptable, disappear = IsDisappear,
                x = X, y = Y, die_time = DieTime
            },

            CollSceneInfo = data_transfer:sc_coll_scene_info(Coll),
            CollSceneMsg = #bcast_add_coll_scene_info{coll_list = [CollSceneInfo]},
            {ok, BinData} = prot_msg:encode_msg(90239, CollSceneMsg),
            broadcast(Coll, BinData),

            StateN = lib_statem:change_state(?STATE_IDLE, [], #coll.statem, Coll),
            lib_coll_agent:put_coll(StateN),
            {ok, StateN};
        _ ->
            ?ERROR_FUNC_CALL([CollInit]),
            {error, bad_coll_id}
    end.

% @doc 每个handle_update执行一次
% @spec on_update(NowTimeMS, ElapseTime, State) -> ok.
% NowTimeMS = ElapseTime    :: integer()
% State                     :: #coll{}
on_update(NowTimeMS, ElapseTime, State) ->
    case lib_statem:update(NowTimeMS, ElapseTime, #coll.statem, State) of
        #coll{statem = #statem{cur_state_id = ?STATE_BEOCCUPY}, disappear = true} = StateN ->
            on_delete(StateN);
        #coll{statem = #statem{cur_state_id = ?STATE_IDLE}, die_time = DieTimeMS} = StateN when DieTimeMS =< NowTimeMS ->
            on_delete(StateN);
        #coll{type = Type, statem = #statem{cur_state_id = ?STATE_BEOCCUPY}, collectors = Collectors} = StateN
            when Type =:= ?COLL_SHARING; Type =:= ?COLL_TERRITORY ->
            NewState = case Collectors of
                [] -> lib_statem:change_state(?STATE_IDLE, [], #coll.statem, StateN);                 % 切回初始状态
                _Collectors -> lib_statem:change_state(?STATE_BECOLLECT, [], #coll.statem, StateN)    % 切回被采集状态，以跑帧更新
            end,
            NowStat = (NewState#coll.statem)#statem.cur_state_id,
            OriStat = (State#coll.statem)#statem.cur_state_id,
            NowStat =/= OriStat andalso bcast_state_change(NewState),
            lib_coll_agent:put_coll(NewState);
        StateN ->
            NowStat = (StateN#coll.statem)#statem.cur_state_id,
            OriStat = (State#coll.statem)#statem.cur_state_id,
            NowStat =/= OriStat andalso bcast_state_change(StateN),
            lib_coll_agent:put_coll(StateN)
    end,
    ok.

% @doc 被采集
% @spec on_becollect({Atter, NowTimeMS}, State) -> ignore.
% Atter             :: #bt_state{}
% NowTimeMS         :: integer()
% State             :: #coll{}
on_becollect(_Atter, _State) ->
    ok.

% @doc 删除场景数据并广播
on_delete(#coll{id = CollId, collectors = Collectors} = Coll) ->
    interrupt_roles(Coll, Collectors),
    DelMsg = #bcast_del_coll{coll_ids = [CollId]},
    {ok, DelBin} = prot_msg:encode_msg(90240, DelMsg),
    broadcast(Coll, DelBin),
    lib_coll_agent:del_coll(CollId),
    ok.

interrupt_roles(_Coll, []) ->
    ignore;
interrupt_roles(Coll, Collectors) ->
    #coll{id = CollID} = Coll,
    broadcast(Coll, interrupt_roles(Collectors, CollID, <<>>)).

interrupt_roles([], _Coll, AccBin) ->
    AccBin;
interrupt_roles([{RoleID, _} | T], CollID, AccBin) ->
    Role = lib_scene_agent:get_roler(RoleID),
    NewRole = Role#scene_role{collecting = 0},
    lib_scene_agent:put_roler(NewRole),
    {ok, Bin} = passive_cancel_collect_bin(RoleID, CollID),
    interrupt_roles(T, CollID, <<AccBin/binary, Bin/binary>>).

% @doc 清除占有者(离开或死亡)
% @spec do_clear_belonger(State) -> StateN.
do_clear_belonger(#coll{collectors = Collectors} = State) ->
    Stat = case Collectors of
        [] -> ?STATE_IDLE;
        Collectors -> ?STATE_BECOLLECT
    end,
    StateT = State#coll{belonger = #{}},
    StateN = lib_statem:change_state(Stat, [], #coll.statem, StateT),
    bcast_state_change(StateN),
    StateN.

% @doc 广播采集物状态变化
% @spec bcast_state_change(State) -> ignore.
bcast_state_change(#coll{id = CollId, statem = #statem{cur_state_id = Stat}, realm = Realm} = State) ->
    BCastStMsg = #bcast_collect_st{coll_id = CollId, stat = Stat, realm = Realm},
    {ok, BCastStBin} = prot_msg:encode_msg(90250, BCastStMsg),
    broadcast(State, BCastStBin).

%% Privates ---------------------------------------------

% 场景采集物自增id
gen_auto_id() ->
    AutoId = get({coll, auto_id}),
    put({coll, auto_id}, AutoId + 1).

% @doc 采集物信息广播
broadcast(#coll{x = X, y = Y}, BinData) ->
    case lib_scene_agent:is_bcast_scene() of
        true -> lib_scene_agent:send_to_local_scene(BinData);
        false -> lib_scene_agent:send_to_local_area_scene(X, Y, BinData)
    end.

passive_cancel_collect_bin(RoleId, CollId) ->
    BCastCollectMsg = #bcast_collect{
        role_id = RoleId,
        coll_id = CollId,
        op = ?COLL_OP_STOP
    },
    prot_msg:encode_msg(90321, BCastCollectMsg).
