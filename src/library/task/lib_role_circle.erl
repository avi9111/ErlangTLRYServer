%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     跑环任务
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_circle).
-author("Ryuu").

-include("role.hrl").
-include("task.hrl").
-include("goods.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_424.hrl").

%% API
-export([
    do/3,
    init/1,
    gm_reset/1,
    cross_day/1,
    gm_accept/2,
    help_role/2,
    send_info/1,
    handle_info/2,
    get_role_data/1,
    task_finished/2
]).

-define(role_circle, #{
    version => 1,
    role_id => 0,
    times => 0,
    task_id => 0,
    quick_item => 0,
    quick_num => 0,
    wilful_times => [],
    round_time => 0,
    help_ref => 0,
    help_times => 0,
    helpd_times => 0,
    time => time:unixtime()
}).

-define(MAX_ROUND, 3).
-define(ROUND_TIMES, 100).
-define(QUICK_TIMES, 10).
-define(MAX_TIMES, ?MAX_ROUND * ?ROUND_TIMES).

do(42401, PS, _Req) ->
    send_info(PS);
do(42403, PS, _Req) ->
    accept(PS);
do(42405, PS, #cs_circle_wilful{type = Type}) ->
    wilful(PS, Type);
do(42407, PS, _Req) ->
    ask_for_help(PS);
do(42409, PS, #cs_circle_help{role_id = TargetID, task_id = TaskID, ref = Ref, poses = Poses}) ->
    help(PS, TargetID, TaskID, Ref, Poses);
do(42411, PS, #cs_circle_quick{poses = Poses}) ->
    quick(PS, Poses);
do(_Cmd, _PS, _Req) ->
    ignore.

handle_info(auto_accept, PS) ->
    accept(PS);
handle_info(_, _) ->
    ignore.

cross_day(PS) ->
    renew_role_data(PS).

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    send_info(PS, RoleData).

send_info(PS, RoleData) ->
    #{times := Times, quick_item := QuickItem, quick_num := QuickNum,
        wilful_times := WilfulTimes} = RoleData,
    Rec = #sc_circle_info{
        times = Times, quick_item = QuickItem, quick_num = QuickNum,
        wilful_times = WilfulTimes, round_times = ?ROUND_TIMES
    },
    {ok, Bin} = prot_msg:encode_msg(42402, Rec),
    lib_role_send:send_to_role(PS, Bin).

accept(PS) ->
    accept(PS, 0).

accept(PS, Prefer) ->
    case catch check_accept(PS, Prefer) of
        {ok, RoleID, RoleData, Costs, TaskID} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_TASK_ACCEPT),
            update_role_data(RoleID, RoleData),
            PS2 = lib_role_task:add_task(PS1, TaskID),
            #{quick_item := QuickItem, quick_num := QuickNum} = RoleData,
            Rec = #sc_circle_accept{quick_item = QuickItem, quick_num = QuickNum},
            {ok, Bin} = prot_msg:encode_msg(42404, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_accept(PS, Prefer) ->
    #role_state{id = RoleID, level = Level} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times, quick_item := QuickItem,
        quick_num := QuickNum, round_time := RoundTime} = RoleData,
    lib_role_task:has_circle_task(RoleID) andalso erlang:throw({error, ?RC_CIRCLE_HAS_TASK}),
    OpenLv = conf_activity_hall:get_open_lv(1016),
    Level >= OpenLv orelse erlang:throw({error, ?RC_TASK_ROLE_LEVEL_LMT}),
    Times < ?MAX_TIMES orelse erlang:throw({error, ?RC_CIRCLE_MAX_TIMES}),
    Round = task_round(Times),
    NewTimes = Times + 1,
    NewRound = task_round(NewTimes),
    ConfRound = conf_circle_task:get(NewRound),
    #{cost := Costs0, weight := Weight} = ConfRound,
    Costs = ?iif(Round =/= NewRound, Costs0, []),
    {NewQuickItem, NewQuickNum} = quick_item(NewTimes, QuickItem, QuickNum),
    lib_role_assets:check_items_enough(PS, Costs),
    ConfDb = conf_circle_task_db:get({NewRound, Level}),
    ConfDb =/= undefined orelse erlang:throw({error, ?RC_CIRCLE_NO_TASK_DB}),
    #{tasks := TaskList} = ConfDb,
    TaskList =/= [] orelse erlang:throw({error, ?RC_CIRCLE_DB_EMPTY}),
    if
        Prefer > 0 andalso Times rem ?ROUND_TIMES =/= 0 ->
            TaskID = Prefer;
        true ->
            TaskID = sel_task_id(NewTimes, Weight, TaskList)
    end,
    HelpRef = util:rand(1, ?INT32_MAX),
    NewRoundTime = ?iif(RoundTime =:= 0, time:unixtime(), RoundTime),
    NewData = RoleData#{
        times => NewTimes, help_ref => HelpRef, quick_item => NewQuickItem,
        quick_num => NewQuickNum, round_time => NewRoundTime, task_id => TaskID
    },
    {ok, RoleID, NewData, Costs, TaskID}.

