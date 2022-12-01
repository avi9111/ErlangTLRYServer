%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     maps辅助
%%% @end
%%% ----------------------------------------------------------------------------
-module(map).
-author("Ryuu").

%% API
-export([
    equal/3,
    update/2,
    keyfind/3,
    keyfind/4,
    keytake/3,
    keystore/4,
    keydelete/3,
    keyupdate/5,
    keyreplace/4,
    keydelete_by_list/3
]).

%% @doc 查找（获取第一个K为指定值的元素，找不到的话返回false）
keyfind(V, K, L) when is_atom(K), is_list(L) ->
    keyfind2(V, K, L).

keyfind2(_V, _K, []) ->
    false;
keyfind2(V, K, [M | T]) ->
    case maps:find(K, M) of
        {ok, Val} when Val =:= V -> M;
        _ -> keyfind2(V, K, T)
    end.

%% @doc 查找（获取第一个K为指定值的元素，找不到的话返回D）
keyfind(V, K, L, D) when is_atom(K), is_list(L) ->
    keyfind2(V, K, L, D).

keyfind2(_V, _K, [], D) ->
    D;
keyfind2(V, K, [M | T], D) ->
    case maps:find(K, M) of
        {ok, Val} when Val =:= V -> M;
        _ -> keyfind2(V, K, T, D)
    end.

%% @doc 保存（会覆盖第一个K为指定值的元素，找不到的话会加在列表的后面）
keystore(V, K, L, New) when is_atom(K), is_list(L), is_map(New) ->
    keystore2(V, K, L, New).

keystore2(V, K, [M | T], New) ->
    case maps:find(K, M) of
        {ok, Val} when Val =:= V -> [New | T];
        _ -> [M | keystore2(V, K, T, New)]
    end;
keystore2(_V, _K, [], New) ->
    [New].

%% @doc 替换（替换第一个K为指定值的元素，找不到的话返回原来的列表）
keyreplace(V, K, L, New) when is_atom(K), is_list(L), is_map(New) ->
    keyreplace3(V, K, L, New).

keyreplace3(V, K, [M | T], New) ->
    case maps:find(K, M) of
        {ok, Val} when Val =:= V -> [New | T];
        _ -> [M | keyreplace3(V, K, T, New)]
    end;
keyreplace3(_, _, [], _) -> [].

%% @doc 删除（删除第一个K为指定值的元素）
keydelete(V, K, L) when is_atom(K), is_list(L) ->
    keydelete3(V, K, L).

keydelete3(V, K, [M | T]) ->
    case maps:find(K, M) of
        {ok, Val} when Val =:= V -> T;
        _ -> [M | keydelete3(V, K, T)]
    end;
keydelete3(_, _, []) -> [].

%% @doc 删除多个(删除第一个K为指定值的元素)
keydelete_by_list(Vs, K, L) when is_list(Vs), is_atom(K), is_list(L) ->
    keydelete_by_list3(Vs, K, L).

keydelete_by_list3([], _, L) -> L;
keydelete_by_list3(_, _, []) -> [];
keydelete_by_list3([V | T], K, L) ->
    NewL = keydelete(V, K, L),
    keydelete_by_list3(T, K, NewL).

%% @doc 取出（取出第一个K为指定值的元素，返回列表剩余的元素）
-spec keytake(V, K, MapList1) -> {value, M, MapList2} | false when
    V :: term(),
    K :: atom(),
    MapList1 :: [map()],
    MapList2 :: [map()],
    M :: tuple().

keytake(V, K, L) when is_atom(K), is_list(L) ->
    keytake(V, K, L, []).

keytake(V, K, [M | T], L) ->
    case maps:find(K, M) of
        {ok, Val} when Val =:= V ->
            {value, M, lists:reverse(L, T)};
        _ ->
            keytake(V, K, T, [M | L])
    end;
keytake(_K, _N, [], _L) -> false.

%% @doc
keyupdate(V, K, L, K1, V1) when is_atom(K), is_list(L), is_atom(K1) ->
    keyupdate3(V, K, L, K1, V1).

keyupdate3(V, K, [M | T], K1, V1) ->
    case maps:find(K, M) of
        {ok, Val} when Val =:= V -> [maps:put(K1, V1, M) | T];
        _ -> [M | keyupdate3(V, K, T, K1, V1)]
    end;
keyupdate3(_, _, [], _, _) ->
    [].

%% @doc
update(Map1, Map2) ->
    maps:fold(fun(K, V, Acc) ->
        case maps:get(K, Map2, undefined) of
            undefined -> maps:put(K, V, Acc);
            V2 -> maps:put(K, V2, Acc)
        end
    end, #{}, Map1).

%% @doc
equal(Map1, Map2, Fields) ->
    equal2(Fields, Map1, Map2).

equal2([], _M1, _M2) ->
    true;
equal2([F | T], M1, M2) ->
    case maps:get(F, M1, def1) =:= maps:get(F, M2, def2) of
        true -> equal2(T, M1, M2);
        _ -> false
    end.
