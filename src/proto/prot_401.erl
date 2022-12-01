-module(prot_401).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_401.hrl").


%% ---------------------------------------------------------------------------------------

decode(40101, BinData) ->
    {RBin0, Temp} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Args} = prot_util:unpack(RBin0, [string]),

    UnpackRecordData = #sc_rumor_new{
        temp = Temp,
        args = Args
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40101, PackRecordData) ->
    Temp = prot_util:pack(PackRecordData#sc_rumor_new.temp, {32, unsigned}),
    Args = prot_util:pack(PackRecordData#sc_rumor_new.args, [string]),

    BinData = <<
        Temp/binary,
        Args/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

