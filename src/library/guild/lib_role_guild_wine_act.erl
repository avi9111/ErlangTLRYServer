%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派行酒令
%%% @end
%%% Created : 16. 十一月 2018 10:52
%%%-------------------------------------------------------------------
-module(lib_role_guild_wine_act).
-author("Tom").
-include("op_type.hrl").
-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("ets_defines.hrl").
-include("guild.hrl").
-include("chat.hrl").
-include("guild_wine_act.hrl").
-include("proto/prot_518.hrl").


-export([
    init/1,
    save/1,
    handle_info/2
]).

%% API
-export([
    info/1,
    dice/1,
    enter_seat/3,
    leave_seat/3,
    give_comment/3,
    comment_info/1,
    daily_lively/2,
    get_role_data/1,
    update_role_data/2,
    get_subject_info/2,
    get_all_guildId_list/0,
    broad_update_subject/4,
    get_default_guild_wine/0,
    broad_update_comment_info/4

]).

%% 玩家进程分发过来的处理
handle_info({auto_inc_exp, Number}, State) ->
    auto_inc_exp(State, Number);
handle_info(_Info, _State) ->
    undefined.


%%-------------------------lib_role回调----------------------------------
%% 初始化
init(PS) ->
%%    io:format("~p init.....~n", [?MODULE]),
    #role_state{id = RoleID} = PS,
    RoleData = init_role_db_data(RoleID),
    set_role_data(RoleID, RoleData).

