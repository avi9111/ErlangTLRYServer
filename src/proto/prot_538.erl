-module(prot_538).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_538.hrl").


%% ---------------------------------------------------------------------------------------

decode(53801, _BinData) ->

    UnpackRecordData = #cs_dividend_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53802, BinData) ->
    {RBin0, LvGotList} = prot_util:unpack(BinData, [{{8, unsigned}, {16, unsigned}}]),
    {RBin1, LvRoleGotList} = prot_util:unpack(RBin0, [{8, unsigned}]),
    {RBin2, StoneGotList} = prot_util:unpack(RBin1, [{{16, unsigned}, {8, unsigned}, {8, unsigned}}]),
    {RBin3, LotteryLively} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, LivelyGotList} = prot_util:unpack(RBin3, [{8, unsigned}]),
    {RBin5, LotteryCharge} = prot_util:unpack(RBin4, {32, unsigned}),
    {_RBin6, ChargeGotList} = prot_util:unpack(RBin5, [{8, unsigned}]),

    UnpackRecordData = #sc_dividend_info{
        lv_got_list = LvGotList,
        lv_role_got_list = LvRoleGotList,
        stone_got_list = StoneGotList,
        lottery_lively = LotteryLively,
        lively_got_list = LivelyGotList,
        lottery_charge = LotteryCharge,
        charge_got_list = ChargeGotList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53803, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_dividend_lv_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53804, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, LvGotList} = prot_util:unpack(RBin0, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_dividend_lv_get{
        id = Id,
        lv_got_list = LvGotList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53805, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_dividend_stone_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53806, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Flag} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_dividend_stone_get{
        id = Id,
        flag = Flag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53807, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Stage} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Flag} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_dividend_flag_change{
        id = Id,
        stage = Stage,
        flag = Flag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53808, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_dividend_lucky_get{
        type = Type,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53809, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_dividend_lucky_get{
        type = Type,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53810, BinData) ->
    {_RBin0, LotteryLively} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_dividend_lively_change{
        lottery_lively = LotteryLively
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53811, BinData) ->
    {_RBin0, LotteryCharge} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_dividend_charge_change{
        lottery_charge = LotteryCharge
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53802, PackRecordData) ->
    LvGotList = prot_util:pack(PackRecordData#sc_dividend_info.lv_got_list, [{{8, unsigned}, {16, unsigned}}]),
    LvRoleGotList = prot_util:pack(PackRecordData#sc_dividend_info.lv_role_got_list, [{8, unsigned}]),
    StoneGotList = prot_util:pack(PackRecordData#sc_dividend_info.stone_got_list, [{{16, unsigned}, {8, unsigned}, {8, unsigned}}]),
    LotteryLively = prot_util:pack(PackRecordData#sc_dividend_info.lottery_lively, {32, unsigned}),
    LivelyGotList = prot_util:pack(PackRecordData#sc_dividend_info.lively_got_list, [{8, unsigned}]),
    LotteryCharge = prot_util:pack(PackRecordData#sc_dividend_info.lottery_charge, {32, unsigned}),
    ChargeGotList = prot_util:pack(PackRecordData#sc_dividend_info.charge_got_list, [{8, unsigned}]),

    BinData = <<
        LvGotList/binary,
        LvRoleGotList/binary,
        StoneGotList/binary,
        LotteryLively/binary,
        LivelyGotList/binary,
        LotteryCharge/binary,
        ChargeGotList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53803, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_dividend_lv_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53804, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_dividend_lv_get.id, {8, unsigned}),
    LvGotList = prot_util:pack(PackRecordData#sc_dividend_lv_get.lv_got_list, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        Id/binary,
        LvGotList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53805, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_dividend_stone_get.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53806, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_dividend_stone_get.id, {16, unsigned}),
    Flag = prot_util:pack(PackRecordData#sc_dividend_stone_get.flag, {8, unsigned}),

    BinData = <<
        Id/binary,
        Flag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53807, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_dividend_flag_change.id, {16, unsigned}),
    Stage = prot_util:pack(PackRecordData#sc_dividend_flag_change.stage, {8, unsigned}),
    Flag = prot_util:pack(PackRecordData#sc_dividend_flag_change.flag, {8, unsigned}),

    BinData = <<
        Id/binary,
        Stage/binary,
        Flag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53808, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_dividend_lucky_get.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_dividend_lucky_get.id, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53809, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_dividend_lucky_get.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_dividend_lucky_get.id, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53810, PackRecordData) ->
    LotteryLively = prot_util:pack(PackRecordData#sc_dividend_lively_change.lottery_lively, {32, unsigned}),

    BinData = <<
        LotteryLively/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53811, PackRecordData) ->
    LotteryCharge = prot_util:pack(PackRecordData#sc_dividend_charge_change.lottery_charge, {32, unsigned}),

    BinData = <<
        LotteryCharge/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

