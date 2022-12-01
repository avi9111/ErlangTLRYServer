-module(prot_505).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_505.hrl").


%% ---------------------------------------------------------------------------------------

decode(50501, _BinData) ->

    UnpackRecordData = #cs_guild_daily_task_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50502, BinData) ->
    {_RBin0, TaskData} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_guild_daily_task_info{
        task_data = TaskData
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50503, BinData) ->
    {_RBin0, TaskData} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_guild_daily_task_change{
        task_data = TaskData
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50504, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_daily_task_reset{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50505, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_daily_task_one_key{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(50501, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50502, PackRecordData) ->
    TaskData = prot_util:pack(PackRecordData#sc_guild_daily_task_info.task_data, [{{8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    BinData = <<
        TaskData/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50503, PackRecordData) ->
    TaskData = prot_util:pack(PackRecordData#sc_guild_daily_task_change.task_data, [{{8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    BinData = <<
        TaskData/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50504, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_daily_task_reset.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50505, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_daily_task_one_key.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

