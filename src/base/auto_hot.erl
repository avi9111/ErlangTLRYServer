%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 九月 2019 19:30
%%%-------------------------------------------------------------------
-module(auto_hot).
-author("Administrator").
-behavior(gen_server).
%%%=======================EXPORT=======================
-compile(export_all).
%%-export([start_link/0]).
%%-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).

%%%=======================INCLUDE======================

%%%=======================RECORD=======================
-record(state, {ets}).
-record(file_info, {
    size, type, access, atime, mtime, ctime, mode, links, major_device, minor_device, inode, uid, gid
}).

%%%=======================DEFINE=======================

%%%=================EXPORTED FUNCTIONS=================
start_link() ->
    ets:new(s_test, [named_table, public]),
    {ok, Pid} = gen_server:start_link({local, ?MODULE}, ?MODULE, [], []),
    add_path(),
    {ok, Pid}.

get_server_id() ->
    case ets:lookup(s_test, id) of
        [{_, Id}] ->
            Id;
        _ ->
            'none'
    end.


monitor({'monitor', Path, Changes}) ->
    gen_server:call(?MODULE, {'monitor', Path, Changes});
monitor(_) ->
    ok.

add_path() ->
    set(get_ebin_path()).

set(Path) ->
    gen_server:call(?MODULE, {'set', Path}).

