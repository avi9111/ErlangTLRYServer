-module(prot_305).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_305.hrl").


%% ---------------------------------------------------------------------------------------

decode(30501, _BinData) ->

    UnpackRecordData = #cs_level_gift_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30502, BinData) ->
    {_RBin0, States} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_level_gift_info{
        states = States
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30503, BinData) ->
    {_RBin0, Lv} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_level_gift_get{
        lv = Lv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30504, BinData) ->
    {_RBin0, Lv} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_level_gift_get{
        lv = Lv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(30501, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30502, PackRecordData) ->
    States = prot_util:pack(PackRecordData#sc_level_gift_info.states, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        States/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30503, PackRecordData) ->
    Lv = prot_util:pack(PackRecordData#cs_level_gift_get.lv, {8, unsigned}),

    BinData = <<
        Lv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30504, PackRecordData) ->
    Lv = prot_util:pack(PackRecordData#sc_level_gift_get.lv, {8, unsigned}),

    BinData = <<
        Lv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

