-module(prot_532).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_532.hrl").


%% ---------------------------------------------------------------------------------------

decode(53201, _BinData) ->

    UnpackRecordData = #cs_daily_task_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53202, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, TaskId} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_daily_task_info{
        times = Times,
        task_id = TaskId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53203, _BinData) ->

    UnpackRecordData = #cs_daily_task_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53204, BinData) ->
    {_RBin0, TaskId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_daily_task_get{
        task_id = TaskId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53202, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_daily_task_info.times, {8, unsigned}),
    TaskId = prot_util:pack(PackRecordData#sc_daily_task_info.task_id, {32, unsigned}),

    BinData = <<
        Times/binary,
        TaskId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53203, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53204, PackRecordData) ->
    TaskId = prot_util:pack(PackRecordData#sc_daily_task_get.task_id, {32, unsigned}),

    BinData = <<
        TaskId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

