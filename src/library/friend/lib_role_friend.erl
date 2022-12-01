%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     好友系统
%%% @end
%%% Created : 06. 十二月 2018 9:23
%%%-------------------------------------------------------------------
-module(lib_role_friend).
-author("Tom").
-include("op_type.hrl").
-include("log.hrl").
-include("keyvalue.hrl").
-include("role.hrl").
-include("guild.hrl").
-include("ret_code.hrl").
-include("friend.hrl").
-include("cache.hrl").
-include("proto/prot_ud.hrl").
-include("proto/prot_528.hrl").


%% API
-export([
    init/1,
    save/1,
    event/2,
    handle_info/2
]).

-export([
    info/1,
    focus/2,
    ban_role/2,
    find_new/2,
    add_enemy/2,
    del_block/2,
    apply_add/2,
    add2_block/3,
    del_friend/2,
    find_group/3,
    confirm_add/3,
    leave_group/2,
    create_group/4,
    create_block/2,
    rename_block/3,
    set_nickname/3,
    del_nickname/2,
    dismiss_group/2,
    del_group_mem/3,
    apply_in_group/2,
    invite_in_group/3,
    confirm_in_group/4,
    notice_del_block/2,
    notice_del_group/2,
    change_group_info/4,
    notice_group_update/2,
    notice_block_update/2,
    notice_friend_online/2,
    notice_del_friendinfo/2,
    notice_id_list_update/2,
    notice_friendinfo_update/3,
    notice_invite_in_group_msg/3

]).

-record(local_cache, {
    update = false          %% 个人数据更新，需要下发通知好友
}).

event(PS, level_up) ->
    update(PS);
event(PS, 'scene_changed') ->
    update(PS);
event(PS, 'team_changed') ->
    update(PS);
event(PS, {timer, 'one_minute'}) ->
    check_update(PS);
event(_, _) ->
    skip.

handle_info({notice_update, FriendInfo}, PS) ->
    send_friendinfo_update(PS, FriendInfo);
