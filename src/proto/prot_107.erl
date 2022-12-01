-module(prot_107).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_107.hrl").


%% ---------------------------------------------------------------------------------------

decode(10701, BinData) ->
    {_RBin0, RewardId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #get_kill_mon_reward_req{
        reward_id = RewardId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10702, BinData) ->
    {_RBin0, Ret} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #get_kill_mon_reward_resp{
        ret = Ret
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10703, _BinData) ->

    UnpackRecordData = #finish_kill_mon_reward_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10704, BinData) ->
    {_RBin0, Ret} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #finish_kill_mon_reward_resp{
        ret = Ret
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10705, BinData) ->
    {_RBin0, Name} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_role_rename{
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(10706, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_role_rename{
        role_id = RoleId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(10701, PackRecordData) ->
    RewardId = prot_util:pack(PackRecordData#get_kill_mon_reward_req.reward_id, {8, unsigned}),

    BinData = <<
        RewardId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10702, PackRecordData) ->
    Ret = prot_util:pack(PackRecordData#get_kill_mon_reward_resp.ret, {8, unsigned}),

    BinData = <<
        Ret/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10703, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10704, PackRecordData) ->
    Ret = prot_util:pack(PackRecordData#finish_kill_mon_reward_resp.ret, {8, unsigned}),

    BinData = <<
        Ret/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10705, PackRecordData) ->
    Name = prot_util:pack(PackRecordData#cs_role_rename.name, string),

    BinData = <<
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(10706, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_role_rename.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_role_rename.name, string),

    BinData = <<
        RoleId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

