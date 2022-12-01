%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     实用工具
%%% @end
%%% ----------------------------------------------------------------------------
-module(util).

-include("common.hrl").
-include("ret_code.hrl").

%% 随机
-export([
    rand/2,
    is_bingo/1,
    is_bingo/2
]).

%% 时间相关
-export([
    get_open_days/0,
    get_open_date/0,
    get_open_days/1,
    get_open_days/2,
    get_date_since_open/1,
    get_merge_date/0,
    get_merge_days/0,
    get_merge_days/1,
    get_merge_days/2,
    get_date_since_merge/1
]).

%% 列表
-export([
    for/3,
    for/4,
    gen_n/2,
    min_ex/2,
    map_ex/3,
    max_ex/2,
    sum_ex/2,
    keymax/3,
    sublist/3,
    % deeploop/3,
    list_find/4,
    list_rand/1,
    list_uniq/1,
    lists_add/1,
    find_ratio/3,
    merge_list/2,
    split_list/2,
    is_all_same/2,
    list_filter/2,
    list_handle/3,
    list_handle/4,
    list_rand_n/2,
    is_list_uniq/1,
    list_replace/3,
    list_shuffle/1,
    list_multiple/2,
    get_seq_list/2,
    rand_by_weight/2,
    rand_by_weight/3,
    rand_by_weight_return_rest/3,
    shuffle_list_n/2,
    get_zone_config/2,
    get_zone_config/3,
    rand_split_list/2,
    list_get_index/2,
    list_get_index_ex/3,
    list_disorder/1,
    foreach/3
]).

%% proplists
-export([
    prop_store/2,
    prop_store/3,
    prop_delete/2,
    prop_get_keys/1,
    prop_increase/2,
    prop_increase/3,
    prop_get_value/2,
    prop_get_value/3,
    prop_update_counter/2
]).

%% 字符串
-export([
    md5/1,
    hmac/2,
    implode/2,
    implode/3,
    explode/2,
    explode/3,
    hmac_hex/2,
    check_name/1,
    check_name/3,
    string_sub/2,
    string_sub/3,
    filter_name/1,
    filter_text/2,
    safe_format/2,
    check_length/3,
    check_filter/1,
    string_width/1,
    filter_string/2,
    escape_unicode/1,
    escape_varchar/1,
    text_similarity/2
]).

%% ets
-export([
    cls_ets/1,
    del_ets/2,
    get_ets/2,
    get_ets/3,
    put_ets/3
]).

%% dict
-export([
    dict_find/2,
    dict_find/3,
    dict_find2/3,
    dict_store/2,
    dict_values/1
]).

-export([
    action_limit/2,
    action_limit/3,
    action_limit/4,
    action_expire/1,
    check_action_limit/2
]).

%% math
-export([
    ceil/2,
    floor/2,
    round/2,
    page_data/3,
    circle_rand/4,
    in_distance/5,
    angle_to_float/1
]).

%% system
-export([
    process_infos/0,
    process_infos/2,
    get_stacktrace/0
]).

%% others
-export([
    cmp/1,
    sleep/1,
    sleep/2,
    exp_add/2,
    cancel_timer/1,
    cancel_timer/2
]).

%% IP
-export([
    get_ip/1
]).

-export([
    add_online_role/2,
    remove_online_role/2,
    format_role_set/1
]).

% -export([
%     merge_logs/3
% ]).


%% -----------------------------------------------------------------------------
%% 随机
%% -----------------------------------------------------------------------------
%% 产生一个介于Min到Max之间的随机整数
rand(Same, Same) ->
    Same;
rand(Min, Max) when Max < Min ->
    0;
rand(Min, Max) ->
    %% 以保证不同进程都可取得不同的种子
    case get("rand_seed") of
        undefined ->
            rand:seed(exs1024),
            put("rand_seed", 1);
        _ ->
            skip
    end,
    M = Min - 1,
    if
        Max - M =< 0 -> 0;
        true -> rand:uniform(Max - M) + M
    end.

%% @doc 是否成功
is_bingo(Rate) ->
    is_bingo(Rate, 10000).

is_bingo(Rate, Base) when Rate >= Base ->
    true;
is_bingo(Rate, Base) ->
    rand(1, Base) =< Rate.

%% -----------------------------------------------------------------------------
%% 随机
%% -----------------------------------------------------------------------------

%% @doc 随机取出list元素
list_rand([]) ->
    undefined;
list_rand(L) ->
    Len = length(L) + 100000,
    [{_, X} | _] = lists:sort([{rand:uniform(Len), E} || E <- L]),
    X.

%% @doc 随机从列表中选n个元素
list_rand_n([], _PickNum) ->
    [];
list_rand_n(List, PickNum) ->
    list_rand_n(List, PickNum, []).

list_rand_n([], _PickNum, AccList) ->
    AccList;
list_rand_n(_List, 0, AccList) ->
    AccList;
list_rand_n(List, PickNum, AccList) ->
    PickOne = list_rand(List),
    LeftList = List -- [PickOne],
    list_rand_n(LeftList, PickNum - 1, [PickOne | AccList]).

%% @doc 查找匹配机率的值
find_ratio([], _, _) ->
    [];
find_ratio([{N, R} | _], S, Ra) when Ra > S andalso Ra =< (S + R) ->
    N;
