-module(prot_420).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_420.hrl").


%% ---------------------------------------------------------------------------------------

decode(42001, _BinData) ->

    UnpackRecordData = #cs_team_get_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42002, BinData) ->
    {_RBin0, Team} = prot_util:unpack(BinData, {u,clt_team}),

    UnpackRecordData = #sc_team_get_info{
        team = Team
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42003, _BinData) ->

    UnpackRecordData = #cs_team_get_nearby{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42004, BinData) ->
    {_RBin0, Teams} = prot_util:unpack(BinData, [{u,clt_team_brief}]),

    UnpackRecordData = #sc_team_get_nearby{
        teams = Teams
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42005, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_team_target_list{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42006, BinData) ->
    {RBin0, Target} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Teams} = prot_util:unpack(RBin0, [{u,clt_team_brief}]),

    UnpackRecordData = #sc_team_target_list{
        target = Target,
        teams = Teams
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42007, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_team_create{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42008, BinData) ->
    {_RBin0, Team} = prot_util:unpack(BinData, {u,clt_team}),

    UnpackRecordData = #sc_team_create{
        team = Team
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42009, _BinData) ->

    UnpackRecordData = #cs_team_apply_list{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42010, BinData) ->
    {_RBin0, Roles} = prot_util:unpack(BinData, [{{64, unsigned}, string, {16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_team_apply_list{
        roles = Roles
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42011, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_team_match{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42012, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_team_match{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42013, BinData) ->
    {_RBin0, TeamId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_team_apply_for{
        team_id = TeamId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42014, BinData) ->
    {_RBin0, TeamId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_team_apply_for{
        team_id = TeamId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42015, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Accept} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_team_accept_apply{
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42016, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Accept} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_team_accept_apply{
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42017, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleName} = prot_util:unpack(RBin0, string),
    {RBin2, Level} = prot_util:unpack(RBin1, {16, unsigned}),
    {_RBin3, Career} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #sc_team_notify_apply{
        role_id = RoleId,
        role_name = RoleName,
        level = Level,
        career = Career
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42018, BinData) ->
    {_RBin0, TeamId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_team_apply_reject{
        team_id = TeamId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42019, BinData) ->
    {_RBin0, Member} = prot_util:unpack(BinData, {u,clt_team_member}),

    UnpackRecordData = #sc_team_new_member{
        member = Member
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42020, BinData) ->
    {_RBin0, Team} = prot_util:unpack(BinData, {u,clt_team}),

    UnpackRecordData = #sc_team_join_new{
        team = Team
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42021, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_team_invite_join{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42022, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_team_invite_join{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42023, BinData) ->
    {RBin0, TeamId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Accept} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_team_accept_invite{
        team_id = TeamId,
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42024, BinData) ->
    {RBin0, TeamId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Accept} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_team_accept_invite{
        team_id = TeamId,
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42025, BinData) ->
    {RBin0, TeamId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Name} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #sc_team_new_invite{
        team_id = TeamId,
        role_id = RoleId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42026, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_team_invite_reject{
        role_id = RoleId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42027, _BinData) ->

    UnpackRecordData = #cs_team_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42028, _BinData) ->

    UnpackRecordData = #sc_team_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42029, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_team_kick_out{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42030, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_team_kick_out{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42031, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_team_member_leave{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42032, _BinData) ->

    UnpackRecordData = #sc_team_notify_kick_out{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42033, _BinData) ->

    UnpackRecordData = #cs_team_recruit{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42034, _BinData) ->

    UnpackRecordData = #sc_team_recruit{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42035, BinData) ->
    {RBin0, Target} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Min} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Max} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #cs_team_set_target{
        target = Target,
        min = Min,
        max = Max
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42036, BinData) ->
    {RBin0, Target} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Min} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Max} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_team_set_target{
        target = Target,
        min = Min,
        max = Max
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42037, BinData) ->
    {_RBin0, Match} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_team_set_match{
        match = Match
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42038, BinData) ->
    {RBin0, Match} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, MatchBeg} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_team_set_match{
        match = Match,
        match_beg = MatchBeg
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42039, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_team_demise_leader{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42040, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_team_demise_leader{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42041, _BinData) ->

    UnpackRecordData = #cs_team_promote_request{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42042, _BinData) ->

    UnpackRecordData = #sc_team_promote_request{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42043, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Opt} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_team_accept_promote{
        role_id = RoleId,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42044, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Opt} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_team_accept_promote{
        role_id = RoleId,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42045, BinData) ->
    {_RBin0, Leader} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_team_notify_leader_demise{
        leader = Leader
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42046, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_team_notify_promote_request{
        role_id = RoleId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42047, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {_RBin2, Opt} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_team_notify_accept_promote{
        role_id = RoleId,
        name = Name,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42049, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_team_follow{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42050, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_team_follow{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42051, BinData) ->
    {_RBin0, State} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_team_sync_state{
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42052, BinData) ->
    {_RBin0, State} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_team_sync_state{
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42053, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_team_notify_follow{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42054, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, State} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_team_notify_sync_state{
        role_id = RoleId,
        state = State
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42055, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_team_mem_pos{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42056, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, SceneId} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, LineId} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, X} = prot_util:unpack(RBin2, {16, unsigned}),
    {_RBin4, Y} = prot_util:unpack(RBin3, {16, unsigned}),

    UnpackRecordData = #sc_team_mem_pos{
        role_id = RoleId,
        scene_id = SceneId,
        line_id = LineId,
        x = X,
        y = Y
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42057, BinData) ->
    {_RBin0, Assist} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_team_assist{
        assist = Assist
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42058, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Assist} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_team_assist{
        role_id = RoleId,
        assist = Assist
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42059, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, List} = prot_util:unpack(RBin0, [{{8, unsigned}, {64, unsigned}}]),

    UnpackRecordData = #sc_team_member_attr{
        role_id = RoleId,
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42060, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, TeamId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_team_change{
        role_id = RoleId,
        team_id = TeamId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42061, BinData) ->
    {_RBin0, Command} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_team_command{
        command = Command
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42062, BinData) ->
    {_RBin0, Command} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_team_command{
        command = Command
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42063, BinData) ->
    {RBin0, Min} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Max} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_team_set_level{
        min = Min,
        max = Max
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42064, BinData) ->
    {RBin0, Min} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Max} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_team_set_level{
        min = Min,
        max = Max
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42065, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, X} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Y} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_team_sync_pos{
        role_id = RoleId,
        x = X,
        y = Y
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42071, BinData) ->
    {_RBin0, RobotCid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_kick_robot{
        robot_cid = RobotCid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42072, BinData) ->
    {_RBin0, RobotCid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_kick_robot{
        robot_cid = RobotCid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42073, _BinData) ->

    UnpackRecordData = #cs_add_robot{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(42074, BinData) ->
    {_RBin0, Ids} = prot_util:unpack(BinData, [{8, unsigned}]),

    UnpackRecordData = #sc_add_robot{
        ids = Ids
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(42001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42002, PackRecordData) ->
    Team = prot_util:pack(PackRecordData#sc_team_get_info.team, {u,clt_team}),

    BinData = <<
        Team/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42003, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42004, PackRecordData) ->
    Teams = prot_util:pack(PackRecordData#sc_team_get_nearby.teams, [{u,clt_team_brief}]),

    BinData = <<
        Teams/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42005, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_team_target_list.target, {16, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42006, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_team_target_list.target, {16, unsigned}),
    Teams = prot_util:pack(PackRecordData#sc_team_target_list.teams, [{u,clt_team_brief}]),

    BinData = <<
        Target/binary,
        Teams/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42007, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_team_create.target, {16, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42008, PackRecordData) ->
    Team = prot_util:pack(PackRecordData#sc_team_create.team, {u,clt_team}),

    BinData = <<
        Team/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42009, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42010, PackRecordData) ->
    Roles = prot_util:pack(PackRecordData#sc_team_apply_list.roles, [{{64, unsigned}, string, {16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Roles/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42011, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_team_match.target, {16, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42012, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_team_match.target, {16, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42013, PackRecordData) ->
    TeamId = prot_util:pack(PackRecordData#cs_team_apply_for.team_id, {64, unsigned}),

    BinData = <<
        TeamId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42014, PackRecordData) ->
    TeamId = prot_util:pack(PackRecordData#sc_team_apply_for.team_id, {64, unsigned}),

    BinData = <<
        TeamId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42015, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_team_accept_apply.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#cs_team_accept_apply.accept, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42016, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_accept_apply.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#sc_team_accept_apply.accept, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42017, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_notify_apply.role_id, {64, unsigned}),
    RoleName = prot_util:pack(PackRecordData#sc_team_notify_apply.role_name, string),
    Level = prot_util:pack(PackRecordData#sc_team_notify_apply.level, {16, unsigned}),
    Career = prot_util:pack(PackRecordData#sc_team_notify_apply.career, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        RoleName/binary,
        Level/binary,
        Career/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42018, PackRecordData) ->
    TeamId = prot_util:pack(PackRecordData#sc_team_apply_reject.team_id, {64, unsigned}),

    BinData = <<
        TeamId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42019, PackRecordData) ->
    Member = prot_util:pack(PackRecordData#sc_team_new_member.member, {u,clt_team_member}),

    BinData = <<
        Member/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42020, PackRecordData) ->
    Team = prot_util:pack(PackRecordData#sc_team_join_new.team, {u,clt_team}),

    BinData = <<
        Team/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42021, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_team_invite_join.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42022, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_team_invite_join.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42023, PackRecordData) ->
    TeamId = prot_util:pack(PackRecordData#cs_team_accept_invite.team_id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#cs_team_accept_invite.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#cs_team_accept_invite.accept, {8, unsigned}),

    BinData = <<
        TeamId/binary,
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42024, PackRecordData) ->
    TeamId = prot_util:pack(PackRecordData#sc_team_accept_invite.team_id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#sc_team_accept_invite.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#sc_team_accept_invite.accept, {8, unsigned}),

    BinData = <<
        TeamId/binary,
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42025, PackRecordData) ->
    TeamId = prot_util:pack(PackRecordData#sc_team_new_invite.team_id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#sc_team_new_invite.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_team_new_invite.name, string),

    BinData = <<
        TeamId/binary,
        RoleId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42026, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_invite_reject.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_team_invite_reject.name, string),

    BinData = <<
        RoleId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42027, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42028, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42029, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_team_kick_out.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42030, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_team_kick_out.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42031, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_member_leave.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42032, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42033, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42034, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42035, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_team_set_target.target, {16, unsigned}),
    Min = prot_util:pack(PackRecordData#cs_team_set_target.min, {16, unsigned}),
    Max = prot_util:pack(PackRecordData#cs_team_set_target.max, {16, unsigned}),

    BinData = <<
        Target/binary,
        Min/binary,
        Max/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42036, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_team_set_target.target, {16, unsigned}),
    Min = prot_util:pack(PackRecordData#sc_team_set_target.min, {16, unsigned}),
    Max = prot_util:pack(PackRecordData#sc_team_set_target.max, {16, unsigned}),

    BinData = <<
        Target/binary,
        Min/binary,
        Max/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42037, PackRecordData) ->
    Match = prot_util:pack(PackRecordData#cs_team_set_match.match, {8, unsigned}),

    BinData = <<
        Match/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42038, PackRecordData) ->
    Match = prot_util:pack(PackRecordData#sc_team_set_match.match, {8, unsigned}),
    MatchBeg = prot_util:pack(PackRecordData#sc_team_set_match.match_beg, {32, unsigned}),

    BinData = <<
        Match/binary,
        MatchBeg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42039, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_team_demise_leader.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42040, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_team_demise_leader.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42041, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42042, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42043, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_team_accept_promote.role_id, {64, unsigned}),
    Opt = prot_util:pack(PackRecordData#cs_team_accept_promote.opt, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42044, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_accept_promote.role_id, {64, unsigned}),
    Opt = prot_util:pack(PackRecordData#sc_team_accept_promote.opt, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42045, PackRecordData) ->
    Leader = prot_util:pack(PackRecordData#sc_team_notify_leader_demise.leader, {64, unsigned}),

    BinData = <<
        Leader/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42046, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_notify_promote_request.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_team_notify_promote_request.name, string),

    BinData = <<
        RoleId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42047, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_notify_accept_promote.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_team_notify_accept_promote.name, string),
    Opt = prot_util:pack(PackRecordData#sc_team_notify_accept_promote.opt, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42049, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#cs_team_follow.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42050, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#sc_team_follow.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42051, PackRecordData) ->
    State = prot_util:pack(PackRecordData#cs_team_sync_state.state, {8, unsigned}),

    BinData = <<
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42052, PackRecordData) ->
    State = prot_util:pack(PackRecordData#sc_team_sync_state.state, {8, unsigned}),

    BinData = <<
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42053, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#sc_team_notify_follow.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42054, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_notify_sync_state.role_id, {64, unsigned}),
    State = prot_util:pack(PackRecordData#sc_team_notify_sync_state.state, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        State/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42055, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_team_mem_pos.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42056, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_mem_pos.role_id, {64, unsigned}),
    SceneId = prot_util:pack(PackRecordData#sc_team_mem_pos.scene_id, {32, unsigned}),
    LineId = prot_util:pack(PackRecordData#sc_team_mem_pos.line_id, {64, unsigned}),
    X = prot_util:pack(PackRecordData#sc_team_mem_pos.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_team_mem_pos.y, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        SceneId/binary,
        LineId/binary,
        X/binary,
        Y/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42057, PackRecordData) ->
    Assist = prot_util:pack(PackRecordData#cs_team_assist.assist, {8, unsigned}),

    BinData = <<
        Assist/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42058, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_assist.role_id, {64, unsigned}),
    Assist = prot_util:pack(PackRecordData#sc_team_assist.assist, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Assist/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42059, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_member_attr.role_id, {64, unsigned}),
    List = prot_util:pack(PackRecordData#sc_team_member_attr.list, [{{8, unsigned}, {64, unsigned}}]),

    BinData = <<
        RoleId/binary,
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42060, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_change.role_id, {64, unsigned}),
    TeamId = prot_util:pack(PackRecordData#sc_team_change.team_id, {64, unsigned}),

    BinData = <<
        RoleId/binary,
        TeamId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42061, PackRecordData) ->
    Command = prot_util:pack(PackRecordData#cs_team_command.command, string),

    BinData = <<
        Command/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42062, PackRecordData) ->
    Command = prot_util:pack(PackRecordData#sc_team_command.command, string),

    BinData = <<
        Command/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42063, PackRecordData) ->
    Min = prot_util:pack(PackRecordData#cs_team_set_level.min, {16, unsigned}),
    Max = prot_util:pack(PackRecordData#cs_team_set_level.max, {16, unsigned}),

    BinData = <<
        Min/binary,
        Max/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42064, PackRecordData) ->
    Min = prot_util:pack(PackRecordData#sc_team_set_level.min, {16, unsigned}),
    Max = prot_util:pack(PackRecordData#sc_team_set_level.max, {16, unsigned}),

    BinData = <<
        Min/binary,
        Max/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42065, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_team_sync_pos.role_id, {64, unsigned}),
    X = prot_util:pack(PackRecordData#sc_team_sync_pos.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#sc_team_sync_pos.y, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        X/binary,
        Y/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42071, PackRecordData) ->
    RobotCid = prot_util:pack(PackRecordData#cs_kick_robot.robot_cid, {8, unsigned}),

    BinData = <<
        RobotCid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42072, PackRecordData) ->
    RobotCid = prot_util:pack(PackRecordData#sc_kick_robot.robot_cid, {8, unsigned}),

    BinData = <<
        RobotCid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42073, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(42074, PackRecordData) ->
    Ids = prot_util:pack(PackRecordData#sc_add_robot.ids, [{8, unsigned}]),

    BinData = <<
        Ids/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

