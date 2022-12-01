%%-------------------------------------------------------
%% @File     : svr_role
%% @Brief    : 角色处理
%% @Author   : cablsbs
%% @Date     : 2018-6-5
%%---------------------------------------------------------
-module(svr_role).

-include("role.hrl").
-include("scene.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("title.hrl").

-behaviour(gen_server).

-export([
    start_link/1,
    hanging/2,
    stop/1
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

start_link(RoleId) ->
    gen_server:start_link(?MODULE, [RoleId], []).

hanging(Pid, Reason) ->
    gen_server:cast(Pid, {'hanging', Reason}).

stop(Pid) ->
    gen_server:cast(Pid, 'stop').

%% ============================================================================
%% gen_server callbacks
%% ============================================================================

init([RoleId]) ->
    process_flag(priority, high),
    %% 注册进程名
    erlang:put(role_id, RoleId),
    RoleProcessName = dist:role_process_name(RoleId),
    dist:register(global, RoleProcessName, self()),
    {ok, #role_state{id = RoleId, pid = self()}}.

% 同步退出
handle_call('stop', _From, State) ->
    lib_login:logout(State),
    {stop, normal, State};

% 有效连接的消息
handle_call({'SOCKET_CMD', Socket, Cmd, MsgRecord}, _From, #role_state{socket = Sock} = State) when Socket =:= Sock ->
    NewState = lib_role:handle_cmd(State, Cmd, MsgRecord),
    {reply, ok, NewState};

% 旧连接的消息(忽略)
handle_call({'SOCKET_CMD', Socket, Cmd, _MsgRecord}, _From, State) ->
    ?INFO("Cmd: ~p from role: ~p 's old socket: ~p", [Cmd, State#role_state.id, Socket]),
    {reply, ok, State};

% handle_call({'SOCKET_CMD', Cmd, MsgRecord}, _From, State) ->
%     NewState = lib_role:handle_cmd(State, Cmd, MsgRecord),
%     {reply, ok, NewState};

% 同步调用
handle_call({'apply_call', {M, F, A}}, _From, State) ->
    case catch apply(M, F, A) of
        {ok, Reply} ->
            {reply, Reply, State};
        Reply ->
            {reply, Reply, State}
    end;
handle_call({'apply_call2', {M, F, A}}, _From, State) ->
    case catch apply(M, F, [State | A]) of
        {ok, Reply} ->
            {reply, Reply, State};
        {ok, Reply, StateN} when is_record(StateN, role_state) ->
            {reply, Reply, StateN};
        Ret ->
            ?ERROR("Unexpected svr_role:apply_call2 return:~n~p", [Ret]),
            {reply, failed, State}
    end;
handle_call({'apply_call3', {M, F, A}}, _From, State) ->
    {reply, catch apply(M, F, [State | A]), State};
handle_call({'mfa', M, F, A}, _From, State) ->
    {reply, catch erlang:apply(M, F, A), State};
handle_call({'get_field', F}, _From, State) ->
    {reply, erlang:element(F, State), State};

handle_call({'is_switched', Socket}, _From, State) ->
    IsSwitched = Socket =/= State#role_state.socket,
    {reply, IsSwitched, State};

% 真正意义的登陆初始化 #role_state{}
handle_call({'login_init', State0}, _From, #role_state{pid = Pid}) ->
    StateN = lib_role:login_init(State0#role_state{pid = Pid}),
    erlang:send_after(10000, self(), 'sec_interval'),
    {reply, ok, StateN#role_state{is_inited = true}};

handle_call(Msg, _From, State) ->
    ?ERROR("Recv unexpected call msg: ~p", [Msg]),
    {reply, ok, State}.

% 模拟请求
handle_cast({'REDIRECT_CMD', Cmd, MsgRecord}, State) ->
    NewState = lib_role:handle_cmd(State, Cmd, MsgRecord),
    {noreply, NewState};

% 发送消息给客户端
handle_cast({'send_bin', Bin}, State) ->
    lib_role_send:send_to_sid(State#role_state.sid, Bin),
    {noreply, State};

% 挂起(等待重连)
handle_cast({'hanging', _Reason}, State) ->
    Ref = erlang:send_after(300000, self(), 'hanging_timeout'),
    put(hanging_ref, Ref),
    #role_state{
        id = RoleId, name = Name, level = Level, exp = Exp,
        role_scene = RoleScene, personal = Personal, stat = Stat
    } = State,
    StatN = bit_map:set(?SPEC_STAT_BIT_HANGING, Stat),
    lib_role_db:update_name_level(Name, Level, Exp, Personal, RoleId),
    svr_scene_agent:cast_scene(RoleScene, {'hanging', RoleId}),
    lib_role_agent:update(RoleId, {#role_online.hanging, true}),
    ?EVENT(State#role_state.id, 'hanging'),
    {noreply, State#role_state{stat = StatN}};

% 进程退出
handle_cast('stop', State) ->
    lib_login:logout(State),
    {stop, normal, State};

% 发送模块数据
handle_cast('send_init_info', State) ->
    lib_role:send_init_info(State),
    {noreply, State};

% 异步调用
handle_cast({'apply_cast', {M, F, A}}, State) ->
    catch apply(M, F, A),
    {noreply, State};
handle_cast({'apply_cast2', {M, F, A}}, State) ->
    case catch apply(M, F, [State | A]) of
        {ok, StateN} when is_record(StateN, role_state) ->
            {noreply, StateN};
        _Ret ->
            {noreply, State}
    end;

% 顶号逻辑
handle_cast({'switch', OldSid, RoleSid, LoginIp, Socket}, State) ->
    util:cancel_timer(erase(hanging_ref)),
    lib_role_agent:update(State#role_state.id, {#role_online.hanging, false}),
    StatN = bit_map:unset(?SPEC_STAT_BIT_HANGING, State#role_state.stat),
    StateT = State#role_state{sid = RoleSid, login_ip = LoginIp, socket = Socket, stat = StatN},
    lib_role_send:send_to_sid(OldSid, close),
    StateN = lib_scene_api:change_scene_restore(StateT),
    ?EVENT(State#role_state.id, 'switch'),
    {noreply, StateN};

handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

% 秒循环
handle_info('sec_interval', #role_state{sec_counter = SecCounter} = State) ->
    erlang:send_after(1000, self(), 'sec_interval'),
    NewState = lib_role:sec_interval(State#role_state{sec_counter = SecCounter + 1}),
    {noreply, NewState};

% 场景定时回存
handle_info({'scene_restore', {SceneData, Hp, _HpLim, Mp, PetData}}, State) ->
    lib_role_pet:scene_restore(PetData),
    {X, Y, ResetIndex} = SceneData,
    RoleScene = State#role_state.role_scene,
    RoleSceneN = RoleScene#role_scene{x = X, y = Y, reset_index = ResetIndex},
    StateN = State#role_state{hp = Hp, mp = Mp, role_scene = RoleSceneN},
    {noreply, StateN};

% 事件
handle_info({'event', Event}, State) ->
    NewState = lib_role:event(State, Event),
    {noreply, NewState};

% 异步模块消息
handle_info({'mod', Module, Info}, State) ->
%%    io:format("Module:[~p], Line:[~p],  Info...........:~p~n", [?MODULE, ?LINE, Info]),
    NewState = lib_role:handle_mod_info(State, Module, Info),
    {noreply, NewState};

% 增加每日计数
handle_info({'add_daily_counter', Key}, #role_state{id = RoleId} = State) ->
    lib_role_daily:add_counter(RoleId, Key, 1),
    {noreply, State};

% 杀怪处理
handle_info({'kill_mon', SceneId, MonId}, #role_state{id = RoleId, sid = RoleSid} = State) ->
    case lib_scene_api:is_normal_scene(SceneId) of
        true ->
            % 每日杀怪任务
            Key = ?KEY_DAILY_KILL_MON_COUNTER,
            CounterN = lib_role_daily:add_counter(RoleId, Key, 1),
            CounterN rem 100 =:= 0 andalso router_105:send_commonly_keyvalue(RoleSid, Key, CounterN),
            % 野外杀怪事件
            ?EVENT(RoleId, {'kill_mon', MonId}),
            ?TASK_EVENT(RoleId, {kill_mon, SceneId, MonId}),
            lib_role_mentor:is_team_with_mentor(State) andalso ?TASK_EVENT(RoleId, 'mentor_kill_mon');
        false ->
            case lib_scene_api:is_dungeon_scene(SceneId) of
                true ->
                    % 副本杀怪事件
                    ?EVENT(RoleId, {'kill_mon_in_dungeon', SceneId, MonId});
                false -> skip
            end
    end,
    {noreply, State};

%% 采集处理
handle_info({'coll_collect', Info}, #role_state{id = RoleId} = State) ->
    ?EVENT(RoleId, {'coll_collect', Info}),
    {noreply, State};

%% 被击杀
handle_info({'be_kill', SceneId, KillerId, KillerType, AtterOwnerId, KillerGuildId}, State) ->
    AtterOwnerId > 0 andalso lib_role_guild_carry:be_kill(AtterOwnerId, KillerGuildId, State),
    #role_state{murderous = Murderous, bt_data = #{declare_map:=DeclareMap}, guild_id = GuildID, level = Lv, exp = Exp} = State,
    IsNeedPunish = Murderous > 0 orelse maps:is_key(KillerId, DeclareMap),
    StateT = case IsNeedPunish of
        true -> lib_role_battle:murderous_punish(State);
        false -> State
    end,
    %% 宣战方成员被 被宣战方成员杀死掉经验
    StateN = case lib_role_guild:get_relation_type(KillerGuildId, GuildID) =:= 2 of
        true ->
            #{declare_be_kill_cost_exp := CostExp0} = conf_level:get(Lv),
            case min(CostExp0, Exp) of
                CostExp when CostExp > 0 ->
                    lib_role_assets:cost_items_notify(StateT, [{?AST_EXP, CostExp}], ?OPT_BE_KILLED);
                _ ->
                    StateT
            end;
        _ ->
            StateT
    end,
    %% 对战信息记录
    lib_role_battle:battle_log_record(StateN, SceneId, KillerId, KillerType, AtterOwnerId),
    {noreply, StateN};

%% 加杀气场景击杀玩家
handle_info({'kill_role', _DRoleId, DGuildId, DRoleName, DMurderous, IsBeDeclared, true, DHeader}, State) ->
    #role_state{guild_id = GuildId, murderous = Murderous} = State,
    IsEnemyGuild = lib_role_guild:is_enemy_guild(GuildId, DGuildId),
    IsHostileAndCarry =
        lib_role_guild:is_hostile_guild(GuildId, DGuildId) andalso
            (lib_role_guild_carry:is_carrying() orelse DHeader bsr 32 =:= ?TITLE_ID_CARRY),
    StateN = if
        IsEnemyGuild -> %% 存在帮派宣战关系
            State;
        IsHostileAndCarry -> %% 存在帮派敌对关系且至少有一方在运镖
            State;
        Murderous > -3 andalso Murderous =< 0 andalso DMurderous > 0 ->
            ?ERROR_TOC(State#role_state.id, ?RC_BATTLE_JUSTICE_CLR_MURDEROUS, [DRoleName]),
            lib_role_battle:update_murderous(State, {del, 1});
        not IsBeDeclared ->
            ?ERROR_TOC(State#role_state.id, ?RC_BATTLE_ADD_MURDEROUS, [DRoleName]),
            lib_role_battle:update_murderous(State, {add, 1});
        true ->
            State
    end,
    {noreply, StateN};
%% 不加杀气场景击杀玩家
handle_info({'kill_role', _DRoleId, _DGuildId, _DRoleName, _DMurderous, _DIsDeclared, _IsAddMurScene, _Header}, State) ->
    {noreply, State};

% 被动退出指定场景
handle_info({'passive_leave_scene', SceneId, LineId}, #role_state{role_scene = #role_scene{scene_id = SceneId, line_id = LineId}} = State) ->
    case lib_scene_api:return_scene(State) of
        {ok, StateN} ->
            {noreply, StateN};
        {error, RetCode} ->
            ?ERROR("Passive Leave Scene Failed with RC: ~p!", [RetCode]),
            {noreply, State}
    end;
% 被动退出指定场景(已经退出该场景)
handle_info({'passive_leave_scene', _SceneId, _LineId}, State) ->
    {noreply, State};

% 充值订单处理
handle_info('handle_orders', State) ->
    NewState = lib_recharge:handle_orders(State),
    % 充值数据推送
    lib_role:redirect_cmd(State#role_state.id, 10940, {get_recharge_info_req}),
    {noreply, NewState};

% 零点逻辑
handle_info('zero_hour', State) ->
    NewState = lib_role:cross_day(State),
    {noreply, NewState};

% 挂起超时，退出进程
handle_info('hanging_timeout', State) ->
    case erase(hanging_ref) of
        undefined ->
            ?INFO("RoleId: ~p, hanging is cancel before timeout !", [State#role_state.id]),
            {noreply, State};
        _ ->
            lib_login:logout(State),
            {stop, normal, State}
    end;
handle_info(Msg, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Msg]),
    {noreply, State}.

terminate(normal, _State) ->
    ok;
terminate(Reason, State) ->
    ?ERROR("Exit with Reason: ~p, precess_info: ~p", [Reason, erlang:process_info(dist:whereis_name(local, svr_mentor))]),
    lib_login:logout(State),
    ok.

code_change(_Oldvsn, State, _extra) ->
    {ok, State}.