find_ratio([{_, R} | T], S, Ra) ->
    find_ratio(T, (S + R), Ra).

%% 依据权重，从元组列表中随机挑选一个元素，返回被抽中的元组，
%%           如果没有对应的元素，则抛出异常
%%           Index是权重所在的位置
%% @return:  Tuple
rand_by_weight([], _Index) ->
    error(badargs);
rand_by_weight(List, Index) ->
    Sum = lists:sum([weight_index(Tuple, Index) || Tuple <- List]),
    P = rand(1, Sum),
    rand_one_by_weight(List, Index, P).

rand_one_by_weight([Tuple], _, _) ->
    Tuple;
rand_one_by_weight([Tuple | T], Index, P) ->
    case weight_index(Tuple, Index) of
        Weight when P =< Weight -> Tuple;
        Weight -> rand_one_by_weight(T, Index, P - Weight)
    end.

weight_index(Tuple, Index) when is_tuple(Tuple) ->
    element(Index, Tuple);
weight_index(Map, Key) when is_map(Map) ->
    maps:get(Key, Map).

%% @doc 依据权重，从元组列表中随机挑选N个元素，返回被抽中的元组列表，不放回抽取
%% @Param: Tuples: 元组列表([{权重, ...}, ...]等类似格式)
%%         Index: 权重所在的位置(如上例则是1)
%%         PickNum: 随机抽出的次数
rand_by_weight(Tuples, Index, PickNum) ->
    {Ret, _} = rand_N_by_weight(Tuples, Index, PickNum, []),
    Ret.

%% @doc 依据权重，从元组列表中随机挑选N个元素，返回被抽中的{元组列表, 剩余元组列表}，不放回抽取
%% @Param: Tuples: 元组列表([{权重, ...}, ...]等类似格式)
%%         Index: 权重所在的位置(如上例则是1)
%%         PickNum: 随机抽出的次数
rand_by_weight_return_rest(Tuples, Index, PickNum) ->
    rand_N_by_weight(Tuples, Index, PickNum, []).

rand_N_by_weight(Tuples, _Index, 0, Ret) ->
    {Ret, Tuples};
rand_N_by_weight([], _Index, _PickNum, Ret) ->
    {Ret, []};
rand_N_by_weight(Tuples, Index, PickNum, Ret) ->
    PickOne = rand_by_weight(Tuples, Index),
    LeftTuples = lists:delete(PickOne, Tuples),
    rand_N_by_weight(LeftTuples, Index, PickNum - 1, [PickOne | Ret]).

%% @doc 获取区间配置
get_zone_config(Zones, Index) ->
    get_zone_config(Zones, Index, undefined).

get_zone_config([], _V, Default) ->
    Default;
get_zone_config([{L, H, C} | T], V, Default) ->
    case V >= L andalso (V =< H orelse H =:= -1) of
        true -> C;
        _ -> get_zone_config(T, V, Default)
    end.

%%%% 获取元组列表符合条件的第三个元组元素[{最小条件, 最大条件, 获得的,后面可以配也可以不配}, ...], 没有找到返回默认值
%%get_tt_element(Base, List) ->
%%    get_tt_element(Base, List, undefined).
%%
%%get_tt_element(_Base, [], Default) ->
%%    Default;
%%get_tt_element(Base, [E | List], Default) ->
%%    if
%%        Base >= element(1, E) andalso Base =< element(2, E) ->
%%            element(3, E);
%%        true ->
%%            get_tt_element(Base, List, Default)
%%    end.

%% @doc 随机打乱list元素顺序
list_shuffle([]) ->
    [];
list_shuffle(List) ->
    Len = length(List) + 100000,
    List1 = [{rand(1, Len), X} || X <- List],
    List2 = lists:sort(List1),
    [E || {_, E} <- List2].

shuffle_list_n([], N) when is_integer(N) ->
    [];
shuffle_list_n(L, 0) when is_list(L) ->
    [];
shuffle_list_n(L, N) when is_list(L), is_integer(N), N >= 0 ->
    Len = length(L) + 100000,
    lists:sublist([X || {_, X} <- lists:sort([{rand:uniform(Len), E} || E <- L])], N).

%% -----------------------------------------------------------------------------
%% 列表操作
%% -----------------------------------------------------------------------------

% 合并两个列表，相同键的值相加
% @doc 短的列表放在前面
% @spec L1 = L2      :: {term(), numeric()};
merge_list([], L2) ->
    L2;
merge_list([{K, V1} | RestL1], L2) ->
    NewL2 = case lists:keytake(K, 1, L2) of
        {value, {K, V2}, L3} -> [{K, V1 + V2} | L3];
        _ -> [{K, V1} | L2]
    end,
    merge_list(RestL1, NewL2).

%% 过滤掉元组列表中某个元素相同的列表
%% eg：L=[{1,2},{2,2},{3,1}]. list_filter(L, 2) -> [{1,2},{3,1}]
list_filter(List, N) ->
    list_filter_helper(List, N, [], []).

list_filter_helper([H | T], N, ResultList, KeyList) ->
    Key = element(N, H),
    case lists:member(Key, KeyList) of
        true -> list_filter_helper(T, N, ResultList, KeyList);
        false -> list_filter_helper(T, N, [H | ResultList], [Key | KeyList])
    end;
