%%-------------------------------------------------------
%% @File     : lib_battle_aid.erl
%% @Brief    : 战斗计算辅助模块
%% @Author   : cablsbs
%% @Date     : 2018-7-2
%%-------------------------------------------------------
-module(lib_battle_aid).

-include("role.hrl").
-include("scene.hrl").
-include("skill.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("effect.hrl").
-include("ret_code.hrl").

-export([
    get_scene_obj_info/1,
    get_scene_obj_info/2,
    put_scene_obj_info/1,
    update_defer_scene_info/3,

    get_att/1,
    get_target_list/5,
    get_repel_dist/4,
    update_harm/3,
    square/1,

    cal_injury/3,
    get_line_for_battle/3,
    get_sector_for_battle/3,
    get_circle_for_battle/3,
    is_attackable/2
]).


%% Apis -------------------------------------------------
% @doc 取出场景obj信息
% @spec get_scene_obj_info({ObjType, ObjId}) -> Obj | [].
% ObjType   :: 1 | 2
% ObjId     :: integer()
% Obj       :: #scene_role{} | #mon{}
get_scene_obj_info({?BATTLE_MON, MonId}) ->
    lib_mon_agent:get_mon(MonId);
get_scene_obj_info({?BATTLE_ROLE, RoleId}) ->
    lib_scene_agent:get_roler(RoleId);
get_scene_obj_info({?BATTLE_PET, PetId}) ->
    lib_pet_agent:get_pet(PetId);
get_scene_obj_info(_Obj) ->
    [].


% @doc 取出场景obj信息
% @spec get_scene_obj_info(Field, ObjKey) -> InfoVal | [].
% ObjKey    :: {1 | 2, integer()}
% ObjId     :: integer()
% InfoKey   :: atom()
% InfoVal   :: term()
get_scene_obj_info(InfoKey, ObjKey) ->
    case get_scene_obj_info(ObjKey) of
        #mon{} = Info -> do_get_scene_mon_info(InfoKey, Info);
        #scene_role{} = Info -> do_get_scene_role_info(InfoKey, Info);
        #pet{} = Info -> do_get_scene_pet_info(InfoKey, Info);
        [] -> []
    end.


% @doc 回存场景obj信息
% @spec put_scene_obj_info(ObjInfo) -> ignore
% ObjInfo   :: #mon{} | #scene_role{} | #pet{}
put_scene_obj_info(#mon{} = ObjInfo) ->
    lib_mon_agent:put_mon(ObjInfo);
put_scene_obj_info(#scene_role{} = ObjInfo) ->
    lib_scene_agent:put_roler(ObjInfo);
put_scene_obj_info(#pet{} = ObjInfo) ->
    lib_pet_agent:put_pet(ObjInfo).


% @doc 更新守方场景信息
update_defer_scene_info({?BATTLE_MON, MonId}, BattleReturn, NowTimeMS) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{} = Mon -> lib_obj_mon:on_beattack({BattleReturn, NowTimeMS}, Mon);
        _ -> ?ERROR("update_defer_scene_info failed !~nDefer Mon: ~p", [MonId])
    end;
update_defer_scene_info({?BATTLE_ROLE, RoleId}, BattleReturn, NowTimeMS) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{} = Roler -> lib_obj_role:on_beattack({BattleReturn, NowTimeMS}, Roler);
        _ -> ?ERROR("update_defer_scene_info failed !~nDefer Role: ~p", [RoleId])
    end;
update_defer_scene_info({?BATTLE_PET, PetId}, BattleReturn, NowTimeMS) ->
    case lib_pet_agent:get_pet(PetId) of
        #pet{} = Pet -> lib_obj_pet:on_beattack({BattleReturn, NowTimeMS}, Pet);
        _ -> ?ERROR("update_defer_scene_info failed !~nDefer Pet: ~p", [PetId])
    end.

% @doc 获取攻击力
get_att(#bt_state{atk_type = AtkType, attr = BtAttr}) ->
    case AtkType of
        ?ATK_TYPE_OUTER -> BtAttr#bt_attr.outer_att;
        ?ATK_TYPE_INNER -> BtAttr#bt_attr.inner_att;
        ?ATK_TYPE_BALANCE -> BtAttr#bt_attr.outer_att + BtAttr#bt_attr.inner_att
    end.


%%% ======================================================================================
%%% @doc 选择技能攻击目标
%%% @spec get_target_list(Atter, DeferKey, AssistX, AssistY, ToObj, Area) -> [Defer].
%%% Atter = Defer       :: #bt_state{}
%%% AssistXY            :: {integer(), integer()}
%%% DeferKey            :: {DeferType :: 1 | 2 , DeferId :: integer()}
%%% ToObj               :: integer()
%%% Area                :: 参照攻击范围定义 (skill.hrl)
%%% ======================================================================================
%% 选择攻击目标 - 无目标
get_target_list(_Atter, _Defer, _AssistXY, ?TO_OBJ_NONE, _AttArea) ->
    [];
%% 选择攻击目标 - 选择玩家自己
get_target_list(Atter, _DeferKey, _AssistXY, ?TO_OBJ_SELF, AttArea) ->
    #bt_state{type = AtterType, id = AtterId, x = AX, y = AY} = Atter,
    DeferSceneObjInfo = lib_battle_aid:get_scene_obj_info({AtterType, AtterId}),
    #bt_state{x = DX, y = DY} = Defer = data_transfer:to_bt_state(DeferSceneObjInfo),
    WithinArea = case AttArea of
        {?AREA_CIRCLE, _Dist, Radii} -> lib_battle_chk:check_distance({AX, AY}, {DX, DY}, Radii);
        {?AREA_LINE, Dist} -> lib_battle_chk:check_distance({AX, AY}, {DX, DY}, Dist);
        _ -> false
    end,
    if
        WithinArea -> [Defer];
        true -> []
    end;
%% 选择攻击目标 - 人物/宠物选择友方单位
get_target_list(#bt_state{type = AtterType} = Atter, DeferKey, AssistXY, ?TO_OBJ_PARTNER, AttArea) when AtterType =/= ?BATTLE_MON ->
    case AttArea of
        {?AREA_CIRCLE, Dist, Radii} ->
            #bt_state{id = AId, x = AX, y = AY} = Atter,
            case lib_battle_chk:check_circle_area(Dist, AssistXY, {AX, AY}) of
                {CX, CY, true} ->
                    ObjRoles = lib_scene_agent:get_circle_roler_for_battle(CX, CY, Radii),
                    BtRoles = [data_transfer:to_bt_state(R) || R <- ObjRoles, R#scene_role.id =/= AId],
                    ObjPets = lib_pet_agent:get_circle_pet_for_battle(CX, CY, Radii),
                    BtPets = [data_transfer:to_bt_state(P) || P <- ObjPets, P#pet.id =/= AId],
                    [Atter |
                        [BtState || BtState <- BtRoles ++ BtPets,
                                    not is_attackable(Atter, BtState)
                        ]
                    ];
                _ ->
                    []
            end;
        {?AREA_LINE, Dist} ->
            case get_scene_obj_info(DeferKey) of
                Defer when Defer =/= [] ->
                    #bt_state{x = AX, y = AY} = Atter,
                    #bt_state{x = DX, y = DY} = BtState = data_transfer:to_bt_state(Defer),
                    case lib_battle_chk:check_distance({DX, DY}, {AX, AY}, Dist) of
                        true ->
                            case is_attackable(Atter, BtState) of
                                false -> [BtState];
                                true -> []
                            end;
                        false ->
                            []
                    end;
                _ ->
                    []
            end
    end;
%% 选择攻击目标 - 选择主人(珍兽技能)
get_target_list(Atter, _DeferKey, _AssistXY, ?TO_OBJ_OWNER, _AttArea) ->
    if
        Atter#bt_state.type =:= ?BATTLE_PET ->
            case lib_pet_agent:get_owner(Atter#bt_state.id) of
                #scene_role{} = Roler -> [data_transfer:to_bt_state(Roler)];
                _ -> []
            end;
        true ->
            []
    end;
%% 选择攻击目标 - 人物选择队友
get_target_list(#bt_state{type = ?BATTLE_ROLE} = Atter, _DeferKey, AssistXY, ?TO_OBJ_TEAMMATE, AttArea) ->
    case AttArea of
        {?AREA_CIRCLE, Dist, Radii} ->
            #bt_state{id = AId, x = AX, y = AY, team = ATeam} = Atter,
            case lib_battle_chk:check_circle_area(Dist, AssistXY, {AX, AY}) of
                {CX, CY, true} ->
                    ObjRoles = lib_scene_agent:get_circle_roler_for_battle(CX, CY, Radii),
                    BtRoles = [data_transfer:to_bt_state(R) || R <- ObjRoles, R#scene_role.id =/= AId],
                    [Atter | [BtRole || BtRole <- BtRoles, BtRole#bt_state.team =:= ATeam]];
                _ ->
                    []
            end;
        _ ->
            []
    end;
%% 选择攻击目标 - 直线技能
get_target_list(#bt_state{x = X, y = Y} = Atter, DeferKey, _AssistXY, _ToObj, {?AREA_LINE, Dist}) ->
    case get_scene_obj_info(DeferKey) of
        #mon{x = DX, y = DY, attackable = Attackable} = DeferInfo when Attackable > 0 ->
            case lib_battle_chk:check_distance({DX, DY}, {X, Y}, Dist) of
                true -> init_target_list([DeferInfo], [], [], Atter, DeferKey);
                false -> []
            end;
        #scene_role{x = DX, y = DY} = DeferInfo ->
            case lib_battle_chk:check_distance({DX, DY}, {X, Y}, Dist) of
                true -> init_target_list([], [DeferInfo], [], Atter, DeferKey);
                false -> []
            end;
        #pet{x = DX, y = DY} = DeferInfo ->
            case lib_battle_chk:check_distance({DX, DY}, {X, Y}, Dist) of
                true -> init_target_list([], [], [DeferInfo], Atter, DeferKey);
                false -> []
            end;
        _ ->
            []
    end;
%% 选择攻击目标 - 扇形技能
get_target_list(Atter, DeferKey, AssistXY, _ToObj, {?AREA_SECTOR, Dist, Angle}) ->
    {AssistX, AssistY} = AssistXY,
    #bt_state{x = AtterX, y = AtterY} = Atter,
    MonList = lib_mon_agent:get_sector_mon_for_battle(AtterX, AtterY, Dist, AssistX, AssistY, Angle),
    PlayerList = lib_scene_agent:get_sector_roler_for_battle(Atter#bt_state.x, Atter#bt_state.y, Dist, AssistX, AssistY, Angle),
    PetList = lib_pet_agent:get_sector_pet_for_battle(AtterX, AtterY, Dist, AssistX, AssistY, Angle),
    init_target_list(MonList, PlayerList, PetList, Atter, DeferKey);

%% 选择攻击目标 - 长方形技能
get_target_list(Atter, DeferKey, AssistXY, _ToObj, {?AREA_RECTANGLE, Dist, Width}) ->
    {AssistX, AssistY} = AssistXY,
    #bt_state{x = AtterX, y = AtterY} = Atter,
    MonList = lib_mon_agent:get_line_mon_for_battle(AtterX, AtterY, AssistX, AssistY, Width, Dist),
    PlayerList = lib_scene_agent:get_line_roler_for_battle(Atter#bt_state.x, Atter#bt_state.y, AssistX, AssistY, Width, Dist),
    PetList = lib_pet_agent:get_line_pet_for_battle(AtterX, AtterY, AssistX, AssistY, Width, Dist),
    init_target_list(MonList, PlayerList, PetList, Atter, DeferKey);

%% 选择攻击目标 - 圆形技能
get_target_list(Atter, DeferKey, AssistXY, ToObj, {?AREA_CIRCLE, Dist, Radii}) ->
    #bt_state{x = AX, y = AY} = Atter,
    case lib_battle_chk:check_circle_area(Dist, AssistXY, {AX, AY}) of
        {CX, CY, true} ->
            MonList = if
                ToObj =:= ?TO_OBJ_DEFER -> lib_mon_agent:get_circle_mon_for_battle(CX, CY, Radii);
                ToObj =:= ?TO_OBJ_MON -> [M || M <- lib_mon_agent:get_circle_mon_for_battle(CX, CY, Radii), M#mon.boss =:= 0];
                ToObj =:= ?TO_OBJ_BOSS -> [M || M <- lib_mon_agent:get_circle_mon_for_battle(CX, CY, Radii), M#mon.boss > 0];
                true -> []
            end,
            PlayerList = if
                ToObj =:= ?TO_OBJ_DEFER -> lib_scene_agent:get_circle_roler_for_battle(CX, CY, Radii);
                ToObj =:= ?TO_OBJ_ROLE -> lib_scene_agent:get_circle_roler_for_battle(CX, CY, Radii);
                true -> []
            end,
            PetList = if
                ToObj =:= ?TO_OBJ_DEFER -> lib_pet_agent:get_circle_pet_for_battle(CX, CY, Radii);
                ToObj =:= ?TO_OBJ_ROLE -> lib_pet_agent:get_circle_pet_for_battle(CX, CY, Radii);
                true -> []
            end,
            init_target_list(MonList, PlayerList, PetList, Atter, DeferKey);
        _ ->
            []
    end;

get_target_list(Atter, DeferKey, _AssistXY, ToObj, Area) ->
    ?ERROR("Unexpected get_target_list/5 call !"),
    ?ERROR(
        "AtterKey: ~p, DeferKey: ~p, ToObj: ~p, Area: ~p",
        [{Atter#bt_state.type, Atter#bt_state.id}, DeferKey, ToObj, Area]
    ),
    [].

% @doc 计算击退距离 - Atter Defer 坐标相同
get_repel_dist({X, Y}, {X, Y}, _Dist, _SceneId) ->
    {X, Y};
% @doc 计算击退距离 - X坐标相同
get_repel_dist({Xa, Ya}, {Xd, Yd}, Dist, SceneId) when Xa =:= Xd ->
    {Xr, Yr} = case Yd > Ya of
        true -> {Xd, Yd + Dist};
        false -> {Xd, Yd - Dist}
    end,
    lib_scene_sign:get_nearest_line_poses(SceneId, Xd, Yd, trunc(Xr), trunc(Yr));
% @doc 计算击退距离 - Y坐标相同
get_repel_dist({Xa, Ya}, {Xd, Yd}, Dist, SceneId) when Ya =:= Yd ->
    {Xr, Yr} = case Xd > Xa of
        true -> {Xd + Dist, Yd};
        false -> {Xd - Dist, Yd}
    end,
    lib_scene_sign:get_nearest_line_poses(SceneId, Xd, Yd, trunc(Xr), trunc(Yr));
get_repel_dist({Xa, Ya}, {Xd, Yd}, Dist, SceneId) ->
    K = (Yd - Ya) / (Xd - Xa),
    M = math:sqrt((Dist * Dist * K * K) / (1 + K * K)),
    Y1 = M + Yd,
    Y2 = Yd - M,
    X1 = (Y1 - Yd) / K + Xd,
    X2 = (Y2 - Yd) / K + Xd,

    {Xr, Yr} = case (X1 >= Xa andalso X1 >= Xd) orelse (X1 =< Xa andalso X1 =< Xd) of
        true -> {X1, Y1};
        false -> {X2, Y2}
    end,
    lib_scene_sign:get_nearest_line_poses(SceneId, Xd, Yd, trunc(Xr), trunc(Yr)).

% @doc 更新伤害map
update_harm(HarmMap, _AtterKey, 0) ->
    HarmMap;
update_harm(HarmMap, AtterKey, AddHarm) ->
    AtterHarm = maps:get(AtterKey, HarmMap, 0),
    AtterHarmN = AtterHarm + max(0, AddHarm),
    maps:put(AtterKey, AtterHarmN, HarmMap).

% @doc 计算伤害
% @spec cal_injury(Atter, Defer, BaseSkill) -> {HarmType, Harm}.
% Atter = Defer     :: #bt_state{}
% BaseSkill         :: #base_skill{}
% HarmType = Harm   :: integer()
% 回血
cal_injury(Atter, Defer, #base_skill{sp = ?SKILL_SP_CURE} = BaseSkill) ->
    #bt_state{type = AType, atk_type = AAtkType, career = ACareer, level = ALevel, attr = AtterAttr} = Atter,
    #base_skill{cure_ratio = CureRatio, attr_cure_ratio = AttrCureRatio, cure_const = CureConst} = BaseSkill,
    ACureCareerFact = conf_battle_career_fact:get_cure(ACareer),
    AttrFactor = conf_battle_career_fact:get_attr_factor(ACareer),
    BasicCure = calc_basic_cure(AAtkType, AtterAttr, ACureCareerFact),
    AttrCure = calc_attr_cure(AtterAttr, ACureCareerFact, AttrFactor),

    % 会心治疗率计算 new
    Crit = AtterAttr#bt_attr.crit_hurt,
    SecureConst = conf_battle_const:get_secure(),
    MaxCureCrit = maps:get(cure_crit, SecureConst),
    {_, CritRate} = conf_battle_career_fact:get_crit(ACareer),
    AtterKlv = conf_battle_const:get_battle_klv(AType, AAtkType, ALevel),
    #{floating := AFloating, cure_crit := CureCritKlv, cure_crit_fix := CureCritFixKlv} = AtterKlv,
    CureCritRateT = (Crit + CureCritKlv) * 10000 / CureCritFixKlv + CritRate,
    CureCritRate = min(MaxCureCrit, CureCritRateT),
    #{basic_crit_cure_addon := BasicCritCureAddon} = ACureCareerFact,

    ActiveCureFact = calc_active_cure_fact(Atter),
    PassiveCureFact = calc_passive_cure_fact(Defer),
    CuredHpT = (BasicCure * CureRatio + AttrCure * AttrCureRatio) / 10000 * ActiveCureFact * PassiveCureFact + CureConst,
    CuredHpT1 = case util:is_bingo(CureCritRate) of
        true -> CuredHpT * (1 + BasicCritCureAddon / 10000);
        false -> CuredHpT
    end,
    Random = 1 + util:rand(-AFloating, AFloating) / 10000,                                          % 治疗浮动
    #bt_state{hp = Hp, attr = #bt_attr{hp_lim = HpLim}} = Defer,
    CuredHp = min(CuredHpT1 * Random, HpLim - Hp),
    ExtraCurePerc = case BaseSkill#base_skill.extra_harm of                                                     % 额外伤害万分比
        ConfExtraHarm when ConfExtraHarm =/= {} -> get_extra_harm(Atter, Defer, ConfExtraHarm);
        _ -> 0
    end,
    CuredHpN = erlang:ceil(CuredHp * (10000 + ExtraCurePerc) / 10000),
    {?HARM_TYPE_CURE, CuredHpN};
% 无效果(不扣血，不回血)
cal_injury(_Atter, _Defer, #base_skill{sp = ?SKILL_SP_NO_HURT}) ->
    {?HARM_TYPE_NORMAL, 0};
% 穿刺技能
cal_injury(Atter, Defer, #base_skill{sp = ?SKILL_SP_PENETRATE} = BaseSkill) ->
    #bt_attr{penetrate_att = APAtt, penetrate_crit = APCritHurt} = Atter#bt_state.attr,
    #bt_attr{penetrate_def = DPDef, penetrate_crit_def = DPCritDef} = Defer#bt_state.attr,

    % Klv 及 保底常量
    SecureConst = conf_battle_const:get_secure(),
    #bt_state{type = AType, atk_type = AAtkType, career = ACareer, level = ALevel} = Atter,
    AtterKlv = conf_battle_const:get_battle_klv(AType, AAtkType, ALevel),
    #bt_state{type = DType, atk_type = DAtkType, level = DLevel} = Defer,
    DeferKlv = conf_battle_const:get_battle_klv(DType, DAtkType, DLevel),

    % 穿刺暴击率计算
    APCritKlv = maps:get(penetrate_crit, AtterKlv),
    {APCritHurtAdd, APCritRate} = conf_battle_career_fact:get_penetrate_crit(ACareer),
    #{penetrate_crit_def:=DPCritDefKlv, penetrate_crit_def_factor:=DPCritDefFact} = DeferKlv,
    PCritRatioT = (APCritHurt + APCritKlv) / (DPCritDef * DPCritDefFact + DPCritDefKlv) * 10000,
    PCritConst = maps:get(penetrate_crit, SecureConst, 6000),
    PCritRatio = min(PCritConst, PCritRatioT + APCritRate),
    IsPCrit = ?iif(APCritHurt >= 10000000000, true, util:is_bingo(PCritRatio)),

    % 穿刺伤害
    #{penetrate_att:=APAttKlv, penetrate_att_factor:=APAttFact} = AtterKlv,
    #{penetrate_def:=DPDefKlv, penetrate_def_factor:=DPDefFact} = DeferKlv,
    PenetrateHarmT = APAtt * (APAtt + APAttKlv) / (APAtt * APAttFact + DPDef * DPDefFact + DPDefKlv),
    PenetrateHarm = case IsPCrit of                                                                                 % 穿刺基础伤害
        true -> PenetrateHarmT * (1 + APCritHurtAdd / 10000);
        false -> PenetrateHarmT
    end,
    HarmType = ?iif(IsPCrit, ?HARM_TYPE_PENETRATE_C, ?HARM_TYPE_PENETRATE),                                         % 穿刺伤害类型
    FinalPenetrateHarm = cal_total_addon_harm(Atter, Defer, BaseSkill, PenetrateHarm),                              % 穿刺总伤害
    {HarmType, -FinalPenetrateHarm};
% 常规技能扣血
cal_injury(Atter, Defer, BaseSkill) ->
    % 攻击方属性
    #bt_state{type = AType, career = ACareer, atk_type = AAtkType, level = ALevel, attr = AtterAttr} = Atter,
    AHit = AtterAttr#bt_attr.hit,
    % 防守方属性
    #bt_state{type = DType, career = DCareer, atk_type = DAtkType, level = DLevel, attr = DeferAttr} = Defer,
    DDodge = DeferAttr#bt_attr.dodge,

    % 获取配置数据
    SecureConst = conf_battle_const:get_secure(),
    AtterKlv = conf_battle_const:get_battle_klv(AType, AAtkType, ALevel),
    AHitKlv = maps:get(hit, AtterKlv),
    AHitRate = conf_battle_career_fact:get_hit_rate(ACareer),
    DeferKlv = conf_battle_const:get_battle_klv(DType, DAtkType, DLevel),
    DDodgeKlv = maps:get(dodge, DeferKlv),
    {DDodgeFactor, DDodgeRate} = conf_battle_career_fact:get_dodge(DCareer),

    %命中几率计算
    HitConst = maps:get(hit, SecureConst, 4000),
    HitRatioT = (AHit + AHitKlv) / (AHit + DDodge * DDodgeFactor + DDodgeKlv) * 10000,
    HitRatio = max(HitConst, HitRatioT + AHitRate - DDodgeRate),
    IsHit = util:is_bingo(HitRatio),

    case IsHit of
        true ->
            % 基础伤害和属性伤害
            BasicHarm = calc_basic_hurt(ACareer, AAtkType, ALevel, AtterAttr, AtterKlv, DeferAttr, DeferKlv),
            AttrFactor = conf_battle_career_fact:get_attr_factor(ACareer),
            AttrHarm = calc_attr_harm(AttrFactor, Atter, Defer),

            #bt_attr{hurt_add = AHurtAdd, crit_hurt = ACritHurt, crit_add = ACritAdd, igndef_hurt = AIgnDefHurt} = AtterAttr,
            #bt_attr{hurt_red = DHurtRed, crit_def = DCritDef, crit_red = DCritRed, igndef_def = DIgnDefDef} = DeferAttr,

            % 技能暴击率计算
            #{crit := ACritKlv, floating := AFloating} = AtterKlv,
            {ACritHurtAdd, ACritRate} = conf_battle_career_fact:get_crit(ACareer),
            IsCrit = case lib_effect_util:is_crit(Atter) of
                _ when BaseSkill#base_skill.id =:= 10010014 ->
                    % 横扫千军必定不暴击
                    false;
                false ->
                    % 不暴击
                    #{crit_def := DCritDefKlv, crit_def_factor := DCritDefFact} = DeferKlv,
                    CritRatioT = (ACritHurt + ACritKlv) / (DCritDef * DCritDefFact + DCritDefKlv) * 10000,
                    CritConst = maps:get(crit, SecureConst, 6000),
                    CritRatio = min(CritConst, CritRatioT + ACritRate),
                    ?iif(ACritHurt >= 50000000, true, util:is_bingo(CritRatio));
                true ->
                    % 暴击
                    true
            end,

            % 技能伤害
            Random = 1 + util:rand(-AFloating, AFloating) / 10000,                                                      % 伤害浮动
            HurtAdd = max(0, 1 + (AHurtAdd - DHurtRed) / 10000),                                                        % 伤害加成
            IgnHurt = max(0, AIgnDefHurt - DIgnDefDef),                                                                 % 无视防御伤害
            #base_skill{skill_ratio = SkillRatio, attr_ratio = AttrRatio, skill_const = SkillConst} = BaseSkill,
            SkillHarmT = ((BasicHarm*SkillRatio + AttrHarm*AttrRatio) / 10000 + SkillConst + IgnHurt) * HurtAdd,        % 技能伤害
            SkillHarm = case IsCrit of
                false ->
                    SkillHarmT * Random;                                                                                % 技能非会伤害
                true ->
                    CritAdd = 1 + (ACritHurtAdd + max(0, ACritAdd - DCritRed)) / 10000,
                    SkillHarmT * CritAdd * Random                                                                       % 技能会心伤害
            end,
            FinalSkillHarm = cal_total_addon_harm(Atter, Defer, BaseSkill, SkillHarm),                                  % 技能总伤害
            HarmType = ?iif(IsCrit, ?HARM_TYPE_CRIT, ?HARM_TYPE_NORMAL),
            {HarmType, -FinalSkillHarm};
        false ->
            {?HARM_TYPE_DODGE, 0}
    end.

% @doc 获取直线型攻击目标
get_line_for_battle(UX, UY, [OX, OY, X, Y, Area, Dist]) ->
    {GapPow, Dir, CX, CY} =
        case (OX - X) == 0 of
            true ->
                CXT = X,
                CYT = UY,
                GapPowT = (UX - OX) * (UX - OX),
                DirT = ?iif((CYT - OY) == 0, 1, (Y - OY) / (CYT - OY)),
                {GapPowT, DirT, CXT, CYT};
            false ->
                case (OY - Y) == 0 of
                    true ->
                        CXT = UX,
                        CYT = Y,
                        GapPowT = (UY - OY) * (UY - OY),
                        DirT = ?iif((CXT - OX) == 0, 1, (X - OX) / (CXT - OX)),
                        {GapPowT, DirT, CXT, CYT};
                    false ->
                        K1 = (OY - Y) / (OX - X),
                        B1 = Y - K1 * X,
                        K2 = -1 / K1,
                        B2 = UY - K2 * UX,
                        CXT = (B2 - B1) / (K1 - K2),
                        CYT = K1 * CXT + B1,
                        GapPowT = (CXT - UX) * (CXT - UX) + (CYT - UY) * (CYT - UY),
                        DirT = ?iif((CXT - OX) == 0, 1, (X - OX) / (CXT - OX)),
                        {GapPowT, DirT, CXT, CYT}
                end
        end,
    case GapPow > (Area / 2) * (Area / 2) of
        true ->
            false;
        false ->
            DisGapPow = (CX - OX) * (CX - OX) + (CY - OY) * (CY - OY),
            (DisGapPow =< Dist * Dist) andalso Dir >= 0
    end.


% @doc 获取扇形范围攻击目标
get_sector_for_battle(Mx, My, [Cx, Cy, Dist, Vx, Vy, Cos]) ->
    Dx = Mx - Cx,
    Dy = My - Cy,
    SqrtLengthD = Dx * Dx + Dy * Dy,
    SqrtLengthV = Vx * Vx + Vy * Vy,
    if
        SqrtLengthD > Dist * Dist ->
            false;
        true ->
            DdotU = Dx * Vx + Dy * Vy,
            if
                DdotU >= 0 andalso Cos >= 0 ->
                    DdotU * DdotU >= SqrtLengthD * SqrtLengthV * Cos * Cos;
                DdotU < 0 andalso Cos < 0 ->
                    DdotU * DdotU < SqrtLengthD * SqrtLengthV * Cos * Cos;
                true ->
                    DdotU >= 0
            end
    end.


% @doc 获取圆形范围攻击目标
get_circle_for_battle(Mx, My, [Cx, Cy, DistSqr]) ->
    (Mx - Cx) * (Mx - Cx) + (My - Cy) * (My - Cy) =< DistSqr.


% @doc 是否敌对单位
is_attackable(Atter, Defer) ->
    #bt_state{
        id = AId, attackable = AAttackable, mode = AMode, team = ATeam, realm = ARealm,
        guild = AGuild, server_num = AServerNum, murderous = AMurderous, owner_id = AOwnerId
    } = Atter,
    #bt_state{
        id = DId, attackable = DAttackable, mode = DMode, team = DTeam, realm = DRealm,
        guild = DGuild, server_num = DServerNum, murderous = DMurderous, owner_id = DOwnerId
    } = Defer,
    IsAttackable1 = sets:is_element(DOwnerId, AAttackable),
    IsAttackable2 = sets:is_element(AId, DAttackable),
    if
        AId =:= DOwnerId orelse DId =:= AOwnerId orelse AId =:= DId ->
            false;
        (ARealm =/= DRealm) ->
            true;
        ARealm =:= 0 ->
            if
                IsAttackable1 orelse IsAttackable2 -> true;
                AMode =:= ?MODE_JUSTICE andalso DMurderous > 0 -> true;
                DMode =:= ?MODE_JUSTICE andalso AMurderous > 0 -> true;
                (AMode =:= ?MODE_TEAM orelse DMode =:= ?MODE_TEAM) andalso (ATeam =/= DTeam orelse ATeam =:= 0) -> true;
                (AMode =:= ?MODE_GUILD orelse DMode =:= ?MODE_GUILD) andalso (AGuild =/= DGuild orelse AGuild =:= 0) -> true;
                (AMode =:= ?MODE_SERVER orelse DMode =:= ?MODE_SERVER) andalso AServerNum =/= DServerNum -> true;
                true -> false
            end;
        true ->
            false
    end.


%% Privates ----------------------------------------------
%% 格式化攻击目标
init_target_list(MonList, RoleList, PetList, Atter, {MainTargetType, MainId}) ->
    F = fun(Defer, {Acc, MainTarget}) ->
        DeferBtState = data_transfer:to_bt_state(Defer),
        case filter_pk_target(Atter, DeferBtState) of
            true ->
                ?iif(
                    DeferBtState#bt_state.id == MainId andalso DeferBtState#bt_state.type == MainTargetType,
                    {Acc, DeferBtState},
                    {[DeferBtState | Acc], MainTarget}
                );
            false ->
                {Acc, MainTarget}
        end
    end,
    Ret1 = ?iif(is_list(MonList), lists:foldl(F, {[], null}, MonList), {[], null}),
    Ret2 = ?iif(is_list(RoleList), lists:foldl(F, Ret1, RoleList), Ret1),
    {RetList, RetMainTarget} = ?iif(is_list(PetList), lists:foldl(F, Ret2, PetList), Ret2),
    ?iif(RetMainTarget == null, RetList, [RetMainTarget | RetList]).

%% @doc 过滤攻击目标
% 人攻击目标是人，不能攻击自己
filter_pk_target(#bt_state{type = ?BATTLE_ROLE, id = AtterId} = Atter, #bt_state{type = ?BATTLE_ROLE, id = DeferId} = Defer)
    when DeferId =/= AtterId ->
    IsCanFight = lib_scene_agent:is_can_fight(),
    IsCanFight andalso do_filter_pk_target(Atter, Defer);
% 人攻击目标是宠物，不能攻击自己的宠物
filter_pk_target(#bt_state{type = ?BATTLE_ROLE, id = AtterId} = Atter, #bt_state{type = ?BATTLE_PET, owner_id = DOwnerId} = Defer)
    when DOwnerId =/= AtterId ->
    IsCanFight = lib_scene_agent:is_can_fight(),
    IsCanFight andalso do_filter_pk_target(Atter, Defer);
% 宠物攻击目标是人，不能攻击主人
filter_pk_target(#bt_state{type = ?BATTLE_PET, owner_id = AOwnerId} = Atter, #bt_state{type = ?BATTLE_ROLE, id = DeferId} = Defer)
    when AOwnerId =/= DeferId ->
    IsCanFight = lib_scene_agent:is_can_fight(),
    IsCanFight andalso do_filter_pk_target(Atter, Defer);
% 宠物攻击目标是宠物，宠物不能攻击同伴
filter_pk_target(#bt_state{type = ?BATTLE_PET, owner_id = AOwnerId} = Atter, #bt_state{type = ?BATTLE_PET, owner_id = DOwnerId} = Defer)
    when AOwnerId =/= DOwnerId ->
    IsCanFight = lib_scene_agent:is_can_fight(),
    IsCanFight andalso do_filter_pk_target(Atter, Defer);
% 人/宠物攻击，目标是怪物(如果怪物有归属者，只能由归属者或队友攻击)
filter_pk_target(#bt_state{type = ObjType} = Atter, #bt_state{type = ?BATTLE_MON} = Defer) when ObjType =/= ?BATTLE_MON ->
    #bt_state{id = AtterId, team = ATeam} = Atter,
    #bt_state{owner_id = DOwnerId, owner_team = DOwnerTeam} = Defer,
    AOwnerId = ?iif(ObjType =:= ?BATTLE_ROLE, AtterId, Atter#bt_state.owner_id),

    BaseFilter = if
        DOwnerId =:= 0 andalso DOwnerTeam =:= 0 -> true;
        AOwnerId =:= DOwnerId -> true;
        ATeam =:= DOwnerTeam andalso ATeam =/= 0 -> true;
        true -> false
    end,
    BaseFilter andalso functional_filter(?SCENE_ID, Atter, Defer) andalso common_filter(Atter, Defer);
% 怪物攻击目标是人/宠物 - 无阵营模式 (如果怪物有归属者，只能攻击归属者或归属着队友)
filter_pk_target(#bt_state{type = ?BATTLE_MON, realm = 0} = Atter, #bt_state{type = ObjType} = Defer) when ObjType =/= ?BATTLE_MON ->
    #bt_state{owner_id = AOwnerId, owner_team = AOwnerTeam} = Atter,
    if
        AOwnerId =:= 0 andalso AOwnerTeam =:= 0 ->
            true;
        true ->
            DOwnerId = ?iif(ObjType =:= ?BATTLE_ROLE, Defer#bt_state.id, Defer#bt_state.owner_id),
            if
                AOwnerId =:= DOwnerId -> true;
                AOwnerTeam =:= Defer#bt_state.team andalso AOwnerTeam =/= 0 -> true;
                true -> false
            end
    end;
% 怪物攻击目标是人/宠物 - 阵营模式
filter_pk_target(#bt_state{type = ?BATTLE_MON, realm = ARealm}, #bt_state{type = ObjType, realm = DRealm}) when ObjType =/= ?BATTLE_MON ->
    ARealm =/= DRealm;
% 怪物攻击怪物
filter_pk_target(#bt_state{type = ?BATTLE_MON, realm = ARealm}, #bt_state{realm = DRealm}) ->
    if
        ARealm =:= 0 -> false;                          % 普通怪物不能相互攻击
        ARealm =:= DRealm -> false;                     % 相同阵营的怪物不同相互攻击
        true -> true
    end;
filter_pk_target(_Atter, _Defer) ->
    false.

%% 功能性、玩法性过滤
functional_filter(?SCENE_ID_LAKE_BANDITS, #bt_state{id = AtterId, level = ALevel}, #bt_state{level = DLevel, minfo = DMInfo}) ->
    lib_scene_lake:filter_target(DMInfo, ALevel, DLevel, AtterId);      % 镜湖剿匪
functional_filter(_, _, _) ->
    true.

%% 模式过滤是否可以攻击
do_filter_pk_target(Atter, Defer) ->
    SceneType = ?SCENE_TYPE,
    IsWildScene = lists:member(SceneType, ?WILD_SCENE_TYPES),
    #bt_state{realm = ARealm, rival_guild_map = RivalGuildMap, attackable = AttackableSet} = Atter,
    #bt_state{type = DType, id = DId, realm = DRealm, guild = DGuild} = Defer,
    DOwnerId = ?iif(DType =:= ?BATTLE_PET, Defer#bt_state.owner_id, 0),
    common_filter(Atter, Defer) andalso (
        ARealm =/= DRealm orelse                                                        % 阵营不一样，不管其他条件
        do_filter_pk_target_rival_guild(RivalGuildMap, DGuild, IsWildScene) orelse      % 宣战帮派过滤
        do_filter_pk_target_hostile_guild(Atter, Defer, IsWildScene) orelse             % 敌对帮派过滤
        do_filter_pk_target_mode(Atter, Defer) orelse                                   % 模式过滤
        sets:is_element(DId, AttackableSet) orelse                                      % 宣战/被宣战过滤
        sets:is_element(DOwnerId, AttackableSet)                                        % 珍兽 宣战/被宣战过滤
    ).

% 通用过滤(人、怪、珍兽通用)，高优先级
common_filter(#bt_state{realm = ARealm, team = ATeam}, #bt_state{realm = DRealm, team = DTeam, x = DX, y = DY}) ->
    (not lib_scene_sign:is_safe_pos(?SCENE_ID, DX, DY)) andalso                             % 安全位置
    (ARealm =/= DRealm orelse (ARealm =:= 0 andalso (ATeam =/= DTeam orelse ATeam =:= 0))). % 阵营过滤 + 队伍过滤

%% 帮派宣战过滤
do_filter_pk_target_rival_guild(RivalGuildMap, DGuild, true) ->
    maps:get(DGuild, RivalGuildMap, 0) > time:unixtime();
do_filter_pk_target_rival_guild(_RivalGuildMap, _DGuild, _IsWildScene) ->
    false.

%% 帮派敌对过滤
do_filter_pk_target_hostile_guild(Atter, Defer, true) ->
    lib_battle_chk:check_hostile(Atter, Defer);
do_filter_pk_target_hostile_guild(_Atter, _Defer, _InWildScene) ->
    false.

%% 模式过滤
do_filter_pk_target_mode(#bt_state{mode = ?MODE_PEACE}, Defer) ->
    Defer#bt_state.type =:= ?BATTLE_MON;
do_filter_pk_target_mode(#bt_state{mode = ?MODE_GUILD, guild = AGuild}, #bt_state{guild = DGuild}) ->
    AGuild =/= DGuild orelse AGuild =:= 0;
do_filter_pk_target_mode(#bt_state{mode = ?MODE_TEAM, team = ATeam}, #bt_state{team = DTeam}) ->
    ATeam =/= DTeam orelse ATeam =:= 0;
do_filter_pk_target_mode(#bt_state{mode = ?MODE_SERVER, server_num = AServerNum}, #bt_state{server_num = DServerNum}) ->
    AServerNum =/= DServerNum;
do_filter_pk_target_mode(#bt_state{mode = ?MODE_JUSTICE}, #bt_state{murderous = DMurderous}) ->
    DMurderous > 0.

%% 获取怪物数据
do_get_scene_mon_info(hp, #mon{hp = Hp}) -> Hp;
do_get_scene_mon_info(xy, #mon{x = X, y = Y}) -> {X, Y};
do_get_scene_mon_info(alive_xy, #mon{hp = Hp, x = X, y = Y}) when Hp > 0 -> {X, Y};
do_get_scene_mon_info(_, _Mon) -> [].

%% 获取角色数据
do_get_scene_role_info(hp, #scene_role{hp = Hp}) -> Hp;
do_get_scene_role_info(xy, #scene_role{x = X, y = Y}) -> {X, Y};
do_get_scene_role_info(alive_xy, #scene_role{hp = Hp, x = X, y = Y, stat = Stat}) when Hp > 0 ->
    ?iif(bit_map:is_set(?SPEC_STAT_BIT_HANGING, Stat), [], {X, Y});
do_get_scene_role_info(_, _SceneRole) -> [].

%% 获取宠物数据
do_get_scene_pet_info(hp, #pet{hp = Hp}) -> Hp;
do_get_scene_pet_info(xy, #pet{x = X, y = Y}) -> {X, Y};
do_get_scene_pet_info(alive_xy, #pet{hp = Hp, x = X, y = Y}) when Hp > 0 -> {X, Y};
do_get_scene_pet_info(_, _Pet) -> [].


% 计算平方
square(X) ->
    (X * X).

get_extra_harm(#bt_state{x = AX, y = AY} = Atter, Defer, {Conds, Percentage}) ->
    ChkFun = fun
        ({?EXTRA_EF_OBJ_SELF, CondType, Cond}) ->
            lib_battle_chk:check_extra_ef_cond(Atter, CondType, Cond, #{});
        ({?EXTRA_EF_OBJ_TARGET, CondType, Cond}) ->
            CheckArgs = #{atter_xy => {AX, AY}},
            lib_battle_chk:check_extra_ef_cond(Defer, CondType, Cond, CheckArgs)
    end,
    case lists:any(ChkFun, Conds) of
        true -> Percentage;
        false -> 0
    end.

%% 定向伤害
get_caster_harm(Atter, Defer) ->
    AtterKey = {Atter#bt_state.type, Atter#bt_state.id},
    FoldFun = fun
        (#effect{caster = Caster, param = {Perc, Const}}, {AccPerc, AccConst}) when Caster =:= AtterKey ->
            {AccPerc + Perc, AccConst + Const};
        (_Effect, Acc) ->
            Acc
    end,
    CasterEffect = lib_effect_util:get_effects_by_mod(effect_caster, Defer#bt_state.effect_list, #{}),
    lists:foldl(FoldFun, {0, 0}, CasterEffect).

%% 基础伤害计算
calc_basic_hurt(ACareer, AAtkType, ALevel, AtterAttr, AtterKlv, DeferAttr, DeferKlv) ->
    {ACareerInnerFact, ACareerOuterFact} = conf_battle_career_fact:get_atk_factor(ACareer, AAtkType, ALevel),
    #{inner_att:=AInnerAttC, inner_att_factor:=AInnerAttFactor, outer_att:=AOuterAttC, outer_att_factor:=AOuterAttFactor} = AtterKlv,
    #{inner_def:=DInnerDefC, inner_def_factor:=DInnerDefFactor, outer_def:=DOuterDefC, outer_def_factor:=DOuterDefFactor} = DeferKlv,
    #bt_attr{inner_att = AInnerAtt, outer_att = AOuterAtt} = AtterAttr,
    #bt_attr{inner_att = DInnerDef, outer_def = DOuterDef} = DeferAttr,
    (AInnerAtt * ACareerInnerFact * (AInnerAtt + AInnerAttC) / (AInnerAtt * AInnerAttFactor + DInnerDef * DInnerDefFactor + DInnerDefC)) +
        (AOuterAtt * ACareerOuterFact * (AOuterAtt + AOuterAttC) / (AOuterAtt * AOuterAttFactor + DOuterDef * DOuterDefFactor + DOuterDefC)).

% 属性伤害计算
calc_attr_harm(AttrFactor, #bt_state{attr = AtterAttr} = Atter, #bt_state{attr = DeferAttr} = Defer) ->
    #bt_attr{
        aatt_ice = AIce, aatt_fire = AFire, aatt_dark = ADark, aatt_poison = APoison,
        ahurt_add_ice = AHurtAddIce, ahurt_add_fire = AHurtAddFire,
        ahurt_add_dark = AHurtAddDark, ahurt_add_poison = AHurtAddPoison,
        adef_red_ice = ADefRedIce, adef_red_fire = ADefRedFire,
        adef_red_dark = ADefRedDark, adef_red_poison = ADefRedPoison,
        adef_min_ice = ADefMinIce, adef_min_fire = ADefMinFire,
        adef_min_dark = ADefMinDark, adef_min_poison = ADefMinPoison,
        ahurt_add = AHurtAddAttr,
        ahurt_perc_ice = AHurtPercIce, ahurt_perc_fire = AHurtPercFire,
        ahurt_perc_dark = AHurtPercDark, ahurt_perc_poison = AHurtPercPoison
    } = AtterAttr,
    #bt_attr{
        adef_ice = DDefIce, adef_fire = DDefFire,
        adef_dark = DDefDark, adef_poison = DDefPoison,
        ahurt_red = DHurtRedAttr,
        ahurt_red_ice = DHurtRedIce, ahurt_red_fire = DHurtRedFire,
        ahurt_red_dark = DHurtRedDark, ahurt_red_poison = DHurtRedPoison,
        aaffect_perc_ice = DAffectPercIce, aaffect_perc_fire = DAffectPercFire,
        aaffect_perc_dark = DAffectPercDark, aaffect_perc_poison = DAffectPercPoison
    } = DeferAttr,
    {IceFact, FireFact, DarkFact, PoisonFact} = AttrFactor,

    % 冰
    AIceAtt = (AIce + AHurtAddIce - DHurtRedIce),
    IceRD = ADefRedIce - DDefIce,
    IceHarm = case IceRD >= 0 of
        true -> AIceAtt * (1 + min(ADefMinIce, IceRD) / 100);
        false -> AIceAtt * (1 + max(-100, IceRD) / 100)
    end,
    IceHurt = max(0, IceFact * IceHarm * min(2, 1 + (AHurtPercIce - DAffectPercIce + AHurtAddAttr - DHurtRedAttr) / 10000)),

    % 火
    AFireAtt = (AFire + AHurtAddFire - DHurtRedFire),
    FireRD = ADefRedFire - DDefFire,
    FireHarm = case FireRD >= 0 of
        true -> AFireAtt * (1 + min(ADefMinFire, FireRD) / 100);
        false -> AFireAtt * (1 + max(-100, FireRD) / 100)
    end,
    FireHurt = max(0, FireFact * FireHarm * min(2, 1 + (AHurtPercFire - DAffectPercFire + AHurtAddAttr - DHurtRedAttr) / 10000)),

    % 玄
    ADarkAtt = (ADark + AHurtAddDark - DHurtRedDark),
    DarkRD = ADefRedDark - DDefDark,
    DarkHarm = case DarkRD >= 0 of
        true -> ADarkAtt * (1 + min(ADefMinDark, DarkRD) / 100);
        false -> ADarkAtt * (1 + max(-100, DarkRD) / 100)
    end,
    DarkHurt = max(0, DarkFact * DarkHarm * min(2, 1 + (AHurtPercDark - DAffectPercDark + AHurtAddAttr - DHurtRedAttr) / 10000)),

    % 毒
    APoisonAtt = (APoison + AHurtAddPoison - DHurtRedPoison),
    PoisonRD = ADefRedPoison - DDefPoison,
    PoisonHarm = case PoisonRD >= 0 of
        true -> APoisonAtt * (1 + min(ADefMinPoison, PoisonRD) / 100);
        false -> APoisonAtt * (1 + max(-100, PoisonRD) / 100)
    end,
    PoisonHurt = max(0, PoisonFact * PoisonHarm * min(2, 1 + (AHurtPercPoison - DAffectPercPoison + AHurtAddAttr - DHurtRedAttr) / 10000)),

    % 计算攻方属性加成效果
    #bt_state{hp = AtterHp, peffect_map = APEffectMap} = Atter,
    AHpPerc = AtterHp * 10000 div AtterAttr#bt_attr.hp_lim,
    EnHarmAttrEffects = maps:get(effect_enharm_attr, APEffectMap, []),
    DeferHp = Defer#bt_state.hp,
    DHpPerc = DeferHp * 10000 div DeferAttr#bt_attr.hp_lim,
    SumEnHarmFun = fun
        (#effect{param = [0, HpPercMin, HpPercMax, EnHarms]}, AccEnHarms) ->
             % 己方血量条件
             case AHpPerc >= HpPercMin andalso AHpPerc =< HpPercMax of
                 true -> update_enharm_attr(EnHarms, AccEnHarms);
                 false -> AccEnHarms
             end;
        (#effect{param = [1, HpPercMin, HpPercMax, EnHarms]}, AccEnHarms) ->
             % 目标血量条件
             case DHpPerc >= HpPercMin andalso DHpPerc =< HpPercMax of
                 true -> update_enharm_attr(EnHarms, AccEnHarms);
                 false -> AccEnHarms
             end
    end,
    AttrEnharm = lists:foldl(SumEnHarmFun, {10000,10000,10000,10000}, EnHarmAttrEffects),

    % 计算守方受属性伤害加成
    #bt_state{effect_list = DEffectList, peffect_map = DPEffectMap} = Defer,
    DEnHarmAttrEffects = lib_effect_util:get_effects_by_mod(effect_denharm_attr, DEffectList, DPEffectMap),
    SumDEnHarmFun = fun(#effect{param = EnHarms}, AccEnHarms) -> update_enharm_attr(EnHarms, AccEnHarms) end,
    {IceEnHarm, FireEnHarm, DarkEnHarm, PoisonEnHarm} = lists:foldl(SumDEnHarmFun, AttrEnharm, DEnHarmAttrEffects),

    % 总属性伤害
    erlang:floor(IceHurt * IceEnHarm + FireHurt * FireEnHarm + DarkHurt * DarkEnHarm + PoisonHurt * PoisonEnHarm) div 10000.

%% 基础回血计算
% 外攻型
calc_basic_cure(?ATK_TYPE_OUTER, AtterAttr, ACureCareerFact) ->
    ACureFact = maps:get(cure_fact, ACureCareerFact, 0),
    AOuterAtt = AtterAttr#bt_attr.outer_att,
    AOuterAtt * ACureFact / 10000;
% 内攻型
calc_basic_cure(?ATK_TYPE_INNER, AtterAttr, ACureCareerFact) ->
    ACureFact = maps:get(cure_fact, ACureCareerFact, 0),
    AInnerAtt = AtterAttr#bt_attr.inner_att,
    AInnerAtt * ACureFact / 10000;
% 平衡型
calc_basic_cure(?ATK_TYPE_BALANCE, AtterAttr, ACureCareerFact) ->
    ACureFact = maps:get(cure_fact, ACureCareerFact, 1),
    #bt_attr{inner_att = AInnerAtt, outer_att = AOuterAtt} = AtterAttr,
    (AInnerAtt + AOuterAtt) * ACureFact / 10000.

%% 属性回血计算 (所有攻击类型通用)
calc_attr_cure(AtterAttr, CureCareerFact, AttrFactor) ->
    AttrCureFact = maps:get(attr_cure_fact, CureCareerFact, 1),
    #bt_attr{
        aatt_ice = AIce, aatt_fire = AFire,
        aatt_dark = ADark, aatt_poison = APoison
    } = AtterAttr,
    {IceFact, FireFact, DarkFact, PoisonFact} = AttrFactor,
    (AIce * IceFact + AFire * FireFact + ADark * DarkFact + APoison * PoisonFact) * AttrCureFact.

%% 头衔增加伤害
title_honor_add_hurt(#bt_state{type = ?BATTLE_ROLE, title_honor = ATH}, #bt_state{type = ?BATTLE_ROLE, title_honor = BTH})
    when ATH > 0 andalso ATH > BTH ->
    case conf_title_honor:get(ATH) of
        #{addition := Addition} when Addition > 0 ->
            Addition * 100;
        _ ->
            0
    end;
title_honor_add_hurt(_, _) ->
    0.

% 计算主动治疗系数(主治疗增减益效果)
calc_active_cure_fact(Atter) ->
    #bt_state{career = ACareer, effect_list = EffectList, peffect_map = PEffectMap} = Atter,
    #{active_cure_fact := ActiveCureFact} = conf_battle_career_fact:get_cure(ACareer),
    ACureEffectList = lib_effect_util:get_effects_by_mod(effect_acure_fact, EffectList, PEffectMap),
    CalcACureFactFun = fun(#effect{param = [Param]}, AccFact) -> AccFact + Param end,
    lists:foldl(CalcACureFactFun, ActiveCureFact, ACureEffectList).

% 计算被动治疗系数(被治疗增减益效果)
calc_passive_cure_fact(Defer) ->
    #bt_state{career = DCareer, effect_list = EffectList, peffect_map = PEffectMap} = Defer,
    #{passive_cure_fact := PassiveCureFact} = conf_battle_career_fact:get_cure(DCareer),
    PCureEffectList = lib_effect_util:get_effects_by_mod(effect_pcure_fact, EffectList, PEffectMap),
    CalcPCureFactFun = fun(#effect{param = [Param]}, AccFact) -> AccFact + Param end,
    lists:foldl(CalcPCureFactFun, PassiveCureFact, PCureEffectList).

% 计算主动伤害系数(伤害增减益效果)
calc_active_harm_fact(Atter) ->
    #bt_state{career = ACareer, effect_list = EffectList, peffect_map = PEffectMap} = Atter,
    #{active_harm_fact := ActiveHarmFact} = conf_battle_career_fact:get_harm(ACareer),
    AHarmEffectList = lib_effect_util:get_effects_by_mod(effect_aharm_fact, EffectList, PEffectMap),
    CalcAHarmFactFun = fun(#effect{param = [Param]}, AccFact) -> AccFact + Param end,
    lists:foldl(CalcAHarmFactFun, ActiveHarmFact, AHarmEffectList).

% 计算被动伤害系数(被伤害增减益效果)
calc_passive_harm_fact(Defer) ->
    #bt_state{career = DCareer, effect_list = EffectList, peffect_map = PEffectMap} = Defer,
    #{passive_harm_fact := PassiveHarmFact} = conf_battle_career_fact:get_harm(DCareer),
    PHarmEffectList = lib_effect_util:get_effects_by_mod(effect_pharm_fact, EffectList, PEffectMap),
    CalcPHarmFactFun = fun(#effect{param = [Param]}, AccFact) -> AccFact + Param end,
    lists:foldl(CalcPHarmFactFun, PassiveHarmFact, PHarmEffectList).

% 各种伤害加成
cal_total_addon_harm(Atter, Defer, BaseSkill, Harm) ->
    EnHarmEffects = maps:get(effect_enharm, Atter#bt_state.peffect_map, []),
    EnHarmRatio = calc_enharm_ratio(EnHarmEffects, Defer),                                                      % 伤害加成效果

    ExtraHarmPerc = case BaseSkill#base_skill.extra_harm of                                                     % 额外伤害万分比
        ConfExtraHarm when ConfExtraHarm =/= {} -> get_extra_harm(Atter, Defer, ConfExtraHarm);
        _ -> 0
    end,
    AHarmFact = calc_active_harm_fact(Atter),                                                                   % 主动伤害系数
    PHarmFact = calc_passive_harm_fact(Defer),                                                                  % 被动伤害系数
    HarmFact = max(0, AHarmFact * PHarmFact),                                                                   % 伤害系数
    ReducePerc = lib_effect_util:get_onbectrl_reduce(Defer),                                                    % 被控制伤害减免
    TitleHonorPerc = title_honor_add_hurt(Atter, Defer),                                                        % 头衔增加伤害
    {CasterHarmPerc, CasterHarmConst} = get_caster_harm(Atter, Defer),                                          % 定向伤害
    HarmMul = HarmFact * (10000+EnHarmRatio+ExtraHarmPerc+CasterHarmPerc+TitleHonorPerc-ReducePerc) / 10000,    % 伤害乘法系数(各个加成)
    TotalHarmT = trunc(Harm * HarmMul) + CasterHarmConst,                                                       % 总伤害

    % 锁血效果最大伤害保护
    LockHarm = effect_lockhp:get_defer_lock_harm(Defer),
    min(TotalHarmT, LockHarm).

% 属性伤害加成
update_enharm_attr([{Idx, EnHarmRatio} | Rest], EnHarms) ->
    Ratio = element(Idx, EnHarms),
    EnHarmsN = setelement(Idx, EnHarms, Ratio + EnHarmRatio),
    update_enharm_attr(Rest, EnHarmsN);
update_enharm_attr([], EnHarms) ->
    EnHarms.

% 伤害加成效果
calc_enharm_ratio([], _Defer) ->
    0;
calc_enharm_ratio(EnHarmEffects, #bt_state{effect_list = EffList}) ->
    SumEnHarmFun = fun(#effect{param = [Kinds, Types, Ratio]}, AccRatio) ->
        HasKindFun = fun(Kind) -> lib_effect_util:has_kind_effect(Kind, EffList) end,
        HasTypeFun = fun(Type) ->
             lib_effect_util:has_type_effect(Type, EffList)
        end,
        case lists:any(HasKindFun, Kinds) orelse lists:any(HasTypeFun, Types) of
            true -> Ratio + AccRatio;
            false -> AccRatio
        end
    end,
    lists:foldl(SumEnHarmFun, 0, EnHarmEffects).
