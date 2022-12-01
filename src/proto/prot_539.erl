-module(prot_539).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_539.hrl").


%% ---------------------------------------------------------------------------------------

decode(53901, _BinData) ->

    UnpackRecordData = #cs_warrior_soul_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53902, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, StarLv} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Skills} = prot_util:unpack(RBin1, [{32, unsigned}]),
    {RBin3, Stren} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Stones} = prot_util:unpack(RBin3, [{{8, unsigned}, {32, unsigned}}]),
    {RBin5, CurAvatar} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Avatars} = prot_util:unpack(RBin5, [{{32, unsigned}, {32, unsigned}}]),
    {RBin7, CombatPower} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, ACombatPower} = prot_util:unpack(RBin7, {32, unsigned}),
    {RBin9, AddSuccRate} = prot_util:unpack(RBin8, {16, unsigned}),
    {RBin10, CondenNum} = prot_util:unpack(RBin9, {32, unsigned}),
    {_RBin11, SoulParts} = prot_util:unpack(RBin10, [{u,soul_part_info}]),

    UnpackRecordData = #sc_warrior_soul_info{
        id = Id,
        star_lv = StarLv,
        skills = Skills,
        stren = Stren,
        stones = Stones,
        cur_avatar = CurAvatar,
        avatars = Avatars,
        combat_power = CombatPower,
        a_combat_power = ACombatPower,
        add_succ_rate = AddSuccRate,
        conden_num = CondenNum,
        soul_parts = SoulParts
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53903, _BinData) ->

    UnpackRecordData = #cs_warrior_soul_refine{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53904, BinData) ->
    {RBin0, Lv} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Skill} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, CombatPower} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, AddSuccRate} = prot_util:unpack(RBin2, {16, unsigned}),

    UnpackRecordData = #sc_warrior_soul_refine{
        lv = Lv,
        skill = Skill,
        combat_power = CombatPower,
        add_succ_rate = AddSuccRate
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53905, _BinData) ->

    UnpackRecordData = #cs_warrior_soul_star_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53906, BinData) ->
    {RBin0, StarLv} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, CombatPower} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_warrior_soul_star_up{
        star_lv = StarLv,
        combat_power = CombatPower
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53907, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Batch} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_warrior_soul_conden{
        type = Type,
        batch = Batch
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53908, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, CondenNum} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, SingleRet} = prot_util:unpack(RBin1, {u,conden_soul_result}),
    {_RBin3, BatchRet} = prot_util:unpack(RBin2, [{u,conden_soul_result}]),

    UnpackRecordData = #sc_warrior_soul_conden{
        type = Type,
        conden_num = CondenNum,
        single_ret = SingleRet,
        batch_ret = BatchRet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53909, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, IndexList} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #cs_warrior_soul_save_conden{
        type = Type,
        index_list = IndexList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53910, BinData) ->
    {RBin0, CombatPower} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, NewPart} = prot_util:unpack(RBin0, {u,soul_part_info}),

    UnpackRecordData = #sc_warrior_soul_part_update{
        combat_power = CombatPower,
        new_part = NewPart
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53911, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, CurAttrId} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, TargetAttrId} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #cs_warrior_soul_change_attr{
        type = Type,
        cur_attr_id = CurAttrId,
        target_attr_id = TargetAttrId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53912, BinData) ->
    {_RBin0, AvatarId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_warrior_soul_change_avatar{
        avatar_id = AvatarId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53913, BinData) ->
    {_RBin0, AvatarId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_warrior_soul_change_avatar{
        avatar_id = AvatarId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53914, BinData) ->
    {RBin0, CurAvatar} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Avatars} = prot_util:unpack(RBin0, [{{32, unsigned}, {32, unsigned}}]),
    {RBin2, CombatPower} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, ACombatPower} = prot_util:unpack(RBin2, {32, unsigned}),

    UnpackRecordData = #sc_warrior_soul_refresh_avatars{
        cur_avatar = CurAvatar,
        avatars = Avatars,
        combat_power = CombatPower,
        a_combat_power = ACombatPower
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53901, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53902, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_warrior_soul_info.id, {8, unsigned}),
    StarLv = prot_util:pack(PackRecordData#sc_warrior_soul_info.star_lv, {8, unsigned}),
    Skills = prot_util:pack(PackRecordData#sc_warrior_soul_info.skills, [{32, unsigned}]),
    Stren = prot_util:pack(PackRecordData#sc_warrior_soul_info.stren, {8, unsigned}),
    Stones = prot_util:pack(PackRecordData#sc_warrior_soul_info.stones, [{{8, unsigned}, {32, unsigned}}]),
    CurAvatar = prot_util:pack(PackRecordData#sc_warrior_soul_info.cur_avatar, {32, unsigned}),
    Avatars = prot_util:pack(PackRecordData#sc_warrior_soul_info.avatars, [{{32, unsigned}, {32, unsigned}}]),
    CombatPower = prot_util:pack(PackRecordData#sc_warrior_soul_info.combat_power, {32, unsigned}),
    ACombatPower = prot_util:pack(PackRecordData#sc_warrior_soul_info.a_combat_power, {32, unsigned}),
    AddSuccRate = prot_util:pack(PackRecordData#sc_warrior_soul_info.add_succ_rate, {16, unsigned}),
    CondenNum = prot_util:pack(PackRecordData#sc_warrior_soul_info.conden_num, {32, unsigned}),
    SoulParts = prot_util:pack(PackRecordData#sc_warrior_soul_info.soul_parts, [{u,soul_part_info}]),

    BinData = <<
        Id/binary,
        StarLv/binary,
        Skills/binary,
        Stren/binary,
        Stones/binary,
        CurAvatar/binary,
        Avatars/binary,
        CombatPower/binary,
        ACombatPower/binary,
        AddSuccRate/binary,
        CondenNum/binary,
        SoulParts/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53903, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53904, PackRecordData) ->
    Lv = prot_util:pack(PackRecordData#sc_warrior_soul_refine.lv, {8, unsigned}),
    Skill = prot_util:pack(PackRecordData#sc_warrior_soul_refine.skill, {32, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#sc_warrior_soul_refine.combat_power, {32, unsigned}),
    AddSuccRate = prot_util:pack(PackRecordData#sc_warrior_soul_refine.add_succ_rate, {16, unsigned}),

    BinData = <<
        Lv/binary,
        Skill/binary,
        CombatPower/binary,
        AddSuccRate/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53905, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53906, PackRecordData) ->
    StarLv = prot_util:pack(PackRecordData#sc_warrior_soul_star_up.star_lv, {8, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#sc_warrior_soul_star_up.combat_power, {32, unsigned}),

    BinData = <<
        StarLv/binary,
        CombatPower/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53907, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_warrior_soul_conden.type, {8, unsigned}),
    Batch = prot_util:pack(PackRecordData#cs_warrior_soul_conden.batch, {8, unsigned}),

    BinData = <<
        Type/binary,
        Batch/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53908, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_warrior_soul_conden.type, {8, unsigned}),
    CondenNum = prot_util:pack(PackRecordData#sc_warrior_soul_conden.conden_num, {32, unsigned}),
    SingleRet = prot_util:pack(PackRecordData#sc_warrior_soul_conden.single_ret, {u,conden_soul_result}),
    BatchRet = prot_util:pack(PackRecordData#sc_warrior_soul_conden.batch_ret, [{u,conden_soul_result}]),

    BinData = <<
        Type/binary,
        CondenNum/binary,
        SingleRet/binary,
        BatchRet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53909, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_warrior_soul_save_conden.type, {8, unsigned}),
    IndexList = prot_util:pack(PackRecordData#cs_warrior_soul_save_conden.index_list, [{8, unsigned}]),

    BinData = <<
        Type/binary,
        IndexList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53910, PackRecordData) ->
    CombatPower = prot_util:pack(PackRecordData#sc_warrior_soul_part_update.combat_power, {32, unsigned}),
    NewPart = prot_util:pack(PackRecordData#sc_warrior_soul_part_update.new_part, {u,soul_part_info}),

    BinData = <<
        CombatPower/binary,
        NewPart/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53911, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_warrior_soul_change_attr.type, {8, unsigned}),
    CurAttrId = prot_util:pack(PackRecordData#cs_warrior_soul_change_attr.cur_attr_id, {16, unsigned}),
    TargetAttrId = prot_util:pack(PackRecordData#cs_warrior_soul_change_attr.target_attr_id, {16, unsigned}),

    BinData = <<
        Type/binary,
        CurAttrId/binary,
        TargetAttrId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53912, PackRecordData) ->
    AvatarId = prot_util:pack(PackRecordData#cs_warrior_soul_change_avatar.avatar_id, {32, unsigned}),

    BinData = <<
        AvatarId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53913, PackRecordData) ->
    AvatarId = prot_util:pack(PackRecordData#sc_warrior_soul_change_avatar.avatar_id, {32, unsigned}),

    BinData = <<
        AvatarId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53914, PackRecordData) ->
    CurAvatar = prot_util:pack(PackRecordData#sc_warrior_soul_refresh_avatars.cur_avatar, {32, unsigned}),
    Avatars = prot_util:pack(PackRecordData#sc_warrior_soul_refresh_avatars.avatars, [{{32, unsigned}, {32, unsigned}}]),
    CombatPower = prot_util:pack(PackRecordData#sc_warrior_soul_refresh_avatars.combat_power, {32, unsigned}),
    ACombatPower = prot_util:pack(PackRecordData#sc_warrior_soul_refresh_avatars.a_combat_power, {32, unsigned}),

    BinData = <<
        CurAvatar/binary,
        Avatars/binary,
        CombatPower/binary,
        ACombatPower/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

