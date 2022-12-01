-module(prot_418).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_418.hrl").


%% ---------------------------------------------------------------------------------------

decode(41801, _BinData) ->

    UnpackRecordData = #cs_hero_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41802, BinData) ->
    {RBin0, Heroes} = prot_util:unpack(BinData, [{u,clt_hero}]),
    {_RBin1, Guides} = prot_util:unpack(RBin0, [{u,clt_hero_guide}]),

    UnpackRecordData = #sc_hero_info{
        heroes = Heroes,
        guides = Guides
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41803, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_hero_active{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41804, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_hero_active{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41805, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Item} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Num} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #cs_hero_cultivate{
        id = Id,
        item = Item,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41806, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Level} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Exp} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_hero_cultivate{
        id = Id,
        level = Level,
        exp = Exp
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41807, _BinData) ->

    UnpackRecordData = #cs_hero_one_key_cult{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41808, BinData) ->
    {_RBin0, Heroes} = prot_util:unpack(BinData, [{u,clt_hero}]),

    UnpackRecordData = #sc_hero_one_key_cult{
        heroes = Heroes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41811, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_hero_legend{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41812, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_hero_legend{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41813, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Skill} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Legend} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_hero_guide{
        id = Id,
        skill = Skill,
        legend = Legend
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41814, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Skill} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Legend} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_hero_guide{
        id = Id,
        skill = Skill,
        legend = Legend
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41815, BinData) ->
    {_RBin0, Guide} = prot_util:unpack(BinData, {u,clt_hero_guide}),

    UnpackRecordData = #cs_hero_modify_guide{
        guide = Guide
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41816, BinData) ->
    {_RBin0, Guide} = prot_util:unpack(BinData, {u,clt_hero_guide}),

    UnpackRecordData = #sc_hero_modify_guide{
        guide = Guide
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41817, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_hero_use_guide{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41818, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Skills} = prot_util:unpack(RBin0, [{{32, unsigned}, {16, unsigned}, {8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_hero_use_guide{
        id = Id,
        skills = Skills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(41801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41802, PackRecordData) ->
    Heroes = prot_util:pack(PackRecordData#sc_hero_info.heroes, [{u,clt_hero}]),
    Guides = prot_util:pack(PackRecordData#sc_hero_info.guides, [{u,clt_hero_guide}]),

    BinData = <<
        Heroes/binary,
        Guides/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41803, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_hero_active.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41804, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_hero_active.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41805, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_hero_cultivate.id, {16, unsigned}),
    Item = prot_util:pack(PackRecordData#cs_hero_cultivate.item, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_hero_cultivate.num, {16, unsigned}),

    BinData = <<
        Id/binary,
        Item/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41806, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_hero_cultivate.id, {16, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_hero_cultivate.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_hero_cultivate.exp, {16, unsigned}),

    BinData = <<
        Id/binary,
        Level/binary,
        Exp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41807, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41808, PackRecordData) ->
    Heroes = prot_util:pack(PackRecordData#sc_hero_one_key_cult.heroes, [{u,clt_hero}]),

    BinData = <<
        Heroes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41811, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_hero_legend.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41812, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_hero_legend.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41813, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_hero_guide.id, {16, unsigned}),
    Skill = prot_util:pack(PackRecordData#cs_hero_guide.skill, {32, unsigned}),
    Legend = prot_util:pack(PackRecordData#cs_hero_guide.legend, {8, unsigned}),

    BinData = <<
        Id/binary,
        Skill/binary,
        Legend/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41814, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_hero_guide.id, {16, unsigned}),
    Skill = prot_util:pack(PackRecordData#sc_hero_guide.skill, {32, unsigned}),
    Legend = prot_util:pack(PackRecordData#sc_hero_guide.legend, {8, unsigned}),

    BinData = <<
        Id/binary,
        Skill/binary,
        Legend/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41815, PackRecordData) ->
    Guide = prot_util:pack(PackRecordData#cs_hero_modify_guide.guide, {u,clt_hero_guide}),

    BinData = <<
        Guide/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41816, PackRecordData) ->
    Guide = prot_util:pack(PackRecordData#sc_hero_modify_guide.guide, {u,clt_hero_guide}),

    BinData = <<
        Guide/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41817, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_hero_use_guide.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41818, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_hero_use_guide.id, {8, unsigned}),
    Skills = prot_util:pack(PackRecordData#sc_hero_use_guide.skills, [{{32, unsigned}, {16, unsigned}, {8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Id/binary,
        Skills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

