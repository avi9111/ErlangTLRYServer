-module(prot_510).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_510.hrl").


%% ---------------------------------------------------------------------------------------

decode(51001, _BinData) ->

    UnpackRecordData = #cs_daily_thief_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51002, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, DailyTimes} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, SceneId} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, X} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Y} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, State} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, ExpTime} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, RoratyTime} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, Index} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, RoratyList} = prot_util:unpack(RBin8, [{8, unsigned}]),
    {RBin10, TargetId} = prot_util:unpack(RBin9, {64, unsigned}),
    {_RBin11, NpcId} = prot_util:unpack(RBin10, {32, unsigned}),

    UnpackRecordData = #sc_daily_thief_info{
        times = Times,
        daily_times = DailyTimes,
        scene_id = SceneId,
        x = X,
        y = Y,
        state = State,
        exp_time = ExpTime,
        roraty_time = RoratyTime,
        index = Index,
        roraty_list = RoratyList,
        target_id = TargetId,
        npc_id = NpcId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51003, _BinData) ->

    UnpackRecordData = #cs_daily_thief_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51004, BinData) ->
    {RBin0, NpcId} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, State} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_daily_thief_get{
        npc_id = NpcId,
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51005, _BinData) ->

    UnpackRecordData = #cs_daily_thief_near{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51006, BinData) ->
    {RBin0, State} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, TargetId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_daily_thief_near{
        state = State,
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51007, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, DailyTimes} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_daily_thirf_kill{
        times = Times,
        daily_times = DailyTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51008, BinData) ->
    {_RBin0, ExpTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_daily_thief_kill_horse{
        exp_time = ExpTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51009, _BinData) ->

    UnpackRecordData = #cs_daily_thief_exp_adven{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51010, BinData) ->
    {RBin0, Exp} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, ExpTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_daily_thief_exp_adven{
        exp = Exp,
        exp_time = ExpTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51011, _BinData) ->

    UnpackRecordData = #cs_daily_thief_roraty_adven{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51012, BinData) ->
    {_RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_daily_thief_roraty_adven{
        index = Index
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51013, _BinData) ->

    UnpackRecordData = #cs_daily_thief_cancel{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51014, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, SceneId} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, X} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Y} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, State} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, TargetId} = prot_util:unpack(RBin4, {64, unsigned}),
    {_RBin6, Type} = prot_util:unpack(RBin5, {8, unsigned}),

    UnpackRecordData = #sc_daily_thief_cancel{
        times = Times,
        scene_id = SceneId,
        x = X,
        y = Y,
        state = State,
        target_id = TargetId,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51015, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, X} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Y} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, TargetId} = prot_util:unpack(RBin2, {64, unsigned}),

    UnpackRecordData = #sc_daily_thief_refersh_adven{
        scene_id = SceneId,
        x = X,
        y = Y,
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51016, _BinData) ->

    UnpackRecordData = #cs_daily_thief_handle_task{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51018, BinData) ->
    {RBin0, RoratyTime} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, RoratyList} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #sc_daily_thief_trigger_roraty{
        roraty_time = RoratyTime,
        roraty_list = RoratyList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51019, BinData) ->
    {_RBin0, State} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_daily_thief_task_back{
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51020, _BinData) ->

    UnpackRecordData = #cs_daily_thief_roraty_adven_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51021, BinData) ->
    {RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, RoratyTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_daily_thief_roraty_adven_get{
        index = Index,
        roraty_time = RoratyTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51022, _BinData) ->

    UnpackRecordData = #cs_daily_thief_exp_adven_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51023, BinData) ->
    {RBin0, Exp} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, ExpTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_daily_thief_exp_adven_get{
        exp = Exp,
        exp_time = ExpTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51002, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_daily_thief_info.times, {8, unsigned}),
    DailyTimes = prot_util:pack(PackRecordData#sc_daily_thief_info.daily_times, {32, unsigned}),
    SceneId = prot_util:pack(PackRecordData#sc_daily_thief_info.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_daily_thief_info.x, {32, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_daily_thief_info.y, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_daily_thief_info.state, {8, unsigned}),
    ExpTime = prot_util:pack(PackRecordData#sc_daily_thief_info.exp_time, {32, unsigned}),
    RoratyTime = prot_util:pack(PackRecordData#sc_daily_thief_info.roraty_time, {32, unsigned}),
    Index = prot_util:pack(PackRecordData#sc_daily_thief_info.index, {8, unsigned}),
    RoratyList = prot_util:pack(PackRecordData#sc_daily_thief_info.roraty_list, [{8, unsigned}]),
    TargetId = prot_util:pack(PackRecordData#sc_daily_thief_info.target_id, {64, unsigned}),
    NpcId = prot_util:pack(PackRecordData#sc_daily_thief_info.npc_id, {32, unsigned}),

    BinData = <<
        Times/binary,
        DailyTimes/binary,
        SceneId/binary,
        X/binary,
        Y/binary,
        State/binary,
        ExpTime/binary,
        RoratyTime/binary,
        Index/binary,
        RoratyList/binary,
        TargetId/binary,
        NpcId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51003, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51004, PackRecordData) ->
    NpcId = prot_util:pack(PackRecordData#sc_daily_thief_get.npc_id, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_daily_thief_get.state, {8, unsigned}),

    BinData = <<
        NpcId/binary,
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51005, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51006, PackRecordData) ->
    State = prot_util:pack(PackRecordData#sc_daily_thief_near.state, {8, unsigned}),
    TargetId = prot_util:pack(PackRecordData#sc_daily_thief_near.target_id, {64, unsigned}),

    BinData = <<
        State/binary,
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51007, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_daily_thirf_kill.times, {8, unsigned}),
    DailyTimes = prot_util:pack(PackRecordData#sc_daily_thirf_kill.daily_times, {32, unsigned}),

    BinData = <<
        Times/binary,
        DailyTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51008, PackRecordData) ->
    ExpTime = prot_util:pack(PackRecordData#sc_daily_thief_kill_horse.exp_time, {32, unsigned}),

    BinData = <<
        ExpTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51009, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51010, PackRecordData) ->
    Exp = prot_util:pack(PackRecordData#sc_daily_thief_exp_adven.exp, {32, unsigned}),
    ExpTime = prot_util:pack(PackRecordData#sc_daily_thief_exp_adven.exp_time, {32, unsigned}),

    BinData = <<
        Exp/binary,
        ExpTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51011, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51012, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#sc_daily_thief_roraty_adven.index, {8, unsigned}),

    BinData = <<
        Index/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51013, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51014, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_daily_thief_cancel.times, {8, unsigned}),
    SceneId = prot_util:pack(PackRecordData#sc_daily_thief_cancel.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_daily_thief_cancel.x, {32, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_daily_thief_cancel.y, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_daily_thief_cancel.state, {8, unsigned}),
    TargetId = prot_util:pack(PackRecordData#sc_daily_thief_cancel.target_id, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_daily_thief_cancel.type, {8, unsigned}),

    BinData = <<
        Times/binary,
        SceneId/binary,
        X/binary,
        Y/binary,
        State/binary,
        TargetId/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51015, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#sc_daily_thief_refersh_adven.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#sc_daily_thief_refersh_adven.x, {32, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_daily_thief_refersh_adven.y, {32, unsigned}),
    TargetId = prot_util:pack(PackRecordData#sc_daily_thief_refersh_adven.target_id, {64, unsigned}),

    BinData = <<
        SceneId/binary,
        X/binary,
        Y/binary,
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51016, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51018, PackRecordData) ->
    RoratyTime = prot_util:pack(PackRecordData#sc_daily_thief_trigger_roraty.roraty_time, {32, unsigned}),
    RoratyList = prot_util:pack(PackRecordData#sc_daily_thief_trigger_roraty.roraty_list, [{8, unsigned}]),

    BinData = <<
        RoratyTime/binary,
        RoratyList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51019, PackRecordData) ->
    State = prot_util:pack(PackRecordData#sc_daily_thief_task_back.state, {8, unsigned}),

    BinData = <<
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51020, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51021, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#sc_daily_thief_roraty_adven_get.index, {8, unsigned}),
    RoratyTime = prot_util:pack(PackRecordData#sc_daily_thief_roraty_adven_get.roraty_time, {32, unsigned}),

    BinData = <<
        Index/binary,
        RoratyTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51022, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51023, PackRecordData) ->
    Exp = prot_util:pack(PackRecordData#sc_daily_thief_exp_adven_get.exp, {32, unsigned}),
    ExpTime = prot_util:pack(PackRecordData#sc_daily_thief_exp_adven_get.exp_time, {32, unsigned}),

    BinData = <<
        Exp/binary,
        ExpTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