handle_info({notice_update_id_list, TypeList}, PS) ->
    RoleFriend = svr_friend:get_role_friend(PS#role_state.id),
    send_role_id_list_update(PS, TypeList, RoleFriend);
handle_info({notice_online, RoleID}, PS) ->
    send_friend_online(PS, RoleID);
handle_info({notice_del_friendinfo, Del_RoleID}, PS) ->
    RoleFriend = svr_friend:get_role_friend(PS#role_state.id),
    check_del_friendinfo(PS, Del_RoleID, RoleFriend);
handle_info({notice_block_update, NewBlock}, PS) ->
    send_block_update(PS, NewBlock);
handle_info({notice_del_block, Id}, PS) ->
    send_del_block(PS, Id);
handle_info({notice_del_group, Id}, PS) ->
    send_del_group(PS, Id);
handle_info({notice_group_update, Group}, PS) ->
    send_group_update(PS, Group);
handle_info({notice_invite_in_group, GroupId, Msg}, PS) ->
    send_invite_in_group_msg(PS, GroupId, Msg);
handle_info(_, _) ->
    ignore.


%%-------------------------lib_role回调----------------------------------
%% 初始化
init(PS) ->
    %% 通知关注自己的好友
    #role_state{id = RoleID} = PS,
    RoleFriend = svr_friend:get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, be_focused_list = BeFocusedList} = RoleFriend,
    length(BeFocusedList) =/= 0 andalso
        [begin
            case lists:member(R_ID, FriendList) of
                true -> notice_friend_online(R_ID, RoleID);
                _ -> skip
            end
        end || R_ID <- BeFocusedList],
    update(PS),
    check_update(PS),
    ok.


%% 下线保存
save(PS) ->
    check_update(PS, true),
    svr_friend:save_to_db(PS#role_state.id),
    ok.

%%--------------------------接口调用---------------------------------------
info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleFriend = svr_friend:get_role_friend(RoleID),
    #role_friend{
        apply_list = ApplyList,
        friend_list = FriendList,
        focus_list = FocusList,
        ban_list = BanList,
        enemy_list = EnemyList,
        block_list = BlockList,
        group_id_list = GroupIdList,
        nick_names = NickNames
    } = RoleFriend,
    {Dels, Nodels} = svr_role_delete:get_dels(),
    Fun = fun(H, {Bool, Acc}) ->
        ?iif(svr_role_delete:is_del(H, Dels, Nodels), {true, Acc}, {Bool, [H | Acc]})
    end,
    {Bool1, ApplyListN} = lists:foldl(Fun, {false, []}, ApplyList),
    {Bool2, BanListN} = lists:foldl(Fun, {Bool1, []}, BanList),
    {Bool3, EnemyListN} = lists:foldl(Fun, {Bool2, []}, EnemyList),
    Bool3 andalso svr_friend:set_role_friend(RoleID,
        RoleFriend#role_friend{apply_list = ApplyListN, ban_list = BanListN, enemy_list = EnemyListN}),
    BlockList_Msg = [Block || {_, Block} <- BlockList],
    GroupList = svr_friend:get_group(GroupIdList),
    Func = fun(#group{mem_list = MemList, apply_list = ApplyList_G} = Group, {GroupList_Acc, IdList_Acc}) ->
        GroupInfo = get_group_info(Group),
        {[GroupInfo | GroupList_Acc], [MemList, ApplyList_G] ++ IdList_Acc}
    end,

    {GroupList_Msg, IdListList} = lists:foldl(Func, {[], []}, GroupList),
    TotalRoleIdList = get_not_repeatid_list([ApplyListN, FriendList, FocusList, BanListN, EnemyListN] ++ IdListList, []),
    RoleInfoList = [begin
        ReStat = ?iif(lists:member(R_Id, FriendList), ?RELATION_STAT_FRIEND, ?RELATION_STAT_STRANGER),
        ReStatN = ?iif(lists:member(R_Id, BanListN) orelse lists:member(R_Id, EnemyListN), ?RELATION_STAT_ENEMY, ReStat),
        ReStatNN = ?iif(ReStatN =:= ?RELATION_STAT_FRIEND, lib_friend:get_relation_stat(R_Id, RoleID), ReStatN),
        RoleBase = lib_cache:get_role_base(R_Id),
        get_friend_info(RoleBase, ReStatNN)
    end || R_Id <- TotalRoleIdList, R_Id =/= RoleID],
    %% 清除离线消息
    svr_friend:del_offline_msg(RoleID),

    MsgRecord = #sc_friend_sys_info{
        apply_list = ApplyList,
        friend_list = FriendList,
        ban_list = BanList,
        enemy_list = EnemyList,
        focus_list = FocusList,
        block_list = BlockList_Msg,
        group_list = GroupList_Msg,
        role_info_list = RoleInfoList,
        nick_names = NickNames
    },
    {ok, MsgRecord}.

%% 查找好友
find_new(PS, Search) ->
    #role_state{id = RoleID} = PS,
    RoleFriend = svr_friend:get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, ban_list = BanList, enemy_list = EnemyList} = RoleFriend,
    RoleIdList = case Search of
        "" ->   %% 推荐好友
            List = svr_friend:get_recommend_friends(?RECOMMEND_FRIEND_NUM, [RoleID | FriendList]),
            [R_ID || #role_friend{role_id = R_ID} <- List];
        _ -> search_by_name(PS, Search)
    end,
    RoleInfoList = [begin
        ReStat = ?iif(lists:member(R_Id, FriendList), ?RELATION_STAT_FRIEND, ?RELATION_STAT_STRANGER),
        ReStatN = ?iif(lists:member(R_Id, BanList) orelse lists:member(R_Id, EnemyList), ?RELATION_STAT_ENEMY, ReStat),
        ReStatNN = ?iif(ReStatN =:= ?RELATION_STAT_FRIEND, lib_friend:get_relation_stat(R_Id, RoleID), ReStatN),
        RoleBase = lib_cache:get_role_base(R_Id),
        get_friend_info(RoleBase, ReStatNN)
    end || R_Id <- RoleIdList, R_Id =/= RoleID],
    MsgRecord = #sc_friend_sys_find_new{
        role_info_list = RoleInfoList
    },
    {ok, MsgRecord}.

%% 申请添加好友
apply_add(PS, TargetRoleId) ->
    #role_state{id = RoleID} = PS,
    case RoleID =:= TargetRoleId of
        true -> ?ERROR_TOC(RoleID, ?RC_FRIEND_CANT_ADD_SELF_FRIEND),
            err;
        false ->
            svr_friend:apply_add(RoleID, TargetRoleId),
            ok
    end.

%% 确认好友申请
confirm_add(PS, TargetRoleId, Confirm) ->
    #role_state{id = RoleID} = PS,
    svr_friend:confirm_add(RoleID, TargetRoleId, Confirm),
    ok.

%% 设置好友昵称
set_nickname(PS, TargetRoleId, NickName) ->
    #role_state{id = RoleID} = PS,
    case svr_friend:set_nickname(RoleID, TargetRoleId, NickName) of
        true ->
            MsgRecord = #sc_friend_sys_set_nick_name{
                role_id = TargetRoleId,
                nickname = NickName
            },
            {ok, MsgRecord};
        false -> err
    end.

