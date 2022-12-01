-module(prot_109).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_109.hrl").


%% ---------------------------------------------------------------------------------------

decode(10900, _BinData) ->

    UnpackRecordData = #get_vip_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10901, BinData) ->
    {RBin0, VipLevel} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, VipExp} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, GotGifts} = prot_util:unpack(RBin1, [{8, unsigned}]),

    UnpackRecordData = #get_vip_info_resp{
        vip_level = VipLevel,
        vip_exp = VipExp,
        got_gifts = GotGifts
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10902, BinData) ->
    {_RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #get_vip_gift_req{
        level = Level
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10903, BinData) ->
    {RBin0, Ret} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Level} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #get_vip_gift_resp{
        ret = Ret,
        level = Level
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10940, _BinData) ->

    UnpackRecordData = #get_recharge_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10941, BinData) ->
    {RBin0, TodayRecharge} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, TodayRechargeMoney} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, RechargedAn} = prot_util:unpack(RBin1, [{8, unsigned}]),
    {_RBin3, RechargedIos} = prot_util:unpack(RBin2, [{8, unsigned}]),

    UnpackRecordData = #get_recharge_info_resp{
        today_recharge = TodayRecharge,
        today_recharge_money = TodayRechargeMoney,
        recharged_an = RechargedAn,
        recharged_ios = RechargedIos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(10900, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10901, PackRecordData) ->
    VipLevel = prot_util:pack(PackRecordData#get_vip_info_resp.vip_level, {8, unsigned}),
    VipExp = prot_util:pack(PackRecordData#get_vip_info_resp.vip_exp, {32, unsigned}),
    GotGifts = prot_util:pack(PackRecordData#get_vip_info_resp.got_gifts, [{8, unsigned}]),

    BinData = <<
        VipLevel/binary,
        VipExp/binary,
        GotGifts/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10902, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#get_vip_gift_req.level, {8, unsigned}),

    BinData = <<
        Level/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10903, PackRecordData) ->
    Ret = prot_util:pack(PackRecordData#get_vip_gift_resp.ret, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#get_vip_gift_resp.level, {8, unsigned}),

    BinData = <<
        Ret/binary,
        Level/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10940, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10941, PackRecordData) ->
    TodayRecharge = prot_util:pack(PackRecordData#get_recharge_info_resp.today_recharge, {32, unsigned}),
    TodayRechargeMoney = prot_util:pack(PackRecordData#get_recharge_info_resp.today_recharge_money, {32, unsigned}),
    RechargedAn = prot_util:pack(PackRecordData#get_recharge_info_resp.recharged_an, [{8, unsigned}]),
    RechargedIos = prot_util:pack(PackRecordData#get_recharge_info_resp.recharged_ios, [{8, unsigned}]),

    BinData = <<
        TodayRecharge/binary,
        TodayRechargeMoney/binary,
        RechargedAn/binary,
        RechargedIos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

