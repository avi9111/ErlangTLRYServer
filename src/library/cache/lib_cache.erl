%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     缓存
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_cache).
-author("Ryuu").

-include("pet.hrl").
-include("role.hrl").
-include("equip.hrl").
-include("cache.hrl").
-include("common.hrl").
-include("channel.hrl").
-include("keyvalue.hrl").
-include("proto/prot_ud.hrl").

%% API
-export([
    lookup/2,
    lookup2/2,
    raw_lookup/2,
    raw_lookup2/2,
    get_role_sex/1,
    get_pet_view/1,
    get_role_base/1,
    get_role_name/1,
    get_role_view/1,
    get_forge_view/1,
    get_role_fight/1,
    get_role_level/1,
    get_role_career/1,
    get_channel_view/1,
    get_role_guild/1,
    role_base_field/3
]).

%% 说明:
%% raw   读取不到不加载
%% dirty 是直接从ets中读取
%%
%% 返回:
%% {ok, Val} | undefined

%% =============================================================================
%% API
%% =============================================================================
%% @doc 玩家基础信息 [10]
get_role_base(RoleID) ->
    case lookup(?CACHE_TYPE_BASE_INFO, RoleID) of
        {ok, RoleBase} -> RoleBase;
        _ -> undefined
    end.

%% @doc 获取玩家名
get_role_name(RoleID) ->
    role_base_field(RoleID, name, "").

%% @doc 获取玩家性别
get_role_sex(RoleID) ->
    role_base_field(RoleID, gender, 1).

%% @doc 获取玩家职业
get_role_career(RoleID) ->
    role_base_field(RoleID, career, 1).

%% @doc 获取玩家等级
get_role_level(RoleID) ->
    role_base_field(RoleID, level, 0).

get_role_fight(RoleID) ->
    role_base_field(RoleID, fight, 1).

%% @doc 获取玩家帮派ID
get_role_guild(RoleID) ->
    role_base_field(RoleID, guild, 0).

role_base_field(RoleID, Field, Default) ->
    case get_role_base(RoleID) of
        RoleBase when is_map(RoleBase) ->
            maps:get(Field, RoleBase, Default);
        _ ->
            Default
    end.

%% @doc 玩家查看信息
get_role_view(RoleID) ->
    case lookup(?CACHE_TYPE_VIEW_INFO, RoleID) of
        {ok, ViewInfo} ->
            ViewInfo;
        _ ->
            undefined
    end.

%% @doc 珍兽查看信息
get_pet_view(RoleID) ->
    case lookup(?CACHE_TYPE_PET_VIEW, RoleID) of
        {ok, ViewInfo} ->
            ViewInfo;
        _ ->
            undefined
    end.

%% @doc 经脉查看信息
get_channel_view(RoleID) ->
    case lookup(?CACHE_TYPE_CHANNEL_VIEW, RoleID) of
        {ok, ViewInfo} ->
            ViewInfo;
        _ ->
            undefined
    end.

%% @doc 熔炼查看信息
get_forge_view(RoleID) ->
    case lookup(?CACHE_TYPE_FORGE_VIEW, RoleID) of
        {ok, ViewInfo} ->
            ViewInfo;
        _ ->
            undefined
    end.


lookup(Type, ID) ->
    case raw_lookup(Type, ID) of
        {ok, Val} ->
            {ok, Val};
        undefined ->
            load_update(Type, ID)
    end.