%% 删除好友昵称
del_nickname(PS, TargetRoleId) ->
    #role_state{id = RoleID} = PS,
    case svr_friend:del_nickname(RoleID, TargetRoleId) of
        true ->
            MsgRecord = #sc_friend_sys_del_nick_name{
                role_id = TargetRoleId
            },
            {ok, MsgRecord};
        false -> err
    end.

%% 关注好友或者取消关注
focus(PS, TargetRoleId) ->
    #role_state{id = RoleID} = PS,
    svr_friend:focus(RoleID, TargetRoleId),
    ok.

%% 拉黑某玩家，或者取消拉黑
ban_role(PS, TargetRoleId) ->
    #role_state{id = RoleID} = PS,
    case RoleID =:= TargetRoleId of
        true -> ?ERROR_TOC(RoleID, ?RC_FRIEND_CANT_BAN_SELF),
            err;
        false ->
            svr_friend:ban_role(RoleID, TargetRoleId),
            ok
    end.

%% 添加仇人，或者取消仇人关系
add_enemy(PS, TargetRoleId) ->
    #role_state{id = RoleID} = PS,
    case RoleID =:= TargetRoleId of
        true -> ?ERROR_TOC(RoleID, ?RC_FRIEND_CANT_ADD_SELF_ENEMY),
            err;
        false ->
            svr_friend:add_enemy(RoleID, TargetRoleId),
            ok
    end.

%% 删除好友
del_friend(PS, DelList) ->
    #role_state{id = RoleID} = PS,
    svr_friend:del_friend(RoleID, DelList),
    ok.

%% 新建分组
create_block(PS, Name) ->
    #role_state{id = RoleID} = PS,
    Index = lib_role_kv:get_counter(RoleID, ?KEY_FRIEND_BLOCK_INDEX),
    Index_N = ?iif(Index + 1 > 200, 1, Index + 1),
    lib_role_kv:set_kv(RoleID, ?KEY_FRIEND_BLOCK_INDEX, Index_N),
    svr_friend:create_block(RoleID, Name, Index_N),
    ok.

%% 分组改名
rename_block(PS, Id, Name) ->
    #role_state{id = RoleID} = PS,
    svr_friend:rename_block(RoleID, Id, Name),
    ok.

%% 删除分组
del_block(PS, Id) ->
    #role_state{id = RoleID} = PS,
    svr_friend:del_block(RoleID, Id),
    ok.

%% 把好友添加到分组
add2_block(PS, Id, RoleIdList) ->
    #role_state{id = RoleID} = PS,
    svr_friend:add2_block(RoleID, Id, RoleIdList),
    ok.

%% 查找玩家群组，查找条件一次只能一个成立，优先级从上到下
find_group(PS, Keyword, Type) ->
    GroupList = find_group_a(PS, Keyword, Type),
    GroupSimpleInfoList = [get_simple_group_info(Group) || Group <- GroupList],
    MsgRecord = #sc_friend_sys_find_group{
        group_list = GroupSimpleInfoList
    },
    {ok, MsgRecord}.

find_group_a(PS, "", 0) ->
    case catch util:check_action_limit({?MODULE, search_group}, ?SEARCH_GROUP_CDTIME) of
        {error, Code} ->
            ?ERROR_TOC(PS, Code),
            [];
        _ ->
            #role_state{id = RoleID} = PS,
            RoleFriend = svr_friend:get_role_friend(RoleID),
            #role_friend{group_id_list = GroupIdList} = RoleFriend,
            svr_friend:get_recommend_groups(?SEARCH_GROUP_NUM, GroupIdList)
    end;
