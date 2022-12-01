%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     过滤词
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_filter).
-author("Ryuu").

-include("common.hrl").
-include("filter.hrl").
-include("ets_defines.hrl").

%% API
-export([
    init/0,
    test_word/0,
    update_all/0,
    delete_word/1,
    load_word_group/1,
    load_word_groups/0,
    match_word_group/1,
    delete_word_group/0,
    delete_word_group/1,
    import_words_by_id/1,
    replace_sensitive_talk/2,
    replace_sensitive_name/1,
    word_is_sensitive_talk/1,
    word_is_sensitive_name/1
]).

%% @doc 初始化
init() ->
    name_init(),
    talk_init(),
    talk_pass_1_init(),
    talk_pass_2_init(),
    talk_pass_3_init(),
    init_word_group(),
    ok.

%% @doc 更新所有词库
update_all() ->
    talk_init(),
    name_init(),
    ok.

%% @doc 加载名称相关过滤
name_init() ->
    ets:delete_all_objects(?ETS_SENSITIVE_NAME),
    import_words_name(?ETS_SENSITIVE_NAME),
    ok.

import_words_name(EtsName) ->
    Terms = conf_filter_name:words(),
    Convert = fun(X) ->
        unicode:characters_to_binary(X)
    end,
    Terms1 = lists:map(Convert, Terms),
    Terms2 = get_word_from_db(),
    lists:foreach(fun(X) -> add_word_to_ets(X, EtsName) end, Terms1),
    lists:foreach(fun(X) -> add_word_to_ets(X, EtsName) end, Terms2),
    ok.

talk_init() ->
    ets:delete_all_objects(?ETS_SENSITIVE_TALK),
    import_words_talk(?ETS_SENSITIVE_TALK, 0),
    ok.

talk_pass_1_init() ->
    ets:delete_all_objects(?ETS_SENSITIVE_TALK_PASS_1),
    import_words_talk(?ETS_SENSITIVE_TALK_PASS_1, 1),
    ok.

talk_pass_2_init() ->
    ets:delete_all_objects(?ETS_SENSITIVE_TALK_PASS_2),
    import_words_talk(?ETS_SENSITIVE_TALK_PASS_2, 2),
    ok.

talk_pass_3_init() ->
    ets:delete_all_objects(?ETS_SENSITIVE_TALK_PASS_3),
    import_words_talk(?ETS_SENSITIVE_TALK_PASS_3, 3),
    ok.

%% @doc 加载聊天相关过滤
%% @param EtsName  Ets名
%% @param TalkPass 0 敏感字库,需要加载数据库
%%                 1 放行字库等级段1,不要加载数据库
%%                 2 放行字库等级段2,不要加载数据库
%%                 3 放行字库等级段3,不要加载数据库
import_words_talk(EtsName, TalkPass) ->
    Terms = case TalkPass of
        0 ->
            Terms2 = get_word_from_db(),
            lists:foreach(fun(X) -> add_word_to_ets(X, EtsName) end, Terms2),
            conf_filter_talk:words();
        1 ->
            conf_filter_pass1:words();
        2 ->
            conf_filter_pass2:words();
        3 ->
            conf_filter_pass3:words()
    end,
    Convert = fun(X) ->
        unicode:characters_to_binary(X)
    end,
    Terms1 = lists:map(Convert, Terms),
    lists:foreach(fun(X) -> add_word_to_ets(X, EtsName) end, Terms1),
    ok.

get_word_from_db() ->
    Data = ?DB:get_all(?SQL_LOAD_ALL_WORD),
    Convert = fun([X]) ->
        format_filter(X)
    end,
    lists:map(Convert, Data).

add_word_to_ets(Word, EtsName) ->
    UniString = unicode:characters_to_list(Word, unicode),
    case UniString of
        [] -> ignor;
        _ ->
            [HeadChar | _Left] = UniString,
            case ets:lookup(EtsName, HeadChar) of
                [] -> ets:insert(EtsName, {HeadChar, [UniString]});
                [{_H, OldList}] ->
                    case lists:member(UniString, OldList) of
                        false -> ets:insert(EtsName, {HeadChar, [UniString | OldList]});
                        true -> ignore
                    end
            end
    end.

%% @doc 导入过滤词
import_words_by_id(Id) ->
    Data = ?DB:get_one(io_lib:format(?SQL_LOAD_ONE_WORD, [Id])),
    X = format_filter(Data),
    add_word_to_ets(X, ?ETS_SENSITIVE_TALK),
    add_word_to_ets(X, ?ETS_SENSITIVE_NAME),
    ok.

