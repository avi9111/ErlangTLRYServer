%%-------------------------------------------------------
%% @File     : lib_ai_action.erl
%% @Brief    : 怪物AI行为
%% @Author   : cablsbs
%% @Date     : 2018-11-28
%%-------------------------------------------------------

%%% -----------------------------------------------------
%%% 注意: 不要在 AI 行为里修改或删除进程字典数据,避免覆盖
%%%       所有修改和删除进程字典数据的逻辑,用异步消息实现
%%% -----------------------------------------------------

-module(lib_ai_action).

-include("ai.hrl").
-include("log.hrl").
-include("attr.hrl").
-include("skill.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("effect.hrl").

-export([
    handle_action/3
]).


%% Apis -------------------------------------------------
handle_action(NowTimeMS, Mon, Trigger) ->
    AiCd = Mon#mon.ai_cd,
    #trigger{
        action_id = ActionId, pre_act_id = PreActId, action_type = ActionType,
        action_args = ActionArgs, action_cd = ActionCd,
        is_trigged = IsTrigged
    } = Trigger,

    % 前置行为 + Cd判断 + 条件判断
    ActionValid = maps:get(ActionId, AiCd, 0),
    IsTrig =
        (PreActId =:= 0 orelse maps:get(PreActId, AiCd, 0) > 0) andalso                         % 前置行为
        ((not IsTrigged) orelse (ActionCd > 0 andalso ActionValid =< NowTimeMS)) andalso        % cd
        (not lib_effect_util:is_stun(Mon)) andalso                                              % 是否眩晕
        action_check(Mon, Trigger),                                                             % 行为条件

    if
        IsTrig ->
            ActionRet = case ActionType of
                ?ACTION_STAY -> stay(Mon, ActionArgs);
                ?ACTION_WALK_BY_PATH -> walk_by_path(Mon, ActionArgs);
                ?ACTION_MOVE_TO_POS -> move_to_pos(Mon, ActionArgs);
                ?ACTION_GUARD_AROUND -> guard_around(Mon, ActionArgs);
                ?ACTION_MOVE_TO_MON -> move_to_mon(Mon, ActionArgs);
                ?ACTION_ADD_EFFECT -> add_effect(Mon, ActionArgs);
                ?ACTION_DEL_EFFECT -> del_effect(Mon, ActionArgs);
                ?ACTION_FAKE_SKILL -> fake_skill(Mon, ActionArgs);
                ?ACTION_RAND_SKILL -> rand_skill(Mon, ActionArgs);
                ?ACTION_TRANSFER_TO -> transfer_to(Mon, ActionArgs);
                ?ACTION_ACTIVE_TRACE -> active_trace(Mon, NowTimeMS, ActionArgs);
                ?ACTION_STOP_TRACE -> stop_trace(Mon, ActionArgs);
                ?ACTION_SUMMON_MON -> summon_mon(Mon, ActionId, ActionArgs);
                ?ACTION_CLEAR_MON -> clear_mon(Mon, ActionArgs);
                ?ACTION_SACRIFY -> sacrify(Mon, ActionArgs);
                ?ACTION_SELF_KILL -> self_kill(Mon, ActionArgs);
                ?ACTION_IDLE -> idle(Mon, ActionArgs);
                ?ACTION_ALTER_FIELDS -> alter_fields(Mon, ActionArgs);
                ?ACTION_ALTER_SKILL -> alter_skill(Mon, ActionArgs)
            end,
            {ActionArgsN, MonT} = case ActionRet of
                ok -> {ActionArgs, Mon};
                {ok, MonT0} -> {ActionArgs, MonT0};
                {ok, ActionArgsT0, MonT0} -> {ActionArgsT0, MonT0}
            end,

            % 召唤怪物ai的cd永不满足, 所有已召唤怪物死亡才开始算cd
            NextValidTime = case ActionType of
                ?ACTION_SUMMON_MON -> undefined;
                ActionType -> NowTimeMS + ActionCd
            end,
            AiCdN = maps:put(ActionId, NextValidTime, AiCd),

            TriggerN = Trigger#trigger{is_trigged = true, action_args = ActionArgsN},
            {TriggerN, MonT#mon{ai_cd = AiCdN}};
        true ->
            {Trigger, Mon}
    end.


% 按路线行走
action_check(Mon, #trigger{action_type = ?ACTION_WALK_BY_PATH, action_args = Path}) ->
    (not lib_effect_util:is_immobil(Mon)) andalso lib_statem:in_idle(Mon) andalso Path =/= [];
% 移动到指定坐标
action_check(Mon, #trigger{action_type = ?ACTION_MOVE_TO_POS, action_args = [ToPos]}) ->
    #mon{x = MX, y = MY} = Mon,
    (not lib_effect_util:is_immobil(Mon)) andalso lib_statem:in_idle(Mon) andalso (not lib_battle_chk:check_distance({MX, MY}, ToPos, 6));
% 在指定范围内巡逻(距离初始点)
action_check(#mon{target = Target} = Mon, #trigger{action_type = ?ACTION_GUARD_AROUND}) ->
    Target =:= undefined andalso (not lib_effect_util:is_immobil(Mon)) andalso lib_statem:in_idle(Mon) andalso util:is_bingo(4000);
% 移动到指定怪物旁边
action_check(Mon, #trigger{action_type = ?ACTION_MOVE_TO_MON, action_args = [DestMId, Dist]}) ->
    case lib_statem:in_idle(Mon) andalso (not lib_effect_util:is_immobil(Mon)) of
        true ->
            case lib_mon_agent:get_scene_mons_by_mid(DestMId, 1) of
                [#mon{x = DestX, y = DestY}] ->
                    #mon{x = CX, y = CY} = Mon,
                    not lib_battle_chk:check_distance({CX, CY}, {DestX, DestY}, Dist);
                _ ->
                    false
            end;
        _ ->
            false
    end;
% 主动追击
action_check(Mon, #trigger{action_type = ?ACTION_ACTIVE_TRACE}) ->
    not lib_effect_util:is_immobil(Mon);
% 召唤怪物
action_check(#mon{hp = Hp, ai_data = AiData}, #trigger{action_id = ActionId, action_type = ?ACTION_SUMMON_MON}) ->
    if
        Hp > 0 ->
            Children = maps:get(children, AiData, []),
            case lists:keyfind(ActionId, 1, Children) of
                {ActionId, ChildMonIds} when ChildMonIds =/= [] -> false;
                _ -> true
            end;
        true ->
            false
    end;
% 清除召唤怪物
action_check(#mon{ai_data = AiData}, #trigger{action_type = ?ACTION_CLEAR_MON}) ->
    Children = maps:get(children, AiData, []),
    Children =/= [];
% 怪物配置修改
action_check(#mon{hp = Hp}, #trigger{action_type = ?ACTION_ALTER_FIELDS, action_args = Args}) ->
    Hp > 0 andalso valid_alter_args(Args);
% 其他无条件类型
action_check(_Mon, _Trigger) ->
    true.


%% Privates ---------------------------------------------
%% 触发器行为 -------------------------------------------
% 停留状态
stay(Mon, [StayTime]) ->
    {ok, lib_statem:change_state(?STATE_STAY, [StayTime], #mon.statem, Mon)}.

% 进入空闲(这个行为通常作为前置行为)
idle(Mon, _Args) ->
    {ok, lib_statem:change_state(?STATE_IDLE, [], #mon.statem, Mon)}.

% 按路径移动
walk_by_path(#mon{x = X, y = Y} = Mon, [{ToX, ToY} | RestPath]) ->
    case X =:= ToX andalso Y =:= ToY of
        true when RestPath =/= [] ->
            {ToXN, ToYN} = hd(RestPath),
            {ok, RestPath, lib_statem:change_state(?STATE_MOVE, [ToXN, ToYN, ?MT_WALK], #mon.statem, Mon)};
        true ->
            {ok, Mon};
        false ->
            {ok, lib_statem:change_state(?STATE_MOVE, [ToX, ToY, ?MT_WALK], #mon.statem, Mon)}
    end.

% 移动到坐标
move_to_pos(Mon, [{X, Y}]) ->
    {ok, lib_statem:change_state(?STATE_MOVE, [X, Y, ?MT_WALK], #mon.statem, Mon)}.

% % 移动到坐标(A星计算路径)
% move_to_pos(Mon, [{X, Y}]) ->
%     case lib_statem:in_idle(Mon) of
%         true -> {ok, lib_statem:change_state(?STATE_MOVE, [X, Y], #mon.statem, Mon)};
%         false -> ok
%     end.

% 附近巡逻
guard_around(Mon, Args) ->
    case util:is_bingo(4000) of
        true ->
            {CenterPos, Radius}= case Args of
                [0, 0, R] -> {Mon#mon.born_xy, R};
                [CX, CY, R] -> {{CX, CY}, R}
            end,
            #mon{x = MX, y = MY} = Mon,
            {ToX, ToY} = case lib_battle_chk:check_distance({MX, MY}, CenterPos, Radius) of
                true -> lib_ai_util:rand_pos_within_area(?SCENE_ID, CenterPos, Radius);
                false -> CenterPos
            end,
            {ok, lib_statem:change_state(?STATE_MOVE, [ToX, ToY, ?MT_WALK], #mon.statem, Mon)};
        _ ->
            ok
    end.

% 移动到怪物附近
move_to_mon(Mon, [MId, Dist]) ->
    case lib_mon_agent:get_scene_mons_by_mid(MId, 1) of
        [#mon{x = MX, y = MY}] ->
            Radius = min(4, Dist div 2),
            {ToX, ToY} = lib_ai_util:rand_pos_within_area(?SCENE_ID, {MX, MY}, Radius),
            {ok, lib_statem:change_state(?STATE_MOVE, [ToX, ToY, ?MT_WALK], #mon.statem, Mon)};
        _ ->
            ok
    end.

% 增加效果
add_effect(Mon, [EffectId, EffectLv]) ->
    case conf_effect:get(EffectId, EffectLv) of
        ConfEffect when ConfEffect =/= undefined ->
            CasterKey = {?BATTLE_MON, Mon#mon.id},
            BtState = data_transfer:to_bt_state(Mon),
            BtStateN = lib_effect_mgr:add_effect(CasterKey, BtState, ConfEffect),
            {ok, data_transfer:to_scene_obj_info(Mon, BtStateN)};
        _ ->
            ?ERROR("No such EffectId: ~p, EffectLv: ~p", [EffectId, EffectLv]),
            ok
    end.

% 删除效果
del_effect(Mon, [EffectId]) ->
    BtState = data_transfer:to_bt_state(Mon),
    BtStateN = lib_effect_mgr:del_by_effect_ids(BtState, [EffectId]),
    MonN = data_transfer:to_scene_obj_info(Mon, BtStateN),
    {ok, MonN}.

% 假技能
fake_skill(Mon, [SkillId]) ->
    lib_battle_base:bcast_attack(Mon, SkillId, 1),
    ok.

% 随机技能
rand_skill(#mon{id = MonId, x = X, y = Y, target = Target} = Mon, SkillRatio) ->
    {SkillId, _} = util:rand_by_weight(SkillRatio, 2),
    case conf_skill:get_base(SkillId, 1) of
        #base_skill{to_obj = ?TO_OBJ_DEFER} when Target =/= undefined ->
            MonN = lib_statem:change_state(?STATE_ATTACK, [{Target, X, Y}, SkillId, 1], #mon.statem, Mon),
            {ok, MonN};
        #base_skill{to_obj = ?TO_OBJ_SELF} ->
            MonN = lib_statem:change_state(?STATE_ATTACK, [{{?BATTLE_MON, MonId}, X, Y}, SkillId, 1], #mon.statem, Mon),
            {ok, MonN};
        #base_skill{} ->
            MonN = lib_statem:change_state(?STATE_ATTACK, [{{0, 0}, X, Y}, SkillId, 1], #mon.statem, Mon),
            {ok, MonN};
        _ ->
            ?ERROR("Skill: ~p not found !", [SkillId]),
            ok
    end.

% 传送至某处
transfer_to(Mon, [{ToX, ToY}]) ->
    MonT = lib_obj_util:set_obj_xy(ToX, ToY, {ToX, ToY}, Mon),
    lib_obj_util:reset_point(MonT, ?RESET_POS_MOVE),
    {ok, lib_statem:change_state(?STATE_IDLE, [], #mon.statem, MonT)}.

% 主动追击
active_trace(Mon, NowTimeMS, Args) ->
    #mon{ai_data = AiData} = Mon,
    [TraceType, TraceTime, TraceArgs] = Args,
    TraceExpire = NowTimeMS + TraceTime,
    AiDataN = AiData#{
        trace_expire => TraceExpire,
        trace_type => TraceType,
        trace_args => TraceArgs,
        unlock_target => 0
    },
    {ok, Mon#mon{ai_data = AiDataN, target = undefined}}.

% 停止追击
stop_trace(Mon, _Args) ->
    MonN = lib_ai_util:stop_trace(Mon),
    {ok, MonN}.

% 召唤怪物
summon_mon(#mon{id = MonId, ai_data = AiData}, ActionId, Args) ->
    ChildMonIdsList = maps:get(children, AiData, []),
    case lists:keyfind(ActionId, 1, ChildMonIdsList) of
        {ActionId, ChildMonIds} when ChildMonIds =/= [] ->
            skip;
        _ ->
            erlang:send(self(), {'boss_summon_mon', MonId, ActionId, Args})
    end,
    ok.

% 清除场景上的怪物
clear_mon(_Mon, MIds) ->
    erlang:send(self(), {'ai_clear_mon', MIds}),
    ok.

% 牺牲自己，给召唤者回血
sacrify(#mon{ai_data = AiData} = Mon, Args) ->
    case maps:get(parent, AiData, undefined) of
        {_ActionId, ParentId} ->
            erlang:send(self(), {'children_sacrify', Mon#mon.id, ParentId, Args});
        _ ->
            skip
    end,
    ok.

% 自杀
self_kill(Mon, _Args) ->
    erlang:send(self(), {'self_kill', Mon#mon.id}),
    ok.

% 更改怪物配置
alter_fields(Mon, Args) ->
    AlterFun = fun({Id, Value}, AccMon) ->
        Field = alter_id2field(Id),
        setelement(Field, AccMon, Value)
    end,
    MonN = lists:foldl(AlterFun, Mon, Args),
    {ok, MonN}.

% 切换技能
alter_skill(Mon, Skills) ->
    {ok, Mon#mon{skill_list = Skills}}.


% 检测修改参数
valid_alter_args(Args) ->
    ChkFun = fun({Id, _Value}) -> alter_id2field(Id) =/= undefined end,
    lists:all(ChkFun, Args).

% 修改配置字段转换
alter_id2field(1) -> #mon.trace_area;
alter_id2field(2) -> #mon.sight_area;
alter_id2field(3) -> #mon.attackable;
alter_id2field(_) -> undefined.
