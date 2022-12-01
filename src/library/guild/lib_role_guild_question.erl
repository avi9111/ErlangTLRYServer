%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     行酒令答题
%%% @end
%%% Created : 14. 九月 2018 19:42
%%%-------------------------------------------------------------------
-module(lib_role_guild_question).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("guild_wine_act.hrl").
-include("proto/prot_501.hrl").

%% API
-export([
    do/3,
    handle_info/2
]).

do(50101, PS, _Req) ->
    info(PS);
do(50103, PS, #cs_question_answer{answer = Answer}) ->
    answer(PS, Answer);
do(_, _, _) ->
    skip.

handle_info(fix_question, PS) ->
    case is_ongoing(PS#role_state.guild_id) of
        true ->
            #{answer_reward := RewardList} = conf_level:get(PS#role_state.level),
            [{ErrorReward1, ErrorReward2}, {_RightReward1, _RightReward2}] = RewardList,
            Reward = [ErrorReward1, ErrorReward2],
            NewPS = lib_role_assets:add_items_notify(PS, Reward, ?OPT_GUILD_WINE_ACT),
            Rec = #sc_question_answer{answer = 0},
            {ok, Bin} = prot_msg:encode_msg(50104, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS};
        _ ->
            skip
    end;
handle_info(_, _) ->
    ok.

info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    case is_ongoing(PS#role_state.guild_id) of
        true -> notify_question_single(RoleID, RoleSid);
        {error, Code} -> ?ERROR_TOC(PS#role_state.id, Code)
    end.

answer(PS, Answer) ->
    case is_ongoing(PS#role_state.guild_id) of
        true ->
            case catch answer(PS#role_state.id, PS#role_state.sid, Answer, PS#role_state.level) of
                ok ->
                    Rec = #sc_question_answer{answer = Answer},
                    {ok, Bin} = prot_msg:encode_msg(50104, Rec),
                    lib_role_send:send_to_sid(PS#role_state.sid, Bin),
                    ok;
                {error, Code} ->
                    ?ERROR_TOC(PS#role_state.id, Code)
            end;
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

is_ongoing(GuildID) ->
    case svr_guild_wine_act:is_sub_ongoing(?SUBJECT_TYPE_QUIZ) of
        true when GuildID > 0 -> true;
        true -> {error, ?RC_GUILD_HAVE_NO_GUILD};
        _ -> {error, ?RC_GUILD_WINE_ACT_NOT_IN_TIME}
    end.

%% 单独通知玩家
notify_question_single(RoleID, RoleSid) ->
    RoleData = lib_role_guild_wine_act:get_role_data(RoleID),
    #question_role_data{bingo_num = BingoNum, answer_list = AList, quiz_index = QuizIndex, quiz_list = QList} = RoleData#guild_wine.quiz_info,
    {StartTime, EndTime, _} = svr_guild_wine_act:get_quiz_sub_info(),
    ConfID = ?iif(QuizIndex =< length(QList), lists:nth(QuizIndex, QList), 0),
    RealAList = get_real_answer_list(AList, QuizIndex),
    State = ?iif(QuizIndex =< length(QList), ?STEP_BEGIN, ?STEP_COMPLETE),
    Rec = #sc_question_info{
        state = State,
        index = QuizIndex,
        conf_id = ConfID,
        begin_time = StartTime,
        end_time = EndTime,
        bingo_num = BingoNum,
        answer_list = RealAList
    },
    {ok, Bin} = prot_msg:encode_msg(50102, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

answer(RoleID, _RoleSid, Answer, Lv) ->
    {_, EndTime, _} = svr_guild_wine_act:get_quiz_sub_info(),
    RoleData = lib_role_guild_wine_act:get_role_data(RoleID),
    QuizInfo = RoleData#guild_wine.quiz_info,
    #question_role_data{bingo_num = BingoNum, answer_list = AList, quiz_index = QuizIndex, quiz_list = QList} = QuizInfo,
    
    time:unixtime() =< EndTime andalso QuizIndex =< length(QList) orelse erlang:throw({error, ?RC_QUESTION_ALREADY_COMPLETE}),
    ConfID = lists:nth(QuizIndex, QList),
    #{answer := RightAnwser} = conf_question_bank:get(ConfID),
    not proplists:is_defined(QuizIndex, AList) orelse erlang:throw({error, ?RC_QUESTION_ALREADY_ANSWER}),
    IsBingo = Answer =:= RightAnwser,
    NewBingoNum = ?iif(IsBingo, BingoNum + 1, BingoNum),
    NewAList = [{QuizIndex, Answer, Lv, ConfID} | AList],
    NewQuizIndex = QuizIndex + 1,
    NewQuizInfo = QuizInfo#question_role_data{bingo_num = NewBingoNum, answer_list = NewAList, quiz_index = NewQuizIndex},

    %%发放答题奖励
    #{quiz_succ_reward := SuccReward, quiz_fail_reward := FailReward} = conf_guild_wine_act_by_lv:get(Lv),
    Reward = ?iif(IsBingo, SuccReward, FailReward),
    lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_GUILD_WINE_ACT),
    lib_role_guild_wine_act:update_role_data(RoleID, RoleData#guild_wine{quiz_info = NewQuizInfo}),
    ok.


get_real_answer_list(_, 0) -> [];
get_real_answer_list([], 1) -> [];
get_real_answer_list(AList, 1) -> AList;
get_real_answer_list(AList, Round) ->
    lists:foldl(fun(Index, AccList) ->
        case lists:keyfind(Index, 1, AccList) of
            false -> lists:keystore(Index, 1, AccList, {Index, 0, 0, 0});
            _ -> AccList
        end
    end, AList, lists:seq(1, Round - 1)).
