%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     类型转换
%%% @end
%%% ----------------------------------------------------------------------------
-module(type).

-include("common.hrl").

-export([
    ip2str/1,
    ip2bin/1,
    object_to_list/1,
    object_to_binary/1,
    unicode_string/1,
    unicode_binary/1,
    record_to_list/1,
    list_to_record/2,
    object_to_atom/1,
    string_to_term/1,
    string_to_term2/1,
    term_to_string/1,
    term_to_string2/1,
    bitstring_to_term/1,
    term_to_bitstring/1,
    boolean_to_integer/1,
    integer_to_boolean/1,
    string_to_integer/1,
    mysql_query_quote/1,
    convert_db_field/2,
    convert_db_field/3,
    bitstring_to_pid/1,
    pid_to_bitstring/1,
    list_to_tuple/1,
    record_to_list/2
]).

-export([
    hex_to_bin/1,
    bin_to_hex/1
]).

%% @doc 转换其他类型为list
object_to_list(X) when is_integer(X) -> ?i2l(X);
object_to_list(X) when is_float(X) -> ?f2l(X);
object_to_list(X) when is_atom(X) -> ?a2l(X);
object_to_list(X) when is_binary(X) -> ?b2l(X);
object_to_list(X) when is_tuple(X) -> ?t2l(X);
object_to_list(X) when is_list(X) -> X.

%% @doc 转换其他类型为binary
object_to_binary(X) when is_binary(X) -> X;
object_to_binary(X) when is_list(X) -> ?l2b(X);
object_to_binary(X) when is_atom(X) -> ?l2b(?a2l(X)).

%% @doc 转换其他类型为atom (不建议使用)
object_to_atom(X) when is_binary(X) -> list_to_atom(?b2l(X));
object_to_atom(X) when is_list(X) -> list_to_atom(X);
object_to_atom(X) when is_atom(X) -> X.

%% @doc 转换boolean类型为integer
boolean_to_integer(Boolean) when is_integer(Boolean) -> Boolean > 0;
boolean_to_integer(Boolean) when is_boolean(Boolean) ->
    case Boolean of
        true -> 1;
        false -> 0
    end.

%% @doc 转换integer类型为boolean
integer_to_boolean(Integer) when is_integer(Integer) ->
    case Integer of
        0 -> false;
        _ -> true
    end.

%% 转换record类型为list
%% 注意：去掉了第一个表示记录类型的字段。
record_to_list(Record) ->
    [_ | ListLeft] = ?t2l(Record),
    ListLeft.

%% 转换list类型为record
%% 注意：list长度必须跟record一样
list_to_record(List, RecordAtom) ->
    ?l2t([RecordAtom | List]).

%% term序列化，term转换为bitstring格式
%% eg: [{a},1] => <<"[{a},1]">>
term_to_bitstring(Term) ->
    ?l2bs(io_lib:format("~w", [Term])).

%% term反序列化，bitstring转换为term
%% eg: <<"[{a},1]">>  => [{a},1]
bitstring_to_term(BitString) when is_binary(BitString) ->
    string_to_term(binary_to_list(BitString));
bitstring_to_term(_) ->
    undefined.

%% term序列化，term转换为string格式
%% eg: [{a},1] => "[{a},1]"
term_to_string(Term) ->
    ?b2l(?l2b(io_lib:format("~w", [Term]))).

%% term 保留字符串显示
term_to_string2(Term) ->
    ?b2l(?l2b(io_lib:format("~p", [Term]))).

%% term反序列化，string转换为term
%% eg: "[{a},1]"  => [{a},1]
string_to_term(String) ->
    case erl_scan:string(String ++ ".") of
        {ok, Tokens, _} ->
            case erl_parse:parse_term(Tokens) of
                {ok, Term} -> Term;
                _Err -> undefined
            end;
        _Error ->
            undefined
    end.

string_to_term2(BinString) ->
    case bitstring_to_term(BinString) of
        undefined -> [];
        Term -> Term
    end.

string_to_integer(String) ->
    case string:to_integer(String) of
        {error, _} -> 0;
        {I, _Left} -> I
    end.

%% @doc Quote a string or binary value so that it can be included safely in a
%% MySQL query.
mysql_query_quote(String) when is_list(String) ->
    [39 | lists:reverse([39 | quote__(String, [])])];    %% 39 is $'
mysql_query_quote(Bin) when is_binary(Bin) ->
    mysql_query_quote(binary_to_list(Bin)).

