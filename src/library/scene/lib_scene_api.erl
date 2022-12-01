%%-------------------------------------------------------
%% @File     : lib_scene_api.erl
%% @Brief    : 场景信息处理接口 场景进程对外接口
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%-------------------------------------------------------
%% 此模块提供的所有接均为场景进程对外导出接口

-module(lib_scene_api).

-include("log.hrl").
-include("role.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("ret_code.hrl").
-include("proto/prot_902.hrl").


%% 场景角色管理
-export([
    update/2,                       %% 场景异步更新
    scene_update/2,                 %% 场景更新
    role_correct_scene/3,           %% 角色位置纠正(登陆检测)
    set_scene_opt/2,                %% 设置场景选项(如阵营、保持血量等)
    change_scene/3,                 %% 切换场景
    change_scene/5,                 %% 切换场景
    change_scene_async/5,           %% 切换场景(异步)
    change_scene_async/6,           %% 切换场景(异步)
    change_scene_restore/1,         %% 切场景前回存
    leave_scene/2,                  %% 离开场景
    return_scene/1,                 %% 返回原场景
    is_role_in_scene/3,             %% 判断玩家在不在某场景
    get_scene_roler_field/2,        %% 获得当前场景用户字段
    get_scene_roler_fields/2,       %% 获得当前场景用户字段(多个字段)
    get_scene_roler_num/1,          %% 获得场景内用户数量
    update_scene_roler_field/3,     %% 更新场景内所有玩家的多个值
    add_role_effect/4,              %% 给角色加效果
    add_role_effect/5,              %% 给角色加效果
    same_scene_transfer/4           %% 同场景传送
]).


%% 宠物、怪物类接口
-export([
    pet_leave/2,
    pet_enter/3,
    pet_update/3,
    create_mon/3,
    create_mon/4,
    create_mon_async/3,
    create_mon_async/4,
    create_mon_async_by_group/4,
    clear_scene_mon/2,
    clear_scene_mon/3,
    clear_scene_mon_by_ids/3,
    clear_scene_mon_by_ids/4,
    clear_scene_mon_by_mids/3,
    clear_scene_mon_by_mids/4,
    create_coll/6,
    create_coll_async/5,
    create_coll_async/6,
    create_flyitem/4,
    create_flyitem_async/4,
    is_mon_in_scene/3,
    is_mon_in_scene/2,
    get_mon_hp/1,
    get_mon_name/1
]).


%% 场景配置、判断相关
-export([
    get_scene_born_pos/1,           %% 获取场景出生点
    fix_scene_mode/2,               %% 修正场景模式
    get_scene_type/1,               %% 获取场景类型
    get_scene_name/1,               %% 获取场景名
    get_scene_field/2,              %% 获取场景的字段
    get_scene_by_type/1,            %% 获取特定类型的所有场景
    get_scene_by_types/1,           %% 获取特定类型(多个类型)的所有场景id
    get_main_city/1,                %% 获取默认场景

    get_npc_pos/1,                  %% 获取npc位置
    is_nearby_npc/2,                %% 是否在NPC附近
    is_in_npc_scene/2,              %% 是否在NPC所在场景
    is_scene_of_type/2,             %% 场景是否某类型
    is_scene_of_types/2,            %% 场景是否某些类型
    is_dungeon_scene/1,             %% 是否副本场景
    is_outside_scene/1,             %% 是否野外场景
    is_normal_scene/1,              %% 是否普通或野外场景
    is_balance_scene/1,             %% 是否动态负载均衡场景
    is_notify_first_att_scene/1,    %% 是否通知怪物首刀改变场景类型
    is_clear_murderous/1,           %% 是否自动清除杀气场景
    is_can_declare/1,               %% 是否可以宣战
    is_cluster_scene/1,             %% 是否跨服场景
    is_team_near/5,                 %% 判断队伍是否已集合
    is_team_near/6,                 %% 同上
    is_target_near/6,               %% 对方是否在附近
    is_valid_pos/1,
    is_add_exploit_scene/1,
    update_header/2,
    update_header/3,
    update_header/4
]).


%% 场景发送消息相关
-export([
    send_to_scene/2,
    send_to_scene/3,
    send_to_area_scene/5,
    send_to_role_area_scene/2,
    send_to_role_area_scene/3,
    send_to_role_area_scene/4,
    send_to_scene_except/4,
    send_to_scene_later/4
]).


%% -----------------------------------------------------------------------------
%% ------------------------------ Apis for roles -------------------------------
%% -----------------------------------------------------------------------------
%% @doc 场景更新数据接口
% 更新基础属性及战力
update('scene_bt_attr', RoleState) when is_record(RoleState, role_state) ->
    #role_state{
        id = RoleId, level = Level,
        bt_data = #{bt_attr := BtAttr},
        combat_power = CombatPower,
        role_scene = RoleScene
    } = RoleState,
    LinePid = RoleScene#role_scene.line_pid,
    scene_update(LinePid, {'scene_bt_attr', RoleId, Level, BtAttr, CombatPower});
