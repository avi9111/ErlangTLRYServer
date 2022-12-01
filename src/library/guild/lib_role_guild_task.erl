%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派任务
%%% @end
%%% Created : 27. 九月 2018 20:19
%%%-------------------------------------------------------------------
-module(lib_role_guild_task).

-include("role.hrl").
-include("guild.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_514.hrl").

-define(TASK_NOT_GET, 0).       %% 未接去任务
-define(TASK_ALREADY_GOT, 1).   %% 已接取任务

-define(TASK_TYPE_RESOURCES, 1).
-define(TASK_TYPE_MON, 2).
-define(TASK_TYPE_TEACHER, 3).
-define(TASK_TYPE_PET, 4).
-define(TASK_TYPE_TREASURE_MAP, 5).

%% API
-export([
    event/2,
    send_info/1,
    get_task/2,
    cancel/1,
    finish_task/3,
    do/3,
    get_daily_times/1
]).

-define(guild_task, #{
    flag => 0,
    type => 0,
    id => 0,
    finish_times => 0,
    drop_time => 0
}).

do(51401, PS, _Req) ->
    send_info(PS);
do(51403, PS, #cs_guild_task_get{type = Type}) ->
    get_task(PS, Type);
do(51405, PS, #cs_guild_task_finish{type = Type, grid = Grid}) ->
    finish_task(PS, Type, Grid);
do(51408, PS, _Req) ->
    cancel(PS);
do(51412, PS, _Req) ->
    choose_rotary_id(PS);
do(51414, PS, _Req) ->
    get_rotary_reward(PS);
do(_, _, _) ->
    skip.

event(PS, {'kill_mon', MonId}) ->
    finish_auto_task(PS, ?TASK_TYPE_MON, MonId);
event(PS, {'coll_collect', #{id := CollID}}) ->
    finish_auto_task(PS, ?TASK_TYPE_RESOURCES, CollID);
event(PS, 'guild_changed') ->
    guild_changed(PS);
event(_, _) ->
    skip.

%% 信息
send_info(PS) when PS#role_state.guild_id > 0 ->
    #role_state{id = RoleID, sid = RoleSid, guild_id = GuildID} = PS,
    RoleData = get_role_data(RoleID),
    #{flag := Flag, type := Type, id := ID, finish_times := FinishTimes} = RoleData,
    DailyTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_GUILD_TASK_TIMES),
    #guild{task = TaskInfo, task_stage = TaskStage} = lib_guild:get_guild_info(GuildID),
    IDList = handle_id_list(),
    EndTime = get_rotary_time(),
    ChooseID = get_rotary_id(),
    MsgRecord = #sc_guild_task{
        task_info = TaskInfo,
        task_stage = TaskStage,
        daily_times = DailyTimes,
        flag = Flag,
        type = Type,
        id = ID,
        finish_times = FinishTimes,
        list = IDList,
        choose_id = ChooseID,
        end_time = EndTime
    },
    {ok, Bin} = prot_msg:encode_msg(51402, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok;
send_info(_) ->
    skip.

%% 接取任务
get_task(PS, Type) ->
    case catch check_get_task(PS, Type) of
        {ok, RoleData, ID} ->
            set_role_data(PS#role_state.id, RoleData),
            save_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_guild_task_get{id = ID, type = Type},
            {ok, Bin} = prot_msg:encode_msg(51404, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_task(PS, Type) ->
    #role_state{id = RoleID, guild_id = GuildID, level = Lv} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_CHAT_NOT_IN_GUILD}),
    #{daily_max_times := MaxTimes} = conf_guild_task_info:get(),
    RoleData = get_role_data(RoleID),
    DailyTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_GUILD_TASK_TIMES),
    #{flag := Flag, drop_time := DropTime} = RoleData,
    Now = time:unixtime(),
    Now >= DropTime + 5 * 60 orelse erlang:throw({error, ?RC_GUILD_TASK_TIME_NOT_ENOUGH}),
    Flag =:= ?TASK_NOT_GET orelse erlang:throw({error, ?RC_THIEF_HAVE_TASK}),
    DailyTimes < MaxTimes orelse erlang:throw({error, ?RC_GUILD_TASK_MAX_TIMES}),
    IDList = conf_guild_task_bank:get(Lv, Type),
    ID = util:list_rand(IDList),
    NewRoleData = RoleData#{flag => ?TASK_ALREADY_GOT, type => Type, id => ID, finish_time => 0},
    {ok, NewRoleData, ID}.

%% 取消任务
cancel(PS) ->
    case catch check_cancel(PS) of
        {ok, RoleData} ->
            set_role_data(PS#role_state.id, RoleData),
            save_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_guild_task_cancel{flag = ?TASK_NOT_GET},
            {ok, Bin} = prot_msg:encode_msg(51409, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_cancel(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_CHAT_NOT_IN_GUILD}),
    RoleData = get_role_data(RoleID),
    #{flag := Flag} = RoleData,
    Now = time:unixtime(),
    Flag =:= ?TASK_ALREADY_GOT orelse erlang:throw({error, ?RC_GUILD_TASK_NOT_GET_TASK}),
    NewRoleData = ?guild_task#{flag => ?TASK_NOT_GET, drop_time => Now},
    {ok, NewRoleData}.

%% 帮派变化
guild_changed(#role_state{guild_id = GuildID, id = RoleID, sid = RoleSid}) when GuildID =:= 0 ->
    RoleData = get_role_data(RoleID),
    #{flag := Flag} = RoleData,
    Flag =:= ?TASK_ALREADY_GOT andalso begin
        NewRoleData = ?guild_task#{flag => ?TASK_NOT_GET, drop_time => time:unixtime()},
        set_role_data(RoleID, NewRoleData),
        save_data(RoleID, NewRoleData),
        MsgRecord = #sc_guild_task_cancel{flag = ?TASK_NOT_GET},
        {ok, Bin} = prot_msg:encode_msg(51409, MsgRecord),
        lib_role_send:send_to_sid(RoleSid, Bin)
    end;
guild_changed(_) ->
    skip.

%% 完成主动提交任务
finish_task(PS, Type, Grid) ->
    case catch maybe_finish_task(PS, Type, Grid) of
        {ok, NewPS} ->
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% 完成杀怪or采集
finish_auto_task(PS, Type, ObjID) ->
    case catch maybe_finish_task(PS, Type, ObjID) of
        {ok, NewPS} ->
            {ok, NewPS};
        _ ->
            skip
    end.

maybe_finish_task(PS, TType, TObjID) ->
    #role_state{id = RoleID, guild_id = GuildID, level = Lv, sid = RoleSid} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_CHAT_NOT_IN_GUILD}),
    RoleData = get_role_data(RoleID),
    #{flag := Flag, type := Type, id := ID, finish_times := FinishTimes} = RoleData,
    (Flag =:= ?TASK_ALREADY_GOT andalso TType =:= Type) orelse erlang:throw({error, ?RC_GUILD_TASK_NOT_HAVE_TASK}),

    Conf = conf_guild_task:get(Type, ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{obj_id := ObjID, obj_num := ObjNum} = Conf,
    NewFinishTimes = FinishTimes + 1,
    {NewRoleData, IsCompleted, IsUpdated, PS1} =
        if
            Type =:= ?TASK_TYPE_TEACHER ->
                case NewFinishTimes >= ObjNum of
                    true ->
                        {?guild_task#{flag => ?TASK_NOT_GET}, true, true, PS};
                    _ ->
                        MsgRecord = #sc_guild_task_times_change{finish_times = NewFinishTimes},
                        {ok, Bin} = prot_msg:encode_msg(51410, MsgRecord),
                        lib_role_send:send_to_sid(RoleSid, Bin),
                        {RoleData#{finish_times => NewFinishTimes}, false, true, PS}
                end;
            Type =:= ?TASK_TYPE_MON orelse Type =:= ?TASK_TYPE_RESOURCES ->
                case ObjID =:= TObjID of
                    true ->
                        case NewFinishTimes >= ObjNum of
                            true ->
                                {?guild_task#{flag => ?TASK_NOT_GET}, true, true, PS};
                            _ ->
                                MsgRecord = #sc_guild_task_times_change{finish_times = NewFinishTimes},
                                {ok, Bin} = prot_msg:encode_msg(51410, MsgRecord),
                                lib_role_send:send_to_sid(RoleSid, Bin),
                                {RoleData#{finish_times => NewFinishTimes}, false, true, PS}
                        end;
                    _ ->
                        {RoleData, false, false, PS}
                end;
            Type =:= ?TASK_TYPE_PET ->
                Grid = TObjID,
                case lib_role_pet:pet_destroy(RoleID, RoleSid, Grid) of
                    ok ->
                        {?guild_task#{flag => ?TASK_NOT_GET}, true, true, PS};
                    {error, Code} ->
                        ?ERROR_TOC(PS, Code),
                        {RoleData, false, false, PS}
                end;
            true ->
                CostItems = [{?AST_ITEM, [{ObjID, ObjNum}]}],
                case catch lib_role_assets:check_items_enough(PS, CostItems) of
                    true ->
                        PS0 = lib_role_assets:cost_items_notify(PS, CostItems, ?OPT_GUILD_TASK),
                        {?guild_task#{flag => ?TASK_NOT_GET}, true, true, PS0};
                    {error, Code} ->
                        ?ERROR_TOC(PS, Code),
                        {RoleData, false, false, PS}
                end
        end,
    PS2 =
        case IsCompleted of
            true ->
                %% 计算是否为多倍奖励
                #guild{task = TaskInfo, task_stage = TaskStage} = lib_guild:get_guild_info(GuildID),
                #{task_stage := Stages, daily_max_times := DailyMaxTimes, rotary_weight := Weight, rotary_reward := RewardList} = conf_guild_task_info:get(),
                StageTimes = util:prop_get_value(TaskStage, Stages),
                NowTimes = util:prop_get_value(Type, TaskInfo),

                IsFix = util:prop_get_value(?TASK_TYPE_PET, TaskInfo) >= StageTimes,
                IsMul = NowTimes < StageTimes,
                {MaxStage, MaxTimes} = lists:last(Stages),
                IsAllMax = lists:all(fun({_, Times}) ->
                    Times >= MaxTimes
                end, TaskInfo) andalso TaskStage >= MaxStage,
                #{nor_reward := NorReward, mul_reward := MulReward, fix_reward := FixReward} = conf_guild_task_reward:get(Lv, TaskStage, Type),
                {AddItems, AddFunds} =
                    case IsMul of
                        _ when IsAllMax ->  %% 所有进度已达到最大
                            calc_reward(MulReward, GuildID);
                        true when IsFix ->  %% 五星任务是否已达到最大值,触发修正奖励
                            calc_reward(FixReward, GuildID);
                        true ->
                            calc_reward(MulReward, GuildID);
                        _ ->
                            calc_reward(NorReward, GuildID)
                    end,
                lib_role_assets:check_can_add_items(PS1, AddItems),
                NewPS = lib_role_assets:add_items_notify(PS1, AddItems, ?OPT_GUILD_TASK),
                svr_guild:finish_guild_task(GuildID, Type, 1),
                GuildID > 0 andalso svr_guild:add_funds(GuildID, RoleID, AddFunds, ?OPT_GUILD_TASK),
                NewDailyTimes = lib_role_daily:add_counter(RoleID, ?KEY_DAILY_GUILD_TASK_TIMES, 1),
                MsgRecord1 = #sc_guild_task_finish{flag = ?TASK_NOT_GET, daily_times = NewDailyTimes},
                {ok, Bin1} = prot_msg:encode_msg(51406, MsgRecord1),
                lib_role_send:send_to_sid(RoleSid, Bin1),
                lib_role_daily_lively:trigger_event(RoleID, 1005, 1),
                ?TASK_EVENT(RoleID, fin_guild_task),
                svr_guild:finish_bonus_task(GuildID, ?BONUS_TYPE_TASK, 1),
                %% 完成帮派任务后可能触发转盘
                case NewDailyTimes =:= DailyMaxTimes of
                    true ->
                        case util:is_bingo(Weight) of
                            true ->
                                EndTime = time:unixtime() + 5 * 60,
                                Rewards = util:get_zone_config(RewardList, Lv),
                                IDList = util:list_rand_n(Rewards, 8),
                                MsgRecord2 = #sc_guild_task_rotary{end_time = EndTime, list = handle_id_list(IDList)},
                                {ok, Bin2} = prot_msg:encode_msg(51411, MsgRecord2),
                                lib_role_send:send_to_sid(RoleSid, Bin2),
                                svr_rumor:publish(world, 25001, [PS#role_state.name]),
                                set_rotary_time(EndTime),
                                set_id_list(IDList);
                            _ ->
                                skip
                        end;
                    _ ->
                        skip
                end,
                NewPS;
            _ ->
                PS1
        end,
    set_role_data(RoleID, NewRoleData),
    ?iif(IsUpdated, save_data(RoleID, NewRoleData), skip),
    {ok, PS2}.

%% 选择转盘ID
choose_rotary_id(PS) ->
    case catch check_choose_rotary_id(PS) of
        {ok, ID} ->
            set_rotary_id(ID),
            set_id_list([]),
            MsgRecord = #sc_guild_task_rotary_choose{choose_id = ID},
            {ok, Bin} = prot_msg:encode_msg(51413, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_choose_rotary_id(_PS) ->
    Now = time:unixtime(),
    EndTime = get_rotary_time(),
    EndTime > Now orelse erlang:throw({error, ?RC_THIEF_ADVENTURE_OVER_TIME}),
    IDList = get_id_list(),
    IDList =/= [] orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    {ID, _, _} = util:rand_by_weight(IDList, 3),
    {ok, ID}.

%% 领取转盘奖励
get_rotary_reward(PS) ->
    case catch check_get_rotary_reward(PS) of
        {ok, Reward, EndTime} ->
            set_rotary_id(0),
            set_rotary_time(EndTime),
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_GUILD_DAILY_TASK),
            MsgRecord = #sc_guild_task_rotary_get{end_time = EndTime},
            {ok, Bin} = prot_msg:encode_msg(51415, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_rotary_reward(PS) ->
    #role_state{level = Lv} = PS,
    Now = time:unixtime(),
    EndTime = get_rotary_time(),
    EndTime > Now orelse erlang:throw({error, ?RC_THIEF_ADVENTURE_OVER_TIME}),
    ID = get_rotary_id(),
    ID > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{rotary_reward := RewardList} = conf_guild_task_info:get(),
    Rewards = util:get_zone_config(RewardList, Lv),
    {_, Reward, _} = lists:keyfind(ID, 1, Rewards),
    NewEndTime = Now - 10,
    {ok, Reward, NewEndTime}.

%% 部分奖励受其他功能影响
calc_reward({Reward, Funds}, GuildID) ->
    GoodsList = lib_drop_base:get_drop_goods(Reward),
    AddItems =
        lists:map(fun({Type, Value}) ->
            case Type =:= ?AST_CONT orelse Type =:= ?AST_CURRENCY of
                true ->
                    %% 帮派祝福加成
                    Mul = lib_guild:activity_is_blessed(GuildID, ?BLESS_TYPE_TASK),
                    {Type, lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_6, Value) + Value * (Mul - 1)};
                _ ->
                    {Type, Value}
            end
        end, GoodsList),
    {AddItems, Funds}.

get_daily_times(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{finish_times := Times} = RoleData,
    Times.

init_role_data(RoleID) ->
    {Flag, Type, ID, FinishTimes, DropTime} = get_role_db_data(RoleID),
    RoleData = #{flag => Flag, type => Type, id => ID, finish_times => FinishTimes, drop_time => DropTime},
    set_role_data(RoleID, RoleData),
    RoleData.

set_rotary_time(Time) ->
    erlang:put({?MODULE, end_time}, Time).

get_rotary_time() ->
    case erlang:get({?MODULE, end_time}) of
        Time when is_integer(Time) -> Time;
        _ -> 0
    end.

set_rotary_id(Time) ->
    erlang:put({?MODULE, rotary_id}, Time).

get_rotary_id() ->
    case erlang:get({?MODULE, rotary_id}) of
        ID when is_integer(ID) -> ID;
        _ -> 0
    end.

set_id_list(List) ->
    erlang:put({?MODULE, id_list}, List).

get_id_list() ->
    case erlang:get({?MODULE, id_list}) of
        List when is_list(List) -> List;
        _ -> []
    end.

handle_id_list() ->
    [ID || {ID, _, _} <- get_id_list()].
handle_id_list(IDList) ->
    [ID || {ID, _, _} <- IDList].


set_role_data(_RoleId, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) -> RoleData;
        _ -> init_role_data(RoleID)
    end.

save_data(RoleID, RoleData) ->
    #{flag := Flag, type := Type, id := ID, finish_times := FinishTimes, drop_time := DropTime} = RoleData,
    save_role_data(RoleID, Flag, Type, ID, FinishTimes, DropTime).

-define(SQL_GET_ROLE_DATA, <<"select flag, type, id, finish_times, drop_time from role_guild_task where role_id = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [Flag, Type, ID, FinishTimes, DropTime] ->
            {Flag, Type, ID, FinishTimes, DropTime};
        [] ->
            {0, 0, 0, 0, 0}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_guild_task(role_id, flag, type, id, finish_times, drop_time) values(~w, ~w, ~w, ~w, ~w, ~w)">>).
save_role_data(RoleID, Flag, Type, ID, FinishTimes, DropTime) ->
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, Flag, Type, ID, FinishTimes, DropTime]),
    ?DB:execute(SQL).