wilful(PS, Type) ->
    case catch check_wilful(PS, Type) of
        {ok, RoleID, RoleData, Costs, TaskID} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_TASK_QUICK),
            update_role_data(RoleID, RoleData),
            #{wilful_times := WilfulTimes} = RoleData,
            Rec = #sc_circle_wilful{wilful_times = WilfulTimes},
            {ok, Bin} = prot_msg:encode_msg(42406, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_role_task:del_task(PS, TaskID),
            task_finished(PS1, TaskID);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_wilful(PS, Type) ->
    #role_state{id = RoleID, level = Level} = PS,
    #{id := TaskID} = check_get_task(RoleID),
    RoleData = get_role_data(RoleID),
    #{times := Times, wilful_times := WilfulTimes} = RoleData,
    Round = task_round(Times),
    ConfCircle = conf_circle_task_db:get({Round, Level}),
    ConfCircle =/= undefined orelse erlang:throw({error, ?RC_CIRCLE_NO_TASK_DB}),
    ConfLimits = config:get_sys_config(circle_wilful_times),
    TypeTimes = util:prop_get_value(Type, WilfulTimes, 0),
    case lists:keyfind(Type, 1, ConfLimits) of
        {_, Limit, Cost} when Limit =:= 0 orelse TypeTimes < Limit ->
            Costs = [{Type, Cost}];
        false ->
            Costs = [],
            erlang:throw({error, ?RC_CIRCLE_NO_WILFUL_TYPE});
        _ ->
            Costs = [],
            erlang:throw({error, ?RC_CIRCLE_MAX_WILFUL_TIMES})
    end,
    lib_role_assets:check_items_enough(PS, Costs),
    NewWilfulTimes = util:prop_increase(Type, WilfulTimes),
    NewData = RoleData#{wilful_times => NewWilfulTimes},
    {ok, RoleID, NewData, Costs, TaskID}.

ask_for_help(PS) ->
    case catch check_ask_for_help(PS) of
        {ok, GuildID, Rumor, Args} ->
            svr_rumor:publish({guild, GuildID}, Rumor, Args),
            Rec = #sc_circle_ask_for_help{},
            {ok, Bin} = prot_msg:encode_msg(42408, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_ask_for_help(PS) ->
    #role_state{id = RoleID, name = Name, career = Career, guild_id = GuildID} = PS,
    #{id := TaskID} = check_get_task(RoleID),
    Conf = conf_task:get({TaskID, Career}),
    #{costs := Cost, type := Type} = Conf,
    ItemName = fmt_task_cost(Cost),
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    Type =:= ?TASK_TYPE_CIRCLE_ITEM orelse erlang:throw({error, ?RC_CIRCLE_NO_ITEM_TASK}),
    RoleData = get_role_data(RoleID),
    #{times := Times, help_ref := HelpRef, helpd_times := HelpedTimes} = RoleData,
    MaxHelpedTimes = config:get_sys_config(circle_helpd_times),
    HelpedTimes < MaxHelpedTimes orelse erlang:throw({error, ?RC_CIRCLE_MAX_HELPED_TIMES}),
    Rumor = config:get_sys_config(circle_help_rumor),
    Args = [Name, ItemName, ?STR(Times), ?STR(?MAX_TIMES), ?STR(RoleID), ?STR(TaskID), HelpRef],
    {ok, GuildID, Rumor, Args}.

check_get_task(RoleID) ->
    Tasks = lib_role_task:get_circle_task(RoleID),
    Tasks =/= [] orelse erlang:throw({error, ?RC_CIRCLE_NO_TASK}),
    [Task | _T] = Tasks,
    Task.

help(PS, TargetID, TaskID, Ref, Poses) ->
    case catch check_help(PS, TargetID, TaskID, Ref, Poses) of
        {ok, RoleID, RoleData, Costs, Reward, GuildID, Rumor, Args} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_TASK_HELP),
            lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_TASK_HELP),
            update_role_data(RoleID, RoleData),
            svr_rumor:publish({guild, GuildID}, Rumor, Args),
            Rec = #sc_circle_help{},
            {ok, Bin} = prot_msg:encode_msg(42410, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_help(PS, TargetID, TaskID, Ref, Poses) ->
    #role_state{id = RoleID, guild_id = GuildID, career = Career, name = Name} = PS,
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_CIRCLE_TARGET_OFFLINE}),
    RoleID =/= TargetID orelse erlang:throw({error, ?RC_CIRCLE_CANNOT_HELP_SELF}),
    RoleData = get_role_data(RoleID),
    #{help_times := HelpTimes} = RoleData,
    MaxTimes = config:get_sys_config(circle_help_times),
    HelpTimes < MaxTimes orelse erlang:throw({error, ?RC_CIRCLE_MAX_HELP_TIMES}),
    Conf = conf_task:get({TaskID, Career}),
    #{costs := Cost0} = Conf,
    Costs = sel_task_cost(Poses, RoleID, Cost0),
    lib_role_assets:check_items_enough(PS, Costs),
    Rumor = config:get_sys_config(circle_helpd_rumor),
    {ok, Reward, Args} = ?MAKE_SURE(lib_role:apply_call2(TargetID, {?MODULE, help_role, [[TaskID, Ref, Name]]})),
    NewData = RoleData#{help_times => HelpTimes + 1},
    {ok, RoleID, NewData, Costs, Reward, GuildID, Rumor, Args}.

