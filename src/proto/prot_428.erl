-module(prot_428).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_428.hrl").


%% ---------------------------------------------------------------------------------------

decode(42801, _BinData) ->

    UnpackRecordData = #cs_trans_tran{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42802, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, TranStat} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_trans_tran{
        role_id = RoleId,
        tran_stat = TranStat
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42802, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_trans_tran.role_id, {64, unsigned}),
    TranStat = prot_util:pack(PackRecordData#sc_trans_tran.tran_stat, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        TranStat/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

