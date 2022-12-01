%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     师徒系统
%%% @end
%%% Created : 28. 二月 2019 16:27
%%%-------------------------------------------------------------------
-module(lib_mentor).
-author("Tom").

-include("common.hrl").
-include("mentor.hrl").
-include("sworn.hrl").
-include("friend.hrl").
-include("ets_defines.hrl").

%% API
-export([
    get_person/1,
    add_relation/2,
    is_mentor/2,
    get_tudi_mark/1,
    remove_relation/1,
    delete_person/1,
    update_person/1,
    confirm_start/3,
    get_confirm_data/2,
    clear_confirm_data/2,
    get_rand_persons/4,
    save_person_to_db/1,

    init_cache/0,
    save_cache/1,
    logic_tick/0
]).

%% @doc 获取某个徒弟的学业成绩
get_tudi_mark(TudiID) ->
    MentorCache = get_cache(),
    #mentor_cache{relation_map = RelationMap} = MentorCache,
    MentorID = maps:get(TudiID, RelationMap, 0),
    MentorPerson = get_person(MentorID),
    case MentorPerson of
        #mentor_person{tudi_list = TudiList} ->
            MentorTudi = util:list_find(TudiID, #mentor_tudi.role_id, TudiList, undefined),
            case MentorTudi of
                #mentor_tudi{mark = Mark} -> Mark;
                undefined -> 0
            end;
        undefined ->
            0
    end.

%% @doc 增加师徒关系
add_relation(RoleID, MentorID) ->
    MentorCache = get_cache(),
    #mentor_cache{relation_map = RelationMap} = MentorCache,
    set_cache(MentorCache#mentor_cache{relation_map = maps:put(RoleID, MentorID, RelationMap)}).

%% @doc 移除师徒关系
remove_relation(TudiID) ->
    MentorCache = get_cache(),
    #mentor_cache{relation_map = RelationMap} = MentorCache,
    set_cache(MentorCache#mentor_cache{relation_map = maps:remove(TudiID, RelationMap)}).

%% @doc 判断与某人是否有师徒关系
is_mentor(RoleID, TargetRoleID) ->
    MentorCache = get_cache(),
    #mentor_cache{relation_map = RelationMap} = MentorCache,
    MentorID = maps:get(RoleID, RelationMap, 0),
    MentorPerson = get_person(MentorID),
    case MentorPerson of
        #mentor_person{} ->
            MentorIDN = maps:get(TargetRoleID, RelationMap, 0),
            MentorIDN =:= MentorID;
        undefined -> false
    end.

%% @doc 发起确认
confirm_start(Type, Key, ConfirmData) ->
    ConfirmMap = get_confirm_map(Type),
    ConfirmMapN = maps:put(Key, ConfirmData, ConfirmMap),
    set_confirm_map(Type, ConfirmMapN).

%% @doc 获取确认
get_confirm_data(Type, Key) ->
    ConfirmMap = get_confirm_map(Type),
    maps:get(Key, ConfirmMap, ?confirm_data#{}).

%% @doc 清除确认缓存
clear_confirm_data(Type, Key) ->
    ConfirmMap = get_confirm_map(Type),
    ConfirmMapN = maps:remove(Key, ConfirmMap),
    set_confirm_map(Type, ConfirmMapN).

%% @doc 删除师父数据
delete_person(RoleID) ->
    MentorCache = get_cache(),
    #mentor_cache{mentor_persons = PersonList} = MentorCache,
    PersonListN = lists:keydelete(RoleID, #mentor_person.role_id, PersonList),
    set_cache(MentorCache#mentor_cache{updated = true, mentor_persons = PersonListN}),
    SQL = io_lib:format(?SQL_DELETE_MENTOR_PERSON_BY_ID, [RoleID]),
    ?DB:execute(SQL).

%% @doc 获取师父数据
get_person(RoleID) ->
    MentorCache = get_cache(),
    #mentor_cache{mentor_persons = PersonList} = MentorCache,
    case lists:keyfind(RoleID, #mentor_person.role_id, PersonList) of
        false ->
            Data = init_one_person(RoleID),
            case Data of
                undefined ->
                    undefined;
                _ ->
                    PersonListN = lists:keystore(RoleID, #mentor_person.role_id, PersonList, Data),
                    set_cache(MentorCache#mentor_cache{updated = true, mentor_persons = PersonListN}),
                    init_relation(Data#mentor_person.tudi_list, RoleID),
                    Data#mentor_person{last_update_time = time:unixtime()}
            end;
        Data ->
            Data#mentor_person{last_update_time = time:unixtime()}
    end.

%% @doc 更新个人结拜数据
update_person(Person) when is_record(Person, mentor_person) ->
    MentorCache = get_cache(),
    #mentor_cache{mentor_persons = PersonList} = MentorCache,
    PersonListN = lists:keystore(Person#mentor_person.role_id, #mentor_person.role_id, PersonList, Person),
    set_cache(MentorCache#mentor_cache{updated = true, mentor_persons = PersonListN});
update_person(_) ->
    skip.

%% @doc  持久化师父数据
save_person_to_db(MentorID) ->
    MentorPerson = get_person(MentorID),
    case MentorPerson of
        #mentor_person{} -> execute_save_person([MentorPerson], 1);
        undefined -> skip
    end.

%% @doc 获取随机师父列表
get_rand_persons(RoleID, Lv, Number, QuizList) ->
    #{tudi_num := TudiNum} = conf_mentor_base:get(),
    MentorCache = get_cache(),
    #mentor_cache{mentor_persons = PersonList} = MentorCache,
    Func = fun(#mentor_person{role_id = MentorID, lv = MentorLv, quiz_list = MentorQuizList, tudi_list = TudiList, weight = Weight} = Person, Acc) ->
        #{mentor_lv := LvGap} = conf_mentor_lv_gap:get(Lv),
        %% 检查结拜关系
        IsSworn = lib_role_sworn:is_sworn(RoleID, MentorID),
        %% 检查夫妻关系
        IsMarry = lib_marriage:is_married(RoleID, MentorID),
        if
            MentorID =/= RoleID andalso MentorLv - Lv >= LvGap andalso not IsSworn andalso not IsMarry andalso length(TudiList) < TudiNum ->
                {_, CM1} = util:list_find(1, 1, MentorQuizList, {1, 1}),
                {_, CT1} = util:list_find(2, 1, QuizList, {2, 1}),
                Add1 = ?iif(CM1 =:= CT1 orelse CT1 =:= 3, ?WEIGHT_ADD, 0),
                FuncAdd = fun(Index, AccAdd) ->
                    {_, CM} = util:list_find(Index, 1, MentorQuizList, {Index, 1}),
                    {_, CT} = util:list_find(Index, 1, QuizList, {Index, 1}),
                    Add = case Index of
                        4 -> ?iif(CM =:= CT orelse CT =:= 3, ?WEIGHT_ADD, 0);
                        _ -> ?iif(CM =:= CT, ?WEIGHT_ADD, 0)
                    end,
                    AccAdd + Add
                end,
                WeightAdd = lists:foldl(FuncAdd, 0, lists:seq(3, 5)) + Add1,
                [Person#mentor_person{weight = Weight + WeightAdd} | Acc];
            true -> Acc
        end
    end,
    SrcList = lists:foldl(Func, [], PersonList),
    util:rand_by_weight(SrcList, #mentor_person.weight, Number).


%% 逻辑定时处理
logic_tick() ->
    CurTime = time:unixtime(),
    [
        begin
            ConfirmMap = get_confirm_map(Type),
            ConfirmList = maps:to_list(ConfirmMap),
            Func = fun({Key, #{expire_time := ExpireTime}}, MapAcc) ->
                if
                    CurTime >= ExpireTime -> maps:remove(Key, MapAcc);
                    true -> MapAcc
                end
            end,
            ConfirmMapN = lists:foldl(Func, ConfirmMap, ConfirmList),
            set_confirm_map(Type, ConfirmMapN)
        end || Type <- lists:seq(?CONFIRM_TYPE_BEGIN_MENTOR, ?CONFIRM_TYPE_FINISH_MENTOR)],
    ok.

%% @doc 初始化缓存
init_cache() ->
    MentorCache = get_cache(),
    #mentor_cache{mentor_persons = PersonList} = MentorCache,
    SQL = io_lib:format(?SQL_GET_MENTOR_PERSON_DATA, [?MENTOR_ACTIVE_PERSONS_NUM]),
    DbList = ?DB:get_all(SQL),
    PersonListN = init_person_data(DbList, PersonList),
    MentorCacheN = get_cache(),
    set_cache(MentorCacheN#mentor_cache{mentor_persons = PersonListN}).

%% @doc 持久化缓存
save_cache(Permanent) ->
    {_, {Hour, _, _}} = erlang:localtime(),
    MentorCache = get_cache(),
    #mentor_cache{updated = Updated, mentor_persons = MentorPersonList} = MentorCache,
    PersonListNew = case Updated of
        true when Permanent ->
            execute_save_person(MentorPersonList, length(MentorPersonList));
        true when Hour =:= 3 ->
            execute_save_person(MentorPersonList, length(MentorPersonList)),
            MentorPersonList;
        true when length(MentorPersonList) > ?MENTOR_ACTIVE_PERSONS_NUM ->
            execute_save_person(MentorPersonList, length(MentorPersonList) - ?MENTOR_ACTIVE_PERSONS_NUM);
        _ -> MentorPersonList
    end,
    set_cache(MentorCache#mentor_cache{updated = false, mentor_persons = PersonListNew}).

init_person_data([], ACC) ->
    ACC;
init_person_data([[RoleID, Name, Lv, Career, Icon, Frame, Morality, MentorLv, DBQuizList, DBTudiList, Reg, LastUpdateTime] | T], ACC) ->
    Data = #mentor_person{
        role_id = RoleID,
        name = Name,
        lv = Lv,
        career = Career,
        icon = Icon,
        frame = Frame,
        morality = Morality,
        mentor_lv = MentorLv,
        quiz_list = ?TOTERM(DBQuizList),
        tudi_list = ?TOTERM(DBTudiList),
        reg = Reg,
        last_update_time = LastUpdateTime
    },
    init_relation(Data#mentor_person.tudi_list, RoleID),
    Persons = lists:keystore(RoleID, #mentor_person.role_id, ACC, Data),
    init_person_data(T, Persons).

init_one_person(RoleID) ->
    SQL = io_lib:format(?SQL_GET_MENTOR_PERSON_DATA2, [RoleID]),
    case ?DB:get_row(SQL) of
        [Name, Lv, Career, Icon, Frame, Morality, MentorLv, DBQuizList, DBTudiList, Reg, LastUpdateTime] ->
            #mentor_person{
                role_id = RoleID,
                name = Name,
                lv = Lv,
                frame = Frame,
                career = Career,
                icon = Icon,
                morality = Morality,
                mentor_lv = MentorLv,
                quiz_list = ?TOTERM(DBQuizList),
                tudi_list = ?TOTERM(DBTudiList),
                reg = Reg,
                last_update_time = LastUpdateTime
            };
        [] ->
            undefined
    end.

%% 初始化师徒关系
init_relation(TudiList, MentorID) ->
    MentorCache = get_cache(),
    #mentor_cache{relation_map = RelationMap} = MentorCache,
    Func = fun(#mentor_tudi{role_id = TudiID}, AccMap) -> maps:put(TudiID, MentorID, AccMap) end,
    RelationMapN = lists:foldl(Func, maps:put(MentorID, MentorID, RelationMap), TudiList),
    set_cache(MentorCache#mentor_cache{relation_map = RelationMapN}).

%% 持久化师父数据
execute_save_person(PersonList, Number) ->
    {PersonListNew, StoreList} = get_store_list(PersonList, Number, []),
    db:insert_values(?SQL_SET_MENTOR_PERSON_DATA, ?SQL_SET_MENTOR_PERSON_DATA2, StoreList),
    PersonListNew.

get_store_list([], _Num, Acc) ->
    {[], Acc};
get_store_list(List, 0, Acc) ->
    {List, Acc};
get_store_list([Person | T], Num, Acc) ->
    #mentor_person{
        role_id = RoleID,
        name = Name,
        lv = Lv,
        career = Career,
        icon = Icon,
        frame = Frame,
        morality = Morality,
        mentor_lv = MentorLv,
        quiz_list = QuizList,
        tudi_list = TudiList,
        reg = Reg,
        last_update_time = LastUpdateTime
    } = Person,
    QuizListBin = ?TOBSTR(QuizList),
    TudiListBin = ?TOBSTR(TudiList),
    NewElem = [RoleID, Name, Lv, Career, Icon, Frame, Morality, MentorLv, QuizListBin, TudiListBin, Reg, LastUpdateTime],
    get_store_list(T, Num - 1, [NewElem | Acc]).


get_cache() ->
    case util:get_ets(?ETS_MENTOR, {?MODULE, mentor_cache}) of
        undefined -> #mentor_cache{};
        Cache -> Cache
    end.

set_cache(CacheData) ->
    util:put_ets(?ETS_MENTOR, {?MODULE, mentor_cache}, CacheData).

get_confirm_map(Type) ->
    ConfirmMap = get({?MODULE, confirm_map, Type}),
    case ConfirmMap of
        undefined -> #{};
        _ -> ConfirmMap
    end.

set_confirm_map(Type, ConfirmMap) ->
    put({?MODULE, confirm_map, Type}, ConfirmMap).