list_filter_helper([], _, ResultList, _) ->
    ResultList.

list_uniq(List) ->
    sets:to_list(sets:from_list(List)).

is_list_uniq(List) ->
    sets:size(sets:from_list(List)) =:= length(List).

%% 根据下标替换list元素值
list_replace(Index, NewElem, List) ->
    list_replace_helper(List, Index, NewElem, 1, []).

list_replace_helper([], _Index, _NewElem, _CurIndex, NewList) ->
    NewList;
list_replace_helper([H | T], Index, NewElem, CurIndex, NewList) ->
    if Index =:= CurIndex ->
        list_replace_helper(T, Index, NewElem, CurIndex + 1, NewList ++ [NewElem]);
        true ->
            list_replace_helper(T, Index, NewElem, CurIndex + 1, NewList ++ [H])
    end.

%% @doc 根据list的元素值获得下标
list_get_index(Elem, List) ->
    list_get_index_helper(List, Elem, 0).

list_get_index_helper([], _Elem, _Index) ->
    0;
list_get_index_helper([H | T], Elem, Index) ->
    if H =:= Elem ->
        Index + 1;
        true ->
            list_get_index_helper(T, Elem, Index + 1)
    end.

%% @doc 根据list的元素值获得下标（加强版）
%% @param: (Elem, N, List), List为元组列表，N为元组中第N个元素等于Elem
%% @return {0,null} | {Index, H}
list_get_index_ex(Elem, N, List) when is_list(List), is_integer(N) ->
    list_get_index_ex(Elem, N, List, 0);
list_get_index_ex(_, _, _) ->
    {0, null}.

list_get_index_ex(_Elem, _N, [], _) ->
    {0, null};
list_get_index_ex(Elem, N, [H | _], Index) when element(N, H) =:= Elem ->
    {Index + 1, H};
list_get_index_ex(Elem, N, [_ | L], Index) ->
    list_get_index_ex(Elem, N, L, Index + 1).


%% @doc 乱序一个列表，可以用于无权重随机
%% @param: (List), List为列表
%% @return NewList
list_disorder(List) ->
    Len = length(List),
    TmpList = [{E, rand(1, Len)} || E <- List],
    TmpList2 = lists:keysort(2, TmpList),
    [Elem || {Elem, _} <- TmpList2].

%% 多个列表数值相加，结果以第一个列表的长度为准
lists_add([ResultList]) ->
    ResultList;
lists_add([List1, List2 | T]) ->
    ResultList = lists_add_helper(List1, List2, []),
    lists_add([ResultList | T]).

lists_add_helper([], _List2, ResultList) ->
    lists:reverse(ResultList);
lists_add_helper(List1, [], ResultList) ->
    lists:reverse(ResultList) ++ List1;
lists_add_helper([H1 | T1], [H2 | T2], ResultList) ->
    lists_add_helper(T1, T2, [H1 + H2 | ResultList]).

%% 扩展版lists:min/1
%% @param: (List, N), List为元组列表，N为元组中第N个元素
min_ex([H | T], N) ->
    min_ex(T, H, N).
min_ex([H | T], Min, N) when element(N, H) < element(N, Min) ->
    min_ex(T, H, N);
min_ex([_ | T], Min, N) ->
    min_ex(T, Min, N);
min_ex([], Min, _) ->
    Min.

%% 扩展版lists:max/1
%% @param: (List, N), List为元组列表，N为元组中第N个元素
max_ex([H | T], N) ->
    max_ex(T, H, N);
max_ex([], _N) ->
    0.

max_ex([H | T], Max, N) when element(N, H) > element(N, Max) ->
    max_ex(T, H, N);
max_ex([_ | T], Max, N) ->
    max_ex(T, Max, N);
max_ex([], Max, _) ->
    Max.

%% 列表中某元素的总和
sum_ex(L, N) ->
    sum_ex(L, 0, N).
sum_ex([H | T], Sum, N) ->
    sum_ex(T, Sum + element(N, H), N);
sum_ex([], Sum, _) ->
    Sum.

%% 扩展的map函数
map_ex(_Fun, [], _Arg) ->
    [];
map_ex(Fun, [H | T], Arg) ->
    [Fun(H, Arg) | map_ex(Fun, T, Arg)].

%% 扩展版lists:max/1
%% @param: (List, N), List为元组列表，N为元组中第N个元素, Record为列表为空时调用者预期返回的内容
keymax([H | T], N, Record) ->
    keymax(T, H, N, Record);
keymax([], _N, Record) ->
    Record.

keymax([H | T], Max, N, Record) when element(N, H) > element(N, Max) ->
    keymax(T, H, N, Record);
keymax([_ | T], Max, N, Record) ->
    keymax(T, Max, N, Record);
keymax([], Max, _, _) ->
    Max.

%% 列表中的元素是否全部相同
%% @param: (List, N), List为元组列表，N为元组中第N个元素
is_all_same([H | T], N) ->
    is_all_same(T, H, N).

is_all_same([H | T], Min, N) when element(N, H) =:= element(N, Min) ->
    is_all_same(T, H, N);
is_all_same(L, _, _) when L =/= [] ->
    false;
is_all_same([], _, _) ->
    true.

