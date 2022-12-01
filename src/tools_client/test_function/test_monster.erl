%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 九月 2019 11:18
%%%-------------------------------------------------------------------
-module(test_monster).
-author("Administrator").
-include("svr_client.hrl").
%% API
-export([get_monsters/1, get_scene_mons_by_area/3, monster_pos/2, area_monsters/2]).

get_monsters(CliId) ->
    try
        Ets = ?to_ets(CliId),
        RoleId = util:get_ets(Ets, 'role_id'),
        Monsters = recv_lib:cli_monster(CliId),
        #notify_role_scene_attr{realm = MRealm} = recv_lib:role_scene_attr(CliId),
        lists:foldl(fun(#mon_scene_info{id = Mid, owner_id = OwnerId, x = X, y = Y, hp = Hp, realm = Realm}, Acc) ->
            case (OwnerId =:= 0 orelse OwnerId =:= RoleId) andalso (Realm =:= 0 orelse Realm =/= MRealm) andalso Hp > 0 of
                true ->
                    [{Mid, X, Y} | Acc];
                _ ->
                    Acc
            end
        end, [], Monsters)
    catch
        R1:R2 ->
            ?DEBUG("get_monster_error.......~p, ~p", [R1, R2]),
            []
    end.

monster_pos(CliId, MonId) ->
    Ets = ?to_ets(CliId),
    {SceneId, LineId, _Cx, _Cy, _ResetIndex} = util:get_ets(Ets, 'scene'),
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    case svr_scene_agent:apply_call(LinePid, 'lib_mon_agent', 'get_mon', [MonId]) of
        #mon{mid = Mid, x = X, y = Y, hp = Hp} ->
            {MonId, Mid, X, Y, Hp};
        _ ->
            skip
    end.

area_monsters(CliId, Dist) ->
    Ets = ?to_ets(CliId),
    {SceneId, LineId, X, Y, _ResetIndex} = util:get_ets(Ets, 'scene'),
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    Mons = svr_scene_agent:apply_call(LinePid, ?MODULE, 'get_scene_mons_by_area', [X, Y, Dist]),
    _Mon = util:list_rand(Mons).

get_scene_mons_by_area(X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllMon = lib_mon_agent:get_all_area(AllArea),
    %% 加1和乘以1.5都是为了和怪物攻击距离保持一致
    X1 = X + Dist + 1,
    X2 = X - Dist - 1,
    Y1 = Y + Dist * 1.5 + 1,
    Y2 = Y - Dist * 1.5 - 1,
    [{Mon#mon.id, Mon#mon.x, Mon#mon.y} || Mon <- AllMon, Mon#mon.x >= X2 andalso Mon#mon.x =< X1, Mon#mon.y >= Y2 andalso Mon#mon.y =< Y1, Mon#mon.hp > 0].


