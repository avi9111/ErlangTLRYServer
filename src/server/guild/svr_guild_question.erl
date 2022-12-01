%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     行酒令答题
%%% @end
%%% Created : 15. 九月 2018 11:16
%%%-------------------------------------------------------------------
-module(svr_guild_question).

-behaviour(gen_server).

-include("common.hrl").
-include("ret_code.hrl").
-include("guild_question.hrl").
-include("guild.hrl").
-include("ets_defines.hrl").
-include("proto/prot_501.hrl").

-define(SERVER, ?MODULE).
-define(TIMEOUT, 10000).


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
    start_activity/1,
    stop_activity/1,
    start_link/1,
    cast/1,
    call/1
]).

-export([
    info/3,
    answer/4,
    open/2,
    close/2,
    do_handle_cast/2,
    do_handle_call/3
]).


% --------------------------------------------------------------------
% External API
% --------------------------------------------------------------------
%% 开启活动
start_activity(_Activity) ->
    sup_activity:stop_activity(?SERVER), %% 有可能运营没有停止上一个运营活动就，开启下一个的不同活动，确保停掉上一个活动
    Child = {?SERVER, {?MODULE, start_link, [_Activity]},
        transient, 10000, worker, [?MODULE]},
    _ = sup_activity:start_activity(Child),
    start_event().

%% 停止活动
stop_activity(_Activity) ->
    clear_guild_data(),
    sup_activity:stop_activity(?SERVER),
    stop_event().

start_link(Activity) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [Activity], []).

answer(RoleID, GuildID, Answer, Lv) ->
    call({answer, RoleID, GuildID, Answer, Lv}).

%% 玩家信息
info(RoleID, RoleSid, GuildID) ->
    cast({info, RoleID, RoleSid, GuildID}).

open(RoleID, GuildID) ->
    cast({open, RoleID, GuildID}).

