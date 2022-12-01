%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派行酒令
%%% @end
%%% Created : 16. 十一月 2018 14:49
%%%-------------------------------------------------------------------
-module(svr_guild_wine_act).

-behaviour(gen_server).

-author("Tom").
-include("guild_wine_act.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("guild_question.hrl").
-include("guild.hrl").
-include("role.hrl").
-include("op_type.hrl").
-include("ets_defines.hrl").
-include("proto/prot_518.hrl").

-define(TIMEOUT, 10000).
-define(SERVER, ?MODULE).

%% External API
-export([
    prepare_activity/1,
    start_activity/1,
    stop_activity/1,
    start_link/1
]).

% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-export([
    dice_record/4,
    give_comment/4,
    get_cur_state/0,
    is_sub_ongoing/1,
    get_subject_info/0,
    get_act_end_time/0,
    get_act_start_time/0,
    get_quiz_sub_info/0,
    get_dice_rank_info/1,
    broadcast_number_update/1,

    do_handle_cast/2,
    do_handle_call/3
]).

% --------------------------------------------------------------------
% External API
% --------------------------------------------------------------------
%% 活动准备
prepare_activity(_Activity) ->
%%    io:format("~p.prepare_activity.~n", [?MODULE]),
    %% 全服广播行酒令即将开始的传闻
    svr_rumor:publish(world, ?RUMOR_PREPARE_WINE),
    ok.

%% 开启活动
start_activity(_Activity) ->
    sup_activity:stop_activity(?SERVER), %% 有可能运营没有停止上一个运营活动就，开启下一个的不同活动，确保停掉上一个活动
    Child = {?SERVER, {?MODULE, start_link, [_Activity]},
        transient, 10000, worker, [?MODULE]},
    _ = sup_activity:start_activity(Child),
    start_event().

%% 停止活动
stop_activity(_Activity) ->
    %% 清除帮派各个玩家的活动缓存
    GuildIDList = lib_role_guild_wine_act:get_all_guildId_list(),
    [lib_guild:guild_info(GuildID, clear_guild_wine_data) || GuildID <- GuildIDList],
    ?DB:execute("TRUNCATE role_guild_wine_act"),
    sup_activity:stop_activity(?SERVER),
    stop_event().

start_link(Activity) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [Activity], []).

start_event() -> ok.

stop_event() -> ok.

%%--------------------------功能调用接口-----------------------------------
%% @doc 获取活动开始时间，单位秒
get_act_start_time() ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call(start_time);
        false -> 0
    end.

%% @doc 获取活动结束时间，单位秒
get_act_end_time() ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call(end_time);
        false -> 0
    end.

%% @doc 获取项目相关信息
get_subject_info() ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call(subject_info);
        false -> { 0, 0, 0}
    end.

%% @doc 广播参与活动的人数更新
broadcast_number_update(RoleID_List) ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> cast({number_update, RoleID_List});
        false -> skip
    end.

%% @doc 获取当前的互动项目类型
get_cur_state() ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call(cur_state);
        false -> 0
    end.

%% @doc 记录抛骰子点数
dice_record(GuildID, RoleID, DiceNum, Lv) ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> svr_guild:cast(GuildID, {dice_record, RoleID, DiceNum, Lv});
        false -> skip
    end.