%% @doc 截取列表的第Begin个到第End个
sublist(L, Begin, End) ->
    sublist(L, Begin, End, {1, []}).

sublist([], _Begin, _End, {_NowNth, RetL}) ->
    lists:reverse(RetL);
sublist([_ | _L], _Begin, End, {NowNth, RetL}) when NowNth > End ->
    lists:reverse(RetL);
sublist([Item | L], Begin, End, {NowNth, RetL}) when Begin =< NowNth andalso NowNth =< End ->
    sublist(L, Begin, End, {NowNth + 1, [Item | RetL]});
sublist([_ | L], Begin, End, {NowNth, RetL}) ->
    sublist(L, Begin, End, {NowNth + 1, RetL}).

%% @doc list split
split_list(N, List) when length(List) =< N ->
    {List, []};
split_list(N, List) ->
    lists:split(N, List).

%% @doc list rand split
rand_split_list(N, List) when length(List) =< N ->
    {List, []};
rand_split_list(N, List) ->
    DisorderdList = list_disorder(List),
    lists:split(N, DisorderdList).

%% @doc
list_find(Key, Pos, List, Def) ->
    case lists:keyfind(Key, Pos, List) of
        false -> Def;
        Val -> Val
    end.

list_multiple(N, List) ->
    lists:flatten(lists:duplicate(N, List)).

% @doc 获取  A 与 B 之间的序列
get_seq_list(A, B) when A < B ->
    lists:seq(A, B);
get_seq_list(A, B) when A > B ->
    lists:seq(B, A);
get_seq_list(A, A) ->
    [A].

%% for循环
for(Max, Max, F) ->
    F(Max);
for(I, Max, F) ->
    F(I),
    for(I + 1, Max, F).

%% 带返回状态的for循环
%% @return {ok, State}
for(Max, Min, _F, State) when Min < Max ->
    {ok, State};
for(Max, Max, F, State) ->
    F(Max, State);
for(I, Max, F, State) ->
    {ok, NewState} = F(I, State),
    for(I + 1, Max, F, NewState).

foreach(Fun, Acc, [H | T]) ->
    case Fun(H, Acc) of
        {ok, AccN} ->
            foreach(Fun, AccN, T);
        {break, AccN} ->
            AccN;
        AccN ->
            foreach(Fun, AccN, T)
    end;
foreach(_, Acc, []) ->
    Acc.
% @doc 容易出现死循环
% %% 循环函数
% deeploop(F, N, Data) ->
%     case N > 0 of
%         true ->
%             [N1, Data1] = F(N, Data),
%             deeploop(F, N1, Data1);
%         false ->
%             Data
%     end.

%% 列表循环操作
list_handle(F, Data, List, Place) ->
    case List of
        [H | T] ->
            case F(H, Data, Place) of
                {ok, Data2} ->
                    list_handle(F, Data2, T, Place);
                Error ->
                    Error
            end;
        [] ->
            {ok, Data}
    end.

list_handle(F, Data, List) ->
    case List of
        [H | T] ->
            case F(H, Data) of
                {ok, Data2} ->
                    list_handle(F, Data2, T);
                Error ->
                    Error
            end;
        [] ->
            {ok, Data}
    end.

gen_n(0, []) ->
    [];
gen_n(N, List) when N > 0, is_list(List), List =/= [] ->
    gen_n(N, List, []);
gen_n(_N, _List) ->
    [].

gen_n(0, _List, Acc) ->
    Acc;
gen_n(N, List, Acc) when is_list(Acc) ->
    Item = list_rand(List),
    gen_n(N - 1, List, [Item | Acc]).

%% -----------------------------------------------------------------------------
%% proplists 弱化版，采用lists实现，仅支持键值对列表 [{K, V}]
%% -----------------------------------------------------------------------------

%% @doc proplists:get_value/2
prop_get_value(Key, List) ->
    prop_get_value(Key, List, undefined).

prop_get_value(Key, List, Def) ->
    case lists:keyfind(Key, 1, List) of
        {Key, Val} -> Val;
        _ -> Def
    end.

%% @doc proplists:get_keys/1
prop_get_keys(List) ->
    [K || {K, _V} <- List].

%% @doc proplists:delete/2
prop_delete(K, List) ->
    lists:keydelete(K, 1, List).

%% @doc
prop_store({K, V}, List) ->
    prop_store(K, V, List).

prop_store(K, V, List) ->
    lists:keystore(K, 1, List, {K, V}).

%% @doc
prop_increase(K, List) ->
    prop_increase(K, List, 1).

prop_increase(K, List, Incl) ->
    case prop_get_value(K, List, 0) of
        V when is_integer(V) ->
            prop_store(K, V + Incl, List);
        _ ->
            List
    end.

%% @doc
prop_update_counter(KvList, List) ->
    lists:foldl(fun
        ({K, V}, Acc) ->
            util:prop_increase(K, Acc, V);
        (K, Acc) when is_integer(K) ->
            util:prop_increase(K, Acc)
    end, List, KvList).

%% -----------------------------------------------------------------------------
%% 字符文本操作
%% -----------------------------------------------------------------------------

%% 在List中的每两个元素之间插入一个分隔符
implode(_S, []) ->
    [<<>>];
implode(S, L) when is_list(L) ->
    implode(S, L, []).

