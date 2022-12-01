%%-------------------------------------------------------
%% @File     : lib_ai_trigger.erl
%% @Brief    : 怪物AI触发器
%% @Author   : cablsbs
%% @Date     : 2018-11-22
%%-------------------------------------------------------
-module(lib_ai_trigger).

-include("ai.hrl").
-include("scene.hrl").

-export([
    die/2,
    hp_change/2,
    be_attack/2,
    del_effects/2,
    time_drive/2
]).


%% Apis -------------------------------------------------
% @doc 死亡
die(_AtterKey, Mon) ->
    {Matched, Rest} = trigger_check(Mon, ?TRIGGER_DEAD, []),
    {MatchedN, MonN} = trig_action(Mon, Matched),
    MonN#mon{ai_triggers = MatchedN ++ Rest}.

% @doc 血量变化
hp_change(_OriHp, Mon) ->
    {Matched, Rest} = trigger_check(Mon, ?TRIGGER_HP_PERC, []),
    {MatchedN, MonN} = trig_action(Mon, Matched),
    MonN#mon{ai_triggers = MatchedN ++ Rest}.

% @doc 受击
be_attack(_AtterKey, Mon) ->
    {Matched, Rest} = trigger_check(Mon, ?TRIGGER_BEATTACK, []),
    {MatchedN, MonN} = trig_action(Mon, Matched),
    MonN#mon{ai_triggers = MatchedN ++ Rest}.

% @doc 移除效果
del_effects(EffectIds, Mon) ->
    {Matched, Rest} = trigger_check(Mon, ?TRIGGER_DEL_EFFECT, EffectIds),
    {MatchedN, MonN} = trig_action(Mon, Matched),
    MonN#mon{ai_triggers = MatchedN ++ Rest}.

% @doc 时间驱动型
% @doc 出生多久
time_drive(NowTimeMS, Mon) ->
    % 出生后多久
    {MatchedT0, RestT0} = trigger_check(Mon, ?TRIGGER_AFTER_BORN, [NowTimeMS]),
    {MatchedT1, MonT1} = trig_action(Mon, MatchedT0),
    MonT2 = MonT1#mon{ai_triggers = MatchedT1 ++ RestT0},

    % 场景剩余怪物
    {MatchedT2, RestT2} = trigger_check(MonT2, ?TRIGGER_EXISTED_MON, []),
    {MatchedT3, MonT3} = trig_action(MonT2, MatchedT2),
    MonT4 = MonT3#mon{ai_triggers = MatchedT3 ++ RestT2},

    % 移动到{X,Y} D范围内
    {MatchedT4, RestT4} = trigger_check(MonT4, ?TRIGGER_WITHIN_AREA, []),
    {MatchedT5, MonT5} = trig_action(MonT4, MatchedT4),
    MonT6 = MonT5#mon{ai_triggers = MatchedT5 ++ RestT4},

    % 血量变化
    {MatchedT6, RestT6} = trigger_check(MonT5, ?TRIGGER_HP_PERC, []),
    {MatchedT7, MonT7} = trig_action(MonT6, MatchedT6),

    MonT7#mon{ai_triggers = MatchedT7 ++ RestT6}.


%% Privates ---------------------------------------------
% 触发条件判断
trigger_check(Mon, TriggerType, ExtraArgs) ->
    CheckFun = fun
        (#trigger{trigger_type = Type}) when Type =/= TriggerType ->
            false;
        (#trigger{action_cd = 0, is_trigged = true}) ->
            false;
        (#trigger{trigger_type = ?TRIGGER_AFTER_BORN, trigger_args = [BornAfter]}) ->
            [NowTimeMS] = ExtraArgs,
            NowTimeMS - Mon#mon.born_time >= BornAfter;
        (#trigger{trigger_type = ?TRIGGER_WITHIN_AREA, trigger_args = [RefPos, Dist]}) ->
            #mon{x = X, y = Y} = Mon,
            lib_battle_chk:check_distance({X, Y}, RefPos, Dist);
        (#trigger{trigger_type = ?TRIGGER_HP_PERC, trigger_args = [HpPercU, HpPercD]}) ->
            #mon{hp = Hp, bt_attr = #bt_attr{hp_lim = HpLim}} = Mon,
            CurHpPerc = Hp * 100 div HpLim,
            (CurHpPerc < HpPercU andalso CurHpPerc >= HpPercD);
        (#trigger{trigger_type = ?TRIGGER_EXISTED_MON, trigger_args = [MId, Num]}) ->
            AliveNum = lib_mon_agent:count_alive_mon_by_mid(MId),
            AliveNum =:= Num;
        (#trigger{trigger_type = ?TRIGGER_DEL_EFFECT, trigger_args = [EffectId]}) ->
            lists:member(EffectId, ExtraArgs);
        (_Trigger) ->
            true
    end,
    lists:partition(CheckFun, Mon#mon.ai_triggers).

% 触发行为
trig_action(Mon, Triggers) ->
    NowTimeMS = time:unixtime_ms(),
    ActionFun = fun(Trigger, AccMon) -> lib_ai_action:handle_action(NowTimeMS, AccMon, Trigger) end,
    lists:mapfoldl(ActionFun, Mon, Triggers).
