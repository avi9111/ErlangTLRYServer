-module(prot_405).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_405.hrl").


%% ---------------------------------------------------------------------------------------

decode(40501, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Page} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_rank_get_info{
        type = Type,
        page = Page
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40502, BinData) ->
    {_RBin0, Info} = prot_util:unpack(BinData, {u,clt_rank_info}),

    UnpackRecordData = #sc_rank_get_info{
        info = Info
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40503, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_rank_get_target_rank{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40504, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, TargetRank} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_rank_get_target_rank{
        type = Type,
        target_rank = TargetRank
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40501, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_rank_get_info.type, {16, unsigned}),
    Page = prot_util:pack(PackRecordData#cs_rank_get_info.page, {8, unsigned}),

    BinData = <<
        Type/binary,
        Page/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40502, PackRecordData) ->
    Info = prot_util:pack(PackRecordData#sc_rank_get_info.info, {u,clt_rank_info}),

    BinData = <<
        Info/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40503, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_rank_get_target_rank.type, {16, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40504, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_rank_get_target_rank.type, {16, unsigned}),
    TargetRank = prot_util:pack(PackRecordData#sc_rank_get_target_rank.target_rank, {16, unsigned}),

    BinData = <<
        Type/binary,
        TargetRank/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