implode(_S, [H], NList) ->
    lists:reverse([type:object_to_list(H) | NList]);
implode(S, [H | T], NList) ->
    L = [type:object_to_list(H) | NList],
    implode(S, T, [S | L]).

%% 字符->列
explode(S, B) ->
    re:split(B, S, [{return, list}]).

explode(S, B, int) ->
    [list_to_integer(Str) || Str <- explode(S, B), length(Str) > 0].

%% 转换成HEX格式的md5
md5(S) ->
    lists:flatten([io_lib:format("~2.16.0b", [N]) || N <- binary_to_list(erlang:md5(S))]).

%% 转换成HEX格式的hmac
hmac(Key, Msg) ->
    crypto:hmac(sha, list_to_binary(Key), list_to_binary(Msg)).

%% 转换成HEX格式的hmac
hmac_hex(Key, Msg) ->
    <<Mac:160/integer>> = crypto:hmac(sha, list_to_binary(Key), list_to_binary(Msg)),
    lists:flatten(io_lib:format("~40.16.0b", [Mac])).

%% @doc 敏感词过滤
%% @param Text list() | bitstring()
%% @return bitstring() 过滤后的文本
filter_text(Text, Lv) when is_bitstring(Text) ->
    S = bitstring_to_list(Text),
    filter_text(S, Lv);
filter_text(Text, Lv) when is_list(Text) ->
    [Term] = io_lib:format("~ts", [Text]),
    lib_filter:replace_sensitive_talk(Term, Lv).

%% 名字过滤
%% @param Text list() | bitstring()
%% @return bitstring() 过滤后的文本
filter_name(Text) when is_bitstring(Text) ->
    S = bitstring_to_list(Text),
    filter_name(S);
filter_name(Text) when is_list(Text) ->
    [Term] = io_lib:format("~ts", [Text]),
    lib_filter:replace_sensitive_name(Term).

%% @doc 检查字符串是否合法(名字)，会抛出异常
check_name(String) ->
    check_name(String, 2, 6).

check_name(String, MinLen, MaxLen) ->
    UString = type:unicode_string(String),
    case check_length(UString, MinLen, MaxLen) of
        true ->
            case check_keyword(UString, ["'", "/", "\"", "_", "<", ">"]) of
                false ->
                    case check_filter(UString) of
                        false -> ok;
                        true -> erlang:throw({error, ?RC_NAME_ILLEGAL_STRING})
                    end;
                true ->
                    erlang:throw({error, ?RC_NAME_ILLEGAL_STRING})
            end;
        false ->
            erlang:throw({error, ?RC_NAME_LEN_TOO_LONG})
    end.

%% @doc 长度合法性检查
check_length(String, MinLen, MaxLen) ->
    Len = string_width(String),
    Len =< MaxLen andalso Len >= MinLen.

%% @doc 字符宽度
string_width(String) ->
    length(type:unicode_string(String)).

%% @doc 检查关键字，存在非法字符返回true，否则false
check_keyword(_, []) ->
    false;
check_keyword(Text, [Word | Words]) ->
    case re:run(Text, Word, [unicode, {capture, none}]) of
        match ->
            true;
        nomatch ->
            check_keyword(Text, Words)
    end.

check_filter(Text) ->
    lib_filter:word_is_sensitive_name(Text).

%% @doc 过滤掉字符串中的特殊字符
filter_string(String, CharList) ->
    case is_list(String) of
        true ->
            filter_string_helper(String, CharList, []);
        false when is_binary(String) ->
            ResultString = filter_string_helper(binary_to_list(String), CharList, []),
            list_to_binary(ResultString);
        false ->
            String
    end.

filter_string_helper([], _CharList, ResultString) ->
    ResultString;
filter_string_helper([H | T], CharList, ResultString) ->
    case lists:member(H, CharList) of
        true -> filter_string_helper(T, CharList, ResultString);
        false -> filter_string_helper(T, CharList, ResultString ++ [H])
    end.

%% @doc 转义数据库varchar
escape_varchar(S) when is_binary(S) ->
    escape_varchar(binary_to_list(S));
escape_varchar(S) when is_list(S) ->
    S1 = escape_unicode(S),
    re:replace(S1, "[\\\\|-|;|,|\\.|/|\\(|\\)|\\[|\\]|}|{|%|\\@|*|!|'|\"]", "", [global, {return, binary}]).

%% @doc 删除编码超过2个字节的字符
escape_unicode(S) ->
    escape_unicode2(string:strip(S)).

escape_unicode2([H | T]) ->
    if
        H band 16#F8 =:= 16#F0 ->
            if
                length(T) >= 3 ->
                    escape_unicode2(lists:nthtail(3, T));
                true -> []
            end;
        true ->
            [H | escape_unicode2(T)]
    end;
escape_unicode2([]) ->
    [].

%% @doc 截取字符串
string_sub(Str, Start) ->
    Unicode = unicode:characters_to_list(Str),
    unicode:characters_to_binary(lists:sublist(Unicode, Start)).

string_sub(Str, Start, Len) ->
    Unicode = unicode:characters_to_list(Str),
    unicode:characters_to_binary(lists:sublist(Unicode, Start, Len)).

safe_format(Fmt, Args) when is_list(Args) ->
    case catch lists:flatten(io_lib:format(Fmt, Args)) of
        Val when is_list(Val) orelse is_binary(Val) ->
            Val;
        _ ->
            Fmt
    end.

