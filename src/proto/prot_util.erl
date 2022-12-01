%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     协议辅助函数
%%% @end
%%% ----------------------------------------------------------------------------
-module(prot_util).

-export([
    zip_bin/1,
    unzip_bin/2
]).

-export([
    pack/2,
    unpack/2,
    encode_list/2,
    pack_string/1,
    unpack_string/1
]).


%% Apis --------------------------------------------------
% 压缩
zip_bin(BinData) ->
    Z = zlib:open(),
    ok = zlib:deflateInit(Z, default),
    First = zlib:deflate(Z, BinData),
    Last = zlib:deflate(Z, <<>>, finish),
    ok = zlib:deflateEnd(Z),
    zlib:close(Z),
    list_to_binary([First, Last]).

% 解压缩
unzip_bin(Bin, 0) ->
    Bin;
unzip_bin(Bin, 1) ->
    Z = zlib:open(),
    ok = zlib:inflateInit(Z),
    [Uncompressed] = case zlib:inflate(Z, Bin, [{exception_on_need_dict, false}]) of
        {need_dictionary, _DictId, Output} -> Output;
        Output -> Output
    end,
    ok = zlib:inflateEnd(Z),
    zlib:close(Z),
    Uncompressed.


%% 通用打包
%% Term = term()    需要打包的对象
%% Rule = term()    打包規則
%% return binary()

%% 举例1，混合
%% Term = [{1, <<"1222222">>}, {3, <<"123">>}]
%% Rule = [{8, string}]

%% 举例2，数组
%% Term = [3, 1, 111]
%% Rule = [16]

%% 举例3，对象
%% Term = {12, 2, <<"123">>}
%% Rule = {8, 16, string}

%% 举例4，字符串
%% Term = <<"1222222">> | "1222222"
%% Rule = string
pack(Term, {Digit, unsigned}) ->
    <<Term:Digit>>;
pack(Term, {Digit, signed}) ->
    <<Term:Digit>>;
pack(Term, {Digit, float, unsigned}) ->
    <<Term:Digit/float-unsigned>>;
pack(Term, {Digit, float, signed}) ->
    <<Term:Digit/float-signed>>;
pack(Term, {u, Rule}) ->
    {ok, Ret} = prot_ud:encode(Rule, Term),
    Ret;
pack(Term, {m, Rule}) ->
    {ok, Ret} = prot_md:encode(Rule, Term),
    Ret;
pack(Term, Rule) when erlang:is_tuple(Term) andalso erlang:is_tuple(Rule) ->
    pack_object(Term, Rule);
pack(Term, Rule) when erlang:is_list(Term) andalso erlang:is_list(Rule) ->
    pack_list(Term, Rule);
pack(Term, Rule) when (erlang:is_binary(Term) orelse erlang:is_list(Term)) andalso string =:= Rule ->
    pack_string(Term);
pack(_Term, string) ->
    pack_string("");
pack(_Term, _Rule) ->
    <<>>.


%% 通用解包，支持嵌套使用
%% Bin = binary()
%% RuleList = [int()]
%% 举例1，混合
%% Bin = <<3:16, 1:16, 111:32, 1:16, 1:8>>
%% Rule = {16, 16, 32, string}
%% return = {剩余二进制数据, {3, 1, 32, <<1>>}}

%% 举例2，数组
%% Bin = <<2:16, 1:16, 111:16>>
%% Rule = [16]
%% return = {剩余二进制数据, [1, 111]}

%% 举例3，数组
%% Bin = <<2:16, 1:8, 1:16, 1:32, 2:8, 2:16, 2:32>>
%% Rule = [{8, 16, 32}]
%% return = {剩余二进制数据, [{1, 1, 1}, {2, 2, 2}]}

%% 举例4，字符串
%% Bin = <<2:16, 1:8, 2:8>>
%% Rule = string
%% return = {剩余二进制数据, <<1,2>>}
unpack(Bin, {Digit, unsigned}) ->
    <<Data:Digit/unsigned, RBin/binary>> = Bin,
    %% ?DEBUG("===偏移量 ~w, 数据:~w ===", [Rule, Data]),
    {RBin, Data};