help_role(PS, Params) ->
    case catch check_help_role(PS, Params) of
        {ok, RoleID, RoleData, TaskID, Reward, Args} ->
            update_role_data(RoleID, RoleData),
            lib_role_task:del_task(PS, TaskID),
            PS1 = task_finished(PS, TaskID, false),
            {ok, {ok, Reward, Args}, PS1};
        {error, Code} ->
            {ok, {error, Code}}
    end.

check_help_role(PS, [TaskID0, Ref, TName]) ->
    #role_state{id = RoleID, career = Career, level = Level, name = RName} = PS,
    #{id := TaskID} = check_get_task(RoleID),
    Conf = conf_task:get({TaskID, Career}),
    #{type := Type} = Conf,
    Type =:= ?TASK_TYPE_CIRCLE_ITEM orelse erlang:throw({error, ?RC_CIRCLE_NO_ITEM_TASK}),
    RoleData = get_role_data(RoleID),
    #{times := Times, help_ref := HelpRef, helpd_times := HelpedTimes} = RoleData,
    {TaskID, HelpRef} =:= {TaskID0, Ref} orelse erlang:throw({error, ?RC_CIRCLE_HELP_REQUEST_EXPIRED}),
    NewData = RoleData#{helpd_times => HelpedTimes + 1},
    Reward = task_reward(Times, Level),
    Args = [RName, TName, ?STR(Times), ?STR(?MAX_TIMES), HelpRef],
    {ok, RoleID, NewData, TaskID, Reward, Args}.

