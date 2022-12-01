%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     帮派红包工具
%%% @end
%%% Created : 09. 一月 2019 11:42
%%%-------------------------------------------------------------------
-module(lib_lucky_money_util).

-include("common.hrl").
-include("guild.hrl").
-include("proto/prot_ud.hrl").

%% API
-export([
    loop/2,
    create_list/4,
%%    sort/1,
    sort_fetch_rank/1,
    make_client_sort_rank/1,
    make_lucky_money_list/1
]).

%% 生成一次红包分配列表
create_list(TotalGold, TotalNum, RdMin, RdMax) ->
    SendedGold = 0,
    SendedNum = 0,
    create_list_helper(SendedNum, TotalNum, TotalGold, SendedGold, RdMin, RdMax, [], false, false).

create_list_helper(SendedNum, TotalNum, TotalGold, SendedGold, RdMin, RdMax, Acc, MinFlag, MaxFlag) when SendedNum < TotalNum ->
    Avg = erlang:floor(TotalGold / TotalNum),
    LeftLen = Avg - RdMin,
    RightLen = RdMax - Avg,

    if
        RightLen =:= LeftLen ->
            MinCondition = ?iif(MinFlag, (TotalNum - SendedNum - 1) * RdMin, (TotalNum - SendedNum - 1) * (RdMin + 1)),
            MaxCondition = ?iif(MaxFlag, (TotalNum - SendedNum - 1) * RdMax, (TotalNum - SendedNum - 1) * (RdMax - 1)),
            BoundMin = max((TotalGold - SendedGold - MaxCondition), RdMin),
            BoundMax = min((TotalGold - SendedGold - MinCondition), RdMax);
        RightLen > LeftLen ->    %% 上限偏移
            Rate = LeftLen / (LeftLen + RightLen),
            StandardRdMax = Avg + LeftLen,      %% 右侧对称上限点
            RdMaxN = ?iif(can_reward(Rate), RdMax, StandardRdMax),
            MinCondition = ?iif(MinFlag, (TotalNum - SendedNum - 1) * RdMin, (TotalNum - SendedNum - 1) * (RdMin + 1)),
            MaxCondition = ?iif(MaxFlag, (TotalNum - SendedNum - 1) * StandardRdMax, (TotalNum - SendedNum - 1) * (StandardRdMax - 1)),
            BoundMin = max((TotalGold - SendedGold - MaxCondition), RdMin),
            BoundMax = min((TotalGold - SendedGold - MinCondition), RdMaxN);
        true ->                  %% 下限偏移
            Rate = RightLen / (LeftLen + RightLen),
            StandardRdMin = Avg - RightLen,     %% 左侧对称下限点
            RdMinN = ?iif(can_reward(Rate), RdMin, StandardRdMin),
            MinCondition = ?iif(MinFlag, (TotalNum - SendedNum - 1) * StandardRdMin, (TotalNum - SendedNum - 1) * (StandardRdMin + 1)),
            MaxCondition = ?iif(MaxFlag, (TotalNum - SendedNum - 1) * RdMax, (TotalNum - SendedNum - 1) * (RdMax - 1)),
            BoundMin = max((TotalGold - SendedGold - MaxCondition), RdMinN),
            BoundMax = min((TotalGold - SendedGold - MinCondition), RdMax)
    end,
    GetGold = get_random_val(BoundMin, BoundMax),
    {NewRdMin, NewMinFlag} = ?iif(not MinFlag andalso RdMin =:= GetGold, {RdMin + 1, true}, {RdMin, MinFlag}),
    {NewRdMax, NewMaxFlag} = ?iif(not MaxFlag andalso RdMax =:= GetGold, {RdMax - 1, true}, {RdMax, MaxFlag}),
    NewAcc = [GetGold | Acc],
    create_list_helper(SendedNum + 1, TotalNum, TotalGold, SendedGold + GetGold, NewRdMin, NewRdMax, NewAcc, NewMinFlag, NewMaxFlag);
create_list_helper(_, _, _, _, _, _, Acc, _, _) ->
    Acc.

%% 返回一次抽奖在指定中奖概率下是否中奖
can_reward(Rate) ->
    util:is_bingo(Rate * 10000).

%% 返回min~max区间内随机数，含min和max
get_random_val(Min, Max) ->
    util:rand(Min, Max).

loop(List, Now) ->
    SortFun = fun(A, B) ->
        A#lucky_money.id > B#lucky_money.id
    end,
    SortList = lists:sort(SortFun, List),
    #{show_num := ShowNum} = conf_guild_lucky_money_info:get(),
    lists:foldl(fun(LuckyMoney, {LeaveAcc, RemoveAcc}) ->
        #lucky_money{id = ID, expired_time = ExpireTime} = LuckyMoney,
        Num = length(LeaveAcc),
        case ExpireTime > Now andalso Num < ShowNum of
            true ->
                {[LuckyMoney | LeaveAcc], RemoveAcc};
            _ ->
                {LeaveAcc, [ID | RemoveAcc]}
        end
    end, {[], []}, SortList).


%% @doc 抢红包排序
sort_fetch_rank(List) ->
    Fun = fun(A, B) -> compare_rank(A, B) end,
    lists:sort(Fun, List).

compare_rank(RankA, RankB) ->
    {_, BgoldA, TimeA} = RankA,
    {_, BgoldB, TimeB} = RankB,
    cmp([{BgoldA, BgoldB}, {TimeB, TimeA}]).

cmp([]) ->
    true;
cmp([{Ka, Kb} | T]) ->
    if
        Ka > Kb -> true;
        Ka < Kb -> false;
        true -> cmp(T)
    end.

%% 生成客户端协议数据
make_client_sort_rank([]) ->
    [];
make_client_sort_rank(List) ->
    assign_rank(List, [], 1).

assign_rank([], Acc, _Rank) ->
    lists:reverse(Acc);
assign_rank([Data | T], Acc, Rank) ->
    {RoleID, Bgold, _} = Data,
    RoleName = lib_cache:get_role_name(RoleID),
    NewAcc = [{Rank, RoleID, RoleName, Bgold} | Acc],
    assign_rank(T, NewAcc, Rank + 1).

make_lucky_money_list(List) ->
%%    SortList = sort(List),
    lists:map(fun(LuckyMoney) ->
        #lucky_money{
            id = ID,
            cid = CID,
            sender = Sender,
            icon = Icon,
            fetch_list = FetchList,
            expired_time = ExpireTime
        } = LuckyMoney,
        #clt_lucky_money{
            id = ID,
            cid = CID,
            sender = Sender,
            icon = Icon,
            list = make_client_sort_rank(FetchList),
            expire_time = ExpireTime
        }
    end, List).