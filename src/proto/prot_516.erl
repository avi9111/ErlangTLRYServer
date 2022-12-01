-module(prot_516).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_516.hrl").


%% ---------------------------------------------------------------------------------------

decode(51601, _BinData) ->

    UnpackRecordData = #cs_daily_robber_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51602, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, MaxTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, SceneId} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, X} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Y} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, State} = prot_util:unpack(RBin4, {8, unsigned}),
    {_RBin6, MonId} = prot_util:unpack(RBin5, {64, unsigned}),

    UnpackRecordData = #sc_daily_robber_info{
        times = Times,
        max_times = MaxTimes,
        scene_id = SceneId,
        x = X,
        y = Y,
        state = State,
        mon_id = MonId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51603, _BinData) ->

    UnpackRecordData = #cs_daily_robber_accept_task{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51604, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, X} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Y} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, State} = prot_util:unpack(RBin2, {8, unsigned}),
    {_RBin4, MonId} = prot_util:unpack(RBin3, {64, unsigned}),

    UnpackRecordData = #sc_daily_robber_accept_task{
        scene_id = SceneId,
        x = X,
        y = Y,
        state = State,
        mon_id = MonId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51605, _BinData) ->

    UnpackRecordData = #cs_daily_robber_abandon_task{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51606, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, X} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Y} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, State} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #sc_daily_robber_abandon_task{
        scene_id = SceneId,
        x = X,
        y = Y,
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51607, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, SceneId} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, X} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Y} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, State} = prot_util:unpack(RBin3, {8, unsigned}),
    {_RBin5, MonId} = prot_util:unpack(RBin4, {64, unsigned}),

    UnpackRecordData = #sc_daily_robber_update_task{
        times = Times,
        scene_id = SceneId,
        x = X,
        y = Y,
        state = State,
        mon_id = MonId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51608, _BinData) ->

    UnpackRecordData = #cs_daily_robber_submit_task{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51602, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_daily_robber_info.times, {8, unsigned}),
    MaxTimes = prot_util:pack(PackRecordData#sc_daily_robber_info.max_times, {8, unsigned}),
    SceneId = prot_util:pack(PackRecordData#sc_daily_robber_info.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_daily_robber_info.x, {32, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_daily_robber_info.y, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_daily_robber_info.state, {8, unsigned}),
    MonId = prot_util:pack(PackRecordData#sc_daily_robber_info.mon_id, {64, unsigned}),

    BinData = <<
        Times/binary,
        MaxTimes/binary,
        SceneId/binary,
        X/binary,
        Y/binary,
        State/binary,
        MonId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51603, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51604, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#sc_daily_robber_accept_task.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_daily_robber_accept_task.x, {32, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_daily_robber_accept_task.y, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_daily_robber_accept_task.state, {8, unsigned}),
    MonId = prot_util:pack(PackRecordData#sc_daily_robber_accept_task.mon_id, {64, unsigned}),

    BinData = <<
        SceneId/binary,
        X/binary,
        Y/binary,
        State/binary,
        MonId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51605, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51606, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#sc_daily_robber_abandon_task.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_daily_robber_abandon_task.x, {32, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_daily_robber_abandon_task.y, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_daily_robber_abandon_task.state, {8, unsigned}),

    BinData = <<
        SceneId/binary,
        X/binary,
        Y/binary,
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51607, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_daily_robber_update_task.times, {8, unsigned}),
    SceneId = prot_util:pack(PackRecordData#sc_daily_robber_update_task.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_daily_robber_update_task.x, {32, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_daily_robber_update_task.y, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_daily_robber_update_task.state, {8, unsigned}),
    MonId = prot_util:pack(PackRecordData#sc_daily_robber_update_task.mon_id, {64, unsigned}),

    BinData = <<
        Times/binary,
        SceneId/binary,
        X/binary,
        Y/binary,
        State/binary,
        MonId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51608, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

