%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     数据库
%%% @end
%%% ----------------------------------------------------------------------------
-module(db).
-author("Ryuu").

-include("common.hrl").

-export([
    execute/1,
    execute/2,
    get_all/1,
    get_all/2,
    get_one/1,
    get_one/2,
    get_row/1,
    get_row/2,
    transaction/1,
    batch_insert/4,
    batch_insert/5,
    batch_insert/6,
    insert_values/3,
    insert_values/4,
    insert_values/5,
    format_values/2,
    dyn_make_format/1
]).

-define(POOL, mysql). %% 默认pool
-define(TRANSACTION_KEY, 'transaction__トランザクション__').

%% @doc 获取单个字段
get_one(SQL) ->
    get_one(?POOL, SQL).

get_one(Pool, SQL) ->
    case query(Pool, SQL) of
        {ok, _, [[E | _] | _]} -> E;
        _ -> undefined
    end.

%% @doc 获取单个record
get_row(SQL) ->
    get_row(?POOL, SQL).

get_row(Pool, SQL) ->
    case query(Pool, SQL) of
        {ok, _, [L | _]} -> L;
        _ -> []
    end.

%% @doc 获取所有匹配的行
get_all(SQL) ->
    get_all(?POOL, SQL).

get_all(Pool, SQL) ->
    case query(Pool, SQL) of
        {ok, _, Rows} -> Rows;
        _ -> []
    end.

%% @doc execute
execute(SQL) ->
    execute(?POOL, SQL).

execute(Pool, SQL) ->
    ok = query(Pool, SQL),
    ok.

%% @doc 事物
transaction(Fun) ->
    transaction(?POOL, Fun).

query(Pool, Query) ->
    case get_transaction() of
        Conn when is_pid(Conn) ->
            mysql:query(Conn, Query);
        _ ->
            mysql_poolboy:query(Pool, Query)
    end.

transaction(Pool, Fun) ->
    try
        case mysql_poolboy:transaction(Pool, fun(Conn) ->
            in_transaction() andalso erlang:throw({error, 245}),
            set_transaction(Conn),
            Fun()
        end) of
            {aborted, {throw, Err}} ->
                set_transaction([]),
                {aborted, Err};
            {aborted, V} ->
                set_transaction([]),
                {aborted, V};
            {atomic, V} ->
                set_transaction([]),
                V
        end
    catch _:V0 ->
        set_transaction([]),
        {aborted, V0}
    end.

in_transaction() ->
    get_transaction() =/= undefined.

get_transaction() ->
    erlang:get(?TRANSACTION_KEY).

set_transaction([]) ->
    erlang:erase(?TRANSACTION_KEY);
set_transaction(Conn) ->
    erlang:put(?TRANSACTION_KEY, Conn).

%% @doc 批量插入 [可控制]
batch_insert(0, Fmt1, Fmt2, List) ->
    insert_values(Fmt1, Fmt2, List);
batch_insert(_Size, _Fmt1, _Fmt2, []) ->
    ok;
batch_insert(Size, Fmt1, Fmt2, List) ->
    {Batch, Left} = util:split_list(Size, List),
    insert_values(Fmt1, Fmt2, Batch),
    batch_insert(Size, Fmt1, Fmt2, Left).

batch_insert(0, Fmt1, Fmt2, Fun, List) ->
    insert_values(Fmt1, Fmt2, Fun, List);
batch_insert(_Size, _Fmt1, _Fmt2, _Fun, []) ->
    ok;
batch_insert(Size, Fmt1, Fmt2, Fun, List)
    when is_integer(Size), Size > 0, ?VALID_STR(Fmt1), ?VALID_STR(Fmt2), is_function(Fun, 1), is_list(List) ->
    {Batch, Left} = util:split_list(Size, List),
    insert_values(Fmt1, Fmt2, Fun, Batch),
    batch_insert(Size, Fmt1, Fmt2, Fun, Left).

batch_insert(0, Fmt1, Fmt2, Args, Fun, List) -> %% 一次性插入
    insert_values(Fmt1, Fmt2, Args, Fun, List);
batch_insert(_Size, _Fmt1, _Fmt2, _Args, _Fun, []) ->
    ok;
batch_insert(Size, Fmt1, Fmt2, Args, Fun, List)
    when is_integer(Size), Size > 0, ?VALID_STR(Fmt1), ?VALID_STR(Fmt2), is_list(Args), is_function(Fun, 1), is_list(List) ->
    {Batch, Left} = util:split_list(Size, List),
    insert_values(Fmt1, Fmt2, Args, Fun, Batch),
    batch_insert(Size, Fmt1, Fmt2, Args, Fun, Left).

%% @doc TODO 批量插入 [一次性]
insert_values(_Fmt1, _Fmt2, []) ->
    ok;
insert_values(Fmt1, Fmt2, List) ->
    insert_values2(Fmt1, Fmt2, [], List).

insert_values(Fmt1, Fmt2, Fun, List) when is_function(Fun, 1), is_list(List) ->
    insert_values(Fmt1, Fmt2, [], Fun, List);
insert_values(Fmt1, Fmt2, Args, List) when is_list(Args) ->
    insert_values2(Fmt1, Fmt2, Args, List).

insert_values(Fmt1, Fmt2, Args, Fun, List) when is_list(Args), is_function(Fun, 1), is_list(List) ->
    RankList = lists:map(Fun, List),
    insert_values2(Fmt1, Fmt2, Args, RankList).

insert_values2(_Fmt1, _Fmt2, _Args, []) ->
    ok;
insert_values2(Fmt1, Fmt2, Args, List) ->
    Values = format_values(Fmt2, List),
    SQL = io_lib:format(Fmt1, Args ++ [Values]),
    execute(SQL),
    ok.

%% @doc
format_values(Temp, List) ->
    FinList = format_values(List, Temp, []),
    util:implode(",", FinList, []).

format_values([], _Temp, Acc) ->
    lists:reverse(Acc);
format_values([L | T], Temp, Acc) ->
    F = io_lib:format(Temp, L),
    format_values(T, Temp, [F | Acc]).


dyn_make_format([]) ->
    <<>>;
dyn_make_format([H | []]) ->
    [io_lib:format(<<"~w">>, [H])];
dyn_make_format([H | List]) ->
    dyn_make_format(List, <<"~w">>, [H]).

dyn_make_format([], Temp, Acc) ->
    [io_lib:format(Temp, Acc)];
dyn_make_format([H | List], Temp, Acc) ->
    dyn_make_format(List, <<"~w,", Temp/binary>>, [H | Acc]).

