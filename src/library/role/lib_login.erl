%%-------------------------------------------------------
%% @File     : lib_login
%% @Brief    : 注册登录系统
%% @Author   : Hofer_lu
%% @Date     : 2017-2-4
%%---------------------------------------------------------
-module(lib_login).

-include("role.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("ets_defines.hrl").
-include("proto/prot_900.hrl").

-export([
    login/2,
    logout/1,
    logout_close/2,
    stop_role/1,
    stop_all/0
]).


%%=====================================================================
%% 接口函数
%%=====================================================================

%% 登陆检查入口
login(start, [RoleId, Accname, LoginIp, Socket, Device]) ->
    case lib_role_db:get_role_login_by_id(RoleId) of
        [] ->
            ?ERROR(
                "RoleId: ~p login failed !! LoginIp: ~p, Socket: ~p, Device:~p",
                [RoleId, LoginIp, Socket, Device]
            ),
            {error, 0};
        [AnameBin, ?STATE_NORMAL] ->                   %% 正常
            Aname = type:object_to_list(AnameBin),
            case Aname =:= Accname of
                true ->
                    case check_role_online(RoleId) of
                        offline ->
                            % 角色不在线，直接登陆
                            login(do, [RoleId, Accname, LoginIp, Socket, Device]);
                        RolePid when is_pid(RolePid) ->
                            % 角色在线，做顶号处理
                            switch(RoleId, RolePid, Accname, LoginIp, Socket)
                    end;
                false ->
                    {error, ?RC_LINK_STATE_LOGIN_FAILED}
            end;
        [_Aname, ?STATE_BAN_IP] -> {error, ?RC_LINK_LOGIN_BAN};                     %% 封号
        [_Aname, ?STATE_BAN_ROLE] -> {error, ?RC_LINK_LOGIN_BAN};                   %% 封号
        [_Aname, ?STATE_BAN_DEVICE] -> {error, ?RC_LINK_LOGIN_BAN};                 %% 封号
        [_Aname, ?STATE_BAN_PERMANENT] -> {error, ?RC_LINK_LOGIN_BAN_PERMANENT};    %% 永久封号
        [_Aname, _] -> {error, ?RC_LINK_LOGIN_STATE_ABNORMAL}                       %% 状态不正常
    end;
%% 用户登陆
login(do, [RoleId, AccName, LoginIp, Socket, Device]) ->
    {ok, Pid} = sup_role:start_child(RoleId),
    NowTime = time:unixtime() + 1,
    case lib_role_db:update_login_data(RoleId, LoginIp, Device, NowTime) of
        ok ->
            %% 登陆启动
            case catch role_login([RoleId, AccName, Socket, NowTime, LoginIp, Device]) of
                {'EXIT', _R1} ->
                    ?ERROR("login error :~p", [_R1]),
                    {error, ?RC_LINK_STATE_LOGIN_FAILED};
                RoleState when is_record(RoleState, role_state) ->
                    #role_state{career = Career, level = Level} = RoleState,
                    sys_log:log_login(RoleId, Career, Level, LoginIp, NowTime),     %% 登陆日志
                    gen_server:call(Pid, {'login_init', RoleState}),                %% 通知其它模块初始化
                    {ok, Pid}
            end;
        _Error ->
            ?ERROR("start _Error ~p~n", [{_Error, RoleId, LoginIp, NowTime}]),
            {error, ?RC_LINK_STATE_LOGIN_FAILED}
    end;
login(_R, _S) ->
    {error, 0}.

% 顶号处理(先通知，再关闭socket，再更新角色进程的socket等)
switch(RoleId, RolePid, Accname, LoginIp, Socket) ->
    % 通知客户端账户在别处登陆
    ?ERROR_TOC(RoleId, ?RC_LINK_STATE_LOGIN_ELSEWHERE),
    timer:sleep(200),

    % 重新绑定发送进程注册名
    SendPidName = dist:role_send_process_name(RoleId),
    OldSid = dist:whereis_name(global, SendPidName),
    NewSid = start_send_msg(Accname, RoleId, Socket),
    dist:register(global, SendPidName, NewSid),

    % 通知角色进程更新信息, 并关闭旧Socket
    LoginIpStr = type:ip2str(LoginIp),
    gen_server:cast(RolePid, {'switch', OldSid, NewSid, LoginIpStr, Socket}),
    {ok, RolePid}.

%% 退出登陆
logout(Pid) when is_pid(Pid) ->
    case dist:is_process_alive(Pid) of
        true -> svr_role:stop(Pid);
        false -> skip
    end;
%% svr_role进程terminate时，调用该方法退出游戏
logout(#role_state{is_inited = true} = RoleState0) ->
    LogoutTime = time:unixtime() + 1,
    #role_state{
        id = RoleId, sid = Sid, login_ip = LoginIp, career = Career,
        level = Level, time_data = TimeData
    } = RoleState0,

    % update #time_data{}
    #time_data{last_login = LastLoginTime, total_online = TotalOnline} = TimeData,
    TotalOnlineN = TotalOnline + (LogoutTime - LastLoginTime),
    TimeDataN = TimeData#time_data{last_logout = LogoutTime, total_online = TotalOnlineN},
    update_today_online(RoleId, LastLoginTime, LogoutTime),                 % 更新玩家今日在线时长
    RoleState1 = lib_scene_api:change_scene_restore(RoleState0),            % 场景数据回存
    lib_scene_api:leave_scene(RoleId, RoleState0#role_state.role_scene),    % 场景同步删除玩家数据

    %% 玩家模块数据
    RoleState = RoleState1#role_state{time_data = TimeDataN},
    lib_role_db:save_role_basic_data(RoleState),

    %% -----------------------------------------------------
    %% 模块数据保存1 (关闭子进程之前)
    %% -----------------------------------------------------
    case catch lib_role:logout_do(RoleState) of
        ok ->
            skip;
        LogoutErr ->
            ?ERROR("RoleId: ~p logout Error: ~p !!!~nRoleState=~p~n", [RoleId, LogoutErr, RoleState])
    end,
    svr_role_agent:offline(RoleId),
    sys_log:log_logout(RoleId, Career, Level, LoginIp, TimeData#time_data.last_login, LogoutTime),

    %% 关闭消息进程
    is_pid(Sid) andalso stop_send_msg(Sid),
    ok;
logout(#role_state{id = RoleId, is_inited = false}) ->
    sys_log:log_logout(RoleId, 0, 0, "0.0.0.0", time:unixtime(), time:unixtime()),      % 登出日志
    ok;
logout(Any) ->
    ?ERROR("lib_login:logout not match Any=~p~n", [Any]).

%% tcp 连接断开，判断是否关闭角色进程
logout_close(RolePid, Socket) ->
    case gen_server:call(RolePid, {'is_switched', Socket}) of
        false -> logout(RolePid);
        true -> skip
    end.

%% 把指定角色踢下线
stop_role(RoleId) ->
    case dist:get_role_pid(RoleId) of
        undefined -> skip;
        Pid -> logout(Pid)
    end.

% 把本逻辑节点中的所有角色踢下线并禁止登录
stop_all() ->
    do_stop_all(ets:tab2list(?ETS_ONLINE)),
    ok.

%%=====================================================================
%% 内部函数
%%=====================================================================

%% 检查用户是否登陆了
check_role_online(RoleId) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) -> Pid;
        _ -> offline
    end.

%% 让所有角色自动退出
do_stop_all([]) ->
    ok;
do_stop_all([H | T]) ->
    % 关闭socket
    lib_role_send:send_to_role(H, close),
    logout(H#role_online.pid),
    timer:sleep(20),
    do_stop_all(T).

%% 游戏服务器登陆
role_login([RoleId, AccName, Socket, NowTime, IpData, Device]) ->
    LoginIp = type:ip2str(IpData),
    ServerNum = config:get_server_num(),

    %% 角色表数据加载 查询role_basic表
    [
        LastLogoutTime, TotalOnline, LoginDays, ServerId,
        Name, Career, Gender, LastUpgradeLv, FirstRecharge,
        Hp, Mp, Level, Exp, Murderous, ClrMurCounter,
        SkillListBin, RolePersonalBin, RoleSceneBin
    ] = lib_role_db:get_role_basic_data(RoleId),

    %% 启动Socket托管进程
    SendPidName = dist:role_send_process_name(RoleId),
    Sid = start_send_msg(AccName, RoleId, Socket),
    dist:register(global, SendPidName, Sid),

    RolePersonal0 = type:bitstring_to_term(RolePersonalBin),
    RolePersonal = lib_role_personal:parse_role_personal(RolePersonal0),
    SkillList0 = type:bitstring_to_term(SkillListBin),
    SkillList = lib_role_skill:parse_skill_list(SkillList0),

    % 场景
    RoleScene0 = type:bitstring_to_term(RoleSceneBin),
    RoleScene = parse_role_scene(RoleScene0),

    %% 统计登录天数
    LoginDaysN = update_login_days(LoginDays, LastLogoutTime),
    TimeData = #time_data{
        last_upgrade_lv = LastUpgradeLv,
        last_login = NowTime,
        last_logout = LastLogoutTime,
        total_online = TotalOnline,
        login_days = LoginDaysN,
        first_recharge = FirstRecharge
    },

    %% 设置svr_role 状态
    RoleState = #role_state{
        id = RoleId,
        socket = Socket,
        sid = Sid,
        server_num = ServerNum,
        server_id = ServerId,
        accname = AccName,
        login_ip = LoginIp,
        device = Device,
        name = Name,
        career = Career,
        gender = Gender,
        hp = ?iif(Hp =< 0, 100, Hp),
        mp = ?iif(Mp =< 0, 100, Mp),
        level = Level,
        exp = Exp,
        murderous = Murderous,
        clr_mur_counter = ClrMurCounter,
        role_scene = RoleScene,
        skill_list = SkillList,
        personal = RolePersonal,
        time_data = TimeData
    },
    RoleState.


%% Privates --------------------------------------------------
update_login_days(LoginDays, LastLogoutTime) ->
    case time:is_today(LastLogoutTime) of
        true -> LoginDays;
        false -> LoginDays + 1
    end.

update_today_online(RoleID, LastLoginTime, LogoutTime) ->
    LastLogoutOnlineTime = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_LAST_LOGOUT_ONLINE_TIME),
    AddOnlineTime =
    case time:is_today(LastLoginTime) of
        true ->
            LogoutTime - LastLoginTime;
        _ ->
            LogoutTime - time:unixdate()
    end,
    TodayOnlineTime = LastLogoutOnlineTime + AddOnlineTime,
    lib_role_kv:set_kv(RoleID, ?KEY_DAILY_LAST_LOGOUT_ONLINE_TIME, TodayOnlineTime).

parse_role_scene({role_scene, 1, SceneId, LineId, LinePid, Mode, X, Y, OldScene, ResetIndex}) ->
    parse_role_scene({role_scene, 2, SceneId, LineId, LinePid, Mode, 0, X, Y, OldScene, ResetIndex});
parse_role_scene(#role_scene{ver = ?ROLE_SCENE_VER} = RoleScene) ->
    RoleScene;
parse_role_scene(_) ->
    #role_scene{}.

%% 开启消息发送进程
start_send_msg(AccName, RoleId, Socket) ->
    spawn_link(fun() ->
        put(accname, AccName),
        put(role_id, RoleId),
        send_msg(Socket)
    end).

%% 关闭消息发送进程
stop_send_msg(Sid) ->
    exit(Sid, kill).

% 发送消息进程
send_msg(Socket) ->
    receive
        {send, close} ->
            gen_tcp:close(Socket),
            ok;
        {send, Bin} ->
            prot_debug:print_sent_prots(Bin),
            case erlang:port_command(Socket, Bin, [force]) of
                true ->
                    send_msg(Socket);
                Ex ->
                    ?ERROR("port_command ex:~p ~n", [Ex]),
                    send_msg(Socket)
            end;
        stop ->
            gen_tcp:close(Socket),
            ok;
        _ ->
            send_msg(Socket)
    end.
