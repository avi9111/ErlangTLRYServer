%%-------------------------------------------------------
%% @File     : statem_role_die.erl
%% @Brief    : 人物死亡状态
%% @Author   : cablsbs
%% @Date     : 2018-7-13
%%-------------------------------------------------------

-module(statem_role_die).

-include("scene.hrl").
-include("battle.hrl").
-include("proto/prot_901.hrl").
-include("proto/prot_902.hrl").
-include("proto/prot_903.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter([BtRetAtter, _NowTimeMS], State) ->
    hide_scene_pet(State#scene_role.id),                                            % 隐藏珍兽
    SceneId = ?SCENE_ID, LineId = ?LINE_ID, SceneType = ?SCENE_TYPE,
    #bt_return_atter{id = KillerId, guild_id = KillerGuildId, type = KillerType} = BtRetAtter,
    #scene_role{id = RoleId, pid = RolePid, sid = RoleSid, x = X, y = Y, header = Header} = State,

    % 击杀角色处理
    KillerOwnerId = BtRetAtter#bt_return_atter.owner_id,
    svr_dynasty_war_bat:kill_role(SceneId, LineId, KillerOwnerId, RoleId),
    svr_career_battle_bat:kill_role(SceneId, LineId, KillerOwnerId),
    svr_territory_battle:kill_role(SceneId, LineId, KillerOwnerId, RoleId),
    svr_dungeon:role_die(SceneId, LineId, RoleId),
    lib_scene_arena:obj_die_check(SceneType, ?BATTLE_ROLE, State#scene_role.id),
    lib_scene_master:role_die(SceneId, RoleId),
    lib_scene_lake:role_die(SceneId, State#scene_role.id, X, Y),
    lib_scene_jousts:role_die(SceneId, State#scene_role.id, X, Y, KillerOwnerId),

    % 角色被杀、击杀消息
    lib_role:info_role(RolePid, {'be_kill', SceneId, KillerId, KillerType, KillerOwnerId, KillerGuildId}),
    KillerOwnerId > 0 andalso lib_scene_api:is_add_exploit_scene(SceneId)
        andalso lib_role:mod_info(KillerOwnerId, lib_role_guild, {'add_exploit', State#scene_role.guild}),
    {DeclareMapN, RivalMapN, AttackableN} =
        case KillerOwnerId > 0 of
            true ->
                #scene_role{
                    guild = GuildId, name = RoleName, murderous = Murderous,
                    declare_map = DeclareMap, rival_map = RivalMap, attackable = Attackable
                } = State,
                IsAddMurderous = lib_scene_agent:is_add_murderous(),
                IsBeDeclared = maps:is_key(KillerOwnerId, DeclareMap),
                KillerPid = lib_scene_agent:get_role_pid(KillerOwnerId),
                lib_role:info_role(KillerPid, {'kill_role', RoleId, GuildId, RoleName, Murderous, IsBeDeclared, IsAddMurderous, Header}),
                RivalMapT = maps:remove(KillerOwnerId, RivalMap),
                DeclareMapT = maps:remove(KillerOwnerId, DeclareMap),
                AttackableT = sets:del_element(KillerOwnerId, Attackable),
                gen_server:cast(self(), {'del_attackable', KillerOwnerId, RoleId}),
                {RivalMapT, DeclareMapT, AttackableT};
            false ->
                {State#scene_role.declare_map, State#scene_role.rival_map, State#scene_role.attackable}
        end,
    lib_scene_cmd:scene_cmd('effect_dead_clear', {?BATTLE_ROLE, RoleId}),

    lib_obj_util:bcast_die(?BATTLE_ROLE, RoleId, X, Y),
    NotifyKillRoleMsg = #notify_kill_role{
        dead_type = ?BATTLE_ROLE,
        dead_id = State#scene_role.id,
        dead_name = State#scene_role.name
    },
    {ok, NotifyKillRoleBin} = prot_msg:encode_msg(90247, NotifyKillRoleMsg),
    lib_role_send:send_to_role(KillerOwnerId, NotifyKillRoleBin),
    NotifyDieMsg = #notify_role_die{
        killer_type = BtRetAtter#bt_return_atter.type,
        killer_id = BtRetAtter#bt_return_atter.id,
        killer_name = BtRetAtter#bt_return_atter.name,
        die_time = time:unixtime()
    },
    {ok, NotifyDieBin} = prot_msg:encode_msg(90106, NotifyDieMsg),
    NotifyDelRivalMsg = #notify_del_rival{rival_id = KillerOwnerId},
    {ok, NotifyDelRivalBin} = prot_msg:encode_msg(90117, NotifyDelRivalMsg),
    lib_role_send:send_to_sid(RoleSid, <<NotifyDieBin/binary, NotifyDelRivalBin/binary>>),

    State#scene_role{
        hp = 0, float_xy = {X, Y}, gradient = {0, 0},
        declare_map = DeclareMapN, rival_map = RivalMapN,
        attackable = AttackableN, shield = undefined
    }.

state_update(_NowTime, _ElapseTime, #scene_role{statem = #statem{state_time = StateTime}} = State) ->
    ReviveType = lib_scene_agent:get_revive_type(),
    ReviveParam = lib_scene_agent:get_revive_param(),
    IsForbidden = bit_map:is_set(?REVIVE_BIT_FORBIDDEN, ReviveType),
    {_, CdTime} = util:list_find(?REVIVE_PARAM_CD, 1, ReviveParam, {?REVIVE_PARAM_CD, 0}),
    if
        IsForbidden -> State;
        StateTime < CdTime * 1000 -> State;
        true -> lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, State)
    end.

state_quit(#scene_role{id = RoleId, revive_type = ReviveType, bt_attr = BtAttr} = State) ->
    case bit_map:is_set(?REVIVE_BIT_BY_MATE, ReviveType) of
        true ->
            % 配偶复活
            RevivePerc = lib_obj_role:get_revive_perc_by_mate(RoleId),
            #bt_attr{hp_lim = HpLim, mp_lim = MpLim} = BtAttr,
            Hp = RevivePerc * HpLim div 100,
            Mp = RevivePerc * MpLim div 100,
            StateN = State#scene_role{hp = Hp, mp = Mp, revive_type = ?REVIVE_DEFAULT},             % 退出状态时清除 revive_type
            send_revive_msg(StateN),
            StateN;
        false ->
            % 常规复活
            ReviveTypeFix = case ReviveType of
                ?REVIVE_DEFAULT -> %% 先剔除一些带特殊条件的复活位
                    RT = bit_map:unset(?REVIVE_BIT_BY_MATE, lib_scene_agent:get_revive_type()),
                    bit_map:unset(?REVIVE_BIT_RIGHT_HERE, RT);
                _ ->
                    ReviveType
            end,
            SceneID = ?SCENE_ID,
            LineID = ?LINE_ID,
            {ReviveScene, ReviveX, ReviveY} = get_revive_scene_pos(ReviveTypeFix, State),
            IsRightHere = bit_map:is_set(?REVIVE_BIT_RIGHT_HERE, ReviveType) andalso ReviveScene =:= SceneID,

            % set revive hp and mp
            #bt_attr{hp_lim = HpLim, mp_lim = MpLim} = BtAttr,
            {Hp, Mp} = if
                IsRightHere ->
                    {HpLim, MpLim};
                true -> %% 按场景配置的复活百分比
                    {HpRate, MpRate} = get(revive_recover),
                    {HpRate * HpLim div 10000, MpRate * MpLim div 10000}
            end,
            StateT = State#scene_role{hp = Hp, mp = Mp, revive_type = ?REVIVE_DEFAULT},             % 退出状态时清除 revive_type

            if
                ReviveScene =:= SceneID ->
                    StateN = lib_obj_util:set_obj_xy(ReviveX, ReviveY, {ReviveX, ReviveY}, StateT),
                    send_revive_msg(StateN),
                    StateN;
                true ->
                    lib_scene_api:change_scene_async(StateT#scene_role.id, ReviveScene, ?DYN_LINE_ID, ReviveX, ReviveY),
                    svr_dungeon:leave(SceneID, LineID, RoleId),                                     % 判断能否离开副本
                    StateT
            end
    end.


%% Privates ---------------------------------------------
% 地府复活
get_revive_scene_pos(?REVIVE_DEFAULT, _Scenerole) ->
    #scene{x = X, y = Y} = conf_scene:get(?SCENE_ID_NETHER),
    {?SCENE_ID_NETHER, X, Y};
% 其他复活 (复活请求可以设置角色的 revive_type 的值)
get_revive_scene_pos(ReviveType, SceneRole) ->
    SceneID = ?SCENE_ID,
    #scene_role{
        wild_scene = WildScene,
        ready_scene = ReadyScene,
        x = X, y = Y, realm = Realm
    } = SceneRole,
    IsDynastyScene = lib_dynasty_war:is_battle_scene(SceneID),
    IsTerritoryScene = lib_territory_mgr:is_battle_scene(SceneID),
    IsBirthPoint = bit_map:is_set(?REVIVE_BIT_BIRTH_POINT, ReviveType),
    IsReturn = bit_map:is_set(?REVIVE_BIT_RETURN, ReviveType),
    IsBackReady = bit_map:is_set(?REVIVE_BIT_BACK_READY, ReviveType),
    if
        IsBirthPoint andalso IsDynastyScene ->
            {Xd, Yd} = lib_dynasty_war_b:born_pos(Realm),
            {SceneID, Xd, Yd};
        IsBirthPoint andalso IsTerritoryScene ->
            {Xd, Yd} = lib_territory_mgr:born_pos(Realm),
            {SceneID, Xd, Yd};
        IsBirthPoint -> %% 普通出生点
            ConfScene = conf_scene:get(SceneID),
            {SceneID, ConfScene#scene.x, ConfScene#scene.y};
        IsReturn andalso WildScene =/= 0 ->
            #scene_role{wild_x = WX, wild_y = WY} = SceneRole,
            {WildScene, WX, WY};
        IsBackReady andalso ReadyScene =/= 0 ->
            #scene_role{ready_x = RX, ready_y = RY} = SceneRole,
            {ReadyScene, RX, RY};
        true -> %% 原地复活
            {SceneID, X, Y}
    end.

% 珍兽隐藏逻辑
hide_scene_pet(RoleId) ->
    case lib_pet_agent:get_role_pet(RoleId) of
        #pet{} = Pet ->
            PetN = lib_obj_pet:hide_pet(Pet),
            lib_pet_agent:put_pet(PetN);
        _ ->
            skip
    end.

% 珍兽显现逻辑
show_scene_pet(RoleId, X, Y) ->
    case lib_pet_agent:get_role_pet(RoleId) of
        #pet{} = Pet ->
            PetN = lib_obj_pet:show_pet(X, Y, Pet),
            lib_pet_agent:put_pet(PetN);
        _ ->
            skip
    end.

send_revive_msg(#scene_role{id = RoleId, sid = RoleSid, x = X, y = Y, hp = Hp, mp = Mp, bt_attr = BtAttr} = SceneRole) ->
    show_scene_pet(X, Y, RoleId),                                               % 显现珍兽
    HpLim = BtAttr#bt_attr.hp_lim,
    BCastReviveMsg = #bcast_revive{
        obj_type = ?BATTLE_ROLE, obj_id = RoleId,
        hp = Hp, hp_lim = HpLim, x = X, y = Y
    },
    {ok, BCastReviveBin} = prot_msg:encode_msg(90308, BCastReviveMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, <<BCastReviveBin/binary>>),
    lib_team_agent:sync_team_hp(SceneRole, true),
    NotifyReviveMsg = #notify_role_revive{hp = Hp, mp = Mp, x = X, y = Y, bt_attr = BtAttr},
    {ok, NotifyReviveBin} = prot_msg:encode_msg(90107, NotifyReviveMsg),
    lib_role_send:send_to_sid(RoleSid, NotifyReviveBin).
