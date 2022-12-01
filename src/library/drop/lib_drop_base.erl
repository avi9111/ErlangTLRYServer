%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     掉落
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_drop_base).

-include("drop.hrl").
-include("role.hrl").
-include("goods.hrl").
-include("common.hrl").
-include("op_type.hrl").

-compile(export_all).
-export([
    format_drop/1,
    get_drop_info/1,
    get_drop_goods/1,
    get_drop_goods/2,
    get_special_drop_type/2
]).

%% @doc 获取掉落信息, DropID | {DropID, Mul} | {DropList, Mul} | [DropID] | [{DropID, Multiple}]
get_drop_goods(Drop) ->
    get_drop_goods(Drop, []).

get_drop_goods(DropIDList, SpLimList) when is_list(DropIDList), is_list(SpLimList) ->
    GoodsList = lists:map(fun
        (DropID) when is_integer(DropID) ->
            get_drop_info(DropID, SpLimList);
        ({DropID, Num}) when is_integer(DropID) ->
            multi_drop(DropID, SpLimList, Num, []);
            % lib_role_assets:mul_items(get_drop_info(DropID, SpLimList), Num);
        ({DropList, Num}) when is_list(DropList) ->
            lists:concat([multi_drop(DropID, SpLimList, Num, []) || DropID <- DropList])
            % [lib_role_assets:mul_items(get_drop_info(DropID, SpLimList), Num) || DropID <- DropList]
    end, DropIDList),
    lib_role_assets:merge_add_items(GoodsList);
get_drop_goods(DropID, SpLimList) when is_list(SpLimList) ->
    get_drop_goods([DropID], SpLimList).

%% @doc 获取掉落包数据
get_drop_info(DropID) ->
    get_drop_info(DropID, []).

get_drop_info(DropID, SpecialType) ->
    case conf_drop:get(DropID) of
        #{} = ConfDrop ->
            #{
                fix_goods_list := FixGList,
                choose_times_a := ChooseTimesA,
                choose_goods_list_a := ChooseGListA,
                choose_times_b := ChooseTimesB,
                choose_goods_list_b := ChooseGListB,
                choose_times_c := ChooseTimesC,
                choose_goods_list_c := ChooseGListC,
                special_choose_times := SpChooseTimes,
                special_choose_goods_list := SpChooseGList
            } = ConfDrop,
            RandGListA = get_rand_goods_list(ChooseTimesA, ChooseGListA),
            RandGListB = get_rand_goods_list(ChooseTimesB, ChooseGListB),
            RandGListC = get_rand_goods_list(ChooseTimesC, ChooseGListC),
            SpRandGList = get_special_rand_goods_list(SpChooseTimes, SpChooseGList, SpecialType),
            lists:flatten([FixGList, RandGListA, RandGListB, RandGListC, SpRandGList]);
        _ ->
            []
    end.

%% 获取特殊随机物品列表
get_special_rand_goods_list(ChooseTimes, GoodsList, SpecialTypeList)
    when ChooseTimes =:= [] orelse GoodsList =:= [] orelse SpecialTypeList =:= [] ->
    [];
get_special_rand_goods_list(ChooseTimes, GoodsList, SpecialTypeList) ->
    lists:map(fun(SpecialType) ->
        case lists:keyfind(SpecialType, 1, GoodsList) of
            false ->
                [];
            {_, GList} when is_list(GList) ->
                ChooseTimesT =
                    case lists:keyfind(SpecialType, 1, ChooseTimes) of
                        false -> [];
                        {_, ChooseTimesT1} -> ChooseTimesT1
                    end,
                PickNum = get_choose_times(ChooseTimesT),
                rand_goods_by_weight(GList, PickNum)
        end
    end, SpecialTypeList).

%% 获取随机物品列表
get_rand_goods_list([], []) ->
    [];
