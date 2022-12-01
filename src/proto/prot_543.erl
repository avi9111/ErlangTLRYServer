-module(prot_543).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_543.hrl").


%% ---------------------------------------------------------------------------------------

decode(54301, _BinData) ->

    UnpackRecordData = #cs_firework_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54302, BinData) ->
    {RBin0, Hero} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Charm} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_firework_info{
        hero = Hero,
        charm = Charm
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54303, BinData) ->
    {RBin0, ItemId} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, TargetId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #cs_firework_use{
        item_id = ItemId,
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54304, BinData) ->
    {_RBin0, ItemId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_firework_notify{
        item_id = ItemId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54305, BinData) ->
    {RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Res} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_firework_use{
        target_id = TargetId,
        res = Res
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(54301, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54302, PackRecordData) ->
    Hero = prot_util:pack(PackRecordData#sc_firework_info.hero, {32, unsigned}),
    Charm = prot_util:pack(PackRecordData#sc_firework_info.charm, {32, unsigned}),

    BinData = <<
        Hero/binary,
        Charm/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54303, PackRecordData) ->
    ItemId = prot_util:pack(PackRecordData#cs_firework_use.item_id, {32, unsigned}),
    TargetId = prot_util:pack(PackRecordData#cs_firework_use.target_id, {64, unsigned}),

    BinData = <<
        ItemId/binary,
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54304, PackRecordData) ->
    ItemId = prot_util:pack(PackRecordData#sc_firework_notify.item_id, {32, unsigned}),

    BinData = <<
        ItemId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54305, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#sc_firework_use.target_id, {64, unsigned}),
    Res = prot_util:pack(PackRecordData#sc_firework_use.res, {32, unsigned}),

    BinData = <<
        TargetId/binary,
        Res/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