%% @doc 获取抛骰子排行信息
get_dice_rank_info(GuildID) ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call({dice_rank_info, GuildID});
        false -> {#guild_comment_role{}, #guild_comment_role{}}
    end.

%% @doc 给予评论
give_comment(GuildID, RoleID, Target_RoleID, CommentType) ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call({give_comment, GuildID, RoleID, Target_RoleID, CommentType});
        false -> {error, ?RC_ACTIVITY_NOT_GOING}
    end.

%% @doc 指定的项目是否正在进行
is_sub_ongoing(SubjectType) ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call({is_sub_ongoing, SubjectType});
        false -> false
    end.

%% @doc 获取答题项目相关信息
get_quiz_sub_info() ->
    case lib_activity:is_ongoing(?ACT_ID_GUILD_WINE) of
        true -> call(quiz_sub_info);
        false -> {0, 0, []}
    end.

%%------------------------------------------------------------------------

call(Req) ->
    case dist:whereis_name(local, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Req, ?TIMEOUT);
        _ -> {error, ?RC_ACTIVITY_NOT_GOING}
    end.

cast(Req) ->
    case dist:whereis_name(local, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Req),
            ok;
        _ -> {error, ?RC_ACTIVITY_NOT_GOING}
    end.

% --------------------------------------------------------------------
% Function: init/1
% Description: Initiates the server
% Returns: {ok, State}          |
%          {ok, State, Timeout} |
%          ignore               |
%          {stop, Reason}
% --------------------------------------------------------------------
init([Activity]) ->
%%    ets:new(?ETS_GUILD_QUESTION, ?ETS_KEY_CURRENCY(1)),
    {ok, State} = init_state(Activity),
    NewState1 = init_data(State),
    #guild_wine_act{start_time = StartTime} = NewState1,
    %% 开启经验自动获得定时
    #{get_exp_time := TimeIntervalSec} = conf_guild_wine_act:get(),
    TimeInterval = TimeIntervalSec * 1000,
    Ref = erlang:send_after(TimeInterval, self(), loop_get_exp),
    %% 设定各个时间跳转的时间点
    #{  quiz_time := QuizTimeMin,
        quiz_last_time := QuizLastTimeMin,
        dice_time := DiceTimeMin,
        dice_last_time := DiceLastTimeMin,
        comment_time := CommentTimeMin,
        comment_last_time := CommentLastTimeMin } = conf_guild_wine_act:get(),
    erlang:send_after(QuizTimeMin*60000, self(), {begin_quiz, DiceTimeMin*60, ?SUBJECT_TYPE_QUIZ, ?SUBJECT_TYPE_DICE}),
    erlang:send_after((QuizTimeMin+QuizLastTimeMin)*60000, self(), {end_quiz, DiceTimeMin*60, 0, ?SUBJECT_TYPE_DICE}),
    erlang:send_after(DiceTimeMin*60000, self(), {begin_dice, CommentTimeMin*60, ?SUBJECT_TYPE_DICE, ?SUBJECT_TYPE_COMMENT }),
    erlang:send_after((DiceTimeMin+DiceLastTimeMin)*60000, self(), {end_dice, CommentTimeMin*60, 0, ?SUBJECT_TYPE_COMMENT}),
    erlang:send_after(CommentTimeMin*60000, self(), {begin_comment, 0, ?SUBJECT_TYPE_COMMENT, 0}),
    erlang:send_after((CommentTimeMin+CommentLastTimeMin)*60000, self(), {end_comment, 0, 0, 0}),
    SubTimeList = [{?SUBJECT_TYPE_QUIZ, StartTime+QuizTimeMin*60, StartTime+(QuizTimeMin+QuizLastTimeMin)*60},
                    {?SUBJECT_TYPE_DICE, StartTime+DiceTimeMin*60, StartTime+(DiceTimeMin+DiceLastTimeMin)*60},
                     {?SUBJECT_TYPE_COMMENT, StartTime+CommentTimeMin*60, StartTime+(CommentTimeMin+CommentLastTimeMin)*60}],
    %% 广播行酒令开始传闻
    svr_rumor:publish(world, ?RUMOR_SUBJECT_BEGIN, [config:get_string(guild_wine)]),
