%%-------------------------------------------------------
%% @File     : svr_scene_agent_info.erl
%% @Brief    : 场景进程 info消息处理
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%------------------------------------------------------
-module(svr_scene_agent_info).

-export([handle_info/2]).

-include("log.hrl").
-include("role.hrl").
-include("scene.hrl").
-include("op_type.hrl").


%% Apis --------------------------------------------------
% @doc 场景逻辑处理(按压力调节帧大小)
handle_info({'handle_cmds', LastCmdTime}, #scene{last_cmd_time = LastCmdTime} = State) ->
    NowTimeMS = time:unixtime_ms(),

    try
        CmdQueue = lib_scene_agent:get_cmd_queue(),
        [
            lib_scene_cmd:handle_cmd(Cmd, CmdArgs)
            || {Cmd, CmdArgs} <- lists:reverse(CmdQueue)
        ],
        lib_scene_agent:put_cmd_queue([]),

        TimeList = lib_scene_agent:get_time_list(),
        PartitionFun = fun({Time, _Cmd, _CmdArgs}) -> Time =< NowTimeMS end,
        {TimeUpList, RemainList} = lists:partition(PartitionFun, TimeList),
        lib_scene_agent:put_time_list(RemainList),
        SortedTimeUpList = lists:keysort(1, TimeUpList),
        [
            lib_scene_cmd:handle_cmd(Cmd, CmdArgs)
            || {_Time, Cmd, CmdArgs} <- SortedTimeUpList
        ]
    catch
        Type:Error ->
            ?ERROR(
                "\nScene: ~p handle_cmds error!~nType:~p, Error:~p~nStarcktrace:~p",
                [?SCENE_ID, Type, Error, erlang:get_stacktrace()]
            )
    end,

    CmdRef = erlang:send_after(?CMDS_INTERVAL, self(), {'handle_cmds', NowTimeMS}),
    {noreply, State#scene{last_cmd_time = NowTimeMS, cmd_timer_ref = CmdRef}};
handle_info({'handle_cmds', _LastCmdTime}, State) ->
    ?ERROR("Invalid handle_cmds msg before clear scene !"),
    {noreply, State};

% @doc 场景更新时间片
handle_info({'handle_update', LastUpdateTime}, #scene{last_update_time = LastUpdateTime} = State) ->
    NowTimeMS = time:unixtime_ms(),
    UpdateRef = erlang:send_after(?UPDATE_INTERVAL, self(), {'handle_update', NowTimeMS}),
    ElapseTime = NowTimeMS - State#scene.last_update_time,
    UpdateCounter = lib_obj_util:update_counter(State#scene.update_counter),
    ?TRY_CATCH(scene_update(NowTimeMS, ElapseTime), "svr_scene_agent, scene_update"),
    UpdateCounter rem 5 =:= 0 andalso
        (?TRY_CATCH(scene_interval(State, UpdateCounter), "svr_scene_agent, scene_interval")),

    StateN = State#scene{
        update_counter = UpdateCounter,
        last_update_time = NowTimeMS,
        update_timer_ref = UpdateRef
    },
    {noreply, StateN};
handle_info({'handle_update', _LastUpdateTime}, State) ->
    ?ERROR("Invalid handle_update msg before clear scene !"),
    {noreply, State};

% 位移技能
handle_info({'pos_skill', AtterKey, DeferKey, AssistXY, {TSkillId, _} = TSkill, Time, ResetList, ResetType}, State) ->
    lib_scene_cmd:handle_cmd('rush', {ResetList, ResetType}),
    if
        TSkillId > 0 ->
            TrigArgs = {AtterKey, DeferKey, AssistXY, TSkill},
            if
                Time > 0 -> lib_scene_cmd:handle_cmd('trig_battle', TrigArgs);
                true -> lib_scene_cmd:scene_cmd('trig_battle', TrigArgs, Time)
            end;
        true ->
            skip
    end,
    {noreply, State};

% 异步处理需要(不需要等下一帧执行的逻辑)
handle_info({'handle_cmd', Cmd, CmdArgs}, State) ->
    try
        lib_scene_cmd:handle_cmd(Cmd, CmdArgs)
    catch
        Type:Error ->
            ?ERROR(
                "\nScene: ~p handle_cmd error!~nType:~p, Error:~p~nStarcktrace:~p",
                [?SCENE_ID, Type, Error, erlang:get_stacktrace()]
            )
    end,
    {noreply, State};

% 加载怪物
handle_info('load_mons', State) ->
    [
        lib_mon_agent:load_mons_by_group(MonGroup)
        || MonGroup <- State#scene.mon
    ],
    {noreply, State};

% 加载采集物
handle_info('load_colls', State) ->
    lib_coll_agent:load_colls_by_group(State#scene.coll),
    {noreply, State};

% 结束竞技场挑战
handle_info({'end_arena_round', RoleId}, State) ->
    lib_scene_arena:arena_round_end(State#scene.type, RoleId, failed),
    {noreply, State};

% 武林盟主结束
handle_info('end_master_chap', State) ->
    lib_scene_master:timeout(),
    {noreply, State};

% Boss召唤小怪1
handle_info({'boss_summon_mon', MonId, ActionId, [{SkillId, Area}, MIds]}, State) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{hp = Hp, x = X, y = Y, ai_data = AiData} = Mon when Hp > 0 ->
            SceneId = ?SCENE_ID,
            AreaFix = min(6, Area),
            Children = maps:get(children, AiData, []),
            lib_battle_base:bcast_attack(Mon, SkillId, 1),
            GenPosFun = fun(MId) ->
                {BornX, BornY} = lib_scene_sign:rand_pos(SceneId, X, Y, AreaFix),
                {MId, BornX, BornY}
            end,
            SummonList = lists:map(GenPosFun, MIds),
            MonIds = lib_mon_agent:load_mons_by_group(SummonList, [{parent, {ActionId, MonId}}]),
            ChildrenN = [{ActionId, MonIds} | Children],
            AiDataN = maps:put(children, ChildrenN, AiData),
            lib_mon_agent:put_mon(Mon#mon{ai_data = AiDataN});
        _ ->
            skip
    end,
    {noreply, State};
% Boss召唤小怪2
handle_info({'boss_summon_mon', MonId, ActionId, [SkillId | SummonList]}, State) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{hp = Hp, ai_data = AiData} = Mon when Hp > 0 ->
            Children = maps:get(children, AiData, []),
            lib_battle_base:bcast_attack(Mon, SkillId, 1),
            MonIds = lib_mon_agent:load_mons_by_group(SummonList, [{parent, {ActionId, MonId}}]),
            ChildrenN = [{ActionId, MonIds} | Children],
            AiDataN = maps:put(children, ChildrenN, AiData),
            lib_mon_agent:put_mon(Mon#mon{ai_data = AiDataN});
        _ ->
            skip
    end,
    {noreply, State};

% ai清除场景上的怪物
handle_info({'ai_clear_mon', MIds}, State) ->
    lib_mon_agent:clear_scene_mon_by_mids(true, MIds),
    {noreply, State};

% 子怪物回补召唤者
handle_info({'children_sacrify', MonId, MParentId, Args}, State) ->
    lib_obj_mon:self_kill(MonId),
    lib_obj_mon:children_sacrify(MParentId, Args),
    {noreply, State};

% 怪物自杀
handle_info({'self_kill', MonId}, State) ->
    lib_obj_mon:self_kill(MonId),
    {noreply, State};

% 怪物移除效果
handle_info({'mon_del_effects', MonId, EffectIds}, State) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{hp = Hp} = Mon when Hp > 0 ->
            MonN = lib_ai_trigger:del_effects(EffectIds, Mon),
            lib_mon_agent:put_mon(MonN);
        _ ->
            skip
    end,
    {noreply, State};

% handle_info('sync_role_num', #scene{id = SceneId, line = LineId} = State) ->
%     RoleNum = lib_scene_agent:get_scene_roler_num(),
%     svr_scene_mgr:sync_role_num(SceneId, LineId, RoleNum),
%     {noreply, State};

handle_info('terminate', State) ->
    {stop, normal, State};

% @doc 未定义消息处理
handle_info(Msg, #scene{id = SceneId, line = LineId} = State) ->
    ?ERROR("Recv unexpected info Msg: ~p in {SceneId: ~p, Line: ~p}", [Msg, SceneId, LineId]),
    {noreply, State}.


%% Privates ----------------------------------------------
%% 场景帧更新
scene_update(NowTimeMS, ElapseTime) ->
    update_mon(NowTimeMS, ElapseTime),
    update_role(NowTimeMS, ElapseTime),
    update_pet(NowTimeMS, ElapseTime),
    update_coll(NowTimeMS, ElapseTime),
    update_carry(NowTimeMS, ElapseTime),
    update_flyitem(NowTimeMS, ElapseTime).

%% 场景定时逻辑 从1sec ~ 10min
scene_interval(Scene, Counter) ->
    do_sec_logic(Scene),
    Counter rem 25 =:= 0 andalso do_5sec_logic(Scene),
    Counter rem 50 =:= 0 andalso do_10sec_logic(Scene),
    Counter rem 75 =:= 0 andalso do_15sec_logic(Scene),
    Counter rem 150 =:= 0 andalso do_30sec_logic(Scene),
    Counter rem 300 =:= 0 andalso do_min_logic(Scene),
    Counter rem 600 =:= 0 andalso do_2min_logic(Scene),
    Counter rem 1500 =:= 0 andalso do_5min_logic(Scene),
    Counter =:= 0 andalso do_10min_logic(Scene).

% 每秒逻辑
do_sec_logic(_Scene) ->
    ok.

% 每5秒逻辑
do_5sec_logic(Scene) ->
    lib_scene_lake:send_mon_info(Scene#scene.id),
    ok.

% 每10秒逻辑
do_10sec_logic(Scene) ->
    lib_scene_jousts:add_exp_timing(Scene#scene.id),
    ok.

% 每15秒逻辑
do_15sec_logic(_Scene) ->
    ok.

% 每30秒逻辑
do_30sec_logic(_Scene) ->
    ok.

% 每分逻辑
do_min_logic(_Scene) ->
    ok.

% 每2分逻辑
do_2min_logic(_Scene) ->
    ok.

% 每5分逻辑
do_5min_logic(_Scene) ->
    ok.

% 每10分逻辑
do_10min_logic(_Scene) ->
    ok.


%% 更新怪物数据
update_mon(NowTimeMS, ElapseTime) ->
    UpdateFun = fun(MonId) ->
        case lib_mon_agent:get_mon(MonId) of
            #mon{hp = Hp} = Mon when Hp > 0 ->
                lib_obj_mon:on_update(NowTimeMS, ElapseTime, Mon);
            _ ->
                lib_mon_agent:del_mon(MonId)
        end
    end,
    MonIds = lib_mon_agent:get_ids(),
    lists:foreach(UpdateFun, MonIds).

%% 更新角色数据
update_role(NowTimeMS, ElapseTime) ->
    UpdateFun = fun(RoleId) ->
        case lib_scene_agent:get_roler(RoleId) of
            #scene_role{} = SceneRoler ->
                lib_obj_role:on_update(NowTimeMS, ElapseTime, SceneRoler);
            _ ->
                ?ERROR("scene dictionary abnormal !~nmissing Role: ~p", [RoleId]),
                erase(RoleId)
        end
    end,
    RoleIds = lib_scene_agent:get_scene_roler_ids(),
    lists:foreach(UpdateFun, RoleIds).

%% 更新宠物数据
update_pet(NowTimeMS, ElapseTime) ->
    UpdateFun = fun(PetId) ->
        case lib_pet_agent:get_pet(PetId) of
            #pet{} = Pet ->
                lib_obj_pet:on_update(NowTimeMS, ElapseTime, Pet);
            _ ->
                ?ERROR("scene dictionary abnormal !~nmissing Pet: ~p", [PetId]),
                lib_pet_agent:del_pet(PetId)
        end
    end,
    PetIds = lib_pet_agent:get_ids(),
    lists:foreach(UpdateFun, PetIds).

%% 更新采集物数据
update_coll(NowTimeMS, ElapseTime) ->
    UpdateFun = fun(CollId) ->
        case lib_coll_agent:get_coll(CollId) of
            #coll{} = Coll ->
                lib_obj_coll:on_update(NowTimeMS, ElapseTime, Coll);
            _ ->
                ?ERROR("scene dictionary abnormal !~nmissing Coll: ~p", [CollId]),
                lib_coll_agent:del_coll(CollId)
        end
    end,
    CollIds = lib_coll_agent:get_ids(),
    lists:foreach(UpdateFun, CollIds).

%% 更新镖车数据
update_carry(NowTimeMS, ElapseTime) ->
    UpdateFun = fun(CarryId) ->
        case lib_carry_agent:get_carry(CarryId) of
            #carry{} = Carry ->
                lib_obj_carry:on_update(NowTimeMS, ElapseTime, Carry);
            _ ->
                ?ERROR("scene dictionary abnormal !~nmissing Carry: ~p", [CarryId]),
                lib_carry_agent:del_carry(CarryId)
        end
    end,
    CarryIds = lib_carry_agent:get_ids(),
    lists:foreach(UpdateFun, CarryIds).

%% 更新飞行道具数据
update_flyitem(NowTimeMS, ElapseTime) ->
    UpdateFun = fun(FlyitemId) ->
        case lib_flyitem_agent:get_flyitem(FlyitemId) of
            #flyitem{} = Flyitem ->
                lib_obj_flyitem:on_update(NowTimeMS, ElapseTime, Flyitem);
            _ ->
                ?ERROR("scene dictionary abnormal !~nmissing Flyitem: ~p", [FlyitemId]),
                lib_flyitem_agent:del_flyitem(FlyitemId)
        end
    end,
    FlyitemIds = lib_flyitem_agent:get_ids(),
    lists:foreach(UpdateFun, FlyitemIds).
