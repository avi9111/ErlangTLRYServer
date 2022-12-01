%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     科举考试
%%% @end
%%% Created : 12. 十一月 2018 20:11
%%%-------------------------------------------------------------------
-module(svr_examine).

-behaviour(gen_server).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_515.hrl").

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
    cast/1,
    call/1
]).

-export([
    answer_all/3,
    get_rank/1,
    daily_clear/0
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

-record(state, {
    rank = []
}).
%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

answer_all(RoleID, RightNum, UseTime) ->
    cast({answer_all, RoleID, RightNum, UseTime}).

get_rank(RoleSid) ->
    cast({get_rank, RoleSid}).

daily_clear() ->
    cast(daily_clear).

%% @doc call
call(Request) ->
    case dist:whereis_name(?SCOPE, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(Request) ->
    case dist:whereis_name(?SCOPE, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    Rank = get_rank_data(),
    erlang:process_flag(trap_exit, true),
    {ok, #state{rank = Rank}}.

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

do_handle_cast({answer_all, RoleID, RightNum, UseTime}, #state{rank = Rank} = State) ->
    NewRank = update_rank(RoleID, {RoleID, RightNum, UseTime}, Rank),
    NewState = State#state{rank = NewRank},
    {noreply, NewState};

do_handle_cast({get_rank, RoleSid}, #state{rank = Rank} = State) ->
    ClientRank = make_client_sort_rank(Rank),
    MsgRecord = #sc_examine_rank{ranks = ClientRank},
    {ok, Bin} = prot_msg:encode_msg(51506, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {noreply, State};

do_handle_cast({role_delete, RoleIDs}, #state{rank = Rank} = State) ->
    RankN = lists:foldl(fun(RoleID, Acc) ->
        lists:keydelete(RoleID, 1, Acc)
    end, Rank, RoleIDs),
    {noreply, State#state{rank = RankN}};
do_handle_cast(daily_clear, #state{rank = Rank} = State) ->
    send_daily_rank_reward(Rank),
    NewState = State#state{rank = []},
    {noreply, NewState};

do_handle_cast(_Request, State) ->
    {noreply, State}.

%%====================private===============
%% @doc 更新排行榜
update_rank(Key, Val, List) ->
    OldLen = length(List),
    case OldLen < 20 of
        true ->
            sort_rank(lists:keystore(Key, 1, List, Val));
        _ ->
            case compare_rank(Val, lists:last(List)) of
                true ->
                    lists:sublist(sort_rank(lists:keystore(Key, 1, List, Val)), 20);
                _ ->
                    List
            end
    end.

%% @doc 排序
sort_rank(List) ->
    Fun = fun(A, B) -> compare_rank(A, B) end,
    lists:sort(Fun, List).

compare_rank(RankA, RankB) ->
    {_, A, TimeA} = RankA,
    {_, B, TimeB} = RankB,
    cmp([{A, B}, {TimeB, TimeA}]).

cmp([]) ->
    true;
cmp([{Ka, Kb} | T]) ->
    if
        Ka > Kb -> true;
        Ka < Kb -> false;
        true -> cmp(T)
    end.

make_client_sort_rank(List) ->
    assign_rank(List, [], 1, 20).

assign_rank(_, Acc, Rank, EndRank) when Rank > EndRank ->
    lists:reverse(Acc);
assign_rank([], Acc, _Rank, _EndRank) ->
    lists:reverse(Acc);
assign_rank([{RoleID, _RightNum, _Time} | T], Acc, Rank, EndRank) ->
    NewAcc = [{Rank, lib_cache:get_role_name(RoleID)} | Acc],
    assign_rank(T, NewAcc, Rank + 1, EndRank).

send_daily_rank_reward(Rank) ->
    send_daily_rank_reward(Rank, 1).
send_daily_rank_reward([], _) -> ok;
send_daily_rank_reward([{RoleID, _, _} | T], Rank) ->
    Lv = lib_cache:get_role_level(RoleID),
    #{rank_reward := RankReward} = conf_examine_reward:get(Lv),
    DropID = util:get_zone_config(RankReward, Rank, 0),
    ?iif(DropID > 0, svr_mail:sys2p(RoleID, 1301, [Rank], DropID, ?OPT_EXAMINE), skip),
    send_daily_rank_reward(T, Rank + 1).

-define(SQL_GET_RANK_DATA, <<"select role_id, right_num, (end_time - begin_time) from role_examine where end_time > 0 and answer_num = 10 and begin_time > ~w order by (end_time - begin_time) asc limit 20">>).
get_rank_data() ->
    SQL = io_lib:format(?SQL_GET_RANK_DATA, [time:unixdate()]),
    case ?DB:get_all(SQL) of
        List when is_list(List) ->
            [{RoleID, RightNum, UseTime} || [RoleID, RightNum, UseTime] <- List];
        _ ->
            []
    end.