find_group_a(PS, "", Type) ->
    GroupIdList = search_by_type(PS, Type),
    svr_friend:get_group(GroupIdList);
find_group_a(PS, KeyWord, 0) ->
    GroupIdList = search_by_keyword(PS, KeyWord),
    svr_friend:get_group(GroupIdList);
find_group_a(_, _, _) ->
    [].

%% 新建玩家群组
create_group(PS, Type, Name, Announce) ->
    #role_state{id = RoleID, level = Lv} = PS,
    Lv >= ?CREATE_GROUP_LV_LIMIT orelse erlang:throw({error, ?RC_FRIEND_GROUP_CREATE_LV_LIMIT}),
    Type < ?GROUP_TYPE_SYS_BEGIN orelse erlang:throw({error, ?RC_FRIEND_GROUP_TYPE_CANT_CREATE}),
    svr_friend:create_group(RoleID, Type, Name, Announce),
    ok.

%% 申请进入玩家群组
apply_in_group(PS, Id) ->
    #role_state{id = RoleID} = PS,
    svr_friend:apply_in_group(RoleID, Id),
    ok.

%% 确认申请进入玩家群组
confirm_in_group(PS, Id, TargetRoleID, Confirm) ->
    #role_state{id = RoleID} = PS,
    svr_friend:confirm_in_group(RoleID, Id, TargetRoleID, Confirm),
    ok.

%% 修改玩家群组信息
change_group_info(PS, Id, Name, Announce) ->
    #role_state{id = RoleID} = PS,
    svr_friend:change_group_info(RoleID, Id, Name, Announce),
    ok.

%% 退出玩家群组
leave_group(PS, Id) ->
    #role_state{id = RoleID} = PS,
    svr_friend:leave_group(RoleID, Id),
    ok.

%% 删除解散玩家群组
dismiss_group(PS, Id) ->
    #role_state{id = RoleID} = PS,
    svr_friend:dismiss_group(RoleID, Id),
    ok.

%% 移除玩家群组成员
del_group_mem(PS, Id, TargetRoleID) ->
    #role_state{id = RoleID} = PS,
    svr_friend:del_group_mem(RoleID, Id, TargetRoleID),
    ok.

%% 邀请好友进入玩家群组
invite_in_group(PS, Id, TargetRoleID) ->
    #role_state{id = RoleID} = PS,
    svr_friend:invite_in_group(RoleID, Id, TargetRoleID),
    ok.


%%---------------------------内部调用---------------------------------------
%% 按名字查找
search_by_name(PS, Name) ->
    case catch check_search_friend(Name) of
        {ok, List} -> List;
        {error, Code} ->
            ?ERROR_TOC(PS, Code),
            []
    end.

check_search_friend(Name0) ->
    util:check_action_limit({?MODULE, search_friend}, 10),
    Name = util:escape_varchar(Name0),
    List = lib_role_db:search_by_name(Name),
    {ok, List}.

%% 按关键字查找群组ID列表
search_by_keyword(PS, Keyword) ->
    case catch check_search_group(keyword, Keyword) of
        {ok, List} -> List;
        {error, Code} ->
            ?ERROR_TOC(PS, Code),
            []
    end.

%% 按类型查找群组ID列表
search_by_type(PS, Type) ->
    case catch check_search_group(type, Type) of
        {ok, List} -> List;
        {error, Code} ->
            ?ERROR_TOC(PS, Code),
            []
    end.

check_search_group(keyword, Keyword) ->
    util:check_action_limit({?MODULE, search_group}, ?SEARCH_GROUP_CDTIME),
    Keyword1 = util:escape_varchar(Keyword),
    List = lib_friend:search_by_keyword(Keyword1),
    {ok, List};
check_search_group(type, Type) ->
    Type < ?GROUP_TYPE_SYS_BEGIN orelse erlang:throw({error, ?RC_FRIEND_CANT_SEARCH_SYS_GROUP}),
    util:check_action_limit({?MODULE, search_group}, ?SEARCH_GROUP_CDTIME),
    List = lib_friend:search_by_type(Type),
    {ok, List}.