%% --------------------------
%% 计算字符串的相似度
%% --------------------------

%% 用于聊天检测
text_similarity(A, B) ->
    AWordDict = word_dict(unicode:characters_to_list(type:object_to_binary(A))),
    BWordDict = word_dict(unicode:characters_to_list(type:object_to_binary(B))),
    Dict = merge_dict(AWordDict, BWordDict),
    F = fun(_K, {V1, V2}, {DenominatorAcc, Sqdoc1Acc, Sqdoc2Acc}) ->
        {DenominatorAcc + V1 * V2
            , Sqdoc1Acc + V1 * V1
            , Sqdoc2Acc + V2 * V2
        }
    end,
    {Denominator, Sqdoc1, Sqdoc2} = dict:fold(F, {0, 0, 0}, Dict),
    case Sqdoc1 =:= 0 orelse Sqdoc2 =:= 0 of
        true -> 0;
        false -> Denominator / math:sqrt(Sqdoc1 * Sqdoc2)
    end.

merge_dict(D1, D2) ->
    F1 = fun(_K, V) -> {V, 0} end,
    D1_ = dict:map(F1, D1),
    F2 = fun(K, V, Dict) ->
        case dict:find(K, D1_) of
            error -> dict:store(K, {0, V}, Dict);
            {ok, {V1, 0}} -> dict:store(K, {V1, V}, Dict);
            _ -> Dict
        end
    end,
    D2_ = dict:fold(F2, D1_, D2),
    D2_.
% % 过滤常用词
% F3 = fun(K, _V) -> not lists:member(K, ?GENERAL_WORD) end,
% D3_ = dict:filter(F3, D2_),
% D3_.

% 取字（连续数字、连续字符当作一个字）
word_dict(L) -> word__(L, [], dict:new()).
% A-Z   65-90
% a-z   97-122
% 0-9   48-57
word__([A | L], Word, WordDict) when (A >= 65 andalso A =< 90) orelse
    (A >= 97 andalso A =< 122) orelse
    (A >= 48 andalso A =< 57) ->
    word__(L, [A | Word], WordDict);
word__([I | L], [], WordDict) ->
    word__(L, [], dict:update_counter([I], 1, WordDict));
word__([I | L], Word, WordDict) ->
    WordDict1 = dict:update_counter(Word, 1, WordDict),
    WordDict2 = dict:update_counter([I], 1, WordDict1),
    word__(L, [], WordDict2);
word__([], [], WordList) ->
    WordList;
word__([], Word, WordDict) ->
    dict:update_counter(Word, 1, WordDict).

%% -----------------------------------------------------------------------------
%% 数学
%% -----------------------------------------------------------------------------

ceil(Num, 0) ->
    erlang:ceil(Num);
ceil(Num, Base) ->
    erlang:ceil(Num / Base) * Base.

floor(Num, 0) ->
    erlang:floor(Num);
floor(Num, Base) ->
    erlang:floor(Num / Base) * Base.

round(Num, 0) ->
    erlang:round(Num);
round(Num, Base) ->
    erlang:round(Num / Base) * Base.

