-module(prot_545).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_545.hrl").


%% ---------------------------------------------------------------------------------------

decode(54501, _BinData) ->

    UnpackRecordData = #cs_fight_team_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54502, BinData) ->
    {_RBin0, FightTeam} = prot_util:unpack(BinData, {u,clt_fight_team}),

    UnpackRecordData = #sc_fight_team_info{
        fight_team = FightTeam
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54503, BinData) ->
    {_RBin0, Name} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_fight_team_create{
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54504, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_create{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54506, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_fight_team_invite_join{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54507, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_invite_join{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54508, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Accept} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_fight_team_accept_invite{
        id = Id,
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54509, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Accept} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_fight_team_accept_invite{
        id = Id,
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54510, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, RoleId} = prot_util:unpack(RBin1, {64, unsigned}),
    {_RBin3, RoleName} = prot_util:unpack(RBin2, string),

    UnpackRecordData = #sc_fight_team_new_invite{
        id = Id,
        name = Name,
        role_id = RoleId,
        role_name = RoleName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54511, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_fight_team_invite_reject{
        role_id = RoleId,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54512, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_fight_team_apply_for{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54513, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_apply_for{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54514, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Accept} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_fight_team_accept_apply{
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54515, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Accept} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_fight_team_accept_apply{
        role_id = RoleId,
        accept = Accept
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54516, _BinData) ->

    UnpackRecordData = #sc_fight_team_notify_apply{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54517, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_apply_reject{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54518, BinData) ->
    {_RBin0, Name} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_fight_team_new_member{
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54519, BinData) ->
    {_RBin0, FightTeam} = prot_util:unpack(BinData, {u,clt_fight_team}),

    UnpackRecordData = #sc_fight_team_join_new{
        fight_team = FightTeam
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54520, _BinData) ->

    UnpackRecordData = #cs_fight_team_apply_list{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54521, BinData) ->
    {_RBin0, Roles} = prot_util:unpack(BinData, [{{64, unsigned}, string, {16, unsigned}, {8, unsigned}, {16, unsigned}, {16, unsigned}, {16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_fight_team_apply_list{
        roles = Roles
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54522, _BinData) ->

    UnpackRecordData = #cs_fight_team_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54523, _BinData) ->

    UnpackRecordData = #sc_fight_team_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54524, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_fight_team_kick_out{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54525, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_kick_out{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54526, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_member_leave{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54527, _BinData) ->

    UnpackRecordData = #sc_fight_team_notify_kick_out{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54528, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_fight_team_demise_leader{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54529, BinData) ->
    {_RBin0, Target} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_demise_leader{
        target = Target
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54530, BinData) ->
    {_RBin0, Leader} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_fight_team_notify_leader_demise{
        leader = Leader
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54531, _BinData) ->

    UnpackRecordData = #cs_fight_team_disband{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54532, _BinData) ->

    UnpackRecordData = #sc_fight_team_disband{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(54501, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54502, PackRecordData) ->
    FightTeam = prot_util:pack(PackRecordData#sc_fight_team_info.fight_team, {u,clt_fight_team}),

    BinData = <<
        FightTeam/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54503, PackRecordData) ->
    Name = prot_util:pack(PackRecordData#cs_fight_team_create.name, string),

    BinData = <<
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54504, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fight_team_create.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54506, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_fight_team_invite_join.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54507, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_fight_team_invite_join.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54508, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_fight_team_accept_invite.id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#cs_fight_team_accept_invite.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#cs_fight_team_accept_invite.accept, {8, unsigned}),

    BinData = <<
        Id/binary,
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54509, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fight_team_accept_invite.id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#sc_fight_team_accept_invite.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#sc_fight_team_accept_invite.accept, {8, unsigned}),

    BinData = <<
        Id/binary,
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54510, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fight_team_new_invite.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_fight_team_new_invite.name, string),
    RoleId = prot_util:pack(PackRecordData#sc_fight_team_new_invite.role_id, {64, unsigned}),
    RoleName = prot_util:pack(PackRecordData#sc_fight_team_new_invite.role_name, string),

    BinData = <<
        Id/binary,
        Name/binary,
        RoleId/binary,
        RoleName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54511, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_fight_team_invite_reject.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_fight_team_invite_reject.name, string),

    BinData = <<
        RoleId/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54512, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_fight_team_apply_for.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54513, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fight_team_apply_for.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54514, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_fight_team_accept_apply.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#cs_fight_team_accept_apply.accept, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54515, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_fight_team_accept_apply.role_id, {64, unsigned}),
    Accept = prot_util:pack(PackRecordData#sc_fight_team_accept_apply.accept, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Accept/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54516, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54517, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_fight_team_apply_reject.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54518, PackRecordData) ->
    Name = prot_util:pack(PackRecordData#sc_fight_team_new_member.name, string),

    BinData = <<
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54519, PackRecordData) ->
    FightTeam = prot_util:pack(PackRecordData#sc_fight_team_join_new.fight_team, {u,clt_fight_team}),

    BinData = <<
        FightTeam/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54520, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54521, PackRecordData) ->
    Roles = prot_util:pack(PackRecordData#sc_fight_team_apply_list.roles, [{{64, unsigned}, string, {16, unsigned}, {8, unsigned}, {16, unsigned}, {16, unsigned}, {16, unsigned}, {32, unsigned}}]),

    BinData = <<
        Roles/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54522, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54523, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54524, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_fight_team_kick_out.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54525, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_fight_team_kick_out.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54526, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_fight_team_member_leave.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54527, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54528, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#cs_fight_team_demise_leader.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54529, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_fight_team_demise_leader.target, {64, unsigned}),

    BinData = <<
        Target/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54530, PackRecordData) ->
    Leader = prot_util:pack(PackRecordData#sc_fight_team_notify_leader_demise.leader, {64, unsigned}),

    BinData = <<
        Leader/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54531, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54532, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

