%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     传闻
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_rumor).
-author("Ryuu").

-include("rumor.hrl").
-include("common.hrl").
-include("proto/prot_401.hrl").

%% API
-export([
    info/0,
    loop/1,
    encode/3,
    format/2,
    format/3,
    publish/1,
    re_init/0,
    del_rumor/1,
    rumor_change/1,
    init_for_start/0
]).

%% @doc 异步初始化
init_for_start() ->
    init_rumors().

%% @doc 重新初始化
re_init() ->
    init_rumors().

%% @doc 初始化传闻
init_rumors() ->
    List = ?DB:get_all(?SQL_GET_ALL_VALID_RUMOR),
    Now = time:unixtime(),
    Queue = get_rumor_queue(),
    Rumors = [Rumor || #rumor{category = Category} = Rumor <- Queue, not need_reload(Category)],
    Fun = fun(Row, Acc) ->
        init_rumor(Row, Now, Acc)
    end,
    NewRumors = lists:foldl(Fun, Rumors, List),
    set_rumor_queue(NewRumors).

need_reload(?RUMOR_CATEGORY_GM) ->
    true;
need_reload(_Key) ->
    false.

init_rumor([ID, Type, DbScope, Timing, BTime, ETime, Interval, Times, Content, Valid], Now, Acc) ->
    Category = ?RUMOR_CATEGORY_GM,
    Key = {Category, ID},
    {BeginTime, EndTime} = rumor_time(Timing, BTime, ETime),
    ValidType = lists:member(Type, ?VALID_WEB_RUMOR_TYPE),
    ValidTiming = lists:member(Timing, ?VALID_RUMOR_TIMING),
    Scope = type:convert_db_field(term, DbScope, world),
    if
        Interval =:= 0 orelse Valid =:= 0 orelse
            EndTime =< Now orelse EndTime =< BeginTime orelse
            (not ValidTiming) orelse (not ValidType) orelse
            Content =:= "" orelse
            (Type =:= ?RUMOR_TYPE_TIMES andalso Times < 1) -> %% 非法配置检查
            Acc;
        true ->
            NextTime = get_next_time(Now, BeginTime, Interval),
            LeftTimes = get_left_times(Now, BeginTime, Interval, Times),
            Rumor = #rumor{
                key = Key, id = ID, args = [Content], type = Type, scope = Scope,
                begin_time = BeginTime, end_time = EndTime, times = LeftTimes,
                interval = Interval, next_time = NextTime, category = Category
            },
            [Rumor | Acc]
    end;
init_rumor(_, _Now, Acc) ->
    Acc.

rumor_time(?RUMOR_TIME_NORMAL, BeginTime, EndTime) ->
    {BeginTime, EndTime};
rumor_time(?RUMOR_TIME_START, StartDay, EndDay) ->
    Time = {0, 0, 0},
    StartDate = util:get_date_since_open(StartDay),
    StartTime = time:unixtime({StartDate, Time}),
    EndDate = util:get_date_since_open(EndDay),
    EndTime = time:unixtime({EndDate, Time}),
    {StartTime, EndTime};
rumor_time(?RUMOR_TIME_MERGE, _StartDay, _EndDay) ->
    {0, 0};
rumor_time(_Type, _StartDay, _EndDay) ->
    {0, 0}.

%% @doc 设置等待队列
set_rumor_queue(Queue) ->
    erlang:put(rumor_queue, Queue).

%% @doc 获取等待队列
get_rumor_queue() ->
    case erlang:get(rumor_queue) of
        V when is_list(V) -> V;
        _ -> []
    end.

