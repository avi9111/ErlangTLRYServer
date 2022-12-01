-module(prot_312).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_312.hrl").


%% ---------------------------------------------------------------------------------------

decode(31201, _BinData) ->

    UnpackRecordData = #cs_society_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31202, BinData) ->
    {RBin0, Star} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Tasks} = prot_util:unpack(RBin0, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),
    {RBin2, Status} = prot_util:unpack(RBin1, [{8, unsigned}]),
    {_RBin3, OpenTime} = prot_util:unpack(RBin2, {32, unsigned}),

    UnpackRecordData = #sc_society_info{
        star = Star,
        tasks = Tasks,
        status = Status,
        open_time = OpenTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31203, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_society_get_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31204, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Star} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_society_get_reward{
        id = Id,
        star = Star
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31205, BinData) ->
    {_RBin0, Star} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_society_star_reward{
        star = Star
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31206, BinData) ->
    {RBin0, Star} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Status} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #sc_society_star_reward{
        star = Star,
        status = Status
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31207, BinData) ->
    {_RBin0, Tasks} = prot_util:unpack(BinData, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_society_notify_task{
        tasks = Tasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(31201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31202, PackRecordData) ->
    Star = prot_util:pack(PackRecordData#sc_society_info.star, {16, unsigned}),
    Tasks = prot_util:pack(PackRecordData#sc_society_info.tasks, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),
    Status = prot_util:pack(PackRecordData#sc_society_info.status, [{8, unsigned}]),
    OpenTime = prot_util:pack(PackRecordData#sc_society_info.open_time, {32, unsigned}),

    BinData = <<
        Star/binary,
        Tasks/binary,
        Status/binary,
        OpenTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31203, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_society_get_reward.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31204, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_society_get_reward.id, {16, unsigned}),
    Star = prot_util:pack(PackRecordData#sc_society_get_reward.star, {16, unsigned}),

    BinData = <<
        Id/binary,
        Star/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31205, PackRecordData) ->
    Star = prot_util:pack(PackRecordData#cs_society_star_reward.star, {8, unsigned}),

    BinData = <<
        Star/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31206, PackRecordData) ->
    Star = prot_util:pack(PackRecordData#sc_society_star_reward.star, {8, unsigned}),
    Status = prot_util:pack(PackRecordData#sc_society_star_reward.status, [{8, unsigned}]),

    BinData = <<
        Star/binary,
        Status/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31207, PackRecordData) ->
    Tasks = prot_util:pack(PackRecordData#sc_society_notify_task.tasks, [{{16, unsigned}, {16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Tasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

