%%-------------------------------------------------------
%% @File     : lib_scene_map.erl
%% @Brief    : 场景广播算法
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%-------------------------------------------------------
-module(lib_scene_map).

-include("log.hrl").
-include("scene.hrl").
-include("proto/prot_902.hrl").

-export([
    get_xy/2,           % 获取区域id
    get_the_area/1,
    get_the_area/2,

    get_xy_objs/2,      % 取出xy格的对象
    push_into_xy/3,     % 将对象存入xy
    pop_from_xy/3,      % 将对象从xy删除
    clear_xy_objs/1,    % 清除某类对象

    obj_move_broadcast/6,
    role_move_broadcast/9,
    pet_move_broadcast/7,
    get_broadcast_mon/2,
    get_broadcast_roler/2,
    get_broadcast_pet/2,
    get_broadcast_coll/2,
    get_broadcast_carry/2,
    get_broadcast_flyitem/2,
    get_default_enter_pos/1,
    repel_user_broadcast/3
]).

-define(MAP_LENGTH, get(map_length)).
-define(MAP_LENGTH_M, 0).                       % 九宫格中间格子
-define(MAP_LENGTH_R, 1).                       % 九宫格右边格子
-define(MAP_LENGTH_L, -1).                      % 九宫格左边格子
-define(MAP_LENGTH_U(MapLen), -(MapLen)).       % 九宫格上边格子
-define(MAP_LENGTH_D(MapLen), (MapLen)).        % 九宫格下边格子
-define(MAP_LENGTH_LU(MapLen), -(MapLen + 1)).  % 九宫格左上边格子
-define(MAP_LENGTH_LD(MapLen), (MapLen- 1)).    % 九宫格左下边格子
-define(MAP_LENGTH_RU(MapLen), -(MapLen - 1)).  % 九宫格右上边格子
-define(MAP_LENGTH_RD(MapLen), (MapLen+ 1)).    % 九宫格右下边格子



%% Apis -------------------------------------------------
%%  获取要广播的范围用户信息
get_broadcast_roler(X, Y) ->
    Area = get_the_area(X, Y),
    lib_scene_agent:get_all_area(Area).

%%  获取要广播的范围怪物信息
get_broadcast_mon(X, Y) ->
    Area = get_the_area(X, Y),
    lib_mon_agent:get_all_area(Area).

%%  获取要广播的范围怪物信息
get_broadcast_pet(X, Y) ->
    Area = get_the_area(X, Y),
    lib_pet_agent:get_all_area(Area).

%%  获取要广播的范围采集物信息
get_broadcast_coll(X, Y) ->
    Area = get_the_area(X, Y),
    lib_coll_agent:get_all_area(Area).

%%  获取要广播的范围镖车信息
get_broadcast_carry(X, Y) ->
    Area = get_the_area(X, Y),
    lib_carry_agent:get_all_area(Area).

%%  获取要广播的范围镖车信息
get_broadcast_flyitem(X, Y) ->
    Area = get_the_area(X, Y),
    lib_flyitem_agent:get_all_area(Area).


%%--------------------------九宫格加载场景---------------------------
%% 根据每张地图实际大小，分成一个个固定大小的大格子，并从左到右赋予编号。
%% 如把整个地图共有100*150个格子，0，0坐标点为原点，以10*15为一个格子，从左到右编号， 那么坐标50,50所在的格子的编号就是Y div 15 * 10 + X div 10 + 1.

%% 获取当前所在的格子的编号
get_xy(-1, -1) ->
    -1;
get_xy(X, Y) ->
    Y div ?MAP_GRID * ?MAP_LENGTH + X div ?MAP_GRID + 1.

%% 获取九宫格
get_the_area(XY) ->
    ML = ?MAP_LENGTH,
    [
        XY + ?MAP_LENGTH_LU(ML), XY + ?MAP_LENGTH_U(ML), XY + ?MAP_LENGTH_RU(ML),
        XY + ?MAP_LENGTH_L, XY, XY + ?MAP_LENGTH_R,
        XY + ?MAP_LENGTH_LD(ML), XY + ?MAP_LENGTH_D(ML), XY + ?MAP_LENGTH_RD(ML)
    ].
%% 获取九宫格
get_the_area(X, Y) ->
    XY = get_xy(X, Y),
    get_the_area(XY).

%% 取出xy格的对象
get_xy_objs(Type, XY) ->
    XyKey = ?TABLE_AREA(Type, XY),
    case get(XyKey) of
        undefined -> [];
        AreaMap -> maps:keys(AreaMap)
    end.

