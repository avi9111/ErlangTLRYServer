-module(prot_512).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_512.hrl").


%% ---------------------------------------------------------------------------------------

decode(51201, _BinData) ->

    UnpackRecordData = #cs_career_battle_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51202, _BinData) ->

    UnpackRecordData = #sc_career_battle_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51203, _BinData) ->

    UnpackRecordData = #cs_career_battle_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51204, _BinData) ->

    UnpackRecordData = #sc_career_battle_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51205, BinData) ->
    {_RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_career_battle_reward{
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51206, BinData) ->
    {_RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_career_battle_reward{
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51207, _BinData) ->

    UnpackRecordData = #cs_career_battle_top{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51208, BinData) ->
    {_RBin0, Info} = prot_util:unpack(BinData, [{{8, unsigned}, {16, unsigned}, {64, unsigned}, string, {8, unsigned}}]),

    UnpackRecordData = #sc_career_battle_top{
        info = Info
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51211, _BinData) ->

    UnpackRecordData = #cs_career_battle_lounge_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51212, BinData) ->
    {RBin0, MatchTime} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Score} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, BattleTimes} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, LeaveTimes} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, LastWinTimes} = prot_util:unpack(RBin3, {8, unsigned}),
    {_RBin5, RewardList} = prot_util:unpack(RBin4, [{8, unsigned}]),

    UnpackRecordData = #sc_career_battle_lounge_info{
        match_time = MatchTime,
        score = Score,
        battle_times = BattleTimes,
        leave_times = LeaveTimes,
        last_win_times = LastWinTimes,
        reward_list = RewardList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51213, BinData) ->
    {RBin0, Career} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Grade} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_career_battle_rank{
        career = Career,
        grade = Grade
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51214, BinData) ->
    {RBin0, Career} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Grade} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, RoleRank} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, Ranks} = prot_util:unpack(RBin2, [{{32, unsigned}, string, string, {32, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_career_battle_rank{
        career = Career,
        grade = Grade,
        role_rank = RoleRank,
        ranks = Ranks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51215, BinData) ->
    {_RBin0, BattleEnd} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_career_battle_enter_bat{
        battle_end = BattleEnd
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51216, BinData) ->
    {RBin0, Hurt} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, DeferHurt} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_career_battle_update_hurt{
        hurt = Hurt,
        defer_hurt = DeferHurt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51217, BinData) ->
    {RBin0, Res} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, LastWinTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, DefendLastWin} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, ExtraScore} = prot_util:unpack(RBin2, {16, unsigned}),
    {_RBin4, LeaveTime} = prot_util:unpack(RBin3, {32, unsigned}),

    UnpackRecordData = #sc_career_battle_bat_end{
        res = Res,
        last_win_times = LastWinTimes,
        defend_last_win = DefendLastWin,
        extra_score = ExtraScore,
        leave_time = LeaveTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51218, _BinData) ->

    UnpackRecordData = #cs_career_battle_leave_bat{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51219, _BinData) ->

    UnpackRecordData = #sc_career_battle_leave_bat{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51202, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51203, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51204, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51205, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#cs_career_battle_reward.times, {8, unsigned}),

    BinData = <<
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51206, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_career_battle_reward.times, {8, unsigned}),

    BinData = <<
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51207, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51208, PackRecordData) ->
    Info = prot_util:pack(PackRecordData#sc_career_battle_top.info, [{{8, unsigned}, {16, unsigned}, {64, unsigned}, string, {8, unsigned}}]),

    BinData = <<
        Info/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51211, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51212, PackRecordData) ->
    MatchTime = prot_util:pack(PackRecordData#sc_career_battle_lounge_info.match_time, {32, unsigned}),
    Score = prot_util:pack(PackRecordData#sc_career_battle_lounge_info.score, {32, unsigned}),
    BattleTimes = prot_util:pack(PackRecordData#sc_career_battle_lounge_info.battle_times, {8, unsigned}),
    LeaveTimes = prot_util:pack(PackRecordData#sc_career_battle_lounge_info.leave_times, {8, unsigned}),
    LastWinTimes = prot_util:pack(PackRecordData#sc_career_battle_lounge_info.last_win_times, {8, unsigned}),
    RewardList = prot_util:pack(PackRecordData#sc_career_battle_lounge_info.reward_list, [{8, unsigned}]),

    BinData = <<
        MatchTime/binary,
        Score/binary,
        BattleTimes/binary,
        LeaveTimes/binary,
        LastWinTimes/binary,
        RewardList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51213, PackRecordData) ->
    Career = prot_util:pack(PackRecordData#cs_career_battle_rank.career, {8, unsigned}),
    Grade = prot_util:pack(PackRecordData#cs_career_battle_rank.grade, {8, unsigned}),

    BinData = <<
        Career/binary,
        Grade/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51214, PackRecordData) ->
    Career = prot_util:pack(PackRecordData#sc_career_battle_rank.career, {8, unsigned}),
    Grade = prot_util:pack(PackRecordData#sc_career_battle_rank.grade, {8, unsigned}),
    RoleRank = prot_util:pack(PackRecordData#sc_career_battle_rank.role_rank, {32, unsigned}),
    Ranks = prot_util:pack(PackRecordData#sc_career_battle_rank.ranks, [{{32, unsigned}, string, string, {32, unsigned}, {32, unsigned}}]),

    BinData = <<
        Career/binary,
        Grade/binary,
        RoleRank/binary,
        Ranks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51215, PackRecordData) ->
    BattleEnd = prot_util:pack(PackRecordData#sc_career_battle_enter_bat.battle_end, {32, unsigned}),

    BinData = <<
        BattleEnd/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51216, PackRecordData) ->
    Hurt = prot_util:pack(PackRecordData#sc_career_battle_update_hurt.hurt, {64, unsigned}),
    DeferHurt = prot_util:pack(PackRecordData#sc_career_battle_update_hurt.defer_hurt, {64, unsigned}),

    BinData = <<
        Hurt/binary,
        DeferHurt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51217, PackRecordData) ->
    Res = prot_util:pack(PackRecordData#sc_career_battle_bat_end.res, {8, unsigned}),
    LastWinTimes = prot_util:pack(PackRecordData#sc_career_battle_bat_end.last_win_times, {8, unsigned}),
    DefendLastWin = prot_util:pack(PackRecordData#sc_career_battle_bat_end.defend_last_win, {8, unsigned}),
    ExtraScore = prot_util:pack(PackRecordData#sc_career_battle_bat_end.extra_score, {16, unsigned}),
    LeaveTime = prot_util:pack(PackRecordData#sc_career_battle_bat_end.leave_time, {32, unsigned}),

    BinData = <<
        Res/binary,
        LastWinTimes/binary,
        DefendLastWin/binary,
        ExtraScore/binary,
        LeaveTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51218, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51219, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

