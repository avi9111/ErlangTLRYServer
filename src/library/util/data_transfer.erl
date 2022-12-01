%%-------------------------------------------------------
%% @File     : data_transfer.erl
%% @Brief    : 数据转换模块
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%-------------------------------------------------------
-module(data_transfer).

-include("log.hrl").
-include("role.hrl").
-include("scene.hrl").
-include("skill.hrl").
-include("title.hrl").
-include("battle.hrl").
-include("effect.hrl").
-include("statem.hrl").


%% sc_transfer
-export([
    sc_skill_list/1,
    sc_role_scene_info/1,
    sc_role_scene_info_list/1,
    sc_mon_scene_info/1,
    sc_mon_scene_info_list/1,
    sc_pet_scene_info/1,
    sc_pet_scene_info_list/1,
    sc_coll_scene_info/1,
    sc_coll_scene_info_list/1,
    sc_carry_scene_info/1,
    sc_carry_scene_info_list/1,
    sc_flyitem_scene_info/1,
    sc_flyitem_scene_info_list/1,
    sc_clt_pet/1,
    sc_clt_pets/1,
    sc_clt_dpet/1,
    sc_clt_dpets/1,
    sc_clt_attach/1,
    sc_clt_attachs/1
]).


%% inner_transfer
-export([
    to_scene_pet/1,
    to_scene_role/1,
    view_to_scene_role/2,
    to_scene_obj_info/2,
    to_bt_state/1,
    to_fight_pet/2
]).


%%% 命名说明 ================================================
%%% sc_data_struct: 服务端发送数据给客户端的转换逻辑
%%% data_struct:    服务端内部数据转换逻辑
%%% 命名说明 ================================================


%%% Apis proto transfers ------------------------------------
% @doc 角色技能数据转换
% @spec sc_skill_list(SkillList) -> SkillListTupleList.
% SkillList             :: [#skill{}].
% SkillListTupleList    :: [{Id, Level}]
sc_skill_list(SkillList) ->
    [{Id, Level, Guide, Legend} || #skill{id = Id, level = Level, hero = Guide, legend = Legend} <- SkillList].


% @doc 打包玩家场景协议数据
% @spec sc_role_scene_info(RoleData) -> #role_scene_info{}.
% RoleData      :: #role_state{} | #scene_role{}
sc_role_scene_info(#scene_role{id = RoleId} = SceneRole) ->
    #scene_role{
        owner = Owner,
        server_num = ServerNum,
        name = Name,
        career = Career,
        gender = Gender,
        level = Level,
        guild = GuildId,
        guild_name = GuildName,
        team = TeamId,
        realm = Realm,
        x = X, y = Y,
        to_xy = {ToX, ToY},
        hp = Hp, mp = Mp,
        bt_attr = BtAttr,
        combat_power = CombatPower,
        hair = Hair,
        icon = Icon,
        title = Title,
        title_extra = TitleExtra,
        title_quality = TitleQuality,
        fashion = Fashion,
        effect_list = EffectList,
        stat = State,
        stat_params = StateParams,
        murderous = Murderous,
        exteriors = Exteriors,
        artifact = Artifact,
        warrior_soul = WarriorSoul,
        header = Header,
        mate_id = MateID,
        mate_name = MateName,
        tran_stat = TranStat,
        title_honor = TitleHonor
    } = SceneRole,
    Buffs = [
        {AId, EffId, EffLv, Expire}
        || #effect{id = AId, eff_id = EffId, level = EffLv, expire_time = Expire} <- EffectList
    ],
    CurPetId = case lib_scene_agent:get_role_pet_ids(RoleId) of
        [] -> 0;
        [PetId | _] -> PetId
    end,
    OwnerId = maps:get(id, Owner, 0),
    #role_scene_info{
        role_id = RoleId,
        owner_id = OwnerId,
        server_num = ServerNum,
        name = Name,
        career = Career,
        gender = Gender,
        level = Level,
        guild = GuildId,
        guild_name = GuildName,
        team = TeamId,
        realm = Realm,
        x = X, y = Y,
        to_x = ToX, to_y = ToY,
        hp = Hp,
        hp_lim = BtAttr#bt_attr.hp_lim,
        mp = Mp,
        mp_lim = BtAttr#bt_attr.mp_lim,
        move_speed = BtAttr#bt_attr.move_speed,
        combat_power = CombatPower,
        hair = Hair,
        icon = Icon,
        title = Title,
        title_extra = TitleExtra,
        title_quality = TitleQuality,
        fashion = Fashion,
        buffs = Buffs,
        state = State,
        state_params = StateParams,
        murderous = Murderous,
        exteriors = Exteriors,
        artifact = Artifact,
        warrior_soul = WarriorSoul,
        header = Header,
        mate_id = MateID,
        mate_name = MateName,
        cur_pet = CurPetId,
        tran_stat = TranStat,
        title_honor = TitleHonor
    };
% % 需要在角色进程使用
% sc_role_scene_info(#role_state{id = RoleId} = RoleState) ->
%     #role_state{
%         server_num = ServerNum,
%         name = Name,
%         career = Career,
%         gender = Gender,
%         level = Level,
%         hp = Hp,
%         role_scene = #role_scene{x = X, y = Y},
%         personal = Personal,
%         bt_data = #{bt_attr := #bt_attr{hp_lim = HpLim, move_speed = MoveSpeed}, horse_stat := HorseStat},
%         combat_power = CombatPower,
%         effect_list = EffectList,
%         guild_id = GuildId,
%         guild_name = GuildName,
%         murderous = Murderous,
%         mate_id = MateID,
%         mate_name = MateName,
%         stat = State,
%         stat_params = StateParams,
%         tran_stat = TranStat
%     } = RoleState,
%     Buffs = [
%         {AId, EffId, EffLv, Expire}
%         || #effect{id = AId, eff_id = EffId, level = EffLv, expire_time = Expire} <- EffectList
%     ],
%     Exteriors = lib_role_exterior:scene_exteriors(RoleId, HorseStat),
%     #{icon := Icon, title := Title, hair := Hair, fashion := Fashion, title_honor := TitleHonor} = Personal,
%     {SwornName, Quality} = lib_role_sworn:get_sworn_name(RoleId, Title),
%     #role_scene_info{
%         role_id = RoleId,
%         server_num = ServerNum,
%         name = Name,
%         career = Career,
%         gender = Gender,
%         level = Level,
%         guild = GuildId,
%         guild_name = GuildName,
%         x = X,
%         y = Y,
%         hp = Hp,
%         hp_lim = HpLim,
%         move_speed = MoveSpeed,
%         combat_power = CombatPower,
%
%         hair = Hair,
%         icon = Icon,
%         title = Title,
%         title_extra = SwornName,
%         title_quality = Quality,
%         fashion = Fashion,
%         buffs = Buffs,
%         exteriors = Exteriors,
%         murderous = Murderous,
%         title_honor = TitleHonor,
%         mate_id = MateID,
%         mate_name = MateName,
%         state = State,
%         state_params = StateParams,
%         tran_stat = TranStat
%     };
sc_role_scene_info(RoleData) ->
    ?ERROR_FUNC_CALL([RoleData]),
    #role_scene_info{}.