%% 将目标存入xy
push_into_xy(Type, XY, ObjId) ->
    XyKey = ?TABLE_AREA(Type, XY),
    case get(XyKey) of
        undefined -> put(XyKey, #{ObjId => 0});
        AreaMap -> put(XyKey, AreaMap#{ObjId => 0})
    end.

%% 将目标从xy删除
pop_from_xy(Type, XY, ObjId) ->
    XyKey = ?TABLE_AREA(Type, XY),
    case get(XyKey) of
        AreaMap when is_map(AreaMap) ->
            AreaMapN = maps:remove(ObjId, AreaMap),
            case maps:size(AreaMapN) of
                0 -> erase(XyKey);
                _ -> put(XyKey, AreaMapN)
            end;
        _ ->
            skip
    end.

%% 清除某类对象
% @doc 清除场景内所有九宫格怪物数据
clear_xy_objs(Type) ->
    Keys = get_keys(),
    [erase(Key) || {ObjType, _XY} = Key <- Keys, ObjType =:= Type].

%% 当镖车、飞行道具移动时候的广播
%% 终点要X1，Y1，原点是X2,Y2
%% RemoveBinData移除obj包 AddBinData有obj进入
obj_move_broadcast(X1, Y1, X2, Y2, RemoveBinData, AddBinData) ->
    {AreaRemove, AreaAdd} = get_sync_area(X1, Y1, X2, Y2),
    lib_scene_agent:send_to_any_area(AreaRemove, RemoveBinData),
    lib_scene_agent:send_to_any_area(AreaAdd, AddBinData).

%% 当人物移动时候的广播
%% 终点要X1，Y1，原点是X2,Y2
%% RemoveBinData移除角色包 AddBinData有角色进入
role_move_broadcast(X1, Y1, X2, Y2, RemoveBinData, AddBinData, RoleId, RoleSid, _OwnerSid) when RoleId > ?MAX_ROBOT_ID ->
    {AreaRemove, AreaAdd} = get_sync_area(X1, Y1, X2, Y2),

    % 怪物aoi
    AddMonL = lib_mon_agent:get_all_area(AreaAdd),
    AddMonBin = if
        AddMonL =:= [] ->
            <<>>;
        true ->
            MonSceneInfoL = data_transfer:sc_mon_scene_info_list(AddMonL),
            AddMonMsg = #bcast_add_mon_scene_info{mon_list = MonSceneInfoL},
            element(2, prot_msg:encode_msg(90234, AddMonMsg))
    end,
    DelMonIds = lib_mon_agent:get_all_area_id(AreaRemove),
    DelMonBin = if
        DelMonIds =:= [] ->
            <<>>;
        true ->
            DelMonMsg = #bcast_del_mon{mon_ids = DelMonIds},
            element(2, prot_msg:encode_msg(90235, DelMonMsg))
    end,

    % 人物aoi
    AddRoleBin = case lib_scene_agent:get_all_area(AreaAdd) of
        [] ->
            <<>>;
        AddRoleL ->
            [
                lib_role_send:send_to_sid(Sid, AddBinData)
                || #scene_role{sid = Sid} <- AddRoleL, is_pid(Sid)
            ],
            AddRoleLT = [R || R <- AddRoleL, maps:get(id, R#scene_role.owner, 0) =/= RoleId],
            RoleSceneInfoL = data_transfer:sc_role_scene_info_list(AddRoleLT),
            AddRoleMsg = #bcast_add_role_scene_info{role_list = RoleSceneInfoL},
            element(2, prot_msg:encode_msg(90232, AddRoleMsg))
    end,
    DelRoleBin = case lib_scene_agent:get_all_area(AreaRemove) of
        [] ->
            <<>>;
        DelRoleL ->
            [
                lib_role_send:send_to_sid(Sid, RemoveBinData)
                || #scene_role{sid = Sid} <- DelRoleL, is_pid(Sid)
            ],
            DelRoleIds = [
                RId || #scene_role{id = RId, owner = Owner} <- DelRoleL,
                       maps:get(id, Owner, 0) =/= RoleId
            ],
            DelRoleMsg = #bcast_del_role{role_ids = DelRoleIds},
            element(2, prot_msg:encode_msg(90233, DelRoleMsg))
    end,

    % 宠物aoi
    AddPetBin = case lib_pet_agent:get_all_area(AreaAdd) of
        [] ->
            <<>>;
        AddPetL ->
            PetSceneInfoL = data_transfer:sc_pet_scene_info_list(AddPetL),
            AddPetMsg = #bcast_add_pet_scene_info{pet_list = PetSceneInfoL},
            element(2, prot_msg:encode_msg(90236, AddPetMsg))
    end,
    DelPetBin = case lib_pet_agent:get_all_area_id_except(AreaRemove, RoleId) of
        [] ->
            <<>>;
        DelPetIds ->
            DelPetMsg = #bcast_del_pet{pet_ids = DelPetIds},
            element(2, prot_msg:encode_msg(90237, DelPetMsg))
    end,

    % 采集物aoi
    AddCollBin = case lib_coll_agent:get_all_area(AreaAdd) of
        [] ->
            <<>>;
        AddCollL ->
            CollSceneInfoL = data_transfer:sc_coll_scene_info_list(AddCollL),
            AddCollMsg = #bcast_add_coll_scene_info{coll_list = CollSceneInfoL},
            element(2, prot_msg:encode_msg(90239, AddCollMsg))
    end,
    DelCollBin = case lib_coll_agent:get_all_area_id(AreaRemove) of
        [] ->
            <<>>;
        DelCollIds ->
            DelCollMsg = #bcast_del_coll{coll_ids = DelCollIds},
            element(2, prot_msg:encode_msg(90240, DelCollMsg))
    end,

    % 镖车aoi
    AddCarryBin = case lib_carry_agent:get_all_area(AreaAdd) of
        [] ->
            <<>>;
        AddCarryL ->
            CarrySceneInfoL = data_transfer:sc_carry_scene_info_list(AddCarryL),
            AddCarryMsg = #bcast_add_carry_scene_info{carry_list = CarrySceneInfoL},
            element(2, prot_msg:encode_msg(90253, AddCarryMsg))
    end,
    DelCarryBin = case lib_carry_agent:get_all_area_id(AreaRemove) of
        [] ->
            <<>>;
        DelCarryIds ->
            DelCarryMsg = #bcast_del_carry{carry_ids = DelCarryIds},
            element(2, prot_msg:encode_msg(90254, DelCarryMsg))
    end,

    % 飞行道具aoi
    AddFlyitemBin = case lib_flyitem_agent:get_all_area(AreaAdd) of
        [] ->
            <<>>;
        AddFlyitemL ->
            FlyitemSceneInfoL = data_transfer:sc_flyitem_scene_info_list(AddFlyitemL),
            AddFlyitemMsg = #bcast_add_flyitem_scene_info{flyitem_list = FlyitemSceneInfoL},
            element(2, prot_msg:encode_msg(90257, AddFlyitemMsg))
    end,
    DelFlyitemBin = case lib_flyitem_agent:get_all_area_id(AreaRemove) of
        [] ->
            <<>>;
        DelFlyitemIds ->
            DelFlyitemMsg = #bcast_del_flyitem{flyitem_ids = DelFlyitemIds},
            element(2, prot_msg:encode_msg(90258, DelFlyitemMsg))
    end,

    Binary = <<
        DelRoleBin/binary, DelMonBin/binary, DelPetBin/binary, DelCollBin/binary,
        AddRoleBin/binary, AddMonBin/binary, AddPetBin/binary, AddCollBin/binary,
        DelCarryBin/binary, DelFlyitemBin/binary,
        AddCarryBin/binary, AddFlyitemBin/binary
    >>,
    lib_role_send:send_to_sid(RoleSid, Binary);
role_move_broadcast(X1, Y1, X2, Y2, RemoveBinData, AddBinData, _RoleId, _RoleSid, OwnerSid) ->
    {AreaRemove, AreaAdd} = get_sync_area(X1, Y1, X2, Y2),
    AddRoleL = lib_scene_agent:get_all_area(AreaAdd),
    [
        lib_role_send:send_to_sid(Sid, AddBinData)
        || #scene_role{sid = Sid} <- AddRoleL, is_pid(Sid), Sid =/= OwnerSid
    ],
    DelRoleL = lib_scene_agent:get_all_area(AreaRemove),
    [
        lib_role_send:send_to_sid(Sid, RemoveBinData)
        || #scene_role{sid = Sid} <- DelRoleL, is_pid(Sid), Sid =/= OwnerSid
    ].

%% 当宠物移动时候的广播
%% 终点要X1，Y1，原点是X2,Y2
%% RemoveBinData移除宠物包 AddBinData有宠物进入
pet_move_broadcast(X1, Y1, X2, Y2, RemoveBinData, AddBinData, OwnerSid) ->
    {AreaRemove, AreaAdd} = get_sync_area(X1, Y1, X2, Y2),
    lib_scene_agent:send_to_any_area_except(AreaRemove, RemoveBinData, OwnerSid),
    lib_scene_agent:send_to_any_area_except(AreaAdd, AddBinData, OwnerSid).

%% @doc 场景默认进入位置
get_default_enter_pos(SceneId) ->
    ConfScene = conf_scene:get(SceneId),
    #scene{x = X, y = Y} = ConfScene,
    {X, Y}.


%%击退怪物用
repel_user_broadcast(XY1, XY2, Mon) ->
    {AreaRemove, AreaAdd} = get_sync_area(XY1, XY2),
    % 告诉角色有怪物被移除
    {ok, RemoveMonBin} = prot_msg:encode_msg(90235, #bcast_del_mon{mon_ids = [Mon#mon.id]}),
    lib_scene_agent:send_to_any_area(AreaRemove, RemoveMonBin),

    % 告诉角色有怪物进入
    MonSceneInfo = data_transfer:sc_mon_scene_info(Mon),
    {ok, AddMonBin} = prot_msg:encode_msg(90234, #bcast_add_mon_scene_info{mon_list = [MonSceneInfo]}),
    lib_scene_agent:send_to_any_area(AreaAdd, AddMonBin).



%%% Privates ----------------------------------------------------
%% 计算移动需要同步消息的格子
% 同一个格子内移动
move_zone1(XY, XY) ->
    {[], []}.

% 向右移动
move_zone2(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_LU(ML), XY2 + ?MAP_LENGTH_L, XY2 + ?MAP_LENGTH_LD(ML)],
        [XY1 + ?MAP_LENGTH_RU(ML), XY1 + ?MAP_LENGTH_R, XY1 + ?MAP_LENGTH_RD(ML)]
    }.

% @doc 向左移动
move_zone3(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_RU(ML), XY2 + ?MAP_LENGTH_R, XY2 + ?MAP_LENGTH_RD(ML)],
        [XY1 + ?MAP_LENGTH_LU(ML), XY1 + ?MAP_LENGTH_L, XY1 + ?MAP_LENGTH_LD(ML)]
    }.

% 向上移动
move_zone4(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_LD(ML), XY2 + ?MAP_LENGTH_D(ML), XY2 + ?MAP_LENGTH_RD(ML)],
        [XY1 + ?MAP_LENGTH_LU(ML), XY1 + ?MAP_LENGTH_U(ML), XY1 + ?MAP_LENGTH_RU(ML)]
    }.

% 向下移动
move_zone5(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_LU(ML), XY2 + ?MAP_LENGTH_U(ML), XY2 + ?MAP_LENGTH_RU(ML)],
        [XY1 + ?MAP_LENGTH_LD(ML), XY1 + ?MAP_LENGTH_D(ML), XY1 + ?MAP_LENGTH_RD(ML)]
    }.

% 向左上移动
move_zone6(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_RU(ML), XY2 + ?MAP_LENGTH_R, XY2 + ?MAP_LENGTH_RD(ML), XY2 + ?MAP_LENGTH_D(ML), XY2 + ?MAP_LENGTH_LD(ML)],
        [XY1 + ?MAP_LENGTH_RU(ML), XY1 + ?MAP_LENGTH_U(ML), XY1 + ?MAP_LENGTH_LU(ML), XY1 + ?MAP_LENGTH_L, XY1 + ?MAP_LENGTH_LD(ML)]
    }.

% 向左下移动
move_zone7(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_LU(ML), XY2 + ?MAP_LENGTH_U(ML), XY2 + ?MAP_LENGTH_RU(ML), XY2 + ?MAP_LENGTH_R, XY2 + ?MAP_LENGTH_RD(ML)],
        [XY1 + ?MAP_LENGTH_LU(ML), XY1 + ?MAP_LENGTH_L, XY1 + ?MAP_LENGTH_LD(ML), XY1 + ?MAP_LENGTH_D(ML), XY1 + ?MAP_LENGTH_RD(ML)]
    }.

