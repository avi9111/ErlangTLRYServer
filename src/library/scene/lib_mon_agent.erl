%%-------------------------------------------------------
%% @File     : lib_mon_agent.erl
%% @Brief    : 怪物场景管理器
%% @Author   : cablsbs
%% @Date     : 2018-7-2
%%-------------------------------------------------------
-module(lib_mon_agent).

-include("log.hrl").
-include("battle.hrl").
-include("scene_objs.hrl").
-include("proto/prot_902.hrl").

-export([
    get_ids/0,                      % 获取怪物Id列表
    get_mon/1,                      % 获取怪物
    put_mon/1,                      % 保存怪物数据
    del_mon/1,                      % 删除怪物数据
    update_mon/2,                   % 更新怪物数据

    get_scene_mon/0,                % 获取场景所有怪物
    get_scene_mon_pos/3,            % 获取场景所有怪物
    get_scene_mon_num/0,            % 获取场景内的怪物数量
    get_scene_mon_num_by_mids/1,    % 获取场景内某mid的怪物数量
    get_scene_mons_by_mid/2,        % 获取怪物列表(根据mid)
    count_alive_mon_by_mid/1,       % 获取存活怪物数量(根据mid)
    get_scene_mons_by_ids/1,        % 获取怪物列表(根据id列表)
    get_scene_mons_by_area/3,       % 获取某范围内怪物列表(根据xy,距离)
    get_scene_owner_mon_ids/1,      % 获取场景内所有归属于某玩家的怪物唯一Id
    get_scene_mon_fields/1,         % 获得怪物字段

    get_all_area_id/1,              % 获取九宫格子怪物id
    get_all_area/1,                 % 获取九宫格子怪物信息

    create_mon/2,                   % 创建怪物
    clear_scene_mon/1,              % 清除场景怪物
    clear_scene_mon_by_ids/2,       % 清除场景怪物(根据id)
    clear_scene_mon_by_mids/2,      % 清除场景怪物(根据mid)
    load_mons_by_group/1,           % 按组加载怪物
    load_mons_by_group/2,           % 按组加载怪物(带参)

    is_mon_in_scene/1               % 怪物是否在场景内
]).

%% 战斗使用
-export([
    get_line_mon_for_battle/6,      % 选取直线形怪物
    get_sector_mon_for_battle/6,    % 选取扇形怪物
    get_circle_mon_for_battle/3     % 选取圆形怪物
]).


%% Apis -------------------------------------------------
% @doc 获取当前场景的所有怪物id
% @spec get_ids() -> MonIds.
% MonIds    :: [integer()]
get_ids() ->
    MonIdsMap = get(mon_ids),
    maps:keys(MonIdsMap).


% @doc 获取怪物数据
% @spec get_mon(MonId) -> Mon.
% MonId     :: integer()
% Mon       :: #mon{} | []
get_mon(MonId) ->
    case get({mon, MonId}) of
        #mon{} = Mon -> Mon;
        _ -> []
    end.