% @doc 打包玩家场景数据列表
% @spec sc_role_scene_info_list(RoleDataList) -> #role_scene_info{}.
% RoleDataList      :: [RoleData]
% RoleData          :: #role_state{} | #scene_role{}
sc_role_scene_info_list(RoleDataList) ->
    [sc_role_scene_info(RoleData) || RoleData <- RoleDataList].


% @doc 打包怪物场景协议数据
% @spec sc_mon_scene_info(Mon) -> #mon_scene_info{}.
% Mon   :: #mon{}
sc_mon_scene_info(#mon{id = MonId} = Mon) ->
    #mon{
        mid = MId,
        level = Level,
        name = Name,
        x = X, y = Y,
        to_xy = {ToX, ToY},
        hp = Hp,
        bt_attr = #bt_attr{hp_lim = HpLim, move_speed = MoveSpeed},
        effect_list = EffectList,
        owner = Owner,
        realm = Realm,
        functional_data = FData,
        attackable = Attackable
    } = Mon,
    Buffs = [
        {AId, EffId, EffLv, Expire}
        || #effect{id = AId, eff_id = EffId, level = EffLv, expire_time = Expire} <- EffectList
    ],
    FirstAtt = lib_scene_agent:get_first_att(FData),
    #mon_scene_info{
        id = MonId,
        mid = MId,
        name = Name,
        level = Level,
        move_speed = MoveSpeed,
        x = X, y = Y,
        to_x = ToX, to_y = ToY,
        hp = Hp,
        hp_lim = HpLim,
        owner_id = maps:get(id, Owner, 0),
        owner_name = maps:get(name, Owner, ""),
        owner_team = maps:get(team, Owner, 0),
        buffs = Buffs,
        realm = Realm,
        first_att = FirstAtt,
        attackable = Attackable
    };
