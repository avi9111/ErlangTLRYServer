-module(prot_903).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_903.hrl").


%% ---------------------------------------------------------------------------------------

decode(90300, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, DeferType} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, DeferId} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, SkillId} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, AssistX} = prot_util:unpack(RBin3, {16, unsigned}),
    {_RBin5, AssistY} = prot_util:unpack(RBin4, {16, unsigned}),

    UnpackRecordData = #attack_req{
        role_id = RoleId,
        defer_type = DeferType,
        defer_id = DeferId,
        skill_id = SkillId,
        assist_x = AssistX,
        assist_y = AssistY
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90301, BinData) ->
    {RBin0, AtterType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, AtterId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, DeferType} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, DeferId} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, SkillId} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, SkillLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Hero} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Legend} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, IsTrig} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, AssistX} = prot_util:unpack(RBin8, {16, unsigned}),
    {_RBin10, AssistY} = prot_util:unpack(RBin9, {16, unsigned}),

    UnpackRecordData = #bcast_attack{
        atter_type = AtterType,
        atter_id = AtterId,
        defer_type = DeferType,
        defer_id = DeferId,
        skill_id = SkillId,
        skill_lv = SkillLv,
        hero = Hero,
        legend = Legend,
        is_trig = IsTrig,
        assist_x = AssistX,
        assist_y = AssistY
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90302, BinData) ->
    {RBin0, AtterType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, AtterId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, AtterX} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, AtterY} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, SkillId} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, SkillLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Hero} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Legend} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, AssistX} = prot_util:unpack(RBin7, {16, unsigned}),
    {RBin9, AssistY} = prot_util:unpack(RBin8, {16, unsigned}),
    {_RBin10, DeferList} = prot_util:unpack(RBin9, [{u,ud_defer}]),

    UnpackRecordData = #bcast_battle_harm{
        atter_type = AtterType,
        atter_id = AtterId,
        atter_x = AtterX,
        atter_y = AtterY,
        skill_id = SkillId,
        skill_lv = SkillLv,
        hero = Hero,
        legend = Legend,
        assist_x = AssistX,
        assist_y = AssistY,
        defer_list = DeferList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90303, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, DeferType} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, DeferId} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, SkillId} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, AssistX} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, AssistY} = prot_util:unpack(RBin4, {16, unsigned}),
    {_RBin6, Op} = prot_util:unpack(RBin5, {8, unsigned}),

    UnpackRecordData = #pre_skill_req{
        role_id = RoleId,
        defer_type = DeferType,
        defer_id = DeferId,
        skill_id = SkillId,
        assist_x = AssistX,
        assist_y = AssistY,
        op = Op
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90304, BinData) ->
    {RBin0, AtterType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, AtterId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, DeferType} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, DeferId} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, SkillId} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, SkillLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Hero} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Legend} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, AssistX} = prot_util:unpack(RBin7, {16, unsigned}),
    {RBin9, AssistY} = prot_util:unpack(RBin8, {16, unsigned}),
    {_RBin10, Op} = prot_util:unpack(RBin9, {8, unsigned}),

    UnpackRecordData = #bcast_pre_skill{
        atter_type = AtterType,
        atter_id = AtterId,
        defer_type = DeferType,
        defer_id = DeferId,
        skill_id = SkillId,
        skill_lv = SkillLv,
        hero = Hero,
        legend = Legend,
        assist_x = AssistX,
        assist_y = AssistY,
        op = Op
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90305, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, OwnerId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, DeferType} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, DeferId} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, SkillId} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, SkillLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, AssistX} = prot_util:unpack(RBin5, {16, unsigned}),
    {_RBin7, AssistY} = prot_util:unpack(RBin6, {16, unsigned}),

    UnpackRecordData = #pet_attack_req{
        id = Id,
        owner_id = OwnerId,
        defer_type = DeferType,
        defer_id = DeferId,
        skill_id = SkillId,
        skill_lv = SkillLv,
        assist_x = AssistX,
        assist_y = AssistY
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90306, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, OwnerId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, DeferType} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, DeferId} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, SkillId} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, SkillLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, AssistX} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, AssistY} = prot_util:unpack(RBin6, {16, unsigned}),
    {_RBin8, Op} = prot_util:unpack(RBin7, {8, unsigned}),

    UnpackRecordData = #pet_pre_skill_req{
        id = Id,
        owner_id = OwnerId,
        defer_type = DeferType,
        defer_id = DeferId,
        skill_id = SkillId,
        skill_lv = SkillLv,
        assist_x = AssistX,
        assist_y = AssistY,
        op = Op
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90307, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #revive_req{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90308, BinData) ->
    {RBin0, ObjType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, ObjId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Hp} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, HpLim} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, X} = prot_util:unpack(RBin3, {16, unsigned}),
    {_RBin5, Y} = prot_util:unpack(RBin4, {16, unsigned}),

    UnpackRecordData = #bcast_revive{
        obj_type = ObjType,
        obj_id = ObjId,
        hp = Hp,
        hp_lim = HpLim,
        x = X,
        y = Y
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90309, BinData) ->
    {RBin0, HarmStatistics} = prot_util:unpack(BinData, [{{8, unsigned}, {64, unsigned}, {64, unsigned}}]),
    {_RBin1, RecoverStatistics} = prot_util:unpack(RBin0, [{{8, unsigned}, {64, unsigned}, {64, unsigned}}]),

    UnpackRecordData = #notify_battle_statistics{
        harm_statistics = HarmStatistics,
        recover_statistics = RecoverStatistics
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90310, BinData) ->
    {_RBin0, SkillIds} = prot_util:unpack(BinData, [{32, unsigned}]),

    UnpackRecordData = #notify_clear_skill_cd{
        skill_ids = SkillIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90320, BinData) ->
    {RBin0, CollId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, CollTypeId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #collect_req{
        coll_id = CollId,
        coll_type_id = CollTypeId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90321, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, CollId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Op} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #bcast_collect{
        role_id = RoleId,
        coll_id = CollId,
        op = Op
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90322, _BinData) ->

    UnpackRecordData = #use_special_skill_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90330, BinData) ->
    {_RBin0, SkillId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #use_marry_skill_req{
        skill_id = SkillId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90331, BinData) ->
    {_RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #notify_passive_transfer{
        scene_id = SceneId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90332, BinData) ->
    {RBin0, Reply} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, SceneId} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #ack_passive_transfer{
        reply = Reply,
        scene_id = SceneId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90333, _BinData) ->

    UnpackRecordData = #get_marry_skill_cd_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90334, BinData) ->
    {_RBin0, CdList} = prot_util:unpack(BinData, [{{32, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #get_marry_skill_cd_resp{
        cd_list = CdList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90335, BinData) ->
    {_RBin0, SkillId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #notify_update_marry_skill_cd{
        skill_id = SkillId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(90300, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#attack_req.role_id, {64, unsigned}),
    DeferType = prot_util:pack(PackRecordData#attack_req.defer_type, {8, unsigned}),
    DeferId = prot_util:pack(PackRecordData#attack_req.defer_id, {64, unsigned}),
    SkillId = prot_util:pack(PackRecordData#attack_req.skill_id, {32, unsigned}),
    AssistX = prot_util:pack(PackRecordData#attack_req.assist_x, {16, unsigned}),
    AssistY = prot_util:pack(PackRecordData#attack_req.assist_y, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        DeferType/binary,
        DeferId/binary,
        SkillId/binary,
        AssistX/binary,
        AssistY/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90301, PackRecordData) ->
    AtterType = prot_util:pack(PackRecordData#bcast_attack.atter_type, {8, unsigned}),
    AtterId = prot_util:pack(PackRecordData#bcast_attack.atter_id, {64, unsigned}),
    DeferType = prot_util:pack(PackRecordData#bcast_attack.defer_type, {8, unsigned}),
    DeferId = prot_util:pack(PackRecordData#bcast_attack.defer_id, {64, unsigned}),
    SkillId = prot_util:pack(PackRecordData#bcast_attack.skill_id, {32, unsigned}),
    SkillLv = prot_util:pack(PackRecordData#bcast_attack.skill_lv, {8, unsigned}),
    Hero = prot_util:pack(PackRecordData#bcast_attack.hero, {8, unsigned}),
    Legend = prot_util:pack(PackRecordData#bcast_attack.legend, {8, unsigned}),
    IsTrig = prot_util:pack(PackRecordData#bcast_attack.is_trig, {8, unsigned}),
    AssistX = prot_util:pack(PackRecordData#bcast_attack.assist_x, {16, unsigned}),
    AssistY = prot_util:pack(PackRecordData#bcast_attack.assist_y, {16, unsigned}),

    BinData = <<
        AtterType/binary,
        AtterId/binary,
        DeferType/binary,
        DeferId/binary,
        SkillId/binary,
        SkillLv/binary,
        Hero/binary,
        Legend/binary,
        IsTrig/binary,
        AssistX/binary,
        AssistY/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90302, PackRecordData) ->
    AtterType = prot_util:pack(PackRecordData#bcast_battle_harm.atter_type, {8, unsigned}),
    AtterId = prot_util:pack(PackRecordData#bcast_battle_harm.atter_id, {64, unsigned}),
    AtterX = prot_util:pack(PackRecordData#bcast_battle_harm.atter_x, {16, unsigned}),
    AtterY = prot_util:pack(PackRecordData#bcast_battle_harm.atter_y, {16, unsigned}),
    SkillId = prot_util:pack(PackRecordData#bcast_battle_harm.skill_id, {32, unsigned}),
    SkillLv = prot_util:pack(PackRecordData#bcast_battle_harm.skill_lv, {8, unsigned}),
    Hero = prot_util:pack(PackRecordData#bcast_battle_harm.hero, {8, unsigned}),
    Legend = prot_util:pack(PackRecordData#bcast_battle_harm.legend, {8, unsigned}),
    AssistX = prot_util:pack(PackRecordData#bcast_battle_harm.assist_x, {16, unsigned}),
    AssistY = prot_util:pack(PackRecordData#bcast_battle_harm.assist_y, {16, unsigned}),
    DeferList = prot_util:pack(PackRecordData#bcast_battle_harm.defer_list, [{u,ud_defer}]),

    BinData = <<
        AtterType/binary,
        AtterId/binary,
        AtterX/binary,
        AtterY/binary,
        SkillId/binary,
        SkillLv/binary,
        Hero/binary,
        Legend/binary,
        AssistX/binary,
        AssistY/binary,
        DeferList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90303, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#pre_skill_req.role_id, {64, unsigned}),
    DeferType = prot_util:pack(PackRecordData#pre_skill_req.defer_type, {8, unsigned}),
    DeferId = prot_util:pack(PackRecordData#pre_skill_req.defer_id, {64, unsigned}),
    SkillId = prot_util:pack(PackRecordData#pre_skill_req.skill_id, {32, unsigned}),
    AssistX = prot_util:pack(PackRecordData#pre_skill_req.assist_x, {16, unsigned}),
    AssistY = prot_util:pack(PackRecordData#pre_skill_req.assist_y, {16, unsigned}),
    Op = prot_util:pack(PackRecordData#pre_skill_req.op, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        DeferType/binary,
        DeferId/binary,
        SkillId/binary,
        AssistX/binary,
        AssistY/binary,
        Op/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90304, PackRecordData) ->
    AtterType = prot_util:pack(PackRecordData#bcast_pre_skill.atter_type, {8, unsigned}),
    AtterId = prot_util:pack(PackRecordData#bcast_pre_skill.atter_id, {64, unsigned}),
    DeferType = prot_util:pack(PackRecordData#bcast_pre_skill.defer_type, {8, unsigned}),
    DeferId = prot_util:pack(PackRecordData#bcast_pre_skill.defer_id, {64, unsigned}),
    SkillId = prot_util:pack(PackRecordData#bcast_pre_skill.skill_id, {32, unsigned}),
    SkillLv = prot_util:pack(PackRecordData#bcast_pre_skill.skill_lv, {8, unsigned}),
    Hero = prot_util:pack(PackRecordData#bcast_pre_skill.hero, {8, unsigned}),
    Legend = prot_util:pack(PackRecordData#bcast_pre_skill.legend, {8, unsigned}),
    AssistX = prot_util:pack(PackRecordData#bcast_pre_skill.assist_x, {16, unsigned}),
    AssistY = prot_util:pack(PackRecordData#bcast_pre_skill.assist_y, {16, unsigned}),
    Op = prot_util:pack(PackRecordData#bcast_pre_skill.op, {8, unsigned}),

    BinData = <<
        AtterType/binary,
        AtterId/binary,
        DeferType/binary,
        DeferId/binary,
        SkillId/binary,
        SkillLv/binary,
        Hero/binary,
        Legend/binary,
        AssistX/binary,
        AssistY/binary,
        Op/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90305, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#pet_attack_req.id, {64, unsigned}),
    OwnerId = prot_util:pack(PackRecordData#pet_attack_req.owner_id, {64, unsigned}),
    DeferType = prot_util:pack(PackRecordData#pet_attack_req.defer_type, {8, unsigned}),
    DeferId = prot_util:pack(PackRecordData#pet_attack_req.defer_id, {64, unsigned}),
    SkillId = prot_util:pack(PackRecordData#pet_attack_req.skill_id, {32, unsigned}),
    SkillLv = prot_util:pack(PackRecordData#pet_attack_req.skill_lv, {8, unsigned}),
    AssistX = prot_util:pack(PackRecordData#pet_attack_req.assist_x, {16, unsigned}),
    AssistY = prot_util:pack(PackRecordData#pet_attack_req.assist_y, {16, unsigned}),

    BinData = <<
        Id/binary,
        OwnerId/binary,
        DeferType/binary,
        DeferId/binary,
        SkillId/binary,
        SkillLv/binary,
        AssistX/binary,
        AssistY/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90306, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#pet_pre_skill_req.id, {64, unsigned}),
    OwnerId = prot_util:pack(PackRecordData#pet_pre_skill_req.owner_id, {64, unsigned}),
    DeferType = prot_util:pack(PackRecordData#pet_pre_skill_req.defer_type, {8, unsigned}),
    DeferId = prot_util:pack(PackRecordData#pet_pre_skill_req.defer_id, {64, unsigned}),
    SkillId = prot_util:pack(PackRecordData#pet_pre_skill_req.skill_id, {32, unsigned}),
    SkillLv = prot_util:pack(PackRecordData#pet_pre_skill_req.skill_lv, {8, unsigned}),
    AssistX = prot_util:pack(PackRecordData#pet_pre_skill_req.assist_x, {16, unsigned}),
    AssistY = prot_util:pack(PackRecordData#pet_pre_skill_req.assist_y, {16, unsigned}),
    Op = prot_util:pack(PackRecordData#pet_pre_skill_req.op, {8, unsigned}),

    BinData = <<
        Id/binary,
        OwnerId/binary,
        DeferType/binary,
        DeferId/binary,
        SkillId/binary,
        SkillLv/binary,
        AssistX/binary,
        AssistY/binary,
        Op/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90307, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#revive_req.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90308, PackRecordData) ->
    ObjType = prot_util:pack(PackRecordData#bcast_revive.obj_type, {8, unsigned}),
    ObjId = prot_util:pack(PackRecordData#bcast_revive.obj_id, {64, unsigned}),
    Hp = prot_util:pack(PackRecordData#bcast_revive.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#bcast_revive.hp_lim, {32, unsigned}),
    X = prot_util:pack(PackRecordData#bcast_revive.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#bcast_revive.y, {16, unsigned}),

    BinData = <<
        ObjType/binary,
        ObjId/binary,
        Hp/binary,
        HpLim/binary,
        X/binary,
        Y/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90309, PackRecordData) ->
    HarmStatistics = prot_util:pack(PackRecordData#notify_battle_statistics.harm_statistics, [{{8, unsigned}, {64, unsigned}, {64, unsigned}}]),
    RecoverStatistics = prot_util:pack(PackRecordData#notify_battle_statistics.recover_statistics, [{{8, unsigned}, {64, unsigned}, {64, unsigned}}]),

    BinData = <<
        HarmStatistics/binary,
        RecoverStatistics/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90310, PackRecordData) ->
    SkillIds = prot_util:pack(PackRecordData#notify_clear_skill_cd.skill_ids, [{32, unsigned}]),

    BinData = <<
        SkillIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90320, PackRecordData) ->
    CollId = prot_util:pack(PackRecordData#collect_req.coll_id, {64, unsigned}),
    CollTypeId = prot_util:pack(PackRecordData#collect_req.coll_type_id, {64, unsigned}),

    BinData = <<
        CollId/binary,
        CollTypeId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90321, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_collect.role_id, {64, unsigned}),
    CollId = prot_util:pack(PackRecordData#bcast_collect.coll_id, {64, unsigned}),
    Op = prot_util:pack(PackRecordData#bcast_collect.op, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        CollId/binary,
        Op/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90322, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90330, PackRecordData) ->
    SkillId = prot_util:pack(PackRecordData#use_marry_skill_req.skill_id, {64, unsigned}),

    BinData = <<
        SkillId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90331, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#notify_passive_transfer.scene_id, {32, unsigned}),

    BinData = <<
        SceneId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90332, PackRecordData) ->
    Reply = prot_util:pack(PackRecordData#ack_passive_transfer.reply, {8, unsigned}),
    SceneId = prot_util:pack(PackRecordData#ack_passive_transfer.scene_id, {32, unsigned}),

    BinData = <<
        Reply/binary,
        SceneId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90333, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90334, PackRecordData) ->
    CdList = prot_util:pack(PackRecordData#get_marry_skill_cd_resp.cd_list, [{{32, unsigned}, {32, unsigned}}]),

    BinData = <<
        CdList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90335, PackRecordData) ->
    SkillId = prot_util:pack(PackRecordData#notify_update_marry_skill_cd.skill_id, {32, unsigned}),

    BinData = <<
        SkillId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

