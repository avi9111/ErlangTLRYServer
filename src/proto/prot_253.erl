-module(prot_253).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_253.hrl").


%% ---------------------------------------------------------------------------------------

decode(25301, _BinData) ->

    UnpackRecordData = #cs_chess_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25302, BinData) ->
    {RBin0, Star} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, State} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, ChalTimes} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, LeftTimes} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, LifeTimes} = prot_util:unpack(RBin3, {32, unsigned}),
    {_RBin5, RewardTime} = prot_util:unpack(RBin4, {32, unsigned}),

    UnpackRecordData = #sc_chess_info{
        star = Star,
        state = State,
        chal_times = ChalTimes,
        left_times = LeftTimes,
        life_times = LifeTimes,
        reward_time = RewardTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25303, _BinData) ->

    UnpackRecordData = #cs_chess_refresh{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25304, BinData) ->
    {_RBin0, Star} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_chess_refresh{
        star = Star
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25305, _BinData) ->

    UnpackRecordData = #cs_chess_one_key_finish{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25306, BinData) ->
    {RBin0, State} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, ChalTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, LifeTimes} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #sc_chess_one_key_finish{
        state = State,
        chal_times = ChalTimes,
        life_times = LifeTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25307, _BinData) ->

    UnpackRecordData = #cs_chess_get_reward{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25308, _BinData) ->

    UnpackRecordData = #sc_chess_get_reward{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(25301, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25302, PackRecordData) ->
    Star = prot_util:pack(PackRecordData#sc_chess_info.star, {8, unsigned}),
    State = prot_util:pack(PackRecordData#sc_chess_info.state, {8, unsigned}),
    ChalTimes = prot_util:pack(PackRecordData#sc_chess_info.chal_times, {8, unsigned}),
    LeftTimes = prot_util:pack(PackRecordData#sc_chess_info.left_times, {8, unsigned}),
    LifeTimes = prot_util:pack(PackRecordData#sc_chess_info.life_times, {32, unsigned}),
    RewardTime = prot_util:pack(PackRecordData#sc_chess_info.reward_time, {32, unsigned}),

    BinData = <<
        Star/binary,
        State/binary,
        ChalTimes/binary,
        LeftTimes/binary,
        LifeTimes/binary,
        RewardTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25303, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25304, PackRecordData) ->
    Star = prot_util:pack(PackRecordData#sc_chess_refresh.star, {8, unsigned}),

    BinData = <<
        Star/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25305, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25306, PackRecordData) ->
    State = prot_util:pack(PackRecordData#sc_chess_one_key_finish.state, {8, unsigned}),
    ChalTimes = prot_util:pack(PackRecordData#sc_chess_one_key_finish.chal_times, {8, unsigned}),
    LifeTimes = prot_util:pack(PackRecordData#sc_chess_one_key_finish.life_times, {32, unsigned}),

    BinData = <<
        State/binary,
        ChalTimes/binary,
        LifeTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25307, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25308, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