% 向右上移动
move_zone8(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_LU(ML), XY2 + ?MAP_LENGTH_L, XY2 + ?MAP_LENGTH_LD(ML), XY2 + ?MAP_LENGTH_D(ML), XY2 + ?MAP_LENGTH_RD(ML)],
        [XY1 + ?MAP_LENGTH_LU(ML), XY1 + ?MAP_LENGTH_U(ML), XY1 + ?MAP_LENGTH_RU(ML), XY1 + ?MAP_LENGTH_R, XY1 + ?MAP_LENGTH_RD(ML)]
    }.

% 向右下移动
move_zone9(ML, XY1, XY2) ->
    {
        [XY2 + ?MAP_LENGTH_RU(ML), XY2 + ?MAP_LENGTH_U(ML), XY2 + ?MAP_LENGTH_LU(ML), XY2 + ?MAP_LENGTH_L, XY2 + ?MAP_LENGTH_LD(ML)],
        [XY1 + ?MAP_LENGTH_RU(ML), XY1 + ?MAP_LENGTH_R, XY1 + ?MAP_LENGTH_RD(ML), XY1 + ?MAP_LENGTH_D(ML), XY1 + ?MAP_LENGTH_LD(ML)]
    }.

% 跨九宫格，旧九宫格全部移除，新九宫格全部添加
move_zone10(ML, XY1, XY2) ->
    AreaOld = [
        XY2 + ?MAP_LENGTH_LU(ML), XY2 + ?MAP_LENGTH_U(ML), XY2 + ?MAP_LENGTH_RU(ML),
        XY2 + ?MAP_LENGTH_L, XY2, XY2 + ?MAP_LENGTH_R,
        XY2 + ?MAP_LENGTH_LD(ML), XY2 + ?MAP_LENGTH_D(ML), XY2 + ?MAP_LENGTH_RD(ML)
    ],
    AreaNew = [
        XY1 + ?MAP_LENGTH_LU(ML), XY1 + ?MAP_LENGTH_U(ML), XY1 + ?MAP_LENGTH_RU(ML),
        XY1 + ?MAP_LENGTH_L, XY1, XY1 + ?MAP_LENGTH_R,
        XY1 + ?MAP_LENGTH_LD(ML), XY1 + ?MAP_LENGTH_D(ML), XY1 + ?MAP_LENGTH_RD(ML)
    ],
    depart_area(AreaOld, AreaNew).


