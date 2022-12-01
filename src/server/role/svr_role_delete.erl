%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 10月 2019 10:31
%%%-------------------------------------------------------------------
-module(svr_role_delete).
-author("Administrator").
-behavior(gen_server).
%%%=======================EXPORT=======================
-export([start_link/0, info/0, is_del/1, delete/1, get_dels/0, is_del/3, role_delete/3, judge_del/1, cancel/1, permanent/0]).
-export([do_handle_call/3, do_handle_cast/2, do_handle_info/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).
%%-export([clear/0]).
%%-export([del_role/1, test/0, test_del/1]).
%%%=======================INCLUDE======================
-include("../../../include/role_delete.hrl").
-record(del, {
    dels = dict:new()
    , no_dels = dict:new(),
    update = false
}).
%%%=================EXPORTED FUNCTIONS=================
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

info() ->
    gen_server:call(?MODULE, info).

permanent() ->
    gen_server:call(?MODULE, permanent).

get_dels() ->
    gen_server:call(?MODULE, get_dels).

%% 是否已经删除了
is_del(RoleID) ->
    gen_server:call(?MODULE, {is_del, RoleID}).

%% 判断是否处于删除状态
judge_del(RoleID) ->
    gen_server:call(?MODULE, {judge_del, RoleID}).

is_del(RoleID, DelDict, NodelDict) ->
    dict:is_key(RoleID, DelDict) orelse begin
        case dict:find(RoleID, NodelDict) of
            error ->
                false;
            {ok, Ele} ->
                element(3, Ele) + ?DELETE_TIME =< time:unixtime()
        end
    end.

delete(Req) ->
    gen_server:call(?MODULE, Req).


%% 取消删除
cancel(RoleId) ->
    gen_server:call(?MODULE, {cancel, RoleId}).

%%test_del(Req) ->
%%    gen_server:call(?MODULE, Req).
%%clear() ->
%%    gen_server:call(?MODULE, clear).

%% 删号检测:帮派/婚姻/师徒/结拜/组队
role_delete(Accname, Type, RoleID) ->
    case Type of
        1 ->    %% 删除角色
            svr_role_delete:judge_del(RoleID) andalso throw({error, ?RC_DELETE_ROLE_IN_DELETE}),
            case db:get_row(io_lib:format(?SQL_GET_ROLE_BASIC, [RoleID])) of
                [] ->
                    ServerId = 0, Level = 0, Career = 0,
                    throw({error, ?RC_DELETE_ROLE_NO_ROLE});
                [ServerId, Level, Career] ->
                    Level >= ?UNABLE_DELETE_LV andalso throw({error, ?RC_DELETE_ROLE_LIMIT_LV})
            end,
            #{team_id := TeamId} = lib_team:get_role_data(RoleID),
            TeamId =/= 0 andalso throw({error, ?RC_DELETE_ROLE_IN_TEAM}),
            #guild_role{guild_id = GuildId} = lib_guild:get_role_data(RoleID),
            GuildId =/= 0 andalso throw({error, ?RC_DELETE_ROLE_IN_GUILD}),
            #{marry_id := MarryId} = lib_marriage:get_role_data(RoleID),
            MarryId =/= 0 andalso throw({error, ?RC_DELETE_ROLE_IN_MARRIAGE}),
            case svr_mentor:get_person(RoleID) of
                #mentor_person{tudi_list = TudiList} ->
                    TudiList =/= [] andalso throw({error, ?RC_DELETE_ROLE_HAVE_MENTOR});
                _ ->
                    ok
            end,
            #{target := TargetID} = lib_role_vow:get_role_db_data(RoleID),
            TargetID > 0 andalso throw({error, ?RC_DELETE_ROLE_VOW}),
            RoleData = lib_role_data:data_load(RoleID),
            dict:find(?KEY_SWORN_GROUP_ID, RoleData) =/= error andalso throw({error, ?RC_DELETE_ROLE_HAVE_SWORN}),
            svr_sworn:get_person(RoleID) =/= undefined andalso throw({error, ?RC_DELETE_ROLE_HAVE_SWORN}),
            Charge = dict:find(?KEY_TOTAL_RECHARGE, RoleData),
            Charge =:= error orelse (element(2, Charge) < ?UNABLE_DELETE_CHARGE andalso throw({error, ?RC_DELETE_ROLE_CHARGED})),
            hd(db:get_row(io_lib:format(?SQL_GET_ROLE_MENTOR, [RoleID]))) =/= 0 andalso throw({error, ?RC_DELETE_ROLE_HAVE_MENTOR}),
            delete({del, Accname, RoleID, ServerId, Level, Career, time:unixtime()});
        0 ->    %% 取消删除
            R = cancel(RoleID),
            R orelse throw({error, R});
        _ ->
            throw({error, ?RC_NAME_ILLEGAL_STRING})
    end,
    ok.

init(_Args) ->
    {ok, #del{}, 1000}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Request, State) ->
    ?DO_HANDLE_INFO(Request, State).

code_change(_, State, _) ->
    {ok, State}.

terminate(_Reason, _State) ->
    ok.

do_handle_call(info, _From, State = #del{dels = Dels, no_dels = Nodels}) ->
    {reply, [{dels, dict:to_list(Dels)}, {no_dels, dict:to_list(Nodels)}], State};
do_handle_call(clear, _From, State) ->
    {reply, ok, State#del{no_dels = dict:new(), dels = dict:new(), update = true}};
do_handle_call(get_dels, _From, State = #del{dels = Dels, no_dels = Nodels}) ->
    {reply, {Dels, Nodels}, State};
do_handle_call({cancel, RoleID}, _From, State) ->
    {R, StateN} = cancel(RoleID, State),
    {reply, R, StateN};
do_handle_call({judge_del, RoleID}, _From, State = #del{dels = Dict, no_dels = Nodels}) ->
    {reply, dict:is_key(RoleID, Dict) orelse dict:is_key(RoleID, Nodels), State};
do_handle_call({is_del, RoleID}, _From, State = #del{dels = Dict, no_dels = Nodels}) ->
    R = case dict:is_key(RoleID, Dict) of
        false ->
            case dict:find(RoleID, Nodels) of
                {ok, Ele} ->
                    element(3, Ele) + ?DELETE_TIME =< time:unixtime();
                _ ->
                    false
            end;
        _ ->
            true
    end,
    {reply, R, State};
do_handle_call({del, Accname, RoleID, ServerId, Level, Career, Time}, _From, State = #del{no_dels = NoDels}) ->
    {reply, ok, State#del{no_dels = dict:store(RoleID, {Accname, ?DELETE_STEP_ZERO, Time, ServerId, Level, Career}, NoDels), update = true}};
do_handle_call(permanent, _From, State) ->
    permanent(State),
    {reply, ok, State};
do_handle_call(_Req, _From, State) ->
    ?DEBUG("unexpected_msg, Req:~p", [_Req]),
    {reply, ok, State}.
%%do_handle_call({test_del, Accname, Step, RoleID, ServerId, Level, Career, Time}, _From, State = #del{dels = Dels}) ->
%%    {reply, ok, State#del{dels = dict:store(RoleID, {Accname, Step, ServerId, Level, Career, Time}, Dels)}};

do_handle_cast(_Request, State) ->
    {noreply, State}.

do_handle_info(loop, State) ->
    StateN = do_loop(State),
    erlang:send_after(?LOOP_INTERVAL, self(), 'loop'),
    {noreply, StateN};
do_handle_info(permanent, State = #del{update = Update}) ->
    Update andalso permanent(State),
    erlang:send_after(?PERMANENT_INTERVAL, self(), 'permanent'),
    {noreply, State#del{update = false}};
do_handle_info(timeout, State) ->
    List = db:get_all(?SQL_GET_DELETE_ROLES),
    {Dels, Nodels} = lists:foldl(fun([RoleId, Accname, CurState, Time, ServerId, Level, Career], {Acc1, Acc2}) ->
        IsMember = lists:member(CurState, ?DELETED_STEPS),
        StoreAcc = ?iif(IsMember, Acc1, Acc2),
        DictN = dict:store(RoleId, {type:object_to_list(Accname), CurState, Time, ServerId, Level, Career}, StoreAcc),
        ?iif(IsMember, {DictN, Acc2}, {Acc1, DictN})
    end, {dict:new(), dict:new()}, List),
    erlang:send_after(?LOOP_INTERVAL, self(), 'loop'),
    erlang:send_after(?PERMANENT_INTERVAL, self(), 'permanent'),
    {noreply, State#del{dels = Dels, no_dels = Nodels}};
do_handle_info(_Req, State) ->
    {noreply, State}.

%% 删角色:/帮派申请列表/
%% 好友+申请列表+黑名单+群组+好友分组+仇人/
%% 群组+群组申请列表
%% 排行榜/孵化/缓存/组队/众里寻qin/聊天
do_loop(State = #del{no_dels = Nodels, dels = DelDict}) ->
    try
        Now = time:unixtime(),
        {RoleIDs, DelDictN, StateZero} = dict:fold(fun(Id, {Accname, _State, Time, ServerId, Level, Career}, {IdAcc, AccDict, ZeroAcc}) ->
            ?iif(Time + ?DELETE_TIME =< Now, {[Id | IdAcc], dict:store(Id, {Accname, ?DELETE_STEP_ONE, Time, ServerId, Level, Career}, AccDict), dict:erase(Id, ZeroAcc)},
                {IdAcc, AccDict, ZeroAcc})
        end, {[], DelDict, Nodels}, Nodels),
        del_role(RoleIDs),
        ?iif(RoleIDs =:= [], State, State#del{dels = DelDictN, no_dels = StateZero, update = true})
    catch
        R1:R2 ->
            ?ERROR("delete_role_error, R1:~w, R2:~w, stack:~w", [R1, R2, erlang:get_stacktrace()]),
            State
    end.

del_role([]) ->
    ok;
del_role(RoleIDs) ->
    svr_cache:role_delete(?ROLE_CACHE, RoleIDs),
    svr_examine:cast({role_delete, RoleIDs}),
    svr_rank_mgr:cast({role_delete, RoleIDs}),
    svr_pet_hatch:role_delete(RoleIDs),
    svr_market:cast({role_delete, RoleIDs}),
    svr_friend:role_delete(RoleIDs),
    svr_vow:role_delete(RoleIDs),
    Format = db:dyn_make_format(RoleIDs),
    del_guild(Format),
    db:execute(io_lib:format(?SQL_DELETE_ROLE_GUILD_APPLY, Format)),
    db:execute(io_lib:format(?SQL_DELETE_ROLE_DEED, [Format, Format])),
    db:execute(io_lib:format(?SQL_DELETE_ROLE_BASIC, Format)).
%%    [svr_role_delete:test_del({test_del, "t1", ?DELETE_STEP_ONE, RoleID, config:get_server_num(), 990, 980, time:unixtime()}) || RoleID <- RoleIDs],
%%    [begin
%%        MsgRecord = #oper_delete_role{role_id = RoleID},
%%        {ok, BinData} = prot_msg:encode_msg(90015, MsgRecord),
%%        lib_role_send:send_to_role(RoleID, BinData)
%%    end || RoleID <- RoleIDs].

del_guild(Format) ->
    List = db:get_all(io_lib:format(?SQL_GET_ROLE_GUILD_APPLY, Format)),
    lists:foreach(fun([Guild, DBRoleIds]) ->
        IDs = [list_to_integer(H) || H <- string:tokens(binary_to_list(DBRoleIds), ",")],
        svr_guild:role_delete(Guild, IDs)
    end, List).

cancel(RoleID, State = #del{dels = Dict, no_dels = Nodels}) ->
    case dict:is_key(RoleID, Dict) of
        true ->
            {?RC_DELETE_ROLE_IS_DELETED, State};
        _ ->
            case dict:find(RoleID, Nodels) of
                error ->
                    {?RC_DELETE_ROLE_NOT_IN_DELETED, State};
                {ok, {_Accname, _, Time, _, _, _}} ->
                    case Time + ?DELETE_TIME > time:unixtime() of
                        true ->
                            {true, State#del{no_dels = dict:erase(RoleID, Nodels), update = true}};
                        _ ->
                            {?RC_DELETE_ROLE_IS_DELETED, State}
                    end
            end
    end.

permanent(#del{dels = Dels, no_dels = Nodels}) ->
    Fun = fun(RoleID, {Accname, State, Time, ServerID, Level, Career}, Acc) ->
        [[RoleID, Accname, State, Time, ServerID, Level, Career] | Acc]
    end,
    Acc1 = dict:fold(Fun, [], Dels),
    Acc2 = dict:fold(Fun, Acc1, Nodels),
    db:insert_values(?SQL_INSERT_DELETE_ROLE, ?SQL_INSERT_FORMAT, Acc2).


%%test() ->
%%    svr_role_delete:delete({del, "test", 1, 1, 1, 1, time:unixtime()}),
%%    svr_role_delete:delete({del, "test", 2, 1, 1, 1, time:unixtime()}),
%%    svr_role_delete:delete({del, "test", 4, 1, 1, 1, time:unixtime()}),
%%    svr_role_delete:delete({del, "test", 3, 1, 1, 1, time:unixtime()}).
%%
%%
