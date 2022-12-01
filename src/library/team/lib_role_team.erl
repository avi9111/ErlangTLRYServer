%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     组队
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_team).
-author("Ryuu").

-include("role.hrl").
-include("team.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("scene_objs.hrl").
-include("proto/prot_420.hrl").

-export([
    do/3,
    key/1,
    init/1,
    save/1,
    event/2,
    invite/2,
    fmt_pos/1,
    send_info/1,
    broadcast/2,
    broadcast/3,
    get_follow/1,
    handle_info/2,
    create_team/2,
    get_scene_team/1,
    get_nearby_team/1,
    broadcast_except/2
]).


-define(TEAM_CHECK(PS, Other), ?TEAM_CHECK(PS, Other, 0)).

-define(TEAM_CHECK(PS, Other, CD),
    case catch team_check(PS, ?FUNCTION_NAME, CD) of
        {error, Code} -> ?ERROR_TOC(PS, Code);
        _ -> Other
    end).

-define(HAVE_TEAM_CHECK(PS, Other), ?HAVE_TEAM_CHECK(PS, Other, 0)).

-define(HAVE_TEAM_CHECK(PS, Other, CD),
    case catch have_team_check(PS, ?FUNCTION_NAME, CD) of
        {error, Code} -> ?ERROR_TOC(PS, Code);
        _ -> Other
    end).

-define(NO_TEAM_CHECK(PS, Other), ?NO_TEAM_CHECK(PS, Other, 0)).

-define(NO_TEAM_CHECK(PS, Other, CD),
    case catch no_team_check(PS, ?FUNCTION_NAME, CD) of
        {error, Code} -> ?ERROR_TOC(PS, Code);
        _ -> Other
    end).

do(42001, PS, _Req) ->
    send_info(PS);
do(42003, PS, _Req) ->
    get_nearby_team(PS);
do(42005, PS, #cs_team_target_list{target = Target}) ->
    get_target_teams(PS, Target);
do(42007, PS, #cs_team_create{target = Target}) ->
    create_team(PS, Target);
do(42009, PS, _Req) ->
    get_apply_list(PS);
do(42011, PS, #cs_team_match{target = Target}) ->
    match_team(PS, Target);
do(42013, PS, #cs_team_apply_for{team_id = TeamID}) ->
    apply_for(PS, TeamID);
do(42015, PS, #cs_team_accept_apply{role_id = TargetID, accept = Option}) ->
    accept_apply(PS, TargetID, Option);
do(42021, PS, #cs_team_invite_join{target = TargetID}) ->
    invite(PS, TargetID);
do(42023, PS, #cs_team_accept_invite{team_id = TeamID, role_id = TargetID, accept = Option}) ->
    accept_invite(PS, TeamID, TargetID, Option);
do(42027, PS, _Req) ->
    leave_team(PS);
do(42029, PS, #cs_team_kick_out{target = TargetID}) ->
    kick_out(PS, TargetID);
do(42033, PS, _Req) ->
    recruit(PS);
do(42035, PS, #cs_team_set_target{target = Target, min = MinLv, max = MaxLv}) ->
    set_team_target(PS, Target, MinLv, MaxLv);
do(42037, PS, #cs_team_set_match{match = Match}) ->
    set_team_match(PS, Match);
do(42039, PS, #cs_team_demise_leader{target = TargetID}) ->
    demise(PS, TargetID);
do(42041, PS, #cs_team_promote_request{}) ->
    promote_request(PS);
do(42043, PS, #cs_team_accept_promote{role_id = TargetID, opt = Opt}) ->
    accept_promote(PS, TargetID, Opt);
do(42049, PS, #cs_team_follow{opt = Opt}) ->
    set_follow(PS, Opt);
do(42051, PS, #cs_team_sync_state{state = State}) ->
    sync_state(PS, State);
do(42055, PS, #cs_team_mem_pos{role_id = Target}) ->
    get_member_pos(PS, Target);
do(42057, PS, #cs_team_assist{assist = Assist}) ->
    set_assist(PS, Assist);
do(42061, PS, #cs_team_command{command = Command}) ->
    team_command(PS, Command);
do(42063, PS, #cs_team_set_level{min = MinLv, max = MaxLv}) ->
    set_level(PS, MinLv, MaxLv);
do(42071, PS, #cs_kick_robot{robot_cid = RobotCid}) ->
    kick_robot(PS, RobotCid);
do(42073, PS, #cs_add_robot{}) ->
    add_robot(PS);
do(_Cmd, _PS, _Data) ->
    ignore.

handle_info('init', PS) ->
    online(PS);
handle_info({'team_changed', TeamInfo, Type}, PS) ->
    team_changed(PS, TeamInfo, Type);
handle_info('clear_team', PS) ->
    team_changed(PS, ?team, ?TEAM_CHANGE_CLEAR);
handle_info({'get_member_pos_req', FRoleID}, PS) ->
    get_member_pos_req(PS, FRoleID);
handle_info({'get_member_pos_resp', Pos}, PS) ->
    get_member_pos_resp(PS, Pos);
handle_info({'get_scene_team', TeamList}, PS) ->
    get_scene_team(PS, TeamList);
handle_info({'update_fllow', Follow}, PS) ->
    lib_scene_api:update({'follow', Follow}, PS);
handle_info(_Info, _PS) ->
    ok.

event(PS, 'level_up') ->
    level_up(PS);
event(PS, 'scene_changed') ->
    scene_changed(PS);
event(PS, 'switch') ->
    online(PS);
event(PS, 'hanging') ->
    offline(PS);
event(_PS, _) ->
    ok.

init(_PS) ->
    lib_role:mod_after(0, ?MODULE, init),
    ok.

online(PS) ->
    svr_team_mgr:online(init_info(PS)).

save(PS) ->
    offline(PS).

offline(PS) ->
    svr_team_mgr:offline(key(PS)).

send_info(PS) ->
    svr_team_mgr:get_role_team(init_info(PS)).

create_team(PS, Target) ->
    ?NO_TEAM_CHECK(PS, begin
        RoleInfo = init_info(PS),
        svr_team_mgr:create_team(RoleInfo, Target)
    end, 2).

leave_team(PS) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:leave_team(key(PS))
    end).

apply_for(PS, TeamID) ->
    ?NO_TEAM_CHECK(PS, begin
        RoleInfo = init_info(PS),
        svr_team_mgr:apply_for(RoleInfo, TeamID)
    end, 1).

get_apply_list(PS) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:get_apply_list(key(PS))
    end, 2).

accept_apply(PS, TargetID, Option) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:accept_apply(key(PS), TargetID, Option)
    end).

invite(PS, TargetID) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:invite(key(PS), TargetID)
    end, 2).

accept_invite(PS, TeamID, TargetID, Option) ->
    ?NO_TEAM_CHECK(PS, begin
        RoleInfo = init_info(PS),
        svr_team_mgr:accept_invite(RoleInfo, TeamID, TargetID, Option)
    end).

kick_out(PS, TargetID) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:kick_out(key(PS), TargetID)
    end, 1).

demise(PS, TargetID) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:demise(key(PS), TargetID)
    end, 1).

promote_request(PS) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:promote_request(key(PS))
    end, 15).

accept_promote(PS, TargetID, Opt) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:accept_promote(key(PS), TargetID, Opt)
    end, 1).

get_nearby_team(PS) ->
    ?TEAM_CHECK(PS, begin
        #role_state{id = RoleID, role_scene = RoleScene} = PS,
        #role_scene{line_pid = LinePid} = RoleScene,
        svr_scene_agent:apply_cast(LinePid, ?MODULE, get_scene_team, [RoleID])
    end, 5).

get_scene_team(RoleID) ->
    case lib_scene_agent:get_roler(RoleID) of
        #scene_role{id = RoleID, server_num = SvrNum} ->
            List = lib_scene_agent:get_scene_roler_fields([#scene_role.team, #scene_role.server_num]),
            TeamIDs = util:list_uniq([RTeamID || [RTeamID, RSvrNum] <- List, RTeamID > 0, RSvrNum =:= SvrNum]),
            TeamList = util:list_rand_n(TeamIDs, ?TEAM_NEARBY_TEAM_NUM),
            spawn(fun() ->
                case util_svr:get_node_id() of
                    NodeID when NodeID >= ?NODE_ID_CLUSTER ->
                        lib_role:mod_info(RoleID, ?MODULE, {get_scene_team, TeamList}),
                        ignore;
                    NodeID when NodeID >= ?NODE_ID_GAME andalso NodeID < ?NODE_ID_KFCENTER ->
                        svr_team_mgr:get_nearby_team(RoleID, TeamList);
                    _ ->
                        ignore
                end
            end);
        _ ->
            ignore
    end.

get_scene_team(PS, TeamList) ->
    svr_team_mgr:get_nearby_team(key(PS), TeamList).

get_target_teams(PS, Target) ->
    ?TEAM_CHECK(PS, begin
        svr_team_mgr:get_target_teams(key(PS), Target)
    end, 1).

set_team_target(PS, Target, MinLv, MaxLv) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:set_team_target(key(PS), Target, MinLv, MaxLv)
    end, 1).

set_team_match(PS, Match) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:set_team_match(key(PS), Match)
    end, 1).

recruit(PS) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:recruit(key(PS))
    end, 30).

match_team(PS, Target) ->
    ?NO_TEAM_CHECK(PS, begin
        svr_team_mgr:match_teams(init_info(PS), Target)
    end, 1).

set_follow(PS, Opt) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:set_follow(key(PS), Opt)
    end, 1).

sync_state(PS, State) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:sync_state(key(PS), State)
    end, 0).

get_member_pos(PS, Target) ->
    ?HAVE_TEAM_CHECK(PS, begin
        lib_role:mod_info(Target, ?MODULE, {get_member_pos_req, PS#role_state.id})
    end, 0).

get_member_pos_req(PS, FRoleID) ->
    lib_role:mod_info(FRoleID, ?MODULE, {get_member_pos_resp, fmt_pos(PS)}).

get_member_pos_resp(PS, Pos) ->
    {RoleID, TSceneID, TLineID, _, TX, TY} = Pos,
    Rec = #sc_team_mem_pos{
        role_id = RoleID, scene_id = TSceneID, line_id = TLineID, x = TX, y = TY
    },
    {ok, Bin} = prot_msg:encode_msg(42056, Rec),
    lib_role_send:send_to_role(PS, Bin).

set_assist(PS, Assist) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:set_assist(key(PS), Assist)
    end, 1).

team_command(PS, Command) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:team_command(key(PS), Command)
    end, 0).

set_level(PS, MinLv, MaxLv) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:set_level(key(PS), MinLv, MaxLv)
    end, 1).

kick_robot(PS, RobotCid) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:kick_robot(key(PS), RobotCid)
    end, 1).

add_robot(PS) ->
    ?HAVE_TEAM_CHECK(PS, begin
        svr_team_mgr:add_robot(key(PS))
    end, 1).

%% -----------------------------------------------------------------------------

have_team_check(PS, FunName, CD) ->
    team_check(PS, FunName, true, CD).

no_team_check(PS, FunName, CD) ->
    team_check(PS, FunName, false, CD).

team_check(PS, FunName, CD) ->
    team_check(PS, FunName, skip, CD).

team_check(PS, FunName, NeedTeam, CD) ->
    #role_state{team_id = TeamID, level = _Level} = PS,
    if
        NeedTeam =:= true andalso TeamID =< 0 ->
            erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM});
        NeedTeam =:= false andalso TeamID > 0 ->
            erlang:throw({error, ?RC_TEAM_ALREADY_HAVE_TEAM});
        true ->
            ignore
    end,
    CD > 0 andalso util:check_action_limit({?MODULE, FunName}, CD),
    ok.

%% -----------------------------------------------------------------------------

team_changed(PS, TeamInfo, _Type) ->
    #role_state{id = RoleID, team_id = OTeamID, role_scene = RoleScene} = PS,
    #role_scene{line_pid = LinePid} = RoleScene,
    #{id := TeamID} = TeamInfo,
    PS1 = PS#role_state{team_id = TeamID},
    if
        OTeamID =:= TeamID ->
            svr_scene_agent:apply_cast(LinePid, lib_team_agent, update_team_info, [TeamInfo]);
        TeamID > 0 ->
            svr_scene_agent:apply_cast(LinePid, lib_team_agent, set_role_team, [RoleID, TeamInfo]),
            notify_team(PS1);
        true ->
            svr_scene_agent:apply_cast(LinePid, lib_team_agent, set_role_team, [RoleID, TeamInfo]),
            notify_team(PS1)
    end,
    {ok, PS1}.

notify_team(PS) ->
    ?EVENT(PS#role_state.id, 'team_changed'),
    #role_state{id = RoleID, team_id = TeamID} = PS,
    ScenePkMsg = #sc_team_change{
        role_id = RoleID, team_id = TeamID
    },
    {ok, BinData} = prot_msg:encode_msg(42060, ScenePkMsg),
    lib_role_send:send_to_area_scene(PS, BinData).

level_up(PS) ->
    attr_change(PS, level, PS#role_state.level).

scene_changed(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID} = RoleScene,
    attr_change(PS, [{scene, SceneID}, {line, LineID}]).

attr_change(PS, Key, Value) ->
    attr_change(PS, [{Key, Value}]).

attr_change(PS, List) when is_record(PS, role_state) ->
    RoleKey = key(PS),
    svr_team_mgr:attr_change(RoleKey, List).

broadcast_except(PS, Bin) ->
    broadcast(PS, Bin, [key(PS)]).

broadcast(PS, Bin) ->
    broadcast(PS, Bin, []).

broadcast(PS, Bin, Except) when is_record(PS, role_state) ->
    #role_state{team_id = TeamID} = PS,
    broadcast(TeamID, Bin, Except);
broadcast(TeamID, Bin, Except) when is_integer(TeamID), TeamID > 0 ->
    svr_team_mgr:broadcast_except(TeamID, Bin, Except);
broadcast(_TeamID, _Bin, _Except) ->
    ignore.

get_follow(RoleID) ->
    case lib_team:get_role_team(RoleID) of
        #{leader := Leader, follow := 1} when RoleID =/= Leader ->
            Leader;
        _ ->
            0
    end.

%% -----------------------------------------------------------------------------

key(PS) ->
    #role_state{id = RoleID} = PS,
    RoleID.

fmt_pos(PS) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, line_pid = LinePid,
        x = X, y = Y} = RoleScene,
    {RoleID, SceneID, LineID, LinePid, X, Y}.

init_info(PS) ->
    #role_state{id = RoleID, career = Career, name = Name, level = Level,
        gender = Sex, combat_power = Fight, role_scene = RoleScene,
        personal = #{icon := Icon, frame := Frame}} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID} = RoleScene,
    ?team_role_init#{
        id => RoleID, career => Career, name => Name, key => key(PS),
        fight => Fight, level => Level, gender => Sex, scene => SceneID,
        pid => self(), icon => Icon, frame => Frame, line => LineID
    }.