%% 角度和cos的转换，cos(60') = 0.5
angle_to_float(Angle) ->
    math:cos(math:pi() * Angle / 180).

%% @doc 圆形范围内随机点
circle_rand(X0, Y0, R, Num) ->
    circle_rand(Num, 4 * R * R, X0, Y0, R, []).

circle_rand(0, _L, _X0, _Y0, _R, Acc) ->
    Acc;
circle_rand(_N, 0, _X0, _Y0, _R, Acc) ->
    Acc;
circle_rand(N, L, X0, Y0, R, Acc) ->
    X = X0 + rand(-R, R),
    Y = Y0 + rand(-R, R),
    case lists:member({X, Y}, Acc) orelse
        (X - X0) * (X - X0) + (Y - Y0) * (Y - Y0) > R * R of
        true ->
            circle_rand(N, L, X0, Y0, R, Acc);
        _ ->
            circle_rand(N - 1, L - 1, X0, Y0, R, [{X, Y} | Acc])
    end.

%% @doc 矩形范围内随机点
%%rect_rand(X0, Y0, X1, Y1, Num) ->
%%    [].

in_distance(X1, Y1, X0, Y0, Dist) ->
    (X1 - X0) * (X1 - X0) + (Y1 - Y0) * (Y1 - Y0) =< Dist * Dist.

%% 分页取数据
% @param Data 所有数据（列表）
% @param Page 第几页数据（大于总页数则默认最后页）
% @param PageNum 每一页数量
% @return {总页数, 当前页, 当前页数据}
page_data(Data, Page, PageNum) ->
    Len = length(Data),
    PageTotal = ceil(Len / PageNum),
    PageNow = case Page > PageTotal of true -> max(1, PageTotal); false -> Page end,
    StartIndex = (PageNow - 1) * PageNum + 1,
    PickData = lists:sublist(Data, StartIndex, PageNum),
    {PageTotal, PageNow, PickData}.

%% -----------------------------------------------------------------------------
%% 定时器相关
%% -----------------------------------------------------------------------------

%% 取消定时器
cancel_timer(Timer) ->
    case is_reference(Timer) of
        true ->
            erlang:cancel_timer(Timer);
        false ->
            skip
    end,
    [].

cancel_timer(Ref, Event) when is_reference(Ref) ->
    case erlang:cancel_timer(Ref) of
        false ->
            receive Event -> 0
            after 0 -> false
            end;
        RemainingTime -> RemainingTime
    end;
cancel_timer(_Ref, _Event) ->
    false.

%% -----------------------------------------------------------------------------
%% ets相关
%% -----------------------------------------------------------------------------

get_ets(Table, Key) ->
    case ets:lookup(Table, Key) of
        [{Key, Val}] -> Val;
        _ -> undefined
    end.

get_ets(Table, Key, Def) ->
    case ets:lookup(Table, Key) of
        [{Key, Val}] -> Val;
        _ -> Def
    end.

put_ets(Table, Key, Value) ->
    ets:insert(Table, {Key, Value}).

del_ets(Table, Key) ->
    ets:delete(Table, Key).

cls_ets(Table) ->
    ets:delete_all_objects(Table).

%% -----------------------------------------------------------------------------
%% dict相关
%% -----------------------------------------------------------------------------

dict_find(Key, Dict) ->
    dict_find(Key, Dict, undefined).

dict_find(Key, Dict, Default) ->
    case dict:find(Key, Dict) of
        {ok, V} -> V;
        _ -> Default
    end.

dict_find2(Key, Dict, Default) ->
    case dict:find(Key, Dict) of
        {ok, V} -> {true, V};
        _ -> {false, Default}
    end.

dict_values(Dict) ->
    [V || {_, V} <- dict:to_list(Dict)].

dict_store([], Dict) ->
    Dict;
dict_store([{K, V} | T], Dict) ->
    dict_store(T, dict:store(K, V, Dict)).


%% -----------------------------------------------------------------------------
%% 时间相关（纯时间操作见time）
%% -----------------------------------------------------------------------------


%% @doc 获取开服天数（开服当天为第1天）
get_open_days() ->
    OpenTime = util_svr:get_open_time(),
    Now = time:unixtime(),
    case Now >= OpenTime of
        true -> time:get_diff_days(OpenTime, Now) + 1;
        _ -> 1
    end.

%% @doc 获取开服天数（开服当天为第1天）
get_open_days(Now) ->
    OpenTime = util_svr:get_open_time(),
    case Now >= OpenTime of
        true -> time:get_diff_days(OpenTime, Now) + 1;
        _ -> 1
    end.

%% @doc 获取开服天数（开服当天为第1天）
get_open_days(Now, OpenTime) ->
    case Now >= OpenTime of
        true -> time:get_diff_days(OpenTime, Now) + 1;
        _ -> 1
    end.

%% @doc 获取开服时间
get_open_date() ->
    OpenTime = util_svr:get_open_time(),
    {Date, _} = time:unixtime_to_localtime(OpenTime),
    Date.

%% @doc 开服第N天（开服当天为第1天）
get_date_since_open(Day) when Day >= 1 ->
    OpenDate = get_open_date(),
    time:add_days(OpenDate, Day - 1).

%% @doc 获取合服时间
get_merge_date() ->
    MergeTime = util_svr:get_merge_time(),
    {Date, _} = time:unixtime_to_localtime(MergeTime),
    Date.

%% @doc 获取合服天数
get_merge_days() ->
    MergeTime = util_svr:get_merge_time(),
    Now = time:unixtime(),
    case MergeTime > 0 of
        true -> time:get_diff_days(MergeTime, Now) + 1;
        _ -> 0
    end.

%% @doc 获取合服天数
get_merge_days(Now) ->
    MergeTime = util_svr:get_merge_time(),
    case MergeTime > 0 of
        true -> time:get_diff_days(MergeTime, Now) + 1;
        _ -> 0
    end.

%% @doc 获取合服天数（合服当天为第1天）
get_merge_days(Now, MergeTime) ->
    case MergeTime > 0 of
        true -> time:get_diff_days(MergeTime, Now) + 1;
        _ -> 0
    end.

%% @doc 合服第N天（合服当天为第1天）
get_date_since_merge(Day) when Day >= 1 ->
    MergeDate = get_merge_date(),
    time:add_days(MergeDate, Day - 1).


%% -----------------------------------------------------------------------------
%% 系统分析工具
%% -----------------------------------------------------------------------------

process_infos() ->
    filelib:ensure_dir("../logs/"),
    File = "../logs/processes_infos.log",
    {ok, Fd} = file:open(File, [write, raw, binary, append]),
    Fun = fun(Pi) ->
        Info = io_lib:format("=>~p \n\n", [Pi]),
        case filelib:is_file(File) of
            true ->
                file:write(Fd, Info);
            false ->
                file:close(Fd),
                {ok, NewFd} = file:open(File, [write, raw, binary, append]),
                file:write(NewFd, Info)
        end,
        timer:sleep(20)
    end,
    [Fun(erlang:process_info(P)) || P <- erlang:processes()].

process_infos(Pid, Type) ->
    filelib:ensure_dir("../logs/"),
    File = "../logs/processes_infos.log",
    {ok, Fd} = file:open(File, [write, raw, binary, append]),
    Fun = fun(Pi) ->
        NewPi = case Type of
            messages ->
                {messages, SendList} = Pi,
                lists:foldl(fun({TType, Content}, CmdList) ->
                    case TType of
                        send ->
                            <<_A:16, Cmd:32, _Left/binary>> = Content,
                            case lists:keyfind(Cmd, 1, CmdList) of
                                false -> [{Cmd, 1} | CmdList];
                                {_, CNum} -> lists:keyreplace(Cmd, 1, CmdList, {Cmd, CNum + 1})
                            end;
                        _ -> [{TType, Content} | CmdList]
                    end
                end, [], SendList);
            _ ->
                Pi
        end,
        Info = io_lib:format("=>~p \n\n", [NewPi]),
        case filelib:is_file(File) of
            true ->
                file:write(Fd, Info);
            false ->
                file:close(Fd),
                {ok, NewFd} = file:open(File, [write, raw, binary, append]),
                file:write(NewFd, Info)
        end
    end,
    PInfo = erlang:process_info(Pid, Type),
    Fun(PInfo).

% @doc 获取堆栈信息
get_stacktrace() ->
    try erlang:throw(stacktrace) catch _:_ -> erlang:get_stacktrace() end.


%% -----------------------------------------------------------------------------
%% 其它
%% -----------------------------------------------------------------------------
check_action_limit(Key, Span) ->
    case action_limit(Key, Span) of
        {error, too_fast} ->
            erlang:throw({error, 253});
        Ret ->
            Ret
    end.

%% @doc action_limit
action_limit(Key, Span) ->
    action_limit(Key, Span, ok).

action_limit(Key, Span, Action) ->
    action_limit(Key, Span, Action, false).

action_limit(Key, Span, Action, Instance) ->
    Now = time:unixtime(),
    case erlang:get({action_limit, Key}) of
        Time when (is_integer(Time) andalso Now - Time < Span) andalso not Instance ->
            {error, too_fast};
        _ ->
            erlang:put({action_limit, Key}, Now),
            case is_function(Action, 0) of
                true -> Action();
                _ -> Action
            end
    end.

action_expire(Key) ->
    erlang:erase({action_limit, Key}).

%% -----------------------------------------------------------------------------
%% 其它
%% -----------------------------------------------------------------------------

%% 睡眠
sleep(T) ->
    receive
    after T -> ok
    end.

sleep(T, F) ->
    receive
    after T -> F()
    end.

cmp([]) ->
    true;
cmp([{Ka, Kb} | T]) ->
    if
        Ka > Kb -> true;
        Ka < Kb -> false;
        true -> cmp(T)
    end.

%% 经验加成万分比（用==判断，不要用精确匹配）
exp_add(BaseExp, ExpMul) when BaseExp == 0; ExpMul == 0 ->
    0;
exp_add(BaseExp, ExpMul) when is_number(BaseExp), is_number(ExpMul) ->
    erlang:round(BaseExp * ExpMul / 10000);
exp_add(_, _) ->
    0.

%% 获取客户端ip
get_ip(Socket) ->
    case inet:peername(Socket) of
        {ok, {Ip, _Port}} -> Ip;
        {error, _Reason} -> {0, 0, 0, 0}
    end.

%% @doc
add_online_role(FieldsInfo, RoleKey) ->
    #{role_set := FieldsRoleSet, online_set := FieldsOnlineSet} = FieldsInfo,
    NewFieldsRoleSet = sets:add_element(RoleKey, FieldsRoleSet),
    NewFieldsOnlineSet = sets:add_element(RoleKey, FieldsOnlineSet),
    NewFieldsInfo = FieldsInfo#{
        role_set => NewFieldsRoleSet, online_set => NewFieldsOnlineSet
    },
    NewFieldsInfo.

