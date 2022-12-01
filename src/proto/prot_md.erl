-module(prot_md).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_md.hrl").


%% ---------------------------------------------------------------------------------------

decode(test_map, BinData) ->
    {RBin0, Key} = prot_util:unpack(BinData, string),
    {RBin1, Value} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackMapData = #{
        key => Key,
        value => Value
    },

    {RBin1, UnpackMapData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(test_map, PackRecordData) ->
    Key = prot_util:pack(maps:get(key, PackRecordData), string),
    Value = prot_util:pack(maps:get(value, PackRecordData), {16, unsigned}),

    BinData = <<
        Key/binary,
        Value/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

