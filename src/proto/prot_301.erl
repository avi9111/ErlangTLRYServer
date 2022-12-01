-module(prot_301).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_301.hrl").


%% ---------------------------------------------------------------------------------------

decode(30101, _BinData) ->

    UnpackRecordData = #cs_activity_get_flag{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30102, BinData) ->
    {_RBin0, Flags} = prot_util:unpack(BinData, [{{32, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_activity_get_flag{
        flags = Flags
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30103, BinData) ->
    {_RBin0, Flags} = prot_util:unpack(BinData, [{{32, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_activity_add_flag{
        flags = Flags
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30104, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_activity_remove_flag{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(30101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30102, PackRecordData) ->
    Flags = prot_util:pack(PackRecordData#sc_activity_get_flag.flags, [{{32, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Flags/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30103, PackRecordData) ->
    Flags = prot_util:pack(PackRecordData#sc_activity_add_flag.flags, [{{32, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Flags/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30104, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_activity_remove_flag.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

