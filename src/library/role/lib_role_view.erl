%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     玩家查看
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_view).
-author("Ryuu").

-include("pet.hrl").
-include("role.hrl").
-include("view.hrl").
-include("guild.hrl").
-include("cache.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_404.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    role_login/1,
    role_logout/1,
    handle_info/2,
    default_role_view/0,
    default_pet_view/0,
    default_channels_view/0,
    default_forge_view/0,
    get_cross_view_d/7,
    get_cross_view_o/4,
    get_cross_view_t/4,
    get_sync_view_info/2
]).

%% @doc 处理消息 [玩家进程]
handle_info({view_info_request, FromID}, PS) ->
    send_view_info(PS, FromID);
handle_info({customize_request, Fun}, PS) ->
    handle_customize_request(PS, Fun);
handle_info({cross_view_request, Type, RoleID, SvrNum}, PS) ->
    send_cross_view_info(PS, Type, RoleID, SvrNum);
handle_info(_Info, _PS) ->
    ok.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_offline_view(PS);
event(PS, {'upgrade_skill', _Times}) ->
    update_role_view_skill(PS);
event(PS, 'add_skills') ->
    update_role_view_skill(PS);
event(PS, 'cur_pet_update') ->
    update_role_view_pet(PS);
event(PS, 'bt_attr_update') ->
    update_role_view_attr(PS);
event(_PS, _Event) ->
    ignore.

get_sync_view_info(PS, _FromID) ->
    Info = convert_view_info(PS),
    {PetList, AttachList} = convert_pet_view(PS),
    Channels = convert_channels_view(PS),
    Forge = convert_forge_view(PS),
    {ok, {ok, Info, PetList, AttachList, Channels, Forge}}.

