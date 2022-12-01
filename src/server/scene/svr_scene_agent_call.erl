%%-------------------------------------------------------
%% @File     : svr_scene_agent_call.erl
%% @Brief    : 场景进程 call消息处理
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%-------------------------------------------------------
-module(svr_scene_agent_call).

-export([handle_call/3]).

-include("log.hrl").
-include("scene.hrl").
-include("ret_code.hrl").

% @doc 角色切场景前，数据回存
handle_call({'change_scene_restore', RoleId}, _From, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{hp = Hp, mp = Mp, bt_attr = BtAttr} = SceneRole0 ->
            #bt_attr{hp_lim = HpLim, mp_lim = MpLim} = BtAttr,
            {HpFix, MpFix} = if
                Hp > 0 ->
                    {Hp, Mp};
                true ->
                    {HpRate, MpRate} = get(revive_recover),
                    {HpRate * HpLim div 10000, MpRate * MpLim div 10000}
            end,
            ConfScene = conf_scene:get(State#scene.id),
            #scene{clear_effects = EffectIds} = ConfScene,
            SceneRole = lib_effect_util:del_by_effect_ids(SceneRole0, EffectIds),
            #scene_role{
                mode = Mode, x = X, y = Y, reset_index = ResetIndex, hp = Hp, mp = Mp,
                anger = Anger, skill_cd = SkillCd, effect_cd = EffectCd,
                exteriors = Exteriors, declare_map = DeclareMap, rival_map = RivalMap
            } = SceneRole,
            SceneData = {Mode, X, Y, ResetIndex},
            PetData = lib_pet_agent:pet_restore_data(RoleId),
            HorseStat = lib_role_exterior:get_horse_flag(Exteriors),
            Restore = [
                SceneData, HpFix, HpLim, MpFix, MpLim, Anger, SkillCd,
                EffectCd, PetData, HorseStat, DeclareMap, RivalMap
            ],
            {reply, {ok, Restore}, State};
        _ ->
            % ?ERROR("Not found Role: ~p data in scene: ~p, while call change_scene_restore", [RoleId, State#scene.id]),
            {reply, error, State}
    end;

% @doc 玩家主动请求复活
handle_call({'role_revive', RoleId, ReviveType}, _From, State) ->
    Resp = case lib_scene_agent:get_roler(RoleId) of
        #scene_role{statem = #statem{cur_state_id = ?STATE_DIE, state_time = StateTime}} = SceneRole ->
            ReviveParam = lib_scene_agent:get_revive_param(),
            {_, CdTime} = util:list_find(?REVIVE_PARAM_CD, 1, ReviveParam, {?REVIVE_PARAM_CD, 0}),
            if
                StateTime > CdTime*1000 ->
                    {error, ?RC_REVIVE_EXPIRE_MANUAL_TIME};
                true ->
                    SceneRoleT = SceneRole#scene_role{revive_type = ReviveType},
                    SceneRoleN = lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, SceneRoleT),
                    lib_team_agent:sync_team_hp(SceneRoleN, true),
                    lib_scene_agent:put_roler(SceneRoleN),
                    ok
            end;
        _ ->
            ok
    end,
    {reply, Resp, State};

% @doc 默认匹配
handle_call(Msg, From, #scene{id = SceneId, line = LineId} = State) ->
    ?ERROR("Recv unexpected call Msg: ~p From: ~p in {SceneId: ~p, Line: ~p}", [Msg, From, SceneId, LineId]),
    {reply, ok, State}.

%% Privates ---------------------------------------------
