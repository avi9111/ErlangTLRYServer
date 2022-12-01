-module(prot_425).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_425.hrl").


%% ---------------------------------------------------------------------------------------

decode(42501, _BinData) ->

    UnpackRecordData = #cs_market_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42502, BinData) ->
    {RBin0, Volume} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Turnover} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, UseGold} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Items} = prot_util:unpack(RBin2, [{u,clt_market_goods}]),
    {_RBin4, Follow} = prot_util:unpack(RBin3, [{u,clt_market_goods}]),

    UnpackRecordData = #sc_market_info{
        volume = Volume,
        turnover = Turnover,
        use_gold = UseGold,
        items = Items,
        follow = Follow
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42503, _BinData) ->

    UnpackRecordData = #cs_market_log{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42504, BinData) ->
    {_RBin0, Logs} = prot_util:unpack(BinData, [{{8, unsigned}, string, {16, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_market_log{
        logs = Logs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42505, BinData) ->
    {RBin0, Tag} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Stat} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_market_search{
        tag = Tag,
        id = Id,
        stat = Stat
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42506, BinData) ->
    {RBin0, Tag} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Stat} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, Items} = prot_util:unpack(RBin2, [{u,clt_market_goods}]),

    UnpackRecordData = #sc_market_search{
        tag = Tag,
        id = Id,
        stat = Stat,
        items = Items
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42507, BinData) ->
    {_RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_market_rare_item{
        uid = Uid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42508, BinData) ->
    {RBin0, Item} = prot_util:unpack(BinData, {u,clt_market_goods}),
    {_RBin1, Goods} = prot_util:unpack(RBin0, {u,goods_info}),

    UnpackRecordData = #sc_market_rare_item{
        item = Item,
        goods = Goods
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42509, BinData) ->
    {_RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_market_rare_pet{
        uid = Uid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42510, BinData) ->
    {RBin0, Item} = prot_util:unpack(BinData, {u,clt_market_goods}),
    {_RBin1, Pet} = prot_util:unpack(RBin0, {u,clt_pet}),

    UnpackRecordData = #sc_market_rare_pet{
        item = Item,
        pet = Pet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42511, BinData) ->
    {RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Opt} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_market_follow{
        uid = Uid,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42512, BinData) ->
    {RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Opt} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_market_follow{
        uid = Uid,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42513, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Pos} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Price} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, Num} = prot_util:unpack(RBin2, {16, unsigned}),

    UnpackRecordData = #cs_market_put_on{
        type = Type,
        pos = Pos,
        price = Price,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42514, BinData) ->
    {_RBin0, Items} = prot_util:unpack(BinData, [{u,clt_market_goods}]),

    UnpackRecordData = #sc_market_put_on{
        items = Items
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42515, BinData) ->
    {_RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_market_take_off{
        uid = Uid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42516, BinData) ->
    {_RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_market_take_off{
        uid = Uid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42517, BinData) ->
    {_RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_market_resale{
        uid = Uid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42518, BinData) ->
    {_RBin0, Items} = prot_util:unpack(BinData, [{u,clt_market_goods}]),

    UnpackRecordData = #sc_market_resale{
        items = Items
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42519, BinData) ->
    {RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Id} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Price} = prot_util:unpack(RBin2, {32, unsigned}),
    {_RBin4, Num} = prot_util:unpack(RBin3, {16, unsigned}),

    UnpackRecordData = #cs_market_buy{
        uid = Uid,
        type = Type,
        id = Id,
        price = Price,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42520, _BinData) ->

    UnpackRecordData = #sc_market_buy{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42521, BinData) ->
    {_RBin0, Item} = prot_util:unpack(BinData, {u,clt_market_goods}),

    UnpackRecordData = #sc_market_refresh_item{
        item = Item
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42501, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42502, PackRecordData) ->
    Volume = prot_util:pack(PackRecordData#sc_market_info.volume, {32, unsigned}),
    Turnover = prot_util:pack(PackRecordData#sc_market_info.turnover, {32, unsigned}),
    UseGold = prot_util:pack(PackRecordData#sc_market_info.use_gold, {32, unsigned}),
    Items = prot_util:pack(PackRecordData#sc_market_info.items, [{u,clt_market_goods}]),
    Follow = prot_util:pack(PackRecordData#sc_market_info.follow, [{u,clt_market_goods}]),

    BinData = <<
        Volume/binary,
        Turnover/binary,
        UseGold/binary,
        Items/binary,
        Follow/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42503, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42504, PackRecordData) ->
    Logs = prot_util:pack(PackRecordData#sc_market_log.logs, [{{8, unsigned}, string, {16, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    BinData = <<
        Logs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42505, PackRecordData) ->
    Tag = prot_util:pack(PackRecordData#cs_market_search.tag, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_market_search.id, {32, unsigned}),
    Stat = prot_util:pack(PackRecordData#cs_market_search.stat, {8, unsigned}),

    BinData = <<
        Tag/binary,
        Id/binary,
        Stat/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42506, PackRecordData) ->
    Tag = prot_util:pack(PackRecordData#sc_market_search.tag, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_market_search.id, {32, unsigned}),
    Stat = prot_util:pack(PackRecordData#sc_market_search.stat, {8, unsigned}),
    Items = prot_util:pack(PackRecordData#sc_market_search.items, [{u,clt_market_goods}]),

    BinData = <<
        Tag/binary,
        Id/binary,
        Stat/binary,
        Items/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42507, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#cs_market_rare_item.uid, {64, unsigned}),

    BinData = <<
        Uid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42508, PackRecordData) ->
    Item = prot_util:pack(PackRecordData#sc_market_rare_item.item, {u,clt_market_goods}),
    Goods = prot_util:pack(PackRecordData#sc_market_rare_item.goods, {u,goods_info}),

    BinData = <<
        Item/binary,
        Goods/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42509, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#cs_market_rare_pet.uid, {64, unsigned}),

    BinData = <<
        Uid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42510, PackRecordData) ->
    Item = prot_util:pack(PackRecordData#sc_market_rare_pet.item, {u,clt_market_goods}),
    Pet = prot_util:pack(PackRecordData#sc_market_rare_pet.pet, {u,clt_pet}),

    BinData = <<
        Item/binary,
        Pet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42511, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#cs_market_follow.uid, {64, unsigned}),
    Opt = prot_util:pack(PackRecordData#cs_market_follow.opt, {8, unsigned}),

    BinData = <<
        Uid/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42512, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#sc_market_follow.uid, {64, unsigned}),
    Opt = prot_util:pack(PackRecordData#sc_market_follow.opt, {8, unsigned}),

    BinData = <<
        Uid/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42513, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_market_put_on.type, {8, unsigned}),
    Pos = prot_util:pack(PackRecordData#cs_market_put_on.pos, {64, unsigned}),
    Price = prot_util:pack(PackRecordData#cs_market_put_on.price, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_market_put_on.num, {16, unsigned}),

    BinData = <<
        Type/binary,
        Pos/binary,
        Price/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42514, PackRecordData) ->
    Items = prot_util:pack(PackRecordData#sc_market_put_on.items, [{u,clt_market_goods}]),

    BinData = <<
        Items/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42515, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#cs_market_take_off.uid, {64, unsigned}),

    BinData = <<
        Uid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42516, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#sc_market_take_off.uid, {64, unsigned}),

    BinData = <<
        Uid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42517, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#cs_market_resale.uid, {64, unsigned}),

    BinData = <<
        Uid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42518, PackRecordData) ->
    Items = prot_util:pack(PackRecordData#sc_market_resale.items, [{u,clt_market_goods}]),

    BinData = <<
        Items/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42519, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#cs_market_buy.uid, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#cs_market_buy.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_market_buy.id, {32, unsigned}),
    Price = prot_util:pack(PackRecordData#cs_market_buy.price, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_market_buy.num, {16, unsigned}),

    BinData = <<
        Uid/binary,
        Type/binary,
        Id/binary,
        Price/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42520, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42521, PackRecordData) ->
    Item = prot_util:pack(PackRecordData#sc_market_refresh_item.item, {u,clt_market_goods}),

    BinData = <<
        Item/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

