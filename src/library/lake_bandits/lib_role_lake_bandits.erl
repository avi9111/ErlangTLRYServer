%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     镜湖剿匪
%%% @end
%%% Created : 05. 十一月 2018 8:49
%%%-------------------------------------------------------------------
-module(lib_role_lake_bandits).

-include("role.hrl").
-include("op_type.hrl").
-include("scene.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("lake_bandits.hrl").
-include("proto/prot_513.hrl").

%% API
-export([
    do/3,
    event/2
]).

do(51301, PS, #cs_lake_bandits_enter{}) ->
    enter(PS);
%%do(51303, PS, #cs_lake_bandits_leave{}) ->
%%    leave(PS);
do(51305, PS, #cs_lake_bandits_switch{line_id = LineID}) ->
    switch(PS, LineID);
do(51312, PS, _Req) ->
    get_role_list(PS);
do(51314, PS, #cs_lake_bandits_dragon_mon{line_id = LineID}) ->
    get_mon_list(PS, LineID);
do(_, _, _) ->
    skip.

event(PS, 'scene_changed') ->
    #role_state{role_scene = RoleScene, id = RoleID} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID} = RoleScene,
    SceneID =:= ?SCENE_ID_LAKE_BANDITS andalso svr_lake_bandits:enter_scene(RoleID, LineID).

%% 进入
enter(PS) ->
    case catch check_enter(PS) of
        {ok, SceneID} ->
            svr_lake_bandits:enter_check(PS#role_state.id, PS#role_state.sid, SceneID),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter(PS) ->
    CurSceneID = (PS#role_state.role_scene)#role_scene.scene_id,
    lib_scene_check:ensure_in_normal_scene(CurSceneID),
    #role_state{level = Lv} = PS,
    #{open_lv := OpenLv, scene := SceneID} = conf_lake_bandits_info:get(),
    Lv >= OpenLv orelse erlang:throw({error, ?RC_CHANNEL_ROLE_LV_LIMIT}),
    NowInScene = CurSceneID =:= SceneID,
    NowInScene andalso erlang:throw({error, ?RC_LAKE_BANDITSD_ALREADY_IN_SCENE}),
    {ok, SceneID}.

%%%% 离开
%%leave(PS) ->
%%    case catch check_leave(PS) of
%%        {ok, _} ->
%%            MsgRecord = #sc_lake_bandits_leave{},
%%            {ok, Bin} = prot_msg:encode_msg(51304, MsgRecord),
%%            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
%%            %% 由于这个活动要求拉队员，改成了野外场景，退出按钮绑定洛阳
%%            SceneID = 10000,
%%            {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
%%            lib_scene_api:change_scene_async(PS#role_state.id, SceneID, 0, X, Y);
%%        {error, Code} ->
%%            ?ERROR_TOC(PS, Code)
%%    end.

%%check_leave(PS) ->
%%    CurSceneID = (PS#role_state.role_scene)#role_scene.scene_id,
%%    #{scene := SceneID} = conf_lake_bandits_info:get(),
%%    NowInScene = CurSceneID =:= SceneID,
%%    NowInScene orelse erlang:throw({error, ?RC_LAKE_BANDITSD_NOT_IN_SCENE}),
%%    {ok, SceneID}.

%% 切换场景
switch(PS, ToLineID) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = RoleScene} = PS,
    #role_scene{line_id = LineID} = RoleScene,
    case catch check_switch(PS, ToLineID, LineID) of
        {ok, SceneID} ->
            svr_lake_bandits:switch(RoleID, RoleSid, SceneID, ToLineID, LineID),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_switch(_PS, ToLineID, CurLineID) ->
    ToLineID =/= CurLineID orelse erlang:throw({error, ?RC_LAKE_BANDITS_ALREADY_IN_THIS_LINE}),
    #{scene := SceneID} = conf_lake_bandits_info:get(),
    {ok, SceneID}.


get_role_list(PS) ->
    case catch in_activity_check(PS, true) of
        {ok, _} ->
            svr_lake_bandits:get_role_list(PS#role_state.sid),
            ok;
        _ ->
            MsgRecord = #sc_lake_bandits_dragon_role{line_role_num = []},
            {ok, Bin} = prot_msg:encode_msg(51313, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin)
    end.

get_mon_list(PS, LineID) ->
    case catch in_activity_check(PS, true) of
        {ok, _} ->
            svr_lake_bandits:get_mon_list(PS#role_state.id, PS#role_state.sid, LineID),
            ok;
        _ ->
            MsgRecord = #sc_lake_bandits_dragon_mon{mon_list = []},
            {ok, Bin} = prot_msg:encode_msg(51315, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin)
    end.

in_activity_check(PS, InScene) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = CurSceneID} = RoleScene,
    Ongoing = lib_activity:is_scheduled(?ACT_ID_LAKE_BANDITS),
    Ongoing orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    #{scene := SceneID} = conf_lake_bandits_info:get(),
    NowInScene = CurSceneID =:= SceneID,
    (InScene =:= true andalso not NowInScene) andalso erlang:throw({error, ?RC_LAKE_BANDITSD_NOT_IN_SCENE}),
    (InScene =:= false andalso NowInScene) andalso erlang:throw({error, ?RC_LAKE_BANDITSD_ALREADY_IN_SCENE}),
    {ok, SceneID}.