%使用之前请确保List1 and list2是sorted
depart_area(List1, List2) ->
    depart_area(List1, List2, [], []).

depart_area([], List2, List1Res, List2Res) ->
    {List1Res, List2 ++ List2Res};
depart_area(List1, [], List1Res, List2Res) ->
    {List1 ++ List1Res, List2Res};
depart_area([A | List1], [B | List2], List1Res, List2Res) ->
    if
        A == B ->
            depart_area(List1, List2, List1Res, List2Res);
        A < B ->
            depart_area(List1, [B | List2], [A | List1Res], List2Res);
        true ->
            depart_area([A | List1], List2, List1Res, [B | List2Res])
    end.

get_sync_area(X1, Y1, X2, Y2) ->
    XY1 = get_xy(X1, Y1),                   %% 终点位置
    XY2 = get_xy(X2, Y2),                   %% 起点位置
    get_sync_area(XY1, XY2).

get_sync_area(XY1, XY2) ->
    ML = ?MAP_LENGTH,
    {AreaRemove, AreaAdd} = if
        XY2 == XY1 ->                       %% 同一个格子内移动
            move_zone1(XY1, XY2);
        XY2 + ?MAP_LENGTH_R == XY1 ->       %% 向右移动
            move_zone2(ML, XY1, XY2);
        XY2 + ?MAP_LENGTH_L == XY1 ->       %% 向左移动
            move_zone3(ML, XY1, XY2);
        XY2 + ?MAP_LENGTH_U(ML) == XY1 ->   %% 向上移动
            move_zone4(ML, XY1, XY2);
        XY2 + ?MAP_LENGTH_D(ML) == XY1 ->   %% 向下移动
            move_zone5(ML, XY1, XY2);
        XY2 + ?MAP_LENGTH_LU(ML) == XY1 ->  %% 向左上移动
            move_zone6(ML, XY1, XY2);
        XY2 + ?MAP_LENGTH_LD(ML) == XY1 ->  %% 向左下移动
            move_zone7(ML, XY1, XY2);
        XY2 + ?MAP_LENGTH_RU(ML) == XY1 ->  %% 向右上移动
            move_zone8(ML, XY1, XY2);
        XY2 + ?MAP_LENGTH_RD(ML) == XY1 ->  %% 向右下移动
            move_zone9(ML, XY1, XY2);
        true ->                             %% 跨九宫格移动
            move_zone10(ML, XY1, XY2)
    end,
    {AreaRemove, AreaAdd}.
