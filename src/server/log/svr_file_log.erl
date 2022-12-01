%%% ----------------------------------------------------------------------------
%%% @author LWL
%%% @copyright (C) 2016
%%%     文件日志
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_file_log).

-behaviour(gen_server).

-include("common.hrl").
-include_lib("kernel/include/file.hrl").

%% API
-export([
    p/1,
    log/2,
    log/3,
    call/2,
    cast/2,
    start_link/2,
    get_reg_name/1
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    code_change/3,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SERVER, ?MODULE).

-define(ROOT, "log").
-define(SYNC_SIZE, 1024 * 64).
-define(SYNC_INTERVAL, 2000).
-define(ROTATION_MODE, hour).
-define(CHECK_INTERVAL, 2000).

-record(state, {
    id = 0,
    root,
    fd,
    inode,
    filename,
    pathname,
    check_interval = ?CHECK_INTERVAL,
    sync_interval = ?SYNC_INTERVAL,
    sync_size = ?SYNC_SIZE,
    rotate_ref = undefined,
    rotate_mode = ?ROTATION_MODE,
    last_check = os:timestamp()
}).

%% =============================================================================
%% API
%% =============================================================================

start_link(LogID, Opts) ->
    RegName = get_reg_name(LogID),
    gen_server:start_link({local, RegName}, ?MODULE, [LogID, Opts], []).

log(LogID, Msg) when is_list(Msg) ->
    cast(LogID, {log, Msg}).

log(LogID, Format, Args) when is_list(Format), is_list(Args) ->
    cast(LogID, {log, Format, Args});
log(_LogID, _Format, _Args) ->
    ignore.

call(LogID, Request) ->
    ?call(LogID, Request).

cast(LogID, Request) ->
    ?cast(LogID, Request).

p(LogID) ->
    RegName = get_reg_name(LogID),
    erlang:whereis(RegName).

get_reg_name(LogID) ->
    list_to_atom(lists:concat([?MODULE, "_", LogID])).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([ID, LogOpts]) ->
    Root = util:prop_get_value(root, LogOpts, ?ROOT),
    Name = util:prop_get_value(name, LogOpts, io_lib:format("log_~w", [ID])),
    SyncSize = util:prop_get_value(sync_size, LogOpts, ?SYNC_SIZE),
    RotateMode = util:prop_get_value(rotate_mode, LogOpts, ?ROTATION_MODE),
    SyncInterval = util:prop_get_value(sync_interval, LogOpts, ?SYNC_INTERVAL),
    CheckInterval = util:prop_get_value(check_interval, LogOpts, ?CHECK_INTERVAL),
    Ref = restart_rotate_timer(undefined, RotateMode),
    State0 = #state{
        id = ID, root = Root, filename = Name, sync_size = SyncSize,
        rotate_mode = RotateMode, rotate_ref = Ref, check_interval = CheckInterval,
        sync_interval = SyncInterval
    },
    PathName = log_path(Root, Name),
    erlang:process_flag(trap_exit, true),
    State = case open_logfile(PathName, {SyncSize, SyncInterval}) of
        {ok, {FD, Inode}} ->
            State0#state{pathname = PathName, fd = FD, inode = Inode};
        {error, Reason} ->
            error_logger:error_report(io_lib:format("log_handler Failed to open log file ~s with error ~s",
                [Name, file:format_error(Reason)])),
            State0
    end,
    {ok, State}.

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

do_handle_cast({log, Msg}, State) ->
    {noreply, write(State, os:timestamp(), Msg ++ "\n")};
do_handle_cast({log, Format, Args}, State) ->
    {noreply, write(State, os:timestamp(), io_lib:format(Format ++ "\n", Args))};
