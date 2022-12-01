-module(prot_424).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_424.hrl").


%% ---------------------------------------------------------------------------------------

decode(42401, _BinData) ->

    UnpackRecordData = #cs_circle_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42402, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, RoundTimes} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, QuickItem} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, QuickNum} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, HelpdTimes} = prot_util:unpack(RBin3, {8, unsigned}),
    {_RBin5, WilfulTimes} = prot_util:unpack(RBin4, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_circle_info{
        times = Times,
        round_times = RoundTimes,
        quick_item = QuickItem,
        quick_num = QuickNum,
        helpd_times = HelpdTimes,
        wilful_times = WilfulTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42403, _BinData) ->

    UnpackRecordData = #cs_circle_accept{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42404, BinData) ->
    {RBin0, QuickItem} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, QuickNum} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_circle_accept{
        quick_item = QuickItem,
        quick_num = QuickNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42405, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_circle_wilful{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42406, BinData) ->
    {_RBin0, WilfulTimes} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_circle_wilful{
        wilful_times = WilfulTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42407, _BinData) ->

    UnpackRecordData = #cs_circle_ask_for_help{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42408, _BinData) ->

    UnpackRecordData = #sc_circle_ask_for_help{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42409, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, TaskId} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Ref} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, Poses} = prot_util:unpack(RBin2, [{{16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #cs_circle_help{
        role_id = RoleId,
        task_id = TaskId,
        ref = Ref,
        poses = Poses
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42410, _BinData) ->

    UnpackRecordData = #sc_circle_help{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42411, BinData) ->
    {_RBin0, Poses} = prot_util:unpack(BinData, [{{16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #cs_circle_quick{
        poses = Poses
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42412, _BinData) ->

    UnpackRecordData = #sc_circle_quick{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42402, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_circle_info.times, {16, unsigned}),
    RoundTimes = prot_util:pack(PackRecordData#sc_circle_info.round_times, {16, unsigned}),
    QuickItem = prot_util:pack(PackRecordData#sc_circle_info.quick_item, {32, unsigned}),
    QuickNum = prot_util:pack(PackRecordData#sc_circle_info.quick_num, {8, unsigned}),
    HelpdTimes = prot_util:pack(PackRecordData#sc_circle_info.helpd_times, {8, unsigned}),
    WilfulTimes = prot_util:pack(PackRecordData#sc_circle_info.wilful_times, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Times/binary,
        RoundTimes/binary,
        QuickItem/binary,
        QuickNum/binary,
        HelpdTimes/binary,
        WilfulTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42403, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42404, PackRecordData) ->
    QuickItem = prot_util:pack(PackRecordData#sc_circle_accept.quick_item, {8, unsigned}),
    QuickNum = prot_util:pack(PackRecordData#sc_circle_accept.quick_num, {8, unsigned}),

    BinData = <<
        QuickItem/binary,
        QuickNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42405, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_circle_wilful.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42406, PackRecordData) ->
    WilfulTimes = prot_util:pack(PackRecordData#sc_circle_wilful.wilful_times, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        WilfulTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42407, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42408, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42409, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_circle_help.role_id, {64, unsigned}),
    TaskId = prot_util:pack(PackRecordData#cs_circle_help.task_id, {32, unsigned}),
    Ref = prot_util:pack(PackRecordData#cs_circle_help.ref, {32, unsigned}),
    Poses = prot_util:pack(PackRecordData#cs_circle_help.poses, [{{16, unsigned}, {16, unsigned}}]),

    BinData = <<
        RoleId/binary,
        TaskId/binary,
        Ref/binary,
        Poses/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42410, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42411, PackRecordData) ->
    Poses = prot_util:pack(PackRecordData#cs_circle_quick.poses, [{{16, unsigned}, {16, unsigned}}]),

    BinData = <<
        Poses/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42412, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

