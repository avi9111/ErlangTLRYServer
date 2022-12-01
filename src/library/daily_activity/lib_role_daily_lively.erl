%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     每日活跃
%%% @end
%%% Created : 27. 十一月 2018 10:03
%%%-------------------------------------------------------------------
-module(lib_role_daily_lively).

-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("dungeon.hrl").
-include("assets.hrl").
-include("keyvalue.hrl").
-include("goods.hrl").
-include("proto/prot_524.hrl").
-include("proto/prot_531.hrl").

%% API
-export([
    do/3,
    event/2,
    init/1,
    info/1,
    get_reward/2,
    cross_day/1,
    save/1,
    dungen_map/1,
    calc_lively/1,
    handle_info/2,
    trigger_event/3
]).

-export([
    send_info/1,
    get_retrieve/4,
    get_completed_times/2
]).

trigger_event(RoleID, ID, Times) ->
    %% 帮派工资
    WagesID = lib_role_guild_wages:id_map(ID),
    WagesID > 0 andalso lib_role_guild_wages:trigger_event(RoleID, WagesID, Times),
    %% 开服红利
    lib_role:mod_info(RoleID, ?MODULE, {'trigger_event', ID, Times}).

event(PS, {'finish_dung', DungType, _DungID, Times}) ->
    ?iif(lists:member(DungType, ?DAILY_LIVELY_DUNGS), handle_trigger_event(PS, dungen_map(DungType), Times), skip);
event(_, _) ->
    skip.

do(52401, PS, _Req) ->
    info(PS);
