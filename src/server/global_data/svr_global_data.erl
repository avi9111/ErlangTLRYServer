%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     全局键值对
%%% @end
%%% Created : 15. 十月 2018 20:07
%%%-------------------------------------------------------------------
-module(svr_global_data).

-behaviour(gen_server).

-export([
    start_link/0,
    stop/0,
    get_value/3,
    put_value/3,
    daily_clear/0
]).
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3]
).

-include("role.hrl").

-record(state, {
    data = dict:new(),        % 永久数据
    daily_data = dict:new()  % 每日数据
}).

%%=========================================================================
%% 接口函数
%%=========================================================================

%% 获取数据
%% @Param: DailyFlag 0永久数据|1每日数据
get_value(DailyFlag, Key, Default) ->
    gen_server:call(?MODULE, {'get_value', DailyFlag, Key, Default}).

%% 设置数据
put_value(DailyFlag, Key, Value) ->
    gen_server:cast(?MODULE, {'put_value', DailyFlag, Key, Value}).

%% 凌晨0点清空
daily_clear() ->
    gen_server:cast(?MODULE, 'daily_clear').

%% 启动全局数据服务
start_link() ->
    gen_server:start({local, ?MODULE}, ?MODULE, [], []).

%% 关闭全局数据服务
stop() ->
    gen_server:call(?MODULE, stop).

%%=========================================================================
%% 回调函数
%%=========================================================================

init([]) ->
    State = global_data_load(),
    {ok, State}.

%% call数据调用
handle_call(Msg, _FROM, State) ->
    case catch do_handle_call(Msg, _FROM, State) of
        {reply, Return, NewState} ->
            {reply, Return, NewState};
        {stop, normal, Return, NewState} ->
            {stop, normal, Return, NewState};
        Reason ->
            ?ERROR("svr_global_data handle_call error: ~p, Reason:=~p~n", [Msg, Reason]),
            {reply, error, State}
    end.

%% cast数据调用
handle_cast(Msg, State) ->
    case catch do_handle_cast(Msg, State) of
        {noreply, NewState} ->
            {noreply, NewState};
        {stop, normal, NewState} ->
            {stop, normal, NewState};
        Reason ->
            ?ERROR("svr_global_data handle_cast error: ~p, Reason:=~p~n", [Msg, Reason]),
            {noreply, State}
    end.

handle_info(_Reason, State) ->
    {noreply, State}.

terminate(_Reason, State) ->
    {ok, State}.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%=========================================================================
%% 私有函数
%%=========================================================================

% 关闭服务
do_handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};
% 获取永久数据
do_handle_call({'get_value', 0, Key, Default}, _From, State) ->
    {reply, get_value_dict(State#state.data, Key, Default), State};
% 获取每日数据
do_handle_call({'get_value', 1, Key, Default}, _From, State) ->
    {reply, get_value_dict(State#state.daily_data, Key, Default), State};
% call容错
do_handle_call(_Msg, _FROM, State) ->
    ?ERROR("svr_global_data call no_match: ~p", [_Msg]),
    {reply, no_match, State}.

% 设置永久数据
do_handle_cast({'put_value', 0, Key, Value}, State) ->
    {noreply, State#state{data = put_value_dict(State#state.data, Key, Value, 0)}};
% 设置每日数据
do_handle_cast({'put_value', 1, Key, Value}, State) ->
    {noreply, State#state{daily_data = put_value_dict(State#state.daily_data, Key, Value, 1)}};
%% 每日清空缓存
do_handle_cast('daily_clear', State) ->
    catch db:execute("delete from `global_data` where `daily_flag` = 1"),
    NewState = State#state{daily_data = dict:new()},
    {noreply, NewState};
%% cast容错
do_handle_cast(_Msg, State) ->
    ?ERROR("svr_global_data cast no_match: ~p", [_Msg]),
    {noreply, State}.

%% 服务开启加载数据
global_data_load() ->
    case ?DB:get_all("select `key`, `value`, `daily_flag` from `global_data`") of
        [] -> #state{data = dict:new(), daily_data = dict:new()};
        Data ->
            % 分开永久数据和每日数据
            {Dict, DailyDict} = split_global_data_by_daily(Data),
            #state{data = Dict, daily_data = DailyDict}
    end.

% 分开永久数据和每日数据
split_global_data_by_daily(Data) ->
    split_global_data_by_daily__(Data, dict:new(), dict:new()).

split_global_data_by_daily__([], Dict, DailyDict) ->
    {Dict, DailyDict};
split_global_data_by_daily__([[Key, ValueBin, 0] | L], Dict, DailyDict) ->
    Value = type:bitstring_to_term(ValueBin),
    split_global_data_by_daily__(L, dict:store(Key, Value, Dict), DailyDict);
split_global_data_by_daily__([[Key, ValueBin, 1] | L], Dict, DailyDict) ->
    Value = type:bitstring_to_term(ValueBin),
    split_global_data_by_daily__(L, Dict, dict:store(Key, Value, DailyDict));
split_global_data_by_daily__([_ | L], Dict, DailyDict) ->
    split_global_data_by_daily__(L, Dict, DailyDict).

%% 获取数据
get_value_dict(Dict, Key, Default) ->
    case dict:find(Key, Dict) of
        error -> Default;
        {ok, Value} -> Value
    end.

%% 设置数据
put_value_dict(Dict, Key, Value, DailyFlag) ->
    update_db(Key, Value, DailyFlag),
    dict:store(Key, Value, Dict).


%% 数据持久化
update_db(Key, Value, DailyFlag) ->
    ValueBin = type:term_to_bitstring(Value),
    ?DB:execute(io_lib:format("replace into `global_data`(`key`,`value`,`daily_flag`) values(~w,'~s', ~p)", [Key, ValueBin, DailyFlag])).
