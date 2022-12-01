%%-------------------------------------------------------
%% @File     : router_107
%% @Brief    : 日常、杂项(只有少量协议的)
%% @Author   : cablsbs
%% @Date     : 2018-8-9
%%-------------------------------------------------------

-module(router_107).

-include("log.hrl").
-include("role.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_107.hrl").
-include("proto/prot_402.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
%% 领取奖励
do(10701, State, #get_kill_mon_reward_req{reward_id = RewardId}) ->
    #role_state{id = RoleId, level = Level} = State,
    KillMons = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_KILL_MON_COUNTER),
    Drops = conf_daily_kill_mons:get_drops(Level),
    MaxReward = min(KillMons div 1000, size(Drops)),
    RewardStat = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_KILL_MON_REWARD_ST),
    Ret = if
        MaxReward =< RewardStat ->
            ?ERROR_TOC(RoleId, ?RC_DAILY_NO_MORE_READY_REWARDS),
            ?RC_FAILED;
        RewardId =/= RewardStat + 1 ->
            ?ERROR_TOC(RoleId, ?RC_DAILY_GET_REWARD_SEQUENCE),
            ?RC_FAILED;
        true ->
            DropId = element(RewardId, Drops),
            lib_role_kv:set_kv(RoleId, ?KEY_DAILY_KILL_MON_REWARD_ST, RewardId),
            lib_drop_api:give_drop_asyn(RoleId, DropId, ?OPT_DAILY_KILL_MONS_DROP),
            ?RC_SUCCEED
    end,
    RetData = #get_kill_mon_reward_resp{ret = Ret},
    {reply, RetData};
%% 一键完成
do(10703, State, _MsgRecord) ->
    #role_state{id = RoleId, level = Level} = State,
    KillMons = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_KILL_MON_COUNTER),
    Drops = conf_daily_kill_mons:get_drops(Level),
    MaxReward = size(Drops),
    CurReward = KillMons div 1000,
    RewardStat = lib_role_kv:get_counter(RoleId, ?KEY_DAILY_KILL_MON_REWARD_ST),
    RestRewards = MaxReward - CurReward,
    Return = if
        RestRewards =< 0 ->
            ?ERROR_TOC(RoleId, ?RC_DAILY_NO_MORE_READY_REWARDS),
            ?RC_FAILED;
        true ->
            FinishCosts = config:get_sys_config(daily_kill_mons_finish),
            CostItems = [{?AST_GOLD, element(RestRewards, FinishCosts)}],
            case catch lib_role_assets:check_items_enough(State, CostItems) of
                true ->
                    State1 = lib_role_assets:cost_items_notify(State, CostItems, ?OPT_DAILY_KILL_MONS_FINISH),
                    lib_role_kv:set_kv(RoleId, ?KEY_DAILY_KILL_MON_REWARD_ST, MaxReward),
                    [
                        lib_drop_api:give_drop_asyn(RoleId, element(Idx, Drops), ?OPT_DAILY_KILL_MONS_DROP)
                        || Idx <- lists:seq(RewardStat + 1, MaxReward)
                    ],
                    {?RC_SUCCEED, State1};
                {error, RetCode} ->
                    ?ERROR_TOC(RoleId, RetCode),
                    ?RC_FAILED
            end
    end,
    case Return of
        {Ret, StateN} ->
            RetData = #finish_kill_mon_reward_resp{ret = Ret},
                {reply, RetData, StateN};
            Ret ->
                RetData = #finish_kill_mon_reward_resp{ret = Ret},
                {reply, RetData}
    end;
%% 玩家改名
do(10705, State, #cs_role_rename{name = NewName}) ->
    case catch check_role_rename(State, NewName) of
        {ok, CostItems, RoleName} ->
            State1 = lib_role_assets:cost_items_notify(State, CostItems, ?OPT_ROLE_RENAME),
            MsgRecord = #sc_role_rename{role_id = State#role_state.id, name = NewName},
            {ok, Bin} = prot_msg:encode_msg(10706, MsgRecord),
            lib_scene_api:send_to_role_area_scene(State1, Bin),
            send_to_friends(State1, State#role_state.name, RoleName),
            State2 = State1#role_state{name = RoleName},
            lib_scene_api:update('name', State2),
            lib_role_db:update_role_name(State#role_state.id, RoleName),
            svr_role_agent:update(State#role_state.id, [{#role_online.name, RoleName}]),
            ?EVENT(State, rename),
            {ok, State2};
        {error, Code} ->
            ?ERROR_TOC(State, Code)
    end;
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

%% 10701 处理协议返回
response(10701, #role_state{sid = RoleSid}, MsgRecord) ->
    {ok, Bin} = prot_msg:encode_msg(10702, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin);
%% 10703 处理协议返回
response(10703, #role_state{sid = RoleSid}, MsgRecord) ->
    {ok, Bin} = prot_msg:encode_msg(10704, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin);
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).

check_role_rename(State, NewName) ->
    Name = util:escape_varchar(NewName),
    NameStr = binary_to_list(Name),
    ItemID = config:get_sys_config(rename_item_id),
    CostItems = [{?AST_ITEM, [{ItemID, 1}]}],
    lib_role_assets:check_items_enough(State, CostItems),
    lib_role_name:validate_name_unique(NameStr),
    RoleName = unicode:characters_to_binary(Name),
    {ok, CostItems, RoleName}.

send_to_friends(PS, OldName, NewName) ->
    #role_state{id = RoleID, server_num = SvrNum} = PS,
    TargetIDs = lib_friend:get_friend_id_list(RoleID),
    #{string := ChatStr} = conf_string:get(role_rename_msg),
    [lib_role_chat:private_chat(PS, {TargetID, SvrNum}, io_lib:format(ChatStr, [OldName, NewName]), "", 0, "") || TargetID <- TargetIDs].
