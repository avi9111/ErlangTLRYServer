%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     好友系统
%%% @end
%%% Created : 06. 十二月 2018 9:22
%%%-------------------------------------------------------------------
-module(lib_friend).
-author("Tom").

-include("friend.hrl").
-include("op_type.hrl").
-include("log.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("ets_defines.hrl").
-include("vow.hrl").
-include("proto/prot_528.hrl").

%% API
-export([
    focus/2,
    ban_role/2,
    is_black/2,
    is_friend/2,
    apply_add/2,
    del_block/2,
    get_group/1,
    add_enemy/2,
    broadcast/2,
    broadcast/3,
    is_member/2,
    save_to_db/1,
    init_cache/0,
    del_friend/2,
    role_delete/1,
    save_cache/1,
    add2_block/3,
    leave_group/2,
    confirm_add/3,
    create_block/3,
    rename_block/3,
    delete_group/1,
    create_group/1,
    set_nickname/3,
    del_nickname/2,
    create_group/4,
    dismiss_group/2,
    dismiss_group/3,
    del_group_mem/3,
    apply_in_group/2,
    get_friend_num/1,
    search_by_type/1,
    del_offline_msg/1,
    get_role_friend/1,
    get_role_groups/1,
    invite_in_group/3,
    leave_sys_group/2,
    confirm_in_group/4,
    join_in_sys_group/2,
    get_relation_stat/2,
    get_random_groups/2,
    search_by_keyword/1,
    change_group_info/4,
    get_friend_id_list/1,
    update_role_friend/2,
    broadcast_to_friends/2,
    get_group_role_id_list/1,
    set_role_friend/2,
    get_random_role_friends/2
]).


%% @doc 获取两人的关系状态
get_relation_stat(RoleID, TargetRoleID) ->
    case is_friend(RoleID, TargetRoleID) of
        false -> ?RELATION_STAT_STRANGER;
        _ ->
            %% todo 其他情况
            IsMarried = lib_marriage:is_married(RoleID, TargetRoleID),
            IsMentor = lib_mentor:is_mentor(RoleID, TargetRoleID),
            IsSworn = lib_sworn:is_sworn(RoleID, TargetRoleID),
            if
                IsMarried -> ?RELATION_STAT_MARRIAGE;
                IsMentor -> ?RELATION_STAT_MENTOR;
                IsSworn -> ?RELATION_STAT_SWORN;
                true ->
                    RoleFriend = get_role_friend(RoleID),
                    case lists:member(TargetRoleID, RoleFriend#role_friend.focus_list) of
                        true -> ?RELATION_STAT_FOCUSED_FRIEND;
                        _ -> ?RELATION_STAT_FRIEND
                    end
            end
    end.

%% @doc 判断指定玩家是否好友，true | false
is_friend(RoleID, TargetRoleID) ->
    FriendList = get_friend_id_list(RoleID),
    lists:member(TargetRoleID, FriendList).

%% @doc 获取指定玩家的好友ID列表
get_friend_id_list(RoleID) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList} = RoleFriend,
    FriendList.

%% @doc 获取好友数量
get_friend_num(RoleID) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList} = RoleFriend,
    length(FriendList).

%% @doc 判断指定玩家是否黑名单，true | false
is_black(RoleID, TargetRoleID) ->
    BanList = get_ban_id_list(RoleID),
    lists:member(TargetRoleID, BanList).

%% @doc 获取指定玩家的黑名单ID列表
get_ban_id_list(RoleID) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{ban_list = BanList} = RoleFriend,
    BanList.

%% @doc 是否群组成员，true | false
is_member(GroupID, RoleID) ->
    case get_group(GroupID) of
        #group{mem_list = RoleList} ->
            lists:member(RoleID, RoleList);
        _ ->
            false
    end.

%% @doc 玩家群组
get_role_groups(RoleID) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{group_id_list = Groups} = RoleFriend,
    Groups.

%% @doc 获取指定群组玩家ID列表
get_group_role_id_list(GroupId) ->
    case get_group(GroupId) of
        #group{mem_list = RoleList} ->
            RoleList;
        _ ->
            []
    end.

%% @doc 把消息广播给自己的好友
broadcast_to_friends(RoleID, Bin) ->
    FriendIdList = get_friend_id_list(RoleID),
    broadcast(FriendIdList, Bin).

%% @doc 广播打包好的消息到客户端
broadcast(GroupID, Bin) when is_integer(GroupID) ->
    broadcast(GroupID, Bin, []);
broadcast(Members, Bin) when is_list(Members) ->
    [begin
        lib_role_send:send_to_role(MemID, Bin)
    end || MemID <- Members];
broadcast(_Members, _Bin) ->
    ignore.

