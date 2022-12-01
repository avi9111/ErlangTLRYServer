%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_territory).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("territory.hrl").
-include("proto/prot_311.hrl").

%% API
-export([
    do/3,
    send_info/1
]).

-define(IN_ACTIVITY_CHECK(PS, InScene, Other),
    case catch in_activity_check(PS, InScene) of
        {error, Code} ->
            ?ERROR_TOC(PS, Code);
        __LineID when is_integer(__LineID) ->
            Other(__LineID)
    end).

do(31101, PS, _Req) ->
    send_info(PS);
do(31111, PS, _Req) ->
    enter(PS);
do(31113, PS, _Req) ->
    leave(PS);
do(31115, PS, #cs_territory_switch{room = Room}) ->
    switch(PS, Room);
do(31117, PS, #cs_territory_beat_drum{id = ID}) ->
    beat_drum(PS, ID);
do(31119, PS, _Req) ->
    get_rank(PS);
do(31121, PS, _Req) ->
    get_progress(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    svr_territory:get_info(PS#role_state.id).

enter(PS) ->
    ?IN_ACTIVITY_CHECK(PS, false, fun(_) ->
        svr_territory_mgr:enter(enter_info(PS))
    end).

leave(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    case lib_territory_mgr:is_relative_scene(SceneID) of
        true ->
            Rec = #sc_territory_leave{},
            {ok, Bin} = prot_msg:encode_msg(31114, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_scene_api:return_scene(PS);
        _ ->
            ignore
    end.

switch(PS, Room) ->
    ?IN_ACTIVITY_CHECK(PS, prepare, fun(_) ->
        svr_territory_mgr:switch_room(PS#role_state.id, Room)
    end).

beat_drum(PS, ID) ->
    case catch check_beat_drum(PS, ID) of
        {ok, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_TERRITORY_DRUM),
            Rec = #sc_territory_beat_drum{id = ID},
            {ok, Bin} = prot_msg:encode_msg(31118, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_beat_drum(PS, ID) ->
    LineID = in_activity_check(PS, battle),
    ConfDrum = conf_territory_drum:get(ID),
    ConfDrum =/= undefined orelse erlang:throw({error, ?RC_TERRITORY_DRUM_NOT_FOUND}),
    #{cost := Gold, study_id := StudyID} = ConfDrum,
    Costs = [{?AST_GOLD, Gold}],
    lib_role_assets:check_items_enough(PS, Costs),
    BuffLv = lib_guild:get_study_lv(PS#role_state.guild_id, StudyID) + 1,
    ok = ?MAKE_SURE(svr_territory_battle:beat_drum(LineID, PS#role_state.id, ID, BuffLv)),
    {ok, Costs}.

get_rank(PS) ->
    ?IN_ACTIVITY_CHECK(PS, battle, fun(LineID) ->
        svr_territory_battle:get_rank(LineID, PS#role_state.id)
    end).

get_progress(PS) ->
    ?IN_ACTIVITY_CHECK(PS, undefined, fun(_) ->
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_territory_mgr:get_progress(RoleID, GuildID)
    end).

in_activity_check(PS, Scene) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID} = RoleScene,
    scene_check(Scene, SceneID),
    Ongoing = lib_territory_mgr:is_ongoing(),
    Ongoing orelse erlang:throw({error, ?RC_TERRITORY_NOT_ONGOING}),
    LineID.

scene_check(battle, SceneID) ->
    lib_territory_mgr:is_battle_scene(SceneID) orelse erlang:throw({error, ?RC_TERRITORY_NOT_IN_BATTLE_SCENE});
scene_check(true, SceneID) ->
    lib_territory_mgr:is_relative_scene(SceneID) orelse erlang:throw({error, ?RC_TERRITORY_NOT_IN_SCENE});
scene_check(false, SceneID) ->
    ValidScene = lib_scene_api:is_normal_scene(SceneID) orelse lib_guild:is_seat_scene(SceneID),
    ValidScene orelse erlang:throw({error, ?RC_TERRITORY_ENTER_SCENE_LIMIT}),
    lib_territory_mgr:is_relative_scene(SceneID) andalso erlang:throw({error, ?RC_TERRITORY_ALREADY_IN_SCENE});
scene_check(_, _) ->
    true.

enter_info(PS) ->
    #role_state{id = RoleID, name = Name, guild_id = GuildID, sid = Sid,
        combat_power = Fight} = PS,
    ?territory_role_init#{
        id => RoleID, name => Name, guild_id => GuildID, fight => Fight,
        sid => Sid
    }.
