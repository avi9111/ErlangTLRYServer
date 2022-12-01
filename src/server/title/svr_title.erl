%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     称号
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_title).
-author("Ryuu").

-include("title.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    p/0,
    i/0,
    cast/1,
    call/1,
    grant/2,
    grant/3,
    deprive/2,
    start_link/0
]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SCOPE, local).
-define(SERVER, ?MODULE).

-record(state, {}).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

%% @doc 服务信息
i() ->
    call(info).

%% @doc 进程Pid
p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

%% @doc 授予称号
grant(RoleID, TitleID) ->
    cast({grant, RoleID, TitleID}).

grant(RoleID, TitleID, TitleName) ->
    cast({grant, RoleID, TitleID, TitleName}).

%% @doc 剥夺称号
deprive(RoleID, TitleID) ->
    cast({deprive, RoleID, TitleID}).

%% @doc call
call(Info) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Info);
        _ ->
            {error, ?RC_SERVICE_UNAVAILABLE}
    end.

%% @doc cast
cast(Info) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Info);
        _ ->
            ignore
    end.

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    {ok, #state{}}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({grant, RoleID, TitleID}, State) when is_integer(TitleID) ->
    do_grant_title(RoleID, TitleID),
    {noreply, State};
do_handle_cast({grant, RoleID, TitleIDList}, State) when is_list(TitleIDList) ->
    [do_grant_title(RoleID, TitleID) || TitleID <- TitleIDList, is_integer(TitleID)],
    {noreply, State};
do_handle_cast({deprive, RoleID, TitleID}, State) ->
    do_deprive_title(RoleID, TitleID),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.

%% @doc 授予称号
do_grant_title(RoleID, TitleID) ->
    Conf = conf_title:get(TitleID),
    do_grant_title2(Conf, RoleID, TitleID).

do_grant_title2(undefined, _RoleID, _TitleID) ->
    ignore;
do_grant_title2(Conf, RoleID, TitleID) ->
    Now = time:unixtime(),
    #{unique := Unique} = Conf,
    ExpireTime = calc_title_expire(Conf, Now),
    {ok, Losers, NewTime} = grant_title(Unique, RoleID, TitleID, ExpireTime, Now),
    lib_role:mod_info(RoleID, lib_role_title, {add_title, TitleID, NewTime}),
    [lib_role:mod_info(Loser, lib_role_title, {remove_title, TitleID}) || Loser <- Losers],
    ok.

%% @doc 时间叠加称号
% -spec calc_title_expire(Conf, Now) -> Expire.
% Conf :: #{}
% Now  :: integer()
% Expire :: integer() | {add, integer()}
calc_title_expire(#{type := 6, time := ValidTime}, _Now) ->
    ?iif(ValidTime =:= 0, 0, {add, ValidTime});
calc_title_expire(#{time := ValidTime}, Now) ->
    ?iif(ValidTime =:= 0, 0, Now + ValidTime).

grant_title(?TITLE_RARE_UNIQUE, RoleID, TitleID, ExpireTime, Now) ->
    grant_unique_title(RoleID, TitleID, ExpireTime, Now);
grant_title(_, RoleID, TitleID, ExpireTime, Now) ->
    grant_common_title(RoleID, TitleID, ExpireTime, Now).

grant_unique_title(RoleID, TitleID, ExpireTime, Now) ->
    %% 移除旧拥有者的称号
    List = ?DB:get_all(io_lib:format(?SQL_GET_SPECIFY_TITLE, [TitleID, ?TITLE_STATE_VALID])),
    ?DB:execute(io_lib:format(?SQL_EXP_SPECIFY_TITLE, [Now, ?TITLE_STATE_EXPIRED, TitleID])),
    Losers = [OldID || [OldID] <- List, OldID =/= RoleID],
    {ok, _, NewTime} = grant_common_title(RoleID, TitleID, ExpireTime, Now),
    {ok, Losers, NewTime}.

grant_common_title(RoleID, TitleID, ExpireTime, Now) ->
    Info = ?DB:get_row(io_lib:format(?SQL_GET_ROLE_TITLE, [RoleID, TitleID])),
    NewTime = renew_title(Info, Now, ExpireTime),
    ?DB:execute(io_lib:format(?SQL_SET_ROLE_TITLE, [RoleID, TitleID, NewTime, ?TITLE_STATE_VALID])),
    {ok, [], NewTime}.

renew_title([], Now, ExpireTime) ->
    case ExpireTime of
        {add, ValidTime} -> Now + ValidTime;
        ExpireTime -> ExpireTime
    end;
renew_title([Valid, _], Now, ExpireTime) when Valid =:= ?TITLE_STATE_EXPIRED ->
    case ExpireTime of
        {add, ValidTime} -> Now + ValidTime;
        ExpireTime -> ExpireTime
    end;
renew_title([_, OldTime], _Now, ExpireTime) when is_integer(ExpireTime) ->
    if
        OldTime =:= 0 orelse ExpireTime =:= 0 -> 0;
        OldTime > ExpireTime -> OldTime;
        true -> ExpireTime
    end;
renew_title([_, OldTime], Now, {add, ValidTime}) ->
    if
        OldTime =:= 0 -> 0; % 不应该跑这个
        OldTime > Now -> OldTime + ValidTime;
        true -> Now + ValidTime
    end.

%% @doc 剥夺称号
do_deprive_title(RoleID, TitleID) ->
    Now = time:unixtime(),
    ?DB:execute(io_lib:format(?SQL_EXP_ROLE_TITLE, [Now, ?TITLE_STATE_EXPIRED, RoleID, TitleID])),
    lib_role:mod_info(RoleID, lib_role_title, {remove_title, TitleID}).
