-module(prot_426).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_426.hrl").


%% ---------------------------------------------------------------------------------------

decode(42601, _BinData) ->

    UnpackRecordData = #cs_prize_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42602, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Grade} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Tasks} = prot_util:unpack(RBin1, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_prize_info{
        times = Times,
        grade = Grade,
        tasks = Tasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42603, BinData) ->
    {_RBin0, Grade} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_prize_accept{
        grade = Grade
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42604, BinData) ->
    {RBin0, Grade} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Times} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_prize_accept{
        grade = Grade,
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42602, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_prize_info.times, {16, unsigned}),
    Grade = prot_util:pack(PackRecordData#sc_prize_info.grade, {8, unsigned}),
    Tasks = prot_util:pack(PackRecordData#sc_prize_info.tasks, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        Times/binary,
        Grade/binary,
        Tasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42603, PackRecordData) ->
    Grade = prot_util:pack(PackRecordData#cs_prize_accept.grade, {8, unsigned}),

    BinData = <<
        Grade/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42604, PackRecordData) ->
    Grade = prot_util:pack(PackRecordData#sc_prize_accept.grade, {8, unsigned}),
    Times = prot_util:pack(PackRecordData#sc_prize_accept.times, {16, unsigned}),

    BinData = <<
        Grade/binary,
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

