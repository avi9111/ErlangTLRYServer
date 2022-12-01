%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     好友系统
%%% @end
%%% Created : 06. 十二月 2018 9:23
%%%-------------------------------------------------------------------
-module(svr_friend).
-author("Tom").

-behaviour(gen_server).

-include("common.hrl").
-include("friend.hrl").
-include("ret_code.hrl").
-include("proto/prot_528.hrl").

-define(TIMEOUT, 10000).
-define(SERVER, ?MODULE).

%% External API
-export([
    start_link/0
]).

% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-export([
    focus/2,
    ban_role/2,
    apply_add/2,
    add_enemy/2,
    broadcast/3,
    permanent/0,
    get_group/1,
    del_block/2,
    del_friend/2,
    role_delete/1,
    add2_block/3,
    save_to_db/1,
    confirm_add/3,
    leave_group/2,
    create_group/4,
    create_block/3,
    rename_block/3,
    set_nickname/3,
    del_nickname/2,
    del_group_mem/3,
    dismiss_group/2,
    dismiss_group/3,
    apply_in_group/2,
    invite_in_group/3,
    get_role_friend/1,
    del_offline_msg/1,
    leave_sys_group/2,
    confirm_in_group/4,
    change_group_info/4,
    join_in_sys_group/2,
    get_recommend_groups/2,
    get_recommend_friends/2,
    set_role_friend/2,
    do_handle_cast/2,
    do_handle_call/3
]).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).


%% @doc 持久化离线数据
permanent() ->
    cast(permanent).

%% @doc 获取好友数据
get_role_friend(RoleID) ->
    call({get_role_friend, RoleID}).

set_role_friend(RoleID, RoleFriend) ->
    cast({set_role_friend, RoleID, RoleFriend}).

%% @doc 获取群组
%% GroupId，群组ID或者群组ID列表
get_group(GroupId) ->
    call({get_group, GroupId}).

%% @doc 获取推荐好友数据列表，不在已加好友列表内
get_recommend_friends(Number, FriendList) ->
    call({recommend_friends, Number, FriendList}).

%% @doc 获取推荐群组列表，不包括已进群组
get_recommend_groups(Number, GroupIdList) ->
    call({recommend_groups, Number, GroupIdList}).

%% @doc 删除离线消息
del_offline_msg(RoleID) ->
    cast({del_offline_msg, RoleID}).

%% @doc 申请添加好友
apply_add(RoleID, TargetRoleId) ->
    cast({apply_add, RoleID, TargetRoleId}).

%% @doc 确认好友申请
confirm_add(RoleID, TargetRoleId, Confirm) ->
    cast({confirm_add, RoleID, TargetRoleId, Confirm}).

%% @doc 设置好友昵称
set_nickname(RoleID, TargetRoleId, NickName) ->
    call({set_nickname, RoleID, TargetRoleId, NickName}).

%% @doc 删除好友昵称
del_nickname(RoleID, TargetRoleId) ->
    call({del_nickname, RoleID, TargetRoleId}).

%% @doc 关注好友或者取消关注
focus(RoleID, TargetRoleId) ->
    cast({focus, RoleID, TargetRoleId}).

%% @doc 拉黑某玩家，或者取消拉黑
ban_role(RoleID, TargetRoleId) ->
    cast({ban_role, RoleID, TargetRoleId}).

%% @doc 添加仇人，或者取消仇人关系
add_enemy(RoleID, TargetRoleId) ->
    cast({add_enemy, RoleID, TargetRoleId}).

%% @doc 删除好友
del_friend(RoleID, DelList) ->
    cast({del_friend, RoleID, DelList}).
%% @doc 删号的时候删除好友
role_delete(RoleIDs) ->
    cast({role_delete, RoleIDs}).

%% @doc 新建分组
create_block(RoleID, Name, Index) ->
    cast({create_block, RoleID, Name, Index}).

%% @doc 分组改名
rename_block(RoleID, Id, Name) ->
    cast({rename_block, RoleID, Id, Name}).

%% @doc 删除分组
del_block(RoleID, Id) ->
    cast({del_block, RoleID, Id}).

%% @doc 把好友添加到分组
add2_block(RoleID, Id, RoleIdList) ->
    cast({add2_block, RoleID, Id, RoleIdList}).

%% @doc 新建玩家群组
create_group(RoleID, Type, Name, Announce) ->
    call({create_group, RoleID, Type, Name, Announce}).