sc_mon_scene_info(Mon) ->
    ?ERROR_FUNC_CALL([Mon]),
    #mon_scene_info{}.

% @doc 打包怪物场景数据列表
% @spec sc_mon_scene_info_list(MonList) -> [#mon_scene_info{}].
% MonList   :: [Mon]
% Mon       :: #mon{}
sc_mon_scene_info_list(MonList) ->
    [sc_mon_scene_info(Mon) || Mon <- MonList].


% @doc 打包宠物场景协议数据
% @spec sc_pet_scene_info(Pon) -> #pet_scene_info{}.
% Pet   :: #pet{}
sc_pet_scene_info(#pet{id = PetId} = Pet) ->
    #pet{
        id = PetId, pet_cid = PetCId, title = {TitleC, TitleS}, name = Name,
        level = Level, star = Star, awaken = Awaken,
        x = X, y = Y, to_xy = {ToX, ToY}, hp = Hp,
        bt_attr = #bt_attr{hp_lim = HpLim, move_speed = MoveSpeed},
        owner = #{id := OwnerId, name := OwnerName}, effect_list = EffectList
    } = Pet,
    Buffs = [
        {AId, EffId, EffLv, Expire}
        || #effect{id = AId, eff_id = EffId, level = EffLv, expire_time = Expire} <- EffectList
    ],
    #pet_scene_info{
        id = PetId,
        pet_cid = PetCId,
        title_c = TitleC,
        title_s = TitleS,
        name = Name,
        level = Level,
        star = Star,
        awaken = Awaken,
        owner_id = OwnerId,
        owner_name = OwnerName,
        move_speed = MoveSpeed,
        x = X, y = Y,
        to_x = ToX, to_y = ToY,
        hp = Hp, hp_lim = HpLim,
        buffs = Buffs
    };
sc_pet_scene_info(Pet) ->
    ?ERROR_FUNC_CALL([Pet]),
    #pet_scene_info{}.

% @doc 打包宠物场景数据列表
% @spec sc_pet_scene_info_list(PetList) -> [#pet_scene_info{}].
% PetList   :: [Pet]
% Pet       :: #pet{}
sc_pet_scene_info_list(PetList) ->
    [sc_pet_scene_info(Pet) || Pet <- PetList].


% @doc 打包采集物场景协议数据
% @spec sc_coll_scene_info(Coll) -> #coll_scene_info{}.
% Coll   :: #coll{}
sc_coll_scene_info(#coll{id = CollId} = Coll) ->
    #coll{
        cid = Cid,
        owner = Owner,
        belonger = Belonger,
        statem = #statem{cur_state_id = Stat},
        x = X, y = Y, realm = Realm
    } = Coll,
    #coll_scene_info{
        id = CollId, coll_cid = Cid,
        owner_id = maps:get(id, Owner, 0),
        belonger_id = maps:get(id, Belonger, 0),
        belonger_name = maps:get(name, Belonger, ""),
        stat = Stat,
        x = X, y = Y,
        realm = Realm
    };
sc_coll_scene_info(Coll) ->
    ?ERROR_FUNC_CALL([Coll]),
    #coll_scene_info{}.