quote__([], Acc) ->
    Acc;
quote__([0 | Rest], Acc) ->
    quote__(Rest, [$0, $\\ | Acc]);
quote__([10 | Rest], Acc) ->
    quote__(Rest, [$n, $\\ | Acc]);
quote__([13 | Rest], Acc) ->
    quote__(Rest, [$r, $\\ | Acc]);
quote__([$\\ | Rest], Acc) ->
    quote__(Rest, [$\\, $\\ | Acc]);
quote__([39 | Rest], Acc) ->        %% 39 is $'
    quote__(Rest, [39, $\\ | Acc]);    %% 39 is $'
quote__([34 | Rest], Acc) ->        %% 34 is $"
    quote__(Rest, [34, $\\ | Acc]);    %% 34 is $"
quote__([26 | Rest], Acc) ->
    quote__(Rest, [$Z, $\\ | Acc]);
quote__([C | Rest], Acc) ->
    quote__(Rest, [C | Acc]).

%% @doc 转换为Unicode字符
unicode_string(String) when is_list(String) ->
    case catch erlang:list_to_binary(String) of
        Bin when is_binary(Bin) ->
            unicode:characters_to_list(Bin);
        _ ->
            unicode:characters_to_list(String)
    end;
unicode_string(Bin) when is_binary(Bin) ->
    unicode:characters_to_list(Bin).

%% @doc Unicode字符转换为二进制
unicode_binary(String) when is_list(String) ->
    unicode:characters_to_binary(String);
unicode_binary(Bin) when is_binary(Bin) ->
    Bin.

%% @doc 转换数据库字段
convert_db_field(Type, String) ->
    convert_db_field(Type, String, undefined).

convert_db_field(Type, String, Default) ->
    case {Type, bitstring_to_term(String)} of
        {list, List} when is_list(List) ->
            List;
        {map, Map} when is_map(Map) ->
            Map;
        {term, Term} when Term =/= undefined ->
            Term;
        _ ->
            Default
    end.

pid_to_bitstring(Pid) when is_pid(Pid) ->
    term_to_bitstring(?p2l(Pid));
pid_to_bitstring(_Pid) ->
    term_to_bitstring(0).

bitstring_to_pid(Bin) ->
    case catch (?l2p(bitstring_to_term(Bin))) of
        Ret when is_pid(Ret) -> Ret;
        _ -> 0
    end.

record_to_list(Record, RecordDefine) ->
    [RecordDefine | ListData] = ?t2l(Record),
    ListData.

%% 将二维List转为一维Tuple
%% [[1,2], [1,2]] -> [{1, 2}, {1, 2}]
list_to_tuple(List) when is_list(List) ->
    lists:map(fun(A) ->
        if
            is_list(A) -> ?l2t(A);
            is_tuple(A) -> A;
            true -> {A}
        end
    end, List);
list_to_tuple(Tuple) when is_tuple(Tuple) ->
    lists:map(fun(A) ->
        if
            is_list(A) -> ?l2t(A);
            is_tuple(A) -> A;
            true -> {A}
        end
    end, ?t2l(Tuple));
list_to_tuple(List) -> List.

%% -----------------------------------------------------------------------------
%% ip
%% -----------------------------------------------------------------------------

%% IP元组转字符
ip2str(IP) when is_list(IP) ->
    case inet:parse_address(IP) of
        {ok, _IP} -> ip2str(_IP);
        _ -> "256.256.256.256"
    end;
ip2str({A, B, C, D}) ->
    [?i2l(A), ".", ?i2l(B), ".", ?i2l(C), ".", ?i2l(D)];
ip2str(_) ->
    "256.256.256.256".

ip2bin(Ip) ->
    IpStr = ip2str(Ip),
    list_to_binary(IpStr).

bin_to_hex(Bin) ->
    lists:flatten([io_lib:format("~2.16.0B", [X]) || X <- binary_to_list(Bin)]).

hex_to_bin(S) ->
    hex_to_bin(S, []).

hex_to_bin([], Acc) ->
    list_to_binary(lists:reverse(Acc));
hex_to_bin([X, Y | T], Acc) ->
    {ok, [V], []} = io_lib:fread("~16u", [X, Y]),
    hex_to_bin(T, [V | Acc]);
hex_to_bin([X | T], Acc) ->
    {ok, [V], []} = io_lib:fread("~16u", lists:flatten([X, "0"])),
    hex_to_bin(T, [V | Acc]).