%% 设置好友数据更新标识
update(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    set_role_data(RoleID, RoleData#local_cache{update = true}).

check_update(PS) ->
    check_update(PS, false).

check_update(PS, Logout) ->
    #role_state{id = RoleID} = PS,
    RoleFriend = svr_friend:get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, group_id_list = GroupIdList} = RoleFriend,
    RoleData = get_role_data(RoleID),
    not Logout andalso not RoleData#local_cache.update orelse
        begin
            GroupList = svr_friend:get_group(GroupIdList),
            Func = fun(#group{mem_list = MemList} = _Group, IdList_Acc) ->
                [MemList | IdList_Acc]
            end,
            IdListList = lists:foldl(Func, [], GroupList),
            NoticeList = get_not_repeatid_list([FriendList | IdListList], []),
            [begin
                ReStat = ?iif(lists:member(R_ID, FriendList), ?RELATION_STAT_FRIEND, ?RELATION_STAT_STRANGER),
                ReStatN = ?iif(ReStat =:= ?RELATION_STAT_FRIEND, lib_friend:get_relation_stat(R_ID, RoleID), ReStat),
                notice_friendinfo_update(R_ID, RoleID, ReStatN, Logout)
            end || R_ID <- NoticeList, R_ID =/= RoleID],
            set_role_data(RoleID, RoleData#local_cache{update = false})
        end.

%% 通知某个好友某人的数据变化
notice_friendinfo_update(RoleId, TargetRoleID, ReStat) ->
    notice_friendinfo_update(RoleId, TargetRoleID, ReStat, false).

notice_friendinfo_update(RoleId, TargetRoleID, ReStat, Logout) when is_integer(TargetRoleID) ->
    notice_friendinfo_update(RoleId, [TargetRoleID], ReStat, Logout);
notice_friendinfo_update(RoleId, TargetRoleIDList, ReStat, Logout) when is_list(TargetRoleIDList) ->
    FriendInfoList = [begin
        RoleBase = lib_cache:get_role_base(TargetRoleID),
        get_friend_info(RoleBase, ReStat, Logout)
    end || TargetRoleID <- TargetRoleIDList],
    lib_role:mod_info(RoleId, ?MODULE, {notice_update, FriendInfoList}).

%% 通知某个好友ID列表变化
notice_id_list_update(RoleId, TypeList) ->
    lib_role:mod_info(RoleId, ?MODULE, {notice_update_id_list, TypeList}).

%% 通知好友上线
notice_friend_online(Target_RoleID, RoleID) ->
    lib_role:mod_info(Target_RoleID, ?MODULE, {notice_online, RoleID}).

%% 通知删除前端好友数据缓存
notice_del_friendinfo(RoleId, Del_RoleID) ->
    lib_role:mod_info(RoleId, ?MODULE, {notice_del_friendinfo, Del_RoleID}).

%% 通知新分组更新
notice_block_update(RoleId, NewBlock) ->
    lib_role:mod_info(RoleId, ?MODULE, {notice_block_update, NewBlock}).

%% 通知删除分组
notice_del_block(RoleId, Id) ->
    lib_role:mod_info(RoleId, ?MODULE, {notice_del_block, Id}).

%% 通知删除群组
notice_del_group(RoleId, Id) ->
    lib_role:mod_info(RoleId, ?MODULE, {notice_del_group, Id}).

%% 通知群组更新
notice_group_update(RoleID, Group) ->
    lib_role:mod_info(RoleID, ?MODULE, {notice_group_update, get_group_info(Group)}).

%% 下发邀请好友进入玩家群组提示
notice_invite_in_group_msg(RoleID, GroupId, Msg) ->
    lib_role:mod_info(RoleID, ?MODULE, {notice_invite_in_group, GroupId, Msg}).


%% 获取好友实体数据
get_friend_info(PS, ReStat) ->
    get_friend_info(PS, ReStat, false).

get_friend_info(PS, ReStat, IsOffline) when is_record(PS, role_state) ->
    #role_state{
        id = RoleID,
        role_vip = Vip,
        name = Name,
        level = Level,
        combat_power = Fight,
        gender = Gender,
        career = Career,
        team_id = TeamId,
        guild_id = GuildId,
        personal = Personal,
        role_scene = RoleScene
    } = PS,
    #{level := V_lv} = Vip,
    #{icon := Icon, frame := Frame} = Personal,
    #role_scene{scene_id = SceneId} = RoleScene,
    TeamInfo = svr_team_mgr:get_team_info(TeamId),
    TeamNum = case TeamInfo of
        undefined -> 0;
        _ ->
            #{members := Members} = TeamInfo,
            length(Members)
    end,
    GuildInfo = lib_guild:get_guild_info(GuildId),
    GuildName = case GuildInfo of
        undefined -> "";
        _ ->
            #guild{name = G_name} = GuildInfo,
            G_name
    end,

    #friend_info{
        id = RoleID,
        vip = V_lv,
        name = Name,
        level = Level,
        fight = Fight,
        offline = ?iif(IsOffline, time:unixtime(), 0),
        gender = Gender,
        career = Career,
        icon = Icon,
        frame = Frame,
        team_id = TeamId,
        team_num = TeamNum,
        guild = GuildId,
        guild_name = GuildName,
        scene = SceneId,
        stat = ReStat
    };
get_friend_info(RoleBase, ReStat, _) when is_map(RoleBase) ->
    #{
        id := RoleID,
        name := Name,
        level := Level,
        fight := Fight,
        career := Career,
        gender := Gender,
        vip_lv := Vip,
        offline := Offline,
        team_id := TeamId,
        guild := GuildId,
        scene := SceneId
    } = RoleBase,
    #{frame := Frame, icon := Icon} = lib_cache:get_role_view(RoleID),
    TeamInfo = svr_team_mgr:get_team_info(TeamId),
    TeamNum = case TeamInfo of
        undefined -> 0;
        _ ->
            #{members := Members} = TeamInfo,
            length(Members)
    end,
    GuildInfo = lib_guild:get_guild_info(GuildId),
    GuildName = case GuildInfo of
        undefined -> "";
        _ ->
            #guild{name = G_name} = GuildInfo,
            G_name
    end,

    #friend_info{
        id = RoleID,
        vip = Vip,
        name = Name,
        level = Level,
        fight = Fight,
        offline = ?iif(lib_role:is_online(RoleID), 0, Offline),
        gender = Gender,
        career = Career,
        icon = Icon,
        frame = Frame,
        team_id = TeamId,
        team_num = TeamNum,
        guild = GuildId,
        guild_name = GuildName,
        scene = SceneId,
        stat = ReStat
    };
