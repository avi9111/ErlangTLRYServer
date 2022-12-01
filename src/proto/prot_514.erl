-module(prot_514).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_514.hrl").


%% ---------------------------------------------------------------------------------------

decode(51401, _BinData) ->

    UnpackRecordData = #cs_guild_task{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51402, BinData) ->
    {RBin0, TaskInfo} = prot_util:unpack(BinData, [{{8, unsigned}, {16, unsigned}}]),
    {RBin1, TaskStage} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, DailyTimes} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Flag} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Type} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Id} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, FinishTimes} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, EndTime} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, ChooseId} = prot_util:unpack(RBin7, {8, unsigned}),
    {_RBin9, List} = prot_util:unpack(RBin8, [{8, unsigned}]),

    UnpackRecordData = #sc_guild_task{
        task_info = TaskInfo,
        task_stage = TaskStage,
        daily_times = DailyTimes,
        flag = Flag,
        type = Type,
        id = Id,
        finish_times = FinishTimes,
        end_time = EndTime,
        choose_id = ChooseId,
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51403, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_task_get{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51404, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_task_get{
        type = Type,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51405, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Grid} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_guild_task_finish{
        type = Type,
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51406, BinData) ->
    {RBin0, DailyTimes} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Flag} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_task_finish{
        daily_times = DailyTimes,
        flag = Flag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51407, BinData) ->
    {RBin0, TaskInfo} = prot_util:unpack(BinData, [{{8, unsigned}, {16, unsigned}}]),
    {_RBin1, TaskStage} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_task_info{
        task_info = TaskInfo,
        task_stage = TaskStage
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51408, _BinData) ->

    UnpackRecordData = #cs_guild_task_cancel{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51409, BinData) ->
    {_RBin0, Flag} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_guild_task_cancel{
        flag = Flag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51410, BinData) ->
    {_RBin0, FinishTimes} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_guild_task_times_change{
        finish_times = FinishTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51411, BinData) ->
    {RBin0, EndTime} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, List} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #sc_guild_task_rotary{
        end_time = EndTime,
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51412, _BinData) ->

    UnpackRecordData = #cs_guild_task_rotary_choose{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51413, BinData) ->
    {_RBin0, ChooseId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_guild_task_rotary_choose{
        choose_id = ChooseId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51414, _BinData) ->

    UnpackRecordData = #cs_guild_task_rotary_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51415, BinData) ->
    {_RBin0, EndTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_guild_task_rotary_get{
        end_time = EndTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51402, PackRecordData) ->
    TaskInfo = prot_util:pack(PackRecordData#sc_guild_task.task_info, [{{8, unsigned}, {16, unsigned}}]),
    TaskStage = prot_util:pack(PackRecordData#sc_guild_task.task_stage, {8, unsigned}),
    DailyTimes = prot_util:pack(PackRecordData#sc_guild_task.daily_times, {8, unsigned}),
    Flag = prot_util:pack(PackRecordData#sc_guild_task.flag, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_guild_task.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_guild_task.id, {8, unsigned}),
    FinishTimes = prot_util:pack(PackRecordData#sc_guild_task.finish_times, {8, unsigned}),
    EndTime = prot_util:pack(PackRecordData#sc_guild_task.end_time, {32, unsigned}),
    ChooseId = prot_util:pack(PackRecordData#sc_guild_task.choose_id, {8, unsigned}),
    List = prot_util:pack(PackRecordData#sc_guild_task.list, [{8, unsigned}]),

    BinData = <<
        TaskInfo/binary,
        TaskStage/binary,
        DailyTimes/binary,
        Flag/binary,
        Type/binary,
        Id/binary,
        FinishTimes/binary,
        EndTime/binary,
        ChooseId/binary,
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51403, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_guild_task_get.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51404, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_guild_task_get.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_guild_task_get.id, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51405, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_guild_task_finish.type, {8, unsigned}),
    Grid = prot_util:pack(PackRecordData#cs_guild_task_finish.grid, {8, unsigned}),

    BinData = <<
        Type/binary,
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51406, PackRecordData) ->
    DailyTimes = prot_util:pack(PackRecordData#sc_guild_task_finish.daily_times, {8, unsigned}),
    Flag = prot_util:pack(PackRecordData#sc_guild_task_finish.flag, {8, unsigned}),

    BinData = <<
        DailyTimes/binary,
        Flag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51407, PackRecordData) ->
    TaskInfo = prot_util:pack(PackRecordData#sc_guild_task_info.task_info, [{{8, unsigned}, {16, unsigned}}]),
    TaskStage = prot_util:pack(PackRecordData#sc_guild_task_info.task_stage, {8, unsigned}),

    BinData = <<
        TaskInfo/binary,
        TaskStage/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51408, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51409, PackRecordData) ->
    Flag = prot_util:pack(PackRecordData#sc_guild_task_cancel.flag, {8, unsigned}),

    BinData = <<
        Flag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51410, PackRecordData) ->
    FinishTimes = prot_util:pack(PackRecordData#sc_guild_task_times_change.finish_times, {8, unsigned}),

    BinData = <<
        FinishTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51411, PackRecordData) ->
    EndTime = prot_util:pack(PackRecordData#sc_guild_task_rotary.end_time, {32, unsigned}),
    List = prot_util:pack(PackRecordData#sc_guild_task_rotary.list, [{8, unsigned}]),

    BinData = <<
        EndTime/binary,
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51412, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51413, PackRecordData) ->
    ChooseId = prot_util:pack(PackRecordData#sc_guild_task_rotary_choose.choose_id, {8, unsigned}),

    BinData = <<
        ChooseId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51414, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51415, PackRecordData) ->
    EndTime = prot_util:pack(PackRecordData#sc_guild_task_rotary_get.end_time, {32, unsigned}),

    BinData = <<
        EndTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

