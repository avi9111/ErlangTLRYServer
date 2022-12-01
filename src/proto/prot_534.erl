-module(prot_534).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_534.hrl").


%% ---------------------------------------------------------------------------------------

decode(53401, _BinData) ->

    UnpackRecordData = #cs_guild_wages_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53402, BinData) ->
    {_RBin0, Stages} = prot_util:unpack(BinData, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_wages_info{
        stages = Stages
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53402, PackRecordData) ->
    Stages = prot_util:pack(PackRecordData#sc_guild_wages_info.stages, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Stages/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