%% @doc 申请进入玩家群组
apply_in_group(RoleID, Id) ->
    cast({apply_in_group, RoleID, Id}).

%% @doc 确认申请进入玩家群组
confirm_in_group(RoleID, Id, TargetRoleID, Confirm) ->
    cast({confirm_in_group, RoleID, Id, TargetRoleID, Confirm}).

%% @doc 进入系统群组
join_in_sys_group(GroupID, TargetRoleID) ->
    cast({join_in_sys_group, GroupID, TargetRoleID}).

%% @doc 修改玩家群组信息
change_group_info(RoleID, Id, Name, Announce) ->
    cast({change_group_info, RoleID, Id, Name, Announce}).

%% @doc 退出玩家群组
leave_group(RoleID, Id) ->
    cast({leave_group, RoleID, Id}).

%% @doc 退出系统群组
leave_sys_group(RoleID, Id) ->
    cast({leave_sys_group, RoleID, Id}).

%% @doc 删除解散玩家群组
dismiss_group(RoleID, Id) ->
    dismiss_group(RoleID, Id, false).

dismiss_group(RoleID, Id, SkipType) ->
    cast({dismiss_group, RoleID, Id, SkipType}).

%% @doc 移除玩家群组成员
del_group_mem(RoleID, Id, TargetRoleID) ->
    cast({del_group_mem, RoleID, Id, TargetRoleID}).

%% @doc 邀请好友进入玩家群组
invite_in_group(RoleID, Id, TargetRoleID) ->
    cast({invite_in_group, RoleID, Id, TargetRoleID}).

broadcast(GroupID, Bin, Except) ->
    cast({broadcast, GroupID, Bin, Except}).

%% @doc 持久化个人数据
save_to_db(RoleID) ->
    cast({save_to_db, RoleID}).

%%------------------------------------------------------------------------
pid() ->
    case dist:whereis_name(local, ?SERVER) of
        Pid when is_pid(Pid) -> Pid;
        _ -> erlang:throw({error, ?RC_SYS_ERROR})
    end.

call(Req) ->
    gen_server:call(pid(), Req, ?TIMEOUT).

cast(Req) ->
    gen_server:cast(pid(), Req).