do(40401, PS, #cs_view_get_role_info{type = Type, server_num = TSvrNum, id = TRoleID}) ->
    get_view_info(PS, Type, TRoleID, TSvrNum);
do(40403, PS, #cs_view_get_role_common_info{role_id = TargetRoleID}) ->
    get_common_info(PS, TargetRoleID);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 处理自定义请求
handle_customize_request(PS, Fun) ->
    ViewInfo = convert_view_info(PS),
    {PetList, AttachList} = convert_pet_view(PS),
    Channels = convert_channels_view(PS),
    Forge = convert_forge_view(PS),
    Fun(ViewInfo, PetList, AttachList, Channels, Forge).

%% @doc 查看玩家信息
get_view_info(PS, Type, TargetID, TSvrNum) ->
    #role_state{server_num = SvrNum} = PS,
    Cross = util_svr:is_cross(SvrNum, TSvrNum),
    case Cross of
        false ->
            get_local_view(PS, Type, TargetID);
        _ ->
            get_cross_view_s(PS, Type, TargetID, TSvrNum)
    end.

%% @doc 查看玩家信息 [本服]
get_local_view(PS, Type, TargetID) ->
    #role_state{id = RoleID} = PS,
    CustomizeFun = fun(Info, PetList, AttachList, Channels, Forge) ->
        send_role_view_info(RoleID, Type, Info, PetList, AttachList, Channels, Forge)
    end,
    case get_role_view_info(PS, TargetID, CustomizeFun) of
        {ok, Info, PetList, AttachList, Channels, Forge} ->
            CustomizeFun(Info, PetList, AttachList, Channels, Forge);
        {error, Code} ->
            ?ERROR_TOC(PS, Code);
        _ ->
            async
    end.

%% 查看玩家通用信息
get_common_info(PS, TargetRoleID) ->
    #{name := Name, team_id := TeamID, guild := GuildID, scene := Scene} = lib_cache:get_role_base(TargetRoleID),
    TeamInfo = svr_team_mgr:get_team_info(TeamID),
    TeamNum = case TeamInfo of
        undefined -> 0;
        _ ->
            #{members := Members} = TeamInfo,
            length(Members)
    end,
    GuildInfo = lib_guild:get_guild_info(GuildID),
    GuildName = case GuildInfo of
        undefined -> "";
        _ ->
            #guild{name = G_name} = GuildInfo,
            G_name
    end,
    MsgRecord = #sc_view_get_role_common_info{
        role_id = TargetRoleID,
        role_name = Name,
        team_id = TeamID,
        team_num = TeamNum,
        guild = GuildID,
        guild_name = GuildName,
        scene = Scene
    },
    {ok, Bin} = prot_msg:encode_msg(40404, MsgRecord),
    lib_role_send:send_to_sid(PS#role_state.sid, Bin),
    ok.

send_role_view_info(RoleID, Type, Info, PetList, AttachList, Channels, Forge) ->
    #clt_role_view{id = TargetRoleID} = Info,
    R_Stat = lib_friend:get_relation_stat(RoleID, TargetRoleID),
    Rec = #sc_view_get_role_info{
        type = Type, info = Info#clt_role_view{stat = R_Stat}, pet_list = PetList,
        attach_list = AttachList, channels = Channels, forge = Forge
    },
    {ok, Bin} = prot_msg:encode_msg(40402, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc 跨服查看 [发起]
get_cross_view_s(PS, Type, TargetID, TSvrNum) ->
    #role_state{id = RoleID, server_num = SvrNum} = PS,
    svr_kf_client:route_server(TSvrNum, ?MODULE, get_cross_view_t, [Type, TargetID, RoleID, SvrNum]).

%% @doc 跨服查看 [目标]
get_cross_view_t(Type, TargetID, RoleID, SvrNum) ->
    case lib_role:is_online(TargetID) of
        false ->
            get_cross_view_o(Type, TargetID, RoleID, SvrNum);
        _ ->
            lib_role:mod_info(TargetID, ?MODULE, {cross_view_request, Type, RoleID, SvrNum})
    end.

get_cross_view_o(Type, TargetID, RoleID, SvrNum) ->
    case get_role_view_offline(TargetID) of
        {ok, Info, PetList, AttachList, Channels, Forge} ->
            svr_kf_client:route_server(SvrNum, ?MODULE, get_cross_view_d, [RoleID, Type, Info, PetList, AttachList, Channels, Forge]);
        _ ->
            ignore
    end.

send_cross_view_info(PS, Type, RoleID, SvrNum) ->
    Info = convert_view_info(PS),
    {PetList, AttachList} = convert_pet_view(PS),
    Channels = convert_channels_view(PS),
    Forge = convert_forge_view(PS),
    svr_kf_client:route_server(SvrNum, ?MODULE, get_cross_view_d, [RoleID, Type, Info, PetList, AttachList, Channels, Forge]).

%% @doc 跨服查看 [终点]
get_cross_view_d(RoleID, Type, Info, PetList, AttachList, Channels, Forge) ->
    send_role_view_info(RoleID, Type, Info, PetList, AttachList, Channels, Forge).

%% @doc 获取玩家查看信息
%%get_role_view_info(PS, TargetID) ->
%%    get_role_view_info(PS, TargetID, async).

get_role_view_info(PS, TargetID, _Type) when PS#role_state.id =:= TargetID ->
    {PetList, AttachList} = convert_pet_view(PS),
    {ok, convert_view_info(PS), PetList, AttachList, convert_channels_view(PS), convert_forge_view(PS)};
get_role_view_info(PS, TargetID, Type) ->
    #role_state{id = RoleID} = PS,
    case {lib_role:is_online(TargetID), Type} of
        {true, Fun} when is_function(Fun) ->
            get_role_view_customize(TargetID, Fun);
        {true, async} ->
            get_role_view_online_async(RoleID, TargetID);
        {true, sync} ->
            get_role_view_online_sync(TargetID, RoleID);
        _ ->
            get_role_view_offline(TargetID)
    end.

%% @doc 查看在线玩家信息 [异步]
get_role_view_online_async(RoleID, TargetID) ->
    lib_role:mod_info(TargetID, ?MODULE, {view_info_request, RoleID}).

get_role_view_customize(TargetID, Fun) ->
    lib_role:mod_info(TargetID, ?MODULE, {customize_request, Fun}).

%% @doc 查看在线玩家信息 [同步]
get_role_view_online_sync(RoleID, FromID) ->
    lib_role:apply_call2(RoleID, {lib_role_view, get_sync_view_info, FromID}).

%% @doc 离线查看玩家信息
get_role_view_offline(TargetID) ->
    case lib_cache:get_role_view(TargetID) of
        ViewInfo when is_map(ViewInfo) -> %% 通过缓存服务记载
            PetView = lib_cache:get_pet_view(TargetID),
            {PetList, AttachList} = convert_pet_view(PetView),
            ChannelView = lib_cache:get_channel_view(TargetID),
            Channels = convert_channels_view(ChannelView),
            ForgeView = lib_cache:get_forge_view(TargetID),
            Forge = convert_forge_view(ForgeView),
            {ok, convert_view_info(ViewInfo), PetList, AttachList, Channels, Forge};
        _ ->
            {error, ?RC_VIEW_CANNOT_GET_ROLE_VIEW}
    end.

%% @doc 发送玩家信息
send_view_info(PS, ToRoleID) ->
    R_Stat = lib_friend:get_relation_stat(ToRoleID, PS#role_state.id),
    Info = convert_view_info(PS),
    {PetList, AttachList} = convert_pet_view(PS),
    Channels = convert_channels_view(PS),
    Forge = convert_forge_view(PS),
    Rec = #sc_view_get_role_info{
        info = Info#clt_role_view{stat = R_Stat}, pet_list = PetList,
        attach_list = AttachList, channels = Channels, forge = Forge
    },
    {ok, Bin} = prot_msg:encode_msg(40402, Rec),
    lib_role_send:send_to_role(ToRoleID, Bin).

%% @doc 转换数据
convert_view_info(PS) when is_record(PS, role_state) ->
    Map = get_role_view_map(PS),
    convert_view_info(Map);
convert_view_info(Map) when is_map(Map) ->
    #{
        id := RoleID, name := Name, server_id := ServerID, marriage := Marriage,
        team_id := TeamId, team_num := TeamNum, career := Career, gender := Sex,
        level := Level, icon := Icon, hair := Hair, introduction:= Intro,
        equips := EquipList, fashion := Fashion, title_honor := TitleHonor,
        title := Title, guild_name := GuildName, anqi := Anqi, artifact := Artifact,
        bubble := Bubble, frame := Frame, warrior_soul := WarriorSoul,
        dragon := Dragon, marriage := Marriage
    } = Map,
    ServerNum = config:get_server_num(),
    %% 上线后增加的字段使用maps:get/3获取
    RoleBase = lib_cache:get_role_base(RoleID),
    #{scene := SceneID, offline := Offline} = RoleBase,
    #clt_role_view{
        id = RoleID, name = Name, server_num = ServerNum, server_id = ServerID,
        career = Career, gender = Sex, level = Level, icon = Icon, hair = Hair,
        fashion = Fashion, title_honor = TitleHonor, title = Title,
        guild_name = GuildName, marriage = Marriage, team_id = TeamId,
        team_num = TeamNum, introduction = Intro, equips = EquipList,
        anqi = Anqi, artifact = Artifact, bubble = Bubble, frame = Frame,
        warrior_soul = WarriorSoul, dragon = Dragon, scene_id = SceneID,
        offline = Offline
    };
