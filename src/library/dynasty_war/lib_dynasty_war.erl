%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争 [管理]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_dynasty_war).
-author("Ryuu").

-include("common.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("dynasty_war.hrl").
-include("proto/prot_307.hrl").

%% API
-export([
    init/1,
    info/1,
    loop/2,
    enter/2,
    leave/2,
    clean_up/0,
    match_end/1,
    stop_activity/1,
    start_activity/1
]).

-export([
    is_in_scene/1,
    battle_scene/0,
    is_battle_scene/1
]).

-define(DIV_KEY(GroupID, Div), {GroupID, Div}).
-define(LINE_ID(GroupID, Div, ID), (GroupID * 1000 + Div * 100 + ID)).

%% @doc 信息
info(GroupID) ->
    IDList = conf_dynasty_war_room:get_ids(),
    [
        {group_id, GroupID},
        {match, erlang:get(match)},
        [{war_info, [{ID, get_war_info(?DIV_KEY(GroupID, ID))} || ID <- IDList]}]
    ].

%% @doc 初始化
init(GroupID) ->
    init_scene(GroupID),
    #{group_id => GroupID}.

%% @doc 开启活动
start_activity(_Activity) ->
    svr_timer:register(),
    erlang:put(match, true),
    MatchTime = config:get_sys_config(dynasty_war_match_time),
    erlang:send_after(MatchTime * 1000, self(), match_end),
    ok.

%% @doc 结束活动
stop_activity(Activity) ->
    svr_timer:unregister(),
    #{group_id := GroupID} = Activity,
    clear_scene(GroupID).

%% @doc 匹配结束
match_end(State) ->
    #{group_id := GroupID} = State,
    erlang:put(match, false),
    match(GroupID, false),
    ok.

%% @doc 定时循环
loop(State, Now) ->
    #{group_id := GroupID} = State,
    Match = erlang:get(match) =:= true,
    if
        Match andalso Now rem 3 =:= 0 -> %% 匹配时间段
            match(GroupID, true);
        true ->
            ignore
    end,
    Match andalso notify_scene_info(GroupID),
    ok.

%% @doc 通知场景信息
notify_scene_info(GroupID) ->
    IDList = conf_dynasty_war_room:get_ids(),
    notify_scene_info(IDList, GroupID).

notify_scene_info([], _GroupID) ->
    ok;
notify_scene_info([Div | T], GroupID) ->
    WarInfo = get_war_info(?DIV_KEY(GroupID, Div)),
    #{role_set := RoleSet} = WarInfo,
    Rec = #sc_dynasty_scene_info{
        role_num = sets:size(RoleSet)
    },
    {ok, Bin} = prot_msg:encode_msg(30705, Rec),
    SceneID = conf_dynasty_war_room:get_div_scene(Div),
    [begin
        lib_scene_api:send_to_scene(SceneID, ?LINE_ID(GroupID, Div, ID), Bin)
    end || ID <- lists:seq(1, ?ROOM_NUM)],
    notify_scene_info(T, GroupID).

%% @doc 匹配
match(GroupID, Fix) ->
    IDList = conf_dynasty_war_room:get_ids(),
    match(IDList, GroupID, Fix).

match([], _GroupID, _Fix) ->
    ok;
match([Div | T], GroupID, Fix) ->
    WarInfo = get_war_info(?DIV_KEY(GroupID, Div)),
    #{role_set := RoleSet, room_id := RoomID} = WarInfo,
    MatNum = config:get_sys_config(dynasty_war_match_num),
    {NewRoomID, LeftRoles} = match_room(sets:to_list(RoleSet), GroupID, Div, RoomID, sets:size(RoleSet), MatNum, Fix),
    NewWarInfo = WarInfo#{room_id => NewRoomID, role_set => sets:from_list(LeftRoles)},
    set_war_info(?DIV_KEY(GroupID, Div), NewWarInfo),
    match(T, GroupID, Fix).

