%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派守卫战
%%% @end
%%% Created : 24. 十月 2018 16:25
%%%-------------------------------------------------------------------
-module(lib_role_guild_defend).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("keyvalue.hrl").
-include("guild_defend.hrl").
-include("scene.hrl").
-include("proto/prot_511.hrl").

%% API
-export([
    do/3,
    enter/1,
    leave/1,
    role_leave/3,
    is_activity_scene/1,
    clean_up/0
]).

do(51101, PS, _Req) ->
    enter(PS);
do(51103, PS, _Req) ->
    leave(PS);
do(51114, PS, _Req) ->
    panel_info(PS);
do(51116, PS, _Req) ->
    score_rank(PS);
do(_, _, _) ->
    skip.

enter(PS) ->
    case catch check_enter(PS) of
        {ok, SceneID} ->
            #role_state{id = RoleID, career = Career, level = Lv, guild_id = GuildID, sid = RoleSid} = PS,
            EnterInfo = #guild_defend_role{id = RoleID, career = Career, lv = Lv},
            svr_guild_defend:enter(GuildID, EnterInfo),
            {ToX, ToY} = lib_scene_api:get_scene_born_pos(SceneID),
            SceneOpt = PS#role_state.scene_opt,
            NewSceneOpt = util:prop_store(realm, ?REALM_DEENFD, SceneOpt),
            NewPS = PS#role_state{scene_opt = NewSceneOpt},
            {ok, NewPS2} = lib_scene_api:change_scene(NewPS, SceneID, GuildID, ToX, ToY),
            Rec = #sc_guild_defend_enter{},
            {ok, Bin} = prot_msg:encode_msg(51102, Rec),
            lib_role_send:send_to_sid(RoleSid, Bin),
            lib_role_daily:add_counter(RoleID, ?KEY_DAILY_GUILD_DEFEND_ENTER_TIMES, 1),
            {ok, NewPS2};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter(PS) ->
    #role_state{role_scene = RoleScene, guild_id = GuildID} = PS,
    lib_scene_api:is_scene_of_types(RoleScene, ?ENTER_GUILD_ACTIVITY_SCENE_TYPES),
    EnterTimes = lib_role_kv:get_counter(PS#role_state.id, ?KEY_DAILY_GUILD_DEFEND_ENTER_TIMES),
    EnterTimes =:= 0 orelse erlang:throw({error, ?RC_GUILD_DEFEND_ALREADY_JOIN}),
    check_defend_stat(GuildID),
    common_check(PS, false).

leave(PS) ->
    case catch in_activity_check(PS, true) of
        {ok, _} ->
            #role_state{sid = RoleSid} = PS,
            Rec = #sc_guild_defend_leave{},
            {ok, Bin} = prot_msg:encode_msg(51104, Rec),
            lib_role_send:send_to_sid(RoleSid, Bin),
            SceneOpt = PS#role_state.scene_opt,
            NewSceneOpt = SceneOpt -- [{realm, ?REALM_DEENFD}],
            lib_scene_api:return_scene(PS#role_state{scene_opt = NewSceneOpt});
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

panel_info(PS) ->
    case catch  common_check(PS, true) of
        {ok, _} ->
            svr_guild_defend:panel_info(PS#role_state.guild_id, PS#role_state.sid);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

score_rank(PS) ->
    case catch common_check(PS, true) of
        {ok, _} ->
            svr_guild_defend:score_rank(PS#role_state.guild_id, PS#role_state.sid);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

common_check(PS, InScene) ->
    #role_state{guild_id = GuildID} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    is_pid(svr_guild_defend:p(GuildID)) orelse erlang:throw({error, ?RC_GUILD_DEFEND_NOT_OPEN}),
    in_activity_check(PS, InScene).

in_activity_check(PS, InScene) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = CurSceneID} = RoleScene,
    Ongoing = lib_activity:is_scheduled(?ACT_ID_GUILD_DEFEND),
    Ongoing orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    #{scene_id := SceneID} = conf_guild_defend:get(),
    NowInScene = CurSceneID =:= SceneID,
    (InScene =:= true andalso not NowInScene) andalso erlang:throw({error, ?RC_GUILD_DEFEND_NOT_IN_SCENE}),
    (InScene =:= false andalso NowInScene) andalso erlang:throw({error, ?RC_GUILD_DEFEND_ALREADY_IN_SCENE}),
    {ok, SceneID}.

check_defend_stat(GuildID) ->
    is_pid(svr_guild_defend:p(GuildID)) orelse erlang:throw({error, ?RC_GUILD_DEFEND_NOT_OPEN}),
    not svr_guild_defend:get_stat(GuildID) orelse erlang:throw({error, ?RC_GUILD_DEFEND_FINISH}).

role_leave(RoleID, LineId, CurSceneId) ->
    #{scene_id := SceneID} = conf_guild_defend:get(),
    ?iif(SceneID =:= CurSceneId, svr_guild_defend:leave(LineId, RoleID), skip).

is_activity_scene(SceneID) ->
    #{scene_id := DSceneID} = conf_guild_defend:get(),
    SceneID =:= DSceneID.

%% ======================== 在10节点上执行的操作============================
clean_up() ->
    #{scene_id := SceneID} = conf_guild_defend:get(),
    svr_scene_mgr:close_scene(SceneID).