get_rand_goods_list(ChooseTimes, GoodsList) ->
    PickNum = get_choose_times(ChooseTimes),
    rand_goods_by_weight(GoodsList, PickNum).

%% 获取抽取次数
get_choose_times(ChooseTimes) ->
    case util:find_ratio(ChooseTimes, 0, util:rand(1, ?DROP_BASE_RATIO)) of
        [] -> 0;
        PickNum -> PickNum
    end.

%% 依据权重，从元组列表中随机挑选N个元素，返回被抽中的元组列表，根据最大抽取次数放回
%% @Param: Tuples: 元组列表([{{类型, 类型参数}, 权重, 最大抽取次数}, ...])
%%         WIndex: 权重所在的位置(如上例则是2)
%%         TIndex: 放回次数所在的位置(如上例则是3)
%%         PickNum: 随机抽出的次数
rand_goods_by_weight(_Tuples, 0) ->
    [];
rand_goods_by_weight(Tuples, PickNum) when PickNum > 0 ->
    rand_goods_by_weight(Tuples, PickNum, []).

rand_goods_by_weight(_Tuples, 0, Ret) ->
    Ret;
rand_goods_by_weight([], _PickNum, Ret) ->
    Ret;
rand_goods_by_weight(Tuples, PickNum, Ret) ->
    PickOne = util:rand_by_weight(Tuples, 2),
    LeftTuples =
        case PickOne of
            {{_Type, _Value}, _Weight, BackTimes} when BackTimes =< 1 ->
                lists:delete(PickOne, Tuples);
            {{Type, Value}, Weight, BackTimes} ->
                lists:keyreplace({Type, Value}, 1, Tuples, {{Type, Value}, Weight, BackTimes - 1})
        end,
    {Key, _, _} = PickOne,
    rand_goods_by_weight(LeftTuples, PickNum - 1, [Key | Ret]).

%% @doc 获取特殊限制掉落类型: 指定时间段内才掉落等等
get_special_drop_type([], List) ->
    lists:flatten(List);
get_special_drop_type([V | L], List) ->
    TypeList = get_special_drop_type(V),
    get_special_drop_type(L, [TypeList | List]).

get_special_drop_type({?DROP_TIME_OP, [NowTime, OpenTime]}) -> %% 获取开服时间类型
    OpenDay = util:get_open_days(NowTime, OpenTime),
    OpTimeList = conf_special_drop_limit:get(?DROP_TIME_OP),
    [Type || {Type, [Begin, End]} <- OpTimeList, OpenDay >= Begin andalso OpenDay =< End];
get_special_drop_type({?DROP_TIME_MG, [NowTime, MergeTime]}) -> %% 获取合服时间类型
    MergeDay = util:get_merge_days(NowTime, MergeTime),
    MgTimeList = conf_special_drop_limit:get(?DROP_TIME_MG),
    [Type || {Type, [Begin, End]} <- MgTimeList, MergeDay >= Begin andalso MergeDay =< End];
get_special_drop_type({?DROP_TIME_SP, [NowTime]}) -> %% 获取指定时间类型
    SpTimeList = conf_special_drop_limit:get(?DROP_TIME_SP),
    [Type || {Type, [Begin, End]} <- SpTimeList, NowTime >= Begin andalso NowTime =< End];
get_special_drop_type(_) ->
    [].

%% -----------------------------------------------------------------------------

%% @doc 格式化掉落包
format_drop(DropID) ->
    Goods = lib_drop_base:get_drop_goods(DropID),
    lib_role_assets:fmt_items(Goods).

% 多次掉落
multi_drop(DropId, SpLimList, Num, AccDropInfos) when Num > 0 ->
    DropInfo = get_drop_info(DropId, SpLimList),
    multi_drop(DropId, SpLimList, Num - 1, [DropInfo | AccDropInfos]);
multi_drop(_DropId, _SpLimList, _Num, AccDropInfos) ->
    AccDropInfos.
