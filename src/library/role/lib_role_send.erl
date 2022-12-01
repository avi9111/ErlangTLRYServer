%%-----------------------------------------------------
%% @File     : lib_role_send
%% @Brief    : 游戏逻辑节点上消息发送
%% @Author   : shebiao <63880782@qq.com>
%% @Date     : 2015-1-6
%%-----------------------------------------------------
-module(lib_role_send).

-include("role.hrl").
-include("scene.hrl").

-export([
    send_to_sid/2,          % 推荐
    send_to_role/2,         % 推荐！！

    broadcast/1,            % 广播全服玩家bin
    broadcast/2,            % 广播给角色列表
    broadcast/3,            % 广播给角色列表(排除Except)
    broadcast_by_sid/2,     % 通过通讯进程列表广播

    send_to_area_scene/2
]).


%% Apis -----------------------------------------------
% @doc 发送信息给角色
% @param Sid 发送进程ID
% @param Bin 二进制数据
send_to_sid(Sid, Bin) when is_pid(Sid) ->
    Sid ! {send, Bin};
send_to_sid(_Sid, _Bin) ->
    skip.

%% @doc 发送信息给角色
send_to_role(_, <<>>) ->
    ignore;
send_to_role(_, Bin) when not is_binary(Bin) ->
    ignore;
send_to_role(RoleSid, Bin) when is_pid(RoleSid) ->
    send_to_sid(RoleSid, Bin);
send_to_role(RoleId, Bin) when is_integer(RoleId) ->
    RoleSid = dist:get_role_sid(RoleId),
    send_to_sid(RoleSid, Bin);
send_to_role(#role_state{sid = Sid}, Bin) ->
    send_to_sid(Sid, Bin);
send_to_role(#role_online{sid = RoleSid}, Bin) ->
    send_to_sid(RoleSid, Bin);
send_to_role(#scene_role{sid = RoleSid}, Bin) ->
    send_to_sid(RoleSid, Bin);
send_to_role(#{sid := RoleSid}, Bin) ->
    send_to_sid(RoleSid, Bin);
send_to_role(#{id := RoleId}, Bin) ->
    RoleSid = dist:get_role_sid(RoleId),
    send_to_sid(RoleSid, Bin);
send_to_role(#role{socket = Socket}, Bin) ->
    prot_debug:print_sent_prots(Bin),
    gen_tcp:send(Socket, Bin).

%% @doc 广播给当前逻辑节点的角色
broadcast(Bin) ->
    svr_role_agent:broadcast(Bin).

% @doc 广播给角色列表
broadcast(Roles, Bin) ->
    [send_to_role(Role, Bin) || Role <- Roles].

% @doc 广播给角色列表(排除Except)
broadcast(Roles, Bin, Except) ->
    [send_to_role(Role, Bin) || Role <- Roles, not lists:member(Role, Except)],
    ok.

% @doc 通过通讯进程列表广播
broadcast_by_sid(SidList, Bin) ->
    [send_to_sid(RoleSid, Bin) || RoleSid <- SidList],
    ok.

send_to_area_scene(PS, Bin) ->
    lib_scene_api:send_to_role_area_scene(PS, Bin).

%% =============================================================================
%% 内部函数
%% =============================================================================
