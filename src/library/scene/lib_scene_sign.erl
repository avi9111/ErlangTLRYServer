%%-------------------------------------------------------
%% @File   : lib_scene_sign.erl
%% @Brief  : 场景标记检查接口
%% @Author : cablsbs
%% @Date   : 2018-6-22
%%-------------------------------------------------------
-module(lib_scene_sign).

-include("mask.hrl").
-include("scene.hrl").
-include("common.hrl").

%% API
-export([
    is_walk_pos/3,
    is_safe_pos/3,
    is_water_pos/3,
    is_pos_blocked/3,
    is_line_through/3,

    gen_path/3,
    rand_pos/4,
    get_a_star_path/5,
    % test_gen_path/3,
    get_nearest_line_poses/5
]).


%% -----------------------------------------------------------------------------
% @doc 是否可行走
is_walk_pos(SceneId, X, Y) ->
    conf_scene_mask:get_pos_mask(SceneId, X, Y) band 1 =:= 1.

% @doc 是否安全区
is_safe_pos(SceneId, X, Y) ->
    (conf_scene_mask:get_pos_mask(SceneId, X, Y) bsr 1) band 1 =:= 1.

% @doc 是否水、温泉区
is_water_pos(SceneId, X, Y) ->
    (conf_scene_mask:get_pos_mask(SceneId, X, Y) bsr 2) band 1 =:= 1.

% @doc 是否有阻挡
is_pos_blocked(SceneId, X, Y) ->
    not is_walk_pos(SceneId, X, Y).

% @doc 两点间是否直通
is_line_through(SceneId, {X, Y}, {ToX, ToY}) ->
    Path = do_gen_path({X, Y}, {ToX, ToY}),
    is_walk_path(SceneId, Path).


% @doc 生成两点间的路线(直线)
gen_path(SceneId, FromXY, ToXY) ->
    Path = do_gen_path(FromXY, ToXY),
    case is_walk_path(SceneId, Path) of
        true -> Path;
        _ -> []
    end.

% @doc 随机距离(X,Y) Dist 范围内的 一个位置 TODO
rand_pos(SceneId, X, Y, Dist) when Dist =< 8 ->
    MinX = max(1, X - Dist),
    MinY = max(1, Y - Dist),
    {CMaxX, CMaxY} = conf_scene_mask:get_max_pos(SceneId),
    MaxX = min(X + Dist, CMaxX),
    MaxY = min(Y + Dist, CMaxY),
    do_rand_pos(SceneId, {X, Y}, {MinX, MinY}, {MaxX, MaxY});
rand_pos(_SceneId, X, Y, Dist) ->
    ?ERROR("Dist: ~p is too big for this function !", [Dist]),
    {X, Y}.

%% @doc A*算法路径
get_a_star_path(X, Y, ToX, ToY, Depth) ->
    InitNode = #astar_node{
        xy = {X,Y},
        pxy = {X,Y},
        gvalue = 0,
        hvalue = abs(ToX - X) + abs(ToY - Y)
    },
    OpenDict = dict:store({X,Y}, InitNode, dict:new()),
    get_a_star_path(X, Y, ToX, ToY, Depth, OpenDict, dict:new()).

% %% @doc测试生成直线路径(不判断是否可行走)
% test_gen_path(SceneId, {X, Y}, {ToX, ToY}) ->
%     put(scene_id, SceneId),
%     do_gen_path({X, Y}, {ToX, ToY}).

%% @doc 获取可达的最大坐标
get_nearest_line_poses(SceneID, X1, Y1, X2, Y2) ->
    case X1 == X2 of
        true ->
            Dir = ?iif(Y1 < Y2, 1, -1),
            get_nearest_line_poses_verti(SceneID, X1, Y1, Y2, Dir, {X1, Y1});
        false ->
            Dir = ?iif(X1 < X2, 1, -1),
            get_nearest_line_poses_k(SceneID, X1, Y1, X2, Y2, X1, Dir, {X1, Y1})
    end.


