%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     开服红利
%%% @end
%%% Created : 22. 一月 2019 17:50
%%%-------------------------------------------------------------------
-module(lib_role_dividend).

-include("common.hrl").
-include("ret_code.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("activity.hrl").
-include("op_type.hrl").
-include("rank.hrl").
-include("proto/prot_538.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    send_info/1,
    cross_day/1,
    top_guild_reward/0,
    add_server_lively/4
]).

do(53801, PS, _Req) ->
    send_info(PS);
do(53803, PS, #cs_dividend_lv_get{id = ID}) ->
    get_lv_reward(PS, ID);
do(53805, PS, #cs_dividend_stone_get{id = ID}) ->
    get_stone_reward(PS, ID);
do(53808, PS, #cs_dividend_lucky_get{id = ID, type = Type}) ->
    get_lucky_reward(PS, Type, ID);
do(_, _, _) ->
    skip.

event(_PS, {'recharge', AddRmb}) ->
    add_server_charge(AddRmb);
event(_, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID} = PS,
    {LvList, StoneList, LivelyList, ChargeList, LastCheck} = get_role_db_data(RoleID),
    RoleData0 =
        #{
            lv_list => LvList, stone_list => StoneList, lively_list => LivelyList,
            charge_list => ChargeList, last_check => LastCheck, updated => false
        },
    RoleData =
    case time:is_today(LastCheck) of
        true ->
            RoleData0;
        _ ->
            RoleData0#{stone_list => [], last_check => time:unixtime(), updated => true}
    end,
    set_role_data(RoleID, RoleData).

send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{lv_list := LvList, stone_list := StoneList, lively_list := LivelyList, charge_list := ChargeList} = RoleData,
    SLvGotList = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_LV_GOT_LIST, []),
    SLively = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_LIVELY, 0),
    SCharge = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_CHARGE, 0),
    ClientStoneList = gain_client_stone_list(RoleID, StoneList),
    MsgRecord = #sc_dividend_info{
        lv_got_list = SLvGotList,
        lv_role_got_list = LvList,
        stone_got_list = ClientStoneList,
        lottery_lively = SLively,
        lively_got_list = gain_client_lucky_list(LivelyList),
        lottery_charge = SCharge,
        charge_got_list = gain_client_lucky_list(ChargeList)
    },
    {ok, Bin} = prot_msg:encode_msg(53802, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

gain_client_stone_list(RoleID, StoneList) ->
    IDs = conf_stone_gold:get_ids(),
    lists:map(fun(ID) ->
        CompletedTimes = lib_role_daily_lively:get_completed_times(RoleID, ID),
        #{times := NeedTimes} = conf_activity_hall:get(ID),
        case lists:member(ID, StoneList) of
            true ->
                {ID, CompletedTimes, ?REWARD_STATE_GOT};
            false when CompletedTimes >= NeedTimes ->
                {ID, CompletedTimes, ?REWARD_STATE_CAN};
            _ ->
                {ID, CompletedTimes, ?REWARD_STATE_NOT}
        end
    end, IDs).

gain_client_lucky_list(List) ->
    [ID || {ID, _} <- List].

%% 获取冲击大赛奖励
get_lv_reward(PS, ID) ->
    case catch check_get_lv_reward(PS, ID) of
        {ok, RoleData, SLvGotList, Reward} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_DIVIDEND_LV),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_dividend_lv_get{
                lv_got_list = SLvGotList,
                id = ID
            },
            {ok, Bin} = prot_msg:encode_msg(53804, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_lv_reward(PS, ID) ->
    is_ongoing() orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #{lv_list := LvList} = RoleData,
    SLvGotList = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_LV_GOT_LIST, []),
    Conf = conf_sprint_level:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{times := MaxGetTimes, lv := NeedLv, reward := Reward} = Conf,
    Lv >= NeedLv orelse erlang:throw({error, ?RC_PET_ROLE_LEVEL_LMT}),
    not lists:member(ID, LvList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    %% 全服领取次数
    SGetTimes = util:prop_get_value(ID, SLvGotList, 0),
    SGetTimes < MaxGetTimes orelse erlang:throw({error, ?RC_DIVIDEND_LV_REWARD_GOT_ALL}),
    SLvGotListN = util:prop_store(ID, SGetTimes + 1, SLvGotList),
    lib_role_kv:set_kv(0, ?KEY_DIVIDEND_LV_GOT_LIST, SLvGotListN),
    LvListN = [ID | LvList],
    RoleDataN = RoleData#{lv_list => LvListN},
    {ok, RoleDataN, SLvGotListN, Reward}.

%% 领取点石成金奖励
get_stone_reward(PS, ID) ->
    case catch check_get_stone_reward(PS, ID) of
        {ok, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_DIVIDEND_STONE),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_dividend_stone_get{
                flag = ?REWARD_STATE_GOT,
                id = ID
            },
            {ok, Bin} = prot_msg:encode_msg(53806, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_stone_reward(PS, ID) ->
    is_ongoing() orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{stone_list := StoneList} = RoleData,
    not lists:member(ID, StoneList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    CompletedTimes = lib_role_daily_lively:get_completed_times(RoleID, ID),
    Conf = conf_activity_hall:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{times := NeedTimes} = Conf,
    CompletedTimes >= NeedTimes orelse erlang:throw({error, ?RC_THIEF_TIMES_NOT_ENOUGH}),
    Reward = conf_stone_gold:get(ID),
    Reward =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    StoneListN = [ID | StoneList],
    RoleDataN = RoleData#{stone_list => StoneListN},
    {ok, RoleDataN, Reward}.

%% 获得幸运抽奖奖励
get_lucky_reward(PS, Type, ID) ->
    case catch check_get_lucky_reward(PS, Type, ID) of
        {ok, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_DIVIDEND_LUCKY),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_dividend_lucky_get{
                type = Type,
                id = ID
            },
            {ok, Bin} = prot_msg:encode_msg(53809, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_lucky_reward(PS, Type, ID) ->
    case Type =:= 1 of
        true ->
            get_lively_reward(PS, ID);
        _ ->
            get_charge_reward(PS, ID)
    end.

get_lively_reward(PS, ID) ->
    is_ongoing() orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{lively_list := LivelyList} = RoleData,
    not lists:keymember(ID, 1, LivelyList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    Conf = conf_lucky_lottery:get(1),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{value := Values, reward := Reward} = Conf,
    NeedValue = util:prop_get_value(ID, Values),
    SLively = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_LIVELY, 0),
    SLively >= NeedValue orelse erlang:throw({error, ?RC_WELFARE_EXP_LIMIT}),
    DropID = get_reward(LivelyList, Reward),
    LivelyListN = [{ID, DropID} | LivelyList],
    RoleDataN = RoleData#{lively_list => LivelyListN},
    {ok, RoleDataN, DropID}.

get_charge_reward(PS, ID) ->
    is_ongoing() orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{charge_list := ChargeList} = RoleData,
    not lists:keymember(ID, 1, ChargeList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    Conf = conf_lucky_lottery:get(2),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{value := Values, reward := Reward} = Conf,
    NeedValue = util:prop_get_value(ID, Values),
    SCharge = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_CHARGE, 0),
    SCharge >= NeedValue orelse erlang:throw({error, ?RC_WELFARE_EXP_LIMIT}),
    DropID = get_reward(ChargeList, Reward),
    ChargeListN = [{ID, DropID} | ChargeList],
    RoleDataN = RoleData#{charge_list => ChargeListN},
    {ok, RoleDataN, DropID}.

%% 增加全服活跃and点石成金
add_server_lively(RoleID, ID, Times, Completed) ->
    case is_ongoing() of
        true ->
            %% 增加全服活跃
            #{add_exp := AddExp} = conf_activity_hall:get(ID),
            case AddExp > 0 of
                true ->
                    SLively = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_LIVELY, 0),
                    SLivelyN = SLively + AddExp * Times,
                    lib_role_kv:set_kv(0, ?KEY_DIVIDEND_LIVELY, SLivelyN),
                    MsgRecord = #sc_dividend_lively_change{lottery_lively = SLivelyN},
                    {ok, Bin} = prot_msg:encode_msg(53810, MsgRecord),
                    lib_role_send:broadcast(Bin);
                _ ->
                    skip
            end,
            %% 点石成金
            IDs = conf_stone_gold:get_ids(),
            case lists:member(ID, IDs) of
                true ->
                    CompletedTimes = util:prop_get_value(ID, Completed),
                    RoleData = get_role_data(RoleID),
                    #{stone_list := StoneList} = RoleData,
                    case lists:member(ID, StoneList) of
                        false ->
                            #{times := NeedTimes} = conf_activity_hall:get(ID),
                            Flag = ?iif(CompletedTimes >= NeedTimes, ?REWARD_STATE_CAN, ?REWARD_STATE_NOT),
                            MsgRecord2 = #sc_dividend_flag_change{id = ID, stage = CompletedTimes, flag = Flag},
                            {ok, Bin2} = prot_msg:encode_msg(53807, MsgRecord2),
                            lib_role_send:send_to_role(RoleID, Bin2);
                        _ ->
                            skip
                    end;
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

%% 增加全服充值
add_server_charge(AddRmb) ->
    case is_ongoing() of
        true ->
            SCharge = lib_role_kv:get_kv(0, ?KEY_DIVIDEND_CHARGE, 0),
            SChargeN = SCharge + AddRmb * 10,
            lib_role_kv:set_kv(0, ?KEY_DIVIDEND_CHARGE, SChargeN),
            MsgRecord = #sc_dividend_charge_change{lottery_charge = SChargeN},
            {ok, Bin} = prot_msg:encode_msg(53811, MsgRecord),
            lib_role_send:broadcast(Bin);
        _ ->
            skip
    end.

%% 跨天处理
cross_day(PS) ->
    case is_ongoing() of
        true ->
            #role_state{id = RoleID} = PS,
            RoleData = get_role_data(RoleID),
            RoleDataN = RoleData#{stone_list => [], last_check => time:unixtime()},
            update_role_data(RoleID, RoleDataN);
        _ ->
            skip
    end.

is_ongoing() ->
    lib_activity:is_ongoing(?ACT_ID_LUCKY_DIVIDEND).

get_reward(_, []) -> 0;
get_reward([], Reward) ->
    {DropID, _} = util:rand_by_weight(Reward, 2),
    DropID;
get_reward([{_, ID} | T], Reward) ->
    RewardN = lists:keydelete(ID, 1, Reward),
    get_reward(T, RewardN).

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
            #{
                lv_list := LvList, stone_list := StoneList, lively_list := LivelyList,
                charge_list := ChargeList, last_check := LastCheck
            } = RoleData,
            save_role_data(RoleID, LvList, StoneList, LivelyList, ChargeList, LastCheck);
        _ ->
            skip
    end.

-define(SQL_GET_ROLE_DATA, <<"select lv_list, stone_list, lively_list, charge_list, last_check from role_dividend where role_id = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [DbLvList, DbStoneList, DbLivelyList, DbChargeList, LastCheck] ->
            LvList = type:convert_db_field(list, DbLvList, []),
            StoneList = type:convert_db_field(list, DbStoneList, []),
            LivelyList = type:convert_db_field(list, DbLivelyList, []),
            ChargeList = type:convert_db_field(list, DbChargeList, []),
            {LvList, StoneList, LivelyList, ChargeList, LastCheck};
        [] ->
            {[], [], [], [], time:unixtime()}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_dividend(role_id, lv_list, stone_list, lively_list, charge_list, last_check) values(~w, '~s', '~s', '~s', '~s', ~w)">>).
save_role_data(RoleID, LvList, StoneList, LivelyList, ChargeList, LastCheck) ->
    DbLvList = type:term_to_bitstring(LvList),
    DbStoneList = type:term_to_bitstring(StoneList),
    DbLivelyList = type:term_to_bitstring(LivelyList),
    DbChargeList = type:term_to_bitstring(ChargeList),
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, DbLvList, DbStoneList, DbLivelyList, DbChargeList, LastCheck]),
    ?DB:execute(SQL).

%% -----------------------------游戏服逻辑
%% 十大帮派奖励
top_guild_reward() ->
    OpenDay = util:get_open_days(),
    case OpenDay =:= 8 of
        true ->
            case util:get_ets(?ETS_RANK, ?RANK_GUILD_LIVE) of
                RankInfo when is_map(RankInfo) ->
                    #{rank := RankList} = RankInfo,
                    List = lists:sublist(RankList, 1, 10),
                    lists:foreach(fun(Item) ->
                        #{rank := Rank, key := GuildID, guild_name := GuildName} = Item,
                        Members = lib_guild:get_member_id_list(GuildID),
                        Reward = conf_top_guild:get(Rank),
                        lists:foreach(fun(RoleID) ->
                            svr_mail:sys2p(RoleID, 2401, [GuildName, Rank], Reward, ?OPT_DIVIDEND_GUILD)
                        end, Members)
                    end, List);
                _ ->
                    ?ERROR("top_guild_reward send_reward_error!!!"),
                    skip
            end;
        _ ->
            skip
    end.