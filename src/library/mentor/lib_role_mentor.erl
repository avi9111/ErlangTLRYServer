%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     师徒系统
%%% @end
%%% Created : 28. 二月 2019 16:28
%%%-------------------------------------------------------------------
-module(lib_role_mentor).
-author("Tom").

-include("mentor.hrl").
-include("op_type.hrl").
-include("role.hrl").
-include("task.hrl").
-include("scene.hrl").
-include("title.hrl").
-include("sworn.hrl").
-include("friend.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_ud.hrl").
-include("proto/prot_542.hrl").


%% API
-export([
    init/1,
    save/1,
    event/2,
    role_login/1,
    handle_info/2
]).

-export([
    info/1,
    action/2,
    mentor_begin/1,
    begin_confirm/2,
    answer_quiz/3,
    register_mentor/2,
    find_mentor/1,
    send_post/3,
    set_tasks/3,
    comment/2,
    say_goodbye/1,
    is_sitting/1,
    is_mentor/1,
    take_award/2,
    stop_sitting/2,
    get_mentor_lv/1,
    begin_practice/1,
    kick_off_tudi/3,
    finish_learning/2,
    senior_tudi_confirm/2,
    get_mentor_title_extra/1,
    refresh_mentor_tasks/2,
    is_team_with_mentor/1,
    
    
    is_in_range/5,
    is_in_mentor_relation/2,
    convert_tudi_to_client_info/2,
    convert_mentor_to_client_info/1,
    get_daily_practice_num/1,
    get_tudi_old_data/1,
    get_mentor_old_data/2
]).


