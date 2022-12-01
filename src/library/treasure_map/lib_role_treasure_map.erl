%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     藏宝图
%%% @end
%%% Created : 20. 十一月 2018 17:11
%%%-------------------------------------------------------------------
-module(lib_role_treasure_map).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("proto/prot_519.hrl").

-define(TYPE_COIN, 1).
-define(TYPE_ITEM, 2).
-define(TYPE_COST_HP, 3).
-define(TYPE_BOOK, 4).
-define(TYPE_THIEF, 5).
-define(TYPE_RARE_THIEF, 6).
-define(TYPE_RARE_DUNGEON, 7).

-record(treausre_map, {
    is_trigger = 0,
    task_times = 0,
    daily_times = 0,
    daily_rare_times = 0,
    daily_top_times = 0,
    is_complete = 0,
    last_check = 0,
    updated = false
}).

-record(map_mon_info, {
    scene_id = 0,
    line_id = 0,
    mtype_id = 0,
    drop_id = 0,
    aid = 0
}).

-record(map_rare_mon_info, {
    scene_id = 0,
    line_id = 0,
    mtype_id = 0,
    aid = 0
}).

-record(map_pos_info, {
    scene_id = 0,
    x = 0,
    y = 0
}).

%% API
-export([
    do/3,
    event/2,
    init/1,
    info/1,
    get_pos/1,
    use/2,
    save/1,
    get_task/1,
    blood_loss/1,
    cross_day/1,
    get_daily_times/1
]).

event(PS, {'kill_mon', MTypeID}) ->
    maybe_kill_mon(PS, MTypeID);
event(_, _) ->
    skip.


do(51901, PS, _Req) ->
    info(PS);
do(51903, PS, _Req) ->
    get_pos(PS);
