%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     GM命令
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_gm).
-author("Ryuu").

-include("common.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("keyvalue.hrl").

%% 邮件
-export([
    sys2p/4,
    sys2common/4,
    sys2online/4,
    sys2select/4
]).

%% 传闻
-export([
    reinit_rumor/0,
    rumor_change/1,
    rumor_deleted/1
]).

%% 活动
-export([
    stop_activity/1,
    start_activity/1,
    remove_activity/1,
    add_operation_activity/1,
    add_operation_activity/7,
    update_operation_activity/1,
    remove_operation_activity/1,
    reset_all_activity_enter_times/0
]).

%% 副本
-export([
    reset_dungeon/2,
    reset_all_dungeon/1
]).

%% 排行榜
-export([
    refresh_rank/1
]).

%% 聊天
-export([
    ban_chat/3,
    unban_chat/1
]).

%% 封禁
-export([
    ban_ip/1,
    unban_ip/1,
    ban_role/1,
    unban_role/1,
    ban_device/1,
    unban_device/1
]).

%% 内测接口
-export([
    add_white_accname/1,
    add_white_accname/5,
    del_white_accname/1
]).

-export([
    role_auction/1,
    guild_auction/1
]).

%% 客户端gm
-export([
    cheat/2
]).

%% 玩家相关
-export([
    set_role_level/2
]).

%% -----------------------------------------------------------------------------
%% 邮件
%% -----------------------------------------------------------------------------

sys2p(RoleID, Title, Content, Items) ->
    NewItems = type:convert_db_field(list, Items, []),
    svr_mail:sys2p(RoleID, Title, Content, NewItems, ?OPT_GM).

sys2common(Scope, Title, Content, Items) ->
    NewItems = type:convert_db_field(list, Items, []),
    NewScope = convert_mail_string(Scope),
    svr_mail:sys2common(NewScope, Title, Content, NewItems, ?OPT_GM).

sys2online(Scope, Title, Content, Items) ->
    NewItems = type:convert_db_field(list, Items, []),
    NewScope = convert_mail_string(Scope),
    svr_mail:sys2online(NewScope, Title, Content, NewItems, ?OPT_GM).

sys2select(RoleList, Title, Content, Items) ->
    NewItems = type:convert_db_field(list, Items, []),
    NewRoleList = type:convert_db_field(list, RoleList, []),
    svr_mail:sys2select(NewRoleList, Title, Content, NewItems, ?OPT_GM).

convert_mail_string(Items) ->
    type:bitstring_to_term(Items).

%% -----------------------------------------------------------------------------
%% 传闻
%% -----------------------------------------------------------------------------

reinit_rumor() ->
    ?INFO("rumor re_init", []),
    svr_rumor:re_init().

rumor_change(ID) ->
    ?INFO("rumor change ~w", [ID]),
    svr_rumor:gm_rumor_change(ID).

rumor_deleted(ID) ->
    ?INFO("rumor delete ~w", [ID]),
    svr_rumor:gm_del_rumor(ID).

%% -----------------------------------------------------------------------------
%% 活动
%% -----------------------------------------------------------------------------

%% @doc 启动活动
start_activity(ActID) ->
    ?INFO("gm start activity ~w", [ActID]),
    svr_activity_mgr:gm_start_activity(ActID).

%% @doc 结束活动
stop_activity(ActID) ->
    ?INFO("gm stop activity ~w", [ActID]),
    svr_activity_mgr:gm_stop_activity(ActID).

%% @doc 移除活动
remove_activity(ActID) ->
    ?INFO("gm remove activity ~w", [ActID]),
    svr_activity_mgr:gm_remove_activity(ActID).

%% @doc 添加运营活动
add_operation_activity(Fields) ->
    svr_activity_mgr:add_operation_activity(Fields).

add_operation_activity(OpID, ActID, Timing, CBeginTime, CEndTime, Index, Valid) ->
    add_operation_activity([OpID, ActID, Timing, CBeginTime, CEndTime, Index, Valid]).

%% @doc 更新运营活动
update_operation_activity(ID) ->
    ?INFO("update operation activity ~w", [ID]),
    svr_activity_mgr:update_operation_activity(ID).

%% @doc 禁用、移除运营活动
remove_operation_activity(ID) ->
    ?INFO("remove operation activity ~w", [ID]),
    svr_activity_mgr:remove_operation_activity(ID).

%% @doc 重置所有在线玩家活动每日进入活动次数
reset_all_activity_enter_times() ->
    OnlineIds = lib_role_agent:select(online),
    [
        lib_role:apply_cast(RoleId, {lib_role_cheat, do_reset_all_activity_enter_times, [RoleId]})
        || RoleId <- OnlineIds
    ].

%% @doc 设置玩家等级
set_role_level(RoleID, Lv) ->
    lib_role:mod_info(RoleID, lib_role_level, {'set_role_lv', Lv}).

%% -----------------------------------------------------------------------------
%% 副本
%% -----------------------------------------------------------------------------

%% @doc 重置指定副本 [在线]
reset_dungeon(RoleID, DungID) ->
    cheat(RoleID, io_lib:format("reset_dung_~w", [DungID])).

%% @doc 重置所有副本 [在线]
reset_all_dungeon(RoleID) ->
    cheat(RoleID, "reset_all_dung").

%% -----------------------------------------------------------------------------
%% 排行榜
%% -----------------------------------------------------------------------------

refresh_rank(RankID) ->
    svr_rank:refresh_rank(RankID).

%% -----------------------------------------------------------------------------
%% 禁言
%% -----------------------------------------------------------------------------

ban_chat(RoleID, Type, Time) ->
    svr_chat:ban(RoleID, Type, Time).

unban_chat(RoleID) ->
    svr_chat:unban(RoleID).

%% -----------------------------------------------------------------------------
%% 封禁
%% -----------------------------------------------------------------------------

ban_role(RoleID) when is_integer(RoleID) ->
    ban_role([RoleID]);
ban_role(RoleList) when is_list(RoleList) ->
    svr_ban:ban_roles(RoleList).

unban_role(RoleID) when is_integer(RoleID) ->
    unban_role([RoleID]);
unban_role(RoleList) when is_list(RoleList) ->
    svr_ban:unban_roles(RoleList).

ban_ip(IpStr) ->
    svr_ban:ban_ip(IpStr).

unban_ip(IpStr) ->
    svr_ban:unban_ip(IpStr).

ban_device(DeviceStr) ->
    svr_ban:ban_device(DeviceStr).

unban_device(DeviceStr) ->
    svr_ban:unban_device(DeviceStr).


%% -----------------------------------------------------------------------------
% 内测接口
%% -----------------------------------------------------------------------------
add_white_accname(Accname) ->
    Sql = <<"REPLACE INTO `base_white_accname` (`accname`, `ip`) VALUES ('~s', 'all')">>,
    ?DB:execute(io_lib:format(Sql, [Accname])).

add_white_accname(Accname, Num1, Num2, Num3, Num4) ->
    IpRaw = type:term_to_bitstring({Num1, Num2, Num3, Num4}),
    Sql = <<"REPLACE INTO `base_white_accname` (`accname`, `ip`) VALUES ('~s', '~s')">>,
    ?DB:execute(io_lib:format(Sql, [Accname, IpRaw])).


del_white_accname(Accname) ->
    Sql = <<"DELETE FROM `base_white_accname` WHERE `accname` = '~s'">>,
    ?DB:execute(io_lib:format(Sql, [Accname])).

%% -----------------------------------------------------------------------------
%% 拍卖行
%% -----------------------------------------------------------------------------

role_auction(RoleID) ->
    cheat(RoleID, "auction").

guild_auction(GuildID) ->
    Items = util:list_rand_n(conf_auction_item:get_ids(), 10),
    ChiefID = lib_guild:get_chief_id(GuildID),
    ChiefID > 0 andalso lib_auction_util:boss_auction([{GuildID, Items, [{ChiefID, 1.2}]}]).

%% -----------------------------------------------------------------------------
%% 其它
%% -----------------------------------------------------------------------------

%% @doc 玩家秘籍
cheat(RoleID, Command) ->
    lib_role:mod_info(RoleID, lib_role_cheat, {cheat, Command}).
