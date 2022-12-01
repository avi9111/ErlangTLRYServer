%%-------------------------------------------------------
%% @File     : lib_flyitem_agent.erl
%% @Brief    : 飞行道具场景管理器
%% @Author   : cablsbs
%% @Date     : 2018-12-7
%%-------------------------------------------------------
-module(lib_flyitem_agent).

-include("log.hrl").
-include("battle.hrl").
-include("scene_objs.hrl").
-include("proto/prot_902.hrl").

-export([
    get_ids/0,                      % 获取飞行道具Id列表
    get_flyitem/1,                  % 获取飞行道具
    put_flyitem/1,                  % 保存飞行道具数据
    del_flyitem/1,                  % 删除飞行道具数据

    create_flyitem/5,               % 创建飞行道具
    get_scene_flyitem/0,            % 获取场景所有飞行道具
    get_all_area_id/1,              % 获取九宫格子飞行道具id
    get_all_area/1                  % 获取九宫格子飞行道具信息
]).


%% Apis -------------------------------------------------
% @doc 获取当前场景的所有飞行道具id
% @spec get_ids() -> FlyitemIds.
% FlyitemIds    :: [integer()]
get_ids() ->
    FlyitemIdsMap = get(flyitem_ids),
    maps:keys(FlyitemIdsMap).

% @doc 获取飞行道具数据
% @spec get_flyitem(FlyitemId) -> Flyitem.
% FlyitemId     :: integer()
% Flyitem       :: #flyitem{} | []
get_flyitem(FlyitemId) ->
    case get({flyitem, FlyitemId}) of
        #flyitem{} = Flyitem -> Flyitem;
        _ -> []
    end.

% @doc 保存飞行道具数据
put_flyitem(Flyitem) ->
    case get_flyitem(Flyitem#flyitem.id) of
        #flyitem{x = OldX, y = OldY} ->
            OldXY = lib_scene_map:get_xy(OldX, OldY),
            NewXY = lib_scene_map:get_xy(Flyitem#flyitem.x, Flyitem#flyitem.y),
            if
                NewXY =:= OldXY ->
                    skip;
                true ->
                    lib_scene_map:pop_from_xy(?BATTLE_FLYITEM, OldXY, Flyitem#flyitem.id),
                    lib_scene_map:push_into_xy(?BATTLE_FLYITEM, NewXY, Flyitem#flyitem.id)
            end,
            put({flyitem, Flyitem#flyitem.id}, Flyitem);
        _ ->
            put_id(Flyitem#flyitem.id),
            XY = lib_scene_map:get_xy(Flyitem#flyitem.x, Flyitem#flyitem.y),
            lib_scene_map:push_into_xy(?BATTLE_FLYITEM, XY, Flyitem#flyitem.id),
            put({flyitem, Flyitem#flyitem.id}, Flyitem)
    end.

% @doc 删除飞行道具数据
% @spec del_flyitem(FlyitemId) -> {FlyitemId, XY} | skip
% FlyitemId = XY    :: integer()
del_flyitem(FlyitemId) ->
    case erase({flyitem, FlyitemId}) of
        #flyitem{x = X, y = Y} ->
            del_id(FlyitemId),
            XY = lib_scene_map:get_xy(X, Y),
            lib_scene_map:pop_from_xy(?BATTLE_FLYITEM, XY, FlyitemId),
            {FlyitemId, XY};
        _ ->
            skip
    end.

% @doc 创建飞行道具
% @spec create_flyitem(AtterKey, DeferKey, SkillLv, AssistXY, FlyitemCId) -> ok.
create_flyitem(FlyitemCId, AssistXY, AtterKey, DeferKey, SkillLv) ->
    case conf_flyitem:get(FlyitemCId) of
        ConfFlyitem when is_map(ConfFlyitem) ->
            GenPosFun = fun
                ({0, X, Y}) ->  % 固定坐标
                    {X, Y};
                ({1, X, Y}) ->  % 目标偏移
                    case lib_battle_aid:get_scene_obj_info(alive_xy, DeferKey) of
                        {DX, DY} -> {DX + X, DY + Y};
                        _ -> {}
                    end;
                ({2, X, Y}) ->  % 释放者偏移
                    case lib_battle_aid:get_scene_obj_info(alive_xy, AtterKey) of
                        {AX, AY} -> {AX + X, AY + Y};
                        _ -> {}
                    end
            end,
            PosList = lists:map(GenPosFun, maps:get(begin_pos, ConfFlyitem, [])),
            [
                lib_obj_flyitem:init([ConfFlyitem, AtterKey, BegXY, AssistXY, SkillLv])
                || BegXY <- PosList, BegXY =/= {}
            ];
        _ ->
            ?ERROR("No such Flyitem: ~p !", [FlyitemCId])
    end.

% @doc 获取场景内的所有飞行道具
% @spec get_scene_flyitem() -> FlyitemList
% FlyitemList   :: [#flyitem{}...]
get_scene_flyitem() ->
    AllFlyitemId = get_ids(),
    get_scene_flyitem_helper(AllFlyitemId, []).

%% 获取九宫格子飞行道具id
get_all_area_id(Area) ->
    lists:foldl(fun(A, L) ->
        lib_scene_map:get_xy_objs(?BATTLE_FLYITEM, A) ++ L
    end, [], Area).

% 获取九宫格子飞行道具信息
get_all_area(XY) ->
    AllFlyitem = get_all_area_id(XY),
    get_scene_flyitem_helper(AllFlyitem, []).


%%% Privates ----------------------------------------------------
%% 保存飞行道具id
put_id(FlyitemId) ->
    FlyitemIdsMap = get(flyitem_ids),
    put(flyitem_ids, FlyitemIdsMap#{FlyitemId => 0}).

%% 删除飞行道具
del_id(FlyitemId) ->
    FlyitemIdsMap = get(flyitem_ids),
    put(flyitem_ids, maps:remove(FlyitemId, FlyitemIdsMap)).

%% 获取飞行道具数据列表
get_scene_flyitem_helper([FlyitemId | RestFlyitemIds], AccFlyitems) ->
    case get({flyitem, FlyitemId}) of
        undefined ->
            del_id(FlyitemId),
            get_scene_flyitem_helper(RestFlyitemIds, AccFlyitems);
        Flyitem ->
            get_scene_flyitem_helper(RestFlyitemIds, [Flyitem | AccFlyitems])
    end;
get_scene_flyitem_helper([], FlyitemList) ->
    FlyitemList.
