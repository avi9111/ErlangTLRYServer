-module(prot_501).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_501.hrl").


%% ---------------------------------------------------------------------------------------

decode(50101, _BinData) ->

    UnpackRecordData = #cs_question_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50102, BinData) ->
    {RBin0, State} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Ranks} = prot_util:unpack(RBin0, [{{8, unsigned}, {64, unsigned}, {32, unsigned}}]),
    {RBin2, MyRank} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, MyScore} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Index} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, ConfId} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, BeginTime} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, EndTime} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, BingoNum} = prot_util:unpack(RBin7, {8, unsigned}),
    {_RBin9, AnswerList} = prot_util:unpack(RBin8, [{{8, unsigned}, {8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_question_info{
        state = State,
        ranks = Ranks,
        my_rank = MyRank,
        my_score = MyScore,
        index = Index,
        conf_id = ConfId,
        begin_time = BeginTime,
        end_time = EndTime,
        bingo_num = BingoNum,
        answer_list = AnswerList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50103, BinData) ->
    {_RBin0, Answer} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_question_answer{
        answer = Answer
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50104, BinData) ->
    {_RBin0, Answer} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_question_answer{
        answer = Answer
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50105, _BinData) ->

    UnpackRecordData = #cs_question_open{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(50106, _BinData) ->

    UnpackRecordData = #cs_question_close{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(50101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50102, PackRecordData) ->
    State = prot_util:pack(PackRecordData#sc_question_info.state, {8, unsigned}),
    Ranks = prot_util:pack(PackRecordData#sc_question_info.ranks, [{{8, unsigned}, {64, unsigned}, {32, unsigned}}]),
    MyRank = prot_util:pack(PackRecordData#sc_question_info.my_rank, {16, unsigned}),
    MyScore = prot_util:pack(PackRecordData#sc_question_info.my_score, {32, unsigned}),
    Index = prot_util:pack(PackRecordData#sc_question_info.index, {8, unsigned}),
    ConfId = prot_util:pack(PackRecordData#sc_question_info.conf_id, {8, unsigned}),
    BeginTime = prot_util:pack(PackRecordData#sc_question_info.begin_time, {32, unsigned}),
    EndTime = prot_util:pack(PackRecordData#sc_question_info.end_time, {32, unsigned}),
    BingoNum = prot_util:pack(PackRecordData#sc_question_info.bingo_num, {8, unsigned}),
    AnswerList = prot_util:pack(PackRecordData#sc_question_info.answer_list, [{{8, unsigned}, {8, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        State/binary,
        Ranks/binary,
        MyRank/binary,
        MyScore/binary,
        Index/binary,
        ConfId/binary,
        BeginTime/binary,
        EndTime/binary,
        BingoNum/binary,
        AnswerList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50103, PackRecordData) ->
    Answer = prot_util:pack(PackRecordData#cs_question_answer.answer, {8, unsigned}),

    BinData = <<
        Answer/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50104, PackRecordData) ->
    Answer = prot_util:pack(PackRecordData#sc_question_answer.answer, {8, unsigned}),

    BinData = <<
        Answer/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50105, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(50106, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