convert_view_info(_) ->
    #clt_role_view{}.

convert_pet_view(PS) when is_record(PS, role_state) ->
    Map = get_pet_view_map(PS),
    convert_pet_view(Map);
convert_pet_view(Map) when is_map(Map) ->
    #{pet_list := PetList, attach_list := AttachList} = Map,
    {PetList, AttachList};
convert_pet_view(_) ->
    {[], []}.

convert_channels_view(PS) when is_record(PS, role_state) ->
    Map = get_channels_view_map(PS),
    convert_channels_view(Map);
convert_channels_view(Map) when is_map(Map) ->
    #{channels := CltChannelList} = Map,
    CltChannelList;
convert_channels_view(_) ->
    [].

convert_forge_view(PS) when is_record(PS, role_state) ->
    Map = get_forge_view_map(PS),
    convert_forge_view(Map);
convert_forge_view(Map) when is_map(Map) ->
    #{forge := Forge} = Map,
    Forge;
convert_forge_view(_) ->
    #clt_forge_soul{}.

%% 根据role_state获取基本个人信息缓存
get_role_view_map(PS) ->
    #role_state{
        id = RoleID, name = Name, server_id = ServerID, team_id = TeamId,
        career = Career, gender = Sex, level = Level, combat_power = Fight,
        guild_id = GuildId, guild_name = GuildName, skill_list = SkillList,
        personal = Personal, bt_attr = BtAttr
    } = PS,
    CurPet = lib_role_pet:get_current_pet(),
    Pets = ?iif(CurPet =:= undefined, [], [CurPet]),
    VipLv = lib_role_vip:get_vip_lv(),
    ServerNum = config:get_server_num(),
    TeamInfo = svr_team_mgr:get_team_info(TeamId),
    TeamNum = case TeamInfo of
        undefined -> 0;
        _ ->
            #{members := Members} = TeamInfo,
            length(Members)
    end,
    Intro = lib_role_kv:get_kv(RoleID, ?KEY_INTRODUCTION, ""),
    RoleEquip = lib_role_equip:get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    EquipList = lib_role_equip:convert_equips_info(Equips),
    Anqi = lib_role_anqi:get_anqi_view_info(RoleID),
    Artifact = lib_role_artifact:get_artifact_view_info(RoleID),
    Dragon = lib_role_dragon:view_info(RoleID),
    WarriorSoul = lib_role_warrior_soul:get_soul_view_info(RoleID),
    Marriage = lib_role_marriage:view_info(RoleID),
    #{icon := Icon, hair := Hair, title := Title, fashion := Fashion,
        title_honor := TitleHonor, bubble := Bubble, frame := Frame} = Personal,
    ?role_view#{
        id => RoleID, name => Name, server_num => ServerNum, server_id => ServerID,
        guild_id => GuildId, career => Career, gender => Sex, level => Level,
        vip_lv => VipLv, marriage => Marriage, team_id => TeamId, fight => Fight,
        fashion => Fashion, title => Title, hair => Hair, team_num => TeamNum,
        guild_name => GuildName, icon => Icon, title_honor => TitleHonor,
        introduction => Intro, bubble => Bubble, frame => Frame, equips => EquipList,
        anqi => Anqi, artifact => Artifact, attr => BtAttr, pets => Pets,
        skills => SkillList, dragon => Dragon, warrior_soul => WarriorSoul
    }.

