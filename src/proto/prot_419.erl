-module(prot_419).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_419.hrl").


%% ---------------------------------------------------------------------------------------

decode(41901, _BinData) ->

    UnpackRecordData = #cs_channel_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41902, BinData) ->
    {_RBin0, Channels} = prot_util:unpack(BinData, [{u,clt_channel}]),

    UnpackRecordData = #sc_channel_info{
        channels = Channels
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41903, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Hero} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_channel_active{
        id = Id,
        hero = Hero
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41904, BinData) ->
    {_RBin0, Channels} = prot_util:unpack(BinData, [{u,clt_channel}]),

    UnpackRecordData = #sc_channel_active{
        channels = Channels
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41905, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_channel_cult{
        id = Id,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41906, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Val} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_channel_cult{
        id = Id,
        type = Type,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41907, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Attr} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #cs_channel_change{
        id = Id,
        type = Type,
        attr = Attr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41908, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Attr} = prot_util:unpack(RBin1, {16, unsigned}),
    {_RBin3, Val} = prot_util:unpack(RBin2, {16, unsigned}),

    UnpackRecordData = #sc_channel_change{
        id = Id,
        type = Type,
        attr = Attr,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41909, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Pos} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_channel_wear{
        id = Id,
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41910, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Equips} = prot_util:unpack(RBin0, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_channel_wear{
        id = Id,
        equips = Equips
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41911, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Pos} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_channel_take_off{
        id = Id,
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41912, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Equips} = prot_util:unpack(RBin0, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_channel_take_off{
        id = Id,
        equips = Equips
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(41901, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41902, PackRecordData) ->
    Channels = prot_util:pack(PackRecordData#sc_channel_info.channels, [{u,clt_channel}]),

    BinData = <<
        Channels/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41903, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_channel_active.id, {8, unsigned}),
    Hero = prot_util:pack(PackRecordData#cs_channel_active.hero, {8, unsigned}),

    BinData = <<
        Id/binary,
        Hero/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41904, PackRecordData) ->
    Channels = prot_util:pack(PackRecordData#sc_channel_active.channels, [{u,clt_channel}]),

    BinData = <<
        Channels/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41905, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_channel_cult.id, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#cs_channel_cult.type, {8, unsigned}),

    BinData = <<
        Id/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41906, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_channel_cult.id, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_channel_cult.type, {8, unsigned}),
    Val = prot_util:pack(PackRecordData#sc_channel_cult.val, {16, unsigned}),

    BinData = <<
        Id/binary,
        Type/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41907, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_channel_change.id, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#cs_channel_change.type, {8, unsigned}),
    Attr = prot_util:pack(PackRecordData#cs_channel_change.attr, {16, unsigned}),

    BinData = <<
        Id/binary,
        Type/binary,
        Attr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41908, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_channel_change.id, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_channel_change.type, {8, unsigned}),
    Attr = prot_util:pack(PackRecordData#sc_channel_change.attr, {16, unsigned}),
    Val = prot_util:pack(PackRecordData#sc_channel_change.val, {16, unsigned}),

    BinData = <<
        Id/binary,
        Type/binary,
        Attr/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41909, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_channel_wear.id, {8, unsigned}),
    Pos = prot_util:pack(PackRecordData#cs_channel_wear.pos, {16, unsigned}),

    BinData = <<
        Id/binary,
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41910, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_channel_wear.id, {8, unsigned}),
    Equips = prot_util:pack(PackRecordData#sc_channel_wear.equips, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        Id/binary,
        Equips/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41911, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_channel_take_off.id, {8, unsigned}),
    Pos = prot_util:pack(PackRecordData#cs_channel_take_off.pos, {16, unsigned}),

    BinData = <<
        Id/binary,
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41912, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_channel_take_off.id, {8, unsigned}),
    Equips = prot_util:pack(PackRecordData#sc_channel_take_off.equips, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        Id/binary,
        Equips/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

