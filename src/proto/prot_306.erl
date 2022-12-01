-module(prot_306).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_306.hrl").


%% ---------------------------------------------------------------------------------------

decode(30601, _BinData) ->

    UnpackRecordData = #cs_welfare_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30602, BinData) ->
    {_RBin0, States} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_welfare_info{
        states = States
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30603, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_welfare_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30604, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_welfare_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(30601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30602, PackRecordData) ->
    States = prot_util:pack(PackRecordData#sc_welfare_info.states, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        States/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30603, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_welfare_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30604, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_welfare_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

