-module(prot_205).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_205.hrl").


%% ---------------------------------------------------------------------------------------

decode(20501, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_level_exchange_box{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20502, _BinData) ->

    UnpackRecordData = #cs_level_up_practice_max_lv{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20503, _BinData) ->

    UnpackRecordData = #cs_level_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20504, BinData) ->
    {_RBin0, Level} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_level_up{
        level = Level
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20505, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Exp} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, OpType} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_level_change{
        level = Level,
        exp = Exp,
        op_type = OpType
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20506, BinData) ->
    {_RBin0, PracMaxLv} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_level_up_practice_max_lv{
        prac_max_lv = PracMaxLv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20501, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_level_exchange_box.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20502, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20503, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20504, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#sc_level_up.level, {16, unsigned}),

    BinData = <<
        Level/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20505, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#sc_level_change.level, {16, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_level_change.exp, {64, unsigned}),
    OpType = prot_util:pack(PackRecordData#sc_level_change.op_type, {16, unsigned}),

    BinData = <<
        Level/binary,
        Exp/binary,
        OpType/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20506, PackRecordData) ->
    PracMaxLv = prot_util:pack(PackRecordData#sc_level_up_practice_max_lv.prac_max_lv, {16, unsigned}),

    BinData = <<
        PracMaxLv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