%% @doc 删除传闻
del_rumor(Key) ->
    Queue = get_rumor_queue(),
    NewQueue = lists:keydelete(Key, #rumor.key, Queue),
    set_rumor_queue(NewQueue).

%% @doc 传闻变化 [gm only]
rumor_change(ID) ->
    Now = time:unixtime(),
    Rumors = get_rumor_queue(),
    Key = {?RUMOR_CATEGORY_GM, ID},
    NewRumors =
        case ?DB:get_row(io_lib:format(?SQL_GET_ONE_RUMOR, [ID])) of
            Row when Row =/= [] ->
                init_rumor(Row, Now, Rumors);
            _ ->
                lists:keydelete(Key, #rumor.key, Rumors)
        end,
    set_rumor_queue(NewRumors).

%% -----------------------------------------------------------------------------
%% 请求
%% -----------------------------------------------------------------------------

info() ->
    Queue = get_rumor_queue(),
    [
        {queue_size, length(Queue)},
        {queue, Queue}
    ].

%% @doc 传闻
publish(Rumor) ->
    #rumor{type = Type} = Rumor,
    case Type of
        ?RUMOR_TYPE_NORMAL -> broadcast(Rumor);
        _ -> push_to_queue(Rumor)
    end.

%% @doc 添加到等待队列
push_to_queue(Rumor) ->
    #rumor{interval = Interval, begin_time = BeginTime} = Rumor,
    Now = time:unixtime(),
    NextTime = get_next_time(Now, BeginTime, Interval),
    List = get_rumor_queue(),
    NewList = [Rumor#rumor{next_time = NextTime} | List],
    set_rumor_queue(NewList).

%% @doc 定时循环
loop(Now) ->
    filter_expired(Now).

%% @doc
filter_expired(Now) ->
    List = get_rumor_queue(),
    {ExpireRumors, NewRumors} = filter_expired(List, Now, [], []),
    set_rumor_queue(NewRumors),
    broadcast(ExpireRumors).

filter_expired([], _Now, ExpireAcc, RumorAcc) ->
    {ExpireAcc, RumorAcc};
filter_expired([Rumor | T], Now, ExpireAcc, RumorAcc) ->
    #rumor{type = Type, times = Times, next_time = NextTime, interval = Interval,
        begin_time = BeginTime, end_time = EndTime} = Rumor,
    {NewExpireAcc, NewRumorAcc} =
        case Now >= NextTime of
            true -> %% 到了触发时间
                NewNextTime = get_next_time(Now + 1, BeginTime, Interval),
                if
                    NewNextTime =:= -1 orelse
                        (Type =:= ?RUMOR_TYPE_TIMES andalso Times =< 0) orelse
                        (Type =:= ?RUMOR_TYPE_LOOP andalso NextTime =:= -1) ->
                        {ExpireAcc, RumorAcc};
                    Type =:= ?RUMOR_TYPE_LOOP andalso NewNextTime < EndTime ->
                        {[Rumor | ExpireAcc], [Rumor#rumor{next_time = NewNextTime} | RumorAcc]};
                    Type =:= ?RUMOR_TYPE_TIMES andalso Times > 1 ->
                        {[Rumor | ExpireAcc], [Rumor#rumor{next_time = NewNextTime, times = Times - 1} | RumorAcc]};
                    true ->
                        {[Rumor | ExpireAcc], RumorAcc}
                end;
            _ ->
                {ExpireAcc, [Rumor | RumorAcc]}
        end,
    filter_expired(T, Now, NewExpireAcc, NewRumorAcc).

%% @doc 传闻下次发送的时间
get_next_time(_Now, _BeginTime, 0) ->
    -1;
get_next_time(Now, BeginTime, Interval) ->
    ?iif(BeginTime >= Now, BeginTime, BeginTime + erlang:ceil((Now - BeginTime) / Interval) * Interval).

%% @doc 传闻剩余次数
get_left_times(_Now, _BeginTime, 0, _Times) ->
    0;
get_left_times(Now, BeginTime, Interval, Times) ->
    PassTimes = erlang:floor((Now - BeginTime) / Interval),
    erlang:max(Times - PassTimes, 0).

%% @doc 广播
broadcast([]) ->
    ignore;
broadcast(Rumors) when is_list(Rumors) ->
    [broadcast(Rumor) || Rumor <- Rumors];
broadcast(Rumor) when is_record(Rumor, rumor) ->
    #rumor{scope = Scope, args = Args, temp_id = TempID} = Rumor,
    Rec = #sc_rumor_new{temp = TempID, args = Args},
    {ok, Bin} = prot_msg:encode_msg(40101, Rec),
    broadcast_to_scope(Scope, Bin).

broadcast_to_scope(Scopes, Bin) when is_list(Scopes) ->
    [broadcast_to_scope(Scope, Bin) || Scope <- Scopes];
broadcast_to_scope(world, Bin) ->
    svr_role_agent:broadcast(Bin);
broadcast_to_scope({source, Source}, Bin) ->
    svr_role_agent:select_broadcast({source, Source}, Bin);
broadcast_to_scope({role, RoleID}, Bin) ->
    lib_role_send:send_to_role(RoleID, Bin);
broadcast_to_scope({team, TeamID}, Bin) ->
    svr_team_mgr:broadcast(TeamID, Bin);
broadcast_to_scope({guild, GuildID}, Bin) ->
    svr_guild:broadcast(GuildID, Bin);
broadcast_to_scope(guild, Bin) ->
    svr_role_agent:select_broadcast(guild, Bin);
broadcast_to_scope({scene, SceneID}, Bin) ->
    svr_role_agent:select_broadcast({scene, SceneID}, Bin);
broadcast_to_scope(_Scope, _Bin) ->
    ok.

%% =============================================================================
%% 通用
%% =============================================================================

%% @doc 编码
encode(Scope, TempID, List) ->
    Rumor = format(Scope, TempID, List),
    #rumor{args = Args} = Rumor,
    Rec = #sc_rumor_new{temp = TempID, args = Args},
    {ok, Bin} = prot_msg:encode_msg(40101, Rec),
    Bin.

%% @doc 格式化 [后端只填参数，前端负责格式化]
format(Scope, TempID) when is_integer(TempID) ->
    format(Scope, TempID, []);
format(Scope, Bin) when is_binary(Bin) ->
    format(Scope, [Bin]);
format(Scope, Args) when is_list(Args) ->
    #rumor{
        type = ?RUMOR_TYPE_NORMAL, temp_id = 0, scope = Scope, args = convert_args(Args)
    }.

format(Scope, TempID, Args) when is_integer(TempID), is_list(Args) ->
    #rumor{
        type = ?RUMOR_TYPE_NORMAL, temp_id = TempID, scope = Scope, args = convert_args(Args)
    };
format(_Scope, _TempID, _Fun) ->
    undefined.

convert_args(Args) ->
    convert_args(Args, []).

convert_args([], Acc) ->
    lists:reverse(Acc);
convert_args([Arg | T], Acc) ->
    convert_args(T, [type:object_to_list(Arg) | Acc]).
