-module(prot_529).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_529.hrl").


%% ---------------------------------------------------------------------------------------

decode(52901, _BinData) ->

    UnpackRecordData = #cs_charge_consume_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52902, BinData) ->
    {RBin0, ChargeGotList} = prot_util:unpack(BinData, [{8, unsigned}]),
    {RBin1, WeeklyConsume} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, ConsumeGotList} = prot_util:unpack(RBin1, [{8, unsigned}]),
    {RBin3, Flag} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, LeaveTimes} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, LeaveIds} = prot_util:unpack(RBin4, [{8, unsigned}]),
    {_RBin6, Index} = prot_util:unpack(RBin5, {8, unsigned}),

    UnpackRecordData = #sc_charge_consume_info{
        charge_got_list = ChargeGotList,
        weekly_consume = WeeklyConsume,
        consume_got_list = ConsumeGotList,
        flag = Flag,
        leave_times = LeaveTimes,
        leave_ids = LeaveIds,
        index = Index
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52903, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_charge_consume_get_charge{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52904, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_charge_consume_get_charge{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52905, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_charge_consume_get_consume{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52906, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_charge_consume_get_consume{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52907, BinData) ->
    {_RBin0, WeeklyConsume} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_charge_consume_change{
        weekly_consume = WeeklyConsume
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52908, _BinData) ->

    UnpackRecordData = #cs_charge_consume_roraty{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52909, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, LeaveTimes} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_charge_consume_roraty{
        id = Id,
        leave_times = LeaveTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52910, BinData) ->
    {_RBin0, Flag} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_charge_consume_flag_change{
        flag = Flag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52911, _BinData) ->

    UnpackRecordData = #cs_charge_consume_first_reward{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52912, _BinData) ->

    UnpackRecordData = #cs_charge_consume_roraty_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52913, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_charge_consume_roraty_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52901, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52902, PackRecordData) ->
    ChargeGotList = prot_util:pack(PackRecordData#sc_charge_consume_info.charge_got_list, [{8, unsigned}]),
    WeeklyConsume = prot_util:pack(PackRecordData#sc_charge_consume_info.weekly_consume, {32, unsigned}),
    ConsumeGotList = prot_util:pack(PackRecordData#sc_charge_consume_info.consume_got_list, [{8, unsigned}]),
    Flag = prot_util:pack(PackRecordData#sc_charge_consume_info.flag, {8, unsigned}),
    LeaveTimes = prot_util:pack(PackRecordData#sc_charge_consume_info.leave_times, {8, unsigned}),
    LeaveIds = prot_util:pack(PackRecordData#sc_charge_consume_info.leave_ids, [{8, unsigned}]),
    Index = prot_util:pack(PackRecordData#sc_charge_consume_info.index, {8, unsigned}),

    BinData = <<
        ChargeGotList/binary,
        WeeklyConsume/binary,
        ConsumeGotList/binary,
        Flag/binary,
        LeaveTimes/binary,
        LeaveIds/binary,
        Index/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52903, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_charge_consume_get_charge.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52904, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_charge_consume_get_charge.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52905, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_charge_consume_get_consume.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52906, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_charge_consume_get_consume.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52907, PackRecordData) ->
    WeeklyConsume = prot_util:pack(PackRecordData#sc_charge_consume_change.weekly_consume, {32, unsigned}),

    BinData = <<
        WeeklyConsume/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52908, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52909, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_charge_consume_roraty.id, {8, unsigned}),
    LeaveTimes = prot_util:pack(PackRecordData#sc_charge_consume_roraty.leave_times, {8, unsigned}),

    BinData = <<
        Id/binary,
        LeaveTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52910, PackRecordData) ->
    Flag = prot_util:pack(PackRecordData#sc_charge_consume_flag_change.flag, {8, unsigned}),

    BinData = <<
        Flag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52911, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52912, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52913, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_charge_consume_roraty_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

