%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     好友系统
%%% @end
%%% Created : 06. 十二月 2018 16:07
%%%-------------------------------------------------------------------
-module(router_528).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_528.hrl").

%% API
-export([
    do/3,

    send_del_group/2,
    send_del_block/2,
    send_group_update/2,
    send_block_update/2,
    send_online_notice/2,
    send_del_friendinfo/2,
    send_friendinfo_update/2,
    send_role_id_list_update/2,
    send_invite_in_group_msg/3
]).



do(52801, State, #cs_friend_sys_info{}) ->
    case lib_role_friend:info(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52802, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        _ -> skip
    end;

do(52810, State, #cs_friend_sys_find_new{search_name = Search}) ->
    case lib_role_friend:find_new(State, Search) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52811, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        _ -> skip
    end;

do(52812, State, #cs_friend_sys_apply_add{role_id = TargetRoleId}) ->
    lib_role_friend:apply_add(State, TargetRoleId);

do(52813, State, #cs_friend_sys_confirm_add{role_id = TargetRoleId, confirm = Confirm}) ->
    lib_role_friend:confirm_add(State, TargetRoleId, Confirm);

do(52814, State, #cs_friend_sys_set_nick_name{role_id = TargetRoleId, nickname = NickName}) ->
    case lib_role_friend:set_nickname(State, TargetRoleId, NickName) of
        {ok, MsgRecord} when is_record(MsgRecord, sc_friend_sys_set_nick_name) ->
            {ok, Bin} = prot_msg:encode_msg(52840, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        err -> err
    end;

do(52815, State, #cs_friend_sys_del_nick_name{role_id = TargetRoleId}) ->
    case lib_role_friend:del_nickname(State, TargetRoleId) of
        {ok, MsgRecord} when is_record(MsgRecord, sc_friend_sys_del_nick_name) ->
            {ok, Bin} = prot_msg:encode_msg(52841, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        err -> err
    end;

do(52816, State, #cs_friend_sys_focus{role_id = TargetRoleId}) ->
    lib_role_friend:focus(State, TargetRoleId);

do(52817, State, #cs_friend_sys_ban_role{role_id = TargetRoleId}) ->
    lib_role_friend:ban_role(State, TargetRoleId);

do(52818, State, #cs_friend_sys_add_enemy{role_id = TargetRoleId}) ->
    lib_role_friend:add_enemy(State, TargetRoleId);

do(52820, State, #cs_friend_sys_del_friend{del_list = DelList}) ->
    lib_role_friend:del_friend(State, DelList);

do(52821, State, #cs_friend_sys_create_block{name = Name}) ->
    lib_role_friend:create_block(State, Name);

do(52822, State, #cs_friend_sys_rename_block{id = Id, name = Name}) ->
    lib_role_friend:rename_block(State, Id, Name);

do(52823, State, #cs_friend_sys_del_block{id = Id}) ->
    lib_role_friend:del_block(State, Id);

do(52824, State, #cs_friend_sys_add2_block{id = Id, role_id_list = RoleIdList}) ->
    lib_role_friend:add2_block(State, Id, RoleIdList);

do(52825, State, #cs_friend_sys_find_group{keyword = Keyword, type = Type}) ->
    case lib_role_friend:find_group(State, Keyword, Type) of
        {ok, MsgRecord} when is_record(MsgRecord, sc_friend_sys_find_group) ->
            {ok, Bin} = prot_msg:encode_msg(52826, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        _ -> skip
    end;

do(52827, State, #cs_friend_sys_create_group{type = Type, name = Name, announce = Announce}) ->
    case catch lib_role_friend:create_group(State, Type, Name, Announce) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52828, State, #cs_friend_sys_apply_in_group{id = Id}) ->
    lib_role_friend:apply_in_group(State, Id);

do(52829, State, #cs_friend_sys_confirm_in_group{id = Id, role_id = RoleID, confirm = Confirm}) ->
    lib_role_friend:confirm_in_group(State, Id, RoleID, Confirm);

do(52830, State, #cs_friend_sys_change_group_info{id = Id, name = Name, announce = Announce}) ->
    lib_role_friend:change_group_info(State, Id, Name, Announce);

do(52831, State, #cs_friend_sys_leave_group{id = Id}) ->
    lib_role_friend:leave_group(State, Id);

do(52832, State, #cs_friend_sys_dismiss_group{id = Id}) ->
    lib_role_friend:dismiss_group(State, Id);

do(52833, State, #cs_friend_sys_del_group_mem{id = Id, role_id = TargetRoleID}) ->
    lib_role_friend:del_group_mem(State, Id, TargetRoleID);

do(52834, State, #cs_friend_sys_invite_in_group{id = Id, role_id = TargetRoleID}) ->
    lib_role_friend:invite_in_group(State, Id, TargetRoleID);








do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

%% @doc 下发好友ID列表更新
send_role_id_list_update(State, UpdateIdList) ->
    MsgRecord = #sc_friend_sys_update_role_id_list{
        update_id_list = UpdateIdList
    },
    {ok, Bin} = prot_msg:encode_msg(52803, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发好友基本数据列表更新
send_friendinfo_update(State, UpdateInfoList) ->
    MsgRecord = #sc_friend_sys_update_info_list{
        update_info_list = UpdateInfoList
    },
    {ok, Bin} = prot_msg:encode_msg(52804, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发清除前端好友数据缓存
send_del_friendinfo(State, Del_List) ->
    MsgRecord = #sc_friend_sys_del_role_info{
        del_list = Del_List
    },
    {ok, Bin} = prot_msg:encode_msg(52807, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发上线通知
send_online_notice(State, RoleID) ->
    MsgRecord = #sc_friend_online_notice{
        role_id = RoleID
    },
    {ok, Bin} = prot_msg:encode_msg(52842, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发更新好友分组
send_block_update(State, NewBlockList) ->
    MsgRecord = #sc_friend_sys_update_block{
        new_blocks = NewBlockList
    },
    {ok, Bin} = prot_msg:encode_msg(52805, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发删除分组
send_del_block(State, Id) ->
    MsgRecord = #sc_friend_sys_del_block{
        id = Id
    },
    {ok, Bin} = prot_msg:encode_msg(52808, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发更新好友群组
send_group_update(State, NewGroup) ->
    #friend_group{owner = Owner} = NewGroup,
    MsgRecord = #sc_friend_sys_update_group{
        new_group = ?iif(State#role_state.id =:= Owner, NewGroup, NewGroup#friend_group{apply_list = []})
    },
    {ok, Bin} = prot_msg:encode_msg(52806, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发删除群组
send_del_group(State, Id) ->
    MsgRecord = #sc_friend_sys_del_group{
        id = Id
    },
    {ok, Bin} = prot_msg:encode_msg(52809, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发邀请好友进入玩家群组提示
send_invite_in_group_msg(State, Id, Msg) ->
    MsgRecord = #sc_friend_sys_invite_in_group{
        id = Id,
        msg = Msg
    },
    {ok, Bin} = prot_msg:encode_msg(52835, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).