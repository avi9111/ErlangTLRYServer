%%-------------------------------------------------------
%% @File     : lib_coll_agent.erl
%% @Brief    : 采集物场景管理器
%% @Author   : cablsbs
%% @Date     : 2018-9-11
%%-------------------------------------------------------
-module(lib_coll_agent).

-include("log.hrl").
-include("battle.hrl").
-include("scene_objs.hrl").
-include("proto/prot_902.hrl").

-export([
    get_ids/0,                      % 获取采集物Id列表
    get_coll/1,                     % 获取采集物
    put_coll/1,                     % 保存采集物数据
    del_coll/1,                     % 删除采集物数据

    get_scene_coll/0,               % 获取场景所有采集物
    get_all_area_id/1,              % 获取九宫格子采集物id
    get_all_area/1,                 % 获取九宫格子采集物信息
    get_colls_by_role/1,            % 获取玩家私人或占有的采集物

    create_coll/4,                  % 创建采集物
    load_colls_by_group/1           % 按组加载采集物
]).


%% Apis -------------------------------------------------
% @doc 获取当前场景的所有采集物id
% @spec get_ids() -> CollIds.
% CollIds    :: [integer()]
get_ids() ->
    CollIdsMap = get(coll_ids),
    maps:keys(CollIdsMap).

% @doc 获取采集物数据
% @spec get_coll(CollId) -> Coll.
% CollId     :: integer()
% Coll       :: #coll{} | []
get_coll(CollId) ->
    case get({coll, CollId}) of
        #coll{} = Coll -> Coll;
        _ -> []
    end.

% @doc 保存采集物数据
put_coll(Coll) ->
    case get_coll(Coll#coll.id) of
        #coll{x = OldX, y = OldY} ->
            OldXY = lib_scene_map:get_xy(OldX, OldY),
            NewXY = lib_scene_map:get_xy(Coll#coll.x, Coll#coll.y),
            if
                NewXY =:= OldXY ->
                    skip;
                true ->
                    lib_scene_map:pop_from_xy(?BATTLE_COLL, OldXY, Coll#coll.id),
                    lib_scene_map:push_into_xy(?BATTLE_COLL, NewXY, Coll#coll.id)
            end,
            put({coll, Coll#coll.id}, Coll);
        _ ->
            put_id(Coll#coll.id),
            XY = lib_scene_map:get_xy(Coll#coll.x, Coll#coll.y),
            lib_scene_map:push_into_xy(?BATTLE_COLL, XY, Coll#coll.id),
            put({coll, Coll#coll.id}, Coll)
    end.

% @doc 删除采集物数据
% @spec del_coll(CollId) -> {CollId, XY} | skip
% CollId = XY    :: integer()
del_coll(CollId) ->
    case erase({coll, CollId}) of
        #coll{x = X, y = Y} ->
            del_id(CollId),
            XY = lib_scene_map:get_xy(X, Y),
            lib_scene_map:pop_from_xy(?BATTLE_COLL, XY, CollId),
            {CollId, XY};
        _ ->
            skip
    end.

% @doc 获取场景内的所有采集物
% @spec get_scene_coll() -> CollList
% CollList   :: [#coll{}...]
get_scene_coll() ->
    AllCollId = get_ids(),
    get_scene_coll_helper(AllCollId, []).

%% 获取九宫格子采集物id
get_all_area_id(Area) ->
    lists:foldl(fun(A, L) ->
        lib_scene_map:get_xy_objs(?BATTLE_COLL, A) ++ L
    end, [], Area).

% 获取九宫格子采集物信息
get_all_area(XY) ->
    AllColl = get_all_area_id(XY),
    get_scene_coll_helper(AllColl, []).


% @doc 获取拥有者为RoleId的采集物(角色离开或死亡)
% @spec get_colls_by_role(RoleId) -> {[#coll{}], [#coll{}]}.
get_colls_by_role(RoleId) ->
    FoldFun = fun(#coll{owner = Owner, belonger = Belonger} = Coll, {TmpOwned, TmpOccpied}) ->
        OwnerId = maps:get(id, Owner, 0),
        BelongerId = maps:get(id, Belonger, 0),
        if
            RoleId =:= OwnerId -> {[Coll | TmpOwned], TmpOccpied};
            RoleId =:= BelongerId -> {TmpOwned, [Coll | TmpOccpied]};
            true -> {TmpOwned ,TmpOccpied}
        end
    end,
    CollList = get_scene_coll(),
    lists:foldl(FoldFun, {[], []}, CollList).

%% @doc 按组加载采集物
load_colls_by_group([{CollId, X, Y} | Rest]) ->
    lib_coll_agent:create_coll(CollId, X, Y, []),
    load_colls_by_group(Rest);
load_colls_by_group([]) ->
    ok.

% @doc 创建采集物
% @spec create_coll(CId, X, Y, Args) ->
% CId       :: integer()
% Args      :: [{owner, #{}}]
create_coll(CId, X, Y, Args) ->
    case lib_obj_coll:init([CId, X, Y, Args]) of
        {ok, #coll{id = CollId}} -> CollId;
        _ -> 0
    end.


%%% Privates ----------------------------------------------------
%% 保存采集物id
put_id(CollId) ->
    CollIdsMap = get(coll_ids),
    put(coll_ids, CollIdsMap#{CollId => 0}).

%% 删除采集物
del_id(CollId) ->
    CollIdsMap = get(coll_ids),
    put(coll_ids, maps:remove(CollId, CollIdsMap)).

%% 获取采集物数据列表
get_scene_coll_helper([CollId | RestCollIds], AccColls) ->
    case get({coll, CollId}) of
        undefined ->
            del_id(CollId),
            get_scene_coll_helper(RestCollIds, AccColls);
        Coll ->
            get_scene_coll_helper(RestCollIds, [Coll | AccColls])
    end;
get_scene_coll_helper([], CollList) ->
    CollList.
