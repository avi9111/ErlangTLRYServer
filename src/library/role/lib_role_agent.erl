%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     在线玩家管理
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_agent).
-author("Ryuu").

-include("log.hrl").
-include("role.hrl").
-include("ets_defines.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

%% API
-export([
    online/1,
    select/1,
    update/2,
    offline/1,
    broadcast/1,
    broadcast/2,
    is_online/1,
    get_scene/1,
    get_source/1,
    is_hanging/1,
    log_online/0,
    online_num/0,
    select_info/2,
    info_online/1,
    get_online_info/1,
    select_mod_info/3,
    select_broadcast/2,
    select_broadcast/3,
    init_online_dict/0
]).

%% @doc online
online(Role) ->
    set_online_info(Role).

%% @doc offline
offline(RoleID) ->
    del_online_info(RoleID).

% @doc 在线日志(按渠道)
log_online() ->
    Time = time:unixtime(),
    OnlineDict = get(online_dict),
    DbList = [
        [Source, Online, Time]
        || {Source, Online} <- dict:to_list(OnlineDict)
    ],
    Sql = <<"INSERT INTO `log_online` (`source`, `online`, `ctime`) VALUES ~s">>,
    Fmt = <<"('~s', ~p, ~p)">>,
    db:insert_values(Sql, Fmt, DbList).

%% @doc 在线人数
online_num() ->
    ets:info(?ETS_ONLINE, size).

%% @doc 在线玩家列表
get_online() ->
    select(online).

%% @doc 是否在线
is_online(RoleID) ->
    get_online_info(RoleID) =/= undefined.

%% @doc 是否在线
is_hanging(RoleID) ->
    case get_online_info(RoleID) of
        #role_online{hanging = Hanging} -> Hanging;
        _ -> false
    end.

get_source(RoleID) ->
    case get_online_info(RoleID) of
        #role_online{source = Source} -> Source;
        _ -> "unknown"
    end.

get_scene(RoleID) ->
    case get_online_info(RoleID) of
        #role_online{scene = Scene} -> Scene;
        _ -> 0
    end.

%% @doc 更新
update(RoleID, {Pos, V}) ->
    ets:update_element(?ETS_ONLINE, RoleID, {Pos, V});
update(RoleID, KvList) when is_list(KvList) ->
    OnlineInfo = get_online_info(RoleID),
    NewInfo = update2(OnlineInfo, KvList),
    set_online_info(NewInfo).

update2(Info, List) when is_list(List), is_record(Info, role_online) ->
    lists:foldl(fun({Pos, V}, Acc) ->
        erlang:setelement(Pos, Acc, V)
    end, Info, List);
update2(_, _) ->
    undefined.

%% -----------------------------------------------------------------------------
%% 消息
%% -----------------------------------------------------------------------------

%% @doc 发送消息给玩家
info_online(Info) ->
    OnlineList = get_online(),
    info_list(OnlineList, Info).

%% @doc 发送消息给指定场景玩家
select_info(Type, Info) ->
    RoleList = select(Type),
    info_list(RoleList, Info).

info_list(RoleList, Info) ->
    [lib_role:info_role(RoleID, Info) || RoleID <- RoleList].

%% @doc mod_info
select_mod_info(Type, Mod, Info) ->
    RoleList = select(Type),
    mod_info_list(RoleList, Mod, Info).

mod_info_list(RoleList, Mod, Info) ->
    [lib_role:mod_info(RoleID, Mod, Info) || RoleID <- RoleList].

%% -----------------------------------------------------------------------------
%% 广播
%% -----------------------------------------------------------------------------

%% @doc 广播
broadcast(Bin) ->
    OnlineList = get_online(),
    broadcast_to(OnlineList, Bin).

%% @doc 广播 [过滤]
broadcast(Bin, RoleID) when is_integer(RoleID) ->
    broadcast(Bin, [RoleID]);
broadcast(Bin, ExceptList) ->
    OnlineList = get_online(),
    broadcast_to_except(OnlineList, Bin, ExceptList).

%% @doc 条件广播
select_broadcast(Type, Bin) ->
    RoleList = select(Type),
    broadcast_to(RoleList, Bin).

%% @doc 条件广播 [过滤]
select_broadcast(Type, Bin, RoleID) when is_integer(RoleID) ->
    select_broadcast(Type, Bin, [RoleID]);
select_broadcast(Type, Bin, ExceptList) ->
    RoleList = select(Type),
    broadcast_to_except(RoleList, Bin, ExceptList).

%% @doc 初始化渠道在线数据
init_online_dict() ->
    GenDictFun = fun(#role_online{source = Source}, Acc) ->
        dict:update_counter(Source, 1, Acc)
    end,
    OnlineRoles = ets:tab2list(?ETS_ONLINE),
    Dict = lists:foldl(GenDictFun, dict:new(), OnlineRoles),
    put(online_dict, Dict).

broadcast_to([], _Bin) ->
    ok;
broadcast_to([RoleID | T], Bin) ->
    lib_role_send:send_to_role(RoleID, Bin),
    broadcast_to(T, Bin).

broadcast_to_except([], _Bin, _ExceptList) ->
    ok;
broadcast_to_except([RoleID | T], Bin, ExceptList) ->
    case lists:member(RoleID, ExceptList) of
        false -> lib_role_send:send_to_role(RoleID, Bin);
        _ -> ignore
    end,
    broadcast_to_except(T, Bin, ExceptList).

%% @doc 筛选
select(all) ->
    select(online);
select(online) ->                          %% 在线、所有
    Fun = ets:fun2ms(fun(#role_online{id = RoleID}) -> RoleID end),
    ets:select(?ETS_ONLINE, Fun);
select(pid) ->
    ets:match(?ETS_ONLINE, #role_online{pid = '$1', _ = '_'});
select(guild) ->                           %% 拥有帮派
    Fun = ets:fun2ms(fun(#role_online{id = RoleID, guild_id = GuildID}) when GuildID > 0 -> RoleID end),
    ets:select(?ETS_ONLINE, Fun);
select({guild, ID}) ->                     %% 指定帮派
    Fun = ets:fun2ms(fun(#role_online{id = RoleID, guild_id = GuildID}) when GuildID =:= ID -> RoleID end),
    ets:select(?ETS_ONLINE, Fun);
select({scene, ID}) ->                     %% 指定场景
    Fun = ets:fun2ms(fun(#role_online{id = RoleID, scene = SceneID}) when SceneID =:= ID -> RoleID end),
    ets:select(?ETS_ONLINE, Fun);
select({lv, Min}) ->                       %% 指定等级范围
    Fun = ets:fun2ms(fun(#role_online{id = RoleID, level = Level}) when Level >= Min -> RoleID end),
    ets:select(?ETS_ONLINE, Fun);
select({lv, Min, Max}) ->                  %% 指定等级范围
    Fun = ets:fun2ms(fun(#role_online{id = RoleID, level = Level}) when Level >= Min, Level =< Max -> RoleID end),
    ets:select(?ETS_ONLINE, Fun);
select({accname, Accname}) ->              %% 指定账号
    Fun = ets:fun2ms(fun(#role_online{id = RoleID, accname = RAccname, device = Device}) when RAccname =:= Accname -> {RoleID, Device} end),
    ets:select(?ETS_ONLINE, Fun);
select(_T) ->
    [].

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

get_online_info(RoleID) ->
    case ets:lookup(?ETS_ONLINE, RoleID) of
        [Info] -> Info;
        _ -> undefined
    end.

set_online_info(Info) when is_record(Info, role_online) ->
    update_online_dict(online, Info#role_online.source),
    ets:insert(?ETS_ONLINE, Info);
set_online_info(_) ->
    ignore.

del_online_info(RoleID) ->
    Source = ets:lookup_element(?ETS_ONLINE, RoleID, #role_online.source),
    update_online_dict(offline, Source),
    ets:delete(?ETS_ONLINE, RoleID).

% 更新在线人数(分渠道)
update_online_dict(online, Source) ->
    Dict = get(online_dict),
    DictN = dict:update_counter(Source, 1, Dict),
    put(online_dict, DictN);
update_online_dict(offline, Source) ->
    Dict = get(online_dict),
    DictN = dict:update_counter(Source, -1, Dict),
    put(online_dict, DictN).