quick(PS, Poses) ->
    case catch check_quick(PS, Poses) of
        {ok, RoleID, RoleData, Costs, TaskID, RTimes} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_CIRCLE_QUICK),
            update_role_data(RoleID, RoleData),
            lib_role_task:del_task(PS, TaskID),
            Rec = #sc_circle_quick{},
            {ok, Bin} = prot_msg:encode_msg(42412, Rec),
            lib_role_send:send_to_role(PS, Bin),
            task_finished(PS1, TaskID, RTimes);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_quick(PS, Poses) ->
    #role_state{id = RoleID} = PS,
    #{id := TaskID} = check_get_task(RoleID),
    RoleData = get_role_data(RoleID),
    #{quick_item := ID, quick_num := Num, times := Times} = RoleData,
    Conf = conf_circle_quick:get(ID),
    #{goods := List} = Conf,
    Costs = sel_task_cost(Poses, RoleID, [{List, Num}]),
    lib_role_assets:check_items_enough(PS, Costs),
    Round = task_round(Times),
    NewTimes = erlang:min(Times + ?QUICK_TIMES, Round * ?ROUND_TIMES),
    RTimes = lists:seq(Times, NewTimes),
    NewData = RoleData#{times => NewTimes},
    {ok, RoleID, NewData, Costs, TaskID, RTimes}.

task_finished(PS, TaskID) ->
    task_finished(PS, TaskID, true).

task_finished(PS, _TaskID, RTimes0) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times} = RoleData,
    NewData = RoleData#{task_id => 0},
    update_role_data(RoleID, NewData),
    case Times rem ?ROUND_TIMES =:= 0 of
        true ->
            send_info(PS, RoleData);
        _ ->
            lib_role:mod_info(RoleID, ?MODULE, auto_accept)
    end,
    RTimes = case RTimes0 of
        true ->
            [Times];
        _ when is_list(RTimes0) ->
            RTimes0;
        _ ->
            []
    end,
    send_rewards(RTimes, PS).

send_rewards([], PS) ->
    PS;
send_rewards([Times | T], PS) ->
    #role_state{level = Level} = PS,
    Rewards = task_reward(Times, Level),
    PS1 = lib_role_assets:add_items_notify(PS, Rewards, ?OPT_TASK_REWARD),
    send_rewards(T, PS1).

task_reward(Times, Level) ->
    ConfReward = conf_circle_reward:get(Times),
    #{mul := Mul, reward := TReward} = ConfReward,
    ConfLevel = conf_level:get(Level),
    #{circle_exp := CircleExp} = ConfLevel,
    TotalExp = erlang:floor(CircleExp * Mul),
    DropGoods = lib_drop_base:get_drop_goods(TReward, []),
    [{?AST_EXP, TotalExp}] ++ DropGoods.

%% -----------------------------------------------------------------------------

gm_reset(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewData = RoleData#{
        times => 0, round_time => 0, wilful_times => [], task_id => 0,
        quick_item => 0, quick_num => 0, time => time:unixtime(),
        helped_times => 0, help_ref => 0
    },
    update_role_data(RoleID, NewData),
    send_info(PS, NewData).

gm_accept(PS, TaskID) ->
    #role_state{id = RoleID} = PS,
    case catch check_get_task(RoleID) of
        #{id := CTaskID} ->
            PS1 = lib_role_task:del_task(PS, CTaskID);
        _ ->
            PS1 = PS
    end,
    Valid = lib_task_util:task_cate(TaskID) =:= ?TASK_CATE_CIRCLE,
    Valid orelse erlang:throw({error, ?RC_CIRCLE_NOT_CIRCLE}),
    accept(PS1, TaskID).

%% -----------------------------------------------------------------------------

quick_item(Times, QuickItem, QuickNum) ->
    if
        Times rem ?QUICK_TIMES =:= 1 ->
            IDList = conf_circle_quick:get_ids(),
            sel_quick_item(IDList, Times, []);
        true ->
            {QuickItem, QuickNum}
    end.

sel_quick_item([], _Times, Acc) ->
    Acc =/= [] orelse erlang:throw({error, ?RC_CIRCLE_NO_QUICK_ITEM}),
    util:list_rand(Acc);
sel_quick_item([ID | T], Times, Acc) ->
    Conf = conf_circle_quick:get(ID),
    #{num := Num} = Conf,
    case util:get_zone_config(Num, Times) of
        {Min, Max} ->
            sel_quick_item(T, Times, [{ID, util:rand(Min, Max)} | Acc]);
        _ ->
            sel_quick_item(T, Times, Acc)
    end.

