-module(prot_521).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_521.hrl").


%% ---------------------------------------------------------------------------------------

decode(52101, _BinData) ->

    UnpackRecordData = #carry_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52102, BinData) ->
    {RBin0, CarryTimes} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, RobTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Quality} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Line} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Stat} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, ExpireTime} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, CarryScene} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, CarryX} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, CarryY} = prot_util:unpack(RBin7, {16, unsigned}),
    {_RBin9, RefreshTimes} = prot_util:unpack(RBin8, {16, unsigned}),

    UnpackRecordData = #carry_info_resp{
        carry_times = CarryTimes,
        rob_times = RobTimes,
        quality = Quality,
        line = Line,
        stat = Stat,
        expire_time = ExpireTime,
        carry_scene = CarryScene,
        carry_x = CarryX,
        carry_y = CarryY,
        refresh_times = RefreshTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52103, _BinData) ->

    UnpackRecordData = #book_carry_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52104, BinData) ->
    {RBin0, Quality} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, RefreshTimes} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #notify_carry{
        quality = Quality,
        refresh_times = RefreshTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52105, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #refresh_carry_req{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52106, _BinData) ->

    UnpackRecordData = #start_carry_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52107, _BinData) ->

    UnpackRecordData = #submit_carry_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52108, _BinData) ->

    UnpackRecordData = #transfer_to_carry_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52109, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, X} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Y} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #notify_carry_pos{
        scene_id = SceneId,
        x = X,
        y = Y
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52102, PackRecordData) ->
    CarryTimes = prot_util:pack(PackRecordData#carry_info_resp.carry_times, {8, unsigned}),
    RobTimes = prot_util:pack(PackRecordData#carry_info_resp.rob_times, {8, unsigned}),
    Quality = prot_util:pack(PackRecordData#carry_info_resp.quality, {8, unsigned}),
    Line = prot_util:pack(PackRecordData#carry_info_resp.line, {8, unsigned}),
    Stat = prot_util:pack(PackRecordData#carry_info_resp.stat, {8, unsigned}),
    ExpireTime = prot_util:pack(PackRecordData#carry_info_resp.expire_time, {32, unsigned}),
    CarryScene = prot_util:pack(PackRecordData#carry_info_resp.carry_scene, {32, unsigned}),
    CarryX = prot_util:pack(PackRecordData#carry_info_resp.carry_x, {16, unsigned}),
    CarryY = prot_util:pack(PackRecordData#carry_info_resp.carry_y, {16, unsigned}),
    RefreshTimes = prot_util:pack(PackRecordData#carry_info_resp.refresh_times, {16, unsigned}),

    BinData = <<
        CarryTimes/binary,
        RobTimes/binary,
        Quality/binary,
        Line/binary,
        Stat/binary,
        ExpireTime/binary,
        CarryScene/binary,
        CarryX/binary,
        CarryY/binary,
        RefreshTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52103, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52104, PackRecordData) ->
    Quality = prot_util:pack(PackRecordData#notify_carry.quality, {8, unsigned}),
    RefreshTimes = prot_util:pack(PackRecordData#notify_carry.refresh_times, {16, unsigned}),

    BinData = <<
        Quality/binary,
        RefreshTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52105, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#refresh_carry_req.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52106, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52107, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52108, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52109, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#notify_carry_pos.scene_id, {32, unsigned}),
    X = prot_util:pack(PackRecordData#notify_carry_pos.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#notify_carry_pos.y, {16, unsigned}),

    BinData = <<
        SceneId/binary,
        X/binary,
        Y/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

