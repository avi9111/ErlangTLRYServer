%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_master).
-author("Ryuu").

-include("role.hrl").
-include("master.hrl").
-include("ret_code.hrl").
-include("proto/prot_310.hrl").

%% API
-export([
    do/3,
    save/1,
    handle_info/2
]).

-compile({no_auto_import, [register/2]}).

handle_info({rob_begin, RoomID, Image}, PS) ->
    rob_begin(PS, RoomID, Image);
handle_info(_Info, _PS) ->
    ignore.

do(31001, PS, _) ->
    send_info(PS);
do(31003, PS, _) ->
    get_log(PS);
do(31005, PS, _) ->
    get_rank(PS);
do(31009, PS, #cs_master_register{opt = Opt}) ->
    register(PS, Opt);
do(31021, PS, _) ->
    chap(PS);
do(31023, PS, _) ->
    quit_chap(PS);
do(31025, PS, #cs_master_rob{id = TargetID}) ->
    rob(PS, TargetID);
do(31027, PS, _) ->
    quit_rob(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取活动信息
send_info(PS) ->
    svr_master:get_info(PS#role_state.id).

%% @doc 获取日志
get_log(PS) ->
    svr_master:get_log(PS#role_state.id).

%% @doc 获取排行榜
get_rank(PS) ->
    svr_master:get_rank(PS#role_state.id).

%% @doc
register(PS, Opt) ->
    svr_master:register(PS#role_state.id, Opt).

%% @doc 挑战
chap(PS) ->
    case catch check_chap(PS) of
        ok ->
            svr_master:chap(join_info(PS));
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_chap(PS) ->
    SceneId = (PS#role_state.role_scene)#role_scene.scene_id,
    lib_scene_check:ensure_in_normal_scene(SceneId),
    lib_master:is_ongoing() orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    ok.

quit_chap(PS) ->
    #role_state{role_scene = #role_scene{scene_id = SceneID}} = PS,
    case lib_master:is_chap_scene(SceneID) of
        true ->
            Rec = #sc_master_quit_chap{},
            {ok, Bin} = prot_msg:encode_msg(31024, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_scene_api:return_scene(PS);
        _ ->
            PS
    end.

%% @doc 掠夺
rob(PS, TargetID) ->
    case catch check_rob(PS, TargetID) of
        ok ->
            svr_master:rob(join_info(PS), TargetID);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_rob(PS, _TargetID) ->
    SceneId = (PS#role_state.role_scene)#role_scene.scene_id,
    lib_scene_check:ensure_in_normal_scene(SceneId),
    lib_master:is_ongoing() orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    ok.

quit_rob(PS) ->
    #role_state{role_scene = #role_scene{scene_id = SceneID}} = PS,
    case lib_master:is_rob_scene(SceneID) of
        true ->
            Rec = #sc_master_quit_rob{},
            {ok, Bin} = prot_msg:encode_msg(31028, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_scene_api:return_scene(PS);
        _ ->
            PS
    end.

%% @doc 掠夺
rob_begin(PS, RoomID, Image) ->
    SceneID = lib_master:rob_scene(),
    RobotOpts = [{realm, ?MASTER_CAMP_BLUE}],
    {RivalRole, RivalPets} = data_transfer:view_to_scene_role(Image, RobotOpts),
    svr_scene_agent:cast_scene(SceneID, RoomID, {'init_arena_rival', RivalRole, RivalPets}),
    {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
    PS1 = PS#role_state{scene_opt = [{realm, ?MASTER_CAMP_RED}]},
    {ok, PS2} = lib_scene_api:change_scene(PS1, SceneID, RoomID, X, Y),
    Rec = #sc_master_rob{},
    {ok, Bin} = prot_msg:encode_msg(31026, Rec),
    lib_role_send:send_to_role(PS2, Bin),
    PS2.

%% -----------------------------------------------------------------------------

%% @doc 下线
save(PS) ->
    register(PS, 0).

join_info(PS) ->
    #role_state{id = RoleID, name = Name, career = Career, guild_id = GuildID,
        guild_name = GuildName} = PS,
    #{id => RoleID, name => Name, career => Career, guild_id => GuildID,
        guild_name => GuildName}.
