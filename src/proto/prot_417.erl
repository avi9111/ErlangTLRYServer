-module(prot_417).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_417.hrl").


%% ---------------------------------------------------------------------------------------

decode(41701, _BinData) ->

    UnpackRecordData = #cs_surface_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41702, BinData) ->
    {_RBin0, Surfaces} = prot_util:unpack(BinData, [{u,clt_surface}]),

    UnpackRecordData = #sc_surface_info{
        surfaces = Surfaces
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41703, BinData) ->
    {_RBin0, Surfaces} = prot_util:unpack(BinData, [{u,clt_surface}]),

    UnpackRecordData = #sc_surface_change{
        surfaces = Surfaces
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(41701, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41702, PackRecordData) ->
    Surfaces = prot_util:pack(PackRecordData#sc_surface_info.surfaces, [{u,clt_surface}]),

    BinData = <<
        Surfaces/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41703, PackRecordData) ->
    Surfaces = prot_util:pack(PackRecordData#sc_surface_change.surfaces, [{u,clt_surface}]),

    BinData = <<
        Surfaces/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

