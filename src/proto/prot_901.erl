-module(prot_901).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_901.hrl").


%% ---------------------------------------------------------------------------------------

decode(90100, _BinData) ->

    UnpackRecordData = #role_enter_scene_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90101, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, ServerNum} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, ServerTime} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, Name} = prot_util:unpack(RBin2, string),
    {RBin4, Career} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Gender} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Guild} = prot_util:unpack(RBin5, {64, unsigned}),
    {RBin7, GuildName} = prot_util:unpack(RBin6, string),
    {RBin8, Team} = prot_util:unpack(RBin7, {64, unsigned}),
    {RBin9, Level} = prot_util:unpack(RBin8, {16, unsigned}),
    {RBin10, Exp} = prot_util:unpack(RBin9, {64, unsigned}),
    {RBin11, SceneId} = prot_util:unpack(RBin10, {32, unsigned}),
    {RBin12, LineId} = prot_util:unpack(RBin11, {64, unsigned}),
    {RBin13, X} = prot_util:unpack(RBin12, {16, unsigned}),
    {RBin14, Y} = prot_util:unpack(RBin13, {16, unsigned}),
    {RBin15, ResetIndex} = prot_util:unpack(RBin14, {16, unsigned}),
    {RBin16, Hp} = prot_util:unpack(RBin15, {32, unsigned}),
    {RBin17, Mp} = prot_util:unpack(RBin16, {32, unsigned}),
    {RBin18, Anger} = prot_util:unpack(RBin17, {8, unsigned}),
    {RBin19, CombatPower} = prot_util:unpack(RBin18, {32, unsigned}),
    {RBin20, Icon} = prot_util:unpack(RBin19, {16, unsigned}),
    {RBin21, Hair} = prot_util:unpack(RBin20, {32, unsigned}),
    {RBin22, Title} = prot_util:unpack(RBin21, {16, unsigned}),
    {RBin23, TitleExtra} = prot_util:unpack(RBin22, string),
    {RBin24, TitleQuality} = prot_util:unpack(RBin23, {8, unsigned}),
    {RBin25, Fashion} = prot_util:unpack(RBin24, {32, unsigned}),
    {RBin26, Murderous} = prot_util:unpack(RBin25, {8, signed}),
    {RBin27, BaseAttr} = prot_util:unpack(RBin26, {u,base_attr}),
    {RBin28, Attr} = prot_util:unpack(RBin27, {u,bt_attr}),
    {RBin29, State} = prot_util:unpack(RBin28, {8, unsigned}),
    {RBin30, StateParams} = prot_util:unpack(RBin29, [{u,state_param}]),
    {RBin31, SkillList} = prot_util:unpack(RBin30, [{{32, unsigned}, {16, unsigned}, {8, unsigned}, {8, unsigned}}]),
    {RBin32, SkillCd} = prot_util:unpack(RBin31, [{{32, unsigned}, {64, unsigned}}]),
    {RBin33, Exteriors} = prot_util:unpack(RBin32, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    {RBin34, TitleHonor} = prot_util:unpack(RBin33, {32, unsigned}),
    {RBin35, Artifact} = prot_util:unpack(RBin34, {32, unsigned}),
    {RBin36, WarriorSoul} = prot_util:unpack(RBin35, {32, unsigned}),
    {RBin37, Header} = prot_util:unpack(RBin36, {64, unsigned}),
    {RBin38, Frame} = prot_util:unpack(RBin37, {16, unsigned}),
    {RBin39, Bubble} = prot_util:unpack(RBin38, {16, unsigned}),
    {RBin40, TranStat} = prot_util:unpack(RBin39, {16, unsigned}),
    {RBin41, MateId} = prot_util:unpack(RBin40, {64, unsigned}),
    {RBin42, MateName} = prot_util:unpack(RBin41, string),
    {RBin43, FightTeamId} = prot_util:unpack(RBin42, {64, unsigned}),
    {_RBin44, Prestige} = prot_util:unpack(RBin43, {16, unsigned}),

    UnpackRecordData = #role_enter_scene_info_resp{
        role_id = RoleId,
        server_num = ServerNum,
        server_time = ServerTime,
        name = Name,
        career = Career,
        gender = Gender,
        guild = Guild,
        guild_name = GuildName,
        team = Team,
        level = Level,
        exp = Exp,
        scene_id = SceneId,
        line_id = LineId,
        x = X,
        y = Y,
        reset_index = ResetIndex,
        hp = Hp,
        mp = Mp,
        anger = Anger,
        combat_power = CombatPower,
        icon = Icon,
        hair = Hair,
        title = Title,
        title_extra = TitleExtra,
        title_quality = TitleQuality,
        fashion = Fashion,
        murderous = Murderous,
        base_attr = BaseAttr,
        attr = Attr,
        state = State,
        state_params = StateParams,
        skill_list = SkillList,
        skill_cd = SkillCd,
        exteriors = Exteriors,
        title_honor = TitleHonor,
        artifact = Artifact,
        warrior_soul = WarriorSoul,
        header = Header,
        frame = Frame,
        bubble = Bubble,
        tran_stat = TranStat,
        mate_id = MateId,
        mate_name = MateName,
        fight_team_id = FightTeamId,
        prestige = Prestige
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90102, BinData) ->
    {RBin0, Hp} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, HpLim} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Mp} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, MpLim} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, MoveSpeed} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, Mode} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Realm} = prot_util:unpack(RBin5, {8, unsigned}),
    {_RBin7, Header} = prot_util:unpack(RBin6, {64, unsigned}),

    UnpackRecordData = #notify_role_scene_attr{
        hp = Hp,
        hp_lim = HpLim,
        mp = Mp,
        mp_lim = MpLim,
        move_speed = MoveSpeed,
        mode = Mode,
        realm = Realm,
        header = Header
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90106, BinData) ->
    {RBin0, KillerType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, KillerId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, KillerName} = prot_util:unpack(RBin1, string),
    {_RBin3, DieTime} = prot_util:unpack(RBin2, {32, unsigned}),

    UnpackRecordData = #notify_role_die{
        killer_type = KillerType,
        killer_id = KillerId,
        killer_name = KillerName,
        die_time = DieTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90107, BinData) ->
    {RBin0, Hp} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Mp} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, X} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Y} = prot_util:unpack(RBin2, {16, unsigned}),
    {_RBin4, BtAttr} = prot_util:unpack(RBin3, {u,bt_attr}),

    UnpackRecordData = #notify_role_revive{
        hp = Hp,
        mp = Mp,
        x = X,
        y = Y,
        bt_attr = BtAttr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90108, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, X} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Y} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Hp} = prot_util:unpack(RBin2, {32, unsigned}),
    {_RBin4, HpLim} = prot_util:unpack(RBin3, {32, unsigned}),

    UnpackRecordData = #notify_pet_revive{
        id = Id,
        x = X,
        y = Y,
        hp = Hp,
        hp_lim = HpLim
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90110, BinData) ->
    {RBin0, ObjId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Mp} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, MpLim} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #notify_obj_basic{
        obj_id = ObjId,
        mp = Mp,
        mp_lim = MpLim
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90111, BinData) ->
    {_RBin0, ObjSkills} = prot_util:unpack(BinData, [{u,obj_skill}]),

    UnpackRecordData = #notify_obj_skills{
        obj_skills = ObjSkills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90112, BinData) ->
    {_RBin0, SceneMode} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #change_scene_mode_req{
        scene_mode = SceneMode
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90113, BinData) ->
    {RBin0, SceneMode} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, NextMode} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, NextModeCd} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #change_scene_mode_resp{
        scene_mode = SceneMode,
        next_mode = NextMode,
        next_mode_cd = NextModeCd
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90114, BinData) ->
    {_RBin0, RivalId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #declare_war_req{
        rival_id = RivalId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90115, BinData) ->
    {_RBin0, RivalIds} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #notify_rivals{
        rival_ids = RivalIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90116, BinData) ->
    {_RBin0, RivalId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #notify_add_rival{
        rival_id = RivalId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90117, BinData) ->
    {_RBin0, RivalId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #notify_del_rival{
        rival_id = RivalId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90118, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #notify_be_declare_war{
        role_id = RoleId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90120, BinData) ->
    {_RBin0, SceneBtAttr} = prot_util:unpack(BinData, {u,bt_attr}),

    UnpackRecordData = #notify_bt_attr_change{
        scene_bt_attr = SceneBtAttr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90121, BinData) ->
    {_RBin0, BaseAttr} = prot_util:unpack(BinData, {u,base_attr}),

    UnpackRecordData = #notify_base_attr_change{
        base_attr = BaseAttr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90122, _BinData) ->

    UnpackRecordData = #cs_battle_log_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90123, BinData) ->
    {_RBin0, Logs} = prot_util:unpack(BinData, [{u,battle_lose_log}]),

    UnpackRecordData = #sc_battle_log_info{
        logs = Logs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90124, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_battle_log_delete{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90125, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_battle_log_delete{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90126, BinData) ->
    {_RBin0, NewLog} = prot_util:unpack(BinData, {u,battle_lose_log}),

    UnpackRecordData = #sc_battle_log_new{
        new_log = NewLog
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90128, BinData) ->
    {_RBin0, Anger} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #notify_anger_change{
        anger = Anger
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90129, BinData) ->
    {_RBin0, PetId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #notify_pet_leave{
        pet_id = PetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(90100, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90101, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#role_enter_scene_info_resp.role_id, {64, unsigned}),
    ServerNum = prot_util:pack(PackRecordData#role_enter_scene_info_resp.server_num, {32, unsigned}),
    ServerTime = prot_util:pack(PackRecordData#role_enter_scene_info_resp.server_time, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#role_enter_scene_info_resp.name, string),
    Career = prot_util:pack(PackRecordData#role_enter_scene_info_resp.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#role_enter_scene_info_resp.gender, {8, unsigned}),
    Guild = prot_util:pack(PackRecordData#role_enter_scene_info_resp.guild, {64, unsigned}),
    GuildName = prot_util:pack(PackRecordData#role_enter_scene_info_resp.guild_name, string),
    Team = prot_util:pack(PackRecordData#role_enter_scene_info_resp.team, {64, unsigned}),
    Level = prot_util:pack(PackRecordData#role_enter_scene_info_resp.level, {16, unsigned}),
    Exp = prot_util:pack(PackRecordData#role_enter_scene_info_resp.exp, {64, unsigned}),
    SceneId = prot_util:pack(PackRecordData#role_enter_scene_info_resp.scene_id, {32, unsigned}),
    LineId = prot_util:pack(PackRecordData#role_enter_scene_info_resp.line_id, {64, unsigned}),
    X = prot_util:pack(PackRecordData#role_enter_scene_info_resp.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#role_enter_scene_info_resp.y, {16, unsigned}),
    ResetIndex = prot_util:pack(PackRecordData#role_enter_scene_info_resp.reset_index, {16, unsigned}),
    Hp = prot_util:pack(PackRecordData#role_enter_scene_info_resp.hp, {32, unsigned}),
    Mp = prot_util:pack(PackRecordData#role_enter_scene_info_resp.mp, {32, unsigned}),
    Anger = prot_util:pack(PackRecordData#role_enter_scene_info_resp.anger, {8, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#role_enter_scene_info_resp.combat_power, {32, unsigned}),
    Icon = prot_util:pack(PackRecordData#role_enter_scene_info_resp.icon, {16, unsigned}),
    Hair = prot_util:pack(PackRecordData#role_enter_scene_info_resp.hair, {32, unsigned}),
    Title = prot_util:pack(PackRecordData#role_enter_scene_info_resp.title, {16, unsigned}),
    TitleExtra = prot_util:pack(PackRecordData#role_enter_scene_info_resp.title_extra, string),
    TitleQuality = prot_util:pack(PackRecordData#role_enter_scene_info_resp.title_quality, {8, unsigned}),
    Fashion = prot_util:pack(PackRecordData#role_enter_scene_info_resp.fashion, {32, unsigned}),
    Murderous = prot_util:pack(PackRecordData#role_enter_scene_info_resp.murderous, {8, signed}),
    BaseAttr = prot_util:pack(PackRecordData#role_enter_scene_info_resp.base_attr, {u,base_attr}),
    Attr = prot_util:pack(PackRecordData#role_enter_scene_info_resp.attr, {u,bt_attr}),
    State = prot_util:pack(PackRecordData#role_enter_scene_info_resp.state, {8, unsigned}),
    StateParams = prot_util:pack(PackRecordData#role_enter_scene_info_resp.state_params, [{u,state_param}]),
    SkillList = prot_util:pack(PackRecordData#role_enter_scene_info_resp.skill_list, [{{32, unsigned}, {16, unsigned}, {8, unsigned}, {8, unsigned}}]),
    SkillCd = prot_util:pack(PackRecordData#role_enter_scene_info_resp.skill_cd, [{{32, unsigned}, {64, unsigned}}]),
    Exteriors = prot_util:pack(PackRecordData#role_enter_scene_info_resp.exteriors, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    TitleHonor = prot_util:pack(PackRecordData#role_enter_scene_info_resp.title_honor, {32, unsigned}),
    Artifact = prot_util:pack(PackRecordData#role_enter_scene_info_resp.artifact, {32, unsigned}),
    WarriorSoul = prot_util:pack(PackRecordData#role_enter_scene_info_resp.warrior_soul, {32, unsigned}),
    Header = prot_util:pack(PackRecordData#role_enter_scene_info_resp.header, {64, unsigned}),
    Frame = prot_util:pack(PackRecordData#role_enter_scene_info_resp.frame, {16, unsigned}),
    Bubble = prot_util:pack(PackRecordData#role_enter_scene_info_resp.bubble, {16, unsigned}),
    TranStat = prot_util:pack(PackRecordData#role_enter_scene_info_resp.tran_stat, {16, unsigned}),
    MateId = prot_util:pack(PackRecordData#role_enter_scene_info_resp.mate_id, {64, unsigned}),
    MateName = prot_util:pack(PackRecordData#role_enter_scene_info_resp.mate_name, string),
    FightTeamId = prot_util:pack(PackRecordData#role_enter_scene_info_resp.fight_team_id, {64, unsigned}),
    Prestige = prot_util:pack(PackRecordData#role_enter_scene_info_resp.prestige, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        ServerNum/binary,
        ServerTime/binary,
        Name/binary,
        Career/binary,
        Gender/binary,
        Guild/binary,
        GuildName/binary,
        Team/binary,
        Level/binary,
        Exp/binary,
        SceneId/binary,
        LineId/binary,
        X/binary,
        Y/binary,
        ResetIndex/binary,
        Hp/binary,
        Mp/binary,
        Anger/binary,
        CombatPower/binary,
        Icon/binary,
        Hair/binary,
        Title/binary,
        TitleExtra/binary,
        TitleQuality/binary,
        Fashion/binary,
        Murderous/binary,
        BaseAttr/binary,
        Attr/binary,
        State/binary,
        StateParams/binary,
        SkillList/binary,
        SkillCd/binary,
        Exteriors/binary,
        TitleHonor/binary,
        Artifact/binary,
        WarriorSoul/binary,
        Header/binary,
        Frame/binary,
        Bubble/binary,
        TranStat/binary,
        MateId/binary,
        MateName/binary,
        FightTeamId/binary,
        Prestige/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90102, PackRecordData) ->
    Hp = prot_util:pack(PackRecordData#notify_role_scene_attr.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#notify_role_scene_attr.hp_lim, {32, unsigned}),
    Mp = prot_util:pack(PackRecordData#notify_role_scene_attr.mp, {32, unsigned}),
    MpLim = prot_util:pack(PackRecordData#notify_role_scene_attr.mp_lim, {32, unsigned}),
    MoveSpeed = prot_util:pack(PackRecordData#notify_role_scene_attr.move_speed, {16, unsigned}),
    Mode = prot_util:pack(PackRecordData#notify_role_scene_attr.mode, {8, unsigned}),
    Realm = prot_util:pack(PackRecordData#notify_role_scene_attr.realm, {8, unsigned}),
    Header = prot_util:pack(PackRecordData#notify_role_scene_attr.header, {64, unsigned}),

    BinData = <<
        Hp/binary,
        HpLim/binary,
        Mp/binary,
        MpLim/binary,
        MoveSpeed/binary,
        Mode/binary,
        Realm/binary,
        Header/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90106, PackRecordData) ->
    KillerType = prot_util:pack(PackRecordData#notify_role_die.killer_type, {8, unsigned}),
    KillerId = prot_util:pack(PackRecordData#notify_role_die.killer_id, {64, unsigned}),
    KillerName = prot_util:pack(PackRecordData#notify_role_die.killer_name, string),
    DieTime = prot_util:pack(PackRecordData#notify_role_die.die_time, {32, unsigned}),

    BinData = <<
        KillerType/binary,
        KillerId/binary,
        KillerName/binary,
        DieTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90107, PackRecordData) ->
    Hp = prot_util:pack(PackRecordData#notify_role_revive.hp, {32, unsigned}),
    Mp = prot_util:pack(PackRecordData#notify_role_revive.mp, {32, unsigned}),
    X = prot_util:pack(PackRecordData#notify_role_revive.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#notify_role_revive.y, {16, unsigned}),
    BtAttr = prot_util:pack(PackRecordData#notify_role_revive.bt_attr, {u,bt_attr}),

    BinData = <<
        Hp/binary,
        Mp/binary,
        X/binary,
        Y/binary,
        BtAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90108, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#notify_pet_revive.id, {64, unsigned}),
    X = prot_util:pack(PackRecordData#notify_pet_revive.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#notify_pet_revive.y, {16, unsigned}),
    Hp = prot_util:pack(PackRecordData#notify_pet_revive.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#notify_pet_revive.hp_lim, {32, unsigned}),

    BinData = <<
        Id/binary,
        X/binary,
        Y/binary,
        Hp/binary,
        HpLim/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90110, PackRecordData) ->
    ObjId = prot_util:pack(PackRecordData#notify_obj_basic.obj_id, {64, unsigned}),
    Mp = prot_util:pack(PackRecordData#notify_obj_basic.mp, {32, unsigned}),
    MpLim = prot_util:pack(PackRecordData#notify_obj_basic.mp_lim, {32, unsigned}),

    BinData = <<
        ObjId/binary,
        Mp/binary,
        MpLim/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90111, PackRecordData) ->
    ObjSkills = prot_util:pack(PackRecordData#notify_obj_skills.obj_skills, [{u,obj_skill}]),

    BinData = <<
        ObjSkills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90112, PackRecordData) ->
    SceneMode = prot_util:pack(PackRecordData#change_scene_mode_req.scene_mode, {8, unsigned}),

    BinData = <<
        SceneMode/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90113, PackRecordData) ->
    SceneMode = prot_util:pack(PackRecordData#change_scene_mode_resp.scene_mode, {8, unsigned}),
    NextMode = prot_util:pack(PackRecordData#change_scene_mode_resp.next_mode, {8, unsigned}),
    NextModeCd = prot_util:pack(PackRecordData#change_scene_mode_resp.next_mode_cd, {16, unsigned}),

    BinData = <<
        SceneMode/binary,
        NextMode/binary,
        NextModeCd/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90114, PackRecordData) ->
    RivalId = prot_util:pack(PackRecordData#declare_war_req.rival_id, {64, unsigned}),

    BinData = <<
        RivalId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90115, PackRecordData) ->
    RivalIds = prot_util:pack(PackRecordData#notify_rivals.rival_ids, [{64, unsigned}]),

    BinData = <<
        RivalIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90116, PackRecordData) ->
    RivalId = prot_util:pack(PackRecordData#notify_add_rival.rival_id, {64, unsigned}),

    BinData = <<
        RivalId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90117, PackRecordData) ->
    RivalId = prot_util:pack(PackRecordData#notify_del_rival.rival_id, {64, unsigned}),

    BinData = <<
        RivalId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90118, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#notify_be_declare_war.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#notify_be_declare_war.name, string),

    BinData = <<
        RoleId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90120, PackRecordData) ->
    SceneBtAttr = prot_util:pack(PackRecordData#notify_bt_attr_change.scene_bt_attr, {u,bt_attr}),

    BinData = <<
        SceneBtAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90121, PackRecordData) ->
    BaseAttr = prot_util:pack(PackRecordData#notify_base_attr_change.base_attr, {u,base_attr}),

    BinData = <<
        BaseAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90122, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90123, PackRecordData) ->
    Logs = prot_util:pack(PackRecordData#sc_battle_log_info.logs, [{u,battle_lose_log}]),

    BinData = <<
        Logs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90124, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_battle_log_delete.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90125, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_battle_log_delete.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90126, PackRecordData) ->
    NewLog = prot_util:pack(PackRecordData#sc_battle_log_new.new_log, {u,battle_lose_log}),

    BinData = <<
        NewLog/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90128, PackRecordData) ->
    Anger = prot_util:pack(PackRecordData#notify_anger_change.anger, {8, unsigned}),

    BinData = <<
        Anger/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90129, PackRecordData) ->
    PetId = prot_util:pack(PackRecordData#notify_pet_leave.pet_id, {64, unsigned}),

    BinData = <<
        PetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