remove_online_role(RoomInfo, RoleKey) ->
    #{online_set := RoomOnline} = RoomInfo,
    NewRoomOnline = sets:del_element(RoleKey, RoomOnline),
    RoomInfo#{online_set => NewRoomOnline}.

format_role_set(RoomInfo) ->
    #{role_set := RoomRoleSet, online_set := RoomOnlineSet} = RoomInfo,
    RoomInfo#{
        role_set => sets:to_list(RoomRoleSet), online_set => sets:to_list(RoomOnlineSet)
    }.

% merge_logs(OldLogs, [], _ConfLogNum) when is_list(OldLogs) ->
%     OldLogs;
% merge_logs([], NewLogs, _ConfLogNum) when is_list(NewLogs) ->
%     NewLogs;
% merge_logs(OldLogs, NewLogs, ConfLogNum) when is_list(OldLogs), is_list(NewLogs) ->
%     Len1 = length(OldLogs),
%     Len2 = length(NewLogs),
%     if
%         Len2 =:= ConfLogNum -> NewLogs;
%         Len2 > ConfLogNum -> lists:sublist(NewLogs, 1, ConfLogNum);
%         Len2 < ConfLogNum andalso Len1 =:= 0 -> NewLogs;
%         Len2 < ConfLogNum andalso (Len1 + Len2) =< ConfLogNum -> NewLogs ++ OldLogs;
%         Len2 < ConfLogNum andalso (Len1 + Len2) > ConfLogNum ->
%             NewLogs ++ lists:sublist(OldLogs, 1, ConfLogNum - Len2)
%     end.