match_room(RoleList, GroupID, Div, RoomID, TotalNum, MatNum, Fix) ->
    SplitNum = ?iif(Fix orelse TotalNum >= MatNum, MatNum, TotalNum),
    case RoleList =/= [] andalso TotalNum >= SplitNum of
        true ->
            {SplitList, Rest} = util:split_list(SplitNum, RoleList),
            NewRoomID = RoomID + 1,
            start_room(GroupID, Div, NewRoomID, SplitList),
            match_room(Rest, GroupID, Div, NewRoomID, TotalNum - SplitNum, MatNum, Fix);
        _ ->
            {RoomID, RoleList}
    end.

start_room(GroupID, Div, AutoID, RoleList) ->
    ActID = ?ACT_ID_DYNASTY_WAR,
    RoomID = ?LINE_ID(GroupID, Div, AutoID),
    LineID = RoomID,
    SceneID = battle_scene(),
    lib_kf:create_kf_scene(SceneID, ActID, GroupID, LineID),
    ScenePid = svr_scene_mgr:get_line_pid(SceneID, LineID),
    Num = length(RoleList),
    Half = erlang:ceil(Num / 2),
    {SongRoles, LiaoRoles} = util:split_list(Half, RoleList),
    CampKv = [{?CAMP_SONG, SongRoles}, {?CAMP_LIAO, LiaoRoles}],
    {Camps, Roles} = collect_camp_info(CampKv, RoomID, [], []),
    RoomInfo = ?dynasty_war_room_info#{
        id => RoomID, group_id => GroupID, scene_id => SceneID, line_id => LineID,
        role_set => sets:from_list(RoleList), scene_pid => ScenePid
    },
    sup_dynasty_war_bat:start_child([RoomInfo, Camps, Roles]),
    ok.

collect_camp_info([], _RoomID, CampAcc, RoleAcc) ->
    {CampAcc, RoleAcc};
collect_camp_info([{CampID, Roles} | T], RoomID, CampAcc, RoleAcc) ->
    NewRoleAcc = collect_camp_role(Roles, RoomID, CampID, RoleAcc),
    CampInfo = ?dynasty_war_room_camp#{
        id => CampID, role_set => sets:from_list(Roles)
    },
    NewCampAcc = [{CampID, CampInfo} | CampAcc],
    collect_camp_info(T, RoomID, NewCampAcc, NewRoleAcc).

collect_camp_role([], _RoomID, _CampID, Acc) ->
    Acc;
collect_camp_role([RoleID | T], RoomID, CampID, Acc) ->
    RoleData = get_role_data(RoleID),
    RoomRole = maps:merge(?dynasty_war_room_role#{
        camp_id => CampID, room_id => RoomID
    }, RoleData),
    collect_camp_role(T, RoomID, CampID, [{RoleID, RoomRole} | Acc]).

%% @doc 进入
enter(GroupID, EnterInfo) ->
    case catch check_enter(GroupID, EnterInfo) of
        {ok, Div, WarInfo, RoleID, RoleData} ->
            set_war_info(?DIV_KEY(GroupID, Div), WarInfo),
            set_role_data(RoleID, RoleData),
            change_to_prepare_scene(RoleData, GroupID, Div),
            Rec = #sc_dynasty_war_enter{},
            {ok, Bin} = prot_msg:encode_msg(30702, Rec),
            lib_role_send:send_to_role(EnterInfo, Bin);
        {error, Code} ->
            ?ERROR_TOC(EnterInfo, Code)
    end.

