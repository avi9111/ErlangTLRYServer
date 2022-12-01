%%-------------------------------------------------------
%% @File     : util_svr.erl
%% @Brief    : 服务器状态相关
%% @Author   : cablsbs
%% @Date     : 2018-11-10
%%-------------------------------------------------------
-module(util_svr).

-include("common.hrl").
-include("ets_defines.hrl").

-export([
    get_open_time/0,
    get_merge_time/0,
    get_merge_count/0,
    get_start_time/0,
    get_server_type/0,
    get_node_id/0,

    is_server_opened/0,
    is_server_merged/0,
    is_closing_svr/0,

    is_kfcenter/0,
    is_group_server/0,
    is_cross_server/0,
    is_logic_server/0,
    is_cluster/0,
    is_cross/2,

    c_open_time/1,
    c_open_time_gm/1,
    c_merge_time/1,
    c_merge_time/3,
    get_world_lv/0,
    def_pioneer_lv/0,
    get_pioneer_lv/0,
    set_pioneer_lv/1,
    has_pioneer_eff/1,
    set_closing_svr/0
]).


%% Apis -------------------------------------------------
%% @doc 获取开服时间
get_open_time() ->
    case ets:lookup(?ETS_SERVER_STATE, open_time) of
        [#server_state{value = V}] when is_integer(V) -> V;
        _ -> time:unixdate()
    end.

%% @doc 获取合服时间，等于0表示非合服状态
get_merge_time() ->
    case ets:lookup(?ETS_SERVER_STATE, merge_time) of
        [#server_state{value = V}] when is_integer(V) -> V;
        _ -> 0
    end.

%% @doc 获取合服次数
get_merge_count() ->
    case ets:lookup(?ETS_SERVER_STATE, merge_count) of
        [#server_state{value = V}] when is_integer(V) -> V;
        _ -> 0
    end.

%% @doc 服务器启动时间
get_start_time() ->
    case ets:lookup(?ETS_SERVER_STATE, start_time) of
        [#server_state{value = V}] when is_integer(V) -> V;
        _ -> 0
    end.

%% @doc 获取服务器类型
get_server_type() ->
    case ets:lookup(?ETS_SERVER_STATE, server_type) of
        [#server_state{value = V}] when is_integer(V) -> V;
        _ -> ?SERVER_TYPE_GAME
    end.

% @doc 获取当前节点id
get_node_id() ->
    case ets:lookup(?ETS_SERVER_STATE, node_id) of
        [#server_state{value = V}] when is_integer(V) -> V;
        _ -> get_node_id_by_arguments()
    end.


%% @doc 是否已经开服
is_server_opened() ->
    get_open_time() < time:unixtime().

%% @doc 是否合过服
is_server_merged() ->
    get_merge_time() > 0.

%% @doc 是否正在关服
is_closing_svr() ->
    ets:lookup_element(?ETS_SERVER_STATE, is_closing_svr, #server_state.value).

%% @doc 判断当前节点是否为跨服中心
is_kfcenter() ->
    get_server_type() =:= ?SERVER_TYPE_CENTER.

%% @doc 是否分组节点 [100]
is_group_server() ->
    get_node_id() =:= ?NODE_ID_KFGROUP.

%% @doc 是否跨服节点 [100,300+]
is_cross_server() ->
    get_server_type() =/= ?SERVER_TYPE_GAME.

%% @doc 是否逻辑节点
is_logic_server() ->
    get_server_type() =:= ?SERVER_TYPE_GAME.

%% @doc 判断是否集群节点
is_cluster() ->
    get_server_type() =:= ?SERVER_TYPE_CLUSTER.

%% @doc 是否跨服
is_cross(SvrNum, TSvrNum) ->
    not (SvrNum =:= TSvrNum orelse TSvrNum =:= 0).


%% @doc 更改开服时间
c_open_time(_TimeStart) ->
    TimeStart = time:unixdate(_TimeStart),
    ets:update_element(?ETS_SERVER_STATE, open_time, {#server_state.value, TimeStart}).

%% @doc 更改开服时间 [GM，测试Only]
c_open_time_gm(_TimeStart) ->
    TimeStart = time:unixdate(_TimeStart),
    SQL1 = io_lib:format("replace into `base_game`(`cf_name`, `cf_value`) values('version', from_unixtime(~w, '%Y-%m-%d-%H-%i-%S'))", [TimeStart]),
    ?DB:execute(SQL1),
    c_open_time(_TimeStart),
    ok.

%% @doc 更改合服时间
c_merge_time(TimeMerge) ->
    c_merge_time(TimeMerge, 1, false).

%% @doc 更改合服时间
c_merge_time(_TimeMerge, Count, Db) ->
    TimeMerge = time:unixdate(_TimeMerge),
    Db andalso begin
        SQL = io_lib:format(<<"replace into `merge_count`(`id`, `time`, `merge_count`) values(~w, ~w, ~w)">>, [1, TimeMerge, Count]),
        ?DB:execute(SQL)
    end,
    ets:insert(?ETS_SERVER_STATE, #server_state{name = merge_count, value = Count}),
    ets:insert(?ETS_SERVER_STATE, #server_state{name = merge_time, value = TimeMerge}).

%% @doc 获取世界等级
get_world_lv() ->
    conf_world_lv:get_lv(util:get_open_days()).

%% @doc 获取先锋等级
get_pioneer_lv() ->
    case ets:lookup(?ETS_SERVER_STATE, pioneer_lv) of
        [#server_state{value = V}] when is_integer(V) ->
            V;
        _ ->
            def_pioneer_lv()
    end.

set_pioneer_lv(Lv) ->
    ets:insert(?ETS_SERVER_STATE, #server_state{name = pioneer_lv, value = Lv}),
    router_105:refresh_world_lv().

def_pioneer_lv() ->
    config:get_sys_config(pioneer_level_default).

has_pioneer_eff(RoleLv) ->
    PioneerLv = get_pioneer_lv(),
    PioneerLv - RoleLv >= conf_pioneer_lv:get(PioneerLv).

%% @doc 设置关服状态
set_closing_svr() ->
    ets:update_element(?ETS_SERVER_STATE, is_closing_svr, {#server_state.value, true}).


%% Privates ---------------------------------------------
get_node_id_by_arguments() ->
    Args = init:get_plain_arguments(),
    [_IpStr, _PortStr, NodeIDStr | _] = Args,
    list_to_integer(NodeIDStr).
