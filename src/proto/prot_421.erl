-module(prot_421).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_421.hrl").


%% ---------------------------------------------------------------------------------------

decode(42101, _BinData) ->

    UnpackRecordData = #cs_channel_draw_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42102, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, WeekTimes} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Acc} = prot_util:unpack(RBin1, [{8, unsigned}]),

    UnpackRecordData = #sc_channel_draw_info{
        times = Times,
        week_times = WeekTimes,
        acc = Acc
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42103, BinData) ->
    {_RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_channel_draw_do{
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42104, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, WeekTimes} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Rewards} = prot_util:unpack(RBin1, [{32, unsigned}]),

    UnpackRecordData = #sc_channel_draw_do{
        times = Times,
        week_times = WeekTimes,
        rewards = Rewards
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42105, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_channel_draw_fetch{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42106, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_channel_draw_fetch{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42102, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_channel_draw_info.times, {8, unsigned}),
    WeekTimes = prot_util:pack(PackRecordData#sc_channel_draw_info.week_times, {32, unsigned}),
    Acc = prot_util:pack(PackRecordData#sc_channel_draw_info.acc, [{8, unsigned}]),

    BinData = <<
        Times/binary,
        WeekTimes/binary,
        Acc/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42103, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#cs_channel_draw_do.times, {8, unsigned}),

    BinData = <<
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42104, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_channel_draw_do.times, {8, unsigned}),
    WeekTimes = prot_util:pack(PackRecordData#sc_channel_draw_do.week_times, {32, unsigned}),
    Rewards = prot_util:pack(PackRecordData#sc_channel_draw_do.rewards, [{32, unsigned}]),

    BinData = <<
        Times/binary,
        WeekTimes/binary,
        Rewards/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42105, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_channel_draw_fetch.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42106, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_channel_draw_fetch.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

