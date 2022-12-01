%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     玩家
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role).
-author("Ryuu").

-include("role.hrl").
-include("skill.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_105.hrl").

%% API
-export([
    event/2,
    mod_info/3,
    mod_after/3,
    cross_day/1,
    is_online/1,
    info_role/2,
    handle_cmd/3,
    apply_cast/2,
    apply_cast2/2,
    apply_call/2,
    apply_call2/2,
    apply_call3/2,
    redirect_cmd/3,
    login_init/1,
    logout_do/1,
    sec_interval/1,
    send_init_info/1,
    handle_mod_info/3,
    notify_ret_code/2,
    notify_ret_code/3,

    create_role/10,
    get_today_online/1,
    get_total_charge/1
]).


%% 需要回调的模块列表
-define(ROLE_MODULES, [
    lib_role_daily, lib_role_data, lib_role_goods, lib_role_chat, lib_role_view,
    lib_role_mail, lib_role_money, lib_role_assets, lib_role_artifact, lib_role_anqi,
    lib_role_equip, lib_role_shop, lib_role_pet, lib_role_pet_attach, lib_role_dungeon,
    lib_role_task, lib_role_func, lib_role_cache, lib_role_battle, lib_role_skill,
    lib_role_friend, lib_role_guild, lib_role_vip, lib_role_rank, lib_role_dragon,
    lib_role_activity, lib_role_surface, lib_role_hero, lib_role_circle,
    lib_role_level, lib_role_sign, lib_weekly_month_card, lib_role_marriage,
    lib_role_fashion, lib_role_title, lib_role_auction, lib_role_trans,
    lib_role_daily_thief, lib_role_master, lib_role_gather, lib_role_mentor,
    lib_role_career_battle, lib_role_team, lib_role_examine, lib_role_guild_task,
    lib_role_daily_robber, lib_role_smelt, lib_role_channel, lib_role_channel_draw,
    lib_role_guild_wine_act, lib_role_treasure_map, lib_role_guild_carry,
    lib_role_daily_lively, lib_role_kill_mon_exp, lib_role_territory, lib_role_daily_gift,
    lib_role_charge_consume, lib_role_title_honor, lib_role_online_reward,
    lib_role_grow_fund, lib_role_kill_mon_retrieve, lib_role_market, lib_role_achieve,
    lib_role_daily_task, lib_role_lv_gift, lib_role_guild_wages, lib_role_prize,
    lib_role_society, lib_role_jousts_hall, lib_role_seven_login, lib_questionnaire,
    lib_role_warrior_soul, lib_role_dividend, lib_role_exterior, lib_role_sworn,
    lib_role_vow, lib_role_firework, lib_role_dynasty_war, lib_role_setting
]).


%% Apis -----------------------------------------------------------
% @doc 事件，参数推荐使用map结构
% 升级: level_up
% 定时: {timer, Type}
% 功能开放: {func_open, FuncID}
% 副本完成事件 {finish_dung, 副本类型, 副本ID, 次数}
% 副本扫荡事件 {wipe_dung, 副本类型, 副本ID, 次数}
event(PS, Event) ->
    module_op(PS, event, [Event]).

% @doc 模块消息
mod_info(Role, Mod, Info) ->
    NewInfo = {mod, Mod, Info},
    info_role(Role, NewInfo).

% @doc 延时模块消息
mod_after(Time, Mod, Info) ->
    NewInfo = {mod, Mod, Info},
    erlang:send_after(Time, self(), NewInfo).

% @doc 跨天
cross_day(#role_state{time_data = TimeData} = PS) ->
    #time_data{login_days = LoginDays} = TimeData,
    TimeDataN = TimeData#time_data{login_days = LoginDays + 1},
    PS1 = PS#role_state{time_data = TimeDataN},
    PS2 = module_op(PS1, 'cross_day', []),
    module_op(PS2, 'send_info', []).

% @doc 是否在线
is_online(RoleID) ->
    Pid = dist:get_role_pid(RoleID),
    dist:is_process_alive(Pid) andalso not lib_role_agent:is_hanging(RoleID).

% @doc 通知玩家
info_role(RoleId, Info) when is_integer(RoleId) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) -> Pid ! Info;
        _ -> skip
    end;
