%%-------------------------------------------------------
%% @File     : lib_carry_agent.erl
%% @Brief    : 镖车场景管理器
%% @Author   : cablsbs
%% @Date     : 2018-9-11
%%-------------------------------------------------------
-module(lib_carry_agent).

-include("log.hrl").
-include("battle.hrl").
-include("scene_objs.hrl").
-include("proto/prot_902.hrl").

-export([
    get_ids/0,                      % 获取镖车Id列表
    get_carry/1,                    % 获取镖车
    put_carry/1,                    % 保存镖车数据
    del_carry/1,                    % 删除镖车数据

    get_scene_carry/0,              % 获取场景所有镖车
    get_all_area_id/1,              % 获取九宫格子镖车id
    get_all_area/1                  % 获取九宫格子镖车信息
]).

-export([
    set_marry_carry_flag/1,
    is_have_marry_carry/0
]).


%% Apis -------------------------------------------------
% @doc 获取当前场景的所有镖车id
% @spec get_ids() -> CarryIds.
% CarryIds    :: [integer()]
get_ids() ->
    CarryIdsMap = get(carry_ids),
    maps:keys(CarryIdsMap).

% @doc 获取镖车数据
% @spec get_carry(CarryId) -> Carry.
% CarryId     :: integer()
% Carry       :: #carry{} | []
get_carry(CarryId) ->
    case get({carry, CarryId}) of
        #carry{} = Carry -> Carry;
        _ -> []
    end.

% @doc 保存镖车数据
put_carry(Carry) ->
    case get_carry(Carry#carry.id) of
        #carry{x = OldX, y = OldY} ->
            OldXY = lib_scene_map:get_xy(OldX, OldY),
            NewXY = lib_scene_map:get_xy(Carry#carry.x, Carry#carry.y),
            if
                NewXY =:= OldXY ->
                    skip;
                true ->
                    lib_scene_map:pop_from_xy(?BATTLE_CARRY, OldXY, Carry#carry.id),
                    lib_scene_map:push_into_xy(?BATTLE_CARRY, NewXY, Carry#carry.id)
            end,
            put({carry, Carry#carry.id}, Carry);
        _ ->
            put_id(Carry#carry.id),
            XY = lib_scene_map:get_xy(Carry#carry.x, Carry#carry.y),
            lib_scene_map:push_into_xy(?BATTLE_CARRY, XY, Carry#carry.id),
            put({carry, Carry#carry.id}, Carry)
    end.

% @doc 删除镖车数据
% @spec del_carry(CarryId) -> {CarryId, XY} | skip
% CarryId = XY    :: integer()
del_carry(CarryId) ->
    case erase({carry, CarryId}) of
        #carry{x = X, y = Y} ->
            del_id(CarryId),
            XY = lib_scene_map:get_xy(X, Y),
            lib_scene_map:pop_from_xy(?BATTLE_CARRY, XY, CarryId),
            {CarryId, XY};
        _ ->
            skip
    end.

% @doc 获取场景内的所有镖车
% @spec get_scene_carry() -> CarryList
% CarryList   :: [#carry{}...]
get_scene_carry() ->
    AllCarryId = get_ids(),
    get_scene_carry_helper(AllCarryId, []).

%% 获取九宫格子镖车id
get_all_area_id(Area) ->
    lists:foldl(fun(A, L) ->
        lib_scene_map:get_xy_objs(?BATTLE_CARRY, A) ++ L
    end, [], Area).

% 获取九宫格子镖车信息
get_all_area(XY) ->
    AllCarry = get_all_area_id(XY),
    get_scene_carry_helper(AllCarry, []).

%% 设置婚车标识
set_marry_carry_flag(Flag) ->
    erlang:put(marry_carry_flag, Flag).

%% 获取婚车标识
is_have_marry_carry() ->
    erlang:get(marry_carry_flag) =:= 1.

%%% Privates ----------------------------------------------------
%% 保存镖车id
put_id(CarryId) ->
    CarryIdsMap = get(carry_ids),
    put(carry_ids, CarryIdsMap#{CarryId => 0}).

%% 删除镖车
del_id(CarryId) ->
    CarryIdsMap = get(carry_ids),
    put(carry_ids, maps:remove(CarryId, CarryIdsMap)).

%% 获取镖车数据列表
get_scene_carry_helper([CarryId | RestCarryIds], AccCarrys) ->
    case get({carry, CarryId}) of
        undefined ->
            del_id(CarryId),
            get_scene_carry_helper(RestCarryIds, AccCarrys);
        Carry ->
            get_scene_carry_helper(RestCarryIds, [Carry | AccCarrys])
    end;
get_scene_carry_helper([], CarryList) ->
    CarryList.
