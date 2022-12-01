-module(prot_530).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_530.hrl").


%% ---------------------------------------------------------------------------------------

decode(53001, _BinData) ->

    UnpackRecordData = #cs_title_honor_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53002, BinData) ->
    {_RBin0, TitleHonor} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_title_honor_up{
        title_honor = TitleHonor
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53002, PackRecordData) ->
    TitleHonor = prot_util:pack(PackRecordData#sc_title_honor_up.title_honor, {32, unsigned}),

    BinData = <<
        TitleHonor/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

