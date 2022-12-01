-module(prot_423).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_423.hrl").


%% ---------------------------------------------------------------------------------------

decode(42301, _BinData) ->

    UnpackRecordData = #cs_task_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42302, BinData) ->
    {RBin0, Tasks} = prot_util:unpack(BinData, [{u,clt_task}]),
    {_RBin1, Last} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_task_info{
        tasks = Tasks,
        last = Last
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42303, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_task_accept{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42304, BinData) ->
    {_RBin0, Task} = prot_util:unpack(BinData, {u,clt_task}),

    UnpackRecordData = #sc_task_accept{
        task = Task
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42305, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_task_finish{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42306, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_task_finish{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42307, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Grid} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_task_get_reward{
        id = Id,
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42308, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Grid} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_task_get_reward{
        id = Id,
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42309, BinData) ->
    {_RBin0, Tasks} = prot_util:unpack(BinData, [{u,clt_task}]),

    UnpackRecordData = #sc_task_refresh{
        tasks = Tasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42301, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42302, PackRecordData) ->
    Tasks = prot_util:pack(PackRecordData#sc_task_info.tasks, [{u,clt_task}]),
    Last = prot_util:pack(PackRecordData#sc_task_info.last, {32, unsigned}),

    BinData = <<
        Tasks/binary,
        Last/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42303, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_task_accept.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42304, PackRecordData) ->
    Task = prot_util:pack(PackRecordData#sc_task_accept.task, {u,clt_task}),

    BinData = <<
        Task/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42305, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_task_finish.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42306, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_task_finish.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42307, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_task_get_reward.id, {32, unsigned}),
    Grid = prot_util:pack(PackRecordData#cs_task_get_reward.grid, {16, unsigned}),

    BinData = <<
        Id/binary,
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42308, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_task_get_reward.id, {32, unsigned}),
    Grid = prot_util:pack(PackRecordData#sc_task_get_reward.grid, {16, unsigned}),

    BinData = <<
        Id/binary,
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42309, PackRecordData) ->
    Tasks = prot_util:pack(PackRecordData#sc_task_refresh.tasks, [{u,clt_task}]),

    BinData = <<
        Tasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