get_friend_info(_, _, _) ->
    #friend_info{}.

get_group_info(Group) when is_record(Group, group) ->
    #group{
        group_id = GroupId,
        type = Type,
        name = Name,
        announce = Announce,
        owner = Owner,
        mem_list = MemList,
        apply_list = ApplyList
    } = Group,
    #friend_group{
        id = GroupId,
        type = Type,
        max_num = ?GROUP_MAX_NUM(Type),
        name = Name,
        announce = Announce,
        owner = Owner,
        mem_list = MemList,
        apply_list = ApplyList
    };
get_group_info(_) ->
    #friend_group{}.

get_simple_group_info(Group) when is_record(Group, group) ->
    #group{
        group_id = GroupId,
        type = Type,
        name = Name,
        announce = Announce,
        owner = Owner,
        mem_list = MemList
    } = Group,

    OwnerRole = case lib_cache:get_role_base(Owner) of
        RoleBase when is_map(RoleBase) ->
            #{name := RoleName, level := RoleLv, gender := RoleSex,
                career := Career} = RoleBase,
            ServerNum = config:get_server_num(),
            Role = #clt_chat_role{
                id = Owner, name = RoleName, svr_num = ServerNum, career = Career,
                gender = RoleSex, level = RoleLv
            },
            case lib_cache:get_role_view(Owner) of
                #{icon := Icon, frame := Frame, bubble := Bubble} ->
                    Role#clt_chat_role{icon = Icon, bubble = Bubble, frame = Frame};
                _ ->
                    Role
            end;
        _ ->
            #clt_chat_role{id = Owner}
    end,
    #friend_group_simple{
        id = GroupId,
        type = Type,
        max_num = ?GROUP_MAX_NUM(Type),
        num = length(MemList),
        name = Name,
        announce = Announce,
        owner_role = OwnerRole
    };
get_simple_group_info(_) ->
    #friend_group_simple{}.


get_not_repeatid_list([], Acc) ->
    Acc;
