%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     结拜系统
%%% @end
%%% Created : 15. 二月 2019 20:27
%%%-------------------------------------------------------------------
-module(lib_sworn).
-author("Tom").


-include("sworn.hrl").
-include("friend.hrl").
-include("common.hrl").
-include("proto/prot_ud.hrl").
-include("ret_code.hrl").
-include("ets_defines.hrl").


%% API
-export([
    is_sworn/2,
    get_group/1,
    get_person/1,
    create_group/1,
    delete_group/1,
    update_group/1,
    add_relation/2,
    update_person/1,
    delete_person/1,
    remove_relation/1,
    register_person/1,
    get_rand_persons/2,
    save_person_to_db/1,
    get_rand_reg_groups/2,
    
    
    logic_tick/0,
    init_cache/0,
    save_cache/1,
    confirm_start/3,
    get_confirm_data/2,
    clear_confirm_data/2,
    change_senior_start/2,
    get_change_senior_data/1,
    clear_change_senior_data/1
]).

%% @doc 增加结拜关系
add_relation(RoleID, GroupID) ->
    SwornCache = get_cache(),
    #sworn_cache{relation_map = RelationMap} = SwornCache,
    set_cache(SwornCache#sworn_cache{relation_map = maps:put(RoleID, GroupID, RelationMap)}).

%% @doc 移除结拜关系
remove_relation(RoleID) ->
    SwornCache = get_cache(),
    #sworn_cache{relation_map = RelationMap} = SwornCache,
    set_cache(SwornCache#sworn_cache{relation_map = maps:remove(RoleID, RelationMap)}).

%% @doc 判断与某人是否有结拜关系
is_sworn(RoleID, TargetRoleID) ->
    SwornCache = get_cache(),
    #sworn_cache{relation_map = RelationMap} = SwornCache,
    GroupID = maps:get(RoleID, RelationMap, 0),
    Group = get_group(GroupID),
    case Group of
        #sworn_group{group_id = GID} ->
            TargetGroupID = maps:get(TargetRoleID, RelationMap, 0),
            TargetGroupID =:= GID;
        undefined -> false
    end.

%% @doc 开始修改辈分投票
change_senior_start(GroupID, ChangeSeniorData) ->
    ChangeSeniorMap = get_change_senior_map(),
    ChangeSeniorMapN = maps:put(GroupID, ChangeSeniorData, ChangeSeniorMap),
    set_change_senior_map(ChangeSeniorMapN).

%% @doc 获取修改辈分投票情况
get_change_senior_data(GroupID) ->
    ChangeSeniorMap = get_change_senior_map(),
    maps:get(GroupID, ChangeSeniorMap, ?change_senior_data#{}).

%% @doc 清除修改辈分投票情况
clear_change_senior_data(GroupID) ->
    ChangeSeniorMap = get_change_senior_map(),
    ChangeSeniorMapN = maps:remove(GroupID, ChangeSeniorMap),
    set_change_senior_map(ChangeSeniorMapN).

%% @doc 发起确认
confirm_start(Type, TeamID, ConfirmData) ->
    ConfirmMap = get_confirm_map(Type),
    ConfirmMapN = maps:put(TeamID, ConfirmData, ConfirmMap),
    set_confirm_map(Type, ConfirmMapN).

%% @doc 获取确认
get_confirm_data(Type, TeamID) ->
    ConfirmMap = get_confirm_map(Type),
    maps:get(TeamID, ConfirmMap, ?team_confirm_data#{}).

%% @doc 清除确认缓存
clear_confirm_data(Type, TeamID) ->
    ConfirmMap = get_confirm_map(Type),
    ConfirmMapN = maps:remove(TeamID, ConfirmMap),
    set_confirm_map(Type, ConfirmMapN).

%% @doc 创建结拜组
create_group(Group) when is_record(Group, sworn_group) ->
    GroupId = svr_generator:gen_sworn_group_id(),
    GroupNew = Group#sworn_group{group_id = GroupId},
    SwornCache = get_cache(),
    #sworn_cache{sworn_groups = GroupList} = SwornCache,
    GroupListN = lists:keystore(GroupId, #sworn_group.group_id, GroupList, GroupNew),
    set_cache(SwornCache#sworn_cache{updated = true, sworn_groups = GroupListN}),
    GroupId;
create_group(_) ->
    undefined.

%% @doc 删除结拜组
delete_group(GroupId) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_groups = GroupList} = SwornCache,
    GroupListN = lists:keydelete(GroupId, #sworn_group.group_id, GroupList),
    set_cache(SwornCache#sworn_cache{updated = true, sworn_groups = GroupListN}),
    SQL = io_lib:format(?SQL_DELETE_SWORN_GROUP_BY_ID, [GroupId]),
    ?DB:execute(SQL).

%% @doc 根据id获取结拜组
get_group([]) ->
    [];
get_group(GroupIdList) when is_list(GroupIdList) ->
    [get_group(GroupId) || GroupId <- GroupIdList];
get_group(GroupId) when is_integer(GroupId) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_groups = GroupList} = SwornCache,
    case lists:keyfind(GroupId, #sworn_group.group_id, GroupList) of
        false ->
            Data = init_one_group(GroupId),
            case Data of
                undefined -> undefined;
                _ ->
                    GroupListN = lists:keystore(GroupId, #sworn_group.group_id, GroupList, Data),
                    set_cache(SwornCache#sworn_cache{updated = true, sworn_groups = GroupListN}),
                    init_relation(Data#sworn_group.members, GroupId),
                    Data#sworn_group{last_update_time = time:unixtime()}
            end;
        Data -> Data#sworn_group{last_update_time = time:unixtime()}
    end.

%% @doc 更新结拜组数据
update_group(Group) when is_record(Group, sworn_group) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_groups = GroupList} = SwornCache,
    GroupListN = lists:keystore(Group#sworn_group.group_id, #sworn_group.group_id, GroupList, Group),
    set_cache(SwornCache#sworn_cache{updated = true, sworn_groups = GroupListN});
update_group(_) ->
    skip.

%% @doc 获取随机平台登记个人列表
get_rand_persons(RoleID, Number) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_persons = PersonList} = SwornCache,
    PersonListN = lists:keydelete(RoleID, #sworn_person.role_id, PersonList),
    util:list_rand_n(PersonListN, Number).

%% @doc 获取随机平台登记结拜组列表
get_rand_reg_groups(RoleID, Number) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_groups = GroupList} = SwornCache,
    Func = fun(#sworn_group{members = MemList, registered = Reg}) ->
        Reg =:= ?PLATFORM_REGISTERED andalso not lists:keymember(RoleID, #sworn_member.role_id, MemList)
           end,
    GroupListReg = lists:filter(Func, GroupList),
    util:list_rand_n(GroupListReg, Number).

%% @doc 登录个人结拜平台
register_person(Person) when is_record(Person, sworn_person) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_persons = PersonList} = SwornCache,
    PersonListN = lists:keystore(Person#sworn_person.role_id, #sworn_person.role_id, PersonList, Person),
    set_cache(SwornCache#sworn_cache{updated = true, sworn_persons = PersonListN});
register_person(_) ->
    skip.

%% @doc 删除个人结拜平台信息
delete_person(RoleID) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_persons = PersonList} = SwornCache,
    PersonListN = lists:keydelete(RoleID, #sworn_person.role_id, PersonList),
    set_cache(SwornCache#sworn_cache{updated = true, sworn_persons = PersonListN}),
    SQL = io_lib:format(?SQL_DELETE_SWORN_PERSON_BY_ID, [RoleID]),
    ?DB:execute(SQL).

%% @doc 把个人平台数据持久化
save_person_to_db(RoleID) ->
    Person = get_person(RoleID),
    case Person of
        #sworn_person{} -> execute_save_person([Person], 1);
        undefined -> skip
    end.

%% @doc 获取个人结拜数据
get_person(RoleID) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_persons = PersonList} = SwornCache,
    case lists:keyfind(RoleID, #sworn_person.role_id, PersonList) of
        false ->
            Data = init_one_person(RoleID),
            case Data of
                undefined -> undefined;
                _ ->
                    PersonListN = lists:keystore(RoleID, #sworn_person.role_id, PersonList, Data),
                    set_cache(SwornCache#sworn_cache{updated = true, sworn_persons = PersonListN}),
                    Data#sworn_person{last_update_time = time:unixtime()}
            end;
        Data -> Data#sworn_person{last_update_time = time:unixtime()}
    end.

%% @doc 更新个人结拜数据
update_person(Person) when is_record(Person, sworn_person) ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_persons = PersonList} = SwornCache,
    PersonListN = lists:keystore(Person#sworn_person.role_id, #sworn_person.role_id, PersonList, Person),
    set_cache(SwornCache#sworn_cache{updated = true, sworn_persons = PersonListN});
update_person(_) ->
    skip.

%% 逻辑定时处理
logic_tick() ->
    CurTime = time:unixtime(),
    [begin
         ConfirmMap = get_confirm_map(Type),
         ConfirmList = maps:to_list(ConfirmMap),
         Func = fun({TeamID, #{expire_time := ExpireTime}}, MapAcc) ->
             if
                 CurTime >= ExpireTime -> maps:remove(TeamID, MapAcc);
                 true -> MapAcc
             end
                end,
         ConfirmMapN = lists:foldl(Func, ConfirmMap, ConfirmList),
         set_confirm_map(Type, ConfirmMapN)
     end || Type <- lists:seq(?CONFIRM_TYPE_CREATE_NEW, ?CONFIRM_TYPE_GATHER_MEMBERS)],
    
    ChangeSeniorMap = get_change_senior_map(),
    ChangeSeniorList = maps:to_list(ChangeSeniorMap),
    Func = fun({GroupID, #{expire_time := ExpireTime, members := Members}}, MapAcc) ->
        if
            CurTime >= ExpireTime ->
                router_540:send_tipscode(Members, ?RC_SWORN_CHANGE_SENIOR_TIMEOUT),
                maps:remove(GroupID, MapAcc);
            true -> MapAcc
        end
    end,
    ChangeSeniorMapN = lists:foldl(Func, ChangeSeniorMap, ChangeSeniorList),
    set_change_senior_map(ChangeSeniorMapN),
    ok.

%% @doc 初始化缓存
init_cache() ->
    SwornCache = get_cache(),
    #sworn_cache{sworn_groups = SwornGroups, sworn_persons = SwornPersons} = SwornCache,
    SQL = io_lib:format(?SQL_GET_SWORN_GROUP_DATA, [?SWORN_ACTIVE_GROUPS_NUM]),
    DbList = ?DB:get_all(SQL),
    SwornGroupsN = init_group_data(DbList, SwornGroups),
    SQL1 = io_lib:format(?SQL_GET_SWORN_PERSON_DATA, [?ACTIVE_PERSONS_NUM]),
    DbList1 = ?DB:get_all(SQL1),
    SwornPersonsN = init_person_data(DbList1, SwornPersons),
    SwornCacheN = get_cache(),
    set_cache(SwornCacheN#sworn_cache{sworn_groups = SwornGroupsN, sworn_persons = SwornPersonsN}).

init_group_data([], ACC) ->
    ACC;
init_group_data([[GroupID, Name, Quality, DBMembers, TendCareer, TendLv, TendTime, SwornValue, SwornWord, DBParams, Registered, LastUpdateTime] | T], ACC) ->
    Data = #sworn_group{
        group_id = GroupID,
        name = Name,
        quality = Quality,
        members = ?TOTERM(DBMembers),
        tend_career = TendCareer,
        tend_lv = TendLv,
        tend_time = TendTime,
        sworn_value = SwornValue,
        enounce = SwornWord,
        params = type:convert_db_field(map, DBParams, ?sworn_params),
        registered = Registered,
        last_update_time = LastUpdateTime
    },
    init_relation(Data#sworn_group.members, GroupID),
    Groups = lists:keystore(GroupID, #sworn_group.group_id, ACC, Data),
    init_group_data(T, Groups).

init_person_data([], ACC) ->
    ACC;
init_person_data([[RoleID, Name, Lv, Icon, Frame, Career, TitleHonor, GuildName, TendCareer, TendLv, TendTime, LastUpdateTime] | T], ACC) ->
    Data = #sworn_person{
        role_id = RoleID,
        name = Name,
        lv = Lv,
        icon = Icon,
        frame = Frame,
        career = Career,
        title_honor = TitleHonor,
        guild_name = GuildName,
        tend_career = TendCareer,
        tend_lv = TendLv,
        tend_time = TendTime,
        last_update_time = LastUpdateTime
    },
    Persons = lists:keystore(RoleID, #sworn_person.role_id, ACC, Data),
    init_person_data(T, Persons).

init_one_group(GroupID) ->
    SQL = io_lib:format(?SQL_GET_SWORN_GROUP_DATA2, [GroupID]),
    case ?DB:get_row(SQL) of
        [Name, Quality, DBMembers, TendCareer, TendLv, TendTime, SwornValue, SwornWord, DBParams, Registered, LastUpdateTime] ->
            #sworn_group{
                group_id = GroupID,
                name = Name,
                quality = Quality,
                members = ?TOTERM(DBMembers),
                tend_career = TendCareer,
                tend_lv = TendLv,
                tend_time = TendTime,
                sworn_value = SwornValue,
                enounce = SwornWord,
                params = type:convert_db_field(map, DBParams, ?sworn_params),
                registered = Registered,
                last_update_time = LastUpdateTime
            };
        [] -> undefined
    end.

init_one_person(RoleID) ->
    SQL = io_lib:format(?SQL_GET_SWORN_PERSON_DATA2, [RoleID]),
    case ?DB:get_row(SQL) of
        [Name, Lv, Icon, Frame, Career, TitleHonor, GuildName, TendCareer, TendLv, TendTime, LastUpdateTime] ->
            #sworn_person{
                role_id = RoleID,
                name = Name,
                lv = Lv,
                icon = Icon,
                frame = Frame,
                career = Career,
                title_honor = TitleHonor,
                guild_name = GuildName,
                tend_career = TendCareer,
                tend_lv = TendLv,
                tend_time = TendTime,
                last_update_time = LastUpdateTime
            };
        [] ->
            undefined
    end.

%% @doc 持久化缓存
save_cache(Permanent) ->
    {_, {Hour, _, _}} = erlang:localtime(),
    SwornCache = get_cache(),
    #sworn_cache{updated = Updated, sworn_groups = GroupList, sworn_persons = PersonList} = SwornCache,
    GroupListNew = case Updated of
                       true when Permanent ->
                           execute_save_group(GroupList, length(GroupList));
                       true when Hour =:= 3 ->
                           execute_save_group(GroupList, length(GroupList)),
                           GroupList;
                       true when length(GroupList) > ?SWORN_ACTIVE_GROUPS_NUM ->
                           execute_save_group(GroupList, length(GroupList) - ?SWORN_ACTIVE_GROUPS_NUM);
                       _ -> GroupList
                   end,
    PersonListNew = case Updated of
                        true when Permanent ->
                            execute_save_person(PersonList, length(PersonList));
                        true when length(PersonList) > ?ACTIVE_PERSONS_NUM ->
                            execute_save_person(PersonList, length(PersonList) - ?ACTIVE_PERSONS_NUM);
                        _ -> PersonList
                    end,
    set_cache(SwornCache#sworn_cache{updated = false, sworn_groups = GroupListNew, sworn_persons = PersonListNew}).

%% 初始化结拜关系
init_relation(MemList, GroupID) ->
    SwornCache = get_cache(),
    #sworn_cache{relation_map = RelationMap} = SwornCache,
    Func = fun(#sworn_member{role_id = MemID}, AccMap) ->
        maps:put(MemID, GroupID, AccMap)
    end,
    RelationMapN = lists:foldl(Func, RelationMap, MemList),
    set_cache(SwornCache#sworn_cache{relation_map = RelationMapN}).

%% 持久化结拜组
execute_save_group(GroupList, Number) ->
    {GroupListNew, StoreList} = get_store_list2(GroupList, Number, []),
    db:insert_values(?SQL_SET_SWORN_GROUP_DATA, ?SQL_SET_SWORN_GROUP_DATA2, StoreList),
    GroupListNew.

%% 持久化结拜个人
execute_save_person(PersonList, Number) ->
    {PersonListNew, StoreList} = get_store_list(PersonList, Number, []),
    db:insert_values(?SQL_SET_SWORN_PERSON_DATA, ?SQL_SET_SWORN_PERSON_DATA2, StoreList),
    PersonListNew.

get_store_list([], _Num, Acc) ->
    {[], Acc};
get_store_list(List, 0, Acc) ->
    {List, Acc};
get_store_list([Person | T], Num, Acc) ->
    #sworn_person{
        role_id = RoleID,
        name = Name,
        lv = Lv,
        icon = Icon,
        frame = Frame,
        career = Career,
        title_honor = TitleHonor,
        guild_name = GuildName,
        tend_career = TendCareer,
        tend_lv = TendLv,
        tend_time = TendTime,
        last_update_time = LastUpdateTime
    } = Person,
    get_store_list(T, Num - 1,
        [[RoleID, Name, Lv, Icon, Frame, Career, TitleHonor, GuildName, TendCareer, TendLv, TendTime, LastUpdateTime] | Acc]).

get_store_list2([], _Num, Acc) ->
    {[], Acc};
get_store_list2(List, 0, Acc) ->
    {List, Acc};
get_store_list2([Group | T], Num, Acc) ->
    #sworn_group{
        group_id = GroupID,
        name = Name,
        quality = Quality,
        members = Members,
        tend_career = TendCareer,
        tend_lv = TendLv,
        tend_time = TendTime,
        sworn_value = SwornValue,
        enounce = SwornWord,
        params = Params,
        registered = Registered,
        last_update_time = LastUpdateTime
    } = Group,
    get_store_list2(T, Num - 1,
        [[GroupID, Name, Quality, ?TOBSTR(Members), TendCareer, TendLv, TendTime, SwornValue, SwornWord, ?TOBSTR(Params), Registered, LastUpdateTime] | Acc]).

get_cache() ->
    case util:get_ets(?ETS_SWORN, {?MODULE, sworn_cache}) of
        undefined ->
            #sworn_cache{};
        Cache -> Cache
    end.

set_cache(CacheData) ->
    util:put_ets(?ETS_SWORN, {?MODULE, sworn_cache}, CacheData).

get_confirm_map(Type) ->
    ConfirmMap = get({confirm_map, Type}),
    case ConfirmMap of
        undefined -> #{};
        _ -> ConfirmMap
    end.

set_confirm_map(Type, ConfirmMap) ->
    put({confirm_map, Type}, ConfirmMap).

get_change_senior_map() ->
    ChangeSeniorMap = get(change_senior_map),
    case ChangeSeniorMap of
        undefined -> #{};
        _ -> ChangeSeniorMap
    end.

set_change_senior_map(ChangeSeniorMap) ->
    put(change_senior_map, ChangeSeniorMap).

%%test_add() ->
%%    Group = #sworn_group{
%%        name = unicode:characters_to_binary("劳动节快乐的"),
%%        quality = 1,
%%        members = [],
%%        tend_career = 1,
%%        tend_lv = 1,
%%        tend_time = 1,
%%        sworn_value = 100,
%%        enounce = "xxxxxxxx"
%%    },
%%    Person = #sworn_person{
%%        role_id = 94276356165632,
%%        name = unicode:characters_to_binary("咯ode"),
%%        lv = 11,
%%        icon = 1,
%%        career = 1,
%%        title_honor = 1,
%%        guild_name = unicode:characters_to_binary("快递可怜的"),
%%        tend_career = 1,
%%        tend_lv = 1,
%%        tend_time = 1
%%    },
%%    GroupId = create_group(Group),
%%    io:format("GroupId=~w~n", [GroupId]),
%%
%%    register_person(Person).
%%
%%test_del(GroupID, RoleID) ->
%%    delete_group(GroupID),
%%    delete_person(RoleID).
