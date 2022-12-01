-module(prot_105).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_105.hrl").


%% ---------------------------------------------------------------------------------------

decode(10501, BinData) ->
    {_RBin0, Code} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_general_ret_code{
        code = Code
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10502, BinData) ->
    {RBin0, Code} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Args} = prot_util:unpack(RBin0, [string]),

    UnpackRecordData = #sc_general_ret_code_e{
        code = Code,
        args = Args
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10503, _BinData) ->

    UnpackRecordData = #cs_get_op_and_mer_day{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10504, BinData) ->
    {RBin0, OpDay} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, MergeDay} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, LoginDays} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_get_op_and_mer_day{
        op_day = OpDay,
        merge_day = MergeDay,
        login_days = LoginDays
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10505, BinData) ->
    {_RBin0, Key} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_get_commonly_key_value{
        key = Key
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10506, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Value} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_get_commonly_key_value{
        key = Key,
        value = Value
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10507, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Value} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #cs_set_commonly_key_value{
        key = Key,
        value = Value
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10508, _BinData) ->

    UnpackRecordData = #cs_get_world_lv{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10509, BinData) ->
    {RBin0, WorldLv} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, PioneerLv} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_get_world_lv{
        world_lv = WorldLv,
        pioneer_lv = PioneerLv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10510, _BinData) ->

    UnpackRecordData = #cs_today_onlie_time{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10511, BinData) ->
    {_RBin0, TodayOnlineTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_today_onlie_time{
        today_online_time = TodayOnlineTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10512, _BinData) ->

    UnpackRecordData = #sc_today_onlie_time_test{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(10501, PackRecordData) ->
    Code = prot_util:pack(PackRecordData#sc_general_ret_code.code, {32, unsigned}),

    BinData = <<
        Code/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10502, PackRecordData) ->
    Code = prot_util:pack(PackRecordData#sc_general_ret_code_e.code, {32, unsigned}),
    Args = prot_util:pack(PackRecordData#sc_general_ret_code_e.args, [string]),

    BinData = <<
        Code/binary,
        Args/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10503, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10504, PackRecordData) ->
    OpDay = prot_util:pack(PackRecordData#sc_get_op_and_mer_day.op_day, {16, unsigned}),
    MergeDay = prot_util:pack(PackRecordData#sc_get_op_and_mer_day.merge_day, {16, unsigned}),
    LoginDays = prot_util:pack(PackRecordData#sc_get_op_and_mer_day.login_days, {16, unsigned}),

    BinData = <<
        OpDay/binary,
        MergeDay/binary,
        LoginDays/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10505, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#cs_get_commonly_key_value.key, {32, unsigned}),

    BinData = <<
        Key/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10506, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#sc_get_commonly_key_value.key, {32, unsigned}),
    Value = prot_util:pack(PackRecordData#sc_get_commonly_key_value.value, {32, unsigned}),

    BinData = <<
        Key/binary,
        Value/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10507, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#cs_set_commonly_key_value.key, {32, unsigned}),
    Value = prot_util:pack(PackRecordData#cs_set_commonly_key_value.value, {32, unsigned}),

    BinData = <<
        Key/binary,
        Value/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10508, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10509, PackRecordData) ->
    WorldLv = prot_util:pack(PackRecordData#sc_get_world_lv.world_lv, {16, unsigned}),
    PioneerLv = prot_util:pack(PackRecordData#sc_get_world_lv.pioneer_lv, {16, unsigned}),

    BinData = <<
        WorldLv/binary,
        PioneerLv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10510, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10511, PackRecordData) ->
    TodayOnlineTime = prot_util:pack(PackRecordData#sc_today_onlie_time.today_online_time, {32, unsigned}),

    BinData = <<
        TodayOnlineTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10512, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

