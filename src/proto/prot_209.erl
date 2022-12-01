-module(prot_209).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_209.hrl").


%% ---------------------------------------------------------------------------------------

decode(20901, _BinData) ->

    UnpackRecordData = #cs_dragon_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20902, BinData) ->
    {RBin0, Items} = prot_util:unpack(BinData, [{u,dragon}]),
    {RBin1, GrowthLv} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, GrowthHole} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, RefineLv} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, RefineStar} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, RefineExp} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, RefineTimes} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, RefineQuality} = prot_util:unpack(RBin6, [{{8, unsigned}, {16, unsigned}}]),
    {RBin8, RefineLvR} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, RefineStarR} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, RefineQualityR} = prot_util:unpack(RBin9, [{{8, unsigned}, {16, unsigned}}]),
    {_RBin11, CondenseState} = prot_util:unpack(RBin10, {8, unsigned}),

    UnpackRecordData = #sc_dragon_info{
        items = Items,
        growth_lv = GrowthLv,
        growth_hole = GrowthHole,
        refine_lv = RefineLv,
        refine_star = RefineStar,
        refine_exp = RefineExp,
        refine_times = RefineTimes,
        refine_quality = RefineQuality,
        refine_lv_r = RefineLvR,
        refine_star_r = RefineStarR,
        refine_quality_r = RefineQualityR,
        condense_state = CondenseState
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20903, _BinData) ->

    UnpackRecordData = #cs_dragon_level_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20904, BinData) ->
    {RBin0, GrowthLv} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, GrowthHole} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_dragon_level_up{
        growth_lv = GrowthLv,
        growth_hole = GrowthHole
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20905, _BinData) ->

    UnpackRecordData = #cs_dragon_refine{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20906, BinData) ->
    {RBin0, RefineExp} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, RefineTimes} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, RefineLvR} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, RefineStarR} = prot_util:unpack(RBin2, {8, unsigned}),
    {_RBin4, RefineQualityR} = prot_util:unpack(RBin3, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_dragon_refine{
        refine_exp = RefineExp,
        refine_times = RefineTimes,
        refine_lv_r = RefineLvR,
        refine_star_r = RefineStarR,
        refine_quality_r = RefineQualityR
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20907, _BinData) ->

    UnpackRecordData = #cs_dragon_replace{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20908, BinData) ->
    {RBin0, RefineStar} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, RefineLv} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, RefineQuality} = prot_util:unpack(RBin1, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_dragon_replace{
        refine_star = RefineStar,
        refine_lv = RefineLv,
        refine_quality = RefineQuality
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20909, BinData) ->
    {_RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_dragon_condense{
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20910, BinData) ->
    {RBin0, CondenseState} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Items} = prot_util:unpack(RBin0, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_dragon_condense{
        condense_state = CondenseState,
        items = Items
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20911, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, BagPos} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_dragon_equip{
        pos = Pos,
        bag_pos = BagPos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20912, BinData) ->
    {_RBin0, Item} = prot_util:unpack(BinData, {u,dragon}),

    UnpackRecordData = #sc_dragon_equip{
        item = Item
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20913, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Pos} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, BagPos} = prot_util:unpack(RBin1, [{16, unsigned}]),

    UnpackRecordData = #cs_dragon_eat{
        type = Type,
        pos = Pos,
        bag_pos = BagPos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20914, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Pos} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Level} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, Exp} = prot_util:unpack(RBin2, {16, unsigned}),

    UnpackRecordData = #sc_dragon_eat{
        type = Type,
        pos = Pos,
        level = Level,
        exp = Exp
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20901, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20902, PackRecordData) ->
    Items = prot_util:pack(PackRecordData#sc_dragon_info.items, [{u,dragon}]),
    GrowthLv = prot_util:pack(PackRecordData#sc_dragon_info.growth_lv, {8, unsigned}),
    GrowthHole = prot_util:pack(PackRecordData#sc_dragon_info.growth_hole, {8, unsigned}),
    RefineLv = prot_util:pack(PackRecordData#sc_dragon_info.refine_lv, {8, unsigned}),
    RefineStar = prot_util:pack(PackRecordData#sc_dragon_info.refine_star, {8, unsigned}),
    RefineExp = prot_util:pack(PackRecordData#sc_dragon_info.refine_exp, {16, unsigned}),
    RefineTimes = prot_util:pack(PackRecordData#sc_dragon_info.refine_times, {16, unsigned}),
    RefineQuality = prot_util:pack(PackRecordData#sc_dragon_info.refine_quality, [{{8, unsigned}, {16, unsigned}}]),
    RefineLvR = prot_util:pack(PackRecordData#sc_dragon_info.refine_lv_r, {8, unsigned}),
    RefineStarR = prot_util:pack(PackRecordData#sc_dragon_info.refine_star_r, {8, unsigned}),
    RefineQualityR = prot_util:pack(PackRecordData#sc_dragon_info.refine_quality_r, [{{8, unsigned}, {16, unsigned}}]),
    CondenseState = prot_util:pack(PackRecordData#sc_dragon_info.condense_state, {8, unsigned}),

    BinData = <<
        Items/binary,
        GrowthLv/binary,
        GrowthHole/binary,
        RefineLv/binary,
        RefineStar/binary,
        RefineExp/binary,
        RefineTimes/binary,
        RefineQuality/binary,
        RefineLvR/binary,
        RefineStarR/binary,
        RefineQualityR/binary,
        CondenseState/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20903, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20904, PackRecordData) ->
    GrowthLv = prot_util:pack(PackRecordData#sc_dragon_level_up.growth_lv, {8, unsigned}),
    GrowthHole = prot_util:pack(PackRecordData#sc_dragon_level_up.growth_hole, {8, unsigned}),

    BinData = <<
        GrowthLv/binary,
        GrowthHole/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20905, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20906, PackRecordData) ->
    RefineExp = prot_util:pack(PackRecordData#sc_dragon_refine.refine_exp, {16, unsigned}),
    RefineTimes = prot_util:pack(PackRecordData#sc_dragon_refine.refine_times, {16, unsigned}),
    RefineLvR = prot_util:pack(PackRecordData#sc_dragon_refine.refine_lv_r, {8, unsigned}),
    RefineStarR = prot_util:pack(PackRecordData#sc_dragon_refine.refine_star_r, {8, unsigned}),
    RefineQualityR = prot_util:pack(PackRecordData#sc_dragon_refine.refine_quality_r, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        RefineExp/binary,
        RefineTimes/binary,
        RefineLvR/binary,
        RefineStarR/binary,
        RefineQualityR/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20907, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20908, PackRecordData) ->
    RefineStar = prot_util:pack(PackRecordData#sc_dragon_replace.refine_star, {8, unsigned}),
    RefineLv = prot_util:pack(PackRecordData#sc_dragon_replace.refine_lv, {8, unsigned}),
    RefineQuality = prot_util:pack(PackRecordData#sc_dragon_replace.refine_quality, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        RefineStar/binary,
        RefineLv/binary,
        RefineQuality/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20909, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#cs_dragon_condense.times, {8, unsigned}),

    BinData = <<
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20910, PackRecordData) ->
    CondenseState = prot_util:pack(PackRecordData#sc_dragon_condense.condense_state, {8, unsigned}),
    Items = prot_util:pack(PackRecordData#sc_dragon_condense.items, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        CondenseState/binary,
        Items/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20911, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_dragon_equip.pos, {8, unsigned}),
    BagPos = prot_util:pack(PackRecordData#cs_dragon_equip.bag_pos, {16, unsigned}),

    BinData = <<
        Pos/binary,
        BagPos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20912, PackRecordData) ->
    Item = prot_util:pack(PackRecordData#sc_dragon_equip.item, {u,dragon}),

    BinData = <<
        Item/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20913, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_dragon_eat.type, {8, unsigned}),
    Pos = prot_util:pack(PackRecordData#cs_dragon_eat.pos, {8, unsigned}),
    BagPos = prot_util:pack(PackRecordData#cs_dragon_eat.bag_pos, [{16, unsigned}]),

    BinData = <<
        Type/binary,
        Pos/binary,
        BagPos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20914, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_dragon_eat.type, {8, unsigned}),
    Pos = prot_util:pack(PackRecordData#sc_dragon_eat.pos, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_dragon_eat.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_dragon_eat.exp, {16, unsigned}),

    BinData = <<
        Type/binary,
        Pos/binary,
        Level/binary,
        Exp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

