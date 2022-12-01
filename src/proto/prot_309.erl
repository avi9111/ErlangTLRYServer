-module(prot_309).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_309.hrl").


%% ---------------------------------------------------------------------------------------

decode(30902, _BinData) ->

    UnpackRecordData = #exit_world_boss_field_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30903, BinData) ->
    {RBin0, Layer} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, FieldId} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, LineId} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #enter_world_boss_field_req{
        layer = Layer,
        field_id = FieldId,
        line_id = LineId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30904, _BinData) ->

    UnpackRecordData = #get_world_boss_role_rank_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30905, _BinData) ->

    UnpackRecordData = #get_world_boss_role_rank_resp{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30906, _BinData) ->

    UnpackRecordData = #get_world_boss_guild_rank_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30907, _BinData) ->

    UnpackRecordData = #get_world_boss_guild_rank_resp{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30908, BinData) ->
    {_RBin0, BossRankList} = prot_util:unpack(BinData, [{u,wb_guild_rank}]),

    UnpackRecordData = #notify_wb_guild_ranks{
        boss_rank_list = BossRankList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30909, _BinData) ->

    UnpackRecordData = #get_world_boss_seq_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30910, BinData) ->
    {_RBin0, BossIds} = prot_util:unpack(BinData, [{32, unsigned}]),

    UnpackRecordData = #get_world_boss_seq_resp{
        boss_ids = BossIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(30902, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30903, PackRecordData) ->
    Layer = prot_util:pack(PackRecordData#enter_world_boss_field_req.layer, {8, unsigned}),
    FieldId = prot_util:pack(PackRecordData#enter_world_boss_field_req.field_id, {16, unsigned}),
    LineId = prot_util:pack(PackRecordData#enter_world_boss_field_req.line_id, {32, unsigned}),

    BinData = <<
        Layer/binary,
        FieldId/binary,
        LineId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30904, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30905, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30906, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30907, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30908, PackRecordData) ->
    BossRankList = prot_util:pack(PackRecordData#notify_wb_guild_ranks.boss_rank_list, [{u,wb_guild_rank}]),

    BinData = <<
        BossRankList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30909, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30910, PackRecordData) ->
    BossIds = prot_util:pack(PackRecordData#get_world_boss_seq_resp.boss_ids, [{32, unsigned}]),

    BinData = <<
        BossIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