close(RoleID, GuildID) ->
    cast({close, RoleID, GuildID}).

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
    ets:new(?ETS_GUILD_QUESTION, ?ETS_KEY_CURRENCY(1)),
    {ok, State} = init_state(Activity),
    NewState1 = init_data(State),
    %% 延迟一秒后开始正式答题
    SaveRef = erlang:send_after(1 * 1000, self(), {state_change, ?BEGIN_QUSETION_STEP}),
    erlang:process_flag(trap_exit, true),
    {ok, NewState1#guild_question{ref = SaveRef}}.

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

do_handle_call({answer, RoleID, GuildID, Answer, Lv}, _From, State) ->
    case catch role_answer(RoleID, GuildID, Answer, Lv, State) of
        {ok, IsBingo} ->
            {reply, {ok, IsBingo}, State};
        {error, Code} ->
            {reply, {error, Code}, State}
    end;

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({info, RoleID, RoleSid, GuildID}, State) ->
    notify_question_single(RoleID, RoleSid, GuildID, State),
    {noreply, State};

%% 答题
do_handle_cast({state_change, ?BEGIN_QUSETION_STEP}, #guild_question{ref = Ref, round = Round} = State) ->
    util:cancel_timer(Ref),
    NewState =
    case Round =:= ?TOTAL_QUESTION_NUM of
        true ->
            State#guild_question{begin_time = 0, step = ?STEP_COMPLETE, ref = undefined};
        _ ->
            NewRef = erlang:send_after(?ANSWER_LAST_TIME * 1000, self(), {state_change, ?BETIN_WAIT_STEP}),
            State#guild_question{begin_time = time:unixtime(), round = Round + 1, ref = NewRef}
    end,
    notify_question(NewState),
    {noreply, NewState};

do_handle_cast({state_change, ?BETIN_WAIT_STEP}, #guild_question{ref = Ref} = State) ->
    util:cancel_timer(Ref),
    fix_role_question(State),
    NewRef = erlang:send_after(?WAIT_TIME * 1000, self(), {state_change, ?BEGIN_QUSETION_STEP}),
    NewState = State#guild_question{ref = NewRef},
    {noreply, NewState};

do_handle_cast({open, RoleID, GuildID}, #guild_question{notify_list = NList} = State) ->
    NewNList =
    case lists:keyfind(GuildID, 1, NList) of
        {GuildID, RoleList} ->
            lists:keystore(GuildID, 1, NList, {GuildID, [RoleID | RoleList]});
        _ ->
            lists:keystore(GuildID, 1, NList, {GuildID, [RoleID]})
    end,
    NewState = State#guild_question{notify_list = NewNList},
    {noreply, NewState};

do_handle_cast({close, RoleID, GuildID}, #guild_question{notify_list = NList} = State) ->
    NewNList =
    case lists:keyfind(GuildID, 1, NList) of
        {GuildID, RoleList} ->
            lists:keystore(GuildID, 1, NList, {GuildID, RoleList -- [RoleID]});
        _ ->
            NList
    end,
    NewState = State#guild_question{notify_list = NewNList},
    {noreply, NewState};

do_handle_cast(_Request, State) ->
    {noreply, State}.

start_event() -> ok.

stop_event() -> ok.

init_state(Activity) ->
    StartTime = lib_activity:get_start_time(Activity),
    EndTime = lib_activity:get_end_time(Activity),
    State = #guild_question{start_time = StartTime, end_time = EndTime},
    {ok, State}.

init_data(State) ->
    IDList = conf_question_bank:get_ids(),
    ChooseList = util:list_rand_n(IDList, ?TOTAL_QUESTION_NUM),
    Fun = fun(ConfID, {Acc, Index}) ->
        {[{Index, ConfID}|Acc], Index + 1}
    end,
    {List, _} = lists:foldl(Fun, {[], 1}, ChooseList),
    State#guild_question{question_list = List}.

%% 通知玩家答题进度
notify_question(State) ->
    #guild_question{question_list = QList, round = Round, begin_time = BeginTime, step = Step, notify_list = NList} = State,
    {_, ConfID} = lists:keyfind(Round, 1, QList),
    lists:foreach(fun({GuildID, RoleList}) ->
        GuildData = get_guild_data(GuildID),
        #{rank := Ranks, role_datas := RoleDatas} = GuildData,
        SortRanks = sort_rank(Ranks),
        SortRoleList = lists:usort(RoleList),
        lists:foreach(fun(RoleID) ->
            {RoleRank, RoleScore} =
            case lists:keyfind(RoleID, 2, SortRanks) of
                {Rank, RoleID, Score} ->
                    {Rank, Score};
                _ ->
                    {0, 0}
            end,
            RoleData = util:dict_find(RoleID, RoleDatas, #question_role_data{id = RoleID}),
            #{bingo_num := BingoNum, answer_list := AList} = RoleData,
            RealAList = get_real_answer_list(AList, Round),
            Rec = #sc_question_info{
                state = Step,
                ranks = lists:sublist(lists:sort(SortRanks), 1, 5),
                my_rank = RoleRank,
                my_score = RoleScore,
                index = Round,
                conf_id = ConfID,
                begin_time = BeginTime,
                bingo_num = BingoNum,
                answer_list = RealAList
            },
            {ok, Bin} = prot_msg:encode_msg(50102, Rec),
            lib_role_send:send_to_role(RoleID, Bin)
        end, SortRoleList)
    end, NList).

%% 单独通知玩家
notify_question_single(RoleID, RoleSid, GuildID, State) ->
    #guild_question{question_list = QList, round = Round, begin_time = BeginTime, step = Step} = State,
    GuildData = get_guild_data(GuildID),
    #{rank := Ranks, role_datas := RoleDatas} = GuildData,
    SortRanks = sort_rank(Ranks),
    {_, ConfID} = lists:keyfind(Round, 1, QList),
    {RoleRank, RoleScore} =
        case lists:keyfind(RoleID, 2, SortRanks) of
            {Rank, RoleID, Score} ->
                {Rank, Score};
            _ ->
                {0, 0}
        end,
    RoleData = util:dict_find(RoleID, RoleDatas, #question_role_data{id = RoleID}),
    #{bingo_num := BingoNum, answer_list := AList} = RoleData,
    RealAList = get_real_answer_list(AList, Round),
    Rec = #sc_question_info{
        state = Step,
        ranks = lists:sublist(lists:sort(SortRanks), 1, 5),
        my_rank = RoleRank,
        my_score = RoleScore,
        index = Round,
        conf_id = ConfID,
        begin_time = BeginTime,
        bingo_num = BingoNum,
        answer_list = RealAList
    },
    {ok, Bin} = prot_msg:encode_msg(50102, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

get_real_answer_list(_, 0) -> [];
get_real_answer_list([], 1) -> [];
get_real_answer_list(AList, 1) -> AList;
get_real_answer_list(AList, Round) ->
    lists:foldl(fun(Index, AccList) ->
        case lists:keyfind(Index, 1, AccList) of
            false ->
                lists:keystore(Index, 1, AccList, {Index, 0, 0, 0});
            _ ->
                AccList
        end
    end, AList, lists:seq(1, Round - 1)).

%% 玩家答题
role_answer(RoleID, GuildID, Answer, Lv, State) ->
    #guild_question{question_list = QList, round = Round, begin_time = BeginTime, step = Step} = State,
    Now = time:unixtime(),
    Now =< BeginTime + ?ANSWER_LAST_TIME orelse erlang:throw({error, ?RC_QUESTION_TIME_OUT}),
    Step =:= ?STEP_BEGIN orelse erlang:throw({error, ?RC_QUESTION_ALREADY_COMPLETE}),
    {_, ConfID} = lists:keyfind(Round, 1, QList),
    #{answer := RightAnwser} = conf_question_bank:get(ConfID),
    GuildData = get_guild_data(GuildID),
    #{rank := Ranks, role_datas := RoleDatas} = GuildData,
    RoleData = util:dict_find(RoleID, RoleDatas, #question_role_data{id = RoleID}),
    #{answer_list := AList, bingo_num := BingoNum} = RoleData,
    not proplists:is_defined(Round, AList) orelse erlang:throw({error, ?RC_QUESTION_ALREADY_ANSWER}),
    IsBingo = Answer =:= RightAnwser,
    NewBingoNum = ?iif(IsBingo, BingoNum + 1, BingoNum),
    NewAList = [{Round, Answer, Lv, ConfID} | AList],
    UseTime = Now - BeginTime,
    GetScore = ?iif(IsBingo, conf_question_score:get(?ANSWER_LAST_TIME - UseTime), 0),
    {TotalScore, OldUseTime} =
    case lists:keyfind(RoleID, 1, Ranks) of
        {RoleID, TotalScoreT, OldUseTimeT} -> {TotalScoreT, OldUseTimeT};
        _ -> {0, 0}
    end,
    NewTotalScore = TotalScore + GetScore,
    NewUseTime = OldUseTime + UseTime,
    NewRanks = lists:keystore(RoleID, 1, Ranks, {RoleID, NewTotalScore, NewUseTime}),
    NewRoleData = RoleData#{answer_list => NewAList, bingo_num => NewBingoNum},
    NewRoleDatas = dict:store(RoleID, NewRoleData, RoleDatas),
    NewGuildData = GuildData#{role_datas => NewRoleDatas, rank => NewRanks},
    set_guild_data(GuildID, NewGuildData),
    {ok, IsBingo}.

%% 对打开界面没有进行答题的玩家发答错题奖励
fix_role_question(State) ->
    #guild_question{round = Round, notify_list = NList} = State,
    lists:foreach(fun({GuildID, RoleList}) ->
        GuildData = get_guild_data(GuildID),
        #{role_datas := RoleDatas} = GuildData,
        SortRoleList = lists:usort(RoleList),
        lists:foreach(fun(RoleID) ->
            RoleData = util:dict_find(RoleID, RoleDatas, #question_role_data{id = RoleID}),
            #{answer_list := AList} = RoleData,
            case lists:keyfind(Round, 1, AList) of
                false ->
                    NewAList = [{Round, 0, 0, 0} | AList],
                    NewRoleData = RoleData#{answer_list => NewAList},
                    NewRoleDatas = dict:store(RoleID, NewRoleData, RoleDatas),
                    NewGuildData = GuildData#{role_datas => NewRoleDatas},
                    set_guild_data(GuildID, NewGuildData),
                    lib_role:mod_info(RoleID, lib_role_guild_question, fix_question),
                    ok;
                _ ->
                    skip
            end
        end, SortRoleList)
    end, NList).

%% @doc 排序
sort_rank(List) ->
    Fun = fun(A, B) -> compare_rank(A, B) end,
    SortRank = lists:sort(Fun, List),
    make_client_rank(SortRank, [], 1).

compare_rank(RankA, RankB) ->
    {_, A, UseTimeA} = RankA,
    {_, B, UseTimeB} = RankB,
    cmp([{A, B}, {UseTimeB, UseTimeA}]).

cmp([]) ->
    true;
cmp([{Ka, Kb} | T]) ->
    if
        Ka > Kb -> true;
        Ka < Kb -> false;
        true -> cmp(T)
    end.

make_client_rank([], List, _) -> lists:reverse(List);
make_client_rank([{RoleID, Score, _UseTime} | T], List, Rank) ->
    make_client_rank(T, [{Rank, RoleID, Score} | List], Rank + 1).
%% =============================================================

%% @doc role data
get_guild_data(GuildID) ->
    case util:get_ets(?ETS_GUILD_QUESTION, GuildID) of
        GuildData when is_map(GuildData) -> GuildData;
        _ -> ?question_guild_data#{guild_id => GuildID, role_datas => dict:new()}
    end.

set_guild_data(GuildID, GuildData) ->
    util:put_ets(?ETS_GUILD_QUESTION, GuildID, GuildData).

clear_guild_data() ->
    util:cls_ets(?ETS_GUILD_QUESTION).
