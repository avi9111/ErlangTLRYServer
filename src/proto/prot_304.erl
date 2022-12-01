-module(prot_304).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_304.hrl").


%% ---------------------------------------------------------------------------------------

decode(30401, _BinData) ->

    UnpackRecordData = #cs_sign_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30402, BinData) ->
    {RBin0, SignDay} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, IsGet} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Times} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, BqTimes} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Daily} = prot_util:unpack(RBin3, [{8, unsigned}]),
    {_RBin5, Acc} = prot_util:unpack(RBin4, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_sign_info{
        sign_day = SignDay,
        is_get = IsGet,
        times = Times,
        bq_times = BqTimes,
        daily = Daily,
        acc = Acc
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30403, _BinData) ->

    UnpackRecordData = #cs_sign_get_daily{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30404, BinData) ->
    {RBin0, IsGet} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Daily} = prot_util:unpack(RBin0, [{8, unsigned}]),
    {_RBin2, Acc} = prot_util:unpack(RBin1, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_sign_get_daily{
        is_get = IsGet,
        daily = Daily,
        acc = Acc
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30405, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_sign_get_acc{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30406, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_sign_get_acc{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30407, _BinData) ->

    UnpackRecordData = #cs_sign_bu_qian{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30408, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, BqTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Daily} = prot_util:unpack(RBin1, [{8, unsigned}]),
    {_RBin3, Acc} = prot_util:unpack(RBin2, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_sign_bu_qian{
        times = Times,
        bq_times = BqTimes,
        daily = Daily,
        acc = Acc
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30409, BinData) ->
    {_RBin0, Times} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_sign_change{
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(30401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30402, PackRecordData) ->
    SignDay = prot_util:pack(PackRecordData#sc_sign_info.sign_day, {8, unsigned}),
    IsGet = prot_util:pack(PackRecordData#sc_sign_info.is_get, {8, unsigned}),
    Times = prot_util:pack(PackRecordData#sc_sign_info.times, {32, unsigned}),
    BqTimes = prot_util:pack(PackRecordData#sc_sign_info.bq_times, {8, unsigned}),
    Daily = prot_util:pack(PackRecordData#sc_sign_info.daily, [{8, unsigned}]),
    Acc = prot_util:pack(PackRecordData#sc_sign_info.acc, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        SignDay/binary,
        IsGet/binary,
        Times/binary,
        BqTimes/binary,
        Daily/binary,
        Acc/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30403, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30404, PackRecordData) ->
    IsGet = prot_util:pack(PackRecordData#sc_sign_get_daily.is_get, {8, unsigned}),
    Daily = prot_util:pack(PackRecordData#sc_sign_get_daily.daily, [{8, unsigned}]),
    Acc = prot_util:pack(PackRecordData#sc_sign_get_daily.acc, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        IsGet/binary,
        Daily/binary,
        Acc/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30405, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_sign_get_acc.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30406, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_sign_get_acc.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30407, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30408, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_sign_bu_qian.times, {32, unsigned}),
    BqTimes = prot_util:pack(PackRecordData#sc_sign_bu_qian.bq_times, {8, unsigned}),
    Daily = prot_util:pack(PackRecordData#sc_sign_bu_qian.daily, [{8, unsigned}]),
    Acc = prot_util:pack(PackRecordData#sc_sign_bu_qian.acc, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Times/binary,
        BqTimes/binary,
        Daily/binary,
        Acc/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30409, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_sign_change.times, {32, unsigned}),

    BinData = <<
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