sel_task_cost(Poses, RoleID, Cost) ->
    List = sel_task_cost(Poses, RoleID, Cost, sets:new(), []),
    [{?AST_ITEM_C, List}].

sel_task_cost([], _RoleID, [], _DAcc, Acc) ->
    Acc;
sel_task_cost([], _RoleID, _, _, _) ->
    erlang:throw({error, ?RC_GOODS_ITEM_NOT_ENOUGH});
sel_task_cost([{Pos, CNum} | T], RoleID, Costs, DAcc, Acc) ->
    Goods = lib_goods_util:check_get_cell_item(RoleID, ?BAG_ID_ITEM, Pos),
    #{id := ID, num := GNum} = Goods,
    GNum >= CNum orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_ENOUGH}),
    sets:is_element(Pos, DAcc) andalso erlang:throw({error, ?RC_CIRCLE_SELECT_DUP_POS}),
    NewAcc = [{Pos, CNum} | Acc],
    NewDAcc = sets:add_element(ID, DAcc),
    NewCosts = desc_cost(Costs, ID, CNum, []),
    sel_task_cost(T, RoleID, NewCosts, NewDAcc, NewAcc).

desc_cost(T, _ID, 0, Acc) ->
    lists:reverse(Acc, T);
desc_cost([], _ID, _, _Acc) ->
    erlang:throw({error, ?RC_CIRCLE_SELECT_TOO_MANY_ITEMS});
desc_cost([{ID, Num} | T], GID, GNum, Acc) ->
    case (is_integer(ID) andalso ID =:= GID) orelse
        (is_list(ID) andalso lists:member(GID, ID)) of
        true when GNum >= Num ->
            desc_cost(T, GID, GNum - Num, Acc);
        true ->
            desc_cost(T, GID, 0, [{ID, Num - GNum} | Acc]);
        _ ->
            desc_cost(T, GID, GNum, [{ID, Num} | Acc])
    end.

fmt_task_cost([{ItemID, _} | _]) ->
    lib_goods_util:get_name(ItemID);
fmt_task_cost(_) ->
    erlang:throw({error, ?RC_TASK_HAS_NO_COST}).

sel_task_id(Times, _Weight, _TaskList) when Times rem ?ROUND_TIMES =:= 0 ->
    config:get_sys_config(circle_round_task);
sel_task_id(_Times, Weight, TaskList) ->
    {Type, _} = util:rand_by_weight(Weight, 2),
    util:list_rand([TaskID || TaskID <- TaskList, lib_task_util:task_type(TaskID) =:= Type]).

task_round(Times) ->
    erlang:ceil(Times / ?ROUND_TIMES).

%% -----------------------------------------------------------------------------

init(PS) ->
    renew_role_data(PS).

renew_role_data(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times, round_time := RoundTime, time := Time,
        wilful_times := WilfulTimes, task_id := TaskID} = RoleData,
    Now = time:unixtime(),
    case time:is_same_week(Time, Now) of
        false ->
            NewWilfulTimes = [], NewTime = Now;
        _ ->
            NewWilfulTimes = WilfulTimes, NewTime = Time
    end,
    case RoundTime > 0 andalso Times >= ?MAX_TIMES
        andalso TaskID =:= 0
        andalso (not time:is_same_week(RoundTime, Now)) of
        true ->
            NewTimes = 0, NewRoundTime = 0;
        false ->
            NewTimes = Times, NewRoundTime = RoundTime
    end,
    NewData = RoleData#{
        times => NewTimes, round_time => NewRoundTime,
        wilful_times => NewWilfulTimes, time => NewTime
    },
    update_role_data(RoleID, NewData).

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData).

set_role_data(RoleID, RoleData) ->
    lib_role_data:put_value(RoleID, ?MODULE, RoleData),
    RoleData.

get_role_data(RoleID) ->
    case lib_role_data:get_value(RoleID, ?MODULE) of
        RoleData when is_map(RoleData) ->
            maps:merge(?role_circle, RoleData);
        _ ->
            ?role_circle#{role_id => RoleID}
    end.