% @doc 打包采集物场景数据列表
% @spec sc_coll_scene_info_list(CollList) -> [#coll_scene_info{}].
% CollList   :: [Coll]
% Coll       :: #coll{}
sc_coll_scene_info_list(CollList) ->
    [sc_coll_scene_info(Coll) || Coll <- CollList].


% @doc 打包镖车场景协议数据
% @spec sc_carry_scene_info(Carry) -> #carry_scene_info{}.
% Carry   :: #carry{}
sc_carry_scene_info(#carry{id = CarryId} = Carry) ->
    #carry{cid = Cid, owner = Owner, x = X, y = Y, path_index = PathIndex, path = Path, type = Type} = Carry,
    {ToX, ToY} = lists:nth(PathIndex, Path),
    #carry_scene_info{
        id = CarryId, cid = Cid,
        owner_id = maps:get(id, Owner, 0),
        owner_name = maps:get(name, Owner, ""),
        guild_name = maps:get(guild_name, Owner, ""),
        couples = maps:get(couples, Owner, []),
        x = X, y = Y, to_x = ToX, to_y = ToY, type = Type
    };
sc_carry_scene_info(Carry) ->
    ?ERROR_FUNC_CALL([Carry]),
    #carry_scene_info{}.

% @doc 打包镖车场景数据列表
% @spec sc_carry_scene_info_list(carryList) -> [#carry_scene_info{}].
% carryList   :: [Carry]
% Carry       :: #carry{}
sc_carry_scene_info_list(CarryList) ->
    [sc_carry_scene_info(Carry) || Carry <- CarryList].


% @doc 打包飞行道具场景协议数据
% @spec sc_flyitem_scene_info(Flyitem) -> #flyitem_scene_info{}.
% Flyitem   :: #flyitem{}
sc_flyitem_scene_info(#flyitem{id = FlyitemId} = Flyitem) ->
    #flyitem{id = FlyitemId, cid = Cid, x = X, y = Y, to_xy = {ToX, ToY}} = Flyitem,
    #flyitem_scene_info{id = FlyitemId, cid = Cid, x = X, y = Y, to_x = ToX, to_y = ToY};
sc_flyitem_scene_info(Flyitem) ->
    ?ERROR_FUNC_CALL([Flyitem]),
    #flyitem_scene_info{}.

% @doc 打包镖车场景数据列表
% @spec sc_flyitem_scene_info_list(flyitemList) -> [#flyitem_scene_info{}].
% flyitemList   :: [Flyitem]
% Flyitem       :: #flyitem{}
sc_flyitem_scene_info_list(FlyitemList) ->
    [sc_flyitem_scene_info(Flyitem) || Flyitem <- FlyitemList].


% @doc 打包珍兽详细数据
% @spec sc_clt_pet(Pet) -> #clt_pet{}.
% Pet   :: #{}
sc_clt_pet({Grid, Pet}) ->
    #{
        cid := PetCId, stat := Stat, name := Name, level := Level, exp := Exp,
        hp := Hp, star := Star, savvy_lv := SavvyLv, growup_lv := GrowupLv,
        growup_rate := GrowupRate, awaken := Awaken, potential := Potential,
        init_attr := InitAttrL, bt_attr := BtAttrL, skills := Skills,
        sell_time := SellTime, sell_times := SellTimes
    } = Pet,
    {Power, Anima, Energy, Concent, Method} = Potential,
    PetPoten = #pet_poten{power = Power, anima = Anima, energy = Energy, concent = Concent, method = Method},
    #clt_pet{
        grid = Grid, cid = PetCId, name = Name, stat = Stat, level = Level, exp = Exp,
        hp = Hp, star = Star, savvy_lv = SavvyLv, growup_lv = GrowupLv,
        growup_rate = GrowupRate, awaken = Awaken, potential = PetPoten,
        init_attr = InitAttrL, skills = Skills, bt_attr = BtAttrL,
        sell_time = SellTime, sell_times = SellTimes
    }.

% @doc 打包珍兽详细数据列表
% @spec sc_clt_pets(Pets) -> [#clt_pet{}].
% Pets  :: [{Grid, #{}}]
sc_clt_pets(Pets) ->
    [sc_clt_pet(PetWithGrid) || PetWithGrid <- Pets].


% @doc 打包仓库珍兽数据
% @spec sc_clt_dpet(Pet) -> #clt_pet{}.
% Pet   :: #{}
sc_clt_dpet({Grid, Pet}) ->
    #{
        cid := PetCId, name := Name, level := Level, star := Star, awaken := Awaken,
        savvy_lv := SavvyLv, growup_lv := GrowupLv, growup_rate := GrowupRate
    } = Pet,
    #clt_dpet{
        grid = Grid, cid = PetCId, name = Name, level = Level, star = Star, awaken = Awaken,
        savvy_lv = SavvyLv, growup_lv = GrowupLv, growup_rate = GrowupRate
    }.

% @doc 打包仓库珍兽数据列表
% @spec sc_clt_dpets(Pets) -> [#clt_pet{}].
% Pets  :: [{Grid, #{}}]
sc_clt_dpets(Pets) ->
    [sc_clt_dpet(PetWithGrid) || PetWithGrid <- Pets].

% @doc 打包仓库珍兽附体数据列表
% @spec sc_clt_attach(AttachRec) -> #clt_attach{}.
% AttachRec :: #attach_rec{}
sc_clt_attach(AttachRec) ->
    setelement(1, AttachRec, clt_attach).

% @doc 打包仓库珍兽附体数据列表
% @spec sc_clt_attachs(AttachList) -> [#clt_attach{}].
% AttachList    :: [#attach_rec{}]
sc_clt_attachs(AttachList) ->
    [sc_clt_attach(AttachRec) || AttachRec <- AttachList].

%%% Apis inner transfers ------------------------------------
% @doc 生成珍兽场景数据
to_scene_pet(Pet) when is_map(Pet) ->
    #{
        cid := PetCId, atk_type := AtkType, hp := Hp, title:= Title,
        name := Name, level := Level, star := Star, awaken := Awaken,
        fight := CombatPower, bt_attr := BtAttr, skills := Skills,
        skill_cd := SkillCd
    } = Pet,

    % 技能及技能属性
    {ActiveSkills, PassiveSkills} = part_pet_skills(Skills),
    SkillAttrs = calc_pet_skill_attr(Level, PassiveSkills),
    {SkBaseAttrL, SkBtAttrL} = lib_role_attr:split_attr(SkillAttrs),
    BtAttrN = lib_role_attr:merge_attr([BtAttr, SkBtAttrL]),
    SceneAttr = lib_role_attr:attr_to_record(bt_attr, BtAttrN),
    HpFixed = case Hp =:= 0 of
        true -> SceneAttr#bt_attr.hp_lim;
        false -> min(Hp, SceneAttr#bt_attr.hp_lim)
    end,

    % 技能及被动技能效果
    #{normal_skill := NormalSkill} = conf_pet:get(PetCId),
    SkillList = [#skill{id = NormalSkill, level = 1} | ActiveSkills],
    PEffectMap = lib_skill_util:gen_passive_effects(PassiveSkills),

    #pet{
        pet_cid = PetCId,
        atk_type = AtkType,
        title = Title,
        name = Name,
        level = Level,
        star = Star,
        awaken = Awaken,
        hp = HpFixed,
        combat_power = CombatPower,
        base_attr = SkBaseAttrL,
        attr = SceneAttr,
        bt_attr = SceneAttr,
        peffect_map = PEffectMap,
        skill_cd = SkillCd,
        skill_list = SkillList
    };
to_scene_pet(_) ->
    undefined.

% @doc 生成角色场景数据
to_scene_role(#role_state{id = RoleId, scene_opt = Options} = RoleState) ->
    #role_state{
        id = RoleId,
        server_num = ServerNum,
        name = Name,
        role_scene = #role_scene{
            mode = Mode, x = X, y = Y,
            reset_index = ResetIndex,
            scene_id = SceneID,
            old_scene = OldScene,
            act_scene = ActScene
        },
        sid = RoleSid,
        pid = RolePid,
        career = Career,
        level = Level,
        gender = Gender,
        hp = Hp,
        mp = Mp,
        combat_power = CombatPower,
        murderous = Murderous,
        skill_list = SkillList,
        personal = #{icon := Icon, title := Title, hair := Hair, fashion := Fashion, title_honor := TitleHonor},
        bt_attr = BtAttr,
        bt_data = BtData,
        guild_id = GuildId,
        guild_name = GuildName,
        team_id = TeamID,
        stat = State,
        stat_params = StateParams,
        mate_id = MateID,
        mate_name = MateName,
        tran_stat = TransStat
    } = RoleState,
    #{
        anger := Anger, skill_cd := SkillCd, effect_cd := EffectCd,
        horse_stat := HorseStat, declare_map := DeclareMap, rival_map := RivalMap
    } = BtData,
    RivalGuildMap = lib_role_guild:get_rival_map(GuildId),
    HostileGuildSet = lib_role_guild:get_hostile_sets(GuildId),
    Attackable = gen_attackable(DeclareMap, RivalMap),
    Realm = util:prop_get_value(realm, Options, 0),
    Header = extract_header(SceneID, Options),
    ModPSkills = lib_role_skill:get_mod_pskills(RoleId),
    Exteriors = lib_role_exterior:scene_exteriors(RoleId, HorseStat),
    {WildScene, _, WX, WY} = case lib_scene_api:is_valid_pos(OldScene) of
        true -> OldScene;
        false -> {0, 0, 0, 0}
    end,
    {ReadyScene, _, RX, RY} = case lib_scene_api:is_valid_pos(ActScene) of
        true -> ActScene;
        false -> {0, 0, 0, 0}
    end,

    Artifact = lib_role_artifact:get_artifact_cur_avatar(RoleState#role_state.id),
    WarriorSoul = lib_role_warrior_soul:get_Warrior_soul_cur_avatar(RoleState#role_state.id),
    Follow = lib_role_team:get_follow(RoleState#role_state.id),
    {SwornTitle, Quality} = lib_role_sworn:get_sworn_name(RoleId, Title),

    #scene_role{
        id = RoleId,
        sid = RoleSid,
        pid = RolePid,
        name = Name,
        career = Career,
        gender = Gender,
        level = Level,
        combat_power = CombatPower,

        x = X,
        y = Y,
        float_xy = {X, Y},
        to_xy = {X, Y},
        gradient = {0, 0},
        move_type = 0,
        reset_index = ResetIndex,
        statem = #statem{},

        hp = Hp,
        mp = Mp,
        anger = Anger,
        attr = BtAttr,
        skill_list = SkillList,
        mod_pskills = ModPSkills,
        skill_confs = lib_role_skill:scene_skills(SkillList),
        skill_cd = SkillCd,
        effect_cd = EffectCd,
        wild_scene = WildScene,
        ready_scene = ReadyScene,
        wild_x = WX,
        wild_y = WY,
        ready_x = RX,
        ready_y = RY,

        server_num = ServerNum,
        mode = Mode,
        realm = Realm,
        team = TeamID,
        guild = GuildId,
        guild_name = GuildName,
        murderous = Murderous,
        declare_map = DeclareMap,
        rival_map = RivalMap,
        rival_guild_map = RivalGuildMap,
        hostile_guild_set = HostileGuildSet,
        attackable = Attackable,

        hair = Hair,
        icon = Icon,
        title = Title,
        title_extra = SwornTitle,
        title_quality = Quality,
        fashion = Fashion,
        exteriors = Exteriors,
        artifact = Artifact,
        warrior_soul = WarriorSoul,
        follow = Follow,
        stat = State,
        stat_params = StateParams,
        title_honor = TitleHonor,
        header = Header,
        mate_id = MateID,
        mate_name = MateName,
        tran_stat = TransStat
    };
to_scene_role(RoleState) ->
    ?ERROR_FUNC_CALL([RoleState]),
    #scene_role{}.

extract_header(SceneID, Options) ->
    case util:prop_get_value(header, Options) of
        V when is_integer(V) ->
            V;
        _ ->
            case lib_scene_api:is_normal_scene(SceneID)
                andalso lib_role_guild_carry:is_carrying() of
                true ->
                    ?HEADER(?TITLE_ID_CARRY, 0);
                _ ->
                    0
            end
    end.

%% @doc 从玩家查看信息构造战斗镜像
view_to_scene_role(ViewInfo, Options) ->
    #{id := RoleID, name := Name, level := Level, fashion := Fashion,
        attr := Attr, pets := Pets, skills := SkillList,
        career := Career, fight := Fight, gender := Gender,
        guild_id := GuildID, guild_name := GuildName
    } = ViewInfo,
    SceneSkills = lib_role_skill:scene_skills(SkillList),
    TeamId = util:prop_get_value(team_id, Options, 0),
    Realm = util:prop_get_value(realm, Options, 0),
    #bt_attr{hp_lim = HpLim} = Attr,
    Role = #scene_role{
        id = RoleID, name = Name, level = Level, attr = Attr, fashion = Fashion,
        career = Career, combat_power = Fight, skill_list = SkillList,
        realm = Realm, team = TeamId, skill_confs = SceneSkills,
        hp = HpLim, gender = Gender, guild = GuildID, guild_name = GuildName
    },
    {Role, Pets}.

% @doc 转换回 obj info
to_scene_obj_info(#mon{} = ObjInfo, BtState) ->
    ObjInfo#mon{
        hp = BtState#bt_state.hp,
        bt_attr = BtState#bt_state.attr,
        effect_list = BtState#bt_state.effect_list,
        effect_cd = BtState#bt_state.effect_cd,
        shield = BtState#bt_state.shield
    };
to_scene_obj_info(#scene_role{} = ObjInfo, BtState) ->
    ObjInfo#scene_role{
        hp = BtState#bt_state.hp,
        mp = BtState#bt_state.mp,
        bt_attr = BtState#bt_state.attr,
        peffect_map = BtState#bt_state.peffect_map,
        effect_list = BtState#bt_state.effect_list,
        effect_cd = BtState#bt_state.effect_cd,
        shield = BtState#bt_state.shield
    };
to_scene_obj_info(#pet{} = ObjInfo, BtState) ->
    ObjInfo#pet{
        hp = BtState#bt_state.hp,
        bt_attr = BtState#bt_state.attr,
        peffect_map = BtState#bt_state.peffect_map,
        effect_list = BtState#bt_state.effect_list,
        effect_cd = BtState#bt_state.effect_cd,
        shield = BtState#bt_state.shield
    }.


%% @doc 转成战斗结构
% #scene_role{} to #bt_state{}
to_bt_state(#scene_role{id = RoleId} = SceneRole) ->
    RInfo = ?rinfo#{
        pid => SceneRole#scene_role.pid,
        career => SceneRole#scene_role.career
    },
    #scene_role{
        name = Name,
        career = Career,
        level = Level,

        x = X,
        y = Y,
        hp = Hp,
        mp = Mp,
        anger = Anger,
        bt_attr = BtAttr,
        pre_skill = PreSkill,
        skill_list = SkillList,
        skill_confs = SkillConfs,
        skill_cd = SkillCd,
        peffect_map = PEffectMap,
        effect_list = EffectList,
        effect_cd = EffectCd,
        shield = Shield,
        psdh_skill_his = PsdhSkillHis,

        server_num = ServerNum,
        mode = Mode,
        realm = Realm,
        team = Team,
        guild = Guild,
        rival_guild_map = RivalGuildMap,
        hostile_guild_set = HostileGuildSet,
        attackable = Attackable,
        title_honor = TitleHonor,
        header = Header
    } = SceneRole,
    AtkType = conf_career_init:get_atk_type(Career),
    InStat = calc_in_stat(Header),
    #bt_state{
        type = ?BATTLE_ROLE,
        id = RoleId,
        name = Name,
        career = Career,
        level = Level,
        atk_type = AtkType,

        x = X,
        y = Y,
        hp = Hp,
        mp = Mp,
        anger = Anger,
        attr = BtAttr,
        rinfo = RInfo,
        pre_skill = PreSkill,
        skill_list = SkillList,
        skill_confs = SkillConfs,
        skill_cd = SkillCd,
        peffect_map = PEffectMap,
        effect_list = EffectList,
        effect_cd = EffectCd,
        shield = Shield,
        psdh_skill_his = PsdhSkillHis,

        server_num = ServerNum,
        mode = Mode,
        realm = Realm,
        team = Team,
        guild = Guild,
        rival_guild_map = RivalGuildMap,
        hostile_guild_set = HostileGuildSet,
        attackable = Attackable,
        title_honor = TitleHonor,
        in_stat = InStat
    };
% #mon{} to #bt_state{}
to_bt_state(#mon{id = MonId} = Mon) ->
    MInfo = ?minfo#{
        mid => Mon#mon.mid,
        kind => Mon#mon.kind,
        boss => Mon#mon.boss
    },
    #mon{
        name = Name,
        level = Level,
        realm = Realm,
        owner = Owner,
        x = X,
        y = Y,
        hp = Hp,
        bt_attr = BtAttr,
        skill_list = SkillList,
        skill_cd = SkillCd,
        effect_list = EffectList,
        effect_cd = EffectCd,
        pre_skill = PreSkill,
        shield = Shield
    } = Mon,
    OwnerId = maps:get(id, Owner, 0),
    OwnerTeam = maps:get(team, Owner, 0),
    #bt_state{
        type = ?BATTLE_MON,
        id = MonId,
        name = Name,
        level = Level,
        realm = Realm,
        owner_id = OwnerId,
        owner_team = OwnerTeam,
        x = X,
        y = Y,
        hp = Hp,
        attr = BtAttr,
        minfo = MInfo,
        skill_list = SkillList,
        skill_cd = SkillCd,
        effect_list = EffectList,
        effect_cd = EffectCd,
        pre_skill = PreSkill,
        shield = Shield
    };
% #pet{} to #bt_state{}
to_bt_state(#pet{id = PetId} = Pet) ->
    #pet{
        atk_type = AtkType,
        name = Name,
        level = Level,
        owner = Owner,
        x = X,
        y = Y,
        hp = Hp,
        bt_attr = BtAttr,
        pre_skill = PreSkill,
        skill_list = SkillList,
        skill_cd = SkillCd,
        peffect_map = PEffectMap,
        effect_list = EffectList,
        effect_cd = EffectCd,
        shield = Shield
    } = Pet,
    OwnerId = maps:get(id, Owner, 0),
    Mode = maps:get(mode, Owner, ?MODE_PEACE),
    ServerNum = maps:get(server_num, Owner),
    Guild = maps:get(guild, Owner, 0),
    Team = maps:get(team, Owner, 0),
    Realm = maps:get(realm, Owner, 0),
    Murderous = maps:get(murderous, Owner, 0),
    Attackable = maps:get(attackable, Owner, sets:new()),
    RivalGuildMap = maps:get(rival_guild_map, Owner, #{}),
    HostileGuildSet = maps:get(hostile_guild_set, Owner, sets:new()),
    Header = maps:get(header, Owner, 0),
    InStat = calc_in_stat(Header),
    #bt_state{
        type = ?BATTLE_PET,
        id = PetId,
        atk_type = AtkType,
        name = Name,
        level = Level,

        x = X,
        y = Y,
        hp = Hp,
        attr = BtAttr,
        pre_skill = PreSkill,
        skill_list = SkillList,
        skill_cd = SkillCd,
        peffect_map = PEffectMap,
        effect_list = EffectList,
        effect_cd = EffectCd,
        shield = Shield,

        server_num = ServerNum,
        owner_id = OwnerId,
        owner_team = Team,
        mode = Mode,
        realm = Realm,
        team = Team,
        guild = Guild,
        murderous = Murderous,
        rival_guild_map = RivalGuildMap,
        hostile_guild_set = HostileGuildSet,
        attackable = Attackable,
        in_stat = InStat
    };
to_bt_state(ObjInfo) ->
    ?ERROR_FUNC_CALL([ObjInfo]),
    #bt_state{}.

% 转换出战珍兽数据
to_fight_pet(Pet, FightPetMap) ->
    #{
        cid := PetCId, level := PetLevel, exp := PetExp,
        hp := PetHp, skills := Skills, skill_cd := SkillCd
    } = Pet,
    NormalSkills = case conf_pet:get(PetCId) of
        #{normal_skill := NSkillId} when NSkillId > 0 -> [{NSkillId, 1}];
        _ -> []
    end,
    GenCanUseSkills = fun({_, SkillId, SkillLv}, Acc) ->
        case conf_skill:get_base(SkillId, SkillLv) of
            #base_skill{type = ?SKILL_TYPE_PET_PASSIVE} -> [{SkillId, SkillLv} | Acc];
            #base_skill{id = ?SKILL_ID_PET_LOYALTY} -> [{SkillId, SkillLv} | Acc];
            _ -> Acc
        end
    end,
    CanUseSkills = lists:foldl(GenCanUseSkills, NormalSkills, Skills),
    FightPetMap#{
        pet_cid => PetCId, level => PetLevel, exp => PetExp,
        hp => PetHp, skill_cd => SkillCd, skill_list => CanUseSkills
    }.