unpack(Bin, {Digit, signed}) ->
    <<Data:Digit/signed, RBin/binary>> = Bin,
    %% ?DEBUG("===偏移量 ~w, 数据:~w ===", [Rule, Data]),
    {RBin, Data};
unpack(Bin, {Digit, float, unsigned}) ->
    <<Data:Digit/float-unsigned, RBin/binary>> = Bin,
    %% ?DEBUG("===偏移量 ~w, 数据:~w ===", [Rule, Data]),
    {RBin, Data};
unpack(Bin, {Digit, float, signed}) ->
    <<Data:Digit/float-signed, RBin/binary>> = Bin,
    %% ?DEBUG("===偏移量 ~w, 数据:~w ===", [Rule, Data]),
    {RBin, Data};
unpack(Bin, {u, Rule}) ->
    prot_ud:decode(Rule, Bin);
unpack(Bin, {m, Rule}) ->
    prot_md:decode(Rule, Bin);
unpack(Bin, Rule) when erlang:is_tuple(Rule) ->
    unpack_object(Bin, Rule);
unpack(Bin, Rule) when erlang:is_list(Rule) ->
    unpack_array(Bin, Rule);
unpack(Bin, Rule) when string =:= Rule ->
    unpack_string(Bin);
unpack(Bin, _Rule) ->
    {Bin, unknown}.


encode_list([], _Fun) ->
    <<0:16, <<>>/binary>>;
encode_list(List, Fun) when is_list(List), is_function(Fun) ->
    LenList = length(List),
    BinList = list_to_binary([Fun(Value) || Value <- List]),
    <<LenList:16, BinList/binary>>;

encode_list(_List, _Fun) ->
    <<0:16, <<>>/binary>>.


pack_string(Term) when erlang:is_binary(Term) ->
    Len = erlang:byte_size(Term),
    <<Len:16, Term/binary>>;
pack_string(Term) when erlang:is_list(Term) ->
    TermBinary = list_to_binary(Term),
    Len = erlang:byte_size(TermBinary),
    <<Len:16, TermBinary/binary>>.


unpack_string(Bin) ->
    <<Len:16, RBin/binary>> = Bin,
    {Str, RBin2} = erlang:split_binary(RBin, Len),
    {RBin2, erlang:binary_to_list(Str)}.


%% Privates ---------------------------------------------
pack_object(Term, Rule) ->
    pack_object_loop(tuple_to_list(Term), tuple_to_list(Rule), []).

pack_object_loop([], _, Result) ->
    list_to_binary(lists:reverse(Result));
pack_object_loop(_, [], Result) ->
    list_to_binary(lists:reverse(Result));
pack_object_loop([Term | T], [Rule | T2], Result) ->
    pack_object_loop(T, T2, [pack(Term, Rule) | Result]).

pack_list(Term, [Rule]) ->
    Len = erlang:length(Term),
    list_to_binary([<<Len:16>>, pack_list_loop(Term, Rule, [])]).

pack_list_loop([], _, Result) ->
    lists:reverse(Result);
pack_list_loop([Term | T], Rule, Result)->
    pack_list_loop(T, Rule, [pack(Term, Rule) | Result]).

unpack_object(Bin, Rule) ->
    R = tuple_to_list(Rule),
    unpack_object_loop(Bin, R, []).

unpack_object_loop(Bin, [], Result) ->
    {Bin, list_to_tuple(Result)};
unpack_object_loop(Bin, [Rule | T], Result) ->
    {RBin, Data} = unpack(Bin, Rule),
    unpack_object_loop(RBin, T, Result ++ [Data]).

unpack_array(Bin, Rule) ->
    <<Len:16, RBin/binary>> = Bin,
    [NewRule] = Rule,
    unpack_array_loop(Len, RBin, NewRule, []).

unpack_array_loop(0, Bin, _, List) ->
    {Bin, List};
unpack_array_loop(_I, <<>>, _, List) ->
    {<<>>, List};
unpack_array_loop(I, Bin, Rule, List) ->
    {RBin, Obj} = unpack(Bin, Rule),
    unpack_array_loop(I - 1, RBin, Rule, List ++ [Obj]).
