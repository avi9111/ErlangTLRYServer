%%-------------------------------------------------------
%% @File     : router_902
%% @Brief    : 场景aoi协议组
%% @Author   : cablsbs
%% @Date     : 2018-6-27
%%-------------------------------------------------------

-module(router_902).

-include("role.hrl").
-include("scene.hrl").
-include("ret_code.hrl").
-include("guild_carry.hrl").
-include("proto/prot_902.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
% @doc 角色场景信息请求
% MsgRecord = #role_walk_req{}
do(90200, State, #role_walk_req{role_id = ObjId} = MsgRecord) ->
    #role_state{id = RoleId, role_scene = RoleScene, stat = Stat} = State,
    #role_scene{scene_id = CurSceneId, line_pid = LinePid} = RoleScene,
    #role_walk_req{
        scene_id = SceneId, cx = CX, cy = CY, x = ToX, y = ToY,
        move = MoveType, reset_index = CResetIndex
    } = MsgRecord,
    %% 结婚巡游期间不能移动
    IsInMarryParade = bit_map:is_set(?SPEC_STAT_BIT_MARRY, Stat),
    case CurSceneId =:= SceneId of
        true when ObjId =:= RoleId orelse ObjId < ?MAX_ROBOT_ID andalso (not IsInMarryParade) ->
            Cmd = {'move', {ObjId, CX, CY, ToX, ToY, MoveType, CResetIndex}},
            svr_scene_agent:push_cmd(LinePid, Cmd);
        false ->
            skip
    end,
    {ok, State};
% 机器人移动
do(90200, #role_state{role_scene = RoleScene} = State, #role_walk_req{role_id = RoleId} = MsgRecord) ->
    #role_scene{line_pid = LinePid} = RoleScene,
    #role_walk_req{
        cx = CX, cy = CY, x = ToX, y = ToY,
        move = MoveType, reset_index = CResetIndex
    } = MsgRecord,
    Cmd = {'move', {RoleId, CX, CY, ToX, ToY, MoveType, CResetIndex}},
    svr_scene_agent:push_cmd(LinePid, Cmd),
    {ok, State};

% @doc 宠物场景信息请求
% MsgRecord = #pet_walk_req{}
do(90202, State, #pet_walk_req{} = MsgRecord) ->
    #role_state{id = RoleId, role_scene = RoleScene} = State,
    #role_scene{scene_id = CurSceneId, line_pid = LinePid} = RoleScene,
    #pet_walk_req{
        pet_id = PetId, scene_id = SceneId,
        cx = CX, cy = CY, x = ToX, y = ToY,
        move = MoveType, reset_index = CResetIndex
    } = MsgRecord,
    case CurSceneId =:= SceneId of
        true ->
            Cmd = {'pet_move', {RoleId, PetId, CX, CY, ToX, ToY, MoveType, CResetIndex}},
            svr_scene_agent:push_cmd(LinePid, Cmd);
        false ->
            skip
    end,
    {ok, State};

% @doc 查询怪物坐标(怪物id为0时，返回最近目标)
% 进入场景，并发送初始化需要的数据
% MsgRecord = #get_mon_pos_req{}
do(90204, State, #get_mon_pos_req{mids = MIds}) ->
    #role_state{id = RoleId, sid = RoleSid, role_scene = RoleScene} = State,
    #role_scene{line_pid = LinePid} = RoleScene,
    svr_scene_agent:apply_cast(LinePid, lib_mon_agent, get_scene_mon_pos, [RoleId, RoleSid, MIds]),
    {ok, State};

% @doc 加载新场景信息请求
% MsgRecord = #scene_info_req{}
do(90207, State, #scene_info_req{}) ->
    svr_scene_agent:load_scene(State),
    {ok, State#role_state{scene_opt = []}};

% @doc 角色切场景请求
% MsgRecord = #change_scene_req{}
do(90208, State, #change_scene_req{scene_id = SceneId, line_id = LineId} = Req) ->
    #role_scene{scene_id = CurSceneId, line_id = CurLineId} = State#role_state.role_scene,
    case lib_scene_api:is_normal_scene(SceneId) of
        true ->
            case lib_scene_api:is_scene_of_types(CurSceneId, ?TO_NORMAL_SCENE_TYPES) of
                true when SceneId =/= CurSceneId ->
                    handle_change_scene(State, SceneId, LineId);
                true when LineId =/= CurLineId ->
                    #role_scene{x = X, y = Y} = State#role_state.role_scene,
                    handle_change_scene(State, SceneId, LineId, X, Y);
                true ->
                    ?ERROR("Same scene transfer at Scene: ~p, ignored !!!", [SceneId]),
                    ok;
                false ->
                    ?ERROR("Bad change_scene_req: ~p from SpecialScene: ~p !", [Req, CurSceneId]),
                    ok
            end;
        false ->
            ?ERROR("Bad change_scene_req: ~p From: ~p to SpecialScene: ~p !", [Req, CurSceneId, SceneId]),
            ok
    end;

% @doc 角色进入传送阵
% MsgRecord = #scene_transfer_req{}
do(90209, State, #scene_transfer_req{door = Door}) ->
    #role_state{id = RoleId, role_scene = RoleScene} = State,
    SceneId = RoleScene#role_scene.scene_id,
    #scene{door = Doors} = conf_scene:get(SceneId),
    case lists:keyfind(Door, 1, Doors) of
        {Door, DX, DY, {ToSceneId, ToX, ToY}} ->
            #role_scene{x = RX, y = RY} = RoleScene,
            case lib_battle_chk:check_distance({RX, RY}, {DX, DY}, 10) of
                true ->
                    handle_change_scene(State, ToSceneId, ?DYN_LINE_ID, ToX, ToY);
                false ->
                    ?ERROR_TOC(RoleId, ?RC_SCENE_FAR_FROM_TRANSPORT)
            end
    end;

% @doc 获取场景分线信息
% MsgRecord = #scene_transfer_req{}
do(90210, #role_state{id = RoleId, sid = RoleSid, role_scene = RoleScene}, #get_scene_line_info_req{}) ->
    SceneId = RoleScene#role_scene.scene_id,
    case lib_scene_api:is_scene_of_types(SceneId, ?NORMAL_SCENE_TYPES) of
        true ->
            case svr_scene_mgr:get_line_info(SceneId) of
                LineInfo when is_list(LineInfo) ->
                    MsgRecord = #get_scene_line_info_resp{scene_id = SceneId, line_info = LineInfo},
                    {ok, Bin} = prot_msg:encode_msg(90211, MsgRecord),
                    lib_role_send:send_to_sid(RoleSid, Bin);
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_SCENE_CANNOT_SWITCH_LINE)
            end;
        false ->
            ?ERROR_TOC(RoleId, ?RC_SCENE_CANNOT_SWITCH_LINE)
    end,
    ok;

%% 处理未定义协议
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).


%% Priates ----------------------------------------------
handle_change_scene(State, SceneId, LineId) ->
    case lib_scene_api:change_scene(State, SceneId, LineId) of
        {ok, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            {ok, State}
    end.

handle_change_scene(State, SceneId, LineId, X, Y) ->
    case lib_scene_api:change_scene(State, SceneId, LineId, X, Y) of
        {ok, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            {ok, State}
    end.