% @doc 保存怪物数据
put_mon(Mon) ->
    case get_mon(Mon#mon.id) of
        #mon{x = OldX, y = OldY} ->
            OldXY = lib_scene_map:get_xy(OldX, OldY),
            NewXY = lib_scene_map:get_xy(Mon#mon.x, Mon#mon.y),
            if
                NewXY =:= OldXY ->
                    skip;
                true ->
                    lib_scene_map:pop_from_xy(?BATTLE_MON, OldXY, Mon#mon.id),
                    lib_scene_map:push_into_xy(?BATTLE_MON, NewXY, Mon#mon.id)
            end,
            put({mon, Mon#mon.id}, Mon);
        _ ->
            put_id(Mon#mon.id),
            XY = lib_scene_map:get_xy(Mon#mon.x, Mon#mon.y),
            lib_scene_map:push_into_xy(?BATTLE_MON, XY, Mon#mon.id),
            put({mon, Mon#mon.id}, Mon)
    end.

% @doc 删除怪物数据
% @spec del_mon(MonId) -> {MonId, XY} | skip
% MonId = XY    :: integer()
del_mon(MonId) ->
    case erase({mon, MonId}) of
        #mon{x = X, y = Y} ->
            del_id(MonId),
            XY = lib_scene_map:get_xy(X, Y),
            lib_scene_map:pop_from_xy(?BATTLE_MON, XY, MonId),
            {MonId, XY};
        _ ->
            skip
    end.

% @doc 更新怪物数据
% @spec update_mon(MonId, AttrList) -> ok.
% MonId     :: integer()
% AttrList  :: [{Key :: integer(), Value :: term()}]
update_mon(MonId, AttrList) ->
    case get_mon(MonId) of
        #mon{} = Mon ->
            MonN = do_update_mon(AttrList, Mon),
            put_mon(MonN);
        _ ->
            skip
    end.

% @doc 获取场景内的所有怪物
% @spec get_scene_mon() -> MonList
% MonList   :: [#mon{}...]
get_scene_mon() ->
    AllMonId = get_ids(),
    get_scene_mon_helper(AllMonId, []).

% @doc 获取怪物的位置
% @spec get_scene_mon_pos(RoleId, RoleSid, MIds) -> ignore.
% MonList   :: [#mon{}...]
get_scene_mon_pos(RoleId, RoleSid, []) ->
    MonPos = case lib_scene_agent:get_roler(RoleId) of
        #scene_role{x = X, y = Y, realm = Realm} ->
            AllMons = get_scene_mon_fields([#mon.mid, #mon.x, #mon.y, #mon.owner, #mon.realm]),
            GetNearestFun = fun([Mid, MX, MY, Owner, MRealm], {CurDistPow, CurMon}) ->
                OwnerId = maps:get(id, Owner, 0),
                if
                    (OwnerId =:= 0 orelse OwnerId =:= RoleId) andalso (Realm =:= 0 orelse Realm =/= MRealm) ->
                        Dist = lib_battle_aid:square(MX - X) + lib_battle_aid:square(MY - Y),
                        case Dist < CurDistPow of
                            true -> {Dist, {Mid, MX, MY}};
                            false -> {CurDistPow, CurMon}
                        end;
                    true ->
                        {CurDistPow, CurMon}
                end
            end,
            {_, Found} = lists:foldl(GetNearestFun, {100000000, {0, 0, 0}}, AllMons),
            Found;
        _ ->
            {0, 0, 0}
    end,
    Msg = #get_mon_pos_resp{pos_list = [MonPos]},
    {ok, Bin} = prot_msg:encode_msg(90205, Msg),
    lib_role_send:send_to_sid(RoleSid, Bin);
get_scene_mon_pos(_RoleId, RoleSid, MIds) ->
    PosList = [
        begin
            {MonX, MonY} = case get_scene_mons_by_mid(MId, 1) of
                [#mon{x = X, y = Y}] -> {X, Y};
                _ -> {0, 0}
            end,
            {MId, MonX, MonY}
        end || MId <- MIds
    ],
    Msg = #get_mon_pos_resp{pos_list = PosList},
    {ok, Bin} = prot_msg:encode_msg(90205, Msg),
    lib_role_send:send_to_sid(RoleSid, Bin).

% @doc 返回场景怪物数量
% @spec get_scene_mon_num() -> integer().
get_scene_mon_num() ->
    MonIdsMap = get(mon_ids),
    maps:size(MonIdsMap).

% @doc 获取怪物的数量
% @spec get_scene_mon_num_by_mids(Mids) -> Num.
% Mids      :: [integer()] | integer()
% Num       :: integer()
get_scene_mon_num_by_mids(Mid) when is_integer(Mid) ->
    get_scene_mon_num_by_mids([Mid]);
get_scene_mon_num_by_mids(Mids) when is_list(Mids) ->
    MonIdsMap = get(mon_ids),
    CountFun = fun(MonId, _, AccNum) ->
        case get_mon(MonId) of
            #mon{mid = Mid} ->
                case lists:member(Mid, Mids) of
                    true -> AccNum + 1;
                    false -> AccNum
                end;
            _ ->
                del_id(MonId),
                AccNum
        end
    end,
    maps:fold(CountFun, 0, MonIdsMap).

% @doc 获取场景内某类型的N个怪物
% @spec get_scene_mons_by_mid(MId, Limit) -> [Mon].
% MId       :: integer()
% Limt      :: integer() | all
% Mon       :: #mon{}
get_scene_mons_by_mid(MId, Limit) ->
    MonIdsMap = get(mon_ids),
    GetFun = fun
        (MonId, _, {AccNum, TmpMons}) when AccNum < Limit ->
            case get_mon(MonId) of
                #mon{mid = TMId} = Mon when TMId =:= MId ->
                    {AccNum + 1, [Mon | TmpMons]};
                Mon ->
                    is_record(Mon, mon) orelse del_id(MonId),
                    {AccNum, TmpMons}
            end;
        (_, _, Acc) ->
            Acc
    end,
    element(2, maps:fold(GetFun, {0, []}, MonIdsMap)).

% @doc 获取场景内存活的某类型怪物数量
% @spec count_alive_mon_by_mid(MId) -> Num.
% MId = Num     :: integer()
count_alive_mon_by_mid(MId) ->
    MonIdsMap = get(mon_ids),
    GetFun = fun(MonId, _, AccNum) ->
        case get_mon(MonId) of
            #mon{hp = Hp, mid = TMId} when Hp > 0 andalso TMId =:= MId ->
                AccNum + 1;
            Mon ->
                is_record(Mon, mon) orelse del_id(MonId),
                AccNum
        end
    end,
    maps:fold(GetFun, 0, MonIdsMap).

% @spec get_scene_mons_by_ids(Ids) -> Mons.
% 按格式返回怪物属性
% Ids      :: [integer()]
% Mons     :: [#mon{}]
get_scene_mons_by_ids(Ids) ->
    get_scene_mon_helper(Ids, []).

% @doc 获取距离XY, Dist范围内怪物列表
% @spec get_scene_mon_area(X, Y, Dist) -> [#mon{}].
% X = Y     :: integer()
% Dist      :: number()
get_scene_mons_by_area(X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllMon = get_all_area(AllArea),
    %% 加1和乘以1.5都是为了和怪物攻击距离保持一致
    X1 = X + Dist + 1,
    X2 = X - Dist - 1,
    Y1 = Y + Dist * 1.5 + 1,
    Y2 = Y - Dist * 1.5 - 1,
    [Mon || Mon <- AllMon, Mon#mon.x >= X2 andalso Mon#mon.x =< X1, Mon#mon.y >= Y2 andalso Mon#mon.y =< Y1, Mon#mon.hp > 0].

%% 获取九宫格子怪物id
get_all_area_id(Area) ->
    lists:foldl(fun(A, L) ->
        lib_scene_map:get_xy_objs(?BATTLE_MON, A) ++ L
    end, [], Area).

%% 获取九宫格子怪物信息
get_all_area(XY) ->
    AllMon = get_all_area_id(XY),
    get_scene_mon_helper(AllMon, []).

%% 获取场景内所有归属于某玩家的怪物Id
get_scene_owner_mon_ids(RoleID) ->
    AllMonId = get_ids(),
    lists:filter(fun(MonID) ->
        case get({mon, MonID}) of
            undefined ->
                del_id(MonID),
                false;
            Mon ->
                #mon{owner = Owner} = Mon,
                maps:get(id, Owner, 0) =:= RoleID
        end
    end, AllMonId).

% @doc 删除场景怪物数据
% @spec clear_scene_mon(BroadCast) -> ok.
% BroadCast :: boolean()            是否广播
clear_scene_mon(BroadCast) ->
    MonIds = get_ids(),
    clear_scene_mon_by_ids(MonIds, BroadCast).

% @doc 按怪物唯一id清理创建怪物
% @spec clear_scene_mon_by_ids(MonIds, BroadCast) -> ok.
% Ids       :: [integer()]
% BroadCast :: boolean()
clear_scene_mon_by_ids(Ids, BroadCast) ->
    case BroadCast of
        true -> del_mon_bcast_by_ids(Ids, #{});
        _ -> [del_mon(MonId) || MonId <- Ids]
    end,
    ok.

% @doc 按怪物类型id清理创建怪物
% @spec clear_scene_mon_by_mids(BroadCast, Mids) -> ok.
% Mids      :: [integer()]          怪物资源id列表 #mon.mid
% BroadCast :: boolean              是否广播
clear_scene_mon_by_mids(BroadCast, Mids) ->
    MonList = get_scene_mons_by_mids(Mids),
    case BroadCast of
        true -> del_mon_bcast(MonList, #{});
        _ -> [del_mon(MonId) || #mon{id = MonId} <- MonList]
    end,
    ok.

%% @doc 按组加载怪物
load_mons_by_group(MonL) ->
    do_load_mons_by_group(MonL, [], []).

load_mons_by_group(MonL, Args) ->
    do_load_mons_by_group(MonL, Args, []).

% @doc 创建怪物
% @spec 注意 OwnerTeamId 是归属者队伍, Team是怪物自身的队伍
% @spec create_mon(MId, Args) ->
% MId                   :: integer()
% Args                  :: [{xy, XY} | {owner, Owner} | {attr, Attr} | {realm, Realm} | {parent, ParentId}
% XY                    :: {X :: integer(), Y :: integer()}
% Owner                 :: #{id => RoleId, name => "", team => OwnerTeamId}
% Attr                  :: [{Key, Value}] | #bt_attr{}
% Mode = Realm = Team   :: integer()
% Parent                :: integer()
create_mon(MId, Args) ->
    case lib_obj_mon:init([MId, Args]) of
        {ok, #mon{id = MonId}} -> MonId;
        _ -> 0
    end.

%% @doc 根据怪物唯一ID判断怪物是否在场景内
is_mon_in_scene(Id) ->
    get_mon(Id) =/= [].

%%% Apis for battle select mons ---------------------------------
% @doc 直线型选择目标怪物
get_line_mon_for_battle(OX, OY, X, Y, Width, Dist) ->
    SelectArgs = [OX, OY, X, Y, Width, Dist],
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllMon = get_all_area(AllArea),
    [
        Mon
        || Mon <- AllMon,
        Mon#mon.hp > 0, Mon#mon.attackable > 0, not Mon#mon.is_back,
        lib_battle_aid:get_line_for_battle(Mon#mon.x, Mon#mon.y, SelectArgs)
    ].

% @doc 扇形选择怪物
get_sector_mon_for_battle(Cx, Cy, Dist, Ux, Uy, Angle) ->
    Vx = Ux - Cx,
    Vy = Uy - Cy,
    Cos = util:angle_to_float(Angle / 2),
    SelectArgs = [Cx, Cy, Dist, Vx, Vy, Cos],
    AllArea = lib_scene_map:get_the_area(Cx, Cy),
    AllMon = get_all_area(AllArea),
    [
        Mon
        || Mon <- AllMon,
        Mon#mon.hp > 0, Mon#mon.attackable > 0, not Mon#mon.is_back,
        lib_battle_aid:get_sector_for_battle(Mon#mon.x, Mon#mon.y, SelectArgs)
    ].

% @doc 圆形选择怪物
% get_circle_mon_for_battle(Cx, Cy, Dist, _Ux, _Uy) ->
get_circle_mon_for_battle(Cx, Cy, Dist) ->
    AllArea = lib_scene_map:get_the_area(Cx, Cy),
    AllMon = get_all_area(AllArea),
    DistSqr = lib_battle_aid:square(Dist),
    SelectArgs = [Cx, Cy, DistSqr],
    [
        Mon
        || Mon <- AllMon,
        Mon#mon.hp > 0, Mon#mon.attackable > 0, not Mon#mon.is_back,
        lib_battle_aid:get_circle_for_battle(Mon#mon.x, Mon#mon.y, SelectArgs)
    ].


%%% Privates ----------------------------------------------------
%% 保存怪物id
put_id(MonId) ->
    MonIdsMap = get(mon_ids),
    put(mon_ids, MonIdsMap#{MonId => 0}).

%% 删除怪物
del_id(MonId) ->
    MonIdsMap = get(mon_ids),
    put(mon_ids, maps:remove(MonId, MonIdsMap)).


%% 获取怪物数据列表
get_scene_mon_helper([MonId | RestMonIds], AccMons) ->
    case get({mon, MonId}) of
        undefined ->
            del_id(MonId),
            get_scene_mon_helper(RestMonIds, AccMons);
        Mon ->
            get_scene_mon_helper(RestMonIds, [Mon | AccMons])
    end;
get_scene_mon_helper([], MonList) ->
    MonList.

%% 获取场景内某些类型的怪物
get_scene_mons_by_mids(Mids) ->
    MonIdsMap = get(mon_ids),
    GetFun = fun(MonId, _, TmpMons) ->
        case get_mon(MonId) of
            #mon{mid = Mid} = Mon ->
                case lists:member(Mid, Mids) of
                    true -> [Mon | TmpMons];
                    false -> TmpMons
                end;
            _ ->
                del_id(MonId),
                TmpMons
        end
    end,
    maps:fold(GetFun, [], MonIdsMap).

% 按格式返回怪物属性
get_scene_mon_fields(Fields) ->
    AllMon = get_scene_mon(),
    [returnform(Mon, Fields) || Mon <- AllMon].

%% 返回时格式化
returnform(Mon, ResultForm) when is_list(ResultForm) ->
    [element(Num, Mon) || Num <- ResultForm, is_integer(Num)];
returnform(Mon, ResultForm) when is_integer(ResultForm) ->
    element(ResultForm, Mon);
returnform([], _ResultForm) ->
    [].

do_update_mon([{Index, Value} | Rest], TmpMon) ->
    do_update_mon(Rest, setelement(Index, TmpMon, Value));
do_update_mon([], Mon) ->
    Mon.

del_mon_bcast([#mon{id = MonId} | RestMons], XyMonMap) ->
    {MonId, XY} = del_mon(MonId),
    MonIds = maps:get(XY, XyMonMap, []),
    del_mon_bcast(RestMons, maps:put(XY, [MonId | MonIds], XyMonMap));
del_mon_bcast([], XyMonMap) ->
    XyMonList = maps:to_list(XyMonMap),
    [do_bcast_del_mon(XY, MonIds) || {XY, MonIds} <- XyMonList].

del_mon_bcast_by_ids([MonId | RestIds], XyMonMap) ->
    case del_mon(MonId) of
        {MonId, XY} ->
            MonIds = maps:get(XY, XyMonMap, []),
            del_mon_bcast_by_ids(RestIds, maps:put(XY, [MonId | MonIds], XyMonMap));
        _ ->
            del_mon_bcast_by_ids(RestIds, XyMonMap)
    end;
del_mon_bcast_by_ids([], XyMonMap) ->
    XyMonList = maps:to_list(XyMonMap),
    [do_bcast_del_mon(XY, MonIds) || {XY, MonIds} <- XyMonList].

do_bcast_del_mon(XY, MonIds) ->
    Area = lib_scene_map:get_the_area(XY),
    Msg = #bcast_del_mon{mon_ids = MonIds},
    {ok, Bin} = prot_msg:encode_msg(90235, Msg),
    lib_scene_agent:send_to_any_area(Area, Bin).

do_load_mons_by_group([{MId, X, Y} | Rest], Args, AccMonIds) ->
    ArgsN = case lists:keymember(xy, 1, Args) of
        true -> Args;
        false -> [{xy, {X, Y}} | Args]
    end,
    MonId = create_mon(MId, ArgsN),
    do_load_mons_by_group(Rest, Args, [MonId | AccMonIds]);
do_load_mons_by_group([{MId, X, Y, _, _} | Rest], Args, AccMonIds) ->
    ArgsN = case lists:keymember(xy, 1, Args) of
        true -> Args;
        false -> [{xy, {X, Y}} | Args]
    end,
    MonId = create_mon(MId, ArgsN),
    do_load_mons_by_group(Rest, Args, [MonId | AccMonIds]);
do_load_mons_by_group([], _Args, AccMonIds) ->
    AccMonIds.
