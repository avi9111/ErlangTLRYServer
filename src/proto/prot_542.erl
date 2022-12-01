-module(prot_542).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_542.hrl").


%% ---------------------------------------------------------------------------------------

decode(54201, _BinData) ->

    UnpackRecordData = #cs_mentor_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54202, BinData) ->
    {RBin0, MentorId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, MentorQuizList} = prot_util:unpack(RBin0, [{{8, unsigned}, {8, unsigned}}]),
    {RBin2, TudiQuizList} = prot_util:unpack(RBin1, [{{8, unsigned}, {8, unsigned}}]),
    {RBin3, OpenUi} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, InfoList} = prot_util:unpack(RBin3, [{u,mentor_base_info}]),
    {RBin5, TudiList} = prot_util:unpack(RBin4, [{u,mentor_tudi_info}]),
    {RBin6, Morality} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, MentorLv} = prot_util:unpack(RBin6, {8, unsigned}),
    {_RBin8, Registered} = prot_util:unpack(RBin7, {8, unsigned}),

    UnpackRecordData = #sc_mentor_info{
        mentor_id = MentorId,
        mentor_quiz_list = MentorQuizList,
        tudi_quiz_list = TudiQuizList,
        open_ui = OpenUi,
        info_list = InfoList,
        tudi_list = TudiList,
        morality = Morality,
        mentor_lv = MentorLv,
        registered = Registered
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54203, _BinData) ->

    UnpackRecordData = #cs_mentor_begin{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54204, BinData) ->
    {_RBin0, MentorName} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_mentor_begin{
        mentor_name = MentorName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54205, BinData) ->
    {_RBin0, Choice} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_mentor_begin_confirm{
        choice = Choice
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54206, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, QuizList} = prot_util:unpack(RBin0, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #cs_mentor_answer_quiz{
        type = Type,
        quiz_list = QuizList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54207, BinData) ->
    {_RBin0, Registered} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_mentor_register{
        registered = Registered
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54208, BinData) ->
    {_RBin0, Registered} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_mentor_register{
        registered = Registered
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54209, _BinData) ->

    UnpackRecordData = #cs_mentor_find{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54210, BinData) ->
    {_RBin0, Mentors} = prot_util:unpack(BinData, [{u,mentor_base_info}]),

    UnpackRecordData = #sc_mentor_find{
        mentors = Mentors
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54211, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Enounce} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #cs_mentor_send_post{
        role_id = RoleId,
        enounce = Enounce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54212, BinData) ->
    {_RBin0, InfoList} = prot_util:unpack(BinData, [{u,mentor_base_info}]),

    UnpackRecordData = #sc_mentor_base_info_list_update{
        info_list = InfoList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54213, BinData) ->
    {_RBin0, TudiList} = prot_util:unpack(BinData, [{u,mentor_tudi_info}]),

    UnpackRecordData = #sc_mentor_tudi_info_list_update{
        tudi_list = TudiList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54214, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, TaskIdList} = prot_util:unpack(RBin0, [{32, unsigned}]),

    UnpackRecordData = #cs_mentor_set_tasks{
        role_id = RoleId,
        task_id_list = TaskIdList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54215, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Replace} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, MentorTasks} = prot_util:unpack(RBin1, [{{16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_mentor_task_list_update{
        role_id = RoleId,
        replace = Replace,
        mentor_tasks = MentorTasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54216, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Replace} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, LearnTasks} = prot_util:unpack(RBin1, [{{16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_mentor_learn_task_list_update{
        role_id = RoleId,
        replace = Replace,
        learn_tasks = LearnTasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54217, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Replace} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, TaixueTasks} = prot_util:unpack(RBin1, [{{16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_mentor_taixue_task_list_update{
        role_id = RoleId,
        replace = Replace,
        taixue_tasks = TaixueTasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54218, _BinData) ->

    UnpackRecordData = #sc_mentor_comment_ui{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54219, BinData) ->
    {_RBin0, Comment} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_mentor_comment{
        comment = Comment
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54220, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Comment} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_mentor_comment{
        role_id = RoleId,
        comment = Comment
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54221, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_mentor_finish_learning{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54222, BinData) ->
    {RBin0, MentorId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Morality} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, MentorLv} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_mentor_refresh_new{
        mentor_id = MentorId,
        morality = Morality,
        mentor_lv = MentorLv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54223, BinData) ->
    {_RBin0, Msg} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_mentor_senior_tudi_ui{
        msg = Msg
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54224, BinData) ->
    {_RBin0, Choice} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_mentor_senior_tudi_confirm{
        choice = Choice
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54225, _BinData) ->

    UnpackRecordData = #cs_mentor_begin_practice{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54226, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, PracticeNum} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_mentor_begin_practice{
        role_id = RoleId,
        practice_num = PracticeNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54227, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Reason} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_mentor_kick_off_tudi{
        role_id = RoleId,
        reason = Reason
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54228, BinData) ->
    {_RBin0, DelIdList} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_mentor_del_base_info_update{
        del_id_list = DelIdList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54229, BinData) ->
    {_RBin0, DelIdList} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_mentor_del_tudi_info_update{
        del_id_list = DelIdList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54230, _BinData) ->

    UnpackRecordData = #cs_mentor_say_goodbye{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54231, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_mentor_take_task_award{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54232, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, AwardTaken} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_mentor_take_task_award{
        role_id = RoleId,
        award_taken = AwardTaken
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(54201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54202, PackRecordData) ->
    MentorId = prot_util:pack(PackRecordData#sc_mentor_info.mentor_id, {64, unsigned}),
    MentorQuizList = prot_util:pack(PackRecordData#sc_mentor_info.mentor_quiz_list, [{{8, unsigned}, {8, unsigned}}]),
    TudiQuizList = prot_util:pack(PackRecordData#sc_mentor_info.tudi_quiz_list, [{{8, unsigned}, {8, unsigned}}]),
    OpenUi = prot_util:pack(PackRecordData#sc_mentor_info.open_ui, {8, unsigned}),
    InfoList = prot_util:pack(PackRecordData#sc_mentor_info.info_list, [{u,mentor_base_info}]),
    TudiList = prot_util:pack(PackRecordData#sc_mentor_info.tudi_list, [{u,mentor_tudi_info}]),
    Morality = prot_util:pack(PackRecordData#sc_mentor_info.morality, {32, unsigned}),
    MentorLv = prot_util:pack(PackRecordData#sc_mentor_info.mentor_lv, {8, unsigned}),
    Registered = prot_util:pack(PackRecordData#sc_mentor_info.registered, {8, unsigned}),

    BinData = <<
        MentorId/binary,
        MentorQuizList/binary,
        TudiQuizList/binary,
        OpenUi/binary,
        InfoList/binary,
        TudiList/binary,
        Morality/binary,
        MentorLv/binary,
        Registered/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54203, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54204, PackRecordData) ->
    MentorName = prot_util:pack(PackRecordData#sc_mentor_begin.mentor_name, string),

    BinData = <<
        MentorName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54205, PackRecordData) ->
    Choice = prot_util:pack(PackRecordData#cs_mentor_begin_confirm.choice, {8, unsigned}),

    BinData = <<
        Choice/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54206, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_mentor_answer_quiz.type, {8, unsigned}),
    QuizList = prot_util:pack(PackRecordData#cs_mentor_answer_quiz.quiz_list, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Type/binary,
        QuizList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54207, PackRecordData) ->
    Registered = prot_util:pack(PackRecordData#cs_mentor_register.registered, {8, unsigned}),

    BinData = <<
        Registered/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54208, PackRecordData) ->
    Registered = prot_util:pack(PackRecordData#sc_mentor_register.registered, {8, unsigned}),

    BinData = <<
        Registered/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54209, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54210, PackRecordData) ->
    Mentors = prot_util:pack(PackRecordData#sc_mentor_find.mentors, [{u,mentor_base_info}]),

    BinData = <<
        Mentors/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54211, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_mentor_send_post.role_id, {64, unsigned}),
    Enounce = prot_util:pack(PackRecordData#cs_mentor_send_post.enounce, string),

    BinData = <<
        RoleId/binary,
        Enounce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54212, PackRecordData) ->
    InfoList = prot_util:pack(PackRecordData#sc_mentor_base_info_list_update.info_list, [{u,mentor_base_info}]),

    BinData = <<
        InfoList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54213, PackRecordData) ->
    TudiList = prot_util:pack(PackRecordData#sc_mentor_tudi_info_list_update.tudi_list, [{u,mentor_tudi_info}]),

    BinData = <<
        TudiList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54214, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_mentor_set_tasks.role_id, {64, unsigned}),
    TaskIdList = prot_util:pack(PackRecordData#cs_mentor_set_tasks.task_id_list, [{32, unsigned}]),

    BinData = <<
        RoleId/binary,
        TaskIdList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54215, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_mentor_task_list_update.role_id, {64, unsigned}),
    Replace = prot_util:pack(PackRecordData#sc_mentor_task_list_update.replace, {8, unsigned}),
    MentorTasks = prot_util:pack(PackRecordData#sc_mentor_task_list_update.mentor_tasks, [{{16, unsigned}, {16, unsigned}}]),

    BinData = <<
        RoleId/binary,
        Replace/binary,
        MentorTasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54216, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_mentor_learn_task_list_update.role_id, {64, unsigned}),
    Replace = prot_util:pack(PackRecordData#sc_mentor_learn_task_list_update.replace, {8, unsigned}),
    LearnTasks = prot_util:pack(PackRecordData#sc_mentor_learn_task_list_update.learn_tasks, [{{16, unsigned}, {16, unsigned}}]),

    BinData = <<
        RoleId/binary,
        Replace/binary,
        LearnTasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54217, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_mentor_taixue_task_list_update.role_id, {64, unsigned}),
    Replace = prot_util:pack(PackRecordData#sc_mentor_taixue_task_list_update.replace, {8, unsigned}),
    TaixueTasks = prot_util:pack(PackRecordData#sc_mentor_taixue_task_list_update.taixue_tasks, [{{16, unsigned}, {16, unsigned}}]),

    BinData = <<
        RoleId/binary,
        Replace/binary,
        TaixueTasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54218, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54219, PackRecordData) ->
    Comment = prot_util:pack(PackRecordData#cs_mentor_comment.comment, {8, unsigned}),

    BinData = <<
        Comment/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54220, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_mentor_comment.role_id, {64, unsigned}),
    Comment = prot_util:pack(PackRecordData#sc_mentor_comment.comment, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Comment/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54221, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_mentor_finish_learning.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54222, PackRecordData) ->
    MentorId = prot_util:pack(PackRecordData#sc_mentor_refresh_new.mentor_id, {64, unsigned}),
    Morality = prot_util:pack(PackRecordData#sc_mentor_refresh_new.morality, {32, unsigned}),
    MentorLv = prot_util:pack(PackRecordData#sc_mentor_refresh_new.mentor_lv, {8, unsigned}),

    BinData = <<
        MentorId/binary,
        Morality/binary,
        MentorLv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54223, PackRecordData) ->
    Msg = prot_util:pack(PackRecordData#sc_mentor_senior_tudi_ui.msg, string),

    BinData = <<
        Msg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54224, PackRecordData) ->
    Choice = prot_util:pack(PackRecordData#cs_mentor_senior_tudi_confirm.choice, {8, unsigned}),

    BinData = <<
        Choice/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54225, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54226, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_mentor_begin_practice.role_id, {64, unsigned}),
    PracticeNum = prot_util:pack(PackRecordData#sc_mentor_begin_practice.practice_num, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        PracticeNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54227, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_mentor_kick_off_tudi.role_id, {64, unsigned}),
    Reason = prot_util:pack(PackRecordData#cs_mentor_kick_off_tudi.reason, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Reason/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54228, PackRecordData) ->
    DelIdList = prot_util:pack(PackRecordData#sc_mentor_del_base_info_update.del_id_list, [{64, unsigned}]),

    BinData = <<
        DelIdList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54229, PackRecordData) ->
    DelIdList = prot_util:pack(PackRecordData#sc_mentor_del_tudi_info_update.del_id_list, [{64, unsigned}]),

    BinData = <<
        DelIdList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54230, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54231, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_mentor_take_task_award.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54232, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_mentor_take_task_award.role_id, {64, unsigned}),
    AwardTaken = prot_util:pack(PackRecordData#sc_mentor_take_task_award.award_taken, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        AwardTaken/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

