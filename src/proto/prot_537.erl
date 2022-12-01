-module(prot_537).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_537.hrl").


%% ---------------------------------------------------------------------------------------

decode(53701, _BinData) ->

    UnpackRecordData = #cs_questionnaire_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53702, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Flag} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_questionnaire_info{
        id = Id,
        flag = Flag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53703, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Star} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Context} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #cs_questionnaire_commit{
        id = Id,
        star = Star,
        context = Context
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53704, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Flag} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_questionnaire_commit{
        id = Id,
        flag = Flag
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53701, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53702, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_questionnaire_info.id, {32, unsigned}),
    Flag = prot_util:pack(PackRecordData#sc_questionnaire_info.flag, {8, unsigned}),

    BinData = <<
        Id/binary,
        Flag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53703, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_questionnaire_commit.id, {32, unsigned}),
    Star = prot_util:pack(PackRecordData#cs_questionnaire_commit.star, {8, unsigned}),
    Context = prot_util:pack(PackRecordData#cs_questionnaire_commit.context, string),

    BinData = <<
        Id/binary,
        Star/binary,
        Context/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53704, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_questionnaire_commit.id, {32, unsigned}),
    Flag = prot_util:pack(PackRecordData#sc_questionnaire_commit.flag, {8, unsigned}),

    BinData = <<
        Id/binary,
        Flag/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

