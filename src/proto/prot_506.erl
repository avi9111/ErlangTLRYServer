-module(prot_506).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_506.hrl").


%% ---------------------------------------------------------------------------------------

decode(50601, _BinData) ->

    UnpackRecordData = #cs_card_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50602, BinData) ->
    {_RBin0, Info} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_card_info{
        info = Info
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50603, BinData) ->
    {_RBin0, Info} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_card_change{
        info = Info
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50604, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_card_reward{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50605, BinData) ->
    {RBin0, Num} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_buy_spec_item{
        num = Num,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(50601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50602, PackRecordData) ->
    Info = prot_util:pack(PackRecordData#sc_card_info.info, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Info/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50603, PackRecordData) ->
    Info = prot_util:pack(PackRecordData#sc_card_change.info, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Info/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50604, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_card_reward.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50605, PackRecordData) ->
    Num = prot_util:pack(PackRecordData#cs_buy_spec_item.num, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#cs_buy_spec_item.type, {8, unsigned}),

    BinData = <<
        Num/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