format_filter(Word) ->
    io_lib:format("~ts", [Word]).

%% @doc 删除过滤词
delete_word(Word) ->
    del_word_from_ets(Word, ?ETS_SENSITIVE_TALK),
    del_word_from_ets(Word, ?ETS_SENSITIVE_NAME),
    ok.

del_word_from_ets(Word, EtsName) ->
    UniString = unicode:characters_to_list(Word, unicode),
    case UniString of
        [] ->
            ignore;
        _ ->
            [HeadChar | _Left] = UniString,
            case ets:lookup(EtsName, HeadChar) of
                [] ->
                    ignore;
                [{_H, OldList}] ->
                    NewList = OldList -- [UniString],
                    ets:insert(EtsName, {HeadChar, NewList})
            end
    end.

word_is_sensitive_talk(Word) ->
    UniString = type:unicode_string(Word),
    word_is_sensitive_kernel(UniString, ?ETS_SENSITIVE_TALK).

word_is_sensitive_name(Word) ->
    UniString = type:unicode_string(Word),
    word_is_sensitive_kernel(UniString, ?ETS_SENSITIVE_NAME).

word_is_sensitive_kernel([], _EtsName) ->
    false;
word_is_sensitive_kernel(UniString, EtsName) ->
    [HeadChar | TailString] = UniString,
    UniStrLen = length(UniString),
    WordList = get_key_char_wordlist(HeadChar, EtsName),
    Match = fun(Word) ->
        WordLen = length(Word),
        if
            WordLen > UniStrLen ->
                false; %% 小于敏感词长度直接false
            WordLen =:= UniStrLen -> %% 等于直接比较
                UniString =:= Word;
            true -> %% 大于取词比较
                HeadStr = lists:sublist(UniString, WordLen),
                HeadStr =:= Word
        end
    end,
    case lists:any(Match, WordList) of
        true -> true;
        false -> word_is_sensitive_kernel(TailString, EtsName)
    end.

replace_sensitive_talk(Utf8String, Lv) when is_binary(Utf8String) ->
    UniString = unicode:characters_to_list(Utf8String, unicode),
    ReplacedString = replace_sensitive_kernel(UniString, Lv, 0, [],
        ?ETS_SENSITIVE_TALK, ?ETS_SENSITIVE_TALK_PASS_1,
        ?ETS_SENSITIVE_TALK_PASS_2, ?ETS_SENSITIVE_TALK_PASS_3),
    unicode:characters_to_binary(ReplacedString, utf8);
replace_sensitive_talk(InputString, Lv) when is_list(InputString) ->
    Utf8Binary = list_to_binary(InputString),
    replace_sensitive_talk(Utf8Binary, Lv);
replace_sensitive_talk(InputString, _Lv) ->
    InputString.

replace_sensitive_name(Utf8String) when is_binary(Utf8String) ->
    UniString = unicode:characters_to_list(Utf8String, unicode),
    ReplacedString = replace_sensitive_kernel(UniString, 0, 1, [],
        ?ETS_SENSITIVE_NAME, ?ETS_SENSITIVE_TALK_PASS_1,
        ?ETS_SENSITIVE_TALK_PASS_2, ?ETS_SENSITIVE_TALK_PASS_3),
    unicode:characters_to_binary(ReplacedString, utf8);
replace_sensitive_name(InputString) when is_list(InputString) ->
    Utf8Binary = list_to_binary(InputString),
    replace_sensitive_name(Utf8Binary);
replace_sensitive_name(InputString) ->
    InputString.

match_of_replace_sensitive_kernel(Word, Last, InputString, InputStrLen) ->
    case Last of
        0 ->
            WordLen = length(Word),
            if WordLen > InputStrLen -> 0;
                WordLen =:= InputStrLen ->
                    if (InputString =:= Word) ->
                        WordLen;
                        true ->
                            0
                    end;
                true ->
                    HeadStr = lists:sublist(InputString, length(Word)),
                    if (HeadStr =:= Word) ->
                        WordLen;
                        true ->
                            0
                    end
            end;
        _ -> Last
    end.

%%@param TalkOrName 0表示聊天,聊天需要按等级放行屏蔽词; 1表示名字
replace_sensitive_kernel([], _Lv, _TalkOrName, LastReplaced, _EtsName, _EtsPass1Name, _EtsPass2Name, _EtsPass3Name) ->
    LastReplaced;
