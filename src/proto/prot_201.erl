-module(prot_201).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_201.hrl").


%% ---------------------------------------------------------------------------------------

decode(20101, _BinData) ->

    UnpackRecordData = #cs_bag_get_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20102, BinData) ->
    {_RBin0, Bags} = prot_util:unpack(BinData, [{u,bag_info}]),

    UnpackRecordData = #sc_bag_get_info{
        bags = Bags
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20103, BinData) ->
    {_RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_bag_clean{
        bag_id = BagId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20104, BinData) ->
    {_RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_bag_clean{
        bag_id = BagId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20105, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Poses} = prot_util:unpack(RBin0, [{16, unsigned}]),

    UnpackRecordData = #cs_bag_sell_item{
        bag_id = BagId,
        poses = Poses
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20106, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Poses} = prot_util:unpack(RBin0, [{16, unsigned}]),

    UnpackRecordData = #sc_bag_sell_item{
        bag_id = BagId,
        poses = Poses
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20107, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Num} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_bag_extend_cell{
        bag_id = BagId,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20108, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, CellNum} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_bag_extend_cell{
        bag_id = BagId,
        cell_num = CellNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20109, BinData) ->
    {_RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_bag_clear{
        bag_id = BagId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20110, BinData) ->
    {_RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_bag_clear{
        bag_id = BagId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20111, BinData) ->
    {_RBin0, Changes} = prot_util:unpack(BinData, [{u,bag_change}]),

    UnpackRecordData = #sc_bag_change{
        changes = Changes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20113, BinData) ->
    {_RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_bag_extend_bag{
        bag_id = BagId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20114, BinData) ->
    {_RBin0, Bag} = prot_util:unpack(BinData, {u,bag_info}),

    UnpackRecordData = #sc_bag_extend_bag{
        bag = Bag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20115, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #cs_bag_change_name{
        bag_id = BagId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20116, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_bag_change_name{
        bag_id = BagId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20117, BinData) ->
    {RBin0, SrcBag} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, DstBag} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Pos} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #cs_bag_transfer{
        src_bag = SrcBag,
        dst_bag = DstBag,
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20118, BinData) ->
    {RBin0, SrcBag} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, DstBag} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Pos} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_bag_transfer{
        src_bag = SrcBag,
        dst_bag = DstBag,
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20119, BinData) ->
    {_RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_bag_get_bag{
        bag_id = BagId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20120, BinData) ->
    {_RBin0, Bag} = prot_util:unpack(BinData, {u,bag_info}),

    UnpackRecordData = #sc_bag_get_bag{
        bag = Bag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20141, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Num} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Arg} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_use_goods{
        pos = Pos,
        num = Num,
        arg = Arg
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20102, PackRecordData) ->
    Bags = prot_util:pack(PackRecordData#sc_bag_get_info.bags, [{u,bag_info}]),

    BinData = <<
        Bags/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20103, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_bag_clean.bag_id, {8, unsigned}),

    BinData = <<
        BagId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20104, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#sc_bag_clean.bag_id, {8, unsigned}),

    BinData = <<
        BagId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20105, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_bag_sell_item.bag_id, {8, unsigned}),
    Poses = prot_util:pack(PackRecordData#cs_bag_sell_item.poses, [{16, unsigned}]),

    BinData = <<
        BagId/binary,
        Poses/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20106, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#sc_bag_sell_item.bag_id, {8, unsigned}),
    Poses = prot_util:pack(PackRecordData#sc_bag_sell_item.poses, [{16, unsigned}]),

    BinData = <<
        BagId/binary,
        Poses/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20107, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_bag_extend_cell.bag_id, {8, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_bag_extend_cell.num, {16, unsigned}),

    BinData = <<
        BagId/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20108, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#sc_bag_extend_cell.bag_id, {8, unsigned}),
    CellNum = prot_util:pack(PackRecordData#sc_bag_extend_cell.cell_num, {16, unsigned}),

    BinData = <<
        BagId/binary,
        CellNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20109, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_bag_clear.bag_id, {8, unsigned}),

    BinData = <<
        BagId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20110, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#sc_bag_clear.bag_id, {8, unsigned}),

    BinData = <<
        BagId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20111, PackRecordData) ->
    Changes = prot_util:pack(PackRecordData#sc_bag_change.changes, [{u,bag_change}]),

    BinData = <<
        Changes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20113, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_bag_extend_bag.bag_id, {8, unsigned}),

    BinData = <<
        BagId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20114, PackRecordData) ->
    Bag = prot_util:pack(PackRecordData#sc_bag_extend_bag.bag, {u,bag_info}),

    BinData = <<
        Bag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20115, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_bag_change_name.bag_id, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#cs_bag_change_name.name, string),

    BinData = <<
        BagId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20116, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#sc_bag_change_name.bag_id, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_bag_change_name.name, string),

    BinData = <<
        BagId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20117, PackRecordData) ->
    SrcBag = prot_util:pack(PackRecordData#cs_bag_transfer.src_bag, {8, unsigned}),
    DstBag = prot_util:pack(PackRecordData#cs_bag_transfer.dst_bag, {8, unsigned}),
    Pos = prot_util:pack(PackRecordData#cs_bag_transfer.pos, {16, unsigned}),

    BinData = <<
        SrcBag/binary,
        DstBag/binary,
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20118, PackRecordData) ->
    SrcBag = prot_util:pack(PackRecordData#sc_bag_transfer.src_bag, {8, unsigned}),
    DstBag = prot_util:pack(PackRecordData#sc_bag_transfer.dst_bag, {8, unsigned}),
    Pos = prot_util:pack(PackRecordData#sc_bag_transfer.pos, {16, unsigned}),

    BinData = <<
        SrcBag/binary,
        DstBag/binary,
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20119, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_bag_get_bag.bag_id, {8, unsigned}),

    BinData = <<
        BagId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20120, PackRecordData) ->
    Bag = prot_util:pack(PackRecordData#sc_bag_get_bag.bag, {u,bag_info}),

    BinData = <<
        Bag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20141, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_use_goods.pos, {16, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_use_goods.num, {16, unsigned}),
    Arg = prot_util:pack(PackRecordData#cs_use_goods.arg, {8, unsigned}),

    BinData = <<
        Pos/binary,
        Num/binary,
        Arg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

