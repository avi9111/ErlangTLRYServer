-module(prot_528).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_528.hrl").


%% ---------------------------------------------------------------------------------------

decode(52801, _BinData) ->

    UnpackRecordData = #cs_friend_sys_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52802, BinData) ->
    {RBin0, ApplyList} = prot_util:unpack(BinData, [{64, unsigned}]),
    {RBin1, FriendList} = prot_util:unpack(RBin0, [{64, unsigned}]),
    {RBin2, BanList} = prot_util:unpack(RBin1, [{64, unsigned}]),
    {RBin3, EnemyList} = prot_util:unpack(RBin2, [{64, unsigned}]),
    {RBin4, FocusList} = prot_util:unpack(RBin3, [{64, unsigned}]),
    {RBin5, BlockList} = prot_util:unpack(RBin4, [{u,friend_block}]),
    {RBin6, GroupList} = prot_util:unpack(RBin5, [{u,friend_group}]),
    {RBin7, RoleInfoList} = prot_util:unpack(RBin6, [{u,friend_info}]),
    {_RBin8, NickNames} = prot_util:unpack(RBin7, [{{64, unsigned}, string}]),

    UnpackRecordData = #sc_friend_sys_info{
        apply_list = ApplyList,
        friend_list = FriendList,
        ban_list = BanList,
        enemy_list = EnemyList,
        focus_list = FocusList,
        block_list = BlockList,
        group_list = GroupList,
        role_info_list = RoleInfoList,
        nick_names = NickNames
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52803, BinData) ->
    {_RBin0, UpdateIdList} = prot_util:unpack(BinData, [{u,friend_update_list}]),

    UnpackRecordData = #sc_friend_sys_update_role_id_list{
        update_id_list = UpdateIdList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52804, BinData) ->
    {_RBin0, UpdateInfoList} = prot_util:unpack(BinData, [{u,friend_info}]),

    UnpackRecordData = #sc_friend_sys_update_info_list{
        update_info_list = UpdateInfoList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52805, BinData) ->
    {_RBin0, NewBlocks} = prot_util:unpack(BinData, [{u,friend_block}]),

    UnpackRecordData = #sc_friend_sys_update_block{
        new_blocks = NewBlocks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52806, BinData) ->
    {_RBin0, NewGroup} = prot_util:unpack(BinData, {u,friend_group}),

    UnpackRecordData = #sc_friend_sys_update_group{
        new_group = NewGroup
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52807, BinData) ->
    {_RBin0, DelList} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_friend_sys_del_role_info{
        del_list = DelList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52808, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_friend_sys_del_block{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52809, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_friend_sys_del_group{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52810, BinData) ->
    {_RBin0, SearchName} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_friend_sys_find_new{
        search_name = SearchName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52811, BinData) ->
    {_RBin0, RoleInfoList} = prot_util:unpack(BinData, [{u,friend_info}]),

    UnpackRecordData = #sc_friend_sys_find_new{
        role_info_list = RoleInfoList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52812, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_apply_add{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52813, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Confirm} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_friend_sys_confirm_add{
        role_id = RoleId,
        confirm = Confirm
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52814, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Nickname} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #cs_friend_sys_set_nick_name{
        role_id = RoleId,
        nickname = Nickname
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52815, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_del_nick_name{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52816, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_focus{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52817, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_ban_role{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52818, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_add_enemy{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52820, BinData) ->
    {_RBin0, DelList} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #cs_friend_sys_del_friend{
        del_list = DelList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52821, BinData) ->
    {_RBin0, Name} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_friend_sys_create_block{
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52822, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #cs_friend_sys_rename_block{
        id = Id,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52823, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_friend_sys_del_block{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52824, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, RoleIdList} = prot_util:unpack(RBin0, [{{64, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #cs_friend_sys_add2_block{
        id = Id,
        role_id_list = RoleIdList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52825, BinData) ->
    {RBin0, Keyword} = prot_util:unpack(BinData, string),
    {_RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_friend_sys_find_group{
        keyword = Keyword,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52826, BinData) ->
    {_RBin0, GroupList} = prot_util:unpack(BinData, [{u,friend_group_simple}]),

    UnpackRecordData = #sc_friend_sys_find_group{
        group_list = GroupList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52827, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {_RBin2, Announce} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #cs_friend_sys_create_group{
        type = Type,
        name = Name,
        announce = Announce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52828, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_apply_in_group{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52829, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Confirm} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_friend_sys_confirm_in_group{
        id = Id,
        role_id = RoleId,
        confirm = Confirm
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52830, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {_RBin2, Announce} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #cs_friend_sys_change_group_info{
        id = Id,
        name = Name,
        announce = Announce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52831, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_leave_group{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52832, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_dismiss_group{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52833, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_del_group_mem{
        id = Id,
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52834, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #cs_friend_sys_invite_in_group{
        id = Id,
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52835, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Msg} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_friend_sys_invite_in_group{
        id = Id,
        msg = Msg
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52840, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Nickname} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_friend_sys_set_nick_name{
        role_id = RoleId,
        nickname = Nickname
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52841, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_friend_sys_del_nick_name{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52842, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_friend_online_notice{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52802, PackRecordData) ->
    ApplyList = prot_util:pack(PackRecordData#sc_friend_sys_info.apply_list, [{64, unsigned}]),
    FriendList = prot_util:pack(PackRecordData#sc_friend_sys_info.friend_list, [{64, unsigned}]),
    BanList = prot_util:pack(PackRecordData#sc_friend_sys_info.ban_list, [{64, unsigned}]),
    EnemyList = prot_util:pack(PackRecordData#sc_friend_sys_info.enemy_list, [{64, unsigned}]),
    FocusList = prot_util:pack(PackRecordData#sc_friend_sys_info.focus_list, [{64, unsigned}]),
    BlockList = prot_util:pack(PackRecordData#sc_friend_sys_info.block_list, [{u,friend_block}]),
    GroupList = prot_util:pack(PackRecordData#sc_friend_sys_info.group_list, [{u,friend_group}]),
    RoleInfoList = prot_util:pack(PackRecordData#sc_friend_sys_info.role_info_list, [{u,friend_info}]),
    NickNames = prot_util:pack(PackRecordData#sc_friend_sys_info.nick_names, [{{64, unsigned}, string}]),

    BinData = <<
        ApplyList/binary,
        FriendList/binary,
        BanList/binary,
        EnemyList/binary,
        FocusList/binary,
        BlockList/binary,
        GroupList/binary,
        RoleInfoList/binary,
        NickNames/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52803, PackRecordData) ->
    UpdateIdList = prot_util:pack(PackRecordData#sc_friend_sys_update_role_id_list.update_id_list, [{u,friend_update_list}]),

    BinData = <<
        UpdateIdList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52804, PackRecordData) ->
    UpdateInfoList = prot_util:pack(PackRecordData#sc_friend_sys_update_info_list.update_info_list, [{u,friend_info}]),

    BinData = <<
        UpdateInfoList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52805, PackRecordData) ->
    NewBlocks = prot_util:pack(PackRecordData#sc_friend_sys_update_block.new_blocks, [{u,friend_block}]),

    BinData = <<
        NewBlocks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52806, PackRecordData) ->
    NewGroup = prot_util:pack(PackRecordData#sc_friend_sys_update_group.new_group, {u,friend_group}),

    BinData = <<
        NewGroup/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52807, PackRecordData) ->
    DelList = prot_util:pack(PackRecordData#sc_friend_sys_del_role_info.del_list, [{64, unsigned}]),

    BinData = <<
        DelList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52808, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_friend_sys_del_block.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52809, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_friend_sys_del_group.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52810, PackRecordData) ->
    SearchName = prot_util:pack(PackRecordData#cs_friend_sys_find_new.search_name, string),

    BinData = <<
        SearchName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52811, PackRecordData) ->
    RoleInfoList = prot_util:pack(PackRecordData#sc_friend_sys_find_new.role_info_list, [{u,friend_info}]),

    BinData = <<
        RoleInfoList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52812, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_apply_add.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52813, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_confirm_add.role_id, {64, unsigned}),
    Confirm = prot_util:pack(PackRecordData#cs_friend_sys_confirm_add.confirm, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Confirm/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52814, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_set_nick_name.role_id, {64, unsigned}),
    Nickname = prot_util:pack(PackRecordData#cs_friend_sys_set_nick_name.nickname, string),

    BinData = <<
        RoleId/binary,
        Nickname/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52815, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_del_nick_name.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52816, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_focus.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52817, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_ban_role.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52818, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_add_enemy.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52820, PackRecordData) ->
    DelList = prot_util:pack(PackRecordData#cs_friend_sys_del_friend.del_list, [{64, unsigned}]),

    BinData = <<
        DelList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52821, PackRecordData) ->
    Name = prot_util:pack(PackRecordData#cs_friend_sys_create_block.name, string),

    BinData = <<
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52822, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_rename_block.id, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#cs_friend_sys_rename_block.name, string),

    BinData = <<
        Id/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52823, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_del_block.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52824, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_add2_block.id, {8, unsigned}),
    RoleIdList = prot_util:pack(PackRecordData#cs_friend_sys_add2_block.role_id_list, [{{64, unsigned}, {8, unsigned}}]),

    BinData = <<
        Id/binary,
        RoleIdList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52825, PackRecordData) ->
    Keyword = prot_util:pack(PackRecordData#cs_friend_sys_find_group.keyword, string),
    Type = prot_util:pack(PackRecordData#cs_friend_sys_find_group.type, {8, unsigned}),

    BinData = <<
        Keyword/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52826, PackRecordData) ->
    GroupList = prot_util:pack(PackRecordData#sc_friend_sys_find_group.group_list, [{u,friend_group_simple}]),

    BinData = <<
        GroupList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52827, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_friend_sys_create_group.type, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#cs_friend_sys_create_group.name, string),
    Announce = prot_util:pack(PackRecordData#cs_friend_sys_create_group.announce, string),

    BinData = <<
        Type/binary,
        Name/binary,
        Announce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52828, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_apply_in_group.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52829, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_confirm_in_group.id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_confirm_in_group.role_id, {64, unsigned}),
    Confirm = prot_util:pack(PackRecordData#cs_friend_sys_confirm_in_group.confirm, {8, unsigned}),

    BinData = <<
        Id/binary,
        RoleId/binary,
        Confirm/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52830, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_change_group_info.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#cs_friend_sys_change_group_info.name, string),
    Announce = prot_util:pack(PackRecordData#cs_friend_sys_change_group_info.announce, string),

    BinData = <<
        Id/binary,
        Name/binary,
        Announce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52831, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_leave_group.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52832, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_dismiss_group.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52833, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_del_group_mem.id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_del_group_mem.role_id, {64, unsigned}),

    BinData = <<
        Id/binary,
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52834, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_friend_sys_invite_in_group.id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#cs_friend_sys_invite_in_group.role_id, {64, unsigned}),

    BinData = <<
        Id/binary,
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52835, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_friend_sys_invite_in_group.id, {64, unsigned}),
    Msg = prot_util:pack(PackRecordData#sc_friend_sys_invite_in_group.msg, string),

    BinData = <<
        Id/binary,
        Msg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52840, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_friend_sys_set_nick_name.role_id, {64, unsigned}),
    Nickname = prot_util:pack(PackRecordData#sc_friend_sys_set_nick_name.nickname, string),

    BinData = <<
        RoleId/binary,
        Nickname/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52841, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_friend_sys_del_nick_name.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52842, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_friend_online_notice.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