replace_sensitive_kernel(Error, _Lv, _TalkOrName, LastReplaced, _EtsName, _EtsPass1Name, _EtsPass2Name, _EtsPass3Name)
    when is_list(Error) == false ->
    LastReplaced;
replace_sensitive_kernel(InputString, Lv, TalkOrName, LastReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name) ->
    [HeadChar | _TailString] = InputString,
    InputStrLen = length(InputString),
    if
        Lv >= 50 andalso TalkOrName =:= 0 ->
            %% 检测是否可放行
            WordPass_List = get_key_char_wordlist(HeadChar, EtsPass3Name),
            MatchPass = fun(WordPass, Last) ->
                match_of_replace_sensitive_kernel(WordPass, Last, InputString, InputStrLen)
            end,
            case lists:foldl(MatchPass, 0, WordPass_List) of
                0 -> %% 不可放行直接走检测屏蔽字
                    private_replace_sensitive_kernel(InputString, Lv, TalkOrName, LastReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name);
                %% 可放行
                SensWordPassLen ->
                    SubString = lists:sublist(InputString, 1, SensWordPassLen),
                    LeftString = lists:sublist(InputString, SensWordPassLen + 1, InputStrLen - SensWordPassLen),
                    NewReplaced = LastReplaced ++ SubString,
                    replace_sensitive_kernel(LeftString, Lv, TalkOrName, NewReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name)
            end;
        Lv >= 39 andalso Lv =< 49 andalso TalkOrName =:= 0 ->
            %% 检测是否可放行
            WordPass_List = get_key_char_wordlist(HeadChar, EtsPass2Name),
            MatchPass = fun(WordPass, Last) ->
                match_of_replace_sensitive_kernel(WordPass, Last, InputString, InputStrLen)
            end,
            case lists:foldl(MatchPass, 0, WordPass_List) of
                0 -> %% 不可放行直接走检测屏蔽字
                    private_replace_sensitive_kernel(InputString, Lv, TalkOrName, LastReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name);
                %% 可放行
                SensWordPassLen ->
                    SubString = lists:sublist(InputString, 1, SensWordPassLen),
                    LeftString = lists:sublist(InputString, SensWordPassLen + 1, InputStrLen - SensWordPassLen),
                    NewReplaced = LastReplaced ++ SubString,
                    replace_sensitive_kernel(LeftString, Lv, TalkOrName, NewReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name)
            end;
        Lv >= 1 andalso Lv =< 38 andalso TalkOrName =:= 0 ->
            %% 检测是否可放行
            WordPass_List = get_key_char_wordlist(HeadChar, EtsPass1Name),
            MatchPass = fun(WordPass, Last) ->
                match_of_replace_sensitive_kernel(WordPass, Last, InputString, InputStrLen)
            end,
            case lists:foldl(MatchPass, 0, WordPass_List) of
                0 -> %% 不可放行直接走检测屏蔽字
                    private_replace_sensitive_kernel(InputString, Lv, TalkOrName, LastReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name);
                %% 可放行
                SensWordPassLen ->
                    SubString = lists:sublist(InputString, 1, SensWordPassLen),
                    LeftString = lists:sublist(InputString, SensWordPassLen + 1, InputStrLen - SensWordPassLen),
                    NewReplaced = LastReplaced ++ SubString,
                    replace_sensitive_kernel(LeftString, Lv, TalkOrName, NewReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name)
            end;
        true ->
            private_replace_sensitive_kernel(InputString, Lv, TalkOrName, LastReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name)
    end.

%% @doc 检测屏蔽字，并替换
private_replace_sensitive_kernel(InputString, Lv, TalkOrName, LastReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name) ->
    [HeadChar | TailString] = InputString,
    WordList = get_key_char_wordlist(HeadChar, EtsName),
    InputStrLen = length(InputString),
    Match = fun(Word, Last) ->
        match_of_replace_sensitive_kernel(Word, Last, InputString, InputStrLen)
    end,
    case lists:foldl(Match, 0, WordList) of
        0 ->
            NewReplaced = LastReplaced ++ [HeadChar],
            replace_sensitive_kernel(TailString, Lv, TalkOrName, NewReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name);
        SensWordLen ->
            LeftString = lists:sublist(InputString, SensWordLen + 1, InputStrLen - SensWordLen),
            NewReplaced = LastReplaced ++ make_sensitive_show_string(SensWordLen),
            replace_sensitive_kernel(LeftString, Lv, TalkOrName, NewReplaced, EtsName, EtsPass1Name, EtsPass2Name, EtsPass3Name)
    end.

