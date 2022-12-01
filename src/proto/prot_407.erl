-module(prot_407).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_407.hrl").


%% ---------------------------------------------------------------------------------------

decode(40701, _BinData) ->

    UnpackRecordData = #cs_fashion_get_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40702, BinData) ->
    {RBin0, Current} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Fashions} = prot_util:unpack(RBin0, [{{16, unsigned}, {16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_fashion_get_info{
        current = Current,
        fashions = Fashions
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40703, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_fashion_activate{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40704, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Colors} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, ExpTime} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #sc_fashion_activate{
        id = Id,
        colors = Colors,
        exp_time = ExpTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40705, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_fashion_wear{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40706, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_fashion_wear{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40707, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_fashion_dyeing{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40708, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Dyeing} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_fashion_dyeing{
        id = Id,
        dyeing = Dyeing
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40709, BinData) ->
    {RBin0, Current} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Expires} = prot_util:unpack(RBin0, [{16, unsigned}]),

    UnpackRecordData = #sc_fashion_expire{
        current = Current,
        expires = Expires
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40710, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_fashion_change{
        role_id = RoleId,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40711, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_hair_switch{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40712, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_hair_switch{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40713, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_hair_change{
        role_id = RoleId,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40701, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40702, PackRecordData) ->
    Current = prot_util:pack(PackRecordData#sc_fashion_get_info.current, {32, unsigned}),
    Fashions = prot_util:pack(PackRecordData#sc_fashion_get_info.fashions, [{{16, unsigned}, {16, unsigned}, {32, unsigned}}]),

    BinData = <<
        Current/binary,
        Fashions/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40703, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_fashion_activate.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40704, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fashion_activate.id, {16, unsigned}),
    Colors = prot_util:pack(PackRecordData#sc_fashion_activate.colors, {16, unsigned}),
    ExpTime = prot_util:pack(PackRecordData#sc_fashion_activate.exp_time, {32, unsigned}),

    BinData = <<
        Id/binary,
        Colors/binary,
        ExpTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40705, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_fashion_wear.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40706, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fashion_wear.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40707, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_fashion_dyeing.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40708, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fashion_dyeing.id, {16, unsigned}),
    Dyeing = prot_util:pack(PackRecordData#sc_fashion_dyeing.dyeing, {16, unsigned}),

    BinData = <<
        Id/binary,
        Dyeing/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40709, PackRecordData) ->
    Current = prot_util:pack(PackRecordData#sc_fashion_expire.current, {32, unsigned}),
    Expires = prot_util:pack(PackRecordData#sc_fashion_expire.expires, [{16, unsigned}]),

    BinData = <<
        Current/binary,
        Expires/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40710, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_fashion_change.role_id, {64, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_fashion_change.id, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40711, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_hair_switch.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40712, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_hair_switch.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40713, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_hair_change.role_id, {64, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_hair_change.id, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