%% 根据role_state获取珍兽缓存
get_pet_view_map(_PS) ->
    PetBag = lib_role_pet:get_pet_bag(),
    BagList = maps:to_list(PetBag),
    CltPetList = data_transfer:sc_clt_pets(BagList),
    PetAttach = lib_role_pet_attach:get_attach(),
    CltAttachList = data_transfer:sc_clt_attachs(PetAttach#pet_attach.attach_list),
    ?pet_view#{
        pet_list => CltPetList, attach_list => CltAttachList
    }.

%% 根据role_state获取经脉缓存
get_channels_view_map(PS) ->
    RoleData = lib_role_channel:get_role_data(PS#role_state.id),
    #{channels := Channels} = RoleData,
    Func = fun(_ID, #{hero := HeroId} = Channel) ->
        Hero = lib_role_hero:get_hero(PS#role_state.id, HeroId),
        Lv = case Hero of
            undefined -> 0;
            #{level := Level} -> Level
        end,
        Channel#{lv => Lv}
    end,
    ChannelsN = dict:map(Func, Channels),
    CltChannelList = lib_role_channel:convert_channels(ChannelsN),
    ?channel_view#{
        channels => CltChannelList
    }.

%% 根据role_state获取熔炼缓存
get_forge_view_map(PS) ->
    RoleData = lib_role_smelt:get_role_data(PS#role_state.id),
    #{level := Level, exp := Exp, soul := Soul} = RoleData,
    Forge = #clt_forge_soul{level = Level, exp = Exp, soul = Soul},
    ?forge_view#{
        forge => Forge
    }.

%% 实时更新技能情况
update_role_view_skill(PS) ->
    #role_state{id = RoleID, skill_list = SkillList} = PS,
    RoleViewMap = case lib_cache:get_role_view(RoleID) of
        undefined -> get_role_view_map(PS);
        ViewInfo -> ViewInfo
    end,
    RoleViewMapN = RoleViewMap#{skills => SkillList},
    svr_cache:insert(?CACHE_TYPE_VIEW_INFO, RoleID, RoleViewMapN, ?CACHE_TIME_DEFAULT).

%% 实时更新珍兽情况
update_role_view_pet(PS) ->
    #role_state{id = RoleID} = PS,
    RoleViewMap = case lib_cache:get_role_view(RoleID) of
        undefined -> get_role_view_map(PS);
        ViewInfo -> ViewInfo
    end,
    CurPet = lib_role_pet:get_current_pet(),
    Pets = ?iif(CurPet =:= undefined, [], [CurPet]),
    RoleViewMapN = RoleViewMap#{pets => Pets},
    svr_cache:insert(?CACHE_TYPE_VIEW_INFO, RoleID, RoleViewMapN, ?CACHE_TIME_DEFAULT).

%% 实时更新战斗技能情况
update_role_view_attr(PS) ->
    #role_state{id = RoleID, bt_attr = BtAttr} = PS,
    RoleViewMap = case lib_cache:get_role_view(RoleID) of
        undefined -> get_role_view_map(PS);
        ViewInfo -> ViewInfo
    end,
    RoleViewMapN = RoleViewMap#{attr => BtAttr},
    svr_cache:insert(?CACHE_TYPE_VIEW_INFO, RoleID, RoleViewMapN, ?CACHE_TIME_DEFAULT).

%% @doc 默认人物信息数据
default_role_view() ->
    ?role_view.

%% @doc 默认珍兽数据
default_pet_view() ->
    ?pet_view.

%% @doc 默认经脉数据
default_channels_view() ->
    ?channel_view.

%% @doc 默认熔炼数据
default_forge_view() ->
    ?forge_view.

%% =============================================================================
%% 玩家数据
%% =============================================================================

%% @doc 上线处理
init(PS) ->
    PS.

%% @doc 下线处理
save(PS) ->
    PS.

%% @doc 上线后逻辑
role_login(PS) ->
    save_offline_view(PS, false).

%% @doc 数据持久化前
role_logout(PS) ->
    save_offline_view(PS).


%% @doc 保存信息用于离线查看
save_offline_view(PS) ->
    save_offline_view(PS, true).

save_offline_view(PS, ToDB) ->
    #role_state{id = RoleID} = PS,
    RoleViewMap = get_role_view_map(PS),
    PetViewMap = get_pet_view_map(PS),
    ChannelsViewMap = get_channels_view_map(PS),
    ForgeViewMap = get_forge_view_map(PS),
    %% 更新数据库，移除复杂数据(装备等等)
    if
        ToDB ->
            View = type:term_to_bitstring(maps:remove(equips, RoleViewMap#{
                equips => [], anqi => [], artifact => [], dragon => [], warrior_soul => [],
                marriage => []
            })),
            SQL = io_lib:format(?SAVE_OFFLINE_VIEW_INFO, [RoleID, View]),
            ?DB:execute(SQL);
        true -> skip
    end,
    %% 更新缓存
    svr_cache:insert(?CACHE_TYPE_VIEW_INFO, RoleID, RoleViewMap, ?CACHE_TIME_DEFAULT),
    svr_cache:insert(?CACHE_TYPE_PET_VIEW, RoleID, PetViewMap, ?CACHE_TIME_DEFAULT),
    svr_cache:insert(?CACHE_TYPE_CHANNEL_VIEW, RoleID, ChannelsViewMap, ?CACHE_TIME_DEFAULT),
    svr_cache:insert(?CACHE_TYPE_FORGE_VIEW, RoleID, ForgeViewMap, ?CACHE_TIME_DEFAULT),
    ok.