%% Privates ---------------------------------------------
% 获取A*算法路径
get_a_star_path(IniX, IniY, ToX, ToY, Depth, OpenDict, CloseDict) ->
    SceneId = ?SCENE_ID,
    CurNode = get_least_f_point(OpenDict),
    #astar_node{xy = {CurX, CurY}, gvalue = GValue} = CurNode,
    OpenDictZero = dict:size(OpenDict) == 0,
    Arrived = {ToX, ToY} == {CurX, CurY} orelse GValue > Depth,

    if
        OpenDictZero ->
            [];
        Arrived ->
            backtrack_path(SceneId, CurNode, CloseDict, [], 1);
        true ->
            % 左上
            NodeLUT = #astar_node{
                xy = {CurX-1,CurY-1},
                gvalue = GValue + 1.414,
                hvalue = abs(ToX-CurX+1) + abs(ToY-CurY+1),
                pxy = {CurX, CurY}
            },
            % 正上
            NodeUT = #astar_node{
                xy = {CurX,CurY-1},
                gvalue = GValue + 1,
                hvalue = abs(ToX-CurX) + abs(ToY-CurY+1),
                pxy = {CurX, CurY}
            },
            % 右上
            NodeRUT = #astar_node{
                xy = {CurX+1,CurY-1},
                gvalue = GValue + 1.414,
                hvalue = abs(ToX-CurX-1) + abs(ToY-CurY+1),
                pxy = {CurX, CurY}
            },
            % 左
            NodeLT = #astar_node{
                xy = {CurX-1,CurY},
                gvalue = GValue + 1,
                hvalue = abs(ToX-CurX+1) + abs(ToY-CurY),
                pxy = {CurX, CurY}
            },
            % 右
            NodeRT = #astar_node{
                xy = {CurX+1,CurY},
                gvalue = GValue + 1,
                hvalue = abs(ToX-CurX-1) + abs(ToY-CurY),
                pxy = {CurX, CurY}
            },
            % 左下
            NodeLDT = #astar_node{
                xy = {CurX-1,CurY+1},
                gvalue = GValue + 1.414,
                hvalue = abs(ToX-CurX+1) + abs(ToY-CurY-1),
                pxy = {CurX, CurY}
            },
            % 正下
            NodeDT = #astar_node{
                xy = {CurX,CurY+1},
                gvalue = GValue + 1,
                hvalue = abs(ToX-CurX) + abs(ToY-CurY-1),
                pxy = {CurX, CurY}
            },
            % 右下
            NodeRDT = #astar_node{
                xy = {CurX+1,CurY+1},
                gvalue = GValue + 1.414,
                hvalue = abs(ToX-CurX-1) + abs(ToY-CurY-1),
                pxy = {CurX, CurY}
            },

            Nodes = [
                judge_astart_node(SceneId, NodeLUT, OpenDict, CloseDict),   % LeftUp
                judge_astart_node(SceneId, NodeUT, OpenDict, CloseDict),    % Up
                judge_astart_node(SceneId, NodeRUT, OpenDict, CloseDict),   % RightUp
                judge_astart_node(SceneId, NodeLT, OpenDict, CloseDict),    % Left
                judge_astart_node(SceneId, NodeRT, OpenDict, CloseDict),    % Right
                judge_astart_node(SceneId, NodeLDT, OpenDict, CloseDict),   % LeftDown
                judge_astart_node(SceneId, NodeDT, OpenDict, CloseDict),    % Down
                judge_astart_node(SceneId, NodeRDT, OpenDict, CloseDict)    % RightDown
            ],

            UpdateDictFun = fun
                ({save, NodeX}, {CloseDictAcc, OpenDictAcc}) ->
                    {CloseDictAcc, dict:store(NodeX#astar_node.xy, NodeX, OpenDictAcc)};
                ({ignore, _NodeX}, {CloseDictAcc, OpenDictAcc}) ->
                    {CloseDictAcc, OpenDictAcc};
                ({block, NodeX}, {CloseDictAcc, OpenDictAcc}) ->
                    {dict:store(NodeX#astar_node.xy, NodeX, CloseDictAcc), OpenDictAcc}
            end,
            CloseDictT = dict:store({CurX, CurY}, CurNode, CloseDict),
            OpenDictT = dict:erase({CurX, CurY}, OpenDict),
            {NewCloseDict, NewOpenDict} = lists:foldl(UpdateDictFun, {CloseDictT, OpenDictT}, Nodes),
            get_a_star_path(IniX, IniY, ToX, ToY, Depth, NewOpenDict, NewCloseDict)
    end.

% A*节点仲裁
judge_astart_node(SceneId, #astar_node{xy={X,Y}=XY, gvalue=CGValue, hvalue=CHValue}=NodeC, OpenDict, CloseDict) ->
    IsBlock = is_pos_blocked(SceneId, X, Y),
    if
        IsBlock ->
            {block, NodeC};
        true ->
            case dict:find(XY, CloseDict) of
                {ok, ValueCL} ->
                    {ignore, ValueCL};
                _ ->
                    case dict:find(XY, OpenDict) of
                        {ok, #astar_node{gvalue=GValue, hvalue=HValue} = Value} ->
                            case GValue + HValue =< CGValue + CHValue of
                                true -> {ignore, Value};
                                false -> {save, NodeC}
                            end;
                        _ ->
                            {save, NodeC}
                    end
            end
    end.

get_least_f_point(OpenDict) ->
    SFun = fun
        (_Key, #astar_node{hvalue=HV1, gvalue=GV1}=Value, #astar_node{hvalue=HV2, gvalue=GV2}) when HV1 + GV1 < HV2 + GV2 -> Value;
        (_Key, _Value, Acc) -> Acc
    end,
    dict:fold(SFun, #astar_node{xy={0,0}, pxy={0,0},gvalue=1000000000,hvalue=1000000000000}, OpenDict).

% 回溯路径
backtrack_path(_SceneId, DestNode, CloseDict, Res, Acc) when Acc > 500 ->
    ?ERROR("backtrack_path error:~p", [{DestNode, dict:to_list(CloseDict), Res}]),
    [];
backtrack_path(SceneId, #astar_node{xy = XY, pxy = XY}, _CloseDict, Path, _Acc) ->
    shorten_path(SceneId, Path, []);
backtrack_path(SceneId, #astar_node{xy = XY, pxy = PXY}, CloseDict, TPath, Acc) ->
    case dict:find(PXY, CloseDict) of
        {ok, #astar_node{pxy = PXYN} = Value} ->
            case lists:member(PXYN, TPath) of
                true -> shorten_path(SceneId, TPath, []);
                false -> backtrack_path(SceneId, Value, CloseDict, [XY | TPath], Acc+1)
            end;
        _ ->
            shorten_path(SceneId, [XY | TPath], [])
    end.

% 随机一个位置
do_rand_pos(_SceneId, {X, Y}, {MinX, MinY}, {MinX, MinY}) ->
    {X, Y};
do_rand_pos(SceneId, {X, Y}, {MinX, MinY}, {MaxX, MaxY}) ->
    YList = util:get_seq_list(MinY, MaxY),
    GenPosFun = fun(XP, AccPosL) ->
        lists:foldl(
          fun(YP, Acc) ->
            case XP =/= X andalso Y =/= YP andalso is_walk_pos(SceneId, XP, YP) of
                true -> [{XP, YP} | Acc];
                false -> Acc
            end
          end, AccPosL, YList
        )
    end,

    XList = util:get_seq_list(MinX, MaxX),
    case lists:foldl(GenPosFun, [], XList) of
        [] ->
            {X, Y};
        PostList ->
            Nth = util:rand(1, length(PostList)),
            lists:nth(Nth, PostList)
    end.

do_gen_path({X, Y}, {X, Y}) ->
    [{X, Y}];
do_gen_path({X, Y}, {X, ToY}) ->
    if
        Y < ToY -> [{X, Yn} || Yn <- lists:seq(Y, ToY)];
        true -> [{X, Yn} || Yn <- lists:seq(Y, ToY, -1)]
    end;
do_gen_path({X, Y}, {ToX, Y}) ->
    if
        X < ToX -> [{Xn, Y} || Xn <- lists:seq(X, ToX)];
        true -> [{Xn, Y} || Xn <- lists:seq(X, ToX, -1)]
    end;
do_gen_path({X, Y}, {ToX, ToY}) ->
    {GX, GY} = lib_obj_util:calc_gradient(X, Y, ToX, ToY),
    case abs(ToX - X) > abs(ToY - Y) of
        true ->
            RakeRatio = GY / GX,
            GenPathFun = fun(Xn) -> {Xn, Y + trunc((Xn - X) * RakeRatio)} end,
            case X < ToX of
                true -> lists:map(GenPathFun, lists:seq(X, ToX));
                false -> lists:map(GenPathFun, lists:seq(X, ToX, -1))
            end;
        false ->
            RakeRatio = GX / GY,
            GenPathFun = fun(Yn) -> {X + trunc((Yn - Y) * RakeRatio), Yn} end,
            case Y < ToY of
                true -> lists:map(GenPathFun, lists:seq(Y, ToY));
                false -> lists:map(GenPathFun, lists:seq(Y, ToY, -1))
            end
    end.

is_walk_path(SceneId, Path) ->
    CheckFun = fun({X, Y}) -> is_walk_pos(SceneId, X, Y) end,
    lists:all(CheckFun, Path).

get_nearest_line_poses_k(_SceneID, _X1, _Y1, X2, _Y2, X, -1, Res) when X < X2 ->
    Res;
get_nearest_line_poses_k(_SceneID, _X1, _Y1, X2, _Y2, X, 1, Res) when X > X2 ->
    Res;
get_nearest_line_poses_k(SceneID, X1, Y1, X2, Y2, X, Dir, Res) ->
    Y = trunc(Y1 - (Y1 - Y2) * (X1 - X) / (X1 - X2)),
    case is_walk_pos(SceneID, X, Y) of
        false -> Res;
        true -> get_nearest_line_poses_k(SceneID, X1, Y1, X2, Y2, X + Dir, Dir, {X, Y})
    end.

get_nearest_line_poses_verti(_SceneID, _X, Y, Y2, -1, Res) when Y < Y2 ->
    Res;
get_nearest_line_poses_verti(_SceneID, _X, Y, Y2, 1, Res) when Y > Y2 ->
    Res;
get_nearest_line_poses_verti(SceneID, X, Y, Y2, Dir, Res) ->
    case is_walk_pos(SceneID, X, Y) of
        false -> Res;
        true -> get_nearest_line_poses_verti(SceneID, X, Y + Dir, Y2, Dir, {X, Y})
    end.

% % 缩短路线(斜率归并)
% shorten_path(SceneId, [{FX, FY} = F, {SX, SY} = S, {TX, TY} = T | Rest], Acc) ->
%     case SX*(TY-FY) + FX*(SY-TY) =:= TX*(SY-FY) of
%         true -> shorten_path(SceneId, [F, T | Rest], Acc);
%         false -> shorten_path(SceneId, [S, T | Rest], [F | Acc])
%     end;
% shorten_path(_SceneId, Rest, Acc) ->
%     lists:reverse(Acc) ++ Rest.

% 缩短路线(通过性归并)
shorten_path(SceneId, [F, S, T | Rest], Acc) ->
    case is_line_through(SceneId, F, T) of
        true -> shorten_path(SceneId, [F, T | Rest], Acc);
        false -> shorten_path(SceneId, [S, T | Rest], [F | Acc])
    end;
shorten_path(_SceneId, Rest, Acc) ->
    lists:reverse(Acc) ++ Rest.
