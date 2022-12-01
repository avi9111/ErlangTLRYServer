%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     烟花
%%% @end
%%% Created : 27. 二月 2019 15:23
%%%-------------------------------------------------------------------
-module(lib_role_firework).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("battle.hrl").
-include("firework.hrl").
-include("vow.hrl").
-include("proto/prot_543.hrl").

%% API
-export([
    init/1,
    do/3,
    send_info/1,
    handle_info/2
]).

do(54301, PS, _Req) ->
    send_info(PS);
do(54303, PS, #cs_firework_use{item_id = ItemID, target_id = TargetID}) ->
    use(PS, ItemID, TargetID);
do(_, _, _) ->
    skip.

handle_info({add_charm, AddCharm}, PS) ->
    add_charm(PS, AddCharm);
handle_info(_, _) ->
    skip.

init(PS) ->
    RoleData = get_role_db_data(PS#role_state.id),
    set_role_data(PS#role_state.id, RoleData).

send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{hero := Hero, charm := Charm} = RoleData,
    MsgRecord = #sc_firework_info{hero = Hero, charm = Charm},
    {ok, Bin} = prot_msg:encode_msg(54302, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

use(PS, ItemID, TargetID) ->
    case catch check_use(PS, ItemID, TargetID) of
        ok ->
            CostItems = [{?AST_ITEM, [{ItemID, 1}]}],
            NewPS = lib_role_assets:cost_items_notify(PS, CostItems, ?OPT_FIREWORK),
            MsgRecord = #sc_firework_use{target_id = TargetID, res = ?RC_SUCCEED},
            {ok, Bin} = prot_msg:encode_msg(54305, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS};
        {error, Code} ->
            MsgRecord = #sc_firework_use{target_id = TargetID, res = Code},
            {ok, Bin} = prot_msg:encode_msg(54305, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin)
    end.

check_use(PS, ItemID, TargetID) ->
    CostItems = [{?AST_ITEM, [{ItemID, 1}]}],
    lib_role_assets:check_items_enough(PS, CostItems),
    case TargetID > 0 of
        true ->
            use_to_target(PS, ItemID, TargetID);
        _ ->
            use_to_all(PS, ItemID)
    end.

use_to_all(PS, ItemID) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{line_pid = LinePid, x = X, y = Y, scene_id = SceneID, line_id = LineID} = RoleScene,
    RoleData = get_role_data(RoleID),
    #{hero := Hero, charm := Charm} = RoleData,
    util:check_action_limit({?MODULE, firework}, 5),
    Conf = conf_firework:get(ItemID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{
        type := Type,
        visible_object := NotifyType,
        hero := AddHero,
        flyitem_id := FlyItemIDList,
        scene_limit := SceneLimit,
        func_type := FuncType
    } = Conf,
    lists:member(SceneID, SceneLimit) orelse erlang:throw({error, ?RC_GOODS_SCENE_LMT}),
    Type =:= ?FIREWORK_TYPE_ALL orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    [lib_scene_api:create_flyitem_async(FlyItemID, LinePid, {X, Y}, {?BATTLE_ROLE, RoleID}) || FlyItemID <- FlyItemIDList],
    MsgRecord = #sc_firework_notify{item_id = ItemID},
    {ok, Bin} = prot_msg:encode_msg(54304, MsgRecord),
    if
        NotifyType =:= ?FIREWORK_NOTIFY_ALL ->
            lib_scene_api:send_to_scene(SceneID, LineID, Bin);
        NotifyType =:= ?FIREWORK_NOTIFY_MYSELF ->
            lib_role_send:send_to_role(RoleID, Bin);
        true ->
            skip
    end,
    FuncType =:= ?FIREWORK_FUNC_TYPE_MARRY_HALL andalso ?TASK_EVENT(RoleID, 'use_firework'),
    AddHero > 0 andalso begin
        NewHero = Hero + AddHero,
        NewRoleData = RoleData#{hero => NewHero},
        save_role_data(RoleID, NewHero, Charm),
        set_role_data(RoleID, NewRoleData),
        MsgRecord2 = #sc_firework_info{hero = NewHero, charm = Charm},
        {ok, Bin2} = prot_msg:encode_msg(54302, MsgRecord2),
        lib_role_send:send_to_role(RoleID, Bin2)
    end,
    ok.


use_to_target(PS, ItemID, TargetID) ->
    #role_state{id = RoleID, role_scene = RoleScene, server_num = SvrNum, name = Name} = PS,
    #role_scene{line_pid = LinePid, x = X, y = Y, scene_id = SceneID, line_id = LineID} = RoleScene,
    TargetID =/= RoleID orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    RoleData = get_role_data(RoleID),
    #{hero := Hero, charm := Charm} = RoleData,
    util:check_action_limit({?MODULE, firework}, 5),
    Conf = conf_firework:get(ItemID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{
        type := Type,
        visible_object := NotifyType,
        hero := AddHero,
        charm := AddCharm,
        flyitem_id := FlyItemIDList,
        info_key := InfoKey,
        scene_limit := SceneLimit,
        func_type := FuncType
    } = Conf,
    lists:member(SceneID, SceneLimit) orelse erlang:throw({error, ?RC_GOODS_SCENE_LMT}),
    (Type =:= ?FIREWORK_TYPE_TARGET andalso TargetID > 0) orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_CHAT_TARGET_NOT_ONLINE}),
    [lib_scene_api:create_flyitem_async(FlyItemID, LinePid, {X, Y}, {?BATTLE_ROLE, RoleID}) || FlyItemID <- FlyItemIDList],
    MsgRecord = #sc_firework_notify{item_id = ItemID},
    {ok, Bin} = prot_msg:encode_msg(54304, MsgRecord),
    if
        NotifyType =:= ?FIREWORK_NOTIFY_ALL ->
            lib_scene_api:send_to_scene(SceneID, LineID, Bin);
        NotifyType =:= ?FIREWORK_NOTIFY_MYSELF ->
            lib_role_send:send_to_role(RoleID, Bin);
        NotifyType =:= ?FIREWORK_NOTIFY_TARGET ->
            lib_role_send:send_to_role(TargetID, Bin);
        NotifyType =:= ?FIREWORK_NOTIFY_ALL_TARGET ->
            case lib_scene_api:is_role_in_scene(SceneID, LineID, TargetID) of
                true ->
                    skip;
                _ ->
                    lib_role_send:send_to_role(TargetID, Bin)
            end,
            lib_scene_api:send_to_scene(SceneID, LineID, Bin);
        NotifyType =:= ?FIREWORK_NOTIFY_MYSELF_TARGET ->
            lib_role_send:send_to_role(RoleID, Bin),
            lib_role_send:send_to_role(TargetID, Bin);
        true ->
            skip
    end,
    #{string := ChatStr} = conf_string:get(InfoKey),
    #{name := GoodsName} = conf_goods:get(ItemID),
    lib_role_sworn:greet_send_msg(PS, {TargetID, SvrNum}, ChatStr),
    svr_rumor:publish(world, 28001, [Name, GoodsName, lib_cache:get_role_name(TargetID)]),
    lib_role:mod_info(RoleID, lib_role_vow, {trigger, ?DEED_TYPE_FIREWORK, 0, TargetID}),
    FuncType =:= ?FIREWORK_FUNC_TYPE_MARRY_HALL andalso ?TASK_EVENT(RoleID, 'use_firework'),
    AddHero > 0 andalso begin
        NewHero = Hero + AddHero,
        NewRoleData = RoleData#{hero => NewHero},
        save_role_data(RoleID, NewHero, Charm),
        set_role_data(RoleID, NewRoleData),
        MsgRecord2 = #sc_firework_info{hero = NewHero, charm = Charm},
        {ok, Bin2} = prot_msg:encode_msg(54302, MsgRecord2),
        lib_role_send:send_to_role(RoleID, Bin2),
        AddCharm > 0 andalso lib_role:mod_info(TargetID, ?MODULE, {add_charm, AddCharm})
    end,
    ok.

%% 增加魅力值
add_charm(PS, AddCharm) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{hero := Hero, charm := Charm} = RoleData,
    NewCharm = Charm + AddCharm,
    NewRoleData = RoleData#{charm => NewCharm},
    save_role_data(RoleID, Hero, NewCharm),
    set_role_data(RoleID, NewRoleData),
    MsgRecord = #sc_firework_info{hero = Hero, charm = NewCharm},
    {ok, Bin} = prot_msg:encode_msg(54302, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_FIREWORK_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [Hero, Charm] ->
            #{
                hero => Hero,
                charm => Charm
            };
        [] ->
            #{
                hero => 0,
                charm => 0
            }
    end.

save_role_data(RoleID, Hero, Charm) ->
    SQL = io_lib:format(?SQL_SET_ROLE_FIREWORK_DATA, [RoleID, Hero, Charm]),
    ?DB:execute(SQL).