handle_info({'active_mentor', #mentor_person{role_id = MentorID, mentor_lv = MentorLv} = MentorPerson}, PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleMentor = get_role_data(RoleID),
    RoleMentorN = RoleMentor#role_mentor{mentor_id = MentorID},
    update_role_data(RoleID, RoleMentorN),
    router_542:send_mentor_info(PS, RoleMentorN, MentorPerson, true),
    %%师徒称号
    TitleN = if
        RoleID =:= MentorID ->
            #{title := Title} = conf_mentor_lv:get(MentorLv),
            Title;
        true ->
            #{senior_lv := SeniorLv} = conf_mentor_base:get(),
            if
                Lv < SeniorLv -> ?TITLE_ID_NORMAL_TUDI;
                true -> ?TITLE_ID_SENIOR_TUDI
            end
    end,
    lib_role_title:activate(PS, TitleN);
handle_info({'store_tudi_data', MentorTudi, Leave, Finish}, PS) ->
%%    io:format("store_tudi_data...~n"),
    store_tudi_data(PS, MentorTudi, Leave),

    %%师徒称号
    if
        Leave ->
            Title = case Finish of
                true -> ?TITLE_ID_NORMAL_TUDI;
                false ->
                    if
                        MentorTudi#mentor_tudi.type =:= ?TUDI_TYPE_NORMAL -> ?TITLE_ID_NORMAL_TUDI;
                        true -> ?TITLE_ID_SENIOR_TUDI
                    end
            end,
            svr_title:deprive(PS#role_state.id, Title);
        true -> skip
    end;
handle_info({'store_mentor_data', Morality, MentorLv, TakenTuple, Finish}, #role_state{id = RoleID} = PS) ->
%%    io:format("store_mentor_data...~n"),
    #role_mentor{mentor_lv = OldMentorLv} = get_role_data(RoleID),
    store_mentor_data(PS, Morality, MentorLv, TakenTuple, Finish),

    %%师徒称号
    case Finish of
        true ->
            #{title := Title} = conf_mentor_lv:get(?iif(OldMentorLv =/= 0, OldMentorLv, MentorLv)),
            svr_title:deprive(RoleID, Title);
        false when MentorLv > OldMentorLv, OldMentorLv =/= 0 ->
            #{title := Title1} = conf_mentor_lv:get(OldMentorLv),
            #{title := Title2} = conf_mentor_lv:get(MentorLv),
            svr_title:deprive(RoleID, Title1),
            lib_role_title:activate(PS, Title2);
        _ -> skip
    end;
handle_info({'activate_practice', CenterX, 0, EndTime}, PS) ->
    activate_practice(PS, CenterX, 0, EndTime);
handle_info('pop_up_finish_comment', PS) ->
    pop_up_mentor_comment_ui(PS, true);
handle_info(_, _) ->
    ignore.


event(PS, {'timer', 'quarter_hour'}) ->
    %% 更新自己的基本信息给师徒众人和平台登记信息
    #role_state{id = RoleID, name = Name, level = Lv, personal = #{icon := Icon, frame := Frame}} = PS,
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{tudi_list = TudiList} ->
            if
                RoleID =:= MentorID ->
                    TudiIdList = [TID || #mentor_tudi{role_id = TID} <- TudiList],
                    MentorPersonN = MentorPerson#mentor_person{name = Name, lv = Lv, icon = Icon, frame = Frame},
                    svr_mentor:update_person(MentorPersonN),
                    BaseInfo = convert_mentor_to_client_info(MentorPersonN),
                    router_542:send_baseinfo_list_update(TudiIdList, [BaseInfo]);
                true ->
                    MentorTudi = util:list_find(RoleID, #mentor_tudi.role_id, TudiList, #mentor_tudi{}),
                    case MentorTudi of
                        #mentor_tudi{} ->
                            LeftTudiIdList = [TID || #mentor_tudi{role_id = TID} <- TudiList, TID =/= RoleID],
                            {BaseInfo, _} = convert_tudi_to_client_info(false, MentorTudi),
                            router_542:send_baseinfo_list_update([MentorID | LeftTudiIdList], [BaseInfo]);
                        undefined -> skip
                    end
            end;
        undefined -> skip
    end;
event(PS, 'level_up') ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID, comment_pop = PopList} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    #{comment_timing := Timing} = conf_mentor_base:get(),
    Func = fun(TimingLv, CurLv) ->
        ?iif(Lv >= TimingLv andalso not lists:member(TimingLv, PopList), TimingLv, CurLv)
    end,
    PopLv = lists:foldl(Func, 0, Timing),
    MentorPerson =/= undefined andalso MentorPerson#mentor_person.role_id =/= RoleID andalso PopLv =/= 0 andalso
        begin
            update_role_data(RoleID, RoleMentor#role_mentor{comment_pop = [PopLv | PopList]}),
            pop_up_mentor_comment_ui(PS)
        end;
event(_, _) ->
    skip.

action(PS, Action) ->
    #role_state{id = RoleID, name = Name, level = Lv} = PS,
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{name = MentorName, tudi_list = TudiList} ->
            MentorTudi = util:list_find(RoleID, #mentor_tudi.role_id, TudiList, undefined),
            case MentorTudi of
                #mentor_tudi{mark = OldMark, fin_num = FinNum, learn_tasks = LearnTasks, mentor_tasks = MentorTasks, taixue_tasks = TaixueTasks} ->
                    {LearnTasksN, LearnTasksU} = lib_task_util:task_actions(LearnTasks, PS, Action),
                    {MentorTasksN, MentorTasksU} = lib_task_util:task_actions(MentorTasks, PS, Action),
                    {TaixueTasksN, TaixueTasksU} = lib_task_util:task_actions(TaixueTasks, PS, Action),
                    if
                        LearnTasksU =/= [] orelse MentorTasksU =/= [] orelse TaixueTasksU =/= [] ->
                            FinNumN = case TaixueTasksU of
                                [] -> FinNum;
                                _ ->
                                    FinishNum = get_task_list_finish_num(TaixueTasksN),
                                    if
                                        FinishNum > FinNum ->
                                            Conf = conf_mentor_taixue_task_award:get(FinishNum, Lv),
                                            case Conf of
                                                #{mentor_award := MentorAward, tudi_award := TudiAward} ->
                                                    svr_mail:sys2p(MentorID, ?MENTOR_TAIXUE_MAIL_TEMPLATE, [Name, FinishNum], MentorAward, ?OPT_MENTOR_TAIXUE_TASK),
                                                    svr_mail:sys2p(RoleID, ?TUDI_TAIXUE_MAIL_TEMPLATE, [MentorName, FinishNum], TudiAward, ?OPT_MENTOR_TAIXUE_TASK);
                                                undefined -> skip
                                            end;
                                        true -> skip
                                    end,
                                    FinishNum
                            end,
                            AddMark = case LearnTasksU of
                                [] -> 0;
                                _ ->
                                    get_add_mark_by_task_list(LearnTasksU)
                            end,
                            MentorTudiN = MentorTudi#mentor_tudi{mark = OldMark + AddMark, fin_num = FinNumN, learn_tasks = LearnTasksN, mentor_tasks = MentorTasksN, taixue_tasks = TaixueTasksN},
                            [begin
                                {_, TudiInfo} = convert_tudi_to_client_info(RID =:= MentorID, MentorTudiN),
                                router_542:send_tudiinfo_list_update([RID], [TudiInfo])
                            end || RID <- [RoleID, MentorID]],
                            TudiListN = lists:keystore(RoleID, #mentor_tudi.role_id, TudiList, MentorTudiN),
                            svr_mentor:update_person(MentorPerson#mentor_person{tudi_list = TudiListN});
                        true -> skip
                    end;
                undefined -> skip
            end;
        undefined -> skip
    end.

%%-------------------------lib_role回调----------------------------------
%% 初始化
init(PS) ->
    init_role_db_data(PS#role_state.id).

%% 下线保存
save(PS) ->
    restore_mentor_data(PS),
    RoleData = get_role_data(PS#role_state.id),
    #role_mentor{updated = Updated} = RoleData,
    ?iif(Updated, save_role_db_data(PS#role_state.id, RoleData), skip).

%% 登录后逻辑
role_login(#role_state{id = RoleID} = PS) ->
    %% 检查刷新任务列表
    CurTime = time:unixtime(),
    TodayZeroTime = time:unixdate(),
    {MonZeroTime, _} = time:get_week_unixtime(),
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    RoleMentorN = case MentorPerson of
        #mentor_person{tudi_list = TudiList} ->
            MentorTudi = util:list_find(RoleID, #mentor_tudi.role_id, TudiList, undefined),
            case MentorTudi of
                #mentor_tudi{type = Type, award_taken_mentor = TakenMentor, award_taken_tudi = TakenTudi, mentor_tasks = MentorTasks,
                    taixue_tasks = TaixueTasks, last_mentor_time = LastMentorTime, last_taixue_time = LastTaixueTime} ->
                    {MentorTasksN, LastMentorTimeN, TakenMentorN, TakenTudiN} =
                        if
                            LastMentorTime < TodayZeroTime ->
                                {[], CurTime, 0, 0};
                            true ->
                                {MentorTasks, LastMentorTime, TakenMentor, TakenTudi}
                        end,
                    {TaixueTasksN, LastTaixueTimeN} = if
                        LastTaixueTime < MonZeroTime andalso Type =:= ?TUDI_TYPE_SENIOR ->
                            {get_rand_taixue_tasks(PS), CurTime};
                        true -> {TaixueTasks, LastTaixueTime}
                    end,
                    MentorTudiN = MentorTudi#mentor_tudi{award_taken_mentor = TakenMentorN, award_taken_tudi = TakenTudiN, mentor_tasks = MentorTasksN,
                        taixue_tasks = TaixueTasksN, last_mentor_time = LastMentorTimeN, last_taixue_time = LastTaixueTimeN},
                    TudiListN = lists:keystore(RoleID, #mentor_tudi.role_id, TudiList, MentorTudiN),
                    svr_mentor:update_person(MentorPerson#mentor_person{tudi_list = TudiListN}),
                    MentorTasksN =/= MentorTasks andalso router_542:send_mentor_task_list_update([MentorID], RoleID, true, convert_task_list(MentorTasksN)),
                    TaixueTasksN =/= TaixueTasks andalso router_542:send_taixue_task_list_update([MentorID], RoleID, true, convert_task_list(TaixueTasksN)),
                    RoleMentor;
                undefined when RoleID =/= MentorID ->
                    RoleMentor#role_mentor{mentor_id = 0};
                _ -> RoleMentor
            end;
        undefined ->
            RoleMentor#role_mentor{mentor_id = 0}
    end,
    update_role_data(RoleID, RoleMentorN),
    %% 检查称号
    if
        MentorID =/= 0 andalso RoleMentorN#role_mentor.mentor_id =:= 0 ->
            if
                MentorID =:= RoleID ->
                    [svr_title:deprive(RoleID, TitleID) || TitleID <- lists:seq(?TITLE_ID_LOW_MENTOR, ?TITLE_ID_HIGH_MENTOR)];
                true ->
                    [svr_title:deprive(RoleID, TitleID) || TitleID <- [?TITLE_ID_NORMAL_TUDI, ?TITLE_ID_SENIOR_TUDI]]
            end;
        MentorID =:= 0 ->
            [lib_role_title:is_title_exist(PS, TID) andalso svr_title:deprive(RoleID, TID) || TID <- lists:seq(?TITLE_ID_LOW_MENTOR, ?TITLE_ID_SENIOR_TUDI)];
        true -> skip
    end.

%%--------------------------接口调用---------------------------------------
info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    router_542:send_mentor_info(PS, RoleMentor, MentorPerson),
    ok.

%% 发起拜师请求
mentor_begin(PS) ->
    #role_state{id = RoleID, name = Name, level = MentorLv, team_id = TeamID} = PS,
    #{confirm_cd1 := ConfirmCD, open_lv := OpenLv, tudi_num := TudiNum, team_num := TeamNum, mentor_lv := MentorLvNeed, npc_pos := {NpcScene, NpcX, NpcY}} = conf_mentor_base:get(),
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_TEAM});
        ConfData -> ConfData
    end,
    MemNum = length(Members),
    MemNum =:= TeamNum orelse erlang:throw({error, ?RC_MENTOR_INVALID_MEM_NUM}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    [begin
        MemName = lib_cache:get_role_name(MemID),
        lib_role:is_online(MemID) orelse erlang:throw({error, ?RC_MENTOR_MEM_OFFLINE, [MemName]}),
        if
            MemID =:= RoleID ->
                {_, Reply} = is_in_range(PS, NpcScene, NpcX, NpcY, ?MENTOR_NPC_RANGE),
                Reply orelse erlang:throw({error, ?RC_MENTOR_MEM_FAR_FROM_NPC, [MemName]});
            true ->
                lib_role:apply_call2(MemID, {?MODULE, is_in_range, [NpcScene, NpcX, NpcY, ?MENTOR_NPC_RANGE]}) orelse erlang:throw({error, ?RC_MENTOR_MEM_FAR_FROM_NPC, [MemName]})
        end,
        FriendList = lib_friend:get_friend_id_list(MemID),
        [begin
            TmpName = lib_cache:get_role_name(Rid),
            lists:member(Rid, FriendList) orelse erlang:throw({error, ?RC_MENTOR_NOT_FRIENDS, [MemName, TmpName]})
        end || Rid <- Members, Rid =/= MemID]
    end || MemID <- Members],
    [TudiID] = lists:delete(Leader, Members),
    #{level := TudiLv, name := TudiName} = lib_cache:get_role_base(TudiID),
    MentorLv >= MentorLvNeed orelse erlang:throw({error, ?RC_MENTOR_LV_INVALID, [?STR(MentorLvNeed)]}),
    TudiLv >= OpenLv orelse erlang:throw({error, ?RC_MENTOR_TUDI_LV_INVALID, [?STR(OpenLv)]}),
    #{mentor_lv := MentorLvGap} = conf_mentor_lv_gap:get(TudiLv),
    MentorLv - TudiLv >= MentorLvGap orelse erlang:throw({error, ?RC_MENTOR_LV_GAP_INVALID}),
    MyRoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = MyRoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{role_id = MID, tudi_list = TudiList} ->
            RoleID =:= MID orelse erlang:throw({error, ?RC_MENTOR_ALREADY_TUDI, [Name]}),
            length(TudiList) < TudiNum orelse erlang:throw({error, ?RC_MENTOR_OVER_TUDI_NUM, [Name]});
        undefined -> skip
    end,
    not lib_role:apply_call2(TudiID, {?MODULE, is_in_mentor_relation, [0]}) orelse erlang:throw({error, ?RC_MENTOR_ALREADY_RELATION, [TudiName]}),
    %% 判断结婚关系
    not lib_marriage:is_married(RoleID, TudiID) orelse erlang:throw({error, ?RC_MENTOR_CANT_MARRY}),
    %% 判断结拜关系
    not lib_sworn:is_sworn(RoleID, TudiID) orelse erlang:throw({error, ?RC_MENTOR_CANT_SWORN}),

    svr_mentor:confirm_start(?CONFIRM_TYPE_BEGIN_MENTOR, TeamID, ?confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => [TudiID], mentor_id => RoleID, tudi_id => TudiID}),
    router_542:send_begin_mentor_confirm_ui(TudiID, Name),
    ?ERROR_TOC(RoleID, ?RC_MENTOR_BEGIN_SUCC),
    ok.

%% 确认结拜
begin_confirm(PS, Choice) ->
    #role_state{team_id = TeamID} = PS,
    make_confirm(PS, ?CONFIRM_TYPE_BEGIN_MENTOR, TeamID, Choice),
    ok.

%% 回答问卷
answer_quiz(PS, Type, QuizList) ->
    #{open_lv := OpenLv, mentor_lv := MentorLv} = conf_mentor_base:get(),
    #role_state{id = RoleID, level = Lv} = PS,
    RoleMentor = get_role_data(RoleID),
    length(QuizList) =:= ?MENTOR_QUIZ_NUM orelse erlang:throw({error, ?RC_MENTOR_INVALID_QUIZ_NUM}),
    RoleMentorN = case Type of
        ?QUIZ_TYPE_MENTOR ->
            Lv >= MentorLv orelse erlang:throw({error, ?RC_MENTOR_LV_INVALID, [?STR(MentorLv)]}),
            RoleMentor#role_mentor{mentor_quiz_list = QuizList};
        ?QUIZ_TYPE_TUDI ->
            Lv >= OpenLv orelse erlang:throw({error, ?RC_MENTOR_TUDI_LV_INVALID, [?STR(OpenLv)]}),
            RoleMentor#role_mentor{tudi_quiz_list = QuizList};
        _ -> RoleMentor
    end,
    update_role_data(RoleID, RoleMentorN),
    ok.

%% 师父报名
register_mentor(PS, Reg) ->
    #{mentor_lv := MentorLvNeed} = conf_mentor_base:get(),
    CurTime = time:unixdate(),
    #role_state{id = RoleID, name = MentorName, level = Lv, career = MentorCareer, personal = #{icon := MentorIcon, frame := MentorFrame}} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID, registered = Registered, morality = Morality, mentor_lv = MentorLv, mentor_quiz_list = QuizList} = RoleMentor,
    Lv >= MentorLvNeed orelse erlang:throw({error, ?RC_MENTOR_LV_INVALID, [?STR(MentorLvNeed)]}),
    case Reg of
        ?MENTOR_REGISTERED ->
            Registered =/= ?MENTOR_REGISTERED orelse erlang:throw({error, ?RC_MENTOR_ALREADY_REGISTERED});
        _ -> Registered =:= ?MENTOR_REGISTERED orelse erlang:throw({error, ?RC_MENTOR_NOT_REGISTERED})
    end,
    MentorPerson = case svr_mentor:get_person(MentorID) of
        undefined ->
            #mentor_person{
                role_id = RoleID,
                name = MentorName,
                lv = Lv,
                career = MentorCareer,
                icon = MentorIcon,
                frame = MentorFrame,
                morality = Morality,
                mentor_lv = ?iif(MentorLv =/= 0, MentorLv, 1),
                quiz_list = QuizList,
                reg = Reg,
                last_update_time = CurTime
            };
        #mentor_person{role_id = MentorIDN} = Person ->
            RoleID =:= MentorIDN orelse erlang:throw({error, ?RC_MENTOR_ALREADY_TUDI_CANT_REGISTER}),
            Person#mentor_person{
                quiz_list = QuizList,
                reg = Reg,
                last_update_time = CurTime
            }
    end,
    if
        Reg =/= ?MENTOR_REGISTERED andalso length(MentorPerson#mentor_person.tudi_list) =:= 0 ->
            svr_mentor:delete_person(MentorID);
        true -> svr_mentor:update_person(MentorPerson)
    end,
    update_role_data(RoleID, RoleMentor#role_mentor{registered = Reg}),
    {ok, Reg}.

%% 查找师父
find_mentor(PS) ->
    #{open_lv := OpenLv} = conf_mentor_base:get(),
    #role_state{id = RoleID, level = Lv} = PS,
    Lv >= OpenLv orelse erlang:throw({error, ?RC_MENTOR_TUDI_LV_INVALID, [?STR(OpenLv)]}),
    util:check_action_limit({?MODULE, find_mentor}, ?FIND_MENTOR_CDTIME),
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID, tudi_quiz_list = QuizList} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    MentorID =:= 0 orelse MentorPerson =:= undefined orelse erlang:throw({error, ?RC_MENTOR_DONE_RELATION}),
    RandPersonList = svr_mentor:get_rand_persons(RoleID, Lv, ?SEARCH_MENTOR_NUM, QuizList),
    MentorList = [convert_mentor_to_client_info(MPerson) || MPerson <- RandPersonList],
    {ok, MentorList}.

%% 发送拜师贴
send_post(PS, TargetRoleID, Enounce) ->
    #role_state{id = RoleID, server_num = SvrNum, combat_power = Fight} = PS,
    util:check_action_limit({?MODULE, send_post}, ?SEND_POST_CDTIME),
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID, tudi_quiz_list = TudiList} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    MentorID =:= 0 orelse MentorPerson =:= undefined orelse erlang:throw({error, ?RC_MENTOR_DONE_RELATION}),
    #{enounce_limit := Limit} = conf_mentor_base:get(),
    validate_msg(Enounce, 1, Limit),
    TargetMentorPerson = svr_mentor:get_person(TargetRoleID),
    case TargetMentorPerson of
        undefined -> erlang:throw({error, ?RC_MENTOR_TARGET_NOT_MENTOR});
        #mentor_person{reg = Reg} ->
            Reg =:= ?MENTOR_REGISTERED orelse erlang:throw({error, ?RC_MENTOR_TARGET_NOT_REGISTERED})
    end,
    {_, Gender} = util:list_find(1, 1, TudiList, {1, 1}),
    {_, Time} = util:list_find(3, 1, TudiList, {3, 1}),
    {_, Type} = util:list_find(5, 1, TudiList, {5, 1}),
    Extra = io_lib:format("~w|~w|~w|~w|~w|~s", [?SEND_POST_TEMPLATE_ID, Gender, Time, Type, Fight, Enounce]),
    lib_role_sworn:greet_send_msg(PS, {TargetRoleID, SvrNum}, "", Extra),
    ok.

%% 布置师门任务
set_tasks(PS, TudiId, TaskIdList) ->
    CurTime = time:unixtime(),
    ZeroTime = time:unixdate(),
    #role_state{id = RoleID} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    TudiName = lib_cache:get_role_name(TudiId),
    lib_role:is_online(TudiId) orelse erlang:throw({error, ?RC_MENTOR_MEM_OFFLINE, [TudiName]}),
    #{mentor_task := {_, ChosenNum}} = conf_mentor_base:get(),
    length(TaskIdList) =:= ChosenNum orelse erlang:throw({error, ?RC_MENTOR_TASK_NUM_INVALID}),
    MentorTaskIdList = conf_mentor_task:get_ids_by_type(?TASK_TYPE_MENTOR),
    Func = fun(TaskId) ->
        lists:member(TaskId, MentorTaskIdList)
    end,
    lists:all(Func, TaskIdList) orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    MentorTasksNew = lib_role:apply_call2(TudiId, {?MODULE, refresh_mentor_tasks, [TaskIdList]}),
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_RELATION});
        #mentor_person{role_id = MID, tudi_list = TudiList} ->
            RoleID =:= MID orelse erlang:throw({error, ?RC_MENTOR_YOU_NOT_MENTOR}),
            lists:keymember(TudiId, #mentor_tudi.role_id, TudiList) orelse erlang:throw({error, ?RC_MENTOR_TUDI_NOT_EXIST}),
            Tudi = util:list_find(TudiId, #mentor_tudi.role_id, TudiList, #mentor_tudi{role_id = TudiId}),
            #mentor_tudi{type = Type, last_mentor_time = LastRefreshTime} = Tudi,
            Type =/= ?TUDI_TYPE_SENIOR orelse erlang:throw({error, ?RC_MENTOR_ALREADY_SENIOR}),
            LastRefreshTime < ZeroTime orelse erlang:throw({error, ?RC_MENTOR_ALREADY_SET_TASKS}),
            TudiListN = lists:keystore(TudiId, #mentor_tudi.role_id, TudiList, Tudi#mentor_tudi{last_mentor_time = CurTime, mentor_tasks = MentorTasksNew}),
            svr_mentor:update_person(MentorPerson#mentor_person{tudi_list = TudiListN}),
            router_542:send_mentor_task_list_update([RoleID, TudiId], TudiId, true, convert_task_list(MentorTasksNew))
    end,
    ok.

%% 对师父作出评价
comment(PS, Comment) ->
    Conf = conf_mentor_comment_award:get(Comment),
    Conf =/= undefined orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #role_state{id = RoleID} = PS,
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    make_confirm(PS, ?CONFIRM_TYPE_COMMENT, MentorID, ?CONFIRM_CHOICE_AGREE, [Comment]),
    ok.

%% 师父让徒弟出师
finish_learning(PS, TargetRoleID) ->
    #{senior_lv := SeniorLv} = conf_mentor_base:get(),
    #role_state{id = RoleID} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    #{level := TudiLv, name := TudiName} = lib_cache:get_role_base(TargetRoleID),
    case MentorPerson of
        #mentor_person{role_id = MID, tudi_list = TmpList} ->
            RoleID =:= MID orelse erlang:throw({error, ?RC_MENTOR_YOU_NOT_MENTOR}),
            lists:keymember(TargetRoleID, #mentor_tudi.role_id, TmpList) orelse erlang:throw({error, ?RC_MENTOR_TUDI_NOT_EXIST}),
            TudiLv >= SeniorLv orelse erlang:throw({error, ?RC_MENTOR_TUDI_NOT_REACH_SENIOR_LV}),
            lib_role:is_online(TargetRoleID) orelse erlang:throw({error, ?RC_MENTOR_MEM_OFFLINE, [TudiName]}),
            lib_role:mod_info(TargetRoleID, ?MODULE, 'pop_up_finish_comment');
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_RELATION})
    end,
    ok.

%% 亲传弟子选择确认
senior_tudi_confirm(PS, Choice) ->
    #role_state{id = RoleID} = PS,
    #role_mentor{last_mentor_id = LastMentorID} = get_role_data(RoleID),
    make_confirm(PS, ?CONFIRM_TYPE_FINISH_MENTOR, LastMentorID, Choice),
    ok.

%% 开始亲传练功
begin_practice(PS) ->
    #{during_time := DuringTime} = conf_guild_wine_practice:get(),
    #{tudi_practice_num := PracNum, team_num := TeamNum, npc_pos := {NpcScene, NpcX, NpcY}, practice_pos := {PracScene, CenterX, MinY, MaxY}} = conf_mentor_base:get(),
    #role_state{id = RoleID, team_id = TeamID, stat = CurStat} = PS,
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_TEAM});
        ConfData -> ConfData
    end,
    MemNum = length(Members),
    MemNum =:= TeamNum orelse erlang:throw({error, ?RC_MENTOR_INVALID_MEM_NUM}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    [TudiId] = lists:delete(Leader, Members),
    TudiName = lib_cache:get_role_name(TudiId),
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{role_id = MID, tudi_list = TudiList} ->
            RoleID =:= MID orelse erlang:throw({error, ?RC_MENTOR_YOU_NOT_MENTOR}),
            MentorTudi = util:list_find(TudiId, #mentor_tudi.role_id, TudiList, undefined),
            case MentorTudi of
                #mentor_tudi{type = Type} ->
                    Type =:= ?TUDI_TYPE_SENIOR orelse erlang:throw({error, ?RC_MENTOR_NOT_SENIOR_TUDI, [TudiName]});
                undefined -> erlang:throw({error, ?RC_MENTOR_MEM_NOT_YOUR_TUDI})
            end;
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_RELATION})
    end,
    [begin
        MemName = lib_cache:get_role_name(MemID),
        lib_role:is_online(MemID) orelse erlang:throw({error, ?RC_MENTOR_MEM_OFFLINE, [MemName]}),
        if
            MemID =:= RoleID ->
                {_, Reply} = is_in_range(PS, NpcScene, NpcX, NpcY, ?MENTOR_NPC_RANGE),
                Reply orelse erlang:throw({error, ?RC_MENTOR_MEM_FAR_FROM_NPC, [MemName]});
            true ->
                lib_role:apply_call2(MemID, {?MODULE, is_in_range, [NpcScene, NpcX, NpcY, ?MENTOR_NPC_RANGE]}) orelse erlang:throw({error, ?RC_MENTOR_MEM_FAR_FROM_NPC, [MemName]})
        end
    end || MemID <- Members],
    TudiPracNum = lib_role:apply_call2(TudiId, {?MODULE, get_daily_practice_num, []}),
    TudiPracNum < PracNum orelse erlang:throw({error, ?RC_MENTOR_OVER_DAILY_PRACTICE}),
    not bit_map:is_set(?SPEC_STAT_BIT_SIT, CurStat) orelse erlang:throw({error, ?RC_GUILD_PRACTICE_ALREADY}),

    %% 激活练功
    EndTime = trunc(time:unixtime() + DuringTime / 1000),
    svr_team_mgr:info_team(TeamID, {'mod', ?MODULE, {'activate_practice', CenterX, 0, EndTime}}),
    RandPosY = util:rand(MinY, MaxY),
    Func = fun(MemRoleID, OffSet) ->
        %% 传送队员到练功区域
        lib_scene_api:change_scene_async(MemRoleID, PracScene, ?DYN_LINE_ID, CenterX + OffSet, RandPosY),
        OffSet + 4
    end,
    lists:foldl(Func, -2, Members),
    router_542:send_begin_practice_ret(Members, TudiId, TudiPracNum + 1),
    ok.

%% 把徒弟逐出师门
kick_off_tudi(PS, TargetRoleID, Reason) ->
    Conf = conf_mentor_kick_reason:get(Reason),
    Conf =/= undefined orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{desc := Desc} = Conf,
    #role_state{id = RoleID, name = MentorName} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    {TudiList, MoralityN, MentorLvN, Reg} = case MentorPerson of
        #mentor_person{role_id = MID, tudi_list = TmpList, morality = Morality, mentor_lv = MentorLv, reg = RegN} ->
            RoleID =:= MID orelse erlang:throw({error, ?RC_MENTOR_YOU_NOT_MENTOR}),
            lists:keymember(TargetRoleID, #mentor_tudi.role_id, TmpList) orelse erlang:throw({error, ?RC_MENTOR_TUDI_NOT_EXIST}),
            {TmpList, Morality, MentorLv, RegN};
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_RELATION}),
            {[], 0, 0, 0}
    end,
    TudiName = lib_cache:get_role_name(TargetRoleID),
    MentorTudi = util:list_find(TargetRoleID, #mentor_tudi.role_id, TudiList, #mentor_tudi{role_id = TargetRoleID}),
    TudiListN = lists:keydelete(TargetRoleID, #mentor_tudi.role_id, TudiList),
    TudiListM = tudi_leave_mentor(MentorTudi, MentorID, TudiListN, MoralityN, MentorLvN),
    if
        length(TudiListN) > 0 orelse Reg =:= ?MENTOR_REGISTERED ->
            svr_mentor:update_person(MentorPerson#mentor_person{tudi_list = TudiListM});
        true ->%% 删除师父数据
            svr_mentor:delete_person(MentorID)
    end,
    svr_mail:sys2p(MentorID, ?MENTOR_KICKOFF_MAIL_TEMPLATE, [Desc, TudiName], [], ?OPT_MENTOR_KICK_OFF_TUDI),
    svr_mail:sys2p(TargetRoleID, ?TUDI_KICKOFF_MAIL_TEMPLATE, [Desc, MentorName], [], ?OPT_MENTOR_KICK_OFF_TUDI),
    ok.

%% 叛离师门
say_goodbye(PS) ->
    #role_state{id = RoleID, name = TudiName} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    {TudiList, MoralityN, MentorLvN, Reg} = case MentorPerson of
        #mentor_person{tudi_list = TmpList, morality = Morality, mentor_lv = MentorLv, reg = RegN} ->
            lists:keymember(RoleID, #mentor_tudi.role_id, TmpList) orelse erlang:throw({error, ?RC_MENTOR_YOU_NOT_TUDI}),
            {TmpList, Morality, MentorLv, RegN};
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_RELATION}),
            {[], 0, 0, 0}
    end,
    MentorName = lib_cache:get_role_name(MentorID),
    MentorTudi = util:list_find(RoleID, #mentor_tudi.role_id, TudiList, #mentor_tudi{role_id = RoleID}),
    TudiListN = lists:keydelete(RoleID, #mentor_tudi.role_id, TudiList),
    TudiListM = tudi_leave_mentor(MentorTudi, MentorID, TudiListN, MoralityN, MentorLvN),
    if
        length(TudiListN) > 0 orelse Reg =:= ?MENTOR_REGISTERED ->
            svr_mentor:update_person(MentorPerson#mentor_person{tudi_list = TudiListM});
        true ->%% 删除师父数据
            svr_mentor:delete_person(MentorID)
    end,
    svr_mail:sys2p(MentorID, ?MENTOR_BETRAY_MAIL_TEMPLATE, [TudiName], [], ?OPT_MENTOR_BETRAY),
    svr_mail:sys2p(RoleID, ?TUDI_BETRAY_MAIL_TEMPLATE, [MentorName], [], ?OPT_MENTOR_BETRAY),
    ok.

%% 领取师门任务奖励
take_award(PS, TargetRoleID) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{tudi_list = TmpList} ->
            MentorTudi = util:list_find(TargetRoleID, #mentor_tudi.role_id, TmpList, undefined),
            case MentorTudi of
                #mentor_tudi{mentor_tasks = MentorTasks, award_taken_mentor = TakenMentor, award_taken_tudi = TakenTudi} ->
                    FinishNum = get_task_list_finish_num(MentorTasks),
                    FinishNum =:= length(MentorTasks) orelse erlang:throw({error, ?RC_MENTOR_TASKS_NOT_FINISHED}),
                    #{mentor_award := MentorAward, tudi_award := TudiAward} = conf_mentor_task_award:get(Lv),
                    {TakenMentorN, TakenTudiN} = if
                        RoleID =:= MentorID ->
                            TakenMentor =:= 0 orelse erlang:throw({error, ?RC_MENTOR_AWARD_TAKEN}),
                            lib_drop_api:give_drop_asyn(RoleID, MentorAward, ?OPT_MENTOR_TASK),
                            {1, TakenTudi};
                        RoleID =:= TargetRoleID ->
                            TakenTudi =:= 0 orelse erlang:throw({error, ?RC_MENTOR_AWARD_TAKEN}),
                            lib_drop_api:give_drop_asyn(RoleID, TudiAward, ?OPT_MENTOR_TASK),
                            {TakenMentor, 1};
                        true ->
                            erlang:throw({error, ?RC_MENTOR_CANT_TAKE_COLLEAGUE_AWARD}),
                            {TakenMentor, TakenTudi}
                    end,
                    TudiList = lists:keystore(TargetRoleID, #mentor_tudi.role_id, TmpList, MentorTudi#mentor_tudi{award_taken_mentor = TakenMentorN, award_taken_tudi = TakenTudiN}),
                    svr_mentor:update_person(MentorPerson#mentor_person{tudi_list = TudiList}),
                    router_542:send_task_award_taken_ret([RoleID, TargetRoleID], TargetRoleID, 1);
                undefined -> erlang:throw({error, ?RC_MENTOR_TUDI_NOT_EXIST})
            end;
        undefined -> erlang:throw({error, ?RC_MENTOR_NO_RELATION})
    end,
    ok.

%%------------------------------------public-----------------------------------------------------
%% @doc 把师父存储结构转化为客户端结构
convert_mentor_to_client_info(MentorPerson) when is_record(MentorPerson, mentor_person) ->
    #mentor_person{role_id = RID, morality = Morality} = MentorPerson,
    #{name := Name, career := Career, gender := Gender, level := Level, frame := Frame, icon := Icon} = lib_cache:get_role_view(RID),
    #{scene := Scene, offline := OffLine} = lib_cache:get_role_base(RID),
    #mentor_base_info{
        role_id = RID,
        name = Name,
        lv = Level,
        career = Career,
        gender = Gender,
        icon = Icon,
        frame = Frame,
        offline_time = OffLine,
        scene = Scene,
        morality = Morality
    };
convert_mentor_to_client_info(_) ->
    undefined.

%% @doc 把徒弟存储结构转化为客户端结构
%% IsMentor, 要发给的对象是否师父
convert_tudi_to_client_info(IsMentor, MentorTudi) when is_record(MentorTudi, mentor_tudi), MentorTudi#mentor_tudi.role_id =/= 0 ->
    #mentor_tudi{
        role_id = RID,
        type = Type,
        senior = Senior,
        mark = Mark,
        begin_time = BeginTime,
        comment = Comment,
        practice_num = PracticeNum,
        learn_tasks = LearnTasks,
        mentor_tasks = MentorTasks,
        taixue_tasks = TaixueTasks,
        award_taken_mentor = TakenMentor,
        award_taken_tudi = TakenTudi
    } = MentorTudi,
    #{name := Name, career := Career, gender := Gender, level := Level, frame := Frame, icon := Icon} = lib_cache:get_role_view(RID),
    #{scene := Scene, offline := OffLine} = lib_cache:get_role_base(RID),
    BaseInfo = #mentor_base_info{
        role_id = RID,
        name = Name,
        senior = Senior,
        lv = Level,
        career = Career,
        gender = Gender,
        icon = Icon,
        frame = Frame,
        offline_time = OffLine,
        scene = Scene
    },
    TudiInfo = #mentor_tudi_info{
        role_id = RID,
        type = Type,
        senior = Senior,
        mark = Mark,
        practice_num = PracticeNum,
        begin_time = BeginTime,
        comment = Comment,
        learn_tasks = convert_task_list(LearnTasks),
        mentor_tasks = convert_task_list(MentorTasks),
        taixue_tasks = convert_task_list(TaixueTasks),
        award_taken = ?iif(IsMentor, TakenMentor, TakenTudi)
    },
    {BaseInfo, TudiInfo};
convert_tudi_to_client_info(_, _) ->
    {#mentor_base_info{}, #mentor_tudi_info{}}.

%% @doc 把任务列表转换成客户端可读
convert_task_list(TaskList) when is_list(TaskList) ->
    [{ID, Value} || #{id := ID, masks := [#{current := Value} | _]} <- TaskList];
convert_task_list(_) ->
    [].

%% @doc 是否传功中
is_sitting(RoleID) ->
    #role_mentor{sitting = Sitting} = get_role_data(RoleID),
    Sitting.

%% @doc 终止传功
stop_sitting(RoleID, Times) ->
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    update_tudi_fields(MentorID, RoleID, [{#mentor_tudi.practice_num, Times}]),
    update_role_data(RoleID, RoleMentor#role_mentor{sitting = false}),
    RoleID =/= MentorID andalso ?TASK_EVENT(RoleID, 'mentor_practice').

%% @doc 判断是否师父
is_mentor(RoleID) ->
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    MentorPerson = svr_mentor:get_person(MentorID),
    MentorPerson =/= undefined andalso RoleID =:= MentorID.

%% @doc 获取师父等级
get_mentor_lv(RoleID) ->
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{lv = MentorLv} -> MentorLv;
        undefined -> 0
    end.

%% @doc 获取师徒称号额外参数
get_mentor_title_extra(RoleID) ->
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{name = MentorName} ->
            if
                RoleID =/= MentorID -> MentorName;
                true -> ""
            end;
        undefined -> ""
    end.

%% @doc 是否正在和师父一起组队
is_team_with_mentor(#role_state{id = RoleID, team_id = TeamID} = _PS) when TeamID > 0 ->
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    #{members := Members} = case lib_team:get_team_info(TeamID) of
        undefined -> #{members => []};
        TeamInfo -> TeamInfo
    end,
    RoleID =/= MentorID andalso lists:member(MentorID, Members);
is_team_with_mentor(_PS) ->
    false.

%%------------------------------------private----------------------------------------------------
%% 确认框作出选择确认
make_confirm(PS, Type, Key, Choice) ->
    make_confirm(PS, Type, Key, Choice, []).

make_confirm(PS, Type, Key, Choice, Args) ->
    #role_state{id = RoleID, name = RoleName} = PS,
    ConfirmData = svr_mentor:get_confirm_data(Type, Key),
    #{members := Members, mentor_id := MentorID, tudi_id := TudiID, finish := Finish, agree_list := AgreeList} = ConfirmData,
    not lists:member(RoleID, AgreeList) orelse erlang:throw({error, ?RC_MENTOR_ALREADY_CONFIRM}),
    lists:member(RoleID, Members) orelse erlang:throw({error, ?RC_MENTOR_CANT_CONFIRM}),

    case Choice of
        ?CONFIRM_CHOICE_AGREE ->
            AgreeListN = [RoleID | AgreeList],
            if
                length(Members) =:= length(AgreeListN) ->
                    confirm_execute(PS, Type, MentorID, TudiID, Finish, Args),
                    svr_mentor:clear_confirm_data(Type, Key);
                true ->
                    svr_mentor:confirm_start(Type, Key, ConfirmData#{agree_list => AgreeListN})
            end;
        _ ->%% 反对
            svr_mentor:clear_confirm_data(Type, Key),
            router_542:send_confirm_cancel_msg([MentorID, TudiID], Type, get_cancel_retcode(Type), [RoleName])
    end.

%% 确认窗口执行逻辑
confirm_execute(PS, Type, MentorID, TudiID, Finish, Args) ->
    CurTime = time:unixtime(),
    #{senior_lv := SeniorLv, tudi_finish_award := TudiFinishAward, confirm_cd1 := ConfirmCD} = conf_mentor_base:get(),
    #role_state{id = RoleID} = PS,
    #{name := MentorName, career := MentorCareer, level := MentorLevel} = lib_cache:get_role_base(MentorID),
    #{name := TudiName, level := TudiLevel} = lib_cache:get_role_base(TudiID),
    #{frame := MentorFrame, icon := MentorIcon} = lib_cache:get_role_view(MentorID),
    TaskIdList = ?iif(TudiLevel < SeniorLv, conf_mentor_task:get_ids_by_type(?TASK_TYPE_LEARN), []),

    if
        Type =:= ?CONFIRM_TYPE_BEGIN_MENTOR orelse Type =:= ?CONFIRM_TYPE_FINISH_MENTOR ->
            %% 发送拜师传闻
            Type =:= ?CONFIRM_TYPE_BEGIN_MENTOR andalso svr_rumor:publish(world, ?RUMOR_MENTOR_BEGIN, [MentorName, TudiName]),
            {PracticeNum, MentorTasks, TaixueTasks, TakeOwn, LastMentorTime, LastTaixueTime, TaskList} =
                if
                    TudiID =:= RoleID ->
                        {ok, Num} = get_daily_practice_num(PS),
                        {ok, {MentorTasksN, TaixueTasksN, TakeOwnN, LastMentorTimeN, LastTaixueTimeN}} = get_tudi_old_data(PS),
                        {ok, TaskListN} = refresh_mentor_tasks(PS, TaskIdList),
                        {Num, MentorTasksN, TaixueTasksN, TakeOwnN, LastMentorTimeN, LastTaixueTimeN, TaskListN};
                    true ->
                        Num = lib_role:apply_call2(TudiID, {?MODULE, get_daily_practice_num, []}),
                        TaskListN = lib_role:apply_call2(TudiID, {?MODULE, refresh_mentor_tasks, [TaskIdList]}),
                        {MentorTasksN, TaixueTasksN, TakeOwnN, LastMentorTimeN, LastTaixueTimeN} = lib_role:apply_call2(TudiID, {?MODULE, get_tudi_old_data, []}),
                        {Num, MentorTasksN, TaixueTasksN, TakeOwnN, LastMentorTimeN, LastTaixueTimeN, TaskListN}
                end,
            {MoralityN, MentorLvN, TakenTudi} = if
                MentorID =:= RoleID ->
                    {ok, {Morality, MentorLv, Taken}} = get_mentor_old_data(PS, TudiID),
                    {Morality, MentorLv, Taken};
                true ->
                    lib_role:apply_call2(MentorID, {?MODULE, get_mentor_old_data, [TudiID]})
            end,
            MentorPerson = case svr_mentor:get_person(MentorID) of
                undefined ->
                    #mentor_person{
                        role_id = MentorID,
                        name = MentorName,
                        lv = MentorLevel,
                        career = MentorCareer,
                        icon = MentorIcon,
                        frame = MentorFrame,
                        morality = MoralityN,
                        mentor_lv = ?iif(MentorLvN =:= 0, 1, MentorLvN),
                        last_update_time = CurTime
                    };
                Person -> Person
            end,
            #mentor_person{tudi_list = TudiList} = MentorPerson,
            MentorTudi = #mentor_tudi{
                role_id = TudiID,
                type = ?iif(TudiLevel >= SeniorLv, ?TUDI_TYPE_SENIOR, ?TUDI_TYPE_NORMAL),
                senior = length(TudiList) + 1,
                mark = get_add_mark_by_task_list(TaskList),
                begin_time = CurTime,
                practice_num = PracticeNum,
                learn_tasks = TaskList,
                mentor_tasks = MentorTasks,
                taixue_tasks = TaixueTasks,
                award_taken_mentor = ?iif(MentorTasks =:= [], 0, TakenTudi),
                award_taken_tudi = TakeOwn,
                last_mentor_time = LastMentorTime,
                last_taixue_time = LastTaixueTime
            },
            TudiListN = lists:keystore(TudiID, #mentor_tudi.role_id, TudiList, MentorTudi),
            MentorPersonN = MentorPerson#mentor_person{tudi_list = TudiListN},
            svr_mentor:update_person(MentorPersonN),
            TudiIDList = [TID || #mentor_tudi{role_id = TID} <- TudiList],
            if
                TudiIDList =/= [] ->
                    {BaseInfo, _} = convert_tudi_to_client_info(false, MentorTudi),
                    router_542:send_baseinfo_list_update(TudiIDList, [BaseInfo]);
                true -> skip
            end,
            [lib_role:mod_info(Rid, ?MODULE, {'active_mentor', MentorPersonN}) || Rid <- [MentorID, TudiID]],
            %% 增加师徒关系
            lib_mentor:add_relation(MentorID, MentorID),
            lib_mentor:add_relation(TudiID, MentorID),
            %% 师徒群
            FriendInfo = lib_friend:get_role_friend(MentorID),
            #role_friend{group_id_list = GroupIdList} = FriendInfo,
            Func = fun(GroupId) ->
                FriendGroup = lib_friend:get_group(GroupId),
                FriendGroup#group.type =:= ?GROUP_TYPE_PRENTICE
            end,
            MentorGroupIdList = lists:filter(Func, GroupIdList),
            GroupId = case MentorGroupIdList of
                [] ->
                    svr_friend:create_group(MentorID, ?GROUP_TYPE_PRENTICE, config:get_string(mentor_friend_group), "");
                [Id | _] -> Id
            end,
            svr_friend:join_in_sys_group(GroupId, TudiID);
        Type =:= ?CONFIRM_TYPE_COMMENT ->
            [Comment] = Args,
            MentorPerson = svr_mentor:get_person(MentorID),
            #mentor_person{morality = Morality, mentor_lv = MentorLv, tudi_list = TudiList, reg = Reg} = MentorPerson,
            Tudi = util:list_find(TudiID, #mentor_tudi.role_id, TudiList, #mentor_tudi{role_id = TudiID}),
            TudiN = Tudi#mentor_tudi{comment = Comment},
            {TudiListN, MoralityN} = if
                Finish ->
                    %% 发放出师奖励
                    svr_mail:sys2p(TudiID, ?TUDI_FINISH_MAIL_TEMPLATE, [MentorName, TudiN#mentor_tudi.mark], TudiFinishAward, ?OPT_MENTOR_FINISH),
                    #{award := [Award1]} = conf_mentor_mark_award:get(TudiN#mentor_tudi.mark),
                    #{award := [Award2], morality_value := MoralityValue} = conf_mentor_comment_award:get(Comment),
                    svr_mail:sys2p(MentorID, ?MENTOR_FINISH_MAIL_TEMPLATE, [TudiName, TudiN#mentor_tudi.mark], [Award1, Award2], ?OPT_MENTOR_FINISH),
                    {lists:keydelete(TudiID, #mentor_tudi.role_id, TudiList), Morality + MoralityValue};
                true ->
                    {lists:keystore(TudiID, #mentor_tudi.role_id, TudiList, TudiN), Morality}
            end,
            #{morality_value := MoralityNeed} = conf_mentor_lv:get(MentorLv + 1),
            MentorLvN = ?iif(MoralityN >= MoralityNeed, MentorLv + 1, MentorLv),

            TudiListNN = if
                Finish -> %% 出师
                    TudiListM = tudi_leave_mentor(TudiN, MentorID, TudiListN, MoralityN, MentorLvN, true),

                    %% 发送出师传闻
                    svr_rumor:publish(world, ?RUMOR_MENTOR_FINISH, [TudiName, MentorName]),
                    %% 判断能否再续师徒缘
                    #{mentor_lv := MentorLvGap} = conf_mentor_lv_gap:get(TudiLevel),
                    MentorLevel - TudiLevel >= MentorLvGap andalso begin
                        svr_mentor:confirm_start(?CONFIRM_TYPE_FINISH_MENTOR, MentorID, ?confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => [MentorID, TudiID], mentor_id => MentorID, tudi_id => TudiID}),
                        router_542:send_senior_tudi_ui(MentorID, io_lib:format(config:get_string(mentor_finish_confirm), [TudiName])),
                        router_542:send_senior_tudi_ui(TudiID, io_lib:format(config:get_string(tudi_finish_confirm), [MentorName]))
                    end,
                    TudiListM;
                true ->
                    router_542:send_mentor_comment_ret([MentorID, TudiID], TudiID, Comment),
                    TudiListN
            end,
            if
                length(TudiListN) > 0 orelse Reg =:= ?MENTOR_REGISTERED ->
                    svr_mentor:update_person(MentorPerson#mentor_person{morality = MoralityN, mentor_lv = MentorLvN, tudi_list = TudiListNN});
                true ->%% 删除师父数据
                    svr_mentor:delete_person(MentorID)
            end;
        true -> skip
    end.

%% 回传师父数据或者徒弟数据到个人数据备份
restore_mentor_data(PS) ->
    #role_state{id = RoleID} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID} = RoleMentor,
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{tudi_list = TudiList, morality = Morality, mentor_lv = MentorLv} ->
            MentorTudi = util:list_find(RoleID, #mentor_tudi.role_id, TudiList, #mentor_tudi{}),
            if
                RoleID =:= MentorID ->
                    svr_mentor:save_person_to_db(MentorID),
                    store_mentor_data(PS, Morality, MentorLv, {}, false);
                MentorTudi =/= undefined ->
                    store_tudi_data(PS, MentorTudi, false);
                true -> skip
            end;
        undefined -> skip
    end.

%% 回传徒弟数据
store_tudi_data(PS, MentorTudi, Leave) ->
    #role_state{id = RoleID} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID, mentor_taken = TakenMap} = RoleMentor,
    #mentor_tudi{mentor_tasks = MentorTasks, taixue_tasks = TaixueTasks, award_taken_tudi = AwardTaken, last_mentor_time = LastMentorTime, last_taixue_time = LastTaixueTime} = MentorTudi,
    update_role_data(RoleID, RoleMentor#role_mentor{
        mentor_id = ?iif(Leave, 0, MentorID),
        mentor_tasks = MentorTasks,
        taixue_tasks = TaixueTasks,
        mentor_taken = TakenMap#{take_own => AwardTaken},
        last_mentor_time = LastMentorTime,
        last_taixue_time = LastTaixueTime,
        last_mentor_id = MentorID}).

%% 回传师父数据
store_mentor_data(PS, Morality, MentorLv, TakenTuple, Finish) ->
    #role_state{id = RoleID} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_id = MentorID, mentor_taken = TakenMap} = RoleMentor,
    #{take_tudi := TakenList} = TakenMap,
    TakenMapN = ?iif(TakenTuple =/= {}, TakenMap#{take_tudi => [TakenTuple | TakenList]}, TakenMap),
    update_role_data(RoleID, RoleMentor#role_mentor{
        mentor_id = ?iif(Finish, 0, MentorID),
        morality = Morality,
        mentor_lv = MentorLv,
        mentor_taken = TakenMapN,
        last_mentor_id = MentorID
    }).

%% 徒弟离开师父
tudi_leave_mentor(MentorTudi, MentorID, TudiList, Morality, MentorLv) ->
    tudi_leave_mentor(MentorTudi, MentorID, TudiList, Morality, MentorLv, false).

tudi_leave_mentor(MentorTudi, MentorID, TudiList, Morality, MentorLv, Finish) ->
    Func = fun(#mentor_tudi{role_id = RID} = Tudi, {Senior, IdList, AccList}) ->
        IdListN = [RID | IdList],
        AccListN = lists:keystore(RID, #mentor_tudi.role_id, AccList, Tudi#mentor_tudi{senior = Senior}),
        {Senior + 1, IdListN, AccListN}
    end,
    {_, LeftTudiIdList, TudiListN} = lists:foldl(Func, {1, [], []}, TudiList),
    #mentor_tudi{role_id = TudiID, award_taken_mentor = AwardTaken} = MentorTudi,
    lib_role:mod_info(TudiID, ?MODULE, {'store_tudi_data', MentorTudi, true, Finish}),
    router_542:send_mentor_refresh_new([TudiID], 0, 0, 0),
    FinishMentor = if
        length(LeftTudiIdList) > 0 ->
            router_542:send_mentor_refresh_new([MentorID | LeftTudiIdList], MentorID, Morality, MentorLv),
            router_542:send_del_baseinfo_update([MentorID | LeftTudiIdList], [TudiID]),
            router_542:send_del_tudiinfo_update([MentorID], [TudiID]),
            %% 刷新辈分
            FuncN = fun(MTudi, InfoAcc) ->
                {BaseInfo, _} = convert_tudi_to_client_info(false, MTudi),
                [BaseInfo | InfoAcc]
            end,
            InfoList = lists:foldl(FuncN, [], TudiListN),
            router_542:send_baseinfo_list_update([MentorID | LeftTudiIdList], InfoList),
            false;
        true ->
            router_542:send_mentor_refresh_new([MentorID], 0, 0, 0),
            true
    end,
    lib_role:mod_info(MentorID, ?MODULE, {'store_mentor_data', Morality, MentorLv, {TudiID, AwardTaken}, FinishMentor}),
    %% 去除师徒关系
    lib_mentor:remove_relation(MentorTudi#mentor_tudi.role_id),
    FinishMentor andalso lib_mentor:remove_relation(MentorID),
    %% 师徒群
    FriendInfo = lib_friend:get_role_friend(MentorID),
    #role_friend{group_id_list = GroupIdList} = FriendInfo,
    [begin
        FriendGroup = lib_friend:get_group(FriendGroupId),
        FriendGroup#group.type =:= ?GROUP_TYPE_PRENTICE andalso
            begin
                if
                    FinishMentor ->
                        svr_friend:dismiss_group(MentorID, FriendGroupId, true);
                    true ->
                        svr_friend:leave_sys_group(TudiID, FriendGroupId)
                end
            end
    end || FriendGroupId <- GroupIdList],
    TudiListN.


%% 弹出评价师父窗口(基于有师父的前提下)
pop_up_mentor_comment_ui(PS) ->
    pop_up_mentor_comment_ui(PS, false).

pop_up_mentor_comment_ui(PS, Finish) ->
    #{confirm_cd1 := ConfirmCD} = conf_mentor_base:get(),
    #role_state{id = RoleID} = PS,
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    svr_mentor:confirm_start(?CONFIRM_TYPE_COMMENT, MentorID, ?confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => [RoleID], mentor_id => MentorID, tudi_id => RoleID, finish => Finish}),
    router_542:send_mentor_comment_ui(PS).

%% 激活练功
activate_practice(PS, CenterX, CenterY, EndTime) ->
    #role_state{id = RoleID, stat = Stat} = PS,
    RoleMentor = get_role_data(RoleID),
    update_role_data(RoleID, RoleMentor#role_mentor{sitting = true}),
    Param = #state_param{
        center_x = CenterX,
        center_y = CenterY,
        end_time = EndTime
    },
    NewState = PS#role_state{stat = bit_map:set(?SPEC_STAT_BIT_SIT, Stat), stat_params = [Param]},
    NewState.

%% 更新某个徒弟数据的多个字段
update_tudi_fields(MentorID, TudiID, KeyValueList) ->
    MentorPerson = svr_mentor:get_person(MentorID),
    case MentorPerson of
        #mentor_person{tudi_list = TudiList} ->
            MentorTudi = util:list_find(TudiID, #mentor_tudi.role_id, TudiList, undefined),
            case MentorTudi of
                #mentor_tudi{} ->
                    TudiListN = lists:keystore(TudiID, #mentor_tudi.role_id, TudiList, update_tudi_fields_helper(KeyValueList, MentorTudi)),
                    svr_mentor:update_person(MentorPerson#mentor_person{tudi_list = TudiListN});
                undefined -> skip
            end;
        undefined -> skip
    end.

update_tudi_fields_helper([{K, V} | Rest], MentorTudi) ->
    update_tudi_fields_helper(Rest, setelement(K, MentorTudi, V));
update_tudi_fields_helper([], MentorTudi) ->
    MentorTudi.

%% 判断徒弟是否亲传弟子
%%is_tudi_senior(RoleID) ->
%%    Lv = lib_cache:get_role_level(RoleID),
%%    #{senior_lv := SeniorLv} = conf_mentor_base:get(),
%%    Lv >= SeniorLv.

%% 玩家是否与某人有师徒关系
is_in_mentor_relation(PS, TargetRoleID) ->
    #role_state{id = RoleID} = PS,
    #role_mentor{mentor_id = MentorID} = get_role_data(RoleID),
    MentorPerson = svr_mentor:get_person(MentorID),
    Reply = case MentorPerson of
        #mentor_person{} when TargetRoleID =:= 0 -> true;
        #mentor_person{role_id = MID, tudi_list = TudiList} ->
            case MID of
                TargetRoleID -> true;
                _ -> lists:keymember(TargetRoleID, #mentor_tudi.role_id, TudiList)
            end;
        undefined -> false
    end,
    {ok, Reply}.

%% 玩家是否在指定范围之内
is_in_range(PS, DesScene, DesX, DesY, Range) ->
    #role_state{role_scene = #role_scene{scene_id = SceneID, x = X, y = Y}} = PS,
    Reply = if
        SceneID =:= DesScene ->
            lib_battle_chk:check_distance({X, Y}, {DesX, DesY}, Range);
        true -> false
    end,
    {ok, Reply}.

%% 获取每天的练功次数
get_daily_practice_num(PS) ->
    Num = lib_role_kv:get_kv(PS#role_state.id, ?KEY_DAILY_MENTOR_PRACTICE_NUM, 0),
    {ok, Num}.

%% 获取徒弟旧数据
get_tudi_old_data(PS) ->
    CurTime = time:unixtime(),
    TodayZeroTime = time:unixdate(),
    {MonZeroTime, _} = time:get_week_unixtime(),
    #role_state{id = RoleID, level = Lv} = PS,
    #{senior_lv := SeniorLv} = conf_mentor_base:get(),
    RoleMentor = get_role_data(RoleID),
    #role_mentor{mentor_tasks = MentorTasks, taixue_tasks = TaixueTasks, mentor_taken = #{take_own := TakeOwn}, last_mentor_time = LastMentorTime, last_taixue_time = LastTaixueTime} = RoleMentor,
    {MentorTasksN, TakeOwnN, LastMentorTimeN} = if
        LastMentorTime < TodayZeroTime andalso Lv < SeniorLv -> {[], 0, 0};
        true -> {MentorTasks, TakeOwn, LastMentorTime}
    end,
    {TaixueTasksN, LastTaixueTimeN} = ?iif(LastTaixueTime < MonZeroTime andalso Lv >= SeniorLv, {get_rand_taixue_tasks(PS), CurTime}, {TaixueTasks, LastTaixueTime}),
    {ok, {MentorTasksN, TaixueTasksN, TakeOwnN, LastMentorTimeN, LastTaixueTimeN}}.

%% 获取师父旧数据
get_mentor_old_data(PS, TudiID) ->
    #role_state{id = RoleID} = PS,
    RoleMentor = get_role_data(RoleID),
    #role_mentor{morality = Morality, mentor_lv = MentorLv, mentor_taken = #{take_tudi := TakeTudi}} = RoleMentor,
    {_, Taken} = util:list_find(TudiID, 1, TakeTudi, {TudiID, 0}),
    {ok, {Morality, MentorLv, Taken}}.

%% 获取太学册任务
get_rand_taixue_tasks(PS) ->
    #{taixue_task_num := TaskNum} = conf_mentor_base:get(),
    TaskIdList = util:list_rand_n(conf_mentor_task:get_ids_by_type(?TASK_TYPE_TAIXUE), TaskNum),
    {_, Tasks} = refresh_mentor_tasks(PS, TaskIdList),
    Tasks.

%% 刷新师徒相关任务
refresh_mentor_tasks(PS, TaskIdList) ->
    {ok, refresh_tasks(TaskIdList, PS, [])}.

refresh_tasks([], _PS, Acc) ->
    Acc;
refresh_tasks([ID | T], PS, Acc) ->
    Conf = conf_mentor_task:get(ID),
    Task = lib_task_util:init_task(PS, Conf),
    refresh_tasks(T, PS, [Task | Acc]).

%% 通过任务列表获取新增的学习成绩
get_add_mark_by_task_list(TaskList) ->
    case TaskList of
        [] -> 0;
        _ ->
            Func = fun(#{id := TaskID, stat := Stat}, MarkAcc) ->
                case Stat of
                    ?TASK_STAT_FINISHED ->
                        #{mark := AddMark} = conf_mentor_task:get(TaskID),
                        MarkAcc + AddMark;
                    _ -> MarkAcc
                end
            end,
            lists:foldl(Func, 0, TaskList)
    end.

%% 获取任务完成数
get_task_list_finish_num(TaskList) ->
    case TaskList of
        [] -> 0;
        _ ->
            Func = fun(#{stat := Stat}, FinAcc) ->
                case Stat of
                    ?TASK_STAT_FINISHED ->
                        FinAcc + 1;
                    _ -> FinAcc
                end
            end,
            lists:foldl(Func, 0, TaskList)
    end.

%% 获取取消确认时对应的错误提示码
get_cancel_retcode(?CONFIRM_TYPE_BEGIN_MENTOR) ->
    ?RC_MENTOR_REFUSE_BEGIN;
get_cancel_retcode(?CONFIRM_TYPE_FINISH_MENTOR) ->
    ?RC_MENTOR_REFUSE_FINISH;
get_cancel_retcode(_) ->
    ?RC_FAILED.

%% 检查内容合法性
validate_msg(Msg, Len1, Len2) ->
    validate_msg_sub(len, Msg, Len1, Len2),
    validate_msg_sub(keyword, Msg).

%% 检测长度
validate_msg_sub(len, Msg, Len1, Len2) ->
    case util:check_length(Msg, Len1, Len2) of
        false -> throw({error, ?RC_MENTOR_MSG_LEN_INVALID});
        true -> true
    end.

%% 检测关键字
validate_msg_sub(keyword, Msg) ->
    case util:check_filter(Msg) of
        false -> true;
        _ -> throw({error, ?RC_MENTOR_MSG_SENSITIVE})
    end.

%%--------------------------数据库操作--------------------------------------
init_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_MENTOR_DATA, [RoleID]),
    Data = case ?DB:get_row(SQL) of
        [MentorID, DBMentorQuizList, DBTudiQuizList, Registered, DBMentorTasks, DBTaixueTasks, DBMentorTaken, Morality, MentorLv, DBCommentPop, LastMentorTime, LastTaixueTime] ->
            #role_mentor{
                mentor_id = MentorID,
                mentor_quiz_list = ?TOTERM(DBMentorQuizList),
                tudi_quiz_list = ?TOTERM(DBTudiQuizList),
                registered = Registered,
                mentor_tasks = ?TOTERM(DBMentorTasks),
                taixue_tasks = ?TOTERM(DBTaixueTasks),
                mentor_taken = type:convert_db_field(map, DBMentorTaken, ?mentor_taken),
                morality = Morality,
                mentor_lv = MentorLv,
                comment_pop = ?TOTERM(DBCommentPop),
                last_mentor_time = LastMentorTime,
                last_taixue_time = LastTaixueTime
            };
        [] ->
            #role_mentor{}
    end,
    set_role_data(RoleID, Data).

save_role_db_data(RoleID, RoleData) ->
    #role_mentor{
        mentor_id = MentorID,
        mentor_quiz_list = MentorQuizList,
        tudi_quiz_list = TudiQuizList,
        registered = Registered,
        mentor_tasks = MentorTasks,
        taixue_tasks = TaixueTasks,
        mentor_taken = MentorTaken,
        morality = Morality,
        mentor_lv = MentorLv,
        comment_pop = CommentPop,
        last_mentor_time = LastMentorTime,
        last_taixue_time = LastTaixueTime
    } = RoleData,
    SQL = io_lib:format(?SQL_SET_ROLE_MENTOR_DATA, [RoleID, MentorID, ?TOBSTR(MentorQuizList), ?TOBSTR(TudiQuizList), Registered, ?TOBSTR(MentorTasks), ?TOBSTR(TaixueTasks), ?TOBSTR(MentorTaken), Morality, MentorLv, ?TOBSTR(CommentPop), LastMentorTime, LastTaixueTime]),
    ?DB:execute(SQL),
    set_role_data(RoleID, RoleData#role_mentor{updated = false}).

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#role_mentor{updated = true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).
