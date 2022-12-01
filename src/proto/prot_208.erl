-module(prot_208).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_208.hrl").


%% ---------------------------------------------------------------------------------------

decode(20801, _BinData) ->

    UnpackRecordData = #cs_gather_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20802, BinData) ->
    {RBin0, Vitality} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Skills} = prot_util:unpack(RBin0, [{{16, unsigned}, {8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_gather_info{
        vitality = Vitality,
        skills = Skills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20803, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Num} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_gather_upgrade{
        id = Id,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20804, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Level} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Exp} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_gather_upgrade{
        id = Id,
        level = Level,
        exp = Exp
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20805, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Coll} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Quick} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_gather_coll{
        id = Id,
        coll = Coll,
        quick = Quick
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20806, BinData) ->
    {_RBin0, Vitality} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_gather_coll{
        vitality = Vitality
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20802, PackRecordData) ->
    Vitality = prot_util:pack(PackRecordData#sc_gather_info.vitality, {16, unsigned}),
    Skills = prot_util:pack(PackRecordData#sc_gather_info.skills, [{{16, unsigned}, {8, unsigned}, {16, unsigned}}]),

    BinData = <<
        Vitality/binary,
        Skills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20803, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_gather_upgrade.id, {8, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_gather_upgrade.num, {16, unsigned}),

    BinData = <<
        Id/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20804, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_gather_upgrade.id, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_gather_upgrade.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_gather_upgrade.exp, {16, unsigned}),

    BinData = <<
        Id/binary,
        Level/binary,
        Exp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20805, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_gather_coll.id, {64, unsigned}),
    Coll = prot_util:pack(PackRecordData#cs_gather_coll.coll, {32, unsigned}),
    Quick = prot_util:pack(PackRecordData#cs_gather_coll.quick, {8, unsigned}),

    BinData = <<
        Id/binary,
        Coll/binary,
        Quick/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20806, PackRecordData) ->
    Vitality = prot_util:pack(PackRecordData#sc_gather_coll.vitality, {16, unsigned}),

    BinData = <<
        Vitality/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

