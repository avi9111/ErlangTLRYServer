-module(prot_204).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_204.hrl").


%% ---------------------------------------------------------------------------------------

decode(20401, _BinData) ->

    UnpackRecordData = #cs_assets_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20402, BinData) ->
    {_RBin0, Moneys} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_assets_info{
        moneys = Moneys
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20403, BinData) ->
    {_RBin0, Changes} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_assets_change{
        changes = Changes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20405, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #cs_assets_exchange{
        id = Id,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20406, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_assets_exchange{
        id = Id,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20402, PackRecordData) ->
    Moneys = prot_util:pack(PackRecordData#sc_assets_info.moneys, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        Moneys/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20403, PackRecordData) ->
    Changes = prot_util:pack(PackRecordData#sc_assets_change.changes, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        Changes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20405, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_assets_exchange.id, {8, unsigned}),
    Val = prot_util:pack(PackRecordData#cs_assets_exchange.val, {32, unsigned}),

    BinData = <<
        Id/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20406, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_assets_exchange.id, {8, unsigned}),
    Val = prot_util:pack(PackRecordData#sc_assets_exchange.val, {32, unsigned}),

    BinData = <<
        Id/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