info_role(RolePid, Info) when is_pid(RolePid) ->
    RolePid ! Info;
info_role(#{pid := RolePid}, Info) ->
    RolePid ! Info;
info_role(#role_state{pid = RolePid}, Info) ->
    RolePid ! Info.

% @doc 处理协议请求
handle_cmd(State, Cmd, Bin) ->
    RouterMod = prot_mod:get_router(Cmd),
    case catch RouterMod:do(Cmd, State, Bin) of
        State1 when is_record(State1, role_state) ->
            State1;
        {ok, State1} when is_record(State1, role_state) ->
            State1;
        {reply, RetData} ->
            RouterMod:response(Cmd, State, RetData),
            State;
        {reply, RetData, State1} when is_record(State1, role_state) ->
            RouterMod:response(Cmd, State1, RetData),
            State1;
        {'EXIT', R} ->
            catch ?ERROR("Cmd: ~p~nReason: ~p~nState: ~p", [Cmd, R, State]),
            State;
        _ ->
            State
    end.

%% @doc 在玩家进程执行函数 - 异步
apply_cast(RoleId, MFA) when is_integer(RoleId) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, {apply_cast, MFA});
        _ ->
            skip
    end;
apply_cast(#{pid := RolePid}, MFA) ->
    gen_server:cast(RolePid, {apply_cast, MFA}).

%% @doc 在玩家进程执行函数(把RoleState添加到Args前面) - 异步
%% 被调用的函数需要返回如下格式中的一种：
%% ok | any atom()
%% {ok, #role_state{}}
apply_cast2(RoleId, MFA) when is_integer(RoleId) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, {apply_cast2, MFA});
        _ ->
            skip
    end;
apply_cast2(#{pid := RolePid}, MFA) ->
    gen_server:cast(RolePid, {apply_cast2, MFA}).

%% @doc 在玩家进程执行函数 - 同步
%% 被调用的函数需返回如下格式中的一种：
%% Reply
%% {ok, Reply}
apply_call(RoleId, MFA) when is_integer(RoleId) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, {apply_call, MFA});
        _ ->
            skip
    end;
apply_call(#{pid := RolePid}, MFA) ->
    gen_server:call(RolePid, {apply_call, MFA}).

%% @doc 在玩家进程执行函数(把RoleState添加到Args前面) - 同步
%% 被调用的函数需要返回如下格式中的一种：
%% {ok, Reply}
%% {ok, Reply, #role_state{}}
apply_call2(RoleId, MFA) when is_integer(RoleId) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, {apply_call2, MFA});
        _ ->
            skip
    end;
apply_call2(#{pid := RolePid}, MFA) ->
    gen_server:call(RolePid, {apply_call2, MFA}).

apply_call3(RoleId, MFA) when is_integer(RoleId) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, {apply_call3, MFA});
        _ ->
            skip
    end;
apply_call3(#{pid := RolePid}, MFA) ->
    gen_server:call(RolePid, {apply_call3, MFA}).

redirect_cmd(RoleId, Cmd, MsgRecord) ->
    case dist:get_role_pid(RoleId) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, {'REDIRECT_CMD', Cmd, MsgRecord});
        _ ->
            skip
    end.

% @doc 登陆初始化，需要模块导出 init/1
login_init(#role_state{id = RoleId, sid = RoleSid} = RoleState) ->
    % 模块数据加载
    RoleStateInited = module_op(RoleState, init),

    % 模块登陆逻辑(加载完模块数据后)
    RoleStateLogin = module_op(RoleStateInited, role_login),
    RoleStateCS = correct_scene(RoleStateLogin),
    RoleStateN = lib_role_attr:refresh_combat_power(RoleStateCS),
    #role_state{accname = Accname, device = Device, role_scene = RoleScene} = RoleStateN,

    %% 更新ETS_ONLINE在线表
    RoleOnline = #role_online{
        id = RoleId, pid = self(), sid = RoleSid,
        accname = Accname, device = Device,
        name = RoleStateInited#role_state.name,
        level = RoleStateInited#role_state.level,
        scene = RoleScene#role_scene.scene_id,
        source = get_source(RoleId),
        guild_id = RoleStateInited#role_state.guild_id
    },
    svr_role_agent:online(RoleOnline),
    RoleStateN.

%% @doc 退出登陆逻辑，需要模块导出 save/1
logout_do(RoleState) ->
    % 模块登出逻辑(在数据持久化前)
    RoleStateN = module_op(RoleState, role_logout),
    module_op(RoleStateN, save),
    ok.

%% @doc 秒循环
sec_interval(#role_state{sec_counter = SecCounter} = RoleState) ->
    RoleState0 = do_per_sec(RoleState),
    RoleState1 = ?iif(SecCounter rem ?FIVE_SECONDS == 0, do_per_5sec(RoleState0), RoleState0),
    RoleState2 = ?iif(SecCounter rem ?HALF_MINUTE == 0, do_per_half_minute(RoleState1), RoleState0),
    RoleState3 = ?iif(SecCounter rem ?ONE_MINUTE == 0, do_per_minute(RoleState2), RoleState1),
    RoleState4 = ?iif(SecCounter rem ?QUARTER_HOUR == 0, do_per_quarter_hour(RoleState3), RoleState2),
    RoleState5 = ?iif(SecCounter rem ?HALF_HOUR == 0, do_per_half_hour(RoleState4), RoleState3),
    RoleState6 = ?iif(SecCounter rem ?ONE_HOUR == 0, do_per_hour(RoleState5), RoleState4),
    RoleState6.

% @doc 客户端初始化协议发送
% 客户端初始化需要的数据，由这里发送
send_init_info(PS) ->
    lib_role_func:login_send_info(PS),
    module_op(PS, send_info, []),

    % 发送充值数据
    redirect_cmd(PS#role_state.id, 10940, {get_recharge_info_req}),
    ok.

%% @doc 指定模块处理的模块消息
handle_mod_info(State, Module, Info) when is_record(State, role_state) ->
    case Module:handle_info(Info, State) of
        {ok, NewState} when is_record(NewState, role_state) ->
            NewState;
        NewState when is_record(NewState, role_state) ->
            NewState;
        _ ->
            State
    end;
handle_mod_info(State, _Module, _Info) ->
    State.

%% @doc 提示错误码 [本服]
notify_ret_code(RoleID, RetCode) ->
    notify_ret_code(RoleID, RetCode, []).

notify_ret_code(RoleID, RetCode, []) ->
    {ok, BinData} = prot_msg:encode_msg(10501, #sc_general_ret_code{code = RetCode}),
    lib_role_send:send_to_role(RoleID, BinData);
notify_ret_code(RoleID, RetCode, Args) when is_list(Args) ->
    {ok, BinData} = prot_msg:encode_msg(10502, #sc_general_ret_code_e{code = RetCode, args = Args}),
    lib_role_send:send_to_role(RoleID, BinData).

%% @doc 创建角色.
create_role(Accname, ServerId, Name, Career, Gender, Icon, Hair, Ip, Source, Device) ->
    Time = time:unixtime(),
    Fun = fun() ->
        RoleScene = #role_scene{},
        RoleId = svr_generator:gen_role_id(),
        NameBin = unicode:characters_to_binary(Name),
        lib_role_name:check_name_unique(Name),
        {BaseAttr, BtAttr} = conf_career_attr:get_attr(Career, ?INIT_LEVEL),
        BaseConverted = lib_role_attr:base_to_bt_attr(Career, BaseAttr),
        BtAttrN = lib_role_attr:add_attr(BaseConverted, BtAttr),
        #bt_attr{hp_lim = InitHp, mp_lim = InitMp} = BtAttrN,
        lib_role_db:i_role_basic(                                   % 角色基础数据
            RoleId, Accname, NameBin, Career, Gender, Icon, Hair, InitHp, InitMp,
            Time, ServerId, RoleScene
        ),
        lib_role_db:i_role_create(                                  % 角色创角数据
            RoleId, Accname, NameBin, Career, Gender, Time,
            ServerId, Source, Ip, Device
        ),
        {ok, RoleId}
    end,
    case ?DB:transaction(Fun) of
        {ok, Id} ->
            {ok, Id, Time};
        {aborted, {error, Code}} ->
            {error, Code};
        {aborted, Error} ->
            ?ERROR(
                "Create role error: Accname: ~p, Name: ~ts, Career: ~p, Gender: ~p, IP: ~p, Reason: ~p",
                [Accname, Name, Career, Gender, Ip, Error]
            ),
            {error, ?RC_FAILED}
    end.

% @doc 获得玩家今日在线时长
get_today_online(PS) ->
    #role_state{id = RoleID, time_data = TimeData} = PS,
    #time_data{last_login = LastLoginTime} = TimeData,
    TodayOnlineTimeT = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_LAST_LOGOUT_ONLINE_TIME),
    TodayOnlineTimeT + time:unixtime() - LastLoginTime.

get_total_charge(RoleID) ->
    lib_role_kv:get_counter(RoleID, ?KEY_TOTAL_RECHARGE).

%% Privates ---------------------------------------------
%% @doc 模块操作
module_op(PS, Fun) ->
    module_op(PS, Fun, []).

module_op(PS, Fun, Args) ->
    ArgNum = length(Args) + 1,
    lists:foldl(fun(Mod, Acc) ->
        case erlang:function_exported(Mod, Fun, ArgNum) of
            true ->
                case erlang:apply(Mod, Fun, [Acc | Args]) of
                    {ok, NewPS} when is_record(NewPS, role_state) -> NewPS;
                    NewPS when is_record(NewPS, role_state) -> NewPS;
                    _ -> Acc
                end;
            _ ->
                Acc
        end
    end, PS, ?ROLE_MODULES).

get_source(RoleId) ->
    Sql = <<"SELECT `source` FROM `role_create` WHERE `role_id`='~p' LIMIT 1">>,
    case ?DB:get_one(io_lib:format(Sql, [RoleId])) of
        undefined -> "unknown";
        Source -> Source
    end.

%% 修正场景
correct_scene(RoleState) ->
    #role_state{guild_id = GuildId, level = Level, role_scene = RoleScene} = RoleState,
    {SceneId, LineId, X, Y} = lib_scene_api:role_correct_scene(GuildId, Level, RoleScene),
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    RoleSceneN = RoleScene#role_scene{
        scene_id = SceneId, line_id = LineId,
        line_pid = LinePid, x = X, y = Y
    },
    RoleState#role_state{role_scene = RoleSceneN}.

% @doc 每秒钟 执行，需要导出 timer/2
do_per_sec(PS) ->
    event(PS, {'timer', 'sec'}).

% @doc 每 5秒钟 执行，需要导出 timer/2
do_per_5sec(PS) ->
    event(PS, {'timer', '5sec'}).

% @doc 每 30秒钟 执行
do_per_half_minute(PS) ->
    event(PS, {'timer', 'half_minute'}).

% @doc 每 1分钟 执行
do_per_minute(PS) ->
    event(PS, {'timer', 'one_minute'}).

% @doc 每 15分钟 执行
do_per_quarter_hour(PS) ->
    event(PS, {'timer', 'quarter_hour'}).

% @doc 每 30分钟 执行
do_per_half_hour(PS) ->
    event(PS, {'timer', 'half_hour'}).

% @doc 每 60分钟 执行
do_per_hour(PS) ->
    event(PS, {'timer', 'one_hour'}).