do(52403, PS, #cs_daily_lively_get{id = ID}) ->
    get_reward(PS, ID);
do(_, _, _) ->
    skip.

handle_info({'trigger_event', ID, Times}, PS) ->
    handle_trigger_event(PS, ID, Times);
handle_info(_, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    {Reward, Completed, Retrieve, LastCheck, Updated} = get_role_db_data(RoleID),
    Now = time:unixtime(),
    RoleData =
        case time:get_diff_days(LastCheck) of
            0 ->
                #{reward => Reward, completed => fix_completed(Completed), retrieve => Retrieve, last_check => LastCheck, updated => Updated};
            1 -> %% 隔一天
                CompletedN = init_completed(),
                RetrieveN = make_last_retrieve(Lv, fix_completed(Completed)),
                #{reward => [], completed => CompletedN, retrieve => RetrieveN, last_check => Now, updated => true};
            _ -> %% 隔多天
                CompletedN = init_completed(),
                RetrieveN = make_last_retrieve(Lv, CompletedN),
                #{reward => [], completed => CompletedN, retrieve => RetrieveN, last_check => Now, updated => true}
        end,
    set_role_data(RoleID, RoleData).

%% 生成昨日找回
make_last_retrieve(Lv, Completed) ->
    IDs = conf_retrieve:get_ids(),
    lists:foldl(fun(ID, Acc) ->
        case conf_activity_hall:get(ID) of
            #{times := Times, level := NeedLv} when Times > 0 andalso Lv >= NeedLv ->
                case lists:keyfind(ID, 1, Completed) of
                    {_, Cn} when Cn > 0 ->
                        Acc;
                    _ ->
                        [{ID, 1} | Acc]
                end;
            _ ->
                Acc
        end
    end, [], IDs).


info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{reward := Reward, completed := Completed} = RoleData,
    LivelyExp = calc_lively(Completed),
    MsgRecord = #sc_daily_lively_info{lively_exp = LivelyExp, got_list = Reward, completed = Completed},
    {ok, Bin} = prot_msg:encode_msg(52402, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

get_reward(PS, ID) ->
    case catch check_get_reward(PS, ID) of
        {ok, RoleData, DropID} ->
            update_role_data(PS#role_state.id, RoleData),
            lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_DAILY_LIVELY),
            MsgRecord = #sc_daily_lively_get{id = ID},
            {ok, Bin} = prot_msg:encode_msg(52404, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{reward := Reward, completed := Completed} = RoleData,
    not lists:member(ID, Reward) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    LivelyExp = calc_lively(Completed),
    #{reward := RewardList} = conf_daily_lively_reward:get(),
    Conf = lists:keyfind(ID, 1, RewardList),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    {_, NeedExp, DropID} = Conf,
    LivelyExp >= NeedExp orelse erlang:throw({error, ?RC_WELFARE_EXP_LIMIT}),
    NewReward = [ID | Reward],
    NewRoleData = RoleData#{reward => NewReward},
    {ok, NewRoleData, DropID}.

calc_lively(RoleID) when is_integer(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{completed := Completed} = RoleData,
    calc_lively(Completed);
calc_lively(Completed) ->
    Exp =
        lists:foldl(fun({ID, Times}, Acc) ->
            #{add_exp := AddExp} = conf_activity_hall:get(ID),
            Acc + AddExp * Times
        end, 0, Completed),
    #{max_exp := MaxExp} = conf_daily_lively_reward:get(),
    min(Exp, MaxExp).

handle_trigger_event(PS, ID, Times) ->
    case catch check_trigger_event(PS, ID, Times) of
        {ok, RoleData, Completed, AddExp} ->
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_daily_lively_change{lively_exp = calc_lively(Completed), completed = Completed},
            {ok, Bin} = prot_msg:encode_msg(52405, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            (PS#role_state.guild_id > 0 andalso AddExp > 0)
                andalso lib_role:mod_info(PS#role_state.id, lib_role_guild, {add_live_exp, AddExp}),
            ?TASK_EVENT(PS#role_state.id, daily_lively),
            lib_role_dividend:add_server_lively(PS#role_state.id, ID, Times, Completed),
            ok;
        _ ->
            skip
    end.

check_trigger_event(PS, ID, Times) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{completed := Completed} = RoleData,
    Conf = conf_activity_hall:get(ID),
    Conf =/= undefined orelse erlang:throw(error),
    #{times := MaxTimes} = Conf,
    OldTimes = util:prop_get_value(ID, Completed, 0),
    OldTimes < MaxTimes orelse erlang:throw(error),
    NewTimes = min(OldTimes + Times, MaxTimes),
    NewCompleted = util:prop_store(ID, NewTimes, Completed),
    OldExp = calc_lively(Completed),
    NewExp = calc_lively(NewCompleted),
    #{max_exp := MaxExp} = conf_daily_lively_reward:get(),
    AddExp = ?iif(OldExp >= MaxExp, 0, ?iif(NewExp >= MaxExp, MaxExp - OldExp, NewExp - OldExp)),
    NewRoleData = RoleData#{completed => NewCompleted},
    IsFirstMax = OldTimes < MaxExp andalso NewExp >= MaxExp,
    IsFirstMax andalso lib_role:mod_info(RoleID, lib_role_sign, add_times),
    {ok, NewRoleData, NewCompleted, AddExp}.

cross_day(PS) ->
    #role_state{id = RoleID, sid = RoleSid, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #{completed := OldCompleted} = RoleData,
    Retrieve = make_last_retrieve(Lv, fix_completed(OldCompleted)),
    Completed = init_completed(),
    NewRoleData = RoleData#{reward => [], completed => Completed, retrieve => Retrieve, last_check => time:unixtime()},
    update_role_data(RoleID, NewRoleData),
    MsgRecord = #sc_daily_lively_info{lively_exp = 0, got_list = [], completed = Completed},
    {ok, Bin} = prot_msg:encode_msg(52402, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

dungen_map(DungenType) ->
    case DungenType of
        ?DUNG_TEAM_RING -> 1001;
        ?DUNG_TEAM_DOCK -> 1002;
        ?DUNG_TEAM_VILLA -> 1003;
        ?DUNG_TEAM_PEAK -> 1004;
        ?DUNG_TEAM_CHESSBOARD -> 10;
        ?DUNG_TEAM_SH -> 1015;
        ?DUNG_TEAM_HERO_RING -> 1018;
        ?DUNG_TEAM_HERO_DOCK -> 1019;
        ?DUNG_TEAM_HERO_VILLA -> 1020;
        ?DUNG_TEAM_HERO_PEAK -> 1021;
        _ -> 0
    end.

init_completed() ->
    IDs = conf_activity_hall:get_ids(),
    [{ID, 0} || ID <- IDs].

fix_completed(Completed) ->
    IDs = conf_activity_hall:get_ids(),
    case length(IDs) =:= length(Completed) of
        true ->
            Completed;
        _ ->
            lists:foldl(fun(ID, Acc) ->
                case lists:keymember(ID, 1, Acc) of
                    true ->
                        Acc;
                    _ ->
                        [{ID, 0} | Acc]
                end
            end, Completed, IDs)
    end.

%% 获得完成次数
get_completed_times(RoleID, ID) ->
    RoleData = get_role_data(RoleID),
    #{completed := Completed} = RoleData,
    util:prop_get_value(ID, Completed, 0).

%% --------------------------------- 找回 -------------------------------
send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    Retrieve = maps:get(retrieve, RoleData, []),
    MsgRecord = #sc_retrieve_info{retrieve = Retrieve},
    {ok, Bin} = prot_msg:encode_msg(53141, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 找回
get_retrieve(PS, ID, Type, RTimes) ->
    case catch check_get_retrieve(PS, ID, Type, RTimes) of
        {ok, RoleData, CostItems, Reward, LeaveTimes, AssetsReward} ->
            NewPS = lib_role_assets:cost_items_notify(PS, CostItems, ?OPT_DAILY_RETRIEVE),
            {NewPS2, _} = lib_drop_api:give_drop_sync(NewPS, Reward, ?OPT_DAILY_RETRIEVE),
            NewPS3 = lib_role_assets:add_items_notify(NewPS2, AssetsReward, ?OPT_DAILY_RETRIEVE),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_retrieve_get{id = ID, times = LeaveTimes},
            {ok, Bin} = prot_msg:encode_msg(53143, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS3};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_retrieve(PS, ID, Type, _RTimes) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    Retrieve = maps:get(retrieve, RoleData, []),
    Tuple = lists:keyfind(ID, 1, Retrieve),
    Tuple =/= false orelse erlang:throw({error, ?RC_RETRIEVE_CAN_NOT}),
    {_, Times} = Tuple,
    Times > 0 orelse erlang:throw({error, ?RC_RETRIEVE_ALREADY_GOT}),
    Conf = conf_retrieve:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    %% 道具奖励
    #{coin_cost := CoinCost, item_cost := ItemCost, coin_reward := CoinRewardList, item_reward := ItemRewardList} = Conf,
    CoinReward = util:get_zone_config(CoinRewardList, Lv),
    ItemReward = util:get_zone_config(ItemRewardList, Lv),
    %% 货币奖励，等级相关
    #{coin_retrieve_reward := CoinAssetsRewadList, item_retrieve_reward := ItemAssetsRewadList} = conf_level:get(Lv),
    CoinAssetsReward = util:prop_get_value(ID, CoinAssetsRewadList),
    ItemAssetsReward = util:prop_get_value(ID, ItemAssetsRewadList),
    CoinAssetsReward =/= undefiend orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    ItemAssetsReward =/= undefiend orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    %% 消耗物品
    ItemID = config:get_sys_config(retrieve_item_id),
    ItemValue = config:get_sys_config(retrieve_item_value_gold),
    case Type =:= 1 of
        true -> %% 普通找回
            Reward = CoinReward,
            CostItems = [{?AST_COIN, CoinCost}],
            AssetsReward = CoinAssetsReward;
        _ ->    %% 道具找回
            %% 判断是否要扣除绑元or元宝
            Statics = lib_role_goods:bag_statics(RoleID, ?BAG_ID_ITEM),
            #{num := HaveNum} = util:dict_find(ItemID, Statics, ?goods_static#{}),
            CostItems =
                ?iif(
                    HaveNum >= ItemCost,
                    [{?AST_ITEM, [{ItemID, ItemCost}]}],
                    [{?AST_ITEM, [{ItemID, HaveNum}]}, {?AST_BGOLD_F, (ItemCost - HaveNum) * ItemValue}]
                ),
            Reward = ItemReward,
            AssetsReward = ItemAssetsReward
    end,
    lib_role_assets:check_items_enough(PS, CostItems),
    LeaveTimes = Times - 1,
    RetrieveN = lists:keystore(ID, 1, Retrieve, {ID, LeaveTimes}),
    NewRoleData = RoleData#{retrieve => RetrieveN},
    {ok, NewRoleData, CostItems, Reward, LeaveTimes, AssetsReward}.

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#{updated => true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

%% 下线保存
save(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    case Updated of
        true ->
            #{reward := Reward, completed := Completed, retrieve := Retrieve, last_check := LastCheck} = RoleData,
            save_role_data(RoleID, Reward, Completed, Retrieve, LastCheck);
        _ ->
            skip
    end.

-define(SQL_GET_ROLE_DATA, <<"select reward, completed, retrieve, last_check from role_daily_lively where role_id = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [DbReward, DbCompleted, DbRetrieve, LastCheck] ->
            Reward = type:convert_db_field(list, DbReward, []),
            Completed = type:convert_db_field(list, DbCompleted, []),
            Retrieve = type:convert_db_field(list, DbRetrieve, []),
            {Reward, Completed, Retrieve, LastCheck, false};
        [] ->
            {[], init_completed(), [], time:unixtime(), true}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_daily_lively(role_id, reward, completed, retrieve, last_check) values(~w, '~s', '~s', '~s', ~w)">>).
save_role_data(RoleID, Reward, Completed, Retrieve, LastCheck) ->
    DbReward = type:term_to_bitstring(Reward),
    DbCompleted = type:term_to_bitstring(Completed),
    DbRetrieve = type:term_to_bitstring(Retrieve),
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, DbReward, DbCompleted, DbRetrieve, LastCheck]),
    ?DB:execute(SQL).
