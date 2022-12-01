-module(prot_519).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_519.hrl").


%% ---------------------------------------------------------------------------------------

decode(51901, _BinData) ->

    UnpackRecordData = #cs_treasure_map_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51902, BinData) ->
    {RBin0, IsTrigger} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, TaskTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, IsComplete} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_treasure_map_info{
        is_trigger = IsTrigger,
        task_times = TaskTimes,
        is_complete = IsComplete
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51903, _BinData) ->

    UnpackRecordData = #cs_treasure_map_pos{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51904, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, X} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Y} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_treasure_map_pos{
        scene_id = SceneId,
        x = X,
        y = Y
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51905, BinData) ->
    {_RBin0, ItemId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_treasure_map_use{
        item_id = ItemId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51906, BinData) ->
    {RBin0, EventId} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, TaskTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, IsComplete} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, ItemId} = prot_util:unpack(RBin2, {32, unsigned}),

    UnpackRecordData = #sc_treasure_map_use{
        event_id = EventId,
        task_times = TaskTimes,
        is_complete = IsComplete,
        item_id = ItemId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51907, BinData) ->
    {RBin0, MonId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, IsRare} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_treasure_map_refresh{
        mon_id = MonId,
        is_rare = IsRare
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51908, _BinData) ->

    UnpackRecordData = #cs_treasure_map_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51909, BinData) ->
    {_RBin0, IsTrigger} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_treasure_map_get{
        is_trigger = IsTrigger
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51910, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_treasure_mao_kill{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51911, _BinData) ->

    UnpackRecordData = #cs_treasure_map_reward{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51912, BinData) ->
    {_RBin0, IsComplete} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_treasure_map_reward{
        is_complete = IsComplete
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51913, BinData) ->
    {_RBin0, EventId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_treasure_map_event{
        event_id = EventId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51901, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51902, PackRecordData) ->
    IsTrigger = prot_util:pack(PackRecordData#sc_treasure_map_info.is_trigger, {8, unsigned}),
    TaskTimes = prot_util:pack(PackRecordData#sc_treasure_map_info.task_times, {8, unsigned}),
    IsComplete = prot_util:pack(PackRecordData#sc_treasure_map_info.is_complete, {8, unsigned}),

    BinData = <<
        IsTrigger/binary,
        TaskTimes/binary,
        IsComplete/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51903, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51904, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#sc_treasure_map_pos.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_treasure_map_pos.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_treasure_map_pos.y, {16, unsigned}),

    BinData = <<
        SceneId/binary,
        X/binary,
        Y/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51905, PackRecordData) ->
    ItemId = prot_util:pack(PackRecordData#cs_treasure_map_use.item_id, {32, unsigned}),

    BinData = <<
        ItemId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51906, PackRecordData) ->
    EventId = prot_util:pack(PackRecordData#sc_treasure_map_use.event_id, {8, unsigned}),
    TaskTimes = prot_util:pack(PackRecordData#sc_treasure_map_use.task_times, {8, unsigned}),
    IsComplete = prot_util:pack(PackRecordData#sc_treasure_map_use.is_complete, {8, unsigned}),
    ItemId = prot_util:pack(PackRecordData#sc_treasure_map_use.item_id, {32, unsigned}),

    BinData = <<
        EventId/binary,
        TaskTimes/binary,
        IsComplete/binary,
        ItemId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51907, PackRecordData) ->
    MonId = prot_util:pack(PackRecordData#sc_treasure_map_refresh.mon_id, {64, unsigned}),
    IsRare = prot_util:pack(PackRecordData#sc_treasure_map_refresh.is_rare, {8, unsigned}),

    BinData = <<
        MonId/binary,
        IsRare/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51908, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51909, PackRecordData) ->
    IsTrigger = prot_util:pack(PackRecordData#sc_treasure_map_get.is_trigger, {8, unsigned}),

    BinData = <<
        IsTrigger/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51910, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_treasure_mao_kill.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51911, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51912, PackRecordData) ->
    IsComplete = prot_util:pack(PackRecordData#sc_treasure_map_reward.is_complete, {8, unsigned}),

    BinData = <<
        IsComplete/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51913, PackRecordData) ->
    EventId = prot_util:pack(PackRecordData#sc_treasure_map_event.event_id, {8, unsigned}),

    BinData = <<
        EventId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

