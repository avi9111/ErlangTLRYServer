-module(prot_110).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_110.hrl").


%% ---------------------------------------------------------------------------------------

decode(11001, _BinData) ->

    UnpackRecordData = #cs_setting_get_all{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11002, BinData) ->
    {RBin0, Ints} = prot_util:unpack(BinData, [{{16, unsigned}, {64, unsigned}}]),
    {_RBin1, Strings} = prot_util:unpack(RBin0, [{{16, unsigned}, string}]),

    UnpackRecordData = #sc_setting_get_all{
        ints = Ints,
        strings = Strings
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11003, BinData) ->
    {_RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_setting_get{
        key = Key
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11005, BinData) ->
    {_RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_setting_get_int{
        key = Key
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11006, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_setting_get_int{
        key = Key,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11007, BinData) ->
    {_RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_setting_get_string{
        key = Key
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11008, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_setting_get_string{
        key = Key,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11009, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #cs_setting_set_int{
        key = Key,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11010, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_setting_set_int{
        key = Key,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11011, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #cs_setting_set_string{
        key = Key,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(11012, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_setting_set_string{
        key = Key,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(11001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11002, PackRecordData) ->
    Ints = prot_util:pack(PackRecordData#sc_setting_get_all.ints, [{{16, unsigned}, {64, unsigned}}]),
    Strings = prot_util:pack(PackRecordData#sc_setting_get_all.strings, [{{16, unsigned}, string}]),

    BinData = <<
        Ints/binary,
        Strings/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11003, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#cs_setting_get.key, {16, unsigned}),

    BinData = <<
        Key/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11005, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#cs_setting_get_int.key, {16, unsigned}),

    BinData = <<
        Key/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11006, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#sc_setting_get_int.key, {16, unsigned}),
    Val = prot_util:pack(PackRecordData#sc_setting_get_int.val, {64, unsigned}),

    BinData = <<
        Key/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11007, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#cs_setting_get_string.key, {16, unsigned}),

    BinData = <<
        Key/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11008, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#sc_setting_get_string.key, {16, unsigned}),
    Val = prot_util:pack(PackRecordData#sc_setting_get_string.val, string),

    BinData = <<
        Key/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11009, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#cs_setting_set_int.key, {16, unsigned}),
    Val = prot_util:pack(PackRecordData#cs_setting_set_int.val, {64, unsigned}),

    BinData = <<
        Key/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11010, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#sc_setting_set_int.key, {16, unsigned}),
    Val = prot_util:pack(PackRecordData#sc_setting_set_int.val, {64, unsigned}),

    BinData = <<
        Key/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11011, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#cs_setting_set_string.key, {16, unsigned}),
    Val = prot_util:pack(PackRecordData#cs_setting_set_string.val, string),

    BinData = <<
        Key/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(11012, PackRecordData) ->
    Key = prot_util:pack(PackRecordData#sc_setting_set_string.key, {16, unsigned}),
    Val = prot_util:pack(PackRecordData#sc_setting_set_string.val, string),

    BinData = <<
        Key/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

