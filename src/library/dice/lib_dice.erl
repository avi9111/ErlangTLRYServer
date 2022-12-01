%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     骰子
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_dice).
-author("Ryuu").

-include("dice.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("ets_defines.hrl").
-include("proto/prot_533.hrl").

%% API
-export([
    info/0,
    create_dice/3,
    roll_dice/3,
    loop/1,
    get_dice_data/1
]).


%% @doc 获取骰子数据
get_dice_data(DiceID) ->
    case ets:lookup(?ETS_DICE, DiceID) of
        [V] -> V;
        _ -> undefined
    end.

%% @doc 设置骰子数据
set_dice_data(Dice) ->
    ets:insert(?ETS_DICE, Dice).

get_dice_id() ->
    case erlang:get(dice_id) of
        V when is_integer(V) -> V;
        _ -> 0
    end.

%% @doc 新骰子ID
get_new_dice_id() ->
    ID = get_dice_id(),
    NewID = ID + 1,
    erlang:put(dice_id, NewID),
    NewID.

%% @doc 服务状态
info() ->
    {
        {dice_id, get_dice_id()},
        {dices, ets:tab2list(?ETS_DICE)}
    }.

%% @doc 创建新骰子
create_dice(Targets, ValidTime, Callback) ->
    DiceID = get_new_dice_id(),
    Now = time:unixtime(),
    Dice = #dice{
        id = DiceID, targets = Targets, expire_time = Now + ValidTime,
        callback = Callback, candidate = lists:seq(1, 100)
    },
    set_dice_data(Dice),
    notify_new_dice(Dice),
    svr_timer:register(),
    {ok, DiceID}.

%% @doc 玩家投掷广播
notify_new_dice(Dice) ->
    #dice{targets = Targets, id = DiceID, expire_time = ExpireTime} = Dice,
    Rec = #notify_new_dice{id = DiceID, expire_time = ExpireTime},
    {ok, Bin} = prot_msg:encode_msg(53303, Rec),
    broadcast(Targets, Bin).

check_role_dice(RoleID, RoleName, DiceID) ->
    Dice = get_dice_data(DiceID),
    Dice =/= undefined orelse erlang:throw({error, ?RC_WORLD_BOSS_DICE_NOT_EXISTS}),
    #dice{targets = Targets, roll_list = RollList, candidate = Candidate, best = CurBest} = Dice,
    lists:member(RoleID, RollList) andalso erlang:throw({error, ?RC_WORLD_BOSS_DICE_ALREADY_ROLL}),
    lists:member(RoleID, Targets) orelse erlang:throw({error, ?RC_WORLD_BOSS_DICE_NOT_TARGET}),
    Candidate =/= [] orelse erlang:throw({error, ?RC_WORLD_BOSS_DICE_NO_MORE_DICE}),
    Rand = util:list_rand(Candidate),
    NewRollList = [RoleID | RollList],
    NewCandidate = lists:delete(Rand, Candidate),
    NewBest =
        case CurBest of
            {_BestID, _BestName, BestVal} when Rand > BestVal ->
                {RoleID, RoleName, Rand};
            _ ->
                CurBest
        end,
    NewDice = Dice#dice{roll_list = NewRollList, candidate = NewCandidate, best = NewBest},
    {ok, NewDice, Rand}.

%% @doc 投掷
roll_dice(RoleID, RoleName, DiceID) ->
    case catch check_role_dice(RoleID, RoleName, DiceID) of
        {ok, NewDice, Rand} ->
            set_dice_data(NewDice),
            notify_role_dice(NewDice, RoleID, RoleName, Rand),
            {ok, Rand};
        {error, Code} ->
            {error, Code}
    end.

%% @doc 玩家投掷广播
notify_role_dice(Dice, RoleID, RoleName, Value) ->
    #dice{targets = Targets, id = DiceID, best = {BestID, BestName, BestVal}} = Dice,
    SelfDice = #clt_dice_val{role_id = RoleID, role_name = RoleName, val = Value},
    BestDice = #clt_dice_val{role_id = BestID, role_name = BestName, val = BestVal},
    Rec = #notify_role_dice{
        id = DiceID, self = SelfDice,
        best = BestDice
    },
    {ok, Bin} = prot_msg:encode_msg(53304, Rec),
    broadcast(Targets, Bin).

%% @doc 秒循环
loop(Now) ->
    ets:safe_fixtable(?ETS_DICE, true),
    check_expired_dice(ets:first(?ETS_DICE), Now),
    ets:safe_fixtable(?ETS_DICE, false),
    ets:info(?ETS_DICE, size) > 0 orelse svr_timer:unregister(),
    ok.

check_expired_dice('$end_of_table', _Now) ->
    ok;
check_expired_dice(Key, Now) ->
    Dice = get_dice_data(Key),
    #dice{expire_time = ExpiredTime} = Dice,
    case ExpiredTime =< Now of
        true ->
            send_dice_reward(Dice),
            ets:delete(?ETS_DICE, Key);
        _ ->
            ok
    end,
    check_expired_dice(ets:next(?ETS_DICE, Key), Now).

%% @doc 发放骰子奖励
send_dice_reward(Dice) ->
    #dice{callback = Callback} = Dice,
    is_function(Callback) andalso ?TRY_CATCH(Callback(Dice)).

broadcast([], _Bin) ->
    ok;
broadcast([RoleID | T], Bin) ->
    lib_role_send:send_to_role(RoleID, Bin),
    broadcast(T, Bin).
