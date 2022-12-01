-module(prot_404).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_404.hrl").


%% ---------------------------------------------------------------------------------------

decode(40401, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, ServerNum} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #cs_view_get_role_info{
        type = Type,
        id = Id,
        server_num = ServerNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40402, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Info} = prot_util:unpack(RBin0, {u,clt_role_view}),
    {RBin2, PetList} = prot_util:unpack(RBin1, [{u,clt_pet}]),
    {RBin3, AttachList} = prot_util:unpack(RBin2, [{u,clt_attach}]),
    {RBin4, Channels} = prot_util:unpack(RBin3, [{u,clt_channel}]),
    {_RBin5, Forge} = prot_util:unpack(RBin4, {u,clt_forge_soul}),

    UnpackRecordData = #sc_view_get_role_info{
        type = Type,
        info = Info,
        pet_list = PetList,
        attach_list = AttachList,
        channels = Channels,
        forge = Forge
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40403, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_view_get_role_common_info{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40404, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleName} = prot_util:unpack(RBin0, string),
    {RBin2, TeamId} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, TeamNum} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Guild} = prot_util:unpack(RBin3, {64, unsigned}),
    {RBin5, GuildName} = prot_util:unpack(RBin4, string),
    {_RBin6, Scene} = prot_util:unpack(RBin5, {32, unsigned}),

    UnpackRecordData = #sc_view_get_role_common_info{
        role_id = RoleId,
        role_name = RoleName,
        team_id = TeamId,
        team_num = TeamNum,
        guild = Guild,
        guild_name = GuildName,
        scene = Scene
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40401, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_view_get_role_info.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_view_get_role_info.id, {64, unsigned}),
    ServerNum = prot_util:pack(PackRecordData#cs_view_get_role_info.server_num, {32, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary,
        ServerNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40402, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_view_get_role_info.type, {8, unsigned}),
    Info = prot_util:pack(PackRecordData#sc_view_get_role_info.info, {u,clt_role_view}),
    PetList = prot_util:pack(PackRecordData#sc_view_get_role_info.pet_list, [{u,clt_pet}]),
    AttachList = prot_util:pack(PackRecordData#sc_view_get_role_info.attach_list, [{u,clt_attach}]),
    Channels = prot_util:pack(PackRecordData#sc_view_get_role_info.channels, [{u,clt_channel}]),
    Forge = prot_util:pack(PackRecordData#sc_view_get_role_info.forge, {u,clt_forge_soul}),

    BinData = <<
        Type/binary,
        Info/binary,
        PetList/binary,
        AttachList/binary,
        Channels/binary,
        Forge/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40403, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_view_get_role_common_info.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40404, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_view_get_role_common_info.role_id, {64, unsigned}),
    RoleName = prot_util:pack(PackRecordData#sc_view_get_role_common_info.role_name, string),
    TeamId = prot_util:pack(PackRecordData#sc_view_get_role_common_info.team_id, {64, unsigned}),
    TeamNum = prot_util:pack(PackRecordData#sc_view_get_role_common_info.team_num, {8, unsigned}),
    Guild = prot_util:pack(PackRecordData#sc_view_get_role_common_info.guild, {64, unsigned}),
    GuildName = prot_util:pack(PackRecordData#sc_view_get_role_common_info.guild_name, string),
    Scene = prot_util:pack(PackRecordData#sc_view_get_role_common_info.scene, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        RoleName/binary,
        TeamId/binary,
        TeamNum/binary,
        Guild/binary,
        GuildName/binary,
        Scene/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

