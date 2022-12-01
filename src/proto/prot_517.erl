-module(prot_517).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_517.hrl").


%% ---------------------------------------------------------------------------------------

decode(51701, _BinData) ->

    UnpackRecordData = #cs_jousts_hall_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51702, _BinData) ->

    UnpackRecordData = #sc_jousts_hall_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51703, _BinData) ->

    UnpackRecordData = #cs_jousts_hall_leave_l{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51704, _BinData) ->

    UnpackRecordData = #sc_jousts_hall_leave_l{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51705, _BinData) ->

    UnpackRecordData = #cs_jousts_hall_leave_b{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51706, _BinData) ->

    UnpackRecordData = #sc_jousts_hall_leave_b{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51710, _BinData) ->

    UnpackRecordData = #cs_jousts_hall_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51711, BinData) ->
    {RBin0, IsOut} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, EnterTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_jousts_hall_wait_info{
        is_out = IsOut,
        enter_time = EnterTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51712, BinData) ->
    {RBin0, Score} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, TargetRank} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_jousts_hall_battle_info{
        score = Score,
        target_rank = TargetRank
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51713, BinData) ->
    {RBin0, BossHp} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, HurtRank} = prot_util:unpack(RBin0, [{{8, unsigned}, {64, unsigned}, string, {64, unsigned}}]),

    UnpackRecordData = #sc_jousts_hall_boss_info{
        boss_hp = BossHp,
        hurt_rank = HurtRank
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51714, _BinData) ->

    UnpackRecordData = #cs_jousts_hall_rank{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51715, BinData) ->
    {RBin0, TargetRank} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, ScoreRank} = prot_util:unpack(RBin0, [{{16, unsigned}, {64, unsigned}, {8, unsigned}, string, string, {32, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_jousts_hall_rank{
        target_rank = TargetRank,
        score_rank = ScoreRank
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51716, BinData) ->
    {RBin0, WarId} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Stage} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, EndTime} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, IsNewWar} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #sc_jousts_hall_stage_change{
        war_id = WarId,
        stage = Stage,
        end_time = EndTime,
        is_new_war = IsNewWar
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51717, _BinData) ->

    UnpackRecordData = #cs_jousts_hall_score{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51718, BinData) ->
    {_RBin0, Score} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_jousts_hall_score{
        score = Score
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51719, BinData) ->
    {_RBin0, Score} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_jousts_hall_score_change{
        score = Score
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51701, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51702, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51703, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51704, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51705, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51706, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51710, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51711, PackRecordData) ->
    IsOut = prot_util:pack(PackRecordData#sc_jousts_hall_wait_info.is_out, {8, unsigned}),
    EnterTime = prot_util:pack(PackRecordData#sc_jousts_hall_wait_info.enter_time, {32, unsigned}),

    BinData = <<
        IsOut/binary,
        EnterTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51712, PackRecordData) ->
    Score = prot_util:pack(PackRecordData#sc_jousts_hall_battle_info.score, {32, unsigned}),
    TargetRank = prot_util:pack(PackRecordData#sc_jousts_hall_battle_info.target_rank, {16, unsigned}),

    BinData = <<
        Score/binary,
        TargetRank/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51713, PackRecordData) ->
    BossHp = prot_util:pack(PackRecordData#sc_jousts_hall_boss_info.boss_hp, {64, unsigned}),
    HurtRank = prot_util:pack(PackRecordData#sc_jousts_hall_boss_info.hurt_rank, [{{8, unsigned}, {64, unsigned}, string, {64, unsigned}}]),

    BinData = <<
        BossHp/binary,
        HurtRank/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51714, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51715, PackRecordData) ->
    TargetRank = prot_util:pack(PackRecordData#sc_jousts_hall_rank.target_rank, {16, unsigned}),
    ScoreRank = prot_util:pack(PackRecordData#sc_jousts_hall_rank.score_rank, [{{16, unsigned}, {64, unsigned}, {8, unsigned}, string, string, {32, unsigned}, {16, unsigned}}]),

    BinData = <<
        TargetRank/binary,
        ScoreRank/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51716, PackRecordData) ->
    WarId = prot_util:pack(PackRecordData#sc_jousts_hall_stage_change.war_id, {8, unsigned}),
    Stage = prot_util:pack(PackRecordData#sc_jousts_hall_stage_change.stage, {8, unsigned}),
    EndTime = prot_util:pack(PackRecordData#sc_jousts_hall_stage_change.end_time, {32, unsigned}),
    IsNewWar = prot_util:pack(PackRecordData#sc_jousts_hall_stage_change.is_new_war, {8, unsigned}),

    BinData = <<
        WarId/binary,
        Stage/binary,
        EndTime/binary,
        IsNewWar/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51717, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51718, PackRecordData) ->
    Score = prot_util:pack(PackRecordData#sc_jousts_hall_score.score, {32, unsigned}),

    BinData = <<
        Score/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51719, PackRecordData) ->
    Score = prot_util:pack(PackRecordData#sc_jousts_hall_score_change.score, {32, unsigned}),

    BinData = <<
        Score/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