do(51905, PS, #cs_treasure_map_use{item_id = ItemID}) ->
    use(PS, ItemID);
do(51908, PS, _Req) ->
    get_task(PS);
do(51911, PS, _Req) ->
    get_reward(PS);
do(_, _, _) ->
    skip.

%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_db_data(RoleID),
    RoleDataN = ?iif(time:is_today(RoleData#treausre_map.last_check), RoleData, #treausre_map{last_check = time:unixtime()}),
    set_role_data(RoleID, RoleDataN).

%% @doc 信息
info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #treausre_map{is_trigger = IsTrigger, task_times = TaskTimes, is_complete = IsComplete} = RoleData,
    MsgRecord = #sc_treasure_map_info{is_trigger = IsTrigger, task_times = TaskTimes, is_complete = IsComplete},
    {ok, Bin} = prot_msg:encode_msg(51902, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 接任务
get_task(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #treausre_map{is_trigger = IsTrigger} = RoleData,
    IsTrigger =:= 0 orelse erlang:throw({error, ?RC_TREASURE_MAP_ALREADY_GET}),
    NewRoleData = RoleData#treausre_map{is_trigger = 1},
    MsgRecord = #sc_treasure_map_get{is_trigger = 1},
    {ok, Bin} = prot_msg:encode_msg(51909, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    update_role_data(RoleID, NewRoleData),
    ok.

%% @doc 获得坐标
get_pos(PS) ->
    #role_state{sid = RoleSid, level = Lv} = PS,
    #{pos_list := PosList} = conf_treasure_map_info:get(),
    List = util:get_zone_config(PosList, Lv),
    {SceneID, X, Y} = util:list_rand(List),
    PosInfo = #map_pos_info{scene_id = SceneID, x = X, y = Y},
    erlang:put({?MODULE, pos_info}, PosInfo),
    MsgRecord = #sc_treasure_map_pos{scene_id = SceneID, x = X, y = Y},
    {ok, Bin} = prot_msg:encode_msg(51904, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 使用藏宝图
use(PS, ItemID) ->
    CostItems = [{?AST_ITEM, [{ItemID, 1}]}],
    case catch check_use(PS, CostItems, ItemID) of
        {ok, RoleData, EventID, Type} ->
            NewPS = lib_role_assets:cost_items_notify(PS, CostItems, ?OPT_TREASURE_MAP),
            do_event(PS, EventID, Type),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_treasure_map_use{
                event_id = EventID,
                task_times = RoleData#treausre_map.task_times,
                is_complete = RoleData#treausre_map.is_complete,
                item_id = ItemID
            },
            {ok, Bin} = prot_msg:encode_msg(51906, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            erlang:erase({?MODULE, pos_info}),
            ?TASK_EVENT(PS, {'use_treasure_map', map_type(ItemID)}),
            {ok, NewPS};
        {error, Code} -> ?ERROR_TOC(PS, Code)
    end.

check_use(PS, CostItems, ItemID) ->
    lib_role_assets:check_items_enough(PS, CostItems),
    #{
        open_lv := OpenLv,
        nor_map_id := NorMapID,
        rare_map_id := RareMapID,
        top_map_id := TopMapID
    } = conf_treasure_map_info:get(),
    PS#role_state.level >= OpenLv orelse erlang:throw({error, ?RC_CHANNEL_ROLE_LV_LIMIT}),
    PosInfo = erlang:get({?MODULE, pos_info}),
    is_record(PosInfo, map_pos_info) orelse erlang:throw({error, ?RC_TREASURE_MAP_USE_MAP_IN_BAG}),
    #role_state{role_scene = #role_scene{scene_id = CurSceneID}} = PS,
    PosInfo#map_pos_info.scene_id =:= CurSceneID orelse erlang:throw({error, ?RC_SCENE_NOT_INSIDE_SPECIFY}),
    if
        ItemID =:= NorMapID ->
            use_nor(PS);
        ItemID =:= RareMapID ->
            use_rare(PS);
        ItemID =:= TopMapID ->
            use_top(PS);
        true ->
            {error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}
    end.

use_nor(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #treausre_map{is_trigger = IsTrigger, task_times = TaskTimes, daily_times = DailyTimes, is_complete = IsComplete} = RoleData,
    #{event_weight := EventWeight} = conf_treasure_map_info:get(),
    WeightList = util:get_zone_config(EventWeight, DailyTimes + 1),
    {EventID, _} = util:rand_by_weight(WeightList, 2),
    NewDailyTimes = DailyTimes + 1,
    NewRoleData =
        case IsTrigger =:= 1 andalso IsComplete =:= 0 of
            true when TaskTimes + 1 >= 10 ->
                lib_role_daily_lively:trigger_event(PS#role_state.id, 1008, 1),
                ?TASK_EVENT(RoleID, treasure_task),
                RoleData#treausre_map{is_complete = 1, task_times = TaskTimes + 1, daily_times = NewDailyTimes};
            true ->
                RoleData#treausre_map{task_times = TaskTimes + 1, daily_times = NewDailyTimes};
            _ ->
                RoleData#treausre_map{daily_times = NewDailyTimes}
        end,
    {ok, NewRoleData, EventID, 0}.

use_rare(PS) ->
    #role_state{id = RoleID, team_id = TeamID, level = Lv, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, x = X, y = Y} = RoleScene,
    %% 组队判断
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{leader := Leader, members := Members, mem_num := MemNum} = lib_team:get_team_info(TeamID),
    #{
        rare_event_weight := RareEventWeight,
        rare_use_reward := UseReward,
        rare_need_num := NeedNum
    } = conf_treasure_map_info:get(),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    MemNum >= NeedNum orelse erlang:throw({error, ?RC_TEAM_MEN_NUM_NOT_ENOUGH}),
    %% 队员是否集齐
    lib_scene_api:is_team_near(Members, SceneID, LineID, X, Y) orelse erlang:throw({error, ?RC_TREASURE_MAP_TEAM_NOT_TOGHER}),

    RoleData = get_role_data(RoleID),
    #treausre_map{daily_rare_times = DailyRareTimes} = RoleData,
    WeightList = util:get_zone_config(RareEventWeight, DailyRareTimes + 1),
    {EventID, _} = util:rand_by_weight(WeightList, 2),
    UseDropID = util:get_zone_config(UseReward, Lv),
    lib_drop_api:give_drop_asyn(RoleID, UseDropID, ?OPT_TREASURE_MAP),
    NewDailyRareTimes = DailyRareTimes + 1,
    NewRoleData = RoleData#treausre_map{daily_rare_times = NewDailyRareTimes},
    {ok, NewRoleData, EventID, 1}.

use_top(PS) ->
    #role_state{id = RoleID, team_id = TeamID, level = Lv, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, x = X, y = Y} = RoleScene,
    %% 组队判断
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{leader := Leader, members := Members, mem_num := MemNum} = lib_team:get_team_info(TeamID),
    #{
        top_event_weight := TopEventWeight,
        top_use_reward := UseReward,
        rare_need_num := NeedNum
    } = conf_treasure_map_info:get(),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    MemNum >= NeedNum orelse erlang:throw({error, ?RC_TEAM_MEN_NUM_NOT_ENOUGH}),
    %% 队员是否集齐
    lib_scene_api:is_team_near(Members, SceneID, LineID, X, Y) orelse erlang:throw({error, ?RC_TREASURE_MAP_TEAM_NOT_TOGHER}),

    RoleData = get_role_data(RoleID),
    #treausre_map{daily_top_times = DailyTopTimes} = RoleData,
    WeightList = util:get_zone_config(TopEventWeight, DailyTopTimes + 1),
    {EventID, _} = util:rand_by_weight(WeightList, 2),
    UseDropID = util:get_zone_config(UseReward, Lv),
    lib_drop_api:give_drop_asyn(RoleID, UseDropID, ?OPT_TREASURE_MAP),
    NewDailyTopTimes = DailyTopTimes + 1,
    NewRoleData = RoleData#treausre_map{daily_top_times = NewDailyTopTimes},
    {ok, NewRoleData, EventID, 2}.

%% 事件
do_event(PS, EventID, Type) ->
    #role_state{id = RoleID, sid = RoleSid, level = Lv, role_scene = RoleScene, name = Name, team_id = TeamID} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, line_pid = LinePid, x = X, y = Y} = RoleScene,
    Info = conf_treasure_map_by_lv:get(Lv, EventID),
    case EventID of
        ?TYPE_COST_HP ->
            svr_scene_agent:apply_cast(LinePid, ?MODULE, blood_loss, [RoleID]);
        ?TYPE_THIEF ->
            {MTypeID, DropID} = Info,
            Args = [{xy, {X, Y}}, {owner, #{id => RoleID, name => Name}}],
            AID = lib_scene_api:create_mon(MTypeID, LinePid, Args),
            MonInfo = #map_mon_info{
                scene_id = SceneID,
                line_id = LineID,
                mtype_id = MTypeID,
                drop_id = DropID,
                aid = AID
            },
            erlang:put({?MODULE, mon_info}, MonInfo),
            MsgRecord = #sc_treasure_map_refresh{mon_id = AID, is_rare = 0},
            {ok, Bin} = prot_msg:encode_msg(51907, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin);
        ?TYPE_RARE_THIEF ->
            {RareMTypeID, TopMTypeID} = Info,
            MTypeID = ?iif(Type =:= 1, RareMTypeID, TopMTypeID),
            Args = [{xy, {X, Y}}, {owner, #{team => TeamID}}],
            AID = lib_scene_api:create_mon(MTypeID, LinePid, Args),
            MonInfo = #map_rare_mon_info{
                scene_id = SceneID,
                line_id = LineID,
                mtype_id = MTypeID,
                aid = AID
            },
            erlang:put({?MODULE, rare_mon_info}, MonInfo),
            MsgRecord = #sc_treasure_map_refresh{mon_id = AID, is_rare = 1},
            {ok, Bin} = prot_msg:encode_msg(51907, MsgRecord),
            lib_team:broadcast(TeamID, Bin);
        ?TYPE_RARE_DUNGEON ->
            {RareDungID, TopDungID} = Info,
            DungID = ?iif(Type =:= 1, RareDungID, TopDungID),
            lib_role_team_dungeon:enter(PS, DungID),
            MsgRecord = #sc_treasure_map_event{event_id = ?TYPE_RARE_DUNGEON},
            {ok, Bin} = prot_msg:encode_msg(51913, MsgRecord),
            lib_team:broadcast(TeamID, Bin, [RoleID]);
        ?TYPE_BOOK ->
            DropID = Info,
            DropItemList = lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_TREASURE_MAP),
            [{_, [Goods]}] = DropItemList,
            #{id := GoodsID} = Goods,
            #{name := GName} = conf_goods:get(GoodsID),
            svr_rumor:publish(world, 21201, [Name, GName]);
        _ ->
            DropID = Info,
            lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_TREASURE_MAP)
    end.

%% 杀怪
maybe_kill_mon(#role_state{id = RoleID, sid = RoleSid, role_scene = #role_scene{scene_id = CurSceneID, line_id = CurLineID}}, KillMTypeID) ->
    case erlang:erase({?MODULE, mon_info}) of
        MonInfo when is_record(MonInfo, map_mon_info) ->
            #map_mon_info{
                scene_id = SceneID,
                line_id = LineID,
                drop_id = DropID,
                mtype_id = MTypeID
            } = MonInfo,
            case SceneID =:= CurSceneID andalso MTypeID =:= KillMTypeID andalso LineID =:= CurLineID of
                true ->
                    lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_TREASURE_MAP),
                    MsgRecord = #sc_treasure_mao_kill{type = 1},
                    {ok, Bin} = prot_msg:encode_msg(51910, MsgRecord),
                    lib_role_send:send_to_sid(RoleSid, Bin);
                _ ->
                    skip
            end;
        _ ->
            case erlang:erase({?MODULE, rare_mon_info}) of
                RMonInfo when is_record(RMonInfo, map_rare_mon_info) ->
                    #map_rare_mon_info{
                        scene_id = SceneID,
                        line_id = LineID,
                        mtype_id = MTypeID
                    } = RMonInfo,
                    case SceneID =:= CurSceneID andalso MTypeID =:= KillMTypeID andalso LineID =:= CurLineID of
                        true ->
                            MsgRecord = #sc_treasure_mao_kill{type = 2},
                            {ok, Bin} = prot_msg:encode_msg(51910, MsgRecord),
                            lib_role_send:send_to_sid(RoleSid, Bin);
                        _ ->
                            skip
                    end;
                _ ->
                    skip
            end
    end.

%% 扣血逻辑
blood_loss(RoleID) ->
    SceneRoler = lib_scene_agent:get_roler(RoleID),
    #scene_role{hp = Hp, level = Lv} = SceneRoler,
    Perc = conf_treasure_map_by_lv:get(Lv, ?TYPE_COST_HP),
    Key = {?BATTLE_ROLE, RoleID},
    Injury = erlang:floor(Hp * Perc / 10000),
    NowTimeMS = time:unixtime_ms(),
    lib_scene_cmd:handle_cmd('alter_obj_hp', {Key, Key, ?HARM_TYPE_POISON, -Injury, NowTimeMS}).

%% 跨天逻辑
cross_day(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = #treausre_map{last_check = time:unixtime()},
    MsgRecord = #sc_treasure_map_info{},
    {ok, Bin} = prot_msg:encode_msg(51902, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    update_role_data(RoleID, RoleData),
    ok.

%% 获取奖励
get_reward(PS) ->
    case catch check_get_reward(PS) of
        {ok, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_TREASURE_MAP),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_treasure_map_reward{is_complete = 2},
            {ok, Bin} = prot_msg:encode_msg(51912, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #treausre_map{is_complete = IsComplete} = RoleData,
    IsComplete =:= 1 orelse erlang:throw({error, ?RC_TREASURE_MAP_NOT_COMPLETE}),
    #{box_reward := BoxReward} = conf_treasure_map_info:get(),
    Reward = util:get_zone_config(BoxReward, Lv),
    NewRoleData = RoleData#treausre_map{is_complete = 2},
    {ok, NewRoleData, Reward}.

map_type(GoodsID) ->
    #{
        nor_map_id := NorMapID,
        rare_map_id := RareMapID,
        top_map_id := TopMapID
    } = conf_treasure_map_info:get(),
    case GoodsID of
        NorMapID -> 1;
        RareMapID -> 2;
        TopMapID -> 3;
        _ -> 0
    end.

get_daily_times(RoleID) ->
    RoleData = get_role_data(RoleID),
    #treausre_map{daily_times = DailyTimes} = RoleData,
    DailyTimes.

%% -----------------------------------------------------------------------------

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#treausre_map{updated = true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

%% 下线保存
save(PS) ->
    RoleData = get_role_data(PS#role_state.id),
    #treausre_map{updated = Updated} = RoleData,
    case Updated of
        true ->
            #treausre_map{
                is_trigger = IsTrigger,
                task_times = TaskTimes,
                daily_times = DailyTimes,
                daily_rare_times = DailyRareTimes,
                daily_top_times = DailyTopTimes,
                is_complete = IsComplete,
                last_check = LastCheck
            } = RoleData,
            save_role_data(PS#role_state.id, IsTrigger, TaskTimes, DailyTimes, DailyRareTimes, DailyTopTimes, IsComplete, LastCheck);
        _ ->
            skip
    end.

-define(SQL_GET_ROLE_DATA, <<"select is_trigger, task_times, daily_times, daily_rare_times, daily_top_times, is_complete, last_check from role_treasure_map where role_id = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [IsTrigger, TaskTimes, DailyTimes, DailyRareTimes, DailyTopTimes, IsComplete, LastCheck] ->
            #treausre_map{
                is_trigger = IsTrigger,
                task_times = TaskTimes,
                daily_times = DailyTimes,
                daily_rare_times = DailyRareTimes,
                daily_top_times = DailyTopTimes,
                is_complete = IsComplete,
                last_check = LastCheck
            };
        [] ->
            #treausre_map{last_check = time:unixtime()}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_treasure_map(role_id, is_trigger, task_times, daily_times, daily_rare_times, daily_top_times, is_complete, last_check) values(~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w)">>).
save_role_data(RoleID, IsTrigger, TaskTimes, DailyTimes, DailyRareTimes, DailyTopTimes, IsComplete, LastCheck) ->
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, IsTrigger, TaskTimes, DailyTimes, DailyRareTimes, DailyTopTimes, IsComplete, LastCheck]),
    ?DB:execute(SQL).