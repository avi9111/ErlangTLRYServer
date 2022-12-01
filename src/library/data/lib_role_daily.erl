%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     每日数据 [跨天重置]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_daily).

-include("role.hrl").
-include("daily.hrl").
-include("common.hrl").

-export([
    init/1,
    save/1,
    event/2,
    cross_day/1,
    get_role_data/1
]).

%% 在线处理函数
-export([
    get_value/2,
    get_value/3,
    put_value/3,
    add_counter/3,
    del_counter/3,
    get_counter/2,
    set_counter/3
]).

%% 离线处理函数
-export([
]).

%% 事件
event(PS, {'timer', ?TIMER_DEFAULT}) ->
    save(PS);
event(_PS, _) ->
    ignore.

%% @doc 跨天重置 [玩家进程]
cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewData = renew_role_data(RoleData),
    update_role_data(RoleID, NewData).


%% -----------------------------------------------------------------------------
%% 在线处理函数
%% -----------------------------------------------------------------------------
%% @doc 计数增加
add_counter(RoleID, Type, Num) ->
    Count = get_counter(RoleID, Type),
    NewCount = Count + Num,
    set_counter(RoleID, Type, NewCount),
    NewCount.

%% @doc 计数减少
del_counter(RoleID, Type, Num) ->
    Count = get_counter(RoleID, Type),
    NewCount = Count - Num,
    set_counter(RoleID, Type, NewCount),
    NewCount.

%% @doc 获取计数
get_counter(RoleID, Type) ->
    get_value(RoleID, Type, 0).

%% @doc 设置计数
set_counter(RoleID, Type, Num) ->
    put_value(RoleID, Type, Num).

%% @doc 存键值数据
put_value(RoleID, Key, Value) ->
    RoleData = get_role_data(RoleID),
    #{data := Dict} = RoleData,
    NewDict = dict:store(Key, Value, Dict),
    set_role_data(RoleID, RoleData#{data => NewDict}).

%% @doc 取键值数据
get_value(RoleID, Key) ->
    get_value(RoleID, Key, undefined).

get_value(RoleID, Key, Def) ->
    RoleData = get_role_data(RoleID),
    #{data := Dict} = RoleData,
    util:dict_find(Key, Dict, Def).

%% -----------------------------------------------------------------------------
%% 离线处理函数
%% -----------------------------------------------------------------------------


%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 初始化玩家数据
init(PS) ->
    #role_state{id = RoleID} = PS,
    [Dict, Time] = load_role_data(RoleID),
    RoleData = renew_role_data(?role_daily#{role_id => RoleID, data => Dict, time => Time}),
    set_role_data(RoleID, RoleData).

load_role_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DAILY, [RoleID]),
    case db:get_row(SQL) of
        [DataBin, Time] ->
            List = type:convert_db_field(list, DataBin, []),
            [dict:from_list(List), Time];
        [] ->
            Today = time:unixdate(),
            [dict:new(), Today]
    end.

renew_role_data(RoleData) ->
    NowTime = time:unixtime(),
    #{time := Time} = RoleData,
    case time:is_same_day(Time, NowTime) of
        true ->
            RoleData;
        _ ->
            RoleData#{data => dict:new(), time => NowTime}
    end.

%% @doc 下线持久化
save(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{data := Dict, time := Time} = RoleData,
    save_role_data(RoleID, Dict, Time).

save_role_data(RoleID, Dict, Time) ->
    DictBin = type:term_to_bitstring(dict:to_list(Dict)),
    SQL = io_lib:format(?SQL_SET_ROLE_DAILY, [RoleID, DictBin, Time]),
    db:execute(SQL).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
