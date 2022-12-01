-module(prot_313).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_313.hrl").


%% ---------------------------------------------------------------------------------------

decode(31301, _BinData) ->

    UnpackRecordData = #cs_qin_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31302, BinData) ->
    {_RBin0, Status} = prot_util:unpack(BinData, [{{64, unsigned}, string, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_qin_enter{
        status = Status
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31303, _BinData) ->

    UnpackRecordData = #cs_qin_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31304, _BinData) ->

    UnpackRecordData = #sc_qin_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31305, BinData) ->
    {_RBin0, RoleNum} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_qin_prepare{
        role_num = RoleNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31306, BinData) ->
    {RBin0, Coll} = prot_util:unpack(BinData, [{{32, unsigned}, {16, unsigned}, {16, unsigned}}]),
    {RBin1, Mons} = prot_util:unpack(RBin0, [{{32, unsigned}, {16, unsigned}, {16, unsigned}}]),
    {_RBin2, RoleNum} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_qin_battle{
        coll = Coll,
        mons = Mons,
        role_num = RoleNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31307, BinData) ->
    {RBin0, Stage} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, StartTime} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Span} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_qin_stage{
        stage = Stage,
        start_time = StartTime,
        span = Span
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31308, BinData) ->
    {_RBin0, Res} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_qin_res{
        res = Res
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31309, BinData) ->
    {_RBin0, Ranks} = prot_util:unpack(BinData, [{{8, unsigned}, {64, unsigned}, string, {32, unsigned}}]),

    UnpackRecordData = #sc_qin_rank{
        ranks = Ranks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31310, BinData) ->
    {RBin0, Rank} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Kill} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Score} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, Assist} = prot_util:unpack(RBin2, {16, unsigned}),

    UnpackRecordData = #sc_qin_settle_up{
        rank = Rank,
        kill = Kill,
        score = Score,
        assist = Assist
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31311, BinData) ->
    {_RBin0, Coin} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_qin_ex_coin{
        coin = Coin
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31312, BinData) ->
    {_RBin0, Coin} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_qin_ex_coin{
        coin = Coin
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31313, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_qin_buy_equip{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31314, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_qin_buy_equip{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31315, BinData) ->
    {_RBin0, Evil} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_qin_clear_evil{
        evil = Evil
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31316, BinData) ->
    {_RBin0, Evil} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_qin_clear_evil{
        evil = Evil
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(31301, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31302, PackRecordData) ->
    Status = prot_util:pack(PackRecordData#sc_qin_enter.status, [{{64, unsigned}, string, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Status/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31303, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31304, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31305, PackRecordData) ->
    RoleNum = prot_util:pack(PackRecordData#sc_qin_prepare.role_num, {16, unsigned}),

    BinData = <<
        RoleNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31306, PackRecordData) ->
    Coll = prot_util:pack(PackRecordData#sc_qin_battle.coll, [{{32, unsigned}, {16, unsigned}, {16, unsigned}}]),
    Mons = prot_util:pack(PackRecordData#sc_qin_battle.mons, [{{32, unsigned}, {16, unsigned}, {16, unsigned}}]),
    RoleNum = prot_util:pack(PackRecordData#sc_qin_battle.role_num, {8, unsigned}),

    BinData = <<
        Coll/binary,
        Mons/binary,
        RoleNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31307, PackRecordData) ->
    Stage = prot_util:pack(PackRecordData#sc_qin_stage.stage, {8, unsigned}),
    StartTime = prot_util:pack(PackRecordData#sc_qin_stage.start_time, {32, unsigned}),
    Span = prot_util:pack(PackRecordData#sc_qin_stage.span, {16, unsigned}),

    BinData = <<
        Stage/binary,
        StartTime/binary,
        Span/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31308, PackRecordData) ->
    Res = prot_util:pack(PackRecordData#sc_qin_res.res, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        Res/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31309, PackRecordData) ->
    Ranks = prot_util:pack(PackRecordData#sc_qin_rank.ranks, [{{8, unsigned}, {64, unsigned}, string, {32, unsigned}}]),

    BinData = <<
        Ranks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31310, PackRecordData) ->
    Rank = prot_util:pack(PackRecordData#sc_qin_settle_up.rank, {8, unsigned}),
    Kill = prot_util:pack(PackRecordData#sc_qin_settle_up.kill, {16, unsigned}),
    Score = prot_util:pack(PackRecordData#sc_qin_settle_up.score, {32, unsigned}),
    Assist = prot_util:pack(PackRecordData#sc_qin_settle_up.assist, {16, unsigned}),

    BinData = <<
        Rank/binary,
        Kill/binary,
        Score/binary,
        Assist/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31311, PackRecordData) ->
    Coin = prot_util:pack(PackRecordData#cs_qin_ex_coin.coin, {32, unsigned}),

    BinData = <<
        Coin/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31312, PackRecordData) ->
    Coin = prot_util:pack(PackRecordData#sc_qin_ex_coin.coin, {32, unsigned}),

    BinData = <<
        Coin/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31313, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_qin_buy_equip.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31314, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_qin_buy_equip.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31315, PackRecordData) ->
    Evil = prot_util:pack(PackRecordData#cs_qin_clear_evil.evil, {32, unsigned}),

    BinData = <<
        Evil/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31316, PackRecordData) ->
    Evil = prot_util:pack(PackRecordData#sc_qin_clear_evil.evil, {32, unsigned}),

    BinData = <<
        Evil/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

