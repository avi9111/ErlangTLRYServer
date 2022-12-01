-module(prot_206).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_206.hrl").


%% ---------------------------------------------------------------------------------------

decode(20601, _BinData) ->

    UnpackRecordData = #cs_shop_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20602, BinData) ->
    {_RBin0, Items} = prot_util:unpack(BinData, [{{16, unsigned}, {32, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_shop_info{
        items = Items
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20603, BinData) ->
    {RBin0, CateId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, ItemId} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Num} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #cs_shop_buy{
        cate_id = CateId,
        item_id = ItemId,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20604, BinData) ->
    {RBin0, CateId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, ItemId} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Left} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_shop_buy{
        cate_id = CateId,
        item_id = ItemId,
        left = Left
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20602, PackRecordData) ->
    Items = prot_util:pack(PackRecordData#sc_shop_info.items, [{{16, unsigned}, {32, unsigned}, {16, unsigned}}]),

    BinData = <<
        Items/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20603, PackRecordData) ->
    CateId = prot_util:pack(PackRecordData#cs_shop_buy.cate_id, {16, unsigned}),
    ItemId = prot_util:pack(PackRecordData#cs_shop_buy.item_id, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_shop_buy.num, {16, unsigned}),

    BinData = <<
        CateId/binary,
        ItemId/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20604, PackRecordData) ->
    CateId = prot_util:pack(PackRecordData#sc_shop_buy.cate_id, {16, unsigned}),
    ItemId = prot_util:pack(PackRecordData#sc_shop_buy.item_id, {32, unsigned}),
    Left = prot_util:pack(PackRecordData#sc_shop_buy.left, {16, unsigned}),

    BinData = <<
        CateId/binary,
        ItemId/binary,
        Left/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

