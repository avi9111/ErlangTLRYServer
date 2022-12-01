%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     分布式处理函数
%%% @end
%%% ----------------------------------------------------------------------------
-module(dist).

-export([
    register/3,
    unregister/2,
    whereis_name/2,
    get_role_pid/1,
    get_role_sid/1,
    role_process_name/1,
    role_send_process_name/1,

    get_cluster_line_pid/2,
    is_process_alive/1,

    get_local_name/1
]).

-export([
    call/2,
    call/3,
    cast/2,
    safe_call/2,
    sup_info_child/2,
    get_child_count/1,
    sup_children_pid/1
]).

whereis_name(local, Atom) ->
    erlang:whereis(Atom);
whereis_name(global, Term) ->
    global:whereis_name(Term).

register(local, Name, Pid) ->
    erlang:register(Name, Pid);
register(global, Name, Pid) ->
    global:re_register_name(Name, Pid).

unregister(local, Name) ->
    erlang:unregister(Name);
unregister(global, Name) ->
    global:unregister_name(Name).

%% @doc 获取角色进程
get_role_pid(RoleId) ->
    RegName = role_process_name(RoleId),
    global:whereis_name(RegName).

%% @doc 获取角色进程
get_role_sid(RoleId) ->
    RegName = role_send_process_name(RoleId),
    global:whereis_name(RegName).

%% @doc 角色进程名
role_process_name(RoleID) ->
    {svr_role, RoleID}.

%% @doc 角色发送进程名
role_send_process_name(RoleID) ->
    {role_send, RoleID}.

%% @doc 生成本地进程名(atom)
%% @spec get_local_name(Things) -> atom().
%% Things   :: [Elem]
%% Elem     :: atom() | string | integer()
get_local_name(Things) ->
    Name = lists:concat(Things),
    list_to_atom(Name).

%% @doc 跨服场景分线进程id
%% @spec get_cluster_line_pid(SceneId, LineId) -> pid() | undefined.
%% SceneId = LineId     :: integer()
get_cluster_line_pid(SceneId, LineId) ->
    global:whereis_name({scene, SceneId, LineId}).

is_process_alive(Pid) ->
    try
        if
            is_pid(Pid) ->
                case node(Pid) =:= node() of
                    true ->
                        erlang:is_process_alive(Pid);
                    false ->
                        case rpc:call(node(Pid), erlang, is_process_alive, [Pid]) of
                            {badrpc, _Reason} -> false;
                            Res -> Res
                        end
                end;
            true -> false
        end
    catch
        _:_ -> false
    end.

%% -----------------------------------------------------------------------------
%% supervisor
%% -----------------------------------------------------------------------------

sup_info_child(Sup, Info) ->
    [Pid ! Info || Pid <- sup_children_pid(Sup)].

sup_children_pid(Sup) ->
    case catch supervisor:which_children(Sup) of
        List when is_list(List) ->
            [Child || {_Id, Child, _Type, _Modules} <- List];
        _ ->
            []
    end.

get_child_count(Atom) ->
    case erlang:whereis(Atom) of
        undefined ->
            0;
        _ ->
            [_, {active, ChildCount}, _, _] = supervisor:count_children(Atom),
            ChildCount
    end.

safe_call(Name, Request) ->
    case catch gen:call(Name, '$gen_call', Request) of
        {ok, Res} ->
            Res;
        {'EXIT', Reason} ->
            error_logger:error_report(io_lib:format("call ~w, request ~w, error ~w", [Name, Request, Reason])),
            {error, 255}
    end.

%% @doc 带容错的gen_server:call
call(Pid, Request) ->
    call(Pid, Request, undefined).

call(Pid, Request, Default) ->
    case catch gen:call(Pid, '$gen_call', Request) of
        {ok, Res} -> Res;
        {'EXIT', _Reason} -> Default
    end.

%% 带容错的gen_server:cast
cast({Name, Node} = Dest, Request) when is_atom(Name), is_atom(Node) ->
    gen_server:cast(Dest, Request);
cast(Dest, Request) when is_atom(Dest) ->
    gen_server:cast(Dest, Request);
cast(Dest, Request) when is_pid(Dest) ->
    gen_server:cast(Dest, Request);
cast(_, _) ->
    ok.
