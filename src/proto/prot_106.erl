-module(prot_106).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_106.hrl").


%% ---------------------------------------------------------------------------------------

decode(10601, BinData) ->
    {_RBin0, Content} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_cheat_use{
        content = Content
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(10601, PackRecordData) ->
    Content = prot_util:pack(PackRecordData#cs_cheat_use.content, string),

    BinData = <<
        Content/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