check_enter(GroupID, EnterInfo) ->
    #{id := RoleID, division := Div} = EnterInfo,
    RoleData = get_role_data(RoleID),
    Match = erlang:get(match),
    Match orelse erlang:throw({error, ?RC_DYNASTY_WAR_MATCH_END}),
    Now = time:unixtime(),
    NewRoleData = maps:merge(RoleData#{enter => Now}, EnterInfo),
    WarInfo = get_war_info(?DIV_KEY(GroupID, Div)),
    #{role_set := RoleSet} = WarInfo,
    NewRoleSet = sets:add_element(RoleID, RoleSet),
    NewWarInfo = WarInfo#{role_set => NewRoleSet},
    {ok, Div, NewWarInfo, RoleID, NewRoleData}.

change_to_prepare_scene(RoleData, GroupID, Div) ->
    SceneID = conf_dynasty_war_room:get_div_scene(Div),
    {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
    LineID = ?LINE_ID(GroupID, Div, util:rand(1, ?ROOM_NUM)),
    lib_role:mod_info(RoleData, lib_role_dynasty_war, {enter_async, [SceneID, LineID, X, Y]}),
    ok.

%% @doc 退出
leave(GroupID, RoleID) ->
    RoleData = get_role_data(RoleID),
    #{division := Div} = RoleData,
    Now = time:unixtime(),
    NewRoleData = RoleData#{leave => Now},
    set_role_data(RoleID, NewRoleData),
    WarInfo = get_war_info(?DIV_KEY(GroupID, Div)),
    #{role_set := RoleSet} = WarInfo,
    NewRoleSet = sets:del_element(RoleID, RoleSet),
    NewWarInfo = WarInfo#{role_set => NewRoleSet},
    set_war_info(?DIV_KEY(GroupID, Div), NewWarInfo).

%% -----------------------------------------------------------------------------
%% create & destroy
%% -----------------------------------------------------------------------------

init_scene(GroupID) ->
    IDList = conf_dynasty_war_room:get_ids(),
    init_scene(IDList, GroupID).

init_scene([], _GroupID) ->
    ok;
init_scene([Div | T], GroupID) ->
    SceneID = conf_dynasty_war_room:get_div_scene(Div),
    LineList = [?LINE_ID(GroupID, Div, ID) || ID <- lists:seq(1, ?ROOM_NUM)],
    lib_kf:create_kf_scenes(SceneID, ?ACT_ID_DYNASTY_WAR, GroupID, LineList),
    init_scene(T, GroupID).

clear_scene(GroupID) ->
    Divs = conf_territory_room:get_ids(),
    clear_scene(Divs, GroupID).

clear_scene([], _GroupID) ->
    ok;
clear_scene([Div | T], GroupID) ->
    SceneID = conf_dynasty_war_room:get_div_scene(Div),
    [lib_kf:clear_kf_scene(SceneID, ?LINE_ID(GroupID, Div, ID)) || ID <- lists:seq(1, ?ROOM_NUM)],
    clear_scene(T, GroupID).

clean_up() ->
    dist:sup_info_child(sup_dynasty_war_bat, stop_clear).

%% -----------------------------------------------------------------------------
%% 通用
%% -----------------------------------------------------------------------------

%% @doc 战斗场景
battle_scene() ->
    config:get_sys_config(dynasty_war_battle_scene).

is_prepare_scene(SceneID) ->
    conf_dynasty_war_room:is_prepare(SceneID).

is_battle_scene(SceneID) ->
    SceneID =:= battle_scene().

is_in_scene(SceneID) ->
    is_prepare_scene(SceneID) orelse
        is_battle_scene(SceneID).

%% -----------------------------------------------------------------------------
%% 数据
%% -----------------------------------------------------------------------------

get_role_data(RoleID) ->
    case erlang:get({role_data, RoleID}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?dynasty_war_role#{id => RoleID}
    end.

set_role_data(RoleID, RoleData) ->
    erlang:put({role_data, RoleID}, RoleData).

get_war_info(Key) ->
    case erlang:get({war_info, Key}) of
        WarInfo when is_map(WarInfo) ->
            WarInfo;
        _ ->
            ?dynasty_war_info#{key => Key}
    end.

set_war_info(Key, WarInfo) ->
    erlang:put({war_info, Key}, WarInfo).
