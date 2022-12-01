%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     珍兽捕捉
%%% @end
%%% Created : 26. 十一月 2018 15:38
%%%-------------------------------------------------------------------
-module(lib_scene_catch_pet).

-include("role.hrl").
-include("scene.hrl").
-include("op_type.hrl").

%% API
-export([
    mon_die/5,
    coll_end/3,
    handle_info/2
]).

%% 玩家进程操作
handle_info(cost_item, PS) ->
    ItemID = config:get_sys_config(catch_pet_cost_item),
    lib_role_assets:cost_items_notify(PS, [{?AST_ITEM, [{ItemID, 1}]}], ?OPT_CATCH_PET);
handle_info(_, _) ->
    skip.

%% @doc 怪物死亡
mon_die(?SCENE_ID_CATCH_PET, MTypeID, X, Y, OwnerId) ->
    case conf_catch_pet:get(MTypeID) of
        #{weight := Weight, coll_id := CollID} ->
            case util:is_bingo(Weight) of
                true ->
                    Args = [{owner, #{id => OwnerId}}],
                    lib_coll_agent:create_coll(CollID, X, Y, Args);
                _ ->
                    skip
            end;
        _ ->
            skip
    end;
mon_die(_, _, _, _, _) ->
    skip.

%% @doc 采集结束
coll_end(?SCENE_ID_CATCH_PET, CId, RoleId) ->
    case conf_catch_pet:get_item_id(CId) of
        ItemID when ItemID > 0 ->
            case conf_goods_effect:get(ItemID) of
                undefined ->
                    skip;
                GEffect ->
                    lib_role:mod_info(RoleId, ?MODULE, cost_item),
                    lib_role:mod_info(RoleId, lib_role_pet, {active_pet_by_catch, GEffect})
            end;
        _ ->
            skip
    end;
coll_end(_, _, _) ->
    skip.
