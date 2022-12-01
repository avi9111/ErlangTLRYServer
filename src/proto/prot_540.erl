-module(prot_540).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_540.hrl").


%% ---------------------------------------------------------------------------------------

decode(54001, _BinData) ->

    UnpackRecordData = #cs_sworn_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54002, BinData) ->
    {RBin0, GroupId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, MemList} = prot_util:unpack(RBin0, [{u,sworn_member}]),
    {RBin2, GroupName} = prot_util:unpack(RBin1, string),
    {RBin3, Quality} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, SwornValue} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Enounce} = prot_util:unpack(RBin4, string),
    {_RBin6, OpenUi} = prot_util:unpack(RBin5, {8, unsigned}),

    UnpackRecordData = #sc_sworn_info{
        group_id = GroupId,
        mem_list = MemList,
        group_name = GroupName,
        quality = Quality,
        sworn_value = SwornValue,
        enounce = Enounce,
        open_ui = OpenUi
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54003, _BinData) ->

    UnpackRecordData = #cs_sworn_create_new{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54004, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Msg} = prot_util:unpack(RBin0, string),
    {_RBin2, CdTime} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_sworn_confirm_u_i{
        type = Type,
        msg = Msg,
        cd_time = CdTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54005, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Choice} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_sworn_make_confirm{
        type = Type,
        choice = Choice
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54006, _BinData) ->

    UnpackRecordData = #cs_sworn_recruit_member{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54007, BinData) ->
    {_RBin0, MemList} = prot_util:unpack(BinData, [{u,sworn_member}]),

    UnpackRecordData = #sc_sworn_member_update{
        mem_list = MemList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54008, _BinData) ->

    UnpackRecordData = #cs_sworn_dismiss_member_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54009, _BinData) ->

    UnpackRecordData = #sc_sworn_dismiss_member_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54010, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Reason} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_sworn_dismiss_member{
        role_id = RoleId,
        reason = Reason
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54011, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, SwornValue} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_sworn_delete_member{
        role_id = RoleId,
        sworn_value = SwornValue
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54012, _BinData) ->

    UnpackRecordData = #cs_sworn_change_senior{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54013, BinData) ->
    {RBin0, CurSenior} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, CloseTime} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, SortedList} = prot_util:unpack(RBin1, [{u,sworn_sort_info}]),
    {_RBin3, RawList} = prot_util:unpack(RBin2, [{u,sworn_sort_info}]),

    UnpackRecordData = #sc_sworn_senior_sort_info{
        cur_senior = CurSenior,
        close_time = CloseTime,
        sorted_list = SortedList,
        raw_list = RawList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54014, _BinData) ->

    UnpackRecordData = #cs_sworn_modify_name_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54015, _BinData) ->

    UnpackRecordData = #sc_sworn_modify_name_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54016, BinData) ->
    {RBin0, NameHead} = prot_util:unpack(BinData, string),
    {_RBin1, NameTail} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #cs_sworn_modify_name{
        name_head = NameHead,
        name_tail = NameTail
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54017, BinData) ->
    {_RBin0, GroupName} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_sworn_modify_name{
        group_name = GroupName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54018, BinData) ->
    {_RBin0, Word} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_sworn_modify_word{
        word = Word
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54019, BinData) ->
    {_RBin0, Word} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_sworn_modify_word{
        word = Word
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54020, _BinData) ->

    UnpackRecordData = #cs_sworn_up_quality{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54021, BinData) ->
    {_RBin0, Quality} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_sworn_up_quality{
        quality = Quality
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54022, BinData) ->
    {_RBin0, SwornValue} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_sworn_value_update{
        sworn_value = SwornValue
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54023, BinData) ->
    {_RBin0, Enounce} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_sworn_modify_enounce{
        enounce = Enounce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54024, BinData) ->
    {_RBin0, Enounce} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_sworn_modify_enounce{
        enounce = Enounce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54025, _BinData) ->

    UnpackRecordData = #cs_sworn_gather_member{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54026, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_sworn_get_platform_list{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54027, BinData) ->
    {RBin0, Registered} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, GreetNum} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, PersonList} = prot_util:unpack(RBin1, [{u,sworn_person_plat}]),
    {_RBin3, GroupList} = prot_util:unpack(RBin2, [{u,sworn_group_plat}]),

    UnpackRecordData = #sc_sworn_get_platform_list{
        registered = Registered,
        greet_num = GreetNum,
        person_list = PersonList,
        group_list = GroupList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54028, BinData) ->
    {RBin0, TendCareer} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, TendLv} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, TendTime} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_sworn_register{
        tend_career = TendCareer,
        tend_lv = TendLv,
        tend_time = TendTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54029, BinData) ->
    {_RBin0, Registered} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_sworn_register_update{
        registered = Registered
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54030, _BinData) ->

    UnpackRecordData = #cs_sworn_cancel_register{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54031, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #cs_sworn_greet{
        type = Type,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54032, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, GreetNum} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_sworn_greet{
        type = Type,
        id = Id,
        greet_num = GreetNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54033, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_sworn_vote_senior{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54034, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_sworn_vote_senior{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54035, _BinData) ->

    UnpackRecordData = #cs_sworn_leave_group{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54036, _BinData) ->

    UnpackRecordData = #sc_sworn_leave_group{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(54001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54002, PackRecordData) ->
    GroupId = prot_util:pack(PackRecordData#sc_sworn_info.group_id, {64, unsigned}),
    MemList = prot_util:pack(PackRecordData#sc_sworn_info.mem_list, [{u,sworn_member}]),
    GroupName = prot_util:pack(PackRecordData#sc_sworn_info.group_name, string),
    Quality = prot_util:pack(PackRecordData#sc_sworn_info.quality, {8, unsigned}),
    SwornValue = prot_util:pack(PackRecordData#sc_sworn_info.sworn_value, {32, unsigned}),
    Enounce = prot_util:pack(PackRecordData#sc_sworn_info.enounce, string),
    OpenUi = prot_util:pack(PackRecordData#sc_sworn_info.open_ui, {8, unsigned}),

    BinData = <<
        GroupId/binary,
        MemList/binary,
        GroupName/binary,
        Quality/binary,
        SwornValue/binary,
        Enounce/binary,
        OpenUi/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54003, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54004, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_sworn_confirm_u_i.type, {8, unsigned}),
    Msg = prot_util:pack(PackRecordData#sc_sworn_confirm_u_i.msg, string),
    CdTime = prot_util:pack(PackRecordData#sc_sworn_confirm_u_i.cd_time, {8, unsigned}),

    BinData = <<
        Type/binary,
        Msg/binary,
        CdTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54005, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_sworn_make_confirm.type, {8, unsigned}),
    Choice = prot_util:pack(PackRecordData#cs_sworn_make_confirm.choice, {8, unsigned}),

    BinData = <<
        Type/binary,
        Choice/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54006, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54007, PackRecordData) ->
    MemList = prot_util:pack(PackRecordData#sc_sworn_member_update.mem_list, [{u,sworn_member}]),

    BinData = <<
        MemList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54008, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54009, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54010, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_sworn_dismiss_member.role_id, {64, unsigned}),
    Reason = prot_util:pack(PackRecordData#cs_sworn_dismiss_member.reason, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Reason/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54011, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_sworn_delete_member.role_id, {64, unsigned}),
    SwornValue = prot_util:pack(PackRecordData#sc_sworn_delete_member.sworn_value, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        SwornValue/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54012, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54013, PackRecordData) ->
    CurSenior = prot_util:pack(PackRecordData#sc_sworn_senior_sort_info.cur_senior, {8, unsigned}),
    CloseTime = prot_util:pack(PackRecordData#sc_sworn_senior_sort_info.close_time, {32, unsigned}),
    SortedList = prot_util:pack(PackRecordData#sc_sworn_senior_sort_info.sorted_list, [{u,sworn_sort_info}]),
    RawList = prot_util:pack(PackRecordData#sc_sworn_senior_sort_info.raw_list, [{u,sworn_sort_info}]),

    BinData = <<
        CurSenior/binary,
        CloseTime/binary,
        SortedList/binary,
        RawList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54014, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54015, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54016, PackRecordData) ->
    NameHead = prot_util:pack(PackRecordData#cs_sworn_modify_name.name_head, string),
    NameTail = prot_util:pack(PackRecordData#cs_sworn_modify_name.name_tail, string),

    BinData = <<
        NameHead/binary,
        NameTail/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54017, PackRecordData) ->
    GroupName = prot_util:pack(PackRecordData#sc_sworn_modify_name.group_name, string),

    BinData = <<
        GroupName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54018, PackRecordData) ->
    Word = prot_util:pack(PackRecordData#cs_sworn_modify_word.word, string),

    BinData = <<
        Word/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54019, PackRecordData) ->
    Word = prot_util:pack(PackRecordData#sc_sworn_modify_word.word, string),

    BinData = <<
        Word/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54020, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54021, PackRecordData) ->
    Quality = prot_util:pack(PackRecordData#sc_sworn_up_quality.quality, {8, unsigned}),

    BinData = <<
        Quality/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54022, PackRecordData) ->
    SwornValue = prot_util:pack(PackRecordData#sc_sworn_value_update.sworn_value, {32, unsigned}),

    BinData = <<
        SwornValue/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54023, PackRecordData) ->
    Enounce = prot_util:pack(PackRecordData#cs_sworn_modify_enounce.enounce, string),

    BinData = <<
        Enounce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54024, PackRecordData) ->
    Enounce = prot_util:pack(PackRecordData#sc_sworn_modify_enounce.enounce, string),

    BinData = <<
        Enounce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54025, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54026, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_sworn_get_platform_list.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54027, PackRecordData) ->
    Registered = prot_util:pack(PackRecordData#sc_sworn_get_platform_list.registered, {8, unsigned}),
    GreetNum = prot_util:pack(PackRecordData#sc_sworn_get_platform_list.greet_num, {8, unsigned}),
    PersonList = prot_util:pack(PackRecordData#sc_sworn_get_platform_list.person_list, [{u,sworn_person_plat}]),
    GroupList = prot_util:pack(PackRecordData#sc_sworn_get_platform_list.group_list, [{u,sworn_group_plat}]),

    BinData = <<
        Registered/binary,
        GreetNum/binary,
        PersonList/binary,
        GroupList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54028, PackRecordData) ->
    TendCareer = prot_util:pack(PackRecordData#cs_sworn_register.tend_career, {8, unsigned}),
    TendLv = prot_util:pack(PackRecordData#cs_sworn_register.tend_lv, {8, unsigned}),
    TendTime = prot_util:pack(PackRecordData#cs_sworn_register.tend_time, {8, unsigned}),

    BinData = <<
        TendCareer/binary,
        TendLv/binary,
        TendTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54029, PackRecordData) ->
    Registered = prot_util:pack(PackRecordData#sc_sworn_register_update.registered, {8, unsigned}),

    BinData = <<
        Registered/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54030, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54031, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_sworn_greet.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_sworn_greet.id, {64, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54032, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_sworn_greet.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_sworn_greet.id, {64, unsigned}),
    GreetNum = prot_util:pack(PackRecordData#sc_sworn_greet.greet_num, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary,
        GreetNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54033, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_sworn_vote_senior.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54034, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_sworn_vote_senior.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54035, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54036, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

