-module(prot_422).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_422.hrl").


%% ---------------------------------------------------------------------------------------

decode(42201, _BinData) ->

    UnpackRecordData = #cs_smelt_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42202, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Exp} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Soul} = prot_util:unpack(RBin1, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_smelt_info{
        level = Level,
        exp = Exp,
        soul = Soul
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42203, BinData) ->
    {_RBin0, Poses} = prot_util:unpack(BinData, [{16, unsigned}]),

    UnpackRecordData = #cs_smelt_do{
        poses = Poses
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42204, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Exp} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Soul} = prot_util:unpack(RBin1, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_smelt_do{
        level = Level,
        exp = Exp,
        soul = Soul
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42202, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#sc_smelt_info.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_smelt_info.exp, {16, unsigned}),
    Soul = prot_util:pack(PackRecordData#sc_smelt_info.soul, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Level/binary,
        Exp/binary,
        Soul/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42203, PackRecordData) ->
    Poses = prot_util:pack(PackRecordData#cs_smelt_do.poses, [{16, unsigned}]),

    BinData = <<
        Poses/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42204, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#sc_smelt_do.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_smelt_do.exp, {16, unsigned}),
    Soul = prot_util:pack(PackRecordData#sc_smelt_do.soul, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Level/binary,
        Exp/binary,
        Soul/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

