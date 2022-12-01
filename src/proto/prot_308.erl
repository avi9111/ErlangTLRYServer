-module(prot_308).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_308.hrl").


%% ---------------------------------------------------------------------------------------

decode(30801, _BinData) ->

    UnpackRecordData = #cs_auction_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30802, BinData) ->
    {RBin0, Guild} = prot_util:unpack(BinData, [{{64, unsigned}, {64, unsigned}, {16, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {64, unsigned}, {32, unsigned}}]),
    {_RBin1, World} = prot_util:unpack(RBin0, [{{64, unsigned}, {64, unsigned}, {16, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {64, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_auction_info{
        guild = Guild,
        world = World
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30803, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_auction_logs{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30804, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Logs} = prot_util:unpack(RBin0, [{{32, unsigned}, {16, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_auction_logs{
        type = Type,
        logs = Logs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30805, BinData) ->
    {RBin0, Aid} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Uid} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Type} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_auction_bid{
        aid = Aid,
        uid = Uid,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30806, BinData) ->
    {RBin0, Aid} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Uid} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Type} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_auction_bid{
        aid = Aid,
        uid = Uid,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30807, BinData) ->
    {RBin0, Aid} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Uid} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #cs_auction_item{
        aid = Aid,
        uid = Uid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30808, BinData) ->
    {RBin0, Aid} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Uid} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Price} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Top} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, Bid} = prot_util:unpack(RBin3, {32, unsigned}),
    {_RBin5, State} = prot_util:unpack(RBin4, {8, unsigned}),

    UnpackRecordData = #sc_auction_item{
        aid = Aid,
        uid = Uid,
        price = Price,
        top = Top,
        bid = Bid,
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30809, BinData) ->
    {RBin0, Aid} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Uid} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Top} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, Price} = prot_util:unpack(RBin2, {32, unsigned}),
    {_RBin4, State} = prot_util:unpack(RBin3, {8, unsigned}),

    UnpackRecordData = #sc_auction_item_notify{
        aid = Aid,
        uid = Uid,
        top = Top,
        price = Price,
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30810, _BinData) ->

    UnpackRecordData = #sc_auction_notify_new{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(30801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30802, PackRecordData) ->
    Guild = prot_util:pack(PackRecordData#sc_auction_info.guild, [{{64, unsigned}, {64, unsigned}, {16, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {64, unsigned}, {32, unsigned}}]),
    World = prot_util:pack(PackRecordData#sc_auction_info.world, [{{64, unsigned}, {64, unsigned}, {16, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {64, unsigned}, {32, unsigned}}]),

    BinData = <<
        Guild/binary,
        World/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30803, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_auction_logs.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30804, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_auction_logs.type, {8, unsigned}),
    Logs = prot_util:pack(PackRecordData#sc_auction_logs.logs, [{{32, unsigned}, {16, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Type/binary,
        Logs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30805, PackRecordData) ->
    Aid = prot_util:pack(PackRecordData#cs_auction_bid.aid, {64, unsigned}),
    Uid = prot_util:pack(PackRecordData#cs_auction_bid.uid, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#cs_auction_bid.type, {8, unsigned}),

    BinData = <<
        Aid/binary,
        Uid/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30806, PackRecordData) ->
    Aid = prot_util:pack(PackRecordData#sc_auction_bid.aid, {64, unsigned}),
    Uid = prot_util:pack(PackRecordData#sc_auction_bid.uid, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_auction_bid.type, {8, unsigned}),

    BinData = <<
        Aid/binary,
        Uid/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30807, PackRecordData) ->
    Aid = prot_util:pack(PackRecordData#cs_auction_item.aid, {64, unsigned}),
    Uid = prot_util:pack(PackRecordData#cs_auction_item.uid, {64, unsigned}),

    BinData = <<
        Aid/binary,
        Uid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30808, PackRecordData) ->
    Aid = prot_util:pack(PackRecordData#sc_auction_item.aid, {64, unsigned}),
    Uid = prot_util:pack(PackRecordData#sc_auction_item.uid, {64, unsigned}),
    Price = prot_util:pack(PackRecordData#sc_auction_item.price, {32, unsigned}),
    Top = prot_util:pack(PackRecordData#sc_auction_item.top, {64, unsigned}),
    Bid = prot_util:pack(PackRecordData#sc_auction_item.bid, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_auction_item.state, {8, unsigned}),

    BinData = <<
        Aid/binary,
        Uid/binary,
        Price/binary,
        Top/binary,
        Bid/binary,
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30809, PackRecordData) ->
    Aid = prot_util:pack(PackRecordData#sc_auction_item_notify.aid, {64, unsigned}),
    Uid = prot_util:pack(PackRecordData#sc_auction_item_notify.uid, {64, unsigned}),
    Top = prot_util:pack(PackRecordData#sc_auction_item_notify.top, {64, unsigned}),
    Price = prot_util:pack(PackRecordData#sc_auction_item_notify.price, {32, unsigned}),
    State = prot_util:pack(PackRecordData#sc_auction_item_notify.state, {8, unsigned}),

    BinData = <<
        Aid/binary,
        Uid/binary,
        Top/binary,
        Price/binary,
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30810, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

