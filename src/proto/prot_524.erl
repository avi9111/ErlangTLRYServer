-module(prot_524).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_524.hrl").


%% ---------------------------------------------------------------------------------------

decode(52401, _BinData) ->

    UnpackRecordData = #cs_daily_lively_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52402, BinData) ->
    {RBin0, LivelyExp} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, GotList} = prot_util:unpack(RBin0, [{8, unsigned}]),
    {_RBin2, Completed} = prot_util:unpack(RBin1, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_daily_lively_info{
        lively_exp = LivelyExp,
        got_list = GotList,
        completed = Completed
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52403, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_daily_lively_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52404, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_daily_lively_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52405, BinData) ->
    {RBin0, LivelyExp} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Completed} = prot_util:unpack(RBin0, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_daily_lively_change{
        lively_exp = LivelyExp,
        completed = Completed
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52402, PackRecordData) ->
    LivelyExp = prot_util:pack(PackRecordData#sc_daily_lively_info.lively_exp, {16, unsigned}),
    GotList = prot_util:pack(PackRecordData#sc_daily_lively_info.got_list, [{8, unsigned}]),
    Completed = prot_util:pack(PackRecordData#sc_daily_lively_info.completed, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        LivelyExp/binary,
        GotList/binary,
        Completed/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52403, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_daily_lively_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52404, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_daily_lively_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52405, PackRecordData) ->
    LivelyExp = prot_util:pack(PackRecordData#sc_daily_lively_change.lively_exp, {16, unsigned}),
    Completed = prot_util:pack(PackRecordData#sc_daily_lively_change.completed, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        LivelyExp/binary,
        Completed/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