do_handle_cast(rotate_timer, State) ->
    _ = close_file(State),
    Ref = restart_rotate_timer(State#state.rotate_ref, State#state.rotate_mode),
    {noreply, State#state{pathname = undefined, fd = undefined, inode = 0, rotate_ref = Ref}};
do_handle_cast(_Request, State) ->
    {noreply, State}.

write(State, Timestamp, Msg) ->
    #state{root = LogRoot, filename = FileName, pathname = Name, fd = FD, inode = Inode} = State,
    LastCheck = timer:now_diff(Timestamp, State#state.last_check) div 1000,
    case LastCheck >= State#state.check_interval orelse FD == undefined of
        true ->
            case ensure_logfile(Name, FD, Inode, {State#state.sync_size, State#state.sync_interval}, LogRoot, FileName) of
                {ok, {NewName, NewFD, NewInode}} ->
                    _ = file:write(NewFD, unicode:characters_to_binary(Msg)),
                    State#state{pathname = NewName, fd = NewFD, inode = NewInode, last_check = Timestamp};
                {error, Reason} ->
                    error_logger:error_report(io_lib:format("log_handler Failed to reopen log file ~s with error ~s",
                        [Name, file:format_error(Reason)])),
                    State#state{pathname = undefined, fd = undefined, inode = 0}
            end;
        false ->
            _ = file:write(State#state.fd, unicode:characters_to_binary(Msg)),
            State
    end.

ensure_logfile(_Name, undefined, _Inode, Buffer, LogRoot, FileName) ->
    NewName = log_path(LogRoot, FileName),
    case open_logfile(NewName, Buffer) of
        {ok, {FD, Inode}} ->
            {ok, {NewName, FD, Inode}};
        Error ->
            Error
    end;
ensure_logfile(Name, FD, Inode, Buffer, LogRoot, FileName) ->
    case file:read_file_info(Name) of
        {ok, FInfo} ->
            if
                Inode == FInfo#file_info.inode ->
                    {ok, {Name, FD, Inode}};
                true ->
                    _ = file:close(FD), _ = file:close(FD),
                    NewName = log_path(LogRoot, FileName),
                    case open_logfile(NewName, Buffer) of
                        {ok, {FD2, Inode3}} ->
                            {ok, {NewName, FD2, Inode3}};
                        Error ->
                            Error
                    end
            end;
        _ ->
            _ = file:close(FD), _ = file:close(FD),
            NewName = log_path(LogRoot, FileName),
            case open_logfile(NewName, Buffer) of
                {ok, {FD2, Inode3}} ->
                    {ok, {NewName, FD2, Inode3}};
                Error ->
                    Error
            end
    end.

open_logfile(Name, Buffer) ->
    case filelib:ensure_dir(Name) of
        ok ->
            Options = [append, raw] ++
                case Buffer of
                    {Size, Interval} when is_integer(Interval), Interval >= 0, is_integer(Size), Size >= 0 ->
                        [{delayed_write, Size, Interval}];
                    _ ->
                        []
                end,
            case file:open(Name, Options) of
                {ok, FD} ->
                    case file:read_file_info(Name) of
                        {ok, FInfo} ->
                            Inode = FInfo#file_info.inode,
                            {ok, {FD, Inode}};
                        X -> X
                    end;
                Y -> Y
            end;
        Z -> Z
    end.

close_file(#state{fd = undefined}) ->
    ok;
close_file(#state{fd = FD}) ->
    _ = file:datasync(FD),
    _ = file:close(FD),
    ok;
close_file(undefined) ->
    ok;
close_file(FD) ->
    _ = file:datasync(FD),
    _ = file:close(FD),
    ok.

restart_rotate_timer(Ref, Mode) ->
    util:cancel_timer(Ref, rotate_timer),
    Timeout = rotate_timeout(Mode),
    erlang:send_after(Timeout * 1000, self(), rotate_timer).

rotate_timeout(Mode) ->
    Now0 = time:unixtime(),
    Now = Now0 + 1,
    if
        Mode =:= hour ->
            (Now div ?ONE_HOUR + 1) * ?ONE_HOUR - Now0;
        true ->
            (Now div ?ONE_DAY_SECONDS + 1) * ?ONE_DAY_SECONDS - Now0
    end.

log_path(LogRoot, FileName) ->
    {{Y, M, D}, {H, _, _}} = erlang:localtime(),
    RelFileName = lists:concat([FileName, "_", Y, "_", i2l(M), "_", i2l(D), "_", i2l(H), ".txt"]),
    filename:join([LogRoot, RelFileName]).

i2l(I) when I < 10 -> [$0, $0 + I];
i2l(I) -> integer_to_list(I).
