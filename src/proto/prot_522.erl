-module(prot_522).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_522.hrl").


%% ---------------------------------------------------------------------------------------

decode(52201, _BinData) ->

    UnpackRecordData = #cs_artifact_get_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52202, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, CurAvatar} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Avatars} = prot_util:unpack(RBin1, [{32, unsigned}]),
    {RBin3, CombatPower} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, ACombatPower} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Stren} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Stones} = prot_util:unpack(RBin5, [{{8, unsigned}, {32, unsigned}}]),
    {RBin7, ExtraAttr} = prot_util:unpack(RBin6, [{{16, unsigned}, {32, unsigned}}]),
    {RBin8, PosAttr} = prot_util:unpack(RBin7, [{{8, unsigned}, {16, unsigned}, {32, unsigned}}]),
    {RBin9, Chips} = prot_util:unpack(RBin8, [{{8, unsigned}, {8, unsigned}}]),
    {_RBin10, OpenUi} = prot_util:unpack(RBin9, {8, unsigned}),

    UnpackRecordData = #sc_artifact_get_info{
        id = Id,
        cur_avatar = CurAvatar,
        avatars = Avatars,
        combat_power = CombatPower,
        a_combat_power = ACombatPower,
        stren = Stren,
        stones = Stones,
        extra_attr = ExtraAttr,
        pos_attr = PosAttr,
        chips = Chips,
        open_ui = OpenUi
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52203, BinData) ->
    {_RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_artifact_add_extra_attr{
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52204, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Value} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, CombatPower} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, ExtraAttr} = prot_util:unpack(RBin2, [{{16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_artifact_add_extra_attr{
        pos = Pos,
        value = Value,
        combat_power = CombatPower,
        extra_attr = ExtraAttr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52205, _BinData) ->

    UnpackRecordData = #cs_artifact_lv_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52206, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, CombatPower} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_artifact_lv_up{
        id = Id,
        combat_power = CombatPower
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52207, BinData) ->
    {_RBin0, AvatarId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_artifact_change_avatar{
        avatar_id = AvatarId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52208, BinData) ->
    {_RBin0, AvatarId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_artifact_change_avatar{
        avatar_id = AvatarId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52209, BinData) ->
    {RBin0, CurAvatar} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Avatars} = prot_util:unpack(RBin0, [{32, unsigned}]),
    {_RBin2, ACombatPower} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #sc_artifact_refresh_avatars{
        cur_avatar = CurAvatar,
        avatars = Avatars,
        a_combat_power = ACombatPower
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52210, BinData) ->
    {_RBin0, Lv} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_artifact_take_award{
        lv = Lv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52211, BinData) ->
    {RBin0, Lv} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Take} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_artifact_update_new{
        lv = Lv,
        take = Take
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52212, _BinData) ->

    UnpackRecordData = #cs_artifact_activate{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52202, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_artifact_get_info.id, {32, unsigned}),
    CurAvatar = prot_util:pack(PackRecordData#sc_artifact_get_info.cur_avatar, {32, unsigned}),
    Avatars = prot_util:pack(PackRecordData#sc_artifact_get_info.avatars, [{32, unsigned}]),
    CombatPower = prot_util:pack(PackRecordData#sc_artifact_get_info.combat_power, {32, unsigned}),
    ACombatPower = prot_util:pack(PackRecordData#sc_artifact_get_info.a_combat_power, {32, unsigned}),
    Stren = prot_util:pack(PackRecordData#sc_artifact_get_info.stren, {8, unsigned}),
    Stones = prot_util:pack(PackRecordData#sc_artifact_get_info.stones, [{{8, unsigned}, {32, unsigned}}]),
    ExtraAttr = prot_util:pack(PackRecordData#sc_artifact_get_info.extra_attr, [{{16, unsigned}, {32, unsigned}}]),
    PosAttr = prot_util:pack(PackRecordData#sc_artifact_get_info.pos_attr, [{{8, unsigned}, {16, unsigned}, {32, unsigned}}]),
    Chips = prot_util:pack(PackRecordData#sc_artifact_get_info.chips, [{{8, unsigned}, {8, unsigned}}]),
    OpenUi = prot_util:pack(PackRecordData#sc_artifact_get_info.open_ui, {8, unsigned}),

    BinData = <<
        Id/binary,
        CurAvatar/binary,
        Avatars/binary,
        CombatPower/binary,
        ACombatPower/binary,
        Stren/binary,
        Stones/binary,
        ExtraAttr/binary,
        PosAttr/binary,
        Chips/binary,
        OpenUi/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52203, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_artifact_add_extra_attr.pos, {8, unsigned}),

    BinData = <<
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52204, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#sc_artifact_add_extra_attr.pos, {8, unsigned}),
    Value = prot_util:pack(PackRecordData#sc_artifact_add_extra_attr.value, {32, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#sc_artifact_add_extra_attr.combat_power, {32, unsigned}),
    ExtraAttr = prot_util:pack(PackRecordData#sc_artifact_add_extra_attr.extra_attr, [{{16, unsigned}, {32, unsigned}}]),

    BinData = <<
        Pos/binary,
        Value/binary,
        CombatPower/binary,
        ExtraAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52205, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52206, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_artifact_lv_up.id, {32, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#sc_artifact_lv_up.combat_power, {32, unsigned}),

    BinData = <<
        Id/binary,
        CombatPower/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52207, PackRecordData) ->
    AvatarId = prot_util:pack(PackRecordData#cs_artifact_change_avatar.avatar_id, {32, unsigned}),

    BinData = <<
        AvatarId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52208, PackRecordData) ->
    AvatarId = prot_util:pack(PackRecordData#sc_artifact_change_avatar.avatar_id, {32, unsigned}),

    BinData = <<
        AvatarId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52209, PackRecordData) ->
    CurAvatar = prot_util:pack(PackRecordData#sc_artifact_refresh_avatars.cur_avatar, {32, unsigned}),
    Avatars = prot_util:pack(PackRecordData#sc_artifact_refresh_avatars.avatars, [{32, unsigned}]),
    ACombatPower = prot_util:pack(PackRecordData#sc_artifact_refresh_avatars.a_combat_power, {32, unsigned}),

    BinData = <<
        CurAvatar/binary,
        Avatars/binary,
        ACombatPower/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52210, PackRecordData) ->
    Lv = prot_util:pack(PackRecordData#cs_artifact_take_award.lv, {8, unsigned}),

    BinData = <<
        Lv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52211, PackRecordData) ->
    Lv = prot_util:pack(PackRecordData#sc_artifact_update_new.lv, {8, unsigned}),
    Take = prot_util:pack(PackRecordData#sc_artifact_update_new.take, {8, unsigned}),

    BinData = <<
        Lv/binary,
        Take/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52212, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

