-module(prot_533).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_533.hrl").


%% ---------------------------------------------------------------------------------------

decode(53301, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #roll_dice_req{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53302, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Val} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #roll_dice_resp{
        id = Id,
        val = Val
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53303, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, ExpireTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #notify_new_dice{
        id = Id,
        expire_time = ExpireTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53304, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Self} = prot_util:unpack(RBin0, {u,clt_dice_val}),
    {_RBin2, Best} = prot_util:unpack(RBin1, {u,clt_dice_val}),

    UnpackRecordData = #notify_role_dice{
        id = Id,
        self = Self,
        best = Best
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53301, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#roll_dice_req.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53302, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#roll_dice_resp.id, {32, unsigned}),
    Val = prot_util:pack(PackRecordData#roll_dice_resp.val, {8, unsigned}),

    BinData = <<
        Id/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53303, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#notify_new_dice.id, {32, unsigned}),
    ExpireTime = prot_util:pack(PackRecordData#notify_new_dice.expire_time, {32, unsigned}),

    BinData = <<
        Id/binary,
        ExpireTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53304, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#notify_role_dice.id, {32, unsigned}),
    Self = prot_util:pack(PackRecordData#notify_role_dice.self, {u,clt_dice_val}),
    Best = prot_util:pack(PackRecordData#notify_role_dice.best, {u,clt_dice_val}),

    BinData = <<
        Id/binary,
        Self/binary,
        Best/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