get_key_char_wordlist(KeyChar, EtsName) ->
    case ets:lookup(EtsName, KeyChar) of
        [] -> [];
        [{_H, WordList}] -> WordList
    end.

make_sensitive_show_string(1) ->
    "*";
make_sensitive_show_string(2) ->
    "*&";
make_sensitive_show_string(3) ->
    "*&^";
make_sensitive_show_string(4) ->
    "*&^%";
make_sensitive_show_string(5) ->
    "*&^%$";
make_sensitive_show_string(6) ->
    "*&^%$#";
make_sensitive_show_string(7) ->
    "*&^%$#@";
make_sensitive_show_string(8) ->
    "*&^%$#@!";
make_sensitive_show_string(N) ->
    M = N rem 8,
    C = N div 8,
    L1 = make_sensitive_show_string(M),
    L2 = lists:append(lists:duplicate(C, "*&^%$#@!")),
    lists:append([L2, L1]).

%% =============================================================================
%% 过滤词组
%% =============================================================================

%% @doc 初始化过滤词组
init_word_group() ->
    load_word_groups(),
    ok.

%% @doc 加载所有词组
load_word_groups() ->
    %% 清除
    delete_word_group(),
    %% 重新加载
    Fun = fun([ID, Word]) ->
        load_word_group(ID, Word)
    end,
    List = ?DB:get_all(?SQL_LOAD_ALL_WORD_GROUP),
    lists:foreach(Fun, List).

%% @doc 加载单个词组
load_word_group(ID) ->
    SQL = io_lib:format(?SQL_LOAD_ONE_WORD_GROUP, [ID]),
    Word = ?DB:get_one(SQL),
    load_word_group(ID, Word).

load_word_group(ID, Word) when is_binary(Word) ->
    List = binary_to_list(Word),
    load_word_group(ID, List);
load_word_group(ID, WordGroup) when is_list(WordGroup) ->
    List = [string:to_lower(Word) || Word <- string:tokens(WordGroup, "|")],
    util:put_ets(?ETS_SENSITIVE_WORD_GROUP, ID, List);
load_word_group(_ID, _Word) ->
    ignore.

%% @doc 删除所有过滤词组
delete_word_group() ->
    ets:delete_all_objects(?ETS_SENSITIVE_WORD_GROUP).

%% @doc 删除单个过滤词组
delete_word_group(ID) ->
    util:del_ets(?ETS_SENSITIVE_WORD_GROUP, ID).

%% @doc 是否匹配过滤词组
match_word_group(Talk) when is_binary(Talk) ->
    match_word_group(unicode:characters_to_list(Talk));
match_word_group(Talk) when is_list(Talk) ->
    Key = ets:first(?ETS_SENSITIVE_WORD_GROUP),
    LTalk = string:to_lower(Talk),
    case catch match_word_groups(Key, LTalk) of
        true -> true;
        _ -> false
    end.

match_word_groups('$end_of_table', _Talk) ->
    false;
match_word_groups(Key, Talk) ->
    List = util:get_ets(?ETS_SENSITIVE_WORD_GROUP, Key),
    case match_word_group(List, Talk) of
        true -> true;
        _ ->
            NKey = ets:next(?ETS_SENSITIVE_WORD_GROUP, Key),
            match_word_groups(NKey, Talk)
    end.

match_word_group([], _Talk) ->
    true;
match_word_group([Word | T], Talk) ->
    case string:str(Talk, Word) of
        I when I > 0 -> match_word_group(T, Talk);
        _ -> false
    end.

%% =============================================================================
%% 测试
%% =============================================================================

test_word() ->
    [DescList] = io_lib:format("~ts", ["蜀门"]),
    io:format("~p~n", [word_is_sensitive_talk(DescList)]),
    [DescList1] = io_lib:format("~ts", ["玉之魂"]),
    io:format("~p ~p~n", ["玉之魂", replace_sensitive_talk(DescList1, 100)]),
    [DescList2] = io_lib:format("~ts", ["梦-话-西-游"]),
    io:format("~p ~p~n", ["梦-话-西-游", replace_sensitive_talk(DescList2, 100)]),
    [DescList3] = io_lib:format("~ts", ["游ke"]),
    io:format("~p~n", [word_is_sensitive_talk(DescList3)]),
    [DescList4] = io_lib:format("~ts", ["纯-白"]),
    io:format("~p~n", [word_is_sensitive_talk(DescList4)]).
