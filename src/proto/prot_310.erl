-module(prot_310).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_310.hrl").


%% ---------------------------------------------------------------------------------------

decode(31001, _BinData) ->

    UnpackRecordData = #cs_master_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31002, BinData) ->
    {RBin0, State} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Score} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, HpPert} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, LastRob} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, LastChap} = prot_util:unpack(RBin3, {32, unsigned}),
    {_RBin5, LastRobbed} = prot_util:unpack(RBin4, {32, unsigned}),

    UnpackRecordData = #sc_master_info{
        state = State,
        score = Score,
        hp_pert = HpPert,
        last_rob = LastRob,
        last_chap = LastChap,
        last_robbed = LastRobbed
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31003, _BinData) ->

    UnpackRecordData = #cs_master_log{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31004, BinData) ->
    {RBin0, Role} = prot_util:unpack(BinData, [string]),
    {_RBin1, Guild} = prot_util:unpack(RBin0, [string]),

    UnpackRecordData = #sc_master_log{
        role = Role,
        guild = Guild
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31005, _BinData) ->

    UnpackRecordData = #cs_master_rank{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31006, BinData) ->
    {RBin0, Role} = prot_util:unpack(BinData, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),
    {_RBin1, Guild} = prot_util:unpack(RBin0, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),

    UnpackRecordData = #sc_master_rank{
        role = Role,
        guild = Guild
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31007, BinData) ->
    {RBin0, Role} = prot_util:unpack(BinData, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),
    {_RBin1, Guild} = prot_util:unpack(RBin0, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),

    UnpackRecordData = #sc_master_notify_rank{
        role = Role,
        guild = Guild
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31008, BinData) ->
    {_RBin0, HpPert} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_master_notify_hp{
        hp_pert = HpPert
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31009, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_master_register{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31010, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_master_register{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31021, _BinData) ->

    UnpackRecordData = #cs_master_chap{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31022, _BinData) ->

    UnpackRecordData = #sc_master_chap{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31023, _BinData) ->

    UnpackRecordData = #cs_master_quit_chap{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31024, _BinData) ->

    UnpackRecordData = #sc_master_quit_chap{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31025, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_master_rob{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31026, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_master_rob{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31027, _BinData) ->

    UnpackRecordData = #cs_master_quit_rob{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31028, _BinData) ->

    UnpackRecordData = #sc_master_quit_rob{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31029, BinData) ->
    {RBin0, Score} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, ChapScore} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_master_chap_result{
        score = Score,
        chap_score = ChapScore
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31030, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Succ} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Score} = prot_util:unpack(RBin2, {32, unsigned}),
    {_RBin4, RobScore} = prot_util:unpack(RBin3, {32, unsigned}),

    UnpackRecordData = #sc_master_rob_result{
        id = Id,
        name = Name,
        succ = Succ,
        score = Score,
        rob_score = RobScore
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31031, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Succ} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Score} = prot_util:unpack(RBin2, {32, unsigned}),
    {_RBin4, RobbedScore} = prot_util:unpack(RBin3, {32, unsigned}),

    UnpackRecordData = #sc_master_notify_rob{
        id = Id,
        name = Name,
        succ = Succ,
        score = Score,
        robbed_score = RobbedScore
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31032, BinData) ->
    {_RBin0, Score} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_master_settle{
        score = Score
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(31001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31002, PackRecordData) ->
    State = prot_util:pack(PackRecordData#sc_master_info.state, {8, unsigned}),
    Score = prot_util:pack(PackRecordData#sc_master_info.score, {32, unsigned}),
    HpPert = prot_util:pack(PackRecordData#sc_master_info.hp_pert, {8, unsigned}),
    LastRob = prot_util:pack(PackRecordData#sc_master_info.last_rob, {32, unsigned}),
    LastChap = prot_util:pack(PackRecordData#sc_master_info.last_chap, {32, unsigned}),
    LastRobbed = prot_util:pack(PackRecordData#sc_master_info.last_robbed, {32, unsigned}),

    BinData = <<
        State/binary,
        Score/binary,
        HpPert/binary,
        LastRob/binary,
        LastChap/binary,
        LastRobbed/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31003, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31004, PackRecordData) ->
    Role = prot_util:pack(PackRecordData#sc_master_log.role, [string]),
    Guild = prot_util:pack(PackRecordData#sc_master_log.guild, [string]),

    BinData = <<
        Role/binary,
        Guild/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31005, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31006, PackRecordData) ->
    Role = prot_util:pack(PackRecordData#sc_master_rank.role, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),
    Guild = prot_util:pack(PackRecordData#sc_master_rank.guild, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),

    BinData = <<
        Role/binary,
        Guild/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31007, PackRecordData) ->
    Role = prot_util:pack(PackRecordData#sc_master_notify_rank.role, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),
    Guild = prot_util:pack(PackRecordData#sc_master_notify_rank.guild, [{{16, unsigned}, {64, unsigned}, string, {8, unsigned}, string, {32, unsigned}}]),

    BinData = <<
        Role/binary,
        Guild/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31008, PackRecordData) ->
    HpPert = prot_util:pack(PackRecordData#sc_master_notify_hp.hp_pert, {8, unsigned}),

    BinData = <<
        HpPert/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31009, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#cs_master_register.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31010, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#sc_master_register.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31021, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31022, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31023, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31024, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31025, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_master_rob.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31026, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_master_rob.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31027, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31028, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31029, PackRecordData) ->
    Score = prot_util:pack(PackRecordData#sc_master_chap_result.score, {32, unsigned}),
    ChapScore = prot_util:pack(PackRecordData#sc_master_chap_result.chap_score, {32, unsigned}),

    BinData = <<
        Score/binary,
        ChapScore/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31030, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_master_rob_result.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_master_rob_result.name, string),
    Succ = prot_util:pack(PackRecordData#sc_master_rob_result.succ, {8, unsigned}),
    Score = prot_util:pack(PackRecordData#sc_master_rob_result.score, {32, unsigned}),
    RobScore = prot_util:pack(PackRecordData#sc_master_rob_result.rob_score, {32, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Succ/binary,
        Score/binary,
        RobScore/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31031, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_master_notify_rob.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_master_notify_rob.name, string),
    Succ = prot_util:pack(PackRecordData#sc_master_notify_rob.succ, {8, unsigned}),
    Score = prot_util:pack(PackRecordData#sc_master_notify_rob.score, {32, unsigned}),
    RobbedScore = prot_util:pack(PackRecordData#sc_master_notify_rob.robbed_score, {32, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Succ/binary,
        Score/binary,
        RobbedScore/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31032, PackRecordData) ->
    Score = prot_util:pack(PackRecordData#sc_master_settle.score, {32, unsigned}),

    BinData = <<
        Score/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

