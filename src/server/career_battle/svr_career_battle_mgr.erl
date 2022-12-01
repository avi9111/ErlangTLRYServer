%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技[管理]
%%% @end
%%% Created : 31. 十月 2018 11:32
%%%-------------------------------------------------------------------
-module(svr_career_battle_mgr).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("career_battle.hrl").
-include("keyvalue.hrl").
-include("proto/prot_512.hrl").

-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2
]).

-export([
    start_activity/1,
    stop_activity/1,
    get_rank/4,
    p/0,
    cast/1,
    call/1
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).


%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

start_activity(Activity) ->
    cast({start_activity, Activity}),
    ok.

stop_activity(_Activity) ->
    cast(stop_activity),
    ok.

get_rank(RoleID, RoleSid, Career, Grade) ->
    cast({get_rank, RoleID, RoleSid, Career, Grade}).

%% @doc call
call(Request) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(Request) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% @doc
p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    {ok, #career_battle_mgr{}}.

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

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({start_activity, #{end_time := EndTime}}, State) ->
    CareerIds = conf_career_init:get_career_ids(),
    GradeIds = conf_career_battle_rank:get_grade_ids(),
    lists:foreach(fun(Career) ->
        lists:foreach(fun(Grade) ->
            SceneID = lib_role_career_battle:wait_scene(),
            RoomID = lib_role_career_battle:make_lounge_room_id(Career, Grade),
            svr_scene_mgr:add_scene_line_asyn(SceneID, RoomID),
            sup_career_battle_lounge:start_child(RoomID)
        end, GradeIds)
    end, CareerIds),
    #{match_interval := Interval, wait_time := WaitTime} = conf_career_battle_info:get(),
    Ref = erlang:send_after((Interval + WaitTime) * 1000, self(), begin_match),
    sup_career_battle_lounge:info_all(prepare_match),
    {noreply, State#career_battle_mgr{ref = Ref, end_time = EndTime}};
do_handle_cast(stop_activity, #career_battle_mgr{ref = Ref, bat_ref = BRef, rank_data = RankData} = State) ->
    util:cancel_timer(Ref),
    util:cancel_timer(BRef),
    BSceneID = lib_role_career_battle:battle_scene(),
    LSceneID = lib_role_career_battle:wait_scene(),
    svr_scene_mgr:close_scene(BSceneID),
    svr_scene_mgr:close_scene(LSceneID),
    %% 发送排名奖励
    send_reward(RankData),
    sup_career_battle_bat:stop_all(),
    sup_career_battle_lounge:stop_all(),
    util:cls_ets(?ETS_CAREER_BATTLE),
    util:cls_ets(?ETS_CAREER_BATTLE_U),
    {noreply, State#career_battle_mgr{rank_data = []}};
do_handle_cast(begin_match, #career_battle_mgr{ref = Ref, end_time = EndTime} = State) ->
    #{match_interval := Interval, battle_time := BattleTime} = conf_career_battle_info:get(),
    NewState =
        case time:unixtime() + BattleTime >= EndTime of
            false ->
                util:cancel_timer(Ref),
                sup_career_battle_lounge:info_all(begin_match),
                BRef = erlang:send_after(BattleTime * 1000, self(), battle_end),
                NewRef = erlang:send_after(Interval * 1000, self(), begin_match),
                State#career_battle_mgr{ref = NewRef, bat_ref = BRef};
            _ ->
                State
        end,
    {noreply, NewState};
do_handle_cast(battle_end, #career_battle_mgr{bat_ref = BRef} = State) ->
    util:cancel_timer(BRef),
    sup_career_battle_bat:info_all(battle_end),
    {noreply, State#career_battle_mgr{bat_ref = undefined}};
do_handle_cast({get_rank, RoleID, RoleSid, Career, Grade}, #career_battle_mgr{rank_data = RankData} = State) ->
    RoomID = lib_role_career_battle:make_lounge_room_id(Career, Grade),
    {Data, NewRankData} =
        case util:get_ets(?ETS_CAREER_BATTLE_U, RoomID) of
            undefined ->
                case lists:keyfind(RoomID, 1, RankData) of
                    {_, RoomRankData, _} ->
                        {RoomRankData, RankData};
                    _ ->
                        {[], RankData}
                end;
            _ ->
                RoomData = lib_role_career_battle:get_room_data(RoomID),
                RoomRankData = lib_role_career_battle:make_client_sort_rank(RoomData),
                util:del_ets(?ETS_CAREER_BATTLE_U, RoomID),
                RankDataN = lists:keystore(RoomID, 1, RankData, {RoomID, RoomRankData, RoomData}),
                {RoomRankData, RankDataN}
        end,
    #{show_rank := ShowRank} = conf_career_battle_info:get(),
    PageList = lists:sublist(Data, 1, ShowRank),
    ClientPageData = [{Rank, RoleName, GuildName, Score, Icon} || {Rank, _RoleID, RoleName, GuildName, Score, Icon} <- PageList],
    TargetRank = get_target_rank(RoleID, Data),
    Rec = #sc_career_battle_rank{
        ranks = ClientPageData,
        career = Career,
        grade = Grade,
        role_rank = TargetRank
    },
    {ok, Bin} = prot_msg:encode_msg(51214, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {noreply, State#career_battle_mgr{rank_data = NewRankData}};
do_handle_cast(_Request, State) ->
    {noreply, State}.

%% =============================================================================
%% Private
%% =============================================================================

send_reward(RankData) ->
    #{title_reward := TitleReward} = conf_career_battle_info:get(),
    NewRankData = ets:foldl(fun({RoomID, _}, Acc) ->
        RoomData = lib_role_career_battle:get_room_data(RoomID),
        RoomRankData = lib_role_career_battle:make_client_sort_rank(RoomData),
        lists:keystore(RoomID, 1, Acc, {RoomID, RoomRankData, RoomData})
    end, RankData, ?ETS_CAREER_BATTLE_U),
    TopInfo =
    lists:foldl(fun({_, _, RoomData}, TopAcc) ->
        SortData = lib_role_career_battle:sort_rank(RoomData),
        case SortData =:= [] of
            false ->
                [TopData | _] = SortData,
                #career_battle_role{id = RoleID, career = Career, grade = Grade} = TopData,
                Titles = util:prop_get_value(Career, TitleReward),
                Title = util:prop_get_value(Grade, Titles),
                CareerName = conf_career_init:get_career_name(Career),
                svr_mail:sys2p(RoleID, 1003, [CareerName], Title, ?OPT_CAREER_BATTLE),
                send_rank_reward(SortData, 1),
                [{Career, Grade, RoleID, lib_cache:get_role_name(RoleID), lib_cache:get_role_sex(RoleID)} | TopAcc];
            _ ->  %% 有玩家进来过，但是一场都没有打(开打之前退出了)
                TopAcc
        end
    end, [], NewRankData),
    lib_role_kv:set_kv(0, ?KEY_CAREER_BATTLE_TOP, TopInfo),
    Rec = #sc_career_battle_top{info = TopInfo},
    {ok, Bin} = prot_msg:encode_msg(51208, Rec),
    lib_role_send:broadcast(Bin),
    ok.

send_rank_reward([], _Rank) ->
    ok;
send_rank_reward([RoleData | T], Rank) ->
    #career_battle_role{id = RoleID, score = Score, career = Career, grade = Grade, battle_times = BattleTimes, reward = RewardList} = RoleData,
    send_battle_reward(BattleTimes, RewardList, Grade, RoleID),
    CareerName = conf_career_init:get_career_name(Career),
    GradeName = conf_career_battle_grade:get_grade_name(Grade),
    DropID = conf_career_battle_rank:get(Grade, Rank),
    svr_mail:sys2p(RoleID, 1002, [CareerName, GradeName, ?STR(Score), ?STR(Rank)], DropID, ?OPT_CAREER_BATTLE),
    ?TASK_EVENT(RoleID, {'career_battle_top', Rank}),
    send_rank_reward(T, Rank + 1).

send_battle_reward(BattleTimes, RewardList, Grade, RoleID) ->
    TimesList = conf_career_battle_times:get_grade_times(Grade),
    DropIDList =
        lists:foldl(fun(Times, Acc) ->
            case BattleTimes >= Times andalso (not lists:member(Times, RewardList)) of
                true ->
                    DropID = conf_career_battle_times:get(Grade, Times),
                    [DropID | Acc];
                _ ->
                    Acc
            end
        end, [], TimesList),
    ?iif(DropIDList =/= [], svr_mail:sys2p(RoleID, 1001, DropIDList, ?OPT_CAREER_BATTLE), skip).

get_target_rank(RoleID, RoomData) ->
    case lists:keyfind(RoleID, 2, RoomData) of
        {Rank, _, _, _, _, _} -> Rank;
        _ -> 0
    end.