raw_lookup(Type, ID) ->
    Key = {Type, ID},
    case ets:lookup(?ETS_CACHE, Key) of
        [#cache_item{val = V}] ->
            {ok, V};
        _ ->
            undefined
    end.

%% @doc 玩家查看信息 [0]
lookup2(Type, ID) ->
    case raw_lookup2(Type, ID) of
        {ok, Val} ->
            {ok, Val};
        _ ->
            load_update(Type, ID)
    end.

raw_lookup2(Type, ID) ->
    svr_cache:lookup(Type, ID).

%% =============================================================================
%% 内部
%% =============================================================================

%% @doc 加载
load_update(Type, ID) ->
    case load_data(Type, ID) of
        {Val, Time} ->
            svr_cache:insert(Type, ID, Val, Time),
            {ok, Val};
        _ ->
            undefined
    end.

%% @doc 加载数据
load_data(?CACHE_TYPE_BASE_INFO, ID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_BASE, [ID]),
    case ?DB:get_row(SQL) of
        [AccName, RoleName, RoleLv, Career, Gender, Fight, DbPersonal, LastOffline] ->
            Offline = ?iif(lib_role:is_online(ID), 0, LastOffline),
            Personal = maps:merge(?role_personal, type:convert_db_field(map, DbPersonal, #{})),
            RoleBase = ?role_base#{
                id => ID, accname => AccName, name => RoleName, level => RoleLv,
                offline => Offline, career => Career, gender => Gender, fight => Fight,
                personal => Personal
            },
            {RoleBase, ?CACHE_TIME_ROLE_BASE};
        _ ->
            undefined
    end;
load_data(?CACHE_TYPE_VIEW_INFO, ID) ->
    SQL = io_lib:format(?SQL_GET_VIEW_INFO, [ID]),
    case ?DB:get_row(SQL) of
        [DbViewInfo] ->
            DefaultView = lib_role_view:default_role_view(),
            ViewInfo = type:convert_db_field(map, DbViewInfo, DefaultView),

            SQL1 = io_lib:format(?SQL_GET_ROLE_EQUIP, [ID]),
            List = db:get_all(SQL1),
            Equips = lib_role_equip:init_equip(List, [], sets:from_list(?EQUIP_POS_ROLE)),
            EquipList = lib_role_equip:convert_equips_info(Equips),

            SQL2 = io_lib:format(?SQL_GET_ANQI_DATA, [ID]),
            RoleAnqi = case ?DB:get_row(SQL2) of
                [Id, QLevel, Stren, DBStones, PracticeLv, DBPoisonSlots] ->
                    #role_anqi{
                        id = Id,
                        q_level = QLevel,
                        stren = Stren,
                        stones = type:bitstring_to_term(DBStones),
                        practice_lv = PracticeLv,
                        poison_slots = type:bitstring_to_term(DBPoisonSlots)
                    };
                [] ->
                    #role_anqi{}
            end,
            RoleAnqiN = lib_role_anqi:set_anqi_attr(RoleAnqi),
            Anqi = lib_role_anqi:convert_anqi_info(RoleAnqiN),

            SQL3 = io_lib:format(?SQL_GET_ARTIFACT_DATA, [ID]),
            RoleArtifact = case ?DB:get_row(SQL3) of
                [Id1, CurAvatar1, DBAvatars1, Stren1, DBStones1, DBOldAttr1, DBCurAttr1] ->
                    #role_artifact{
                        id = Id1,
                        cur_avatar = CurAvatar1,
                        avatars = type:bitstring_to_term(DBAvatars1),
                        stren = Stren1,
                        stones = type:bitstring_to_term(DBStones1),
                        old_attr = type:bitstring_to_term(DBOldAttr1),
                        cur_attr = type:bitstring_to_term(DBCurAttr1)
                    };
                [] ->
                    #role_artifact{}
            end,
            RoleArtifactN = lib_role_artifact:set_artifact_attr(RoleArtifact),
            Artifact = lib_role_artifact:convert_artifact_info(RoleArtifactN),

            Dragon = lib_role_dragon:load_view_info(ID),
            Marriage = lib_role_marriage:load_view_info(ID),

            RoleWarriorSoul = lib_role_warrior_soul:init_role_db_data(ID),
            RoleWarriorSoulN = lib_role_warrior_soul:set_warrior_soul_attr(RoleWarriorSoul),
            WarriorSoul = lib_role_warrior_soul:convert_soul_info(RoleWarriorSoulN),
            NewViewInfo = maps:merge(DefaultView, ViewInfo#{
                equips => EquipList, anqi => Anqi, artifact => Artifact,
                dragon => Dragon, warrior_soul => WarriorSoul, marriage => Marriage
            }),
            {NewViewInfo, ?CACHE_TIME_DEFAULT};
        _ ->
            undefined
    end;
load_data(?CACHE_TYPE_PET_VIEW, ID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_PETS, [ID]),
    RawPets = db:get_all(SQL),
    {PetBag, _, _, _} = lib_role_pet:init_pets(RawPets),
    BagList = maps:to_list(PetBag),
    CltPetList = data_transfer:sc_clt_pets(BagList),

    SQL1 = io_lib:format(?SQL_GET_ROLE_PET_ATTACHS, [ID]),
    RawAttachs = db:get_all(SQL1),
    AttachList = lib_role_pet_attach:init_attachs(RawAttachs),
    CltAttachList = data_transfer:sc_clt_attachs(AttachList),

    PetViewInfo = lib_role_view:default_pet_view(),
    {PetViewInfo#{pet_list => CltPetList, attach_list => CltAttachList}, ?CACHE_TIME_DEFAULT};
load_data(?CACHE_TYPE_CHANNEL_VIEW, ID) ->
    Career = get_role_career(ID),
    SQL = io_lib:format(?SQL_GET_ROLE_CHANNEL, [ID]),
    List = db:get_all(SQL),
    Channels = lib_role_channel:init_channels(List, Career, dict:new()),
    Heroes = lib_role_hero:load_hero(ID),
    Func = fun(_ID, #{hero := HeroId} = Channel) ->
        Hero = util:dict_find(HeroId, Heroes, #{id => HeroId, level => 0}),
        #{level := Lv} = Hero,
        Channel#{lv => Lv}
    end,
    ChannelsN = dict:map(Func, Channels),
    CltChannelList = lib_role_channel:convert_channels(ChannelsN),
    ChannelViewInfo = lib_role_view:default_channels_view(),
    {ChannelViewInfo#{channels => CltChannelList}, ?CACHE_TIME_DEFAULT};
load_data(?CACHE_TYPE_FORGE_VIEW, ID) ->
    KvData = lib_role_data:data_load(ID),
    SmeltData = case dict:find(?KEY_SMELT, KvData) of
        error -> #{
            role_id => ID,
            level => 0,
            exp => 0,
            soul => []
        };
        {ok, Value} -> Value
    end,
    #{level := Level, exp := Exp, soul := Soul} = SmeltData,
    Forge = #clt_forge_soul{level = Level, exp = Exp, soul = Soul},
    ForgeViewInfo = lib_role_view:default_forge_view(),
    {ForgeViewInfo#{forge => Forge}, ?CACHE_TIME_DEFAULT};
load_data(_, _) ->
    undefined.