%%    GuildIDList = lib_role_guild_wine_act:get_all_guildId_list(),
%%    [svr_rumor:publish({guild, GuildID}, ?RUMOR_SUBJECT_BEGIN, [config:get_string(guild_wine)])|| GuildID <- GuildIDList],
    erlang:process_flag(trap_exit, true),
    {ok, NewState1#guild_wine_act{sub_time_list = SubTimeList, ref = Ref}}.

init_state(Activity) ->
    StartTime = time:unixtime(), %%lib_activity:get_start_time(Activity),
    EndTime = lib_activity:get_end_time(Activity),
    State = #guild_wine_act{start_time = StartTime, end_time = EndTime},
%%    io:format("StartTime:~w, EndTime:~w~n", [StartTime, EndTime]),
    {ok, State}.

init_data(State) ->
    %% 初始化答题题目
%%    IDList = conf_question_bank:get_ids(),
%%    ChooseList = util:list_rand_n(IDList, ?TOTAL_QUESTION_NUM),
%%    Fun = fun(ConfID, {Acc, Index}) ->
%%        {[{Index, ConfID}|Acc], Index + 1}
%%    end,
%%    {List, _} = lists:foldl(Fun, {[], 1}, ChooseList),
%%    State#guild_wine_act{question_list = List}.
    State.

%%---------------------gen_server callback--------------------------------------
handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


do_handle_call(quiz_sub_info, _From, State) ->
    #guild_wine_act{sub_time_list = TimeList, question_list = QuizList} = State,
    {_, StartTime, EndTime} = lists:keyfind(?SUBJECT_TYPE_QUIZ, 1, TimeList),
    {reply, {StartTime, EndTime, QuizList}, State};
do_handle_call({is_sub_ongoing, SubjectType}, _From, State) ->
    #guild_wine_act{cur_state = CurState} = State,
    Rep = case SubjectType of
        CurState -> true;
              _ -> false
    end,
    {reply, Rep, State};
do_handle_call(cur_state, _From, State) ->
    #guild_wine_act{cur_state = CurState} = State,
    {reply, CurState, State};
do_handle_call(subject_info, _From, State) ->
    #guild_wine_act{end_time = EndTime, start_time = StartTime} = State,
    Rep = lib_role_guild_wine_act:get_subject_info(StartTime, EndTime),
    {reply, Rep, State};
do_handle_call(start_time, _From, State) ->
    #guild_wine_act{start_time = StartTime} = State,
    {reply, StartTime, State};
do_handle_call(end_time, _From, State) ->
%%    CurTime = time:unixtime(),
    #guild_wine_act{end_time = EndTime} = State,
%%    LeftTime = ?iif(EndTime>CurTime, EndTime-CurTime, 0),
    {reply, EndTime, State};
do_handle_call({dice_rank_info, GuildID}, _From, State) ->
    #guild_wine_act{guild_dice_rank_list = DiceRankList} = State,
    {_, InfoTuple, _} = util:list_find(GuildID, 1, DiceRankList, {0, none, []}),
    {reply, InfoTuple, State};
do_handle_call({give_comment, GuildID, RoleID, Target_RoleID, CommentType}, _From, State) ->
    #guild_wine_act{guild_dice_rank_list = DiceRankList, cur_state = CurState} = State,
    {Rep_F, State_F} = case length(DiceRankList) of
        0 -> {{error, ?RC_GUILD_WINE_ACT_NO_COMMENT_ROLE}, State};
        _ ->
            {_, {CommentRole1, CommentRole2}, InfoList} = util:list_find(GuildID, 1, DiceRankList, {GuildID, none, []}),
            #guild_comment_role{role_id = T_RoleID1, like_num = LikeNum1, dislike_num = DisLikeNum1} = CommentRole1,
            #guild_comment_role{role_id = T_RoleID2, like_num = LikeNum2, dislike_num = DisLikeNum2} = CommentRole2,
            {_, CommentRoles} = util:list_find(Target_RoleID, 1, InfoList, {Target_RoleID, []}),
            HasComment = lists:member(RoleID, CommentRoles),
            CommentRoles_N = case HasComment of
                                 true -> CommentRoles;
                                 false -> [RoleID|CommentRoles]
                             end,
            InfoList_N = lists:keyreplace(Target_RoleID, 1, InfoList, {Target_RoleID, CommentRoles_N}),
            {Rep, StateN} = if
                                CurState =/= ?SUBJECT_TYPE_COMMENT -> {{error, ?RC_GUILD_WINE_ACT_NOT_IN_TIME}, State};
                                Target_RoleID =/= T_RoleID1 andalso Target_RoleID =/= T_RoleID2 -> {{error, ?RC_GUILD_WINE_ACT_NOT_COMMENT_ROLE}, State};
                                HasComment -> {{error, ?RC_GUILD_WINE_ACT_ALREADY_COMMENT}, State};
                                true ->
                                    DiceRankList_T = case Target_RoleID of
                                                         T_RoleID1 ->
                                                             DiceState = ?DICE_MAX,
                                                             {CommentRole1_N, LikeNum, DislikeNum} = case CommentType of
                                                                                                         ?COMMENT_LIKE ->
                                                                                                             LikeNum_T = LikeNum1 + 1,
                                                                                                             {CommentRole1#guild_comment_role{role_id = T_RoleID1, like_num = LikeNum_T}, LikeNum_T, DisLikeNum1};
                                                                                                         _ ->
                                                                                                             DislikeNum_T = DisLikeNum1 + 1,
                                                                                                             {CommentRole1#guild_comment_role{role_id = T_RoleID1, dislike_num = DislikeNum_T}, LikeNum1, DislikeNum_T}
                                                                                                     end,
                                                             lists:keyreplace(GuildID, 1, DiceRankList, {GuildID, {CommentRole1_N, CommentRole2}, InfoList_N});
                                                         T_RoleID2 ->
                                                             DiceState = ?DICE_MIN,
                                                             {CommentRole2_N, LikeNum, DislikeNum} = case CommentType of
                                                                                                         ?COMMENT_LIKE ->
                                                                                                             LikeNum_T = LikeNum2 + 1,
                                                                                                             {CommentRole2#guild_comment_role{role_id = T_RoleID2, like_num = LikeNum_T}, LikeNum_T, DisLikeNum2};
                                                                                                         _ ->
                                                                                                             DislikeNum_T = DisLikeNum2 + 1,
                                                                                                             {CommentRole2#guild_comment_role{role_id = T_RoleID2, dislike_num = DislikeNum_T}, LikeNum2, DislikeNum_T}
                                                                                                     end,
                                                             lists:keyreplace(GuildID, 1, DiceRankList, {GuildID, {CommentRole1, CommentRole2_N}, InfoList_N})
                                                     end,
                                    lib_role_guild_wine_act:broad_update_comment_info(GuildID, Target_RoleID, LikeNum, DislikeNum),
                                    State_T = State#guild_wine_act{guild_dice_rank_list = DiceRankList_T},
                                    {{ok, DiceState}, State_T}
                            end,
            {Rep, StateN}
    end,
    {reply, Rep_F, State_F};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.


do_handle_cast(loop_get_exp, #guild_wine_act{ref = Ref, last_exp_time = LastExpTime} = State) ->
%%    io:format("~p.loop_get_exp,cur_time=~w......~n", [?MODULE, time:unixtime()]),
    util:cancel_timer(Ref),
    #{get_exp_time := TimeIntervalSec} = conf_guild_wine_act:get(),
    CurTime = time:unixtime(),
    LastExpTimeN = ?iif(CurTime - LastExpTime > TimeIntervalSec,
         begin
            GuildIDList = lib_role_guild_wine_act:get_all_guildId_list(),
            [ svr_guild:auto_inc_exp(GuildID) || GuildID <- GuildIDList],
            CurTime
         end, LastExpTime),
    NewRef = erlang:send_after(?GET_EXP_CHECK_INTERVAL, self(), loop_get_exp),
    {noreply, State#guild_wine_act{ref = NewRef, last_exp_time = LastExpTimeN}};

do_handle_cast({begin_quiz, DiceTime, CurSubject, NextSubject}, State) ->
%%    io:format("begin_quiz......~n"),
    State_N = State#guild_wine_act{ cur_state = CurSubject, next_state = NextSubject },
    lib_role_guild_wine_act:broad_update_subject(State_N, DiceTime, CurSubject, NextSubject),
    {noreply, State_N};
do_handle_cast({end_quiz, DiceTime, CurSubject, NextSubject}, State) ->
%%    io:format("end_quiz......~n"),
    State_N = State#guild_wine_act{ cur_state = CurSubject, next_state = NextSubject },
    lib_role_guild_wine_act:broad_update_subject(State_N, DiceTime, CurSubject, NextSubject),
    {noreply, State_N};
do_handle_cast({begin_dice, CommentTime, CurSubject, NextSubject}, State) ->
%%    io:format("begin_dice......~n"),
    State_N = State#guild_wine_act{ cur_state = CurSubject, next_state = NextSubject },
    lib_role_guild_wine_act:broad_update_subject(State_N, CommentTime, CurSubject, NextSubject),
    {noreply, State_N};
do_handle_cast({end_dice, CommentTime, CurSubject, NextSubject}, State) ->
%%    io:format("end_dice......~n"),
    %% 统计骰子数排行
    GuildIDList = lib_role_guild_wine_act:get_all_guildId_list(),
    DiceRankList = [begin
                        case svr_guild:sort_dice_num(GuildID) of
                            undefined -> {GuildID, none, []};
                            {DiceMaxTuple, DiceMinTuple} ->
                                %% 给最大点数及最低点数的玩家发放额外邮件奖励
                                {RoleID1, DiceNum1, _, Lv1} = DiceMaxTuple, %%{RoleID, DiceNum, Time, Lv}
                                {RoleID2, DiceNum2, _, Lv2} = DiceMinTuple,
                                #{dice_max_reward := MaxReward} = conf_guild_wine_act_by_lv:get(Lv1),
                                #{dice_min_reward := MinReward} = conf_guild_wine_act_by_lv:get(Lv2),
                                svr_mail:sys2p(RoleID1, ?DICE_MAX_MAIL_TEMPLATE, MaxReward, ?OPT_GUILD_WINE_ACT),
                                svr_mail:sys2p(RoleID2, ?DICE_MIN_MAIL_TEMPLATE, MinReward, ?OPT_GUILD_WINE_ACT),

                                {GuildID,
                                    {
                                        #guild_comment_role{role_id = RoleID1, role_name = lib_cache:get_role_name(RoleID1), career = lib_cache:role_base_field(RoleID1, career, 0), gender = lib_cache:get_role_sex(RoleID1), dice_num = DiceNum1, reward_id = MaxReward},
                                        #guild_comment_role{role_id = RoleID2, role_name = lib_cache:get_role_name(RoleID2), career = lib_cache:role_base_field(RoleID2, career, 0), gender = lib_cache:get_role_sex(RoleID2), dice_num = DiceNum2, reward_id = MinReward}
                                    },
                                    [{RoleID1, []},{RoleID2, []}]
                                }
                        end
                    end || GuildID <- GuildIDList],

    State_N = State#guild_wine_act{cur_state = CurSubject, next_state = NextSubject, guild_dice_rank_list = DiceRankList},
    lib_role_guild_wine_act:broad_update_subject(State_N, CommentTime, CurSubject, NextSubject),
    {noreply, State_N};
do_handle_cast({begin_comment, StartTime, CurSubject, NextSubject}, State) ->
%%    io:format("begin_comment......~n"),
    State_N = State#guild_wine_act{ cur_state = CurSubject, next_state = NextSubject },
    lib_role_guild_wine_act:broad_update_subject(State_N, StartTime, CurSubject, NextSubject),
    {noreply, State_N};
do_handle_cast({end_comment, StartTime, CurSubject, NextSubject}, State) ->
%%    io:format("end_comment......~n"),
    State_N = State#guild_wine_act{ cur_state = CurSubject, next_state = NextSubject },
    lib_role_guild_wine_act:broad_update_subject(State_N, StartTime, CurSubject, NextSubject),
    {noreply, State_N};

do_handle_cast({number_update, RoleID_List}, State) ->
    Number = length(RoleID_List),
    #{exp_add_per := ExpAddPer} = conf_guild_wine_act_by_num:get(Number),
    router_518:send_update_number(RoleID_List, Number, ExpAddPer),
    {noreply, State};


do_handle_cast(_Request, State) ->
    {noreply, State}.