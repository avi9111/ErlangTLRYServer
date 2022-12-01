-module(prot_527).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_527.hrl").


%% ---------------------------------------------------------------------------------------

decode(52701, _BinData) ->

    UnpackRecordData = #cs_personal_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52702, BinData) ->
    {_RBin0, Msg} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_personal_info{
        msg = Msg
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52703, BinData) ->
    {_RBin0, Msg} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_personal_info_change{
        msg = Msg
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52704, BinData) ->
    {_RBin0, Msg} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_personal_info_change{
        msg = Msg
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52701, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52702, PackRecordData) ->
    Msg = prot_util:pack(PackRecordData#sc_personal_info.msg, string),

    BinData = <<
        Msg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52703, PackRecordData) ->
    Msg = prot_util:pack(PackRecordData#cs_personal_info_change.msg, string),

    BinData = <<
        Msg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52704, PackRecordData) ->
    Msg = prot_util:pack(PackRecordData#sc_personal_info_change.msg, string),

    BinData = <<
        Msg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