%% Privates ---------------------------------------------
% 生成可攻击sets
gen_attackable(DeclareMap, RivalMap) ->
    DeclareRoles = maps:keys(DeclareMap),
    RivalRoles = maps:keys(RivalMap),
    sets:from_list(DeclareRoles ++ RivalRoles).

% 分离珍兽技能
part_pet_skills(Skills) ->
    ParFun = fun({_SGrid, SkillId, SkillLv}, {TmpActiveList, TmpPassiveList}) ->
        Skill = #skill{id = SkillId, level = SkillLv},
        case conf_skill:get_base(SkillId, SkillLv) of
            #base_skill{type = ?SKILL_TYPE_PASSIVE} ->
                {TmpActiveList, [Skill | TmpPassiveList]};
            #base_skill{} ->
                {[Skill | TmpActiveList], TmpPassiveList};
            _ ->
                {TmpActiveList, TmpPassiveList}
        end
    end,
    lists:foldl(ParFun, {[], []}, Skills).

% 计算珍兽技能属性
calc_pet_skill_attr(PetLv, PassiveSkills) ->
    MergeSkillAttrFun = fun(#skill{id = SkId, level = SkLv}, AccAttr) ->
        case conf_skill:get_base(SkId, SkLv) of
            #base_skill{attr = AttrLT} ->
                Fact = conf_skill:pet_assist_fact(SkId, SkLv),
                AttrL = [{Idx, trunc(Val * (1 + Fact*(PetLv-1)))} || {Idx, Val} <- AttrLT],
                AttrL ++ AccAttr;
            _ ->
                AccAttr
        end
    end,
    lists:foldl(MergeSkillAttrFun, [], PassiveSkills).

% 计算当前状态(战斗计算使用)
calc_in_stat(Header) ->
    InCarry0 = case Header bsr 32 =:= ?TITLE_ID_CARRY of
        true -> bit_map:set(?BIT_IN_CARRY, 0);
        false -> 0
    end,
    InCarry = InCarry0,
    InCarry.
