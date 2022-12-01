-module(prot_207).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_207.hrl").


%% ---------------------------------------------------------------------------------------

decode(20701, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Poses} = prot_util:unpack(RBin0, [{16, unsigned}]),
    {_RBin2, Type} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_refine_compose{
        bag_id = BagId,
        poses = Poses,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20702, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_refine_compose{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20703, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Opt} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_refine_forge{
        id = Id,
        type = Type,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20704, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Item} = prot_util:unpack(RBin1, {u,goods_info}),

    UnpackRecordData = #sc_refine_forge{
        id = Id,
        type = Type,
        item = Item
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20711, _BinData) ->

    UnpackRecordData = #cs_refine_forge_wheel{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20712, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_refine_forge_wheel{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20701, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#cs_refine_compose.bag_id, {8, unsigned}),
    Poses = prot_util:pack(PackRecordData#cs_refine_compose.poses, [{16, unsigned}]),
    Type = prot_util:pack(PackRecordData#cs_refine_compose.type, {8, unsigned}),

    BinData = <<
        BagId/binary,
        Poses/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20702, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_refine_compose.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20703, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_refine_forge.id, {16, unsigned}),
    Type = prot_util:pack(PackRecordData#cs_refine_forge.type, {8, unsigned}),
    Opt = prot_util:pack(PackRecordData#cs_refine_forge.opt, {8, unsigned}),

    BinData = <<
        Id/binary,
        Type/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20704, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_refine_forge.id, {16, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_refine_forge.type, {8, unsigned}),
    Item = prot_util:pack(PackRecordData#sc_refine_forge.item, {u,goods_info}),

    BinData = <<
        Id/binary,
        Type/binary,
        Item/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20711, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20712, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_refine_forge_wheel.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