init([]) ->
    erlang:send_after(?SAVE_CACHE_INTERVAL, self(), save_cache),
    lib_friend:init_cache(),
    erlang:process_flag(trap_exit, true),
    {ok, #state{}}.

%%---------------------gen_server callback--------------------------------------
handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.



do_handle_call({create_group, RoleID, Type, Name, Announce}, _From, State) ->
    Reply = case catch lib_friend:create_group(RoleID, Type, Name, Announce) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        GroupID -> GroupID
    end,
    {reply, Reply, State};
do_handle_call({get_role_friend, RoleID}, _From, State) ->
    RoleFriend = lib_friend:get_role_friend(RoleID),
    #role_friend{friend_list = FriendList, block_list = BlockList, group_id_list = GroupIdList, own_group_id_list = OwnGroupIdList} = RoleFriend,
    BlockListN = [begin
        #friend_block{mem_list = Memlist} = Block,
        MemlistN = lists:filter(fun(R_Id) -> lists:member(R_Id, FriendList) end, Memlist),
        {ID, Block#friend_block{mem_list = MemlistN}}
    end || {ID, Block} <- BlockList],
    GroupIdListN = [GroupId || GroupId <- GroupIdList, lib_friend:is_member(GroupId, RoleID)],
    OwnGroupIdListN = [GroupId || GroupId <- OwnGroupIdList, lib_friend:is_member(GroupId, RoleID)],
    RoleFriend_N = RoleFriend#role_friend{block_list = BlockListN, group_id_list = GroupIdListN, own_group_id_list = OwnGroupIdListN},
    BlockList =:= BlockListN andalso GroupIdList =:= GroupIdListN andalso OwnGroupIdList =:= OwnGroupIdListN orelse lib_friend:update_role_friend(RoleID, RoleFriend_N),
    {reply, RoleFriend_N, State};
do_handle_call({get_group, GroupId}, _From, State) ->
    Group = lib_friend:get_group(GroupId),
    {reply, Group, State};
do_handle_call({recommend_friends, Number, FriendList}, _From, State) ->
    Friend_list = lib_friend:get_random_role_friends(Number, FriendList),
    {reply, Friend_list, State};
do_handle_call({recommend_groups, Number, GroupIdList}, _From, State) ->
    Group_list = lib_friend:get_random_groups(Number, GroupIdList),
    {reply, Group_list, State};
do_handle_call({set_nickname, RoleID, TargetRoleId, NickName}, _From, State) ->
    Ret = case catch lib_friend:set_nickname(RoleID, TargetRoleId, NickName) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode), false;
        _ -> true
    end,
    {reply, Ret, State};
do_handle_call({del_nickname, RoleID, TargetRoleId}, _From, State) ->
    Ret = case catch lib_friend:del_nickname(RoleID, TargetRoleId) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode), false;
        _ -> true
    end,
    {reply, Ret, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.



do_handle_cast(permanent, State) ->
    lib_friend:save_cache(true),
    {noreply, State};
do_handle_cast(save_cache, State) ->
    erlang:send_after(?SAVE_CACHE_INTERVAL, self(), save_cache),
    lib_friend:save_cache(false),
    {noreply, State};
do_handle_cast({del_offline_msg, RoleID}, State) ->
    lib_friend:del_offline_msg(RoleID),
    {noreply, State};
do_handle_cast({apply_add, RoleID, TargetRoleId}, State) ->
    case catch lib_friend:apply_add(RoleID, TargetRoleId) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({confirm_add, RoleID, TargetRoleId, Confirm}, State) ->
    case catch lib_friend:confirm_add(RoleID, TargetRoleId, Confirm) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({focus, RoleID, TargetRoleId}, State) ->
    case catch lib_friend:focus(RoleID, TargetRoleId) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({ban_role, RoleID, TargetRoleId}, State) ->
    case catch lib_friend:ban_role(RoleID, TargetRoleId) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({add_enemy, RoleID, TargetRoleId}, State) ->
    case catch lib_friend:add_enemy(RoleID, TargetRoleId) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({del_friend, RoleID, DelList}, State) ->
    case catch lib_friend:del_friend(RoleID, DelList) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({role_delete, RoleIDs}, State) ->
    lib_friend:role_delete(RoleIDs),
    {noreply, State};
do_handle_cast({create_block, RoleID, Name, Index}, State) ->
    case catch lib_friend:create_block(RoleID, Name, Index) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({rename_block, RoleID, Id, Name}, State) ->
    case catch lib_friend:rename_block(RoleID, Id, Name) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({del_block, RoleID, Id}, State) ->
    case catch lib_friend:del_block(RoleID, Id) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({add2_block, RoleID, Id, RoleIdList}, State) ->
    case catch lib_friend:add2_block(RoleID, Id, RoleIdList) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({apply_in_group, RoleID, Id}, State) ->
    case catch lib_friend:apply_in_group(RoleID, Id) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({confirm_in_group, RoleID, Id, TargetRoleID, Confirm}, State) ->
    case catch lib_friend:confirm_in_group(RoleID, Id, TargetRoleID, Confirm) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({change_group_info, RoleID, Id, Name, Announce}, State) ->
    case catch lib_friend:change_group_info(RoleID, Id, Name, Announce) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({leave_group, RoleID, Id}, State) ->
    case catch lib_friend:leave_group(RoleID, Id) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({leave_sys_group, RoleID, Id}, State) ->
    lib_friend:leave_sys_group(RoleID, Id),
    {noreply, State};
do_handle_cast({dismiss_group, RoleID, Id, SkipType}, State) ->
    case catch lib_friend:dismiss_group(RoleID, Id, SkipType) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({del_group_mem, RoleID, Id, TargetRoleID}, State) ->
    case catch lib_friend:del_group_mem(RoleID, Id, TargetRoleID) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({invite_in_group, RoleID, Id, TargetRoleID}, State) ->
    case catch lib_friend:invite_in_group(RoleID, Id, TargetRoleID) of
        {error, RetCode} -> ?ERROR_TOC(RoleID, RetCode);
        _ -> skip
    end,
    {noreply, State};
do_handle_cast({save_to_db, RoleID}, State) ->
    lib_friend:save_to_db(RoleID),
    {noreply, State};
do_handle_cast({broadcast, GroupID, Bin, Except}, State) ->
    lib_friend:broadcast(GroupID, Bin, Except),
    {noreply, State};
do_handle_cast({set_role_friend, RoleID, RoleFriend}, State) ->
    lib_friend:set_role_friend(RoleID, RoleFriend),
    {noreply, State};
do_handle_cast({join_in_sys_group, GroupID, TargetRoleID}, State) ->
    lib_friend:join_in_sys_group(GroupID, TargetRoleID),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.


