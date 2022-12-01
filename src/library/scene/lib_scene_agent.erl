%%-------------------------------------------------------
%% @File     : lib_scene_agent.erl
%% @Brief    : 场景进程逻辑实现 - 由场景进程调用
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%-------------------------------------------------------
%% 此模块提供的所有接口均为场景进程内部逻辑

-module(lib_scene_agent).

-include("log.hrl").
-include("skill.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("role.hrl").

%% Apis for commands
-export([
    push_cmd/1,
    get_cmd_queue/0,
    put_cmd_queue/1,
    get_time_list/0,
    put_time_list/1,
    push_time_list/1
]).

%% Apis for scene tools
-export([
    get_pet_map/0,
    put_pet_map/1,
    get_role_pet_ids/1,
    get_carry_map/0,
    put_carry_map/1,
    get_role_carry_id/1,
    gen_robot_id/0,

    is_bcast_mon/0,
    is_bcast_scene/0,
    is_monopoly_scene/0,
    is_can_fight/0,
    get_revive_type/0,
    get_revive_param/0,
    is_add_murderous/0,
    is_add_rival/0,
    is_jump_path/1,

    reinit_scene/1,
    dictionary_init/1,
    start_scene_timers/1,

    get_harm_map/0,
    put_harm_map/1,
    get_cure_map/0,
    put_cure_map/1,

    send_to_any_area/2,
    send_to_any_area_except/3,
    send_to_scene_role/2,
    send_to_local_scene/1,
    send_to_local_scene_later/2,
    send_to_local_area_scene/3,
    send_to_local_area_scene_except/4,
    send_to_scene_except/2,

    filte_area_roler/4,
    get_line_roler_for_battle/6,
    get_sector_roler_for_battle/6,
    get_circle_roler_for_battle/3,
    get_first_att/1
]).


%% apis for scene role access
-export([
    get_roler/1,
    put_roler/1,
    del_roler/1,
    get_role_pos/1,
    is_team_near/4,
    is_target_near/4,
    is_role_in_scene/1,

    get_scene_roler/0,
    get_scene_roler_ids/0,
    get_scene_roler_num/0,
    get_scene_roler_field/1,
    get_scene_roler_fields/1,
    get_scene_roler_dist/3,
    get_scene_roler_ids_dist/3,
    get_scene_roler_field_dist/4,
    get_scene_roler_fields_dist/4,
    get_scene_roler_field_area/3,
    get_scene_roler_fields_area/3,
    get_all_area/1,
    get_all_area_roler_ids/1,

    get_role_pid/1,
    get_role_header/1,
    update_field_notify/3,
    update_scene_roler_field/2,
    update_scene_roler_fields/2,
    update_scene_all_roler_fields/1
]).


%% Apis -------------------------------------------------
% @doc 压入命令
push_cmd(Cmd) ->
    CmdQueue = get_cmd_queue(),
    put_cmd_queue([Cmd | CmdQueue]).

% @doc 取出待处理消息队列
get_cmd_queue() ->
    get(cmd_queue).

% @doc 存入待处理消息队列
put_cmd_queue(MsgQueue) ->
    put(cmd_queue, MsgQueue).

% @doc 取出待处理时间序列
get_time_list() ->
    get(time_list).

% @doc 存入待处理时间序列
put_time_list(TimeList) ->
    put(time_list, TimeList).

% @doc 压入待处理时间序列
push_time_list(Cmd) ->
    TimeList = get_time_list(),
    put(time_list, [Cmd | TimeList]).


%% Apis -------------------------------------------------
% @doc 取出角色宠物列表map
get_pet_map() ->
    get(role_pet_map).

% @doc 取出指定角色宠物列表
get_role_pet_ids(RoleId) ->
    RolePetMap = get_pet_map(),
    maps:get(RoleId, RolePetMap, []).

% @doc 存入角色宠物列表map
put_pet_map(RolePetMap) ->
    put(role_pet_map, RolePetMap).

% @doc 取出角色镖车map
get_carry_map() ->
    get(role_carry_map).

% @doc 存入角色镖车map
put_carry_map(RoleCarryMap) ->
    put(role_carry_map, RoleCarryMap).

% @doc 取出指定角色镖车id
get_role_carry_id(RoleId) ->
    RoleCarryMap = get_carry_map(),
    maps:get(RoleId, RoleCarryMap, 0).

% @doc 取出指定角色镖车id
gen_robot_id() ->
    RobotId = get({robot, auto_id}),
    put({robot, auto_id}, RobotId + 1).

% @doc 怪物出生是否广播
% @spec is_bcast_mon() -> boolean().
is_bcast_mon() ->
    get(is_bcast_mon).

% @doc 是否需要场景广播
is_bcast_scene() ->
    get(is_bcast_scene).

% @doc 是否独占场景
is_monopoly_scene() ->
    SceneType = ?SCENE_TYPE,
    lists:member(SceneType, ?MONOPOLY_SCENE_TYPES).

% @spec is_can_fight() -> boolean().
is_can_fight() ->
    get(is_can_fight).

% @doc 获取场景复活类型
% @spec get_revive_type() -> integer().
get_revive_type() ->
    get(revive_type).

% @doc 获取场景复活参数
% @spec get_revive_param() -> [].
get_revive_param() ->
    get(revive_param).

% @doc 是否增加杀气
% @spec is_add_murderous() -> boolean().
is_add_murderous() ->
    MurderousType = get(murderous_type),
    bit_map:is_set(?MURDEROUS_BIT_IS_ADD, MurderousType).

% @doc 是否增加进入反击
% @spec is_add_rival() -> boolean().
is_add_rival() ->
    MurderousType = get(murderous_type),
    bit_map:is_set(?MURDEROUS_BIT_IS_RIVAL, MurderousType).

% @doc 是否增加进入反击
% @spec is_jump_path(JumpPath) -> boolean().
% JumpPath      :: {From, To}
% From = To     :: {X, Y}
% X = Y         :: integer()
is_jump_path(JumpPath) ->
    case conf_scene:get(?SCENE_ID) of
        #scene{jump = JumpPathL} -> lists:member(JumpPath, JumpPathL);
        _ -> false
    end.

% @doc 重新初始化场景(清理场景后)
reinit_scene(Scene) ->
    erase(),
    cancel_timers(Scene),
    dictionary_init(Scene),
    ok.

%% @doc 进程字典初始化
dictionary_init(#scene{} = Scene) ->
    #scene{
        id = SceneId, type = SceneType,
        width = Width, line = LineId,
        murderous_type = MurderousType
    } = Scene,
    % 场景基础数据
    put(scene_id, SceneId),                     % 场景id
    put(line_id, LineId),                       % 分线id
    put(scene_type, SceneType),                 % 场景类型
    put(map_length, ceil(Width / ?MAP_GRID)),   % 广播宽度
    MgrPid = get_mgr_pid(SceneType),
    put(mgr_pid, MgrPid),                       % 场景管理进程id

    % id相关
    put(mon_ids, #{}),                          % 怪物id map
    put(pet_ids, #{}),                          % 宠物id map
    put(coll_ids, #{}),                         % 采集物id map
    put(carry_ids, #{}),                        % 镖车id map
    put(flyitem_ids, #{}),                      % 飞行道具id map
    put(role_ids, #{}),                         % 角色id map
    put({robot, auto_id}, ?MIN_ROBOT_ID),       % 机器人自增id
    put({mon, auto_id}, ?MIN_MON_ID),           % 怪物自增id
    put({pet, auto_id}, ?MIN_PET_ID),           % 宠物自增id
    put({coll, auto_id}, ?MIN_COLL_ID),         % 采集物自增id
    put({carry, auto_id}, ?MIN_CARRY_ID),       % 镖车自增id
    put({flyitem, auto_id}, ?MIN_FLYITEM_ID),   % 飞行道具自增id
    put({effect, auto_id}, 1),                  % 效果

    put(role_pet_map, #{}),                     % 玩家宠物map(离开场景同步删除)
    put(role_carry_map, #{}),                   % 玩家镖车map

    {IsBCastMon, IsBroadcast, ReviveType, ReviveParam, ReviveRecover} =
        conf_scene:get_extra_conf(SceneId),
    put(is_bcast_mon, IsBCastMon =:= 1),        % 怪物出生是否广播(九宫格)
    put(is_bcast_scene, IsBroadcast =:= 1),     % 是否全场景广播
    put(revive_type, ReviveType),               % 复活类型
    put(revive_param, ReviveParam),             % 复活参数
    IsCanFight = not lists:member(SceneType, ?SAFE_SCENE_TYPES),
    put(is_can_fight, IsCanFight),              % 是否可对战
    put(revive_recover, ReviveRecover),         % 复活回复万分比
    put(murderous_type, MurderousType),         % 场景杀气类型
    put(harm_map, #{}),                         % 伤害map
    put(cure_map, #{}),                         % 治疗map
    put(team, #{}),                             % 队伍

    put_time_list([]),                          % 时间序列命令列表 (处理多段伤害，延时伤害)
    put_cmd_queue([]),                          % 消息列表

    % 特殊场景进程字典初始化逻辑
    ok.

%% @doc 启动场景定时器
start_scene_timers(#scene{} = Scene) ->
    NowTimeMS = time:unixtime_ms(),
    CmdRef = erlang:send_after(?CMDS_INTERVAL, self(), {'handle_cmds', NowTimeMS}),
    UpdateRef = erlang:send_after(?UPDATE_INTERVAL, self(), {'handle_update', NowTimeMS}),

    % 加载怪物
    Scene#scene.mon =/= [] andalso erlang:send_after(5000, self(), 'load_mons'),
    % 加载采集物
    Scene#scene.coll =/= [] andalso erlang:send_after(5000, self(), 'load_colls'),
    Scene#scene{
        last_cmd_time = NowTimeMS,
        cmd_timer_ref = CmdRef,
        last_update_time = NowTimeMS,
        update_timer_ref = UpdateRef
    }.

% @doc 取场景输出map
get_harm_map() ->
    get(harm_map).

% @doc 存场景输出map
put_harm_map(Map) ->
    put(harm_map, Map).

% @doc 取场景回复map
get_cure_map() ->
    get(cure_map).

% @doc 存场景回复map
put_cure_map(Map) ->
    put(cure_map, Map).

% @doc 获取角色pid(失败返回id)
get_role_pid(RoleId) ->
    case get_roler(RoleId) of
        #scene_role{pid = Pid} -> Pid;
        _ -> RoleId
    end.

%% @doc 获取玩家Header
get_role_header(RoleId) ->
    case get_roler(RoleId) of
        #scene_role{header = Header} -> Header;
        _ -> 0
    end.

% @doc 获取场景所有角色数据
get_scene_roler() ->
    AllRoler = get(),
    [Roler || {_Key, Roler} <- AllRoler, is_record(Roler, scene_role)].

% @doc 获取场景角色Id列表
% @spec get_scene_roler_ids() -> [RoleId].
get_scene_roler_ids() ->
    get_ids().

% @doc 获取场景角色数量
get_scene_roler_num() ->
    RoleIdsMap = get(role_ids),
    maps:size(RoleIdsMap).

% @doc 获取场景玩家数据字段值
get_scene_roler_field(Field) ->
    AllRoler = get_scene_roler(),
    [element(Field, Roler) || Roler <- AllRoler].

% @doc 获取场景玩家数据字段值(多个字段)
% @spec get_scene_roler_fields(Fields) -> [ValueOfFields].
% Fields = ValueOfFields   :: list()
% Field and ValueOfFields has same length
get_scene_roler_fields(Fields) ->
    AllRoler = get_scene_roler(),
    TransFun = fun(Data) -> [element(Field, Data) || Field <- Fields] end,
    [TransFun(Roler) || Roler <- AllRoler].

% @doc 选择一定范围(以{X,Y}为中心,距离不超过Dist)的角色Id列表
% @spec get_scene_roler_ids_dist(X, Y, Dist) -> [RoleId].
% X = Y = Dist = RoleId     :: integer()
get_scene_roler_ids_dist(X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllRoler = get_all_area(AllArea),
    X1 = X + Dist,
    X2 = X - Dist,
    Y1 = Y + Dist,
    Y2 = Y - Dist,
    [
        RoleId
        || #scene_role{id = RoleId, x = RX, y = RY} <- AllRoler,
        RX >= X2 andalso RX =< X1, RY >= Y2 andalso RY =< Y1
    ].

%% @doc 玩家是否在场景内
is_role_in_scene(RoleId) ->
    get_roler(RoleId) =/= [].

% @doc 获取一定范围内角色数据
% @spec get_scene_roler_dist(X, Y, Dist) -> [SceneRoler].
% X = Y = Dist      :: integer()
% SceneRoler        :: #scene_role{}
get_scene_roler_dist(X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllRoler = get_all_area(AllArea),
    X1 = X + Dist,
    X2 = X - Dist,
    Y1 = Y + Dist,
    Y2 = Y - Dist,
    [Roler || #scene_role{x = RX, y = RY} = Roler <- AllRoler, RX >= X2 andalso RX =< X1, RY >= Y2 andalso RY =< Y1].

% @doc 获取一定范围内角色数据字段值
% @spec get_scene_roler_field_dist(Field, X, Y, Dist) -> [FieldValue].
% Field = X = Y = Dist      :: integer()
% FieldValue                :: term()
get_scene_roler_field_dist(Field, X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllRoler = get_all_area(AllArea),
    X1 = X + Dist,
    X2 = X - Dist,
    Y1 = Y + Dist,
    Y2 = Y - Dist,
    [element(Field, Roler) || #scene_role{x = RX, y = RY} = Roler <- AllRoler, RX >= X2 andalso RX =< X1, RY >= Y2 andalso RY =< Y1].

% @doc 获取距离{X,Y} Dist范围内角色数据字段值(多个字段)
% @spec get_scene_roler_fields_dist(Fields, X, Y, Dist) -> [[FieldValue]].
% Fields                    :: [Field]
% Field = X = Y = Dist      :: integer()
% FieldValue                :: term()
get_scene_roler_fields_dist(Fields, X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllRoler = get_all_area(AllArea),
    TransFun = fun(Data) -> [element(Field, Data) || Field <- Fields] end,
    X1 = X + Dist,
    X2 = X - Dist,
    Y1 = Y + Dist,
    Y2 = Y - Dist,
    [TransFun(Roler) || #scene_role{x = RX, y = RY} = Roler <- AllRoler, RX >= X2 andalso RX =< X1, RY >= Y2 andalso RY =< Y1].

% @doc 获取XY九宫格范围内玩家某字段
get_scene_roler_field_area(Field, X, Y) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllRoler = get_all_area(AllArea),
    [element(Field, Roler) || Roler <- AllRoler].

% @doc 获取XY九宫格范围内玩家某些字段
get_scene_roler_fields_area(Fields, X, Y) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllRoler = get_all_area(AllArea),
    TransFun = fun(Data) -> [element(Field, Data) || Field <- Fields] end,
    [TransFun(Roler) || Roler <- AllRoler].

% @doc 获取g宫格子角色信息
get_all_area(Area) ->
    RoleIds = get_all_area_roler_ids(Area),
    get_scene_roler_helper(RoleIds, []).

% @doc 获取一定范围内角色的id
% @spec get_all_area_roler_ids(Area) -> [RoleId].
% Area              :: [{X, Y}]
% RoleId = X = Y    :: integer()
get_all_area_roler_ids(Area) ->
    Fun = fun(XY, L) -> lib_scene_map:get_xy_objs(?BATTLE_ROLE, XY) ++ L end,
    lists:foldl(Fun, [], Area).

% @doc 更新#scene_role{}字段
% @spec update_scene_roler_field(RoleId, {K, V}) -> skip.
% RoleId        :: integer()
% K             :: integer() | #scene_role.Field
% V             :: term()
update_scene_roler_field(RoleId, {K, V}) ->
    case get_roler(RoleId) of
        #scene_role{} = Roler ->
            NewRoler = setelement(K, Roler, V),
            put_roler(NewRoler);
        _ ->
            ignore
    end.

% @doc 更新#scene_role{}字段(多个字段)
update_scene_roler_fields(RoleId, AttrList) ->
    update_field_notify(RoleId, AttrList, <<>>).

update_field_notify(RoleId, AttrList, Bin) ->
    case get_roler(RoleId) of
        #scene_role{x = X, y = Y} = Roler ->
            NewRoler = update_roler_fields_helper(AttrList, Roler),
            put_roler(NewRoler),
            Bin =/= <<>> andalso send_to_local_area_scene(X, Y, Bin),
            ok;
        _ ->
            ignore
    end.

%% @doc 更新场景所有玩家的#scene_role{}字段(多个字段)
update_scene_all_roler_fields(AttrList) ->
    RoleIDs = get_scene_roler_ids(),
    lists:foreach(fun(RoleID) ->
        update_scene_roler_fields(RoleID, AttrList)
    end, RoleIDs).

% @doc 发送消息给部分区域
send_to_any_area(_Area, <<>>) ->
    ok;
send_to_any_area(Area, Bin) ->
    F1 = fun(RoleId, XY) ->
        case get(RoleId) of
            #scene_role{sid = SId} ->
                lib_role_send:send_to_sid(SId, Bin);
            _ ->
                del_id(RoleId),
                lib_scene_map:pop_from_xy(?BATTLE_ROLE, XY, RoleId)
        end
    end,
    F2 = fun(XY) ->
        RoleIds = lib_scene_map:get_xy_objs(?BATTLE_ROLE, XY),
        [F1(RoleId, XY) || RoleId <- RoleIds]
    end,
    [F2(XY) || XY <- Area],
    ok.

% @doc 发送消息给部分区域
send_to_any_area_except(_Area, <<>>, _ExceptSid) ->
    ok;
send_to_any_area_except(Area, Bin, ExceptSid) ->
    F1 = if
        is_list(ExceptSid) ->
            fun(RoleId, XY) ->
                case get(RoleId) of
                    #scene_role{sid = Sid} ->
                        lists:member(RoleId, ExceptSid) orelse lib_role_send:send_to_sid(Sid, Bin);
                    _ ->
                        del_id(RoleId),
                        lib_scene_map:pop_from_xy(?BATTLE_ROLE, XY, RoleId)
                end
            end;
        true ->
            fun(RoleId, XY) ->
                case get(RoleId) of
                    #scene_role{sid = Sid} ->
                        Sid =/= ExceptSid andalso lib_role_send:send_to_sid(Sid, Bin);
                    _ ->
                        del_id(RoleId),
                        lib_scene_map:pop_from_xy(?BATTLE_ROLE, XY, RoleId)
                end
            end
    end,
    F2 = fun(XY) ->
        RoleIds = lib_scene_map:get_xy_objs(?BATTLE_ROLE, XY),
        [F1(RoleId, XY) || RoleId <- RoleIds]
    end,
    [F2(XY) || XY <- Area],
    ok.

%% 发送消息到目标
send_to_scene_role(_Keys, <<>>) ->
    ok;
send_to_scene_role(RoleIds, Bin) ->
    [do_send_by_id(RoleId, Bin) || RoleId <- RoleIds],
    ok.

% @doc 给场景角色发信息
send_to_local_scene(Bin) ->
    RoleIds = get_ids(),
    [do_send_by_id(RoleId, Bin) || RoleId <- RoleIds],
    ok.

% @doc 延时给场景角色发(发送给调用函数这一刻在此场景的玩家？)
send_to_local_scene_later(Bin, MilliSec) ->
    F = fun(RoleId, _, AccList) ->
        case get_roler(RoleId) of
            #scene_role{sid = Sid} ->
                [Sid | AccList];
            _ ->
                del_id(RoleId),
                AccList
        end
    end,
    RoleIdsMap = get(role_ids),
    SendInfoList = maps:fold(F, [], RoleIdsMap),
    spawn(fun() ->
        timer:sleep(MilliSec),
        [lib_role_send:send_to_sid(Sid, Bin) || Sid <- SendInfoList]
    end).

% @doc 给区域角色发信息
send_to_local_area_scene(X, Y, Bin) ->
    Area = lib_scene_map:get_the_area(X, Y),
    send_to_any_area(Area, Bin).

% @doc 给区域角色发信息
send_to_local_area_scene_except(X, Y, Bin, ExceptSid) ->
    Area = lib_scene_map:get_the_area(X, Y),
    send_to_any_area_except(Area, Bin, ExceptSid).

% @doc 给场景角色发信息
send_to_scene_except(Bin, List) ->
    [do_send_by_id(Id, Bin) || Id <- get_ids(), not lists:member(Id, List)],
    ok.

% @doc 保存角色数据
put_roler(Roler) ->
    #scene_role{id = RoleId, x = RX, y = RY} = Roler,
    case get_roler(RoleId) of
        #scene_role{x = OldX, y = OldY} ->
            put(RoleId, Roler),
            NewXY = lib_scene_map:get_xy(RX, RY),
            OldXY = lib_scene_map:get_xy(OldX, OldY),
            if
                NewXY =:= OldXY ->
                    skip;
                true ->
                    lib_scene_map:pop_from_xy(?BATTLE_ROLE, OldXY, RoleId),
                    lib_scene_map:push_into_xy(?BATTLE_ROLE, NewXY, RoleId)
            end;
        _ ->
            put_id(RoleId),
            put(RoleId, Roler),
            XY = lib_scene_map:get_xy(RX, RY),
            lib_scene_map:push_into_xy(?BATTLE_ROLE, XY, RoleId)
    end.

%% 获取角色数据
get_roler(RoleId) ->
    case get(RoleId) of
        #scene_role{} = Roler -> Roler;
        _ -> []
    end.

%% 删除角色数据
del_roler(RoleId) ->
    case erase(RoleId) of
        #scene_role{x = X, y = Y} ->
            del_id(RoleId),
            XY = lib_scene_map:get_xy(X, Y),
            lib_scene_map:pop_from_xy(?BATTLE_ROLE, XY, RoleId);
        _ ->
            []
    end.

% @doc 获取玩家位置
get_role_pos(RoleId) ->
    case get_roler(RoleId) of
        #scene_role{x = X, y = Y} -> {X, Y};
        _ -> {0, 0}
    end.

% @doc 选择范围内的角色
filte_area_roler(AllRoler, X, Y, Area) ->
    %% 加1和乘以1.5都是为了和怪物攻击距离保持一致
    X1 = X + Area + 1,
    X2 = X - Area - 1,
    Y1 = Y + Area * 1.5 + 1,
    Y2 = Y - Area * 1.5 - 1,
    [Roler || Roler <- AllRoler,
        Roler#scene_role.x >= X2 andalso Roler#scene_role.x =< X1,
        Roler#scene_role.y >= Y2 andalso Roler#scene_role.y =< Y1].


% @doc 直线型选择目标人物
get_line_roler_for_battle(OX, OY, X, Y, Width, Dist) ->
    SelectArgs = [OX, OY, X, Y, Width, Dist],
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllRole = get_all_area(AllArea),
    [
        Role
        || Role <- AllRole,
        Role#scene_role.hp > 0,
        not bit_map:is_set(?SPEC_STAT_BIT_HANGING, Role#scene_role.stat),
        lib_battle_aid:get_line_for_battle(Role#scene_role.x, Role#scene_role.y, SelectArgs)
    ].

% @doc 扇形选择人物
get_sector_roler_for_battle(Cx, Cy, Dist, Ux, Uy, Angle) ->
    Vx = Ux - Cx,
    Vy = Uy - Cy,
    Cos = util:angle_to_float(Angle / 2),
    SelectArgs = [Cx, Cy, Dist, Vx, Vy, Cos],
    AllArea = lib_scene_map:get_the_area(Cx, Cy),
    AllRole = get_all_area(AllArea),
    [
        Role
        || Role <- AllRole,
        Role#scene_role.hp > 0,
        not bit_map:is_set(?SPEC_STAT_BIT_HANGING, Role#scene_role.stat),
        lib_battle_aid:get_sector_for_battle(Role#scene_role.x, Role#scene_role.y, SelectArgs)
    ].

% @doc 圆形选择人物
get_circle_roler_for_battle(Cx, Cy, Dist) ->
    AllArea = lib_scene_map:get_the_area(Cx, Cy),
    AllRole = get_all_area(AllArea),
    DistSqr = lib_battle_aid:square(Dist),
    SelectArgs = [Cx, Cy, DistSqr],
    [
        Role
        || Role <- AllRole,
        Role#scene_role.hp > 0,
        not bit_map:is_set(?SPEC_STAT_BIT_HANGING, Role#scene_role.stat),
        lib_battle_aid:get_circle_for_battle(Role#scene_role.x, Role#scene_role.y, SelectArgs)
    ].


%% Privates --------------------------------------------------------------
get_scene_roler_helper([], Data) ->
    Data;
get_scene_roler_helper([RoleId | T], Data) ->
    case get(RoleId) of
        #scene_role{stat = Stat} = Roler ->
            case bit_map:is_set(?SPEC_STAT_BIT_HANGING, Stat) of
                false -> get_scene_roler_helper(T, [Roler | Data]);
                true -> Data
            end;
        undefined ->
            del_id(RoleId),
            get_scene_roler_helper(T, Data)
    end.

update_roler_fields_helper([{K, V} | Rest], Roler) ->
    update_roler_fields_helper(Rest, setelement(K, Roler, V));
update_roler_fields_helper([], Roler) ->
    Roler.

%% 获取id
get_ids() ->
    RoleIdsMap = get(role_ids),
    maps:keys(RoleIdsMap).

%% 保存id
put_id(RoleId) ->
    RoleIdsMap = get(role_ids),
    put(role_ids, RoleIdsMap#{RoleId => 0}).

%% 删除id
del_id(RoleId) ->
    RoleIdsMap = get(role_ids),
    put(role_ids, maps:remove(RoleId, RoleIdsMap)).

%% 通过角色id发送协议
do_send_by_id(RoleId, Bin) ->
    case get_roler(RoleId) of
        #scene_role{sid = Sid} when is_pid(Sid) ->
            lib_role_send:send_to_sid(Sid, Bin);
        #scene_role{} ->
            % 机器人
            % OwnerSid = maps:get(sid, Owner, undefined),
            % is_pid(OwnerSid) andalso lib_role_send:send_to_sid(OwnerSid, Bin);
            todo;
        _ ->
            del_id(RoleId)
    end,
    ok.

%% 取消定时器
cancel_timers(#scene{cmd_timer_ref = CmdRef, update_timer_ref = UpdateRef}) ->
    util:cancel_timer(CmdRef),
    util:cancel_timer(UpdateRef).

get_mgr_pid(SceneType) when SceneType < ?SCENE_CLUSTER_BOUNDARY ->
    whereis(svr_scene_mgr);
get_mgr_pid(_SceneType) ->
    lib_kf:call_to_center(erlang, whereis, [svr_cluster_scene_mgr]).

%% -----------------------------------------------------------------------------

%% 是否全部队员在到齐
is_team_near(Member, X, Y, Dist) ->
    lists:all(fun(RoleID) ->
        case get_roler(RoleID) of
            #scene_role{x = RX, y = RY} ->
                lib_battle_chk:check_distance({RX, RY}, {X, Y}, Dist);
            _ ->
                false
        end
    end, Member).

%% 对方是否在自己dist范围内
is_target_near(TargetID, X, Y, Dist) ->
    case get_roler(TargetID) of
        #scene_role{x = TX, y = TY} ->
            lib_battle_chk:check_distance({TX, TY}, {X, Y}, Dist);
        _ ->
            false
    end.

%% 获得首次攻击改怪物的玩家ID
get_first_att(#mon{functional_data = FData}) ->
    get_first_att(FData);
get_first_att(FData) ->
    maps:get(first_att, FData, 0).