get_not_repeatid_list([RoleIdList | T], Acc) ->
    NoticeIdList = lists:foldl(fun(RoleId, Acc1) ->
        case lists:member(RoleId, Acc1) of
            false -> [RoleId | Acc1];
            true -> Acc1
        end
    end, Acc, RoleIdList),
    get_not_repeatid_list(T, NoticeIdList).

%% 下发好友数据更新
send_friendinfo_update(PS, FriendInfo) when is_record(FriendInfo, friend_info) ->
    send_friendinfo_update(PS, [FriendInfo]);
send_friendinfo_update(PS, FriendInfoList) when is_list(FriendInfoList) ->
    router_528:send_friendinfo_update(PS, FriendInfoList).

%% 下发好友ID列表更新
send_role_id_list_update(PS, TypeList, RoleFriend) ->
    #role_friend{
        apply_list = ApplyList,
        friend_list = FriendList,
        ban_list = BanList,
        enemy_list = EnemyList,
        focus_list = FocusList
    } = RoleFriend,
    UpdateIdList = lists:foldl(fun(Type, Acc) ->
        NewList = case Type of
            ?LIST_TYPE_FRIEND -> FriendList;
            ?LIST_TYPE_BAN -> BanList;
            ?LIST_TYPE_ENEMY -> EnemyList;
            ?LIST_TYPE_APPLY -> ApplyList;
            ?LIST_TYPE_FOCUS -> FocusList
        end,
        FriendUpdateList = #friend_update_list{type = Type, new_list = NewList},
        [FriendUpdateList | Acc]
    end, [], TypeList),
    router_528:send_role_id_list_update(PS, UpdateIdList).

%% 下发好友上线通知
send_friend_online(PS, RoleID) ->
    router_528:send_online_notice(PS, RoleID).

%% 检查是否要删除指定role_id对应的前端好友数据缓存
check_del_friendinfo(PS, RoleID, RoleFriend) when is_integer(RoleID) ->
    check_del_friendinfo(PS, [RoleID], RoleFriend);
check_del_friendinfo(PS, RoleID_List, RoleFriend) when is_record(RoleFriend, role_friend) ->
    #role_friend{
        apply_list = ApplyList,
        friend_list = FriendList,
        focus_list = FocusList,
        ban_list = BanList,
        enemy_list = EnemyList,
        group_id_list = GroupIdList
    } = RoleFriend,
    Del_List = lists:filter(fun(RoleID) ->
        Ret = not lists:member(RoleID, ApplyList) andalso not lists:member(RoleID, FriendList) andalso not lists:member(RoleID, FocusList)
            andalso not lists:member(RoleID, BanList) andalso not lists:member(RoleID, EnemyList)
            andalso begin
                GroupList = svr_friend:get_group(GroupIdList),
                RetNum = lists:foldl(fun(Group, ACC) ->
                    #group{mem_list = MemList} = Group,
                    case lists:member(RoleID, MemList) of
                        true -> ACC;
                        false -> ACC + 1
                    end
                end, 0, GroupList),
                RetNum =:= length(GroupList)
            end,
        Ret
    end, RoleID_List),
    length(Del_List) =:= 0 orelse router_528:send_del_friendinfo(PS, Del_List).

%% 下发分组更新
send_block_update(PS, NewBlock) when is_record(NewBlock, friend_block) ->
    send_block_update(PS, [NewBlock]);
send_block_update(PS, NewBlockList) when is_list(NewBlockList) ->
    router_528:send_block_update(PS, NewBlockList);
send_block_update(_, _) ->
    undefined.

%% 下发删除分组
send_del_block(PS, Id) ->
    router_528:send_del_block(PS, Id).

%% 下发删除群组
send_del_group(PS, Id) ->
    router_528:send_del_group(PS, Id).

%% 下发群组更新
send_group_update(PS, NewGroup) ->
    router_528:send_group_update(PS, NewGroup).

%% 下发邀请好友进入玩家群组提示
send_invite_in_group_msg(PS, GroupId, Msg) ->
    router_528:send_invite_in_group_msg(PS, GroupId, Msg).

get_role_data(_RoleID) ->
    case erlang:get({?MODULE, local}) of
        undefined -> #local_cache{};
        Cache -> Cache
    end.

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, local}, RoleData).