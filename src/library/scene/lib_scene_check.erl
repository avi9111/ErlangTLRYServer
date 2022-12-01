%%-------------------------------------------------------
%% @File   : lib_scene_check.erl
%% @Brief  : 场景信息检查接口
%% @Author : cablsbs
%% @Date   : 2018-6-22
%%-------------------------------------------------------
-module(lib_scene_check).

-include("role.hrl").
-include("scene.hrl").
-include("ret_code.hrl").

-export([
    check_enter_limit/3,            %% 进入场景限制检测
    check_enter_limit/5,            %% 进入场景限制检测
    check_practice/1,               %% 练功检测
    check_change_mode/3,            %% 模式切换判断

    ensure_in_normal_scene/1        %% 确保是否普通场景
]).

%% @doc 逐个检查进入需求
check_enter_limit(RoleState, SceneId, LineId) ->
    do_check_stat(RoleState#role_state.stat),
    SceneConf = conf_scene:get(SceneId),
    is_record(SceneConf, scene) orelse throw({error, ?RC_SCENE_NO_SUCH_SCENE}),
    do_check_limit(RoleState, SceneConf#scene.enter_lmt),
    {LineIdFix, LinePid} = do_check_line(SceneId, LineId),
    {ok, SceneId, LineIdFix, LinePid, SceneConf#scene.x, SceneConf#scene.y}.

%% @doc 逐个检查进入需求
check_enter_limit(RoleState, SceneId, LineId, ToX, ToY) ->
    do_check_stat(RoleState#role_state.stat),
    SceneConf = conf_scene:get(SceneId),
    is_record(SceneConf, scene) orelse throw({error, ?RC_SCENE_NO_SUCH_SCENE}),
    do_check_limit(RoleState, SceneConf#scene.enter_lmt),
    {LineIdFix, LinePid} = do_check_line(SceneId, LineId),
    case lib_scene_sign:is_walk_pos(SceneId, ToX, ToY) of
        true -> {ok, SceneId, LineIdFix, LinePid, ToX, ToY};
        false -> {ok, SceneId, LineIdFix, LinePid, SceneConf#scene.x, SceneConf#scene.y}
    end.

%% @doc 检测是否已经激活了练功状态
check_practice(SceneRole) when is_record(SceneRole, scene_role) ->
    #scene_role{stat = Stat, statem = #statem{cur_state_id = CurState}} = SceneRole,
    CurState =/= ?STATE_SIT andalso bit_map:is_set(?SPEC_STAT_BIT_SIT, Stat) andalso begin
        SceneRoleN = lib_statem:change_state(?STATE_SIT, [], #scene_role.statem, SceneRole),
        lib_scene_agent:put_roler(SceneRoleN)
    end.

%% @doc 模式切换检测
check_change_mode(SceneId, ToMode, GuildId) ->
    IsExisted = lists:member(ToMode, ?ALL_MODE),
    #scene{mode = ValidMode, switch_mode_lmt = SwitchModeLmt} = conf_scene:get(SceneId),
    IsValidMode = ValidMode =:= [] orelse lists:member(ToMode, ValidMode),
    if
        not IsExisted -> ?RC_BATTLE_BAD_MODE;
        SwitchModeLmt =:= ?NOT_SWITCH_MODE -> ?RC_BATTLE_NOT_SUPPORT_MODE;
        ToMode =:= ?MODE_GUILD andalso GuildId =< 0 -> ?RC_GUILD_HAVE_NO_GUILD;
        IsValidMode -> ?RC_SUCCEED;
        true -> ?RC_BATTLE_MODE_LMT
    end.

%% @doc 检测是否在普通场景(主城或野外)
ensure_in_normal_scene(Scene) ->
    lib_scene_api:is_normal_scene(Scene) orelse erlang:throw({error, ?RC_SCENE_ENTER_SCENE_LIMIT}).


%% Privates ---------------------------------------------------
%% 逐个检查进入需求
do_check_limit(RoleState, [{?LEVEL_LMT, MinLevel} | RestLmt]) ->
    #role_state{level = Level} = RoleState,
    Level >= MinLevel orelse throw({error, ?RC_SCENE_LEVEL_LIMIT}),
    do_check_limit(RoleState, RestLmt);
do_check_limit(_RoleState, []) ->
    ok.

do_check_line(SceneId, ?DYN_LINE_ID) ->
    case svr_scene_mgr:get_line_id(SceneId) of
        ?DYN_LINE_ID ->
            ?ERROR("svr_scene_mgr:get_line_id(~p) failed !", [SceneId]),
            throw({error, ?RC_SCENE_NO_SUCH_SCENE});
        LineId ->
            LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
            {LineId, LinePid}
    end;
do_check_line(SceneId, LineId) ->
    case svr_scene_mgr:get_line_pid(SceneId, LineId) of
        LinePid when is_pid(LinePid) -> {LineId, LinePid};
        _ -> do_check_line(SceneId, ?DYN_LINE_ID)
    end.

do_check_stat(Stat) ->
    lib_role_battle:is_in_jail(Stat) andalso throw({error, ?RC_SCENE_IN_JAIL}),
    lib_role_marry_rite:is_in_marry_parade(Stat) andalso throw({error, ?RC_MARRY_PARADE_IN}).