% 更新称号
update('title', #role_state{id = RoleID, personal = RolePersonal} = RoleState) ->
    #{title := Title} = RolePersonal,
    {SwornTitle, Quality} = lib_role_sworn:get_sworn_name(RoleID, Title),
    AttrList = [{#scene_role.title, Title}, {#scene_role.title_extra, SwornTitle}, {#scene_role.title_quality, Quality}],
    #role_state{id = RoleId, role_scene = #role_scene{line_pid = LinePid}} = RoleState,
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_scene_roler_fields, [RoleId, AttrList]);
% 更新时装
update('fashion', #role_state{personal = RolePersonal} = RoleState) ->
    #{fashion := Fashion} = RolePersonal,
    KV = {#scene_role.fashion, Fashion},
    #role_state{id = RoleId, role_scene = #role_scene{line_pid = LinePid}} = RoleState,
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_scene_roler_field, [RoleId, KV]);
% 更新时装
update('hair', #role_state{personal = RolePersonal} = RoleState) ->
    #{hair := Hair} = RolePersonal,
    KV = {#scene_role.hair, Hair},
    #role_state{id = RoleId, role_scene = #role_scene{line_pid = LinePid}} = RoleState,
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_scene_roler_field, [RoleId, KV]);
% 更新头衔
update('title_honor', #role_state{personal = RolePersonal} = RoleState) ->
    #{title_honor := TitleHonor} = RolePersonal,
    KV = {#scene_role.title_honor, TitleHonor},
    #role_state{id = RoleId, role_scene = #role_scene{line_pid = LinePid}} = RoleState,
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_scene_roler_field, [RoleId, KV]);
% 更新模块被动技能列表
update('mod_pskills', RoleState) ->
    RoleId = RoleState#role_state.id,
    ModPSkills = lib_role_skill:get_mod_pskills(RoleId),
    LinePid = (RoleState#role_state.role_scene)#role_scene.line_pid,
    scene_update(LinePid, {'mod_pskills', RoleId, ModPSkills});
% 更新角色技能列表
update('skill_list', #role_state{skill_list = SkillList} = RoleState) ->
    RoleId = RoleState#role_state.id,
    LinePid = (RoleState#role_state.role_scene)#role_scene.line_pid,
    SkillConfs = lib_role_skill:scene_skills(SkillList),
    scene_update(LinePid, {'skill_list', RoleId, SkillList, SkillConfs});
% 更新角色名
update('name', RoleState) ->
    KV = {#scene_role.name, RoleState#role_state.name},
    #role_state{id = RoleId, role_scene = #role_scene{line_pid = LinePid}} = RoleState,
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_scene_roler_field, [RoleId, KV]);
% 更新帮派信息
update('guild', RoleState) ->
    #role_state{id = RoleId, guild_id = GuildId, guild_name = GuildName, role_scene = RoleScene} = RoleState,
    LinePid = RoleScene#role_scene.line_pid,
    scene_update(LinePid, {'guild', RoleId, GuildId, GuildName});
update('marry', PS) ->
    #role_state{id = RoleID, mate_id = MateID, mate_name = MateName, role_scene = #role_scene{line_pid = LinePid}} = PS,
    KV = [{#scene_role.mate_id, MateID}, {#scene_role.mate_name, MateName}],
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_scene_roler_fields, [RoleID, KV]);
update({'follow', Follow}, PS) ->
    #role_state{id = RoleID, role_scene = #role_scene{line_pid = LinePid}} = PS,
    svr_scene_agent:apply_cast(LinePid, lib_team_agent, set_team_follow, [RoleID, Follow]);
update({'trans', ID, Bin}, PS) ->
    #role_state{id = RoleID, role_scene = #role_scene{line_pid = LinePid}} = PS,
    KvList = [{#scene_role.tran_stat, ID}],
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_field_notify, [RoleID, KvList, Bin]);
% 更新玩家帮派宣战or敌对or运镖状态以及同步到宠物owner字段
update({'sync_role_and_pet', RoleKvList, PetKvList}, RoleState) ->
    #role_state{id = RoleId, role_scene = #role_scene{line_pid = LinePid}} = RoleState,
    scene_update(LinePid, {'update_role_and_pet', RoleId, RoleKvList, PetKvList});
% 默认匹配
update(Op, RoleState) ->
    ?ERROR_FUNC_CALL([Op, RoleState]),
    ok.

% @doc 登陆检测位置有效性
role_correct_scene(GuildId, Level, #role_scene{scene_id = ?SCENE_ID_GUILD} = RoleScene) ->
    #role_scene{line_id = LineId, x = X, y = Y} = RoleScene,
    case GuildId =:= LineId of
        true -> {?SCENE_ID_GUILD, LineId, X, Y};
        false -> get_correct_scene(Level)
    end;
role_correct_scene(_GuildId, Level, RoleScene) ->
    #role_scene{scene_id = SceneId, x = X, y = Y, old_scene = OldScene} = RoleScene,
    NeedReset = is_scene_of_types(SceneId, ?RESET_SCENE_TYPES),
    CurPosValid = is_valid_pos({SceneId, any, X, Y}),
    if
        NeedReset -> %% 需要重置
            OldPosValid = is_valid_pos(OldScene) andalso is_scene_of_types(element(1, OldScene), ?NORMAL_SCENE_TYPES),
            if
                OldPosValid ->
                    OldSceneId = element(1, OldScene),
                    NewLineId = svr_scene_mgr:get_line_id(OldSceneId),
                    setelement(2, OldScene, NewLineId);
                true ->
                    get_correct_scene(Level)
            end;
        CurPosValid -> %% 尝试重新进入 []
            NewLineId = svr_scene_mgr:get_line_id(SceneId),
            {SceneId, NewLineId, X, Y};
        true -> %% 进入默认场景
            get_correct_scene(Level)
    end.

% @doc 设置场景选项
% @spec set_scene_opt(RoleState, SceneOpts) -> {ok, RoleStateN}.
set_scene_opt(RoleState, SceneOpt) ->
    {ok, RoleState#role_state{scene_opt = SceneOpt}}.

% @doc 切换场景方法 [同步]
change_scene(RoleState, SceneId, LineId) ->
    case catch lib_scene_check:check_enter_limit(RoleState, SceneId, LineId) of
        {ok, SceneId, LineIdFix, LinePid, X, Y} ->
            change_scene_chked(RoleState, SceneId, LineIdFix, LinePid, X, Y);
        {error, RetCode} ->
            {error, RetCode}
    end.

%% @doc 切换场景，指定分线及位置 [同步]
change_scene(RoleState, SceneId, LineId, X, Y) ->
    case catch lib_scene_check:check_enter_limit(RoleState, SceneId, LineId, X, Y) of
        {ok, SceneId, LineIdFix, LinePid, X1, Y1} ->
            change_scene_chked(RoleState, SceneId, LineIdFix, LinePid, X1, Y1);
        {error, RetCode} ->
            {error, RetCode}
    end.

%% @doc 不指定分线切换场景 [异步]
change_scene_async(RoleId, SceneId, ?DYN_LINE_ID, X, Y) ->
    LineIdFix = svr_scene_mgr:get_line_id(SceneId),
    lib_role:apply_cast2(RoleId, {?MODULE, change_scene, [SceneId, LineIdFix, X, Y]});
%% @doc 指定分线切换场景 [异步]
change_scene_async(RoleId, SceneId, LineId, X, Y) ->
    case svr_scene_mgr:get_line_pid(SceneId, LineId) of
        undefined -> svr_change_scene:push({time:unixtime_ms() + 300, [RoleId, SceneId, LineId, X, Y]});
        _LinePid -> lib_role:apply_cast2(RoleId, {?MODULE, change_scene, [SceneId, LineId, X, Y]})
    end.

%% @doc 不指定分线切换场景，带选项 [异步]
change_scene_async(RoleId, SceneId, ?DYN_LINE_ID, X, Y, SceneOpt) ->
    case svr_scene_mgr:get_line_id(SceneId) of
        ?DYN_LINE_ID ->
            ?ERROR("Bad lib_scene_api:change_scene_async/6 call with SceneId: ~p LineId: ~p", [SceneId, 0]),
            skip;
        LineId ->
            lib_role:apply_cast2(RoleId, {?MODULE, set_scene_opt, [SceneOpt]}),
            lib_role:apply_cast2(RoleId, {?MODULE, change_scene, [SceneId, LineId, X, Y]})
    end;
%% @doc 指定分线切换场景，带选项 [异步]
change_scene_async(RoleId, SceneId, LineId, X, Y, SceneOpt) ->
    lib_role:apply_cast2(RoleId, {?MODULE, set_scene_opt, [SceneOpt]}),
    case svr_scene_mgr:get_line_pid(SceneId, LineId) of
        undefined -> svr_change_scene:push({time:unixtime_ms() + 300, [RoleId, SceneId, LineId, X, Y]});
        _LinePid -> lib_role:apply_cast2(RoleId, {?MODULE, change_scene, [SceneId, LineId, X, Y]})
    end.

% @doc 切场景前回存(回存上一个场景、模式 及 reset_index)
% @spec change_scene_restore(RoleState) -> RoleStateN.
% RoleState = RoleStateN    :: #role_state{}
% Options                   :: [{key, Value :: term()}]
% Key                       :: team_id | ream | full_hpmp
change_scene_restore(#role_state{id = RoleId, role_scene = RoleScene, scene_opt = SceneOpt} = RoleState) ->
    #role_scene{scene_id = SceneId, line_id = LineId, line_pid = LinePid} = RoleScene,
    case catch svr_scene_agent:call_scene(LinePid, {'change_scene_restore', RoleId}) of
        {ok, [{Mode, X, Y, ResetIndex}, Hp, HpLim, Mp, MpLim, Anger, SkillCd, EffectCd, PetData, HorseStat, DeclareMap, RivalMap]} ->
            lib_role_pet:scene_restore(PetData),
            SceneType = get_scene_type(SceneId),
            #role_scene{old_scene = OldScene, act_scene = ActScene} = RoleScene,
            {OldSceneN, ActSceneN} = case lists:member(SceneType, ?NORMAL_SCENE_TYPES) of
                true -> {{SceneId, LineId, X, Y}, ActScene};
                false when SceneType =:= ?SCENE_ACTREADY -> {OldScene, {SceneId, LineId, X, Y}};
                false -> {OldScene, ActScene}
            end,
            {HpFix, MpFix} = case lists:keymember(full_hpmp, 1, SceneOpt) of
                true -> {HpLim, MpLim};
                false -> {Hp, Mp}
            end,
            RoleSceneN = RoleScene#role_scene{
                mode = Mode, reset_index = ResetIndex,
                old_scene = OldSceneN, act_scene = ActSceneN
            },
            BtData = RoleState#role_state.bt_data,
            BtDataN = BtData#{
                anger => Anger, skill_cd => SkillCd, effect_cd => EffectCd,
                horse_stat => HorseStat, declare_map => DeclareMap, rival_map => RivalMap
            },
            RoleState#role_state{role_scene = RoleSceneN, bt_data = BtDataN, hp = HpFix, mp = MpFix};
        _ ->
            RoleState
    end.

%% @doc 离开当前场景
leave_scene(RoleId, #role_scene{line_pid = LinePid}) when is_pid(LinePid) ->
    svr_scene_agent:cast_scene(LinePid, {'leave', RoleId});
leave_scene(_RoleId, _RoleScene) ->
    % 重登？？？
    skip.

%% @doc 返回原场景
return_scene(PS) ->
    #role_scene{
        scene_id = SceneId, line_id = LineId,
        old_scene = {OSceneID, OLineID, OX, OY}
    } = PS#role_state.role_scene,
    case change_scene(PS, OSceneID, OLineID, OX, OY) of
        {ok, NewPS} ->
            {ok, NewPS};
        {error, _RetCode} ->
            ?ERROR(
                "Role return_scene from Scene: ~p, Line: ~p to Scene: ~p, Line: ~p failed ! Back to default scene !",
                [SceneId, LineId, OSceneID, OLineID]
            ),
            {MSceneId, _X, _Y} = conf_scene:get_correct_scene(PS#role_state.level),
            change_scene(PS, MSceneId, ?DYN_LINE_ID)
    end.

%% @doc 是否队伍里所有队员都在同一个点附近
%% @spec 若没有队伍返回false
%% 是否是队长提前验证
%% Members       :: [RoleID]
is_team_near(Members, SceneID, LineID, X, Y) ->
    Dist = config:get_sys_config(team_near_by_distance),
    is_team_near(Members, SceneID, LineID, X, Y, Dist).
is_team_near(Members, SceneID, LineID, X, Y, Dist) ->
    Args = [Members, X, Y, Dist],
    svr_scene_agent:apply_call(SceneID, LineID, lib_scene_agent, is_team_near, Args).

%% @doc 判断对方玩家是否在自己dist距离内
is_target_near(TargetID, SceneID, LineID, X, Y, Dist) ->
    Args = [TargetID, X, Y, Dist],
    svr_scene_agent:apply_call(SceneID, LineID, lib_scene_agent, is_target_near, Args).

%% @doc 同场景传送
%% ToXY       :: {X, Y}
same_scene_transfer(SceneID, LineID, RoleID, ToXY) ->
    svr_scene_agent:apply_cast(SceneID, LineID, lib_obj_role, same_scene_transfer, [RoleID, ToXY]).

%% -------------------------------------------------------------------------------------
%% ------------------------------ Apis for pets and mons -------------------------------
%% -------------------------------------------------------------------------------------
% @doc 珍兽休息
% @spec pet_leave(RoleScene, RoleId) -> ignore;
% RoleScene     :: #role_scene{}
% RoleId        :: integer()
pet_leave(RoleScene, RoleId) ->
    #role_scene{line_pid = LinePid} = RoleScene,
    svr_scene_agent:cast_scene(LinePid, {'pet_leave', RoleId}).

% @doc 珍兽上阵(进入场景)
% @spec pet_enter(RoleScene, RoleId, Pet, AssistSkills) -> ignore;
% RoleScene     :: #role_scene{}
% RoleId        :: integer()
% Pet           :: #pet{}
% AssistSkills  :: [#skill{}
pet_enter(RoleScene, RoleId, Pet) ->
    #role_scene{line_pid = LinePid} = RoleScene,
    svr_scene_agent:cast_scene(LinePid, {'pet_enter', RoleId, Pet}).

% @doc 珍兽数据更新
% @spec pet_update(RoleScene, RoleId, Pet) -> ignore;
% RoleScene     :: #role_scene{}
% RoleId        :: integer()
% Pet           :: #pet{}
pet_update(RoleScene, RoleId, Pet) ->
    #role_scene{line_pid = LinePid} = RoleScene,
    svr_scene_agent:cast_scene(LinePid, {'pet_update', RoleId, Pet}).


%% Apis -------------------------------------------------
% @spec create_mon(MId, LinePid, Args) -> MonId | 0
% MId = MonId   :: integer()
% LinePid       :: pid()
% Args          :: [{Key :: atom(), Opts :: term()}]
create_mon(MId, LinePid, Args) when is_pid(LinePid) ->
    ApplyArgs = [MId, Args],
    svr_scene_agent:apply_call(LinePid, lib_mon_agent, create_mon, ApplyArgs).

% @doc 创建怪物
% @spec create_mon(MId, Scene, Line, Args) -> MonId | 0
% MId = Scene = Line = MonId    :: integer()
% Args                          :: [{Key :: atom(), Opts :: term()}]
create_mon(MId, Scene, Line, Args) ->
    ApplyArgs = [MId, Args],
    svr_scene_agent:apply_call(Scene, Line, lib_mon_agent, create_mon, ApplyArgs).

% @spec create_mon_async(MId, LinePid, Args) -> ok.
% MId           :: integer()
% LinePid       :: pid()
% Args          :: [{Key :: atom(), Opts :: term()}]
create_mon_async(MId, LinePid, Args) when is_pid(LinePid) ->
    ApplyArgs = [MId, Args],
    svr_scene_agent:apply_cast(LinePid, lib_mon_agent, create_mon, ApplyArgs).

% @doc 创建怪物 - 异步
% @spec create_mon_async(MId, Scene, Line, Args) -> ok.
% MId = Scene = Line    :: integer()
% Args                  :: [{Key :: atom(), Opts :: term()}]
create_mon_async(MId, Scene, Line, Args) ->
    ApplyArgs = [MId, Args],
    svr_scene_agent:apply_cast(Scene, Line, lib_mon_agent, create_mon, ApplyArgs).

% @doc 批量创建怪物 - 异步
% @spec create_mon_async_by_group(MonL, Scene, Line, Args) -> ok.
% MonL              :: [{MonID, X, Y}]
% Scene = Line      :: integer()
% Args              :: [{xy, {X, Y}}] | []
create_mon_async_by_group(MonL, Scene, Line, Args) ->
    ApplyArgs = [MonL, Args],
    svr_scene_agent:apply_cast(Scene, Line, lib_mon_agent, load_mons_by_group, ApplyArgs).

% @doc 按怪物唯一id清理创建怪物
% @spec clear_scene_mon_by_ids(Scene, Line, Ids, BroadCast) -> ok.
% LinePid   :: pid()
% Ids       :: [integer()]
% BroadCast :: boolean()
clear_scene_mon_by_ids(LinePid, Ids, BroadCast) ->
    ApplyArgs = [Ids, BroadCast],
    svr_scene_agent:apply_cast(LinePid, lib_mon_agent, clear_scene_mon_by_ids, ApplyArgs).

% @doc 按怪物唯一id清理创建怪物
% @spec clear_scene_mon_by_ids(Scene, Line, Ids, BroadCast) -> ok.
% Scene = Line  :: integer()
% Ids           :: [integer()]
% BroadCast     :: boolean()
clear_scene_mon_by_ids(Scene, Line, Ids, BroadCast) ->
    ApplyArgs = [Ids, BroadCast],
    svr_scene_agent:apply_cast(Scene, Line, lib_mon_agent, clear_scene_mon_by_ids, ApplyArgs).

% @doc 按怪物类型id清理创建怪物
% @spec clear_scene_mon_by_mids(LinePid, Mids, BroadCast) -> ok.
% LinePid   :: pid()
% Mids      :: [integer()]          怪物资源id列表 #mon.mid
% BroadCast :: boolean              是否广播
clear_scene_mon_by_mids(LinePid, Mids, BroadCast) ->
    ApplyArgs = [BroadCast, Mids],
    svr_scene_agent:apply_cast(LinePid, lib_mon_agent, clear_scene_mon_by_mids, ApplyArgs).

% @doc 按怪物类型id清理创建怪物
% @spec clear_scene_mon_by_mids(Scene, Line, Mids, BroadCast) -> ok.
% Scene = Line  :: integer()
% Mids          :: [integer()]          怪物资源id列表 #mon.mid
% BroadCast     :: boolean              是否广播
clear_scene_mon_by_mids(Scene, Line, Mids, BroadCast) ->
    ApplyArgs = [BroadCast, Mids],
    svr_scene_agent:apply_cast(Scene, Line, lib_mon_agent, clear_scene_mon_by_mids, ApplyArgs).

% @doc 删除场景怪物数据
% @spec clear_scene_mon(LinePid, BroadCast) -> ok.
% LinePid   :: pid()            % 分线pid
% BroadCast :: boolean          % 是否广播
clear_scene_mon(LinePid, BroadCast) ->
    ApplyArgs = [BroadCast],
    svr_scene_agent:apply_cast(LinePid, lib_mon_agent, clear_scene_mon, ApplyArgs).

% @doc 删除场景怪物数据
% @spec clear_scene_mon(Scene, Line, BroadCast) -> ok.
% Scene = Line    :: integer()
% BroadCast :: boolean              是否广播
clear_scene_mon(Scene, Line, BroadCast) ->
    ApplyArgs = [BroadCast],
    svr_scene_agent:apply_cast(Scene, Line, lib_mon_agent, clear_scene_mon, ApplyArgs).

% @doc 创建采集物
% @spec create_coll(CId, Scene, Line, X, Y, Args) -> CollID | 0
% CId = Scene = Line = MonId = X = Y    :: integer()
% Args                          :: [{Key :: atom(), Opts :: term()}]
create_coll(CId, Scene, Line, X, Y, Args) ->
    ApplyArgs = [CId, X, Y, Args],
    svr_scene_agent:apply_call(Scene, Line, lib_coll_agent, create_coll, ApplyArgs).

% @doc 创建采集物 - 异步
% @spec create_coll_async(CId, Scene, Line, X, Y, Args) -> ok.
% CId = Scene = Line = X = Y   :: integer()
% Args                  :: [{Key :: atom(), Opts :: term()}]
create_coll_async(CId, Scene, Line, X, Y, Args) ->
    ApplyArgs = [CId, X, Y, Args],
    svr_scene_agent:apply_cast(Scene, Line, lib_coll_agent, create_coll, ApplyArgs).

create_coll_async(CID, LinePid, X, Y, Args) ->
    ApplyArgs = [CID, X, Y, Args],
    svr_scene_agent:apply_cast(LinePid, lib_coll_agent, create_coll, ApplyArgs).

% @doc 创建飞行道具
% @spec create_coll(CId, Scene, Line, Pos, Args) -> CollID | 0
% CId           :: integer()
% LinePid       :: pid()
% Pos           :: {X :: integer(), Y :: integer()}
% AtterKey      :: {ObjType :: integer(), ObjId :: integer()}
create_flyitem(CId, LinePid, Pos, AtterKey) ->
    ApplyArgs = [CId, Pos, AtterKey, AtterKey, 1],
    svr_scene_agent:apply_call(LinePid, lib_flyitem_agent, create_flyitem, ApplyArgs).

% @doc 创建飞行道具 - 异步
% @spec create_flyitem_async(CId, Scene, Line, Pos, AtterKey) -> ok.
% CId           :: integer()
% LinePid       :: pid()
% Pos           :: {X :: integer(), Y :: integer()}
% AtterKey      :: {ObjType :: integer(), ObjId :: integer()}
create_flyitem_async(CId, LinePid, Pos, AtterKey) ->
    ApplyArgs = [CId, Pos, AtterKey, AtterKey, 1],
    svr_scene_agent:apply_cast(LinePid, lib_flyitem_agent, create_flyitem, ApplyArgs).

% @doc 根据怪物唯一ID判断怪物是否在场景里面
is_mon_in_scene(Scene, LineId, Id) ->
    svr_scene_agent:apply_call(Scene, LineId, lib_mon_agent, is_mon_in_scene, [Id]).

% @doc 根据怪物唯一ID判断怪物是否在场景里面
is_mon_in_scene(LinePid, Id) ->
    svr_scene_agent:apply_call(LinePid, lib_mon_agent, is_mon_in_scene, [Id]).

% @doc 获取怪物血量上限
get_mon_hp(MonID) ->
    case conf_mon:get(MonID) of
        #mon{attr = #bt_attr{hp_lim = HpLim}} -> HpLim;
        _ -> 1
    end.

get_mon_name(MonID) ->
    case conf_mon:get(MonID) of
        #mon{name = Name} -> Name;
        _ -> <<"">>
    end.

%% ---------------------------------------------------------------------------------
%% ------------------------------ Apis for configs ---------------------------------
%% ---------------------------------------------------------------------------------
% @doc 获取当前场景出生点
% @spec get_scene_born_pos(SceneId) -> {X, Y}.
% SceneId = X = Y   :: integer()
get_scene_born_pos(SceneId) ->
    case conf_scene:get(SceneId) of
        #scene{x = X, y = Y} -> {X, Y};
        _ -> {0, 0}
    end.

% @doc 修正场景模式
% @spec fix_scene_mode(Scene, CurMode) -> Mode.
% Scene             :: #scene{} | integer()
% CurMode = Mode    :: integer()
fix_scene_mode(SceneId, CurMode) when is_integer(SceneId) ->
    ConfScene = conf_scene:get(SceneId),
    fix_scene_mode(ConfScene, CurMode);
fix_scene_mode(#scene{mode = []}, Mode) ->
    Mode;
fix_scene_mode(#scene{mode = ValidMode}, CurMode) ->
    case lists:member(CurMode, ValidMode) of
        true -> CurMode;
        false -> hd(ValidMode)
    end.

% @doc 获取场景字段值
% @spec get_scene_born_field(SceneId, Field) -> FieldValue.
get_scene_field(SceneId, Field) ->
    case conf_scene:get(SceneId) of
        Scene when is_record(Scene, scene) ->
            element(Field, Scene);
        _ ->
            undefined
    end.

% @doc 获取特定类型的场景id
get_scene_by_type(Type) ->
    conf_scene:get_ids_by_type(Type).

% @doc 获取特定类型(多个类型)的场景id
get_scene_by_types(Types) ->
    DeepSceneIdList = [
        conf_scene:get_ids_by_type(Type)
        || Type <- Types
    ],
    lists:flatten(DeepSceneIdList).

% @doc 获取主城复活点
get_main_city(Level) ->
    case conf_scene:get_correct_scene(Level) of
        {MSceneId, _X, _Y} -> MSceneId;
        _ -> ?DEFAULT_SCENE
    end.

%% @doc 是否在NPC附近
%% @spec is_nearby_npc(RoleScene, NpcIds) -> boolean()
%% RoleScene    :: #role_scene{}
%% NpcIds       :: [integer()]
is_nearby_npc(Role, NpcID) when is_integer(NpcID) ->
    is_nearby_npc(Role, [NpcID]);
is_nearby_npc(#role_scene{scene_id = RSceneId, x = RX, y = RY}, NpcIds) ->
    DistanceX = 16,
    ChkFun = fun(NpcId) ->
        case conf_npc:get(NpcId) of
            #{scene := SceneId} when SceneId =:= RSceneId ->
                #scene{npc = NpcList} = conf_scene:get(SceneId),
                {NpcId, NX, NY} = lists:keyfind(NpcId, 1, NpcList),
                lib_battle_chk:check_distance({RX, RY}, {NX, NY}, DistanceX);
            _ ->
                false
        end
    end,
    lists:any(ChkFun, NpcIds).

get_npc_pos(NpcID) ->
    case conf_npc:get(NpcID) of
        #{scene := SceneID} ->
            #scene{npc = NpcList} = conf_scene:get(SceneID),
            {_, NX, NY} = lists:keyfind(NpcID, 1, NpcList),
            {SceneID, NX, NY};
        _ ->
            undefined
    end.

%% @doc 是否跟npc在同个场景
%% @spec is_in_npc_scene(RoleScene, NpcIds) -> boolean()
%% RoleScene    :: #role_scene{}
%% NpcIds       :: [integer()]
is_in_npc_scene(#role_scene{scene_id = RSceneId}, NpcIds) ->
    ChkFun = fun(NpcId) ->
        case conf_npc:get(NpcId) of
            #{scene := SceneId} when SceneId =:= RSceneId -> true;
            _ -> false
        end
    end,
    lists:any(ChkFun, NpcIds).

%% @doc 场景是否属于某类型
is_scene_of_type(#role_scene{scene_id = SceneID}, Type) ->
    is_scene_of_type(SceneID, Type);
is_scene_of_type(#scene{type = SceneType}, Type) ->
    SceneType =:= Type;
is_scene_of_type(SceneId, Type) ->
    SceneType = get_scene_type(SceneId),
    SceneType =:= Type.

%% @doc 是否属于某些类型场景
is_scene_of_types(#role_scene{scene_id = SceneID}, Type) ->
    is_scene_of_types(SceneID, Type);
is_scene_of_types(#scene{type = Type}, TypeList) ->
    lists:member(Type, TypeList);
is_scene_of_types(SceneId, TypeList) ->
    SceneType = get_scene_type(SceneId),
    lists:member(SceneType, TypeList).

% @doc 判断玩家是否在场景里面
is_role_in_scene(SceneId, LineId, RoleId) ->
    svr_scene_agent:apply_call(SceneId, LineId, lib_scene_agent, is_role_in_scene, [RoleId]).

%% @doc 是否副本场景
is_dungeon_scene(Scene) ->
    is_scene_of_type(Scene, ?SCENE_DUNGEON).

%% @doc 是否野外场景
is_outside_scene(Scene) ->
    is_scene_of_type(Scene, ?SCENE_OUTSIDE).

%% @doc 普通场景 [主城 和 野外]
is_normal_scene(Scene) ->
    is_scene_of_types(Scene, ?NORMAL_SCENE_TYPES).

%% @doc 动态负载均衡场景 [ 主城、野外、挂机、地宫 和 特殊场景]
is_balance_scene(Scene) ->
    is_scene_of_types(Scene, ?BALANCE_SCENE_TYPES).

%% @doc 击杀敌帮增加战绩场景
is_add_exploit_scene(Scene) ->
    is_scene_of_types(Scene, ?ADD_EXPLOIT_SCENE_TYPES).

%% @doc 是否自动清除杀气场景
is_clear_murderous(SceneId) ->
    MurderousType = get_scene_field(SceneId, #scene.murderous_type),
    bit_map:is_set(?MURDEROUS_BIT_IS_CLR, MurderousType).

%% @doc 是否可宣战场景
is_can_declare(SceneId) ->
    MurderousType = get_scene_field(SceneId, #scene.murderous_type),
    bit_map:is_set(?MURDEROUS_BIT_IS_DECLARE, MurderousType).

%% @doc 跨服场景
is_cluster_scene(Scene) ->
    SceneType = get_scene_type(Scene),
    SceneType > ?SCENE_CLUSTER_BOUNDARY.

%% @doc 是否通知怪物首刀改变场景类型
is_notify_first_att_scene(Scene) ->
    is_scene_of_types(Scene, ?NOTIFY_FIRST_ATT_SCENE_TYPES).

% @doc 获得当前场景用户字段 (eg: #scene_role.id)
get_scene_roler_field(LinePid, Field) ->
    svr_scene_agent:apply_call(LinePid, lib_scene_agent, get_scene_roler_field, [Field]).

% @doc 获得当前场景用户字段(多个字段) (eg: [#scene_role.id, #scene_role.name])
get_scene_roler_fields(LinePid, Fields) ->
    svr_scene_agent:apply_call(LinePid, lib_scene_agent, get_scene_roler_fields, [Fields]).

% @doc 获得当前场景用户数量
get_scene_roler_num(LinePid) ->
    svr_scene_agent:apply_call(LinePid, lib_scene_agent, get_scene_roler_num, []).

%% @doc 更新当前场景所有用户#scene_role字段 (eg: [{#scene_role.mod, value},...])
update_scene_roler_field(SceneID, LineID, Args) ->
    svr_scene_agent:apply_cast(SceneID, LineID, lib_scene_agent, update_scene_all_roler_fields, [Args]).

% @doc 给角色加效果
add_role_effect(LinePid, RoleID, EffectID, EffectLv) ->
    RoleKey = {?BATTLE_ROLE, RoleID},
    svr_scene_agent:push_cmd(LinePid, {'add_effect', {RoleKey, RoleKey, EffectID, EffectLv}}).

add_role_effect(SceneID, LineID, RoleID, EffectID, EffectLv) ->
    LinePid = svr_scene_mgr:get_line_pid(SceneID, LineID),
    add_role_effect(LinePid, RoleID, EffectID, EffectLv).

%% @doc 临时称号
update_header(#role_state{id = RoleID, role_scene = RoleScene}, Header) ->
    update_header(RoleScene#role_scene.line_pid, RoleID, Header).

update_header(SceneID, LineID, RoleID, Header) ->
    update_header(svr_scene_mgr:get_line_pid(SceneID, LineID), RoleID, Header).

update_header(LinePid, RoleID, Header) when is_pid(LinePid) ->
    KvList = [{#scene_role.header, Header}],
    Bin = lib_role_title:header_bin(RoleID, Header),
    svr_scene_agent:apply_cast(LinePid, lib_scene_agent, update_field_notify, [RoleID, KvList, Bin]);
update_header(_LinePid, _RoleID, _Header) ->
    ignore.

%% Apis for send msg ------------------------------------

%% @doc 给场景所有角色发送信息
send_to_scene(Pid, Bin) ->
    gen_server:cast(Pid, {'send_to_scene', Bin}).

send_to_scene(SceneId, LineId, Bin) ->
    svr_scene_agent:cast_scene(SceneId, LineId, {'send_to_scene', Bin}).

%% @doc 给场景所有角色发送信息
send_to_scene_except(SceneId, LineId, Bin, Except) ->
    svr_scene_agent:cast_scene(SceneId, LineId, {'send_to_scene_except', Bin, Except}).

%% @doc 给场景的所有角色延时发送信息
send_to_scene_later(SceneId, LineId, Bin, MilliSec) ->
    svr_scene_agent:cast_scene(SceneId, LineId, {'send_to_scene_later', Bin, MilliSec}).

%% @doc 给场景九宫格角色发送信息
send_to_area_scene(SceneId, LineId, X, Y, Bin) ->
    svr_scene_agent:cast_scene(SceneId, LineId, {'send_to_area_scene', X, Y, Bin}).

%% @doc 给场景九宫格角色周围其他角色发送信息
send_to_role_area_scene(#role_state{id = RoleId, role_scene = RoleScene}, Bin) ->
    send_to_role_area_scene(RoleScene#role_scene.line_pid, RoleId, Bin).

send_to_role_area_scene(SceneID, LineID, RoleId, Bin) ->
    LinePid = svr_scene_mgr:get_line_pid(SceneID, LineID),
    send_to_role_area_scene(LinePid, RoleId, Bin).

send_to_role_area_scene(#role_state{id = RoleId, role_scene = RoleScene}, Bin, Except) ->
    LinePid = RoleScene#role_scene.line_pid,
    svr_scene_agent:cast_scene(LinePid, {'send_to_role_area_scene', RoleId, Bin, Except});
send_to_role_area_scene(LinePid, RoleId, Bin) ->
    svr_scene_agent:cast_scene(LinePid, {'send_to_role_area_scene', RoleId, Bin, []}).

%% Privates ----------------------------------------------------
%% 用id获取场景的资源场景类型
get_scene_type(SceneId) ->
    get_scene_field(SceneId, #scene.type).

%% 用id获取场景的场景名
get_scene_name(SceneId) ->
    get_scene_field(SceneId, #scene.name).

%% 获得修正场景
get_correct_scene(Lv) ->
    {SceneId, X, Y} = conf_scene:get_correct_scene(Lv),
    LineId = svr_scene_mgr:get_line_id(SceneId),
    {SceneId, LineId, X, Y}.

%% 场景更新
scene_update(LinePid, Data) ->
    svr_scene_agent:cast_scene(LinePid, {'update', Data}).

% @doc 登陆检查场景、坐标
is_valid_pos({SceneId, _Line, X, Y}) ->
    case conf_scene:get(SceneId) of
        #scene{} ->
            OldIsBlock = lib_scene_sign:is_pos_blocked(SceneId, X, Y),
            not OldIsBlock;
        _ ->
            false
    end;
is_valid_pos(_) ->
    false.

%% 切换场景逻辑(回存数据，离开场景)
change_scene_chked(RoleState, SceneId, LineId, LinePid, ToX, ToY) ->
    #role_state{id = RoleId, role_scene = RoleScene} = RoleState,
    #role_state{role_scene = RoleSceneT} = RoleStateT = change_scene_restore(RoleState),
    leave_scene(RoleId, RoleScene),

    RoleSceneN = RoleSceneT#role_scene{
        scene_id = SceneId, line_id = LineId,
        line_pid = LinePid, x = ToX, y = ToY
    },
    RoleStateN = RoleStateT#role_state{role_scene = RoleSceneN},
    router_901:send_enter_scene_info(RoleStateN),
    ?EVENT(RoleId, 'scene_changed'),
    {ok, RoleStateN}.
