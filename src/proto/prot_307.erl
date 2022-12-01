-module(prot_307).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_307.hrl").


%% ---------------------------------------------------------------------------------------

decode(30701, _BinData) ->

    UnpackRecordData = #cs_dynasty_war_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30702, _BinData) ->

    UnpackRecordData = #sc_dynasty_war_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30703, _BinData) ->

    UnpackRecordData = #cs_dynasty_war_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30704, _BinData) ->

    UnpackRecordData = #sc_dynasty_war_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30705, BinData) ->
    {_RBin0, RoleNum} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_dynasty_scene_info{
        role_num = RoleNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30706, _BinData) ->

    UnpackRecordData = #sc_dynasty_match{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30711, BinData) ->
    {RBin0, Stage} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Span} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_dynasty_war_stage{
        stage = Stage,
        span = Span
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30712, BinData) ->
    {_RBin0, CampScore} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_dynasty_score{
        camp_score = CampScore
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30713, BinData) ->
    {RBin0, CampScore} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}}]),
    {_RBin1, RankList} = prot_util:unpack(RBin0, [{{8, unsigned}, {64, unsigned}, string, {16, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_dynasty_war_rank{
        camp_score = CampScore,
        rank_list = RankList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30714, BinData) ->
    {RBin0, Camp} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Score} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Reward} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, WinCamp} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, CampScore} = prot_util:unpack(RBin3, [{{8, unsigned}, {32, unsigned}}]),
    {_RBin5, RankList} = prot_util:unpack(RBin4, [{{8, unsigned}, {64, unsigned}, string, {16, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_dynasty_war_settle_up{
        camp = Camp,
        score = Score,
        reward = Reward,
        win_camp = WinCamp,
        camp_score = CampScore,
        rank_list = RankList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30715, BinData) ->
    {RBin0, Add} = prot_util:unpack(BinData, {16, signed}),
    {_RBin1, Score} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_dynasty_role_score{
        add = Add,
        score = Score
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30716, BinData) ->
    {_RBin0, Kill} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_dynasty_cont_kill{
        kill = Kill
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30721, _BinData) ->

    UnpackRecordData = #cs_dynasty_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30722, BinData) ->
    {RBin0, WinTimes} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Titles} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #sc_dynasty_info{
        win_times = WinTimes,
        titles = Titles
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30723, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_dynasty_exchange{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(30724, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_dynasty_exchange{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(30701, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30702, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30703, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30704, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30705, PackRecordData) ->
    RoleNum = prot_util:pack(PackRecordData#sc_dynasty_scene_info.role_num, {16, unsigned}),

    BinData = <<
        RoleNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30706, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30711, PackRecordData) ->
    Stage = prot_util:pack(PackRecordData#sc_dynasty_war_stage.stage, {8, unsigned}),
    Span = prot_util:pack(PackRecordData#sc_dynasty_war_stage.span, {16, unsigned}),

    BinData = <<
        Stage/binary,
        Span/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30712, PackRecordData) ->
    CampScore = prot_util:pack(PackRecordData#sc_dynasty_score.camp_score, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        CampScore/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30713, PackRecordData) ->
    CampScore = prot_util:pack(PackRecordData#sc_dynasty_war_rank.camp_score, [{{8, unsigned}, {32, unsigned}}]),
    RankList = prot_util:pack(PackRecordData#sc_dynasty_war_rank.rank_list, [{{8, unsigned}, {64, unsigned}, string, {16, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {16, unsigned}, {16, unsigned}}]),

    BinData = <<
        CampScore/binary,
        RankList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30714, PackRecordData) ->
    Camp = prot_util:pack(PackRecordData#sc_dynasty_war_settle_up.camp, {8, unsigned}),
    Score = prot_util:pack(PackRecordData#sc_dynasty_war_settle_up.score, {32, unsigned}),
    Reward = prot_util:pack(PackRecordData#sc_dynasty_war_settle_up.reward, {32, unsigned}),
    WinCamp = prot_util:pack(PackRecordData#sc_dynasty_war_settle_up.win_camp, {8, unsigned}),
    CampScore = prot_util:pack(PackRecordData#sc_dynasty_war_settle_up.camp_score, [{{8, unsigned}, {32, unsigned}}]),
    RankList = prot_util:pack(PackRecordData#sc_dynasty_war_settle_up.rank_list, [{{8, unsigned}, {64, unsigned}, string, {16, unsigned}, {8, unsigned}, {8, unsigned}, {32, unsigned}, {32, unsigned}, {16, unsigned}, {16, unsigned}}]),

    BinData = <<
        Camp/binary,
        Score/binary,
        Reward/binary,
        WinCamp/binary,
        CampScore/binary,
        RankList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30715, PackRecordData) ->
    Add = prot_util:pack(PackRecordData#sc_dynasty_role_score.add, {16, signed}),
    Score = prot_util:pack(PackRecordData#sc_dynasty_role_score.score, {32, unsigned}),

    BinData = <<
        Add/binary,
        Score/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30716, PackRecordData) ->
    Kill = prot_util:pack(PackRecordData#sc_dynasty_cont_kill.kill, {16, unsigned}),

    BinData = <<
        Kill/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30721, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30722, PackRecordData) ->
    WinTimes = prot_util:pack(PackRecordData#sc_dynasty_info.win_times, {16, unsigned}),
    Titles = prot_util:pack(PackRecordData#sc_dynasty_info.titles, [{8, unsigned}]),

    BinData = <<
        WinTimes/binary,
        Titles/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30723, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_dynasty_exchange.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(30724, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_dynasty_exchange.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

