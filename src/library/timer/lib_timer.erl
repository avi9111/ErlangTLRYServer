%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%     Timer
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_timer).
-author("Ryuu").

-include("timer.hrl").

%% API
-export([
    init/0,
    info/0,
    loop/0,
    register/2,
    unregister/1,
    unregister/2
]).

%% @doc 初始化
init() ->
    erlang:send_after(1 * 1000, self(), loop),
    erlang:put(monitor_dict, dict:new()),
    erlang:put(register_dict, dict:new()),
    ok.

%% @doc
info() ->
    [
        [{Unit, get_reg_pid(Unit)} || Unit <- ?TIMER_ALL],
        {last_loop, get_last_loop()}
    ].

%% @doc
loop() ->
    Now = time:unixtime(),
    loop(Now).

loop(Now) ->
    erlang:send_after(1 * 1000, self(), loop),
    set_last_loop(Now),
    fire(Now).

%% @doc
fire(Now) ->
    {_, {Hrs, Min, Sec}} = time:unixtime_to_localtime(Now),
    fire(get_reg_pid(?TIMER_SEC), Now),
    Sec =:= 0 andalso fire(get_reg_pid(?TIMER_MIN), Now),
    Min + Sec =:= 0 andalso fire(get_reg_pid(?TIMER_HRS), Now),
    Hrs + Min + Sec =:= 0 andalso fire(get_reg_pid(?TIMER_DAY), Now),
    ok.

fire([], _Now) ->
    ok;
fire([Pid | T], Now) ->
    Pid ! {loop, Now},
    fire(T, Now).

%% @doc 注册
register(Type, Pid) when is_atom(Type), is_pid(Pid) ->
    RegDict = get_reg_dict(Type),
    Exists = dict:is_key(Pid, RegDict),
    Exists orelse begin
        MRef = erlang:monitor(process, Pid),
        NewRegDict = dict:store(Pid, MRef, RegDict),
        set_reg_dict(Type, NewRegDict),
        MonDict = get_mon_dict(Type),
        NewMonDict = dict:store(MRef, Pid, MonDict),
        set_mon_dict(Type, NewMonDict),
        true
    end;
register(_Type, _Pid) ->
    ignore.

%% @doc 取消注册
unregister(Pid) ->
    ?MODULE:unregister(?TIMER_ALL, Pid).

unregister([], _Pid) ->
    ok;
unregister([Unit | T], Pid) when is_pid(Pid) ->
    unregister(Unit, Pid),
    unregister(T, Pid);
unregister(Type, Pid) when is_pid(Pid) ->
    RegDict = get_reg_dict(Type),
    Exists = dict:is_key(Pid, RegDict),
    Exists andalso begin
        MRef = dict:fetch(Pid, RegDict),
        erlang:demonitor(MRef),
        NewRegDict = dict:erase(Pid, RegDict),
        set_reg_dict(Type, NewRegDict),
        MonDict = get_mon_dict(Type),
        NewMonDict = dict:erase(MRef, MonDict),
        set_mon_dict(Type, NewMonDict),
        true
    end;
unregister(_Type, MRef) when is_reference(MRef) ->
    ok;
unregister(_Type, _MRef) ->
    ignore.

%% -----------------------------------------------------------------------------
%% 其它
%% -----------------------------------------------------------------------------

%% @doc last loop
set_last_loop(Now) ->
    erlang:put(last_loop, Now).

get_last_loop() ->
    erlang:get(last_loop).

%% @doc mon dict
get_mon_dict(Type) ->
    case erlang:get({monitor_dict, Type}) of
        undefined -> dict:new();
        V -> V
    end.

set_mon_dict(Type, Dict) ->
    erlang:put({monitor_dict, Type}, Dict).

get_reg_pid(Type) ->
    RegDict = get_reg_dict(Type),
    dict:fetch_keys(RegDict).

%% @doc reg dict
get_reg_dict(Type) ->
    case erlang:get({register_dict, Type}) of
        undefined -> dict:new();
        V -> V
    end.

set_reg_dict(Type, Dict) ->
    erlang:put({register_dict, Type}, Dict).