init(_) ->
    erlang:send_after(10000, self(), 'none'),
    {ok, #state{ets = ets:new(?MODULE, [named_table, {keypos, 1}])}}.

handle_call({'monitor', _Path, Changes}, _From, State) ->
    lists:foreach(fun(M) ->
        c:nl(M)
    end, Changes),
    io:format("code_event = code_res~n"),
    {reply, ok, State};
handle_call({'set', Path}, _From, State = #state{ets = Ets}) ->
    Now = unixtime(),
    R = case filelib:is_dir(Path) of
        true ->
            case ets:lookup(Ets, Path) of
                [] ->
                    FileInfos = get_files(Path),
                    ets:insert(Ets, {Path, 'none', Now, FileInfos}),
                    ok;
                _ ->
                    ok
            end;
        _ ->
            "not_is_dir"
    end,
    {reply, R, State};
handle_call(_Req, _From, State) ->
    {reply, ok, State}.
handle_cast(_Req, State) ->
    {noreply, State}.

handle_info('none', State = #state{ets = Ets}) ->
    Now = unixtime(),
    file_monitor(Ets, Now, ets:select(Ets, [{{'_', '_', '$1', '_'}, [{'<', '$1', Now}], ['$_']}])),
    erlang:send_after(10000, self(), 'none'),
    {noreply, State};
handle_info(_Req, State) ->
    {noreply, State}.

code_change(_, State, _) ->
    {ok, State}.

terminate(_Reason, _State) ->
    ok.

file_monitor(_Ets, _Now, []) ->
    ok;
file_monitor(Ets, Now, [{Path, 'none', _, Info} | T]) ->
    Pid = spawn(?MODULE, 'monitor', [{'init', Path}]),
    ets:insert(Ets, {Path, Pid, Now, Info}),
    file_monitor(Ets, Now, T);
file_monitor(Ets, Now, [{Path, Pid, _, OldInfo} | T]) ->
    case is_process_alive(Pid) of
        true ->
            file_monitor(Ets, Now, T);
        _ ->
            Info = get_files(Path),
            case compare(OldInfo, Info, [], [], []) of
                {[], [], []} ->
                    ok;
                {_, [], []} ->
                    io:format("code_event = code_res~n"),
                    ets:insert(Ets, {Path, Pid, Now, Info});
                {_Adds, Removes, Modifys} ->
                    PidN = spawn(?MODULE, 'monitor', [{'monitor', Path, Removes ++ Modifys}]),
                    ets:insert(Ets, {Path, PidN, Now, Info})
            end
    end,
    file_monitor(Ets, Now, T).

get_files(Path) ->
    {ok, Files} = list_file(Path, 256),
    Fs = lists:foldl(fun
        (H = {F, _, 'regular', _MTime, _CTime}, Acc) ->
            case filename:extension(F) of
                ".beam" ->
                    [H | Acc];
                _ ->
                    Acc
            end;
        (_, Acc) ->
            Acc
    end, [], Files),
    lists:sort(Fs).

compare(T1, [], Adds, Removes, Modifys) ->
    {Adds, name_list(T1, Removes), Modifys};
compare([], T2, Adds, Removes, Modifys) ->
    {name_list(T2, Adds), Removes, Modifys};
compare([{F, Size, _, MTime, _} | T1], [{F, Size, _, MTime, _} | T2], Adds, Removes, Modifys) ->
    compare(T1, T2, Adds, Removes, Modifys);
compare([{F, _, _, _, _} | T1], [{F, _, _, _, _} | T2], Adds, Removes, Modifys) ->
    compare(T1, T2, Adds, Removes, [to_atom(F) | Modifys]);
compare([{F1, _, _, _, _} | T1], [{F2, _, _, _, _} | T2], Adds, Removes, Modifys) when F1 > F2 ->
    compare(T1, T2, [to_atom(F1) | Adds], Removes, Modifys);
compare([{F1, _, _, _, _} | T1], [{_, _, _, _, _} | T2], Adds, Removes, Modifys) ->
    compare(T1, T2, Adds, [to_atom(F1) | Removes], Modifys).

name_list([{F, _, _, _, _} | T], L) ->
    name_list(T, [to_atom(F) | L]);
name_list([], L) -> L.

to_atom(F) ->
    list_to_existing_atom(filename:basename(F, ".beam")).

unixtime() ->
    {MegaSecs, Secs, _MicroSecs} = erlang:timestamp(),
    MegaSecs * 1000000 + Secs.

list_file(Dir, Depth) when is_integer(Depth) ->
    case file:list_dir(Dir) of
        {ok, L} ->
            {ok,
                traversal_file(none, Dir, "", lists:sort(L), [],
                    Depth)};
        E -> E
    end.

traversal_file(Skip, Path, Dir, [H | T], L, Depth) ->
    F = Dir ++ H,
    FN = Path ++ [$/ | F],
    case file:read_file_info(FN) of
        {ok, #file_info{size = Size, type = regular, mtime = MTime, ctime = CTime}} ->
            Info = {F, Size, regular, MTime, CTime},
            case file_skip(Skip, Dir, H, Info) of
                true ->
                    traversal_file(Skip, Path, Dir, T, [Info | L], Depth);
                _ ->
                    traversal_file(Skip, Path, Dir, T, L, Depth)
            end;
        {ok, #file_info{type = directory, mtime = MTime, ctime = CTime}} ->
            Info = {F, 0, directory, MTime, CTime},
            case file_skip(Skip, Dir, H, Info) of
                true when Depth > 1 ->
                    {ok, LL} = file:list_dir(FN),
                    traversal_file(Skip, Path, Dir, T, [Info |
                        traversal_file(Skip, Path, F ++ "/", lists:sort(LL), L, Depth - 1)], Depth);
                true ->
                    traversal_file(Skip, Path, Dir, T, [Info | L], Depth);
                _ -> traversal_file(Skip, Path, Dir, T, L, Depth)
            end;
        _ -> traversal_file(Skip, Path, Dir, T, L, Depth)
    end;
traversal_file(_Skip, _Path, _Dir, [], L, _Depth) -> L.

file_skip(none, _Dir, _F, _Info) -> true;
file_skip({M, F, A}, Dir, F, Info) ->
    M:F(A, Dir, F, Info);
file_skip(Skip, Dir, F, Info) -> Skip(Dir, F, Info).


-ifndef(app_ebin).
get_ebin_path() ->
    "ebin/".
-else.
get_ebin_path() ->
    case config:is_release() of
        false -> ?app_ebin;
        true -> "ebin/"
    end.
-endif.
