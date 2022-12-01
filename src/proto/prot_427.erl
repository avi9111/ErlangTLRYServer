-module(prot_427).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_427.hrl").


%% ---------------------------------------------------------------------------------------

decode(42701, _BinData) ->

    UnpackRecordData = #cs_achieve_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42702, BinData) ->
    {RBin0, Types} = prot_util:unpack(BinData, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),
    {_RBin1, Tasks} = prot_util:unpack(RBin0, [{{32, unsigned}, {16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_achieve_info{
        types = Types,
        tasks = Tasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42703, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_achieve_get_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42704, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_achieve_get_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42705, BinData) ->
    {RBin0, Types} = prot_util:unpack(BinData, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),
    {_RBin1, Tasks} = prot_util:unpack(RBin0, [{{32, unsigned}, {16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_achieve_notify_task{
        types = Types,
        tasks = Tasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42701, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42702, PackRecordData) ->
    Types = prot_util:pack(PackRecordData#sc_achieve_info.types, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),
    Tasks = prot_util:pack(PackRecordData#sc_achieve_info.tasks, [{{32, unsigned}, {16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Types/binary,
        Tasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42703, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_achieve_get_reward.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42704, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_achieve_get_reward.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42705, PackRecordData) ->
    Types = prot_util:pack(PackRecordData#sc_achieve_notify_task.types, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),
    Tasks = prot_util:pack(PackRecordData#sc_achieve_notify_task.tasks, [{{32, unsigned}, {16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Types/binary,
        Tasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

