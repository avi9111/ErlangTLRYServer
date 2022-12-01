-module(prot_515).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_515.hrl").


%% ---------------------------------------------------------------------------------------

decode(51501, _BinData) ->

    UnpackRecordData = #cs_examine_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51502, BinData) ->
    {RBin0, AnswerNum} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, IsGet} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, RightNum} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, AccGet} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_examine_info{
        answer_num = AnswerNum,
        is_get = IsGet,
        right_num = RightNum,
        acc_get = AccGet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51503, _BinData) ->

    UnpackRecordData = #cs_examine_begin{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51504, BinData) ->
    {RBin0, HelpTimes} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, RightNum} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Id} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, AccGet} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_examine_begin{
        help_times = HelpTimes,
        right_num = RightNum,
        id = Id,
        acc_get = AccGet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51505, _BinData) ->

    UnpackRecordData = #cs_examine_rank{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51506, BinData) ->
    {_RBin0, Ranks} = prot_util:unpack(BinData, [{{8, unsigned}, string}]),

    UnpackRecordData = #sc_examine_rank{
        ranks = Ranks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51507, BinData) ->
    {_RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_examine_answer{
        index = Index
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51508, BinData) ->
    {RBin0, AnswerNum} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, RightNum} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Id} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, AccGet} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_examine_answer{
        answer_num = AnswerNum,
        right_num = RightNum,
        id = Id,
        acc_get = AccGet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51509, _BinData) ->

    UnpackRecordData = #cs_examine_help{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51510, BinData) ->
    {_RBin0, HelpTimes} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_examine_help{
        help_times = HelpTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51511, _BinData) ->

    UnpackRecordData = #cs_examine_reward{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51512, BinData) ->
    {_RBin0, IsGet} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_examine_reward{
        is_get = IsGet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51513, BinData) ->
    {RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_examine_help_reward{
        target_id = TargetId,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51514, _BinData) ->

    UnpackRecordData = #sc_examine_help_reward{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51515, _BinData) ->

    UnpackRecordData = #cs_examine_guide{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51516, BinData) ->
    {_RBin0, Num} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_examine_guide{
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51501, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51502, PackRecordData) ->
    AnswerNum = prot_util:pack(PackRecordData#sc_examine_info.answer_num, {8, unsigned}),
    IsGet = prot_util:pack(PackRecordData#sc_examine_info.is_get, {8, unsigned}),
    RightNum = prot_util:pack(PackRecordData#sc_examine_info.right_num, {8, unsigned}),
    AccGet = prot_util:pack(PackRecordData#sc_examine_info.acc_get, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        AnswerNum/binary,
        IsGet/binary,
        RightNum/binary,
        AccGet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51503, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51504, PackRecordData) ->
    HelpTimes = prot_util:pack(PackRecordData#sc_examine_begin.help_times, {8, unsigned}),
    RightNum = prot_util:pack(PackRecordData#sc_examine_begin.right_num, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_examine_begin.id, {8, unsigned}),
    AccGet = prot_util:pack(PackRecordData#sc_examine_begin.acc_get, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        HelpTimes/binary,
        RightNum/binary,
        Id/binary,
        AccGet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51505, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51506, PackRecordData) ->
    Ranks = prot_util:pack(PackRecordData#sc_examine_rank.ranks, [{{8, unsigned}, string}]),

    BinData = <<
        Ranks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51507, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#cs_examine_answer.index, {8, unsigned}),

    BinData = <<
        Index/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51508, PackRecordData) ->
    AnswerNum = prot_util:pack(PackRecordData#sc_examine_answer.answer_num, {8, unsigned}),
    RightNum = prot_util:pack(PackRecordData#sc_examine_answer.right_num, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_examine_answer.id, {8, unsigned}),
    AccGet = prot_util:pack(PackRecordData#sc_examine_answer.acc_get, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        AnswerNum/binary,
        RightNum/binary,
        Id/binary,
        AccGet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51509, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51510, PackRecordData) ->
    HelpTimes = prot_util:pack(PackRecordData#sc_examine_help.help_times, {8, unsigned}),

    BinData = <<
        HelpTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51511, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51512, PackRecordData) ->
    IsGet = prot_util:pack(PackRecordData#sc_examine_reward.is_get, {8, unsigned}),

    BinData = <<
        IsGet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51513, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#cs_examine_help_reward.target_id, {64, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_examine_help_reward.id, {8, unsigned}),

    BinData = <<
        TargetId/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51514, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51515, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51516, PackRecordData) ->
    Num = prot_util:pack(PackRecordData#sc_examine_guide.num, {8, unsigned}),

    BinData = <<
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