%% 下线保存
save(PS) ->
%%    io:format("~p save.....~n", [?MODULE]),
    RoleData = get_role_data(PS#role_state.id),
    #guild_wine{updated = Updated} = RoleData,
    ?iif(Updated, save_role_db_data(PS#role_state.id, RoleData), skip).


%%-------------------------功能逻辑外部调用--------------------------------
info(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    RoleData = get_role_data(RoleID),
    SeatNum = svr_guild:get_seat_num(GuildID),
    #{exp_add_per := ExpAddPer} = conf_guild_wine_act_by_num:get(SeatNum),
    {CurSubject, NextSubject, NextTime} = svr_guild_wine_act:get_subject_info(),
    StartTime = svr_guild_wine_act:get_act_start_time(),
    QuizTime = RoleData#guild_wine.quiz_time,
    RoleDataN = case QuizTime >= StartTime of
                    true -> RoleData;
                    false ->
                        DefaultInfo = lib_role_guild_wine_act:get_default_guild_wine(),
                        DefaultInfo#guild_wine{quiz_time = time:unixtime()}
                end,
    update_role_data(RoleID, RoleDataN),
    #guild_wine{exp_get = ExpGet} = RoleDataN,
    MsgRecord = #sc_guild_wine_act_info{
        end_time = svr_guild_wine_act:get_act_end_time(),
        exp_get = ExpGet,
        number = SeatNum,
        exp_add_per = ExpAddPer,
        cur_subject = CurSubject,
        next_subject = NextSubject,
        next_time = NextTime
    },
    {ok, MsgRecord}.

dice(PS) ->
    #role_state{id = RoleID, level = Lv, guild_id = GuildID} = PS,
    RoleData = get_role_data(RoleID),
    #guild_wine{dice_num = DiceNum} = RoleData,
    CurState = svr_guild_wine_act:get_cur_state(),
    CurState =:= ?SUBJECT_TYPE_DICE orelse erlang:throw({error, ?RC_GUILD_WINE_ACT_NOT_IN_TIME}),
    DiceNum =:= 0 orelse erlang:throw({error, ?RC_GUILD_WINE_ACT_DICE_ALREADY}),
    {DiceList, DiceNum_N, DiceStr} = roll_dice(?DICE_INIT_LIST, [], 0, ""),
    update_role_data(RoleID, RoleData#guild_wine{dice_num = DiceNum_N}),
    %% 发放奖励
    #{dice_reward := RewardId} = conf_guild_wine_act_by_lv:get(Lv),
    lib_drop_api:give_drop_asyn(RoleID, RewardId, ?OPT_GUILD_WINE_ACT),
    %% 发信息到帮派频道
    #{string := ChatStr} = conf_string:get(guild_wine_dice),
    lib_role_chat:public_chat(PS, ?CHAT_CHANNEL_GUILD, 0, io_lib:format(ChatStr, [DiceStr, DiceNum_N]), "", 0, ""),

    %% 活动进程记录骰子数据
    svr_guild_wine_act:dice_record(GuildID, RoleID, DiceNum_N, Lv),

    MsgRecord = #sc_guild_wine_act_dice{
        dice_num = DiceList
    },
    {ok, MsgRecord}.

comment_info(PS) ->
    #role_state{guild_id = GuildID} = PS,
    {GuildCommentRole1, GuildCommentRole2} = case svr_guild_wine_act:get_dice_rank_info(GuildID) of
        none -> {#guild_comment_role{}, #guild_comment_role{}};
        {CR1, CR2} -> {CR1, CR2}
    end,

    MsgRecord = #sc_guild_wine_act_comment_info{
        dice_max_role = GuildCommentRole1,
        dice_min_role = GuildCommentRole2
    },
%%    io:format("GuildCommentRole1: ~p~n", [GuildCommentRole1]),
%%    io:format("GuildCommentRole2: ~p~n", [GuildCommentRole2]),
    {ok, MsgRecord}.

give_comment(PS, Target_RoleID, CommentType) ->
%%    io:format("give_comment, Target_RoleID=~w, CommentType=~w~n", [Target_RoleID, CommentType]),
    #role_state{id = RoleID, level = Lv, guild_id = GuildID} = PS,
    case svr_guild_wine_act:give_comment(GuildID, RoleID, Target_RoleID, CommentType) of
        {ok, DiceState} ->
            %% 发放点评奖励
            #{comment_like_reward := LikeRewardId, comment_dislike_reward := DisLikeRewardId} = conf_guild_wine_act_by_lv:get(Lv),
            RewardId = case CommentType of
                ?COMMENT_LIKE -> LikeRewardId;
                _ -> DisLikeRewardId
            end,
            lib_drop_api:give_drop_asyn(RoleID, RewardId, ?OPT_GUILD_WINE_ACT),

            %% 发信息到帮派频道
            TmpStr = get_rand_comment_str(DiceState, CommentType),
            TargetName = lib_cache:get_role_name(Target_RoleID),
            ChatStr = case catch io_lib:format(TmpStr, [TargetName]) of
                {'EXIT', _} -> TmpStr;
                Str_T -> Str_T
            end,
            lib_role_chat:public_chat(PS, ?CHAT_CHANNEL_GUILD, 0, ChatStr, "", 0, ""),
%%             io:format("ChatStr:~s~n", [ChatStr]),
            ok;
        {error, RetCode} -> {error, RetCode}
    end.

%%-----------------------------具体逻辑实现----------------------------------
get_rand_comment_str(?DICE_MAX, ?COMMENT_LIKE) ->
    get_comment_str(guild_wine_like_max);
get_rand_comment_str(?DICE_MAX, ?COMMENT_DISLIKE) ->
    get_comment_str(guild_wine_dislike_max);
get_rand_comment_str(?DICE_MIN, ?COMMENT_LIKE) ->
    get_comment_str(guild_wine_like_min);
get_rand_comment_str(?DICE_MIN, ?COMMENT_DISLIKE) ->
    get_comment_str(guild_wine_dislike_min);
get_rand_comment_str(_, _) ->
    "".

get_comment_str(guild_wine_like_max) ->
    Key = util:list_rand([guild_wine_like_max1, guild_wine_like_max2]),
    Str_T = config:get_string(Key),
    Str_T;
get_comment_str(guild_wine_dislike_max) ->
    Key = util:list_rand([guild_wine_dislike_max1, guild_wine_dislike_max2]),
    Str_T = config:get_string(Key),
    Str_T;
get_comment_str(guild_wine_like_min) ->
    Key = util:list_rand([guild_wine_like_min1, guild_wine_like_min2]),
    Str_T = config:get_string(Key),
    Str_T;
get_comment_str(guild_wine_dislike_min) ->
    Key = util:list_rand([guild_wine_dislike_min1, guild_wine_dislike_min2]),
    Str_T = config:get_string(Key),
    Str_T;
get_comment_str(_) ->
    "".




roll_dice([MaxDice | T], ListAcc, NumAcc, StrAcc) ->
    RandDice = util:rand(1, MaxDice),
    ListAccN = [RandDice | ListAcc],
    NumAccN = NumAcc + RandDice,
    StrAccN = io_lib:format("#~w#", [?CHAT_EXPRESSION_DICE + RandDice]) ++ StrAcc,
    roll_dice(T, ListAccN, NumAccN, StrAccN);
roll_dice([], ListAcc, NumAcc, StrAcc) ->
    {ListAcc, NumAcc, StrAcc}.



get_subject_info(StartTime, _EndTime) ->
    #{quiz_time := QuizTimeMin,
        quiz_last_time := QuizLastTimeMin,
        dice_time := DiceTimeMin,
        dice_last_time := DiceLastTimeMin,
        comment_time := CommentTimeMin,
        comment_last_time := CommentLastTimeMin} = conf_guild_wine_act:get(),
    QuizTime = QuizTimeMin * 60,
    QuizLastTime = QuizLastTimeMin * 60,
    DiceTime = DiceTimeMin * 60,
    DiceLastTime = DiceLastTimeMin * 60,
    CommentTime = CommentTimeMin * 60,
    CommentLastTime = CommentLastTimeMin * 60,
    CurTime = time:unixtime(),
    PastTime = CurTime - StartTime,
    if
        PastTime < QuizTime -> {0, ?SUBJECT_TYPE_QUIZ, StartTime + QuizTime};
        PastTime < QuizTime + QuizLastTime -> {?SUBJECT_TYPE_QUIZ, ?SUBJECT_TYPE_DICE, StartTime + DiceTime};
        PastTime < DiceTime -> {0, ?SUBJECT_TYPE_DICE, StartTime + DiceTime};
        PastTime < DiceTime + DiceLastTime -> {?SUBJECT_TYPE_DICE, ?SUBJECT_TYPE_COMMENT, StartTime + CommentTime};
        PastTime < CommentTime -> {0, ?SUBJECT_TYPE_COMMENT, StartTime + CommentTime};
        PastTime < CommentTime + CommentLastTime -> {?SUBJECT_TYPE_COMMENT, 0, 0};
        true -> {0, 0, 0}
    end.

get_all_guildId_list() ->
    [begin
        #guild{id = GuildID} = Guild,
        GuildID
    end || Guild <- ets:tab2list(?ETS_GUILD)].

auto_inc_exp(PS, Number) ->
    #role_state{level = Lv, id = RoleID, sid = RoleSid} = PS,
    #{open_lv := OpenLv} = conf_guild_wine_act:get(),
    if
        Lv >= OpenLv ->
%%            io:format("auto_inc_exp,[roleid=~w].......~n", [RoleID]),
            RoleData = get_role_data(PS#role_state.id),
            #guild_wine{exp_get = ExpGet} = RoleData,
            #{exp := Exp} = conf_guild_wine_act_by_lv:get(Lv),
%%            lib_role_assets:add_items_notify(PS, [{?AST_EXP, Exp}], ?OPT_GUILD_WINE_ACT);
            %% 计算加成
            #{exp_add_per := ExpAddPer} = conf_guild_wine_act_by_num:get(Number),
            Exp_N = erlang:floor(Exp * (1 + ExpAddPer / 100)),

            PS_N = lib_role_assets:add_items_notify(PS, [{?AST_EXP, Exp_N}], ?OPT_GUILD_WINE_ACT),
            ExpGetN = ExpGet + Exp_N,
            update_role_data(RoleID, RoleData#guild_wine{exp_get = ExpGetN}),
%%            io:format("ExpGetN=~w, ExpGet=~w, Exp_N=~w, Exp=~w ,~n", [ExpGetN, ExpGet, Exp_N, Exp]);
            router_518:send_update_exp(RoleSid, ExpGetN),
            PS_N;
        true ->
            PS
    end.

broad_update_subject(State, StateBeginTime, CurSubject, NextSubject) ->
    #guild_wine_act{start_time = StartTime} = State,
%%    PastTime = time:unixtime() - StartTime,
    NextTime = StartTime + StateBeginTime,
%%    NextTime = StateBeginTime - PastTime,
%%    NextTime_N = ?iif(NextTime<0, 0, NextTime),
%%    io:format("PastTime=~w, StateBeginTime=~w, NextTime_N=~w~n", [PastTime, StateBeginTime, NextTime]),
    %% 广播行酒令状态改变传闻
    Param = case CurSubject of
        ?SUBJECT_TYPE_QUIZ -> config:get_string(guild_quiz);
        ?SUBJECT_TYPE_DICE -> config:get_string(guild_dice);
        ?SUBJECT_TYPE_COMMENT -> config:get_string(guild_comment);
        _ -> undefined
    end,
    %% 广播行酒令传闻
    Param =/= undefined andalso svr_rumor:publish(world, ?RUMOR_SUBJECT_BEGIN, [Param]),
    GuildIDList = lib_role_guild_wine_act:get_all_guildId_list(),
    [begin svr_guild:update_subject(GuildID, CurSubject, NextSubject, NextTime)
%%        Param =/= undefined andalso svr_rumor:publish({guild, GuildID}, ?RUMOR_SUBJECT_BEGIN, [Param])
    end || GuildID <- GuildIDList].


%% 玩家进入帮派领地
enter_seat(SceneId, RoleID, GuildID) ->
    SeatScene = lib_guild:get_seat_scene(),
    SceneId =/= SeatScene orelse svr_guild:inc_seat_num(GuildID, RoleID).

%% 玩家离开帮派领地
leave_seat(SceneId, RoleID, GuildID) ->
    SeatScene = lib_guild:get_seat_scene(),
    SceneId =/= SeatScene orelse svr_guild:dec_seat_num(GuildID, RoleID).

%% 广播下发点评界面信息
broad_update_comment_info(GuildID, TargetRoleID, LikeNum, DislikeNum) ->
    MsgRecord = #sc_guild_wine_act_update_role{
        role_id = TargetRoleID,
        like_num = LikeNum,
        dislike_num = DislikeNum
    },
    svr_guild:update_comment_info(GuildID, MsgRecord).

%% @doc 每日活跃累积
daily_lively(RoleID, SceneId) ->
    SceneId =:= lib_guild:get_seat_scene() andalso begin
        lib_role_daily_lively:trigger_event(RoleID, 7, 1),
        ?TASK_EVENT(RoleID, 'part_guild_wine')
    end.

%% @doc 获取默认行酒令数据
get_default_guild_wine() ->
    IDList = conf_question_bank:get_ids(),
    ChooseList = util:list_rand_n(IDList, ?TOTAL_QUESTION_NUM),
    #guild_wine{
        quiz_info = #question_role_data{
            quiz_list = ChooseList
        }
    }.

%%--------------------------数据库操作--------------------------------------
-define(SQL_GET_ROLE_DATA, <<"select exp_get, quiz_info, dice_num, quiz_time from role_guild_wine_act where role_id = ~w">>).
init_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [ExpGet, DBQuizInfo, DiceNum, Quiztime] ->
            #guild_wine{
                exp_get = ExpGet,
                quiz_info = type:bitstring_to_term(DBQuizInfo),
                dice_num = DiceNum,
                quiz_time = Quiztime
            };
        [] -> get_default_guild_wine()
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_guild_wine_act(role_id, exp_get, quiz_info, dice_num, quiz_time) values(~w, ~w, '~s', ~w, ~w)">>).
save_role_db_data(RoleID, RoleData) ->
    #guild_wine{
        exp_get = ExpGet,
        quiz_info = QuizInfo,
        dice_num = DiceNum,
        quiz_time = QuizTime
    } = RoleData,
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, ExpGet, type:term_to_bitstring(QuizInfo), DiceNum, QuizTime]),
    ?DB:execute(SQL),
    set_role_data(RoleID, RoleData#guild_wine{updated = false}).

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#guild_wine{updated = true}).

set_role_data(_RoleID, Data) ->
    erlang:put({lib_role_guild_wine_act, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({lib_role_guild_wine_act, role_data}).