broadcast(GroupID, Bin, Except) ->
    case get_group(GroupID) of
        #group{mem_list = RoleList} = Group ->
            update_group(GroupID, Group#group{last_chat_time = time:unixtime()}),
            lib_role_send:broadcast(RoleList, Bin, Except);
        _ ->
            ignore
    end.

%% @doc 获取随机好友数据列表
get_random_role_friends(Number, FriendList) ->
    FriendCache = get_cache(),
    #friend_cache{role_friends = RoleFriends} = FriendCache,
    RandList = get_rand_friend_list(RoleFriends, Number, [], FriendList),
    RandList.

%% @doc 获取随机群组列表
get_random_groups(Number, GroupIdList) ->
    FriendCache = get_cache(),
    #friend_cache{group_list = GroupList} = FriendCache,
    RandList = get_rand_group_list(GroupList, Number, [], GroupIdList),
    RandList.

%% @doc 获取好友数据
get_role_friend(RoleID) ->
    FriendCache = get_cache(),
    #friend_cache{role_friends = FriendList} = FriendCache,
    RoleFriend = case lists:keyfind(RoleID, 1, FriendList) of
        false ->
            Data = init_one_friend(RoleID),
            FriendListN = lists:keystore(RoleID, 1, FriendList, {RoleID, Data}),
            set_cache(FriendCache#friend_cache{updated = true, role_friends = FriendListN}),
            Data;
        {_, Data} -> Data
    end,
    RoleFriend#role_friend{last_update_time = time:unixtime()}.

set_role_friend(RoleID, RoleFriend) ->
    FriendCache = get_cache(),
    #friend_cache{role_friends = FriendList} = FriendCache,
    FriendListN = lists:keystore(RoleID, 1, FriendList, {RoleID, RoleFriend}),
    set_cache(FriendCache#friend_cache{updated = true, role_friends = FriendListN}).

%% @doc 更新好友数据
update_role_friend(RoleID, RoleFriend) when is_record(RoleFriend, role_friend) ->
    FriendCache = get_cache(),
    #friend_cache{role_friends = FriendList} = FriendCache,
    FriendListN = lists:keystore(RoleID, 1, FriendList, {RoleID, RoleFriend}),
    set_cache(FriendCache#friend_cache{updated = true, role_friends = FriendListN});
update_role_friend(_, _) ->
    skip.

%% @doc 创建群组
create_group(Group) when is_record(Group, group) ->
    GroupId = svr_generator:gen_group_id(),
    GroupNew = Group#group{group_id = GroupId},
    FriendCache = get_cache(),
    #friend_cache{group_list = GroupList} = FriendCache,
    execute_save_group([{GroupId, GroupNew}], 1),
    set_cache(FriendCache#friend_cache{updated = true, group_list = [{GroupId, GroupNew} | GroupList]}),
    GroupId;
create_group(_) ->
    undefined.

%% @doc 删除群组
delete_group(GroupId) ->
    FriendCache = get_cache(),
    #friend_cache{group_list = GroupList} = FriendCache,
    GroupListN = lists:keydelete(GroupId, 1, GroupList),
    set_cache(FriendCache#friend_cache{updated = true, group_list = GroupListN}),
    SQL = io_lib:format(?SQL_DELETE_GROUP_DATA_BY_ID, [GroupId]),
    ?DB:execute(SQL).

%% @doc 根据id获取群组
get_group([]) ->
    [];
get_group(GroupIdList) when is_list(GroupIdList) ->
    [get_group(GroupId) || GroupId <- GroupIdList];
get_group(GroupId) when is_integer(GroupId) ->
    FriendCache = get_cache(),
    #friend_cache{group_list = GroupList} = FriendCache,
    case lists:keyfind(GroupId, 1, GroupList) of
        false ->
            Data = init_one_group(GroupId),
            case Data of
                undefined -> undefined;
                _ ->
                    GroupListN = lists:keystore(GroupId, 1, GroupList, {GroupId, Data}),
                    set_cache(FriendCache#friend_cache{updated = true, group_list = GroupListN}),
                    Data#group{last_update_time = time:unixtime()}
            end;
        {_, Data} -> Data#group{last_update_time = time:unixtime()}
    end.

%% @doc 更新群组数据
update_group(GroupId, Group) ->
    update_group(GroupId, Group, false).

update_group(GroupId, Group, ToDB) when is_record(Group, group) ->
    FriendCache = get_cache(),
    #friend_cache{group_list = GroupList} = FriendCache,
    GroupListN = lists:keystore(GroupId, 1, GroupList, {GroupId, Group}),
    ToDB andalso execute_save_group([{GroupId, Group}], 1),
    set_cache(FriendCache#friend_cache{updated = true, group_list = GroupListN});
update_group(_, _, _) ->
    skip.

%% @doc 删除离线消息
del_offline_msg(RoleID) ->
    RoleFriend = get_role_friend(RoleID),
    update_role_friend(RoleID, RoleFriend#role_friend{offline_msg_f = [], offline_msg_g = []}).

%% @doc 申请添加好友
apply_add(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList} = RoleFriend,
    TargetRoleFriend = get_role_friend(TargetRoleId),
    #role_friend{apply_list = ApplyList, friend_list = FriendList_T} = TargetRoleFriend,
    not lists:member(RoleID, FriendList_T) andalso not lists:member(TargetRoleId, FriendList) orelse erlang:throw({error, ?RC_FRIEND_ALREADY_BE_FRIENDS}),
    length(FriendList) < ?FRIEND_NUM_LIMIT orelse erlang:throw({error, ?RC_FRIEND_NUM_LIMIT}),
    length(FriendList_T) < ?FRIEND_NUM_LIMIT orelse erlang:throw({error, ?RC_FRIEND_NUM_TARGET_LIMIT}),
    not lists:member(RoleID, ApplyList) orelse erlang:throw({error, ?RC_FRIEND_ALREADY_APPLY}),
    update_role_friend(TargetRoleId, TargetRoleFriend#role_friend{apply_list = [RoleID | ApplyList]}),
    ?ERROR_TOC(RoleID, ?RC_FRIEND_APPLY_SUCC),

    %%下发通知
    lib_role_friend:notice_friendinfo_update(TargetRoleId, RoleID, ?RELATION_STAT_STRANGER),
    lib_role_friend:notice_id_list_update(TargetRoleId, [?LIST_TYPE_APPLY]).

%% @doc 确认好友申请
confirm_add(RoleID, TargetRoleId, Confirm) when TargetRoleId =/= 0 ->
    case svr_role_delete:is_del(TargetRoleId) of
        false ->
            MyRoleFriend = get_role_friend(RoleID),
            #role_friend{apply_list = ApplyList, friend_list = FriendList, ban_list = BanList, enemy_list = EnemyList} = MyRoleFriend,
            TargetRoleFriend = get_role_friend(TargetRoleId),
            #role_friend{friend_list = FriendList_T, apply_list = ApplyList_T, ban_list = BanList_T, enemy_list = EnemyList_T} = TargetRoleFriend,
            lists:member(TargetRoleId, ApplyList) orelse erlang:throw({error, ?RC_FRIEND_NOT_IN_APPLY_LIST}),
            length(FriendList) < ?FRIEND_NUM_LIMIT orelse erlang:throw({error, ?RC_FRIEND_NUM_LIMIT}),
            length(FriendList_T) < ?FRIEND_NUM_LIMIT orelse erlang:throw({error, ?RC_FRIEND_NUM_TARGET_LIMIT}),
            ApplyList_N = lists:delete(TargetRoleId, ApplyList),
            {TypeList, FriendList_N, BanList_N, EnemyList_N, ApplyList_T_N, FriendList_T_N, BanList_T_N, EnemyList_T_N} =
                case Confirm of
                    ?APPLY_CONFIRM_ACCEPT ->
                        lists:member(TargetRoleId, FriendList) andalso erlang:throw({error, ?RC_FRIEND_ALREADY_BE_FRIENDS}),
                        {[?LIST_TYPE_APPLY, ?LIST_TYPE_FRIEND, ?LIST_TYPE_BAN, ?LIST_TYPE_ENEMY], [TargetRoleId | FriendList], lists:delete(TargetRoleId, BanList), lists:delete(TargetRoleId, EnemyList),
                            lists:delete(RoleID, ApplyList_T), [RoleID | FriendList_T], lists:delete(RoleID, BanList_T), lists:delete(RoleID, EnemyList_T)};
                    _ ->
                        {[?LIST_TYPE_APPLY], FriendList, BanList, EnemyList, ApplyList_T, FriendList_T, BanList_T, EnemyList_T}
                end,
            MyRoleFriend_N = MyRoleFriend#role_friend{apply_list = ApplyList_N, friend_list = FriendList_N, ban_list = BanList_N, enemy_list = EnemyList_N},
            update_role_friend(RoleID, MyRoleFriend_N),
            lib_role_friend:notice_friendinfo_update(RoleID, TargetRoleId, ?RELATION_STAT_FRIEND),
            lib_role_friend:notice_id_list_update(RoleID, TypeList),
            Confirm =/= ?APPLY_CONFIRM_ACCEPT andalso lib_role_friend:notice_del_friendinfo(RoleID, TargetRoleId),
            Confirm =:= ?APPLY_CONFIRM_ACCEPT andalso ?TASK_EVENT(RoleID, {friend, length(FriendList_N)}),

            FriendList_T_N =/= FriendList_T andalso
                begin
                    TargetRoleFriend_N = TargetRoleFriend#role_friend{friend_list = FriendList_T_N, apply_list = ApplyList_T_N, ban_list = BanList_T_N, enemy_list = EnemyList_T_N},
                    update_role_friend(TargetRoleId, TargetRoleFriend_N),
                    lib_role_friend:notice_friendinfo_update(TargetRoleId, RoleID, ?RELATION_STAT_FRIEND),
                    lib_role_friend:notice_id_list_update(TargetRoleId, TypeList),
                    ?TASK_EVENT(TargetRoleId, {friend, length(FriendList_T_N)}),
                    lib_role:mod_info(RoleID, lib_role_vow, {trigger, ?DEED_TYPE_ADD_FRIEND, 0, TargetRoleId}),
                    lib_role:mod_info(TargetRoleId, lib_role_vow, {trigger, ?DEED_TYPE_ADD_FRIEND, 0, RoleID})
                end;
        _ ->
            MyRoleFriend = get_role_friend(RoleID),
            #role_friend{apply_list = ApplyList} = MyRoleFriend,
            ApplyList_N = lists:delete(TargetRoleId, ApplyList),
            MyRoleFriend_N = MyRoleFriend#role_friend{apply_list = ApplyList_N},
            update_role_friend(RoleID, MyRoleFriend_N),
            lib_role_friend:notice_id_list_update(RoleID, [?LIST_TYPE_APPLY]),
            lib_role_friend:notice_del_friendinfo(RoleID, TargetRoleId),
            erlang:throw({error, ?RC_DELETE_ROLE_IS_DELETED})
    end;
confirm_add(RoleID, TargetRoleId, Confirm) when TargetRoleId =:= 0 ->%% 一件确认
    MyRoleFriend = get_role_friend(RoleID),
    #role_friend{apply_list = ApplyList} = MyRoleFriend,
    length(ApplyList) =/= 0 orelse erlang:throw({error, ?RC_FRIEND_APPLY_LIST_EMPTY}),
    [confirm_add(RoleID, R_ID, Confirm) || R_ID <- ApplyList];
confirm_add(_, _, _) ->
    skip.

%% @doc 设置好友昵称
set_nickname(RoleID, TargetRoleId, NickName) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, nick_names = NickNames} = RoleFriend,
    lists:member(TargetRoleId, FriendList) orelse erlang:throw({error, ?RC_FRIEND_NOT_BE_FRIENDS}),
    validate_msg(NickName, ?FRIEND_NICKNAME_LEN),
    NickNames_N = lists:keystore(TargetRoleId, 1, NickNames, {TargetRoleId, NickName}),
    update_role_friend(RoleID, RoleFriend#role_friend{nick_names = NickNames_N}).

%% @doc 删除好友昵称
del_nickname(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, nick_names = NickNames} = RoleFriend,
    lists:member(TargetRoleId, FriendList) orelse erlang:throw({error, ?RC_FRIEND_NOT_BE_FRIENDS}),
    NickNames_N = case lists:keyfind(TargetRoleId, 1, NickNames) of
        false -> erlang:throw({error, ?RC_FRIEND_NO_NICKNAME}), NickNames;
        _ -> lists:keydelete(TargetRoleId, 1, NickNames)
    end,
    update_role_friend(RoleID, RoleFriend#role_friend{nick_names = NickNames_N}).

%% @doc 关注好友或者取消关注
focus(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, focus_list = FocusList} = RoleFriend,
    lists:member(TargetRoleId, FriendList) orelse erlang:throw({error, ?RC_FRIEND_NOT_BE_FRIENDS}),
    TargetRoleFriend = get_role_friend(TargetRoleId),
    #role_friend{be_focused_list = BeFocusedList} = TargetRoleFriend,
    {FocusList_N, BeFocusedList_N} = case lists:member(TargetRoleId, FocusList) of
        true ->
            {lists:delete(TargetRoleId, FocusList), lists:delete(RoleID, BeFocusedList)};
        _ ->
            {[TargetRoleId | FocusList], [RoleID | BeFocusedList]}
    end,

    RoleFriend_N = RoleFriend#role_friend{focus_list = FocusList_N},
    update_role_friend(RoleID, RoleFriend_N),
    lib_role_friend:notice_id_list_update(RoleID, [?LIST_TYPE_FOCUS]),
    TargetRoleFriend_N = TargetRoleFriend#role_friend{be_focused_list = BeFocusedList_N},
    update_role_friend(TargetRoleId, TargetRoleFriend_N).

%% @doc 拉黑某玩家，或者取消拉黑
ban_role(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, ban_list = BanList} = RoleFriend,
    length(BanList) < ?FRIEND_BAN_NUM_LIMIT orelse erlang:throw({error, ?RC_FRIEND_BAN_NUMBER_LIMIT}),
    not lists:member(TargetRoleId, FriendList) orelse erlang:throw({error, ?RC_FRIEND_CANT_BAN_FRIENDS}),
    {BanList_N, Ban} = case lists:member(TargetRoleId, BanList) of
        true ->
            {lists:delete(TargetRoleId, BanList), false};
        _ ->
            {[TargetRoleId | BanList], true}
    end,
    RoleFriend_N = RoleFriend#role_friend{ban_list = BanList_N},
    update_role_friend(RoleID, RoleFriend_N),
    case Ban of
        true ->
            lib_role_friend:notice_friendinfo_update(RoleID, TargetRoleId, ?RELATION_STAT_ENEMY);
        _ ->
            lib_role_friend:notice_del_friendinfo(RoleID, TargetRoleId)
    end,
    lib_role_friend:notice_id_list_update(RoleID, [?LIST_TYPE_BAN]).

%% @doc 添加仇人，或者取消仇人关系
add_enemy(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, enemy_list = EnemyList} = RoleFriend,
    length(EnemyList) < ?FRIEND_ENEMY_NUM_LIMIT orelse erlang:throw({error, ?RC_FRIEND_ENEMY_NUMBER_LIMIT}),
    not lists:member(TargetRoleId, FriendList) orelse erlang:throw({error, ?RC_FRIEND_CANT_ADD_FRIENDS_ENEMY}),
    {EnemyList_N, AddEnemy} = case lists:member(TargetRoleId, EnemyList) of
        true ->
            {lists:delete(TargetRoleId, EnemyList), false};
        _ ->
            {[TargetRoleId | EnemyList], true}
    end,
    RoleFriend_N = RoleFriend#role_friend{enemy_list = EnemyList_N},
    update_role_friend(RoleID, RoleFriend_N),
    case AddEnemy of
        true ->
            lib_role_friend:notice_friendinfo_update(RoleID, TargetRoleId, ?RELATION_STAT_ENEMY);
        _ ->
            lib_role_friend:notice_del_friendinfo(RoleID, TargetRoleId)
    end,
    lib_role_friend:notice_id_list_update(RoleID, [?LIST_TYPE_ENEMY]).

%% @doc 删除好友
del_friend(RoleID, TargetRoleIdList) when is_list(TargetRoleIdList) ->
    [del_friend(RoleID, TargetRoleId) || TargetRoleId <- TargetRoleIdList];
del_friend(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, nick_names = Nicknames} = RoleFriend,
    lists:member(TargetRoleId, FriendList) orelse erlang:throw({error, ?RC_FRIEND_NOT_BE_FRIENDS}),
    TargetRoleFriend = get_role_friend(TargetRoleId),
    #role_friend{friend_list = FriendList_T} = TargetRoleFriend,

    RoleFriend_N = RoleFriend#role_friend{friend_list = lists:delete(TargetRoleId, FriendList),
        nick_names = lists:keydelete(TargetRoleId, 1, Nicknames)},
    update_role_friend(RoleID, RoleFriend_N),
    lib_role_friend:notice_id_list_update(RoleID, [?LIST_TYPE_FRIEND]),
    lib_role_friend:notice_del_friendinfo(RoleID, TargetRoleId),
    del_role_id_from_all_blocks(RoleID, TargetRoleId),

    TargetRoleFriend_N = TargetRoleFriend#role_friend{friend_list = lists:delete(RoleID, FriendList_T)},
    update_role_friend(TargetRoleId, TargetRoleFriend_N),
    lib_role_friend:notice_id_list_update(TargetRoleId, [?LIST_TYPE_FRIEND]),
    lib_role_friend:notice_del_friendinfo(TargetRoleId, RoleID),
    del_role_id_from_all_blocks(TargetRoleId, RoleID).

%% @doc 新建分组
create_block(RoleID, Name, Index) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{block_list = BlockList} = RoleFriend,
    length(BlockList) < ?FRIEND_BLOCK_NUM orelse erlang:throw({error, ?RC_FRIEND_BLOCK_NUM_LIMIT}),
    validate_msg(Name, ?BLOCK_NAME_LEN),
    NewBlock = #friend_block{
        id = Index,
        name = Name
    },
    BlockList_N = lists:keystore(Index, 1, BlockList, {Index, NewBlock}),
    update_role_friend(RoleID, RoleFriend#role_friend{block_list = BlockList_N}),
    lib_role_friend:notice_block_update(RoleID, NewBlock).

%% @doc 分组改名
rename_block(RoleID, Id, Name) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{block_list = BlockList} = RoleFriend,
    CurBlock = case lists:keyfind(Id, 1, BlockList) of
        false -> erlang:throw({error, ?RC_FRIEND_BLOCK_NOT_EXIST});
        {_, Block} -> Block
    end,
    validate_msg(Name, ?BLOCK_NAME_LEN),
    NewBlock = CurBlock#friend_block{name = Name},
    BlockList_N = lists:keystore(Id, 1, BlockList, {Id, NewBlock}),
    update_role_friend(RoleID, RoleFriend#role_friend{block_list = BlockList_N}),
    lib_role_friend:notice_block_update(RoleID, NewBlock).

%% @doc 删除分组
del_block(RoleID, Id) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{block_list = BlockList} = RoleFriend,
    BlockList_N = case lists:keyfind(Id, 1, BlockList) of
        false -> erlang:throw({error, ?RC_FRIEND_BLOCK_NOT_EXIST});
        _ -> lists:keydelete(Id, 1, BlockList)
    end,
    update_role_friend(RoleID, RoleFriend#role_friend{block_list = BlockList_N}),
    lib_role_friend:notice_del_block(RoleID, Id).

%% @doc 把好友添加到分组
add2_block(RoleID, Id, RoleIdList) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{block_list = BlockList} = RoleFriend,
    {_NewBlock, BlockList_N} = case lists:keyfind(Id, 1, BlockList) of
        false -> erlang:throw({error, ?RC_FRIEND_BLOCK_NOT_EXIST});
        {_, Block} ->
            #friend_block{mem_list = MemList} = Block,
            MemList_N = lists:foldl(fun({R_ID, Op}, Acc) ->
                case Op =:= ?BLOCK_OP_DEL of
                    true -> lists:delete(R_ID, Acc);
                    false -> ?iif(not lists:member(R_ID, Acc), [R_ID | Acc], Acc)
                end
            end, MemList, RoleIdList),
            BlockN = Block#friend_block{mem_list = MemList_N},
            {BlockN, lists:keystore(Id, 1, BlockList, {Id, BlockN})}
    end,
    BlockList_New = [begin
        case Id_T =/= Id of
            true ->
                MemList_TN = lists:foldl(fun({R_ID, _Op}, Acc) ->
                    lists:delete(R_ID, Acc)
%%                                     ?iif(Op =:= ?BLOCK_OP_ADD, lists:delete(R_ID, Acc), Acc)
                end, MemList_T, RoleIdList),
                {Id_T, Block_T#friend_block{mem_list = MemList_TN}};
            _ -> {Id_T, Block_T}
        end
    end || {_, #friend_block{id = Id_T, mem_list = MemList_T} = Block_T} <- BlockList_N],
    update_role_friend(RoleID, RoleFriend#role_friend{block_list = BlockList_New}),
    lib_role_friend:notice_block_update(RoleID, [Bk || {_, Bk} <- BlockList_New]).

%% @doc 新建玩家群组
create_group(RoleID, Type, Name, Announce) ->
    CurTime = time:unixtime(),
    RoleFriend = get_role_friend(RoleID),
    #role_friend{group_id_list = GroupIdList, own_group_id_list = OwnGroupIdList} = RoleFriend,
    Type > ?GROUP_TYPE_SYS_BEGIN orelse length(OwnGroupIdList) < ?CREATE_GROUP_NUM orelse erlang:throw({error, ?RC_FRIEND_CREATE_GROUP_NUM_LIMIT}),
    Type > ?GROUP_TYPE_SYS_BEGIN orelse validate_msg(Name, ?GROUP_NAME_LEN),
    Type > ?GROUP_TYPE_SYS_BEGIN orelse validate_msg(Announce, ?GROUP_NOTICE_LEN),
    Group = #group{
        type = Type,
        name = Name,
        announce = Announce,
        owner = RoleID,
        mem_list = [RoleID],
        last_update_time = CurTime,
        last_chat_time = CurTime
    },
    GroupId = create_group(Group),
    update_role_friend(RoleID, RoleFriend#role_friend{group_id_list = [GroupId | GroupIdList], own_group_id_list = ?iif(Type < ?GROUP_TYPE_SYS_BEGIN,
        [GroupId | OwnGroupIdList], OwnGroupIdList)}),
    lib_role_friend:notice_group_update(RoleID, Group#group{group_id = GroupId}),
    GroupId.

%% @doc 申请进入玩家群组
apply_in_group(RoleID, Id) ->
    CurGroup = check_valid_group(Id),
    #group{type = Type, owner = Owner, apply_list = ApplyList, mem_list = MemList} = CurGroup,
    length(MemList) < ?GROUP_MAX_NUM(Type) orelse erlang:throw({error, ?RC_FRIEND_GROUP_FULL}),
    not lists:member(RoleID, ApplyList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_ALREADY_APPLY_IN}),
    not lists:member(RoleID, MemList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_ALREADY_MEMBER}),
    NewGroup = CurGroup#group{apply_list = [RoleID | ApplyList]},
    update_group(Id, NewGroup),
    OwnerRoleFriend = get_role_friend(Owner),
    #role_friend{friend_list = FriendList, ban_list = BanList, enemy_list = EnemyList} = OwnerRoleFriend,
    ?ERROR_TOC(RoleID, ?RC_FRIEND_APPLY_IN_GROUP_SUCC),
    not lists:member(RoleID, FriendList) andalso not lists:member(RoleID, BanList) andalso not lists:member(RoleID, EnemyList)
        andalso lib_role_friend:notice_friendinfo_update(Owner, RoleID, ?RELATION_STAT_STRANGER),
    lib_role_friend:notice_group_update(Owner, NewGroup).

%% @doc 确认申请进入玩家群组
confirm_in_group(RoleID, Id, TargetRoleID, Confirm) ->
    CurGroup = check_valid_group(Id),
    #group{owner = Owner} = CurGroup,
    RoleID =:= Owner orelse erlang:throw({error, ?RC_FRIEND_NOT_GROUP_OWNER}),
    check_confirm_in_group(CurGroup, TargetRoleID, Confirm).

check_confirm_in_group(CurGroup, TargetRoleID, Confirm) when TargetRoleID =/= 0 ->
    #group{group_id = Id, type = Type, owner = Owner, apply_list = ApplyList, mem_list = MemList} = CurGroup,
    length(MemList) < ?GROUP_MAX_NUM(Type) orelse erlang:throw({error, ?RC_FRIEND_GROUP_FULL}),
    TargetRoleFriend = get_role_friend(TargetRoleID),
    #role_friend{friend_list = FriendList, ban_list = BanList, enemy_list = EnemyList, group_id_list = GroupIdList} = TargetRoleFriend,
    lists:member(TargetRoleID, ApplyList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_NOT_APPLY_IN}),
    not lists:member(TargetRoleID, MemList) andalso not lists:member(Id, GroupIdList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_ALREADY_MEMBER}),
    {GroupIdList_N, ApplyList_N, MemList_N} = case Confirm of
        ?APPLY_CONFIRM_ACCEPT ->
            {[Id | GroupIdList], lists:delete(TargetRoleID, ApplyList), [TargetRoleID | MemList]};
        _ ->
            {GroupIdList, lists:delete(TargetRoleID, ApplyList), MemList}
    end,
    NewGroup = CurGroup#group{apply_list = ApplyList_N, mem_list = MemList_N},
    update_group(Id, NewGroup),
    case GroupIdList_N =/= GroupIdList of
        true ->
            update_role_friend(TargetRoleID, TargetRoleFriend#role_friend{group_id_list = GroupIdList_N}),
            NoticeIdList = lists:filter(fun(MemRoleId) ->
                MemRoleId =/= TargetRoleID andalso not lists:member(MemRoleId, FriendList) andalso not lists:member(MemRoleId, BanList)
                    andalso not lists:member(MemRoleId, EnemyList)
            end, MemList_N),
            lib_role_friend:notice_friendinfo_update(TargetRoleID, NoticeIdList, ?RELATION_STAT_STRANGER),
            lib_role_friend:notice_group_update(TargetRoleID, NewGroup),

            [begin
                TmpRoleFriend = get_role_friend(MemRoleId),
                #role_friend{friend_list = FriendListTmp, ban_list = BanListTmp, enemy_list = EnemyListTmp} = TmpRoleFriend,
                not lists:member(TargetRoleID, FriendListTmp) andalso not lists:member(TargetRoleID, BanListTmp) andalso not lists:member(TargetRoleID, EnemyListTmp)
                    andalso lib_role_friend:notice_friendinfo_update(MemRoleId, TargetRoleID, ?RELATION_STAT_STRANGER),
                lib_role_friend:notice_group_update(MemRoleId, NewGroup)
            end || MemRoleId <- MemList_N, MemRoleId =/= TargetRoleID];
        _ ->
            lib_role_friend:notice_del_friendinfo(Owner, TargetRoleID),
            lib_role_friend:notice_group_update(Owner, NewGroup)
    end;
check_confirm_in_group(CurGroup, TargetRoleID, Confirm) when TargetRoleID =:= 0 ->
    #group{apply_list = ApplyList} = CurGroup,
    length(ApplyList) =/= 0 orelse erlang:throw({error, ?RC_FRIEND_APPLY_LIST_EMPTY}),
    [check_confirm_in_group(CurGroup, R_ID, Confirm) || R_ID <- ApplyList];
check_confirm_in_group(_, _, _) ->
    skip.

%% @doc 加入系统群
join_in_sys_group(GroupID, TargetRoleID) when is_integer(TargetRoleID) ->
    CurGroup = get_group(GroupID),
    FriendInfo = get_role_friend(TargetRoleID),
    #role_friend{friend_list = FriendList, ban_list = BanList, enemy_list = EnemyList, group_id_list = GroupIdList} = FriendInfo,
    case CurGroup of
        #group{type = Type, mem_list = MemList} ->
            MaxNum = ?GROUP_MAX_NUM(Type),
            if
                length(MemList) >= MaxNum -> skip;
                true ->
                    {GroupIdList_N, MemList_N} = {[GroupID | GroupIdList], [TargetRoleID | MemList]},
                    NewGroup = CurGroup#group{mem_list = MemList_N},
                    update_group(GroupID, NewGroup),
                    update_role_friend(TargetRoleID, FriendInfo#role_friend{group_id_list = GroupIdList_N}),
                    NoticeIdList = lists:filter(fun(MemRoleId) ->
                        MemRoleId =/= TargetRoleID andalso not lists:member(MemRoleId, FriendList) andalso not lists:member(MemRoleId, BanList)
                            andalso not lists:member(MemRoleId, EnemyList)
                    end, MemList_N),
                    lib_role_friend:notice_friendinfo_update(TargetRoleID, NoticeIdList, ?RELATION_STAT_STRANGER),
                    lib_role_friend:notice_group_update(TargetRoleID, NewGroup),

                    [begin
                        TmpRoleFriend = get_role_friend(MemRoleId),
                        #role_friend{friend_list = FriendListTmp, ban_list = BanListTmp, enemy_list = EnemyListTmp} = TmpRoleFriend,
                        not lists:member(TargetRoleID, FriendListTmp) andalso not lists:member(TargetRoleID, BanListTmp) andalso not lists:member(TargetRoleID, EnemyListTmp)
                            andalso lib_role_friend:notice_friendinfo_update(MemRoleId, TargetRoleID, ?RELATION_STAT_STRANGER),
                        lib_role_friend:notice_group_update(MemRoleId, NewGroup)
                    end || MemRoleId <- MemList_N, MemRoleId =/= TargetRoleID]
            end;
        undefined -> skip
    end;
join_in_sys_group(GroupID, TargetRoleIDList) when is_list(TargetRoleIDList) ->
    [join_in_sys_group(GroupID, TargetRoleID) || TargetRoleID <- TargetRoleIDList];
join_in_sys_group(_, _) ->
    skip.

role_delete(RoleIds) ->
    lists:foreach(fun(RoleID) ->
        #role_friend{friend_list = FriendList, group_id_list = GroupIds, own_group_id_list = OwnerGroups}
            = get_role_friend(RoleID),
        leave_group(RoleID, GroupIds),
        dismiss_group(RoleID, OwnerGroups, true),
        delete_(FriendList, RoleID)
    end, RoleIds),
    FriendCache = #friend_cache{role_friends = RoleFriends} = get_cache(),
    set_cache(FriendCache#friend_cache{role_friends = [{Id, H} || {Id, H} <- RoleFriends,
        not lists:member(Id, RoleIds)]}).


%% 删号的时候删除好友
delete_(RoleIDs, TargetRoleId) when is_list(RoleIDs) ->
    [delete_(RoleID, TargetRoleId) || RoleID <- RoleIDs];
delete_(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, nick_names = NickNames} = RoleFriend,
    RoleFriend_N = RoleFriend#role_friend{friend_list = lists:delete(TargetRoleId, FriendList), nick_names = lists:keydelete(TargetRoleId, 1, NickNames)},
    update_role_friend(RoleID, RoleFriend_N),
    lib_role_friend:notice_id_list_update(RoleID, [?LIST_TYPE_FRIEND]),
    lib_role_friend:notice_del_friendinfo(RoleID, TargetRoleId),
    del_role_id_from_all_blocks(RoleID, TargetRoleId).


%% @doc 修改玩家群组信息
change_group_info(RoleID, Id, Name, Announce) ->
    CurGroup = check_valid_group(Id),
    #group{owner = Owner, mem_list = MemList} = CurGroup,
    RoleID =:= Owner orelse erlang:throw({error, ?RC_FRIEND_NOT_GROUP_OWNER}),
    validate_msg(Name, ?GROUP_NAME_LEN),
    validate_msg(Announce, ?GROUP_NOTICE_LEN),
    NewGroup = CurGroup#group{name = Name, announce = Announce},
    update_group(Id, NewGroup, true),
    [lib_role_friend:notice_group_update(MemRoleId, NewGroup) || MemRoleId <- MemList].

%% @doc 退出玩家群组
leave_group(RoleID, Ids) when is_list(Ids) ->
    lists:foreach(fun(Id) ->
        leave_group(RoleID, Id)
    end, Ids);
leave_group(RoleID, Id) ->
    CurGroup = check_valid_group(Id),
    #group{owner = Owner, mem_list = MemList} = CurGroup,
    RoleFriend = get_role_friend(RoleID),
    #role_friend{group_id_list = GroupIdList} = RoleFriend,
    RoleID =/= Owner orelse erlang:throw({error, ?RC_FRIEND_GROUP_OWNER_CANT_LEAVE}),
    lists:member(Id, GroupIdList) andalso lists:member(RoleID, MemList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_NOT_MEMBER}),
    update_role_friend(RoleID, RoleFriend#role_friend{group_id_list = lists:delete(Id, GroupIdList)}),
    MemList_N = lists:delete(RoleID, MemList),
    NewGroup = CurGroup#group{mem_list = MemList_N},
    update_group(Id, NewGroup),
    lib_role_friend:notice_del_group(RoleID, Id),
    lib_role_friend:notice_del_friendinfo(RoleID, MemList_N),
    [begin
        lib_role_friend:notice_group_update(MemRoleId, NewGroup),
        lib_role_friend:notice_del_friendinfo(MemRoleId, RoleID)
    end || MemRoleId <- MemList_N].

%% @doc 离开系统群组
leave_sys_group(RoleID, Id) ->
    CurGroup = get_group(Id),
    #group{type = Type, mem_list = MemList} = CurGroup,
    if
        Type > ?GROUP_TYPE_SYS_BEGIN ->
            RoleFriend = get_role_friend(RoleID),
            #role_friend{group_id_list = GroupIdList} = RoleFriend,
            update_role_friend(RoleID, RoleFriend#role_friend{group_id_list = lists:delete(Id, GroupIdList)}),
            MemList_N = lists:delete(RoleID, MemList),
            [OneMemID | _] = MemList_N,
            NewGroup = CurGroup#group{owner = OneMemID, mem_list = MemList_N},
            update_group(Id, NewGroup),
            lib_role_friend:notice_del_group(RoleID, Id),
            lib_role_friend:notice_del_friendinfo(RoleID, MemList_N),
            [begin
                lib_role_friend:notice_group_update(MemRoleId, NewGroup),
                lib_role_friend:notice_del_friendinfo(MemRoleId, RoleID)
            end || MemRoleId <- MemList_N]
    ;
        true -> skip
    end.

%% @doc 删除解散玩家群组
dismiss_group(RoleID, Id) ->
    dismiss_group(RoleID, Id, false).

dismiss_group(RoleID, Ids, SkipType) when is_list(Ids) ->
    [dismiss_group(RoleID, Id, SkipType) || Id <- Ids];
dismiss_group(RoleID, Id, SkipType) ->
    CurGroup = check_valid_group(Id, SkipType),
    #group{owner = Owner, mem_list = MemList} = CurGroup,
    SkipType orelse RoleID =:= Owner orelse erlang:throw({error, ?RC_FRIEND_NOT_GROUP_OWNER}),
    delete_group(Id),
    [begin
        RoleFriend = get_role_friend(MemRoleID),
        #role_friend{group_id_list = GroupIdList, own_group_id_list = OwnGroupIdList} = RoleFriend,
        GroupIdList_N = lists:delete(Id, GroupIdList),
        OwnGroupIdList_N = ?iif(MemRoleID =:= Owner, lists:delete(Id, OwnGroupIdList), OwnGroupIdList),
        update_role_friend(MemRoleID, RoleFriend#role_friend{group_id_list = GroupIdList_N, own_group_id_list = OwnGroupIdList_N}),
        lib_role_friend:notice_del_group(MemRoleID, Id),
        MemList_N = lists:delete(MemRoleID, MemList),
        lib_role_friend:notice_del_friendinfo(MemRoleID, MemList_N)
    end || MemRoleID <- MemList].

%% @doc 移除玩家群组成员
del_group_mem(RoleID, Id, TargetRoleID) ->
    CurGroup = check_valid_group(Id),
    #group{owner = Owner, mem_list = MemList} = CurGroup,
    RoleID =:= Owner orelse erlang:throw({error, ?RC_FRIEND_NOT_GROUP_OWNER}),
    lists:member(TargetRoleID, MemList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_NOT_MEMBER}),
    MemList_N = lists:delete(TargetRoleID, MemList),
    NewGroup = CurGroup#group{mem_list = MemList_N},
    update_group(Id, NewGroup),
    TargetRoleFriend = get_role_friend(TargetRoleID),
    #role_friend{group_id_list = GroupIdList} = TargetRoleFriend,
    update_role_friend(TargetRoleID, TargetRoleFriend#role_friend{group_id_list = lists:delete(Id, GroupIdList)}),
    lib_role_friend:notice_del_group(TargetRoleID, Id),
    lib_role_friend:notice_del_friendinfo(TargetRoleID, MemList_N),
    [lib_role_friend:notice_group_update(MemRoleId, NewGroup) || MemRoleId <- MemList_N].

%% @doc 邀请好友进入玩家群组
invite_in_group(RoleID, Id, TargetRoleID) ->
    CurGroup = check_valid_group(Id),
    #group{name = Name, mem_list = MemList} = CurGroup,
    lists:member(RoleID, MemList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_NOT_IN}),
    not lists:member(TargetRoleID, MemList) orelse erlang:throw({error, ?RC_FRIEND_GROUP_ALREADY_MEMBER}),
    RoleFriend = get_role_friend(RoleID),
    #role_friend{friend_list = FriendList} = RoleFriend,
    TargetRoleFriend = get_role_friend(TargetRoleID),
    #role_friend{friend_list = FriendList_T} = TargetRoleFriend,
    lists:member(RoleID, FriendList_T) andalso lists:member(TargetRoleID, FriendList) orelse erlang:throw({error, ?RC_FRIEND_NOT_BE_FRIENDS}),
    ?ERROR_TOC(RoleID, ?RC_FRIEND_INVITE_IN_GROUP_SUCC),
    lib_role_friend:notice_invite_in_group_msg(TargetRoleID, Id, io_lib:format(config:get_string(invite_in_group_msg), [lib_cache:get_role_name(RoleID), Name])).


%% @doc 持久化个人数据
save_to_db(RoleID) ->
    RoleFriend = get_role_friend(RoleID),
    execute_save_friend([{RoleID, RoleFriend}], 1).

%% @doc 持久化缓存
save_cache(Permanent) ->
    {_, {Hour, _, _}} = erlang:localtime(),
    CurTime = time:unixtime(),
    FriendCache = get_cache(),
    #friend_cache{group_list = GroupList} = FriendCache,
    %% 检查长期无人沟通群组
    [begin
        case CurTime - LastChatTime of
            Gap when Gap < ?GROUP_SENT_MAIL_INTERVAL ->
                SentMailList = svr_global_data:get_value(0, ?KEY_MAIL_SENT_GROUPS, []),
                svr_global_data:put_value(0, ?KEY_MAIL_SENT_GROUPS, lists:delete(GroupId, SentMailList));
            Gap when Gap < ?GROUP_AUTO_DISMISS_INTERVAL ->
                SentMailList = svr_global_data:get_value(0, ?KEY_MAIL_SENT_GROUPS, []),
                case lists:member(GroupId, SentMailList) of
                    false when Type < ?GROUP_TYPE_SYS_BEGIN ->
                        [svr_mail:sys2p(MemRoleId, ?AUTO_DISMISS_GROUP_MAIL, [Name], [], ?OPT_AUTO_DISMISS_GROUP) || MemRoleId <- MemList],
                        svr_global_data:put_value(0, ?KEY_MAIL_SENT_GROUPS, [GroupId | SentMailList]);
                    _ -> skip
                end;
            _Gap ->
                SentMailList = svr_global_data:get_value(0, ?KEY_MAIL_SENT_GROUPS, []),
                svr_global_data:put_value(0, ?KEY_MAIL_SENT_GROUPS, lists:delete(GroupId, SentMailList)),
                Type < ?GROUP_TYPE_SYS_BEGIN andalso dismiss_group(Owner, GroupId)
        end
    end || {_, #group{group_id = GroupId, type = Type, owner = Owner, mem_list = MemList, name = Name, last_chat_time = LastChatTime}} <- GroupList],

    FriendCacheNew = get_cache(),
    #friend_cache{updated = Updated, role_friends = FriendList, group_list = GroupListN} = FriendCacheNew,
    FriendListNew = case Updated of
        true when Permanent ->
            execute_save_friend(FriendList, length(FriendList));
        true when length(FriendList) > ?ACTIVE_FRIENDS_NUM ->
            execute_save_friend(FriendList, length(FriendList) - ?ACTIVE_FRIENDS_NUM);
        _ -> FriendList
    end,

    GroupListNew = case Updated of
        true when Permanent ->
            execute_save_group(GroupListN, length(GroupListN));
        true when Hour =:= 3 ->
            execute_save_group(GroupListN, length(GroupListN)),
            GroupListN;
        true when length(GroupListN) > ?ACTIVE_GROUPS_NUM ->
            execute_save_group(GroupListN, length(GroupListN) - ?ACTIVE_GROUPS_NUM);
        _ -> GroupListN
    end,
    set_cache(FriendCache#friend_cache{updated = false, role_friends = FriendListNew, group_list = GroupListNew}),
    ok.

%% @doc 初始化好友数据缓存
init_cache() ->
    FriendCache = get_cache(),
    #friend_cache{role_friends = FriendList, group_list = GroupList} = FriendCache,
    SQL = io_lib:format(?SQL_GET_FRIEND_DATA, [?ACTIVE_FRIENDS_NUM]),
    DbList = ?DB:get_all(SQL),
    FriendListN = init_friend_data(DbList, FriendList),
    SQL1 = io_lib:format(?SQL_GET_GROUP_DATA, [?ACTIVE_GROUPS_NUM]),
    DbList1 = ?DB:get_all(SQL1),
    GroupListN = init_group_data(DbList1, GroupList),
    set_cache(FriendCache#friend_cache{role_friends = FriendListN, group_list = GroupListN}).

init_friend_data([], ACC) ->
    ACC;
init_friend_data([[RoleID, DBApply, DBFriend, DBFocus, DBBan, DBEnemy, DBBeFocused, DBBlock, DBGroup, DBOwnGroup, DBMsgF, DBMsgG, DBNickNames, LastUpdateTime] | T], ACC) ->
    Data = #role_friend{
        role_id = RoleID,
        apply_list = ?TOTERM(DBApply),
        friend_list = ?TOTERM(DBFriend),
        focus_list = ?TOTERM(DBFocus),
        ban_list = ?TOTERM(DBBan),
        enemy_list = ?TOTERM(DBEnemy),
        be_focused_list = ?TOTERM(DBBeFocused),
        block_list = ?TOTERM(DBBlock),
        group_id_list = ?TOTERM(DBGroup),
        own_group_id_list = ?TOTERM(DBOwnGroup),
        offline_msg_f = ?TOTERM(DBMsgF),
        offline_msg_g = ?TOTERM(DBMsgG),
        nick_names = ?TOTERM(DBNickNames),
        last_update_time = LastUpdateTime
    },
    FriendListN = lists:keystore(RoleID, 1, ACC, {RoleID, Data}),
    init_friend_data(T, FriendListN).

init_group_data([], ACC) ->
    ACC;
init_group_data([[GroupId, Type, Name, Announce, Owner, DBMemList, DBApplyList, LastUpdateTime, LastChatTime] | T], ACC) ->
    Data = #group{
        group_id = GroupId,
        type = Type,
        name = Name,
        announce = Announce,
        owner = Owner,
        mem_list = ?TOTERM(DBMemList),
        apply_list = ?TOTERM(DBApplyList),
        last_update_time = LastUpdateTime,
        last_chat_time = LastChatTime
    },
    GroupListN = lists:keystore(GroupId, 1, ACC, {GroupId, Data}),
    init_group_data(T, GroupListN).

init_one_friend(RoleID) ->
    SQL = io_lib:format(?SQL_GET_FRIEND_DATA2, [RoleID]),
    case ?DB:get_row(SQL) of
        [DBApply, DBFriend, DBFocus, DBBan, DBEnemy, DBBeFocused, DBBlock, DBGroup, DBOwnGroup, DBMsgF, DBMsgG, DBNickNames, LastUpdateTime] ->
            #role_friend{
                role_id = RoleID,
                apply_list = ?TOTERM(DBApply),
                friend_list = ?TOTERM(DBFriend),
                focus_list = ?TOTERM(DBFocus),
                ban_list = ?TOTERM(DBBan),
                enemy_list = ?TOTERM(DBEnemy),
                be_focused_list = ?TOTERM(DBBeFocused),
                block_list = ?TOTERM(DBBlock),
                group_id_list = ?TOTERM(DBGroup),
                own_group_id_list = ?TOTERM(DBOwnGroup),
                offline_msg_f = ?TOTERM(DBMsgF),
                offline_msg_g = ?TOTERM(DBMsgG),
                nick_names = ?TOTERM(DBNickNames),
                last_update_time = LastUpdateTime
            };
        [] ->
            #role_friend{role_id = RoleID}
    end.

init_one_group(GroupId) ->
    SQL = io_lib:format(?SQL_GET_GROUP_DATA_BY_ID, [GroupId]),
    case ?DB:get_row(SQL) of
        [GroupId, Type, Name, Announce, Owner, DBMemList, DBApplyList, LastUpdateTime, LastChatTime] ->
            #group{
                group_id = GroupId,
                type = Type,
                name = Name,
                announce = Announce,
                owner = Owner,
                mem_list = ?TOTERM(DBMemList),
                apply_list = ?TOTERM(DBApplyList),
                last_update_time = LastUpdateTime,
                last_chat_time = LastChatTime
            };
        [] -> undefined
    end.

search_by_keyword(Keyword) ->
    Sql = ?SQL_GET_GROUP_DATA_BY_NAME,
    [GroupId || [GroupId] <- ?DB:get_all(io_lib:format(Sql, [Keyword, ?SEARCH_GROUP_NUM]))].

search_by_type(Type) ->
    Sql = ?SQL_GET_GROUP_DATA_BY_TYPE,
    [GroupId || [GroupId] <- ?DB:get_all(io_lib:format(Sql, [Type, ?SEARCH_GROUP_NUM]))].

get_cache() ->
%%    case erlang:get({?MODULE, friend_cache}) of
    case util:get_ets(?ETS_FRIEND, {?MODULE, friend_cache}) of
        undefined ->
            #friend_cache{};
        Cache -> Cache
    end.

set_cache(CacheData) ->
%%    erlang:put({?MODULE, friend_cache}, CacheData).
    util:put_ets(?ETS_FRIEND, {?MODULE, friend_cache}, CacheData).

%% 持久化群组
execute_save_group(GroupList, Number) ->
    {GroupListNew, StoreList} = get_store_list2(lists:reverse(GroupList), Number, []),
    db:insert_values(?SQL_SET_GROUP_DATA, ?SQL_SET_GROUP_DATA2, StoreList),
    GroupListNew.

%% 持久化好友
execute_save_friend(FriendList, Number) ->
    {FriendListNew, StoreList} = get_store_list(lists:reverse(FriendList), Number, []),
    db:insert_values(?SQL_SET_FRIEND_DATA, ?SQL_SET_FRIEND_DATA2, StoreList),
    FriendListNew.

get_store_list([], _Num, Acc) ->
    {[], Acc};
get_store_list(List, 0, Acc) ->
    {lists:reverse(List), Acc};
get_store_list([{_, RoleFriend} | T], Num, Acc) ->
    #role_friend{
        role_id = RoleId,
        apply_list = ApplyList,
        friend_list = FriendList,
        focus_list = FocusList,
        ban_list = BanList,
        enemy_list = EnemyList,
        be_focused_list = BeFocusedList,
        block_list = BlockList,
        group_id_list = GroupIdList,
        own_group_id_list = OwnGroupIdList,
        offline_msg_f = OfflineMsgF,
        offline_msg_g = OfflineMsgG,
        nick_names = NickNames,
        last_update_time = LastUpdateTime
    } = RoleFriend,
    get_store_list(T, Num - 1,
        [[RoleId, ?TOBSTR(ApplyList), ?TOBSTR(FriendList), ?TOBSTR(FocusList), ?TOBSTR(BanList), ?TOBSTR(EnemyList), ?TOBSTR(BeFocusedList), ?TOBSTR(BlockList), ?TOBSTR(GroupIdList), ?TOBSTR(OwnGroupIdList), ?TOBSTR(OfflineMsgF), ?TOBSTR(OfflineMsgG), ?TOBSTR(NickNames), LastUpdateTime] | Acc]).

get_store_list2([], _Num, Acc) ->
    {[], Acc};
get_store_list2(List, 0, Acc) ->
    {lists:reverse(List), Acc};
get_store_list2([{_, Group} | T], Num, Acc) ->
    #group{
        group_id = GroupId,
        type = Type,
        name = Name,
        announce = Announce,
        owner = Owner,
        mem_list = MemList,
        apply_list = ApplyList,
        last_update_time = LastUpdateTime,
        last_chat_time = LastChatTime
    } = Group,
    get_store_list2(T, Num - 1,
        [[GroupId, Type, Name, Announce, Owner, ?TOBSTR(MemList), ?TOBSTR(ApplyList), LastUpdateTime, LastChatTime] | Acc]).

get_rand_friend_list([], _Num, Acc, _) ->
    Acc;
get_rand_friend_list(_List, 0, Acc, _) ->
    Acc;
get_rand_friend_list(List, Num, Acc, FriendList) ->
    RandTuple = util:list_rand(List),
    List_N = lists:delete(RandTuple, List),
    {RoleID, RandFriend} = RandTuple,
    case lists:member(RoleID, FriendList) of
        true -> get_rand_friend_list(List_N, Num, Acc, FriendList);
        false -> get_rand_friend_list(List_N, Num - 1, [RandFriend | Acc], FriendList)
    end.

get_rand_group_list([], _Num, Acc, _) ->
    Acc;
get_rand_group_list(_List, 0, Acc, _) ->
    Acc;
get_rand_group_list(List, Num, Acc, GroupIdList) ->
    RandTuple = util:list_rand(List),
    List_N = lists:delete(RandTuple, List),
    {GroupId, RandGroup} = RandTuple,
    case lists:member(GroupId, GroupIdList) of
        false when RandGroup#group.type < ?GROUP_TYPE_SYS_BEGIN ->
            get_rand_group_list(List_N, Num - 1, [RandGroup | Acc], GroupIdList);
        _ -> get_rand_group_list(List_N, Num, Acc, GroupIdList)
    end.

%% 检查内容合法性
validate_msg(Msg, WordLen) ->
    Str1 = util:escape_varchar(Msg),
    Str2 = binary_to_list(Str1),
    validate_msg_sub(len, Str2, WordLen),
    validate_msg_sub(keyword, Str2).

%% 检测长度
validate_msg_sub(len, Msg, WordLen) ->
    case util:check_length(Msg, 1, WordLen) of
        false -> throw({error, ?RC_FRIEND_CONTENT_LIMIT});
        true -> true
    end.

%% 检测关键字
validate_msg_sub(keyword, Msg) ->
    case util:check_filter(Msg) of
        false -> true;
        _ -> throw({error, ?RC_FRIEND_CONTENT_SENSITIVE})
    end.

%% 操作玩家群前先检测群组是否合法
check_valid_group(Id) ->
    check_valid_group(Id, false).

check_valid_group(Id, SkipType) ->
    CurGroup = get_group(Id),
    CurGroup =/= undefined orelse erlang:throw({error, ?RC_FRIEND_GROUP_NOT_EXIST}),
    #group{type = Type} = CurGroup,
    SkipType orelse Type < ?GROUP_TYPE_SYS_BEGIN orelse erlang:throw({error, ?RC_FRIEND_GROUP_NOT_EXIST}),
    CurGroup.

%% 在所有分组中删除指定玩家ID
del_role_id_from_all_blocks(RoleID, TargetRoleId) ->
    RoleFriend = get_role_friend(RoleID),
    #role_friend{block_list = BlockList} = RoleFriend,
    length(BlockList) =/= 0 andalso
        begin
            BlockListN = [{ID, Block#friend_block{mem_list = lists:delete(TargetRoleId, MemList)}} || {ID, #friend_block{mem_list = MemList} = Block} <- BlockList],
            BlockListN =/= BlockList andalso begin update_role_friend(RoleID, RoleFriend#role_friend{block_list = BlockListN}),
            lib_role_friend:notice_block_update(RoleID, [Bk || {_, Bk} <- BlockListN]) end
        end.
