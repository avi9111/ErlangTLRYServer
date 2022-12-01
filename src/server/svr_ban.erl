%%-------------------------------------------------------
%% @File     : svr_ban
%% @Brief    : 角色禁止(封)管理  RoleState:也记录角色的登陆IP
%% @Author   : xyj
%% @Date     : 2015-1-6
%%---------------------------------------------------------
-module(svr_ban).

-include("role.hrl").
-include("common.hrl").

-behaviour(gen_server).

-export([
    start_link/0,           %% 启动 ban server
    open_entrance_delay/1,  %% 延时开放入口(所有普通场景加载完才开放入口)
    close_entrance/0,       %% 关闭入口

    white_ip/1,             %% 添加白名单IP
    unwhite_ip/1,           %% 解除白名单IP
    ban_ip/1,               %% 添加禁止的IP(后台用)
    unban_ip/1,             %% 取消一个IP的禁止(后台用)
    ban_device/1,           %% 添加禁止的Device(后台用)
    unban_device/1,         %% 取消一个Device的禁止(后台用)
    ban_role/1,             %% 封禁玩家(后台用)
    ban_role/2,             %% 封禁玩家,指定State(后台用)
    unban_role/1,           %% 解封玩家(后台用)
    ban_roles/1,            %% 封禁角色登陆(后台用)
    ban_roles/2,            %% 封禁角色登陆指定State(后台用)
    unban_roles/1,          %% 解除角色封禁的禁止(后台用)
    check_white/1,          %% 检查ip是否在白名单中
    login_check/3,          %% 角色登录时检查IP状态
    create_check_ip/1,      %% 创角ip检测
    oper_check/2,           %% 删角色检测
    gm_print_all/0          %% 打印出黑白名单到错误日志中
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-define(BAN_IP, 1).
-define(WHITE_IP, 2).
-define(BAN_DEVICE, 3).

-record(ban_st, {
    is_open = false,                %% 是否开放
    role_ip_dict = dict:new(),      %% 角色的IP字典(Key:Id,Value:Ip列表)
    role_device_dict = dict:new(),  %% 角色的IP字典(Key:Id,Value:Device列表)
    ban_ip_list = sets:new(),       %% 被禁止的IP列表
    ban_device_list = sets:new(),   %% 被禁止的设备列表
    white_list = sets:new()         %% IP 白名单
}).


%% Apis -----------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

open_entrance_delay(Delay) ->
    erlang:send_after(Delay, ?MODULE, 'open_entrance').

close_entrance() ->
    call('close_entrance').

%% @doc 添加白名单IP
white_ip(IpStr) ->
    Ip = type:ip2bin(IpStr),
    ?ERROR("white ip ~s~n", [Ip]),
    call({white_ip, Ip}).

%% @doc 解禁IP
unwhite_ip(IpStr) ->
    Ip = type:ip2bin(IpStr),
    ?ERROR("unwhite ip ~s~n", [Ip]),
    call({unwhite_ip, Ip}).

%% @doc 添加禁止的IP
ban_ip(IpStr) ->
    Ip = type:ip2bin(IpStr),
    ?ERROR("ban ip ~s~n", [Ip]),
    call({ban_ip, Ip}).

%% @doc 解禁IP
unban_ip(IpStr) ->
    Ip = type:ip2bin(IpStr),
    ?ERROR("unban ip ~s~n", [Ip]),
    call({unban_ip, Ip}).

%% @doc 添加禁止的device
ban_device(DeviceStr) ->
    Device = list_to_binary(DeviceStr),
    call({ban_device, Device}).

%% @doc 解禁device
unban_device(DeviceStr) ->
    Device = list_to_binary(DeviceStr),
    call({unban_device, Device}).

%% @doc 禁止单个角色
ban_role(RoleID) ->
    call({ban_roles, [RoleID]}).

%% @doc 禁止单个角色(指定State)
ban_role(RoleID, State) ->
    call({ban_roles, [RoleID], State}).

%% @doc 解禁单个角色
unban_role(RoleID) ->
    call({unban_roles, [RoleID]}).

%% @doc 禁止多角色登录
ban_roles(IdList) ->
    call({ban_roles, IdList}).

%% @doc 禁止多角色登录(指定State)
ban_roles(IdList, State) ->
    call({ban_roles, IdList, State}).

%% @doc 解禁多角色登录
unban_roles(IdList) ->
    call({unban_roles, IdList}).

%% @doc 检查ip是否在白名单中
%% @param 角色IP地址
%% @return true | false
check_white(IpStr) ->
    Ip = type:ip2bin(IpStr),
    call({check_white, Ip}).

%% @doc 角色登录时检查IP状态
login_check(Id, Ip, Device) ->
    call({login_check, Id, Ip, Device}).

%% @doc 角色注册时检查IP状态
create_check_ip(Ip) ->
    call({create_check_ip, Ip}).

%% @doc 删角色检查ip状态
oper_check(Ip, Device) ->
    call({oper_check, Ip, Device}).

%% @doc 打印数据到错误日志中
gm_print_all() ->
    call(print_all).


%% Callbacks --------------------------------------------
init([]) ->
    State = init_state(),
    {ok, State}.

% 入口已开放
handle_call({login_check, Id, Ip, Device}, _From, #ban_st{is_open = true} = State) ->
    {Reply, NewState} = private_check(Id, Ip, Device, State),
    {reply, Reply, NewState};
% 入口未开放
handle_call({login_check, _Id, _Ip, _Device}, _From, State) ->
    {reply, opening_entrance, State};

% ip限制
handle_call({create_check_ip, Ip}, _From, State) ->
    Ip2 = type:ip2bin(Ip),
    Reply = case sets:is_element(Ip2, State#ban_st.ban_ip_list) of
        true -> forbidip;
        false -> passed
    end,
    {reply, Reply, State};

handle_call({check_white, Ip}, _From, State) ->
    Reply = sets:is_element(Ip, State#ban_st.white_list),
    {reply, Reply, State};

handle_call({ban_ip, Ip}, _From, State) ->
    {Reply, NewState} = private_ban_ip(Ip, State),
    {reply, Reply, NewState};

handle_call({unban_ip, Ip}, _From, State) ->
    {Reply, NewState} = private_unban_ip(Ip, State),
    {reply, Reply, NewState};

handle_call({white_ip, Ip}, _From, State) ->
    {Reply, NewState} = private_white_ip(Ip, State),
    {reply, Reply, NewState};

handle_call({unwhite_ip, Ip}, _From, State) ->
    {Reply, NewState} = private_unwhite_ip(Ip, State),
    {reply, Reply, NewState};

handle_call({ban_device, Device}, _From, State) ->
    {Reply, NewState} = private_ban_device(Device, State),
    {reply, Reply, NewState};

handle_call({unban_device, Device}, _From, State) ->
    {Reply, NewState} = private_unban_device(Device, State),
    {reply, Reply, NewState};

handle_call({ban_roles, IdList}, _From, State) ->
    private_ban_roles(IdList),
    {reply, ok, State};

handle_call({ban_roles, IdList, Reason}, _From, State) ->
    private_ban_roles(IdList, Reason),
    {reply, ok, State};

handle_call({unban_roles, IdList}, _From, State) ->
    private_unban_roles(IdList),
    {reply, ok, State};
handle_call({'oper_check', Ip, Device}, _From, State = #ban_st{ban_ip_list = IpSets, ban_device_list = DeviceSets, is_open = true}) ->
    Ip2 = type:ip2bin(Ip),
    Reply = not (sets:is_element(Ip2, IpSets) orelse sets:is_element(Device, DeviceSets)),
    {reply, Reply, State};
% 入口未开放
handle_call({oper_check, _Ip, _Device}, _From, State) ->
    {reply, opening_entrance, State};
handle_call(print_all, _From, _State) ->
    NewState = init_state(),
    #ban_st{ban_ip_list = BanIpList, white_list = WhiteList} = NewState,
    ?ERROR("svr_ban print white = ~p~n", [sets:to_list(WhiteList)]),
    ?ERROR("svr_ban print black = ~p~n", [sets:to_list(BanIpList)]),
    {reply, ok, NewState};

% 同步关入口
handle_call('close_entrance', _From, State) ->
    StateN = State#ban_st{is_open = false},
    {reply, ok, StateN};
handle_call(_, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

% 异步开入口
handle_info('open_entrance', State) ->
    StateN = State#ban_st{is_open = true},
    {noreply, StateN};

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------------
%% @doc 同步调用
call(Msg) ->
    gen_server:call(?MODULE, Msg, 5000).

%% @doc 初始化状态数据
init_state() ->
    BlackList = sets:from_list(db_ban_get(?BAN_IP)),
    BlackDevList = sets:from_list(db_ban_get(?BAN_DEVICE)),
    WhiteList = sets:from_list(db_ban_get(?WHITE_IP)),
    #ban_st{
        role_ip_dict = dict:new(),
        role_device_dict = dict:new(),
        ban_ip_list = BlackList,
        ban_device_list = BlackDevList,
        white_list = WhiteList
    }.

%% @doc 登录检查角色状态
private_check(Id, Ip, Device, State) ->
    Time = time:unixtime(),
    LoginSate = case get({login_time, Id}) of
        undefined -> true;
        Lasetime -> Time - Lasetime > 1
    end,
    case LoginSate of
        true ->
            %% 登陆成功记录下时间
            put({login_time, Id}, Time),

            Ip2 = type:ip2bin(Ip),
            Device2 = list_to_binary(Device),
            case sets:is_element(Ip2, State#ban_st.white_list) of
                true -> %% ip在白名单中
                    NewRoleIpDict = dict:store(Id, Ip2, State#ban_st.role_ip_dict),
                    {passed, State#ban_st{role_ip_dict = NewRoleIpDict}};
                false ->
                    case sets:is_element(Ip2, State#ban_st.ban_ip_list) of
                        true -> %% ip在黑名单中
                            {forbidip, State};
                        false ->
                            case sets:is_element(Device2, State#ban_st.ban_device_list) of
                                true -> %% device在黑名单中
                                    {forbidip, State};
                                false ->
                                    NewRoleIpDict = dict:store(Id, Ip2, State#ban_st.role_ip_dict),
                                    NewRoleDevDict = dict:store(Id, Device2, State#ban_st.role_device_dict),
                                    {passed, State#ban_st{role_ip_dict = NewRoleIpDict, role_device_dict = NewRoleDevDict}}
                            end
                    end
            end;
        false -> %% 登陆过于频繁
            {login_more, State}
    end.

%% @doc 添加白名单IP(不会立刻处理,只在下次登录或建立帐号的时候生效)
private_white_ip(Ip, State) when is_binary(Ip) ->
    private_white_ip([Ip], State);
private_white_ip(IpList, State) when is_list(IpList) ->
    #ban_st{white_list = WhiteList} = State,
    Fun = fun(Ip, Acc) ->
        db_ban_put(?WHITE_IP, Ip),
        sets:add_element(Ip, Acc)
    end,
    NewIpList = lists:foldl(Fun, WhiteList, IpList),
    {ok, State#ban_st{white_list = NewIpList}}.

%% @doc 删除白名单IP(不会立刻处理,只在下次登录或建立帐号的时候生效)
private_unwhite_ip(Ip, State) when is_binary(Ip) ->
    private_unwhite_ip([Ip], State);
private_unwhite_ip(IpList, State) when is_list(IpList) ->
    #ban_st{white_list = WhiteList} = State,
    Fun = fun(Ip, Acc) ->
        db_ban_del(?WHITE_IP, Ip),
        sets:del_element(Ip, Acc)
    end,
    NewWhiteList = lists:foldl(Fun, WhiteList, IpList),
    {ok, State#ban_st{white_list = NewWhiteList}}.

%% @doc 添加禁止的IP
private_ban_ip(Ip, State) when is_binary(Ip) ->
    private_ban_ip([Ip], State);
private_ban_ip(IpList, State) when is_list(IpList) ->
    #ban_st{ban_ip_list = BanIpList} = State,
    Fun = fun(Ip, Acc) ->
        erlang:spawn(fun() -> private_kick_out_role(Ip, State) end),
        sets:add_element(Ip, Acc)
    end,
    NewBanIpList = lists:foldl(Fun, BanIpList, IpList),
    {ok, State#ban_st{ban_ip_list = NewBanIpList}}.

%% @doc 解禁IP
private_unban_ip(Ip, State) when is_binary(Ip) ->
    private_unban_ip([Ip], State);
private_unban_ip(IpList, State) when is_list(IpList) ->
    #ban_st{ban_ip_list = BanIpList} = State,
    Fun = fun(Ip, Acc) ->
        db_ban_login_ip(Ip, ?STATE_NORMAL),
        db_ban_del(?BAN_IP, Ip),
        sets:del_element(Ip, Acc)
    end,
    NewBanIpList = lists:foldl(Fun, BanIpList, IpList),
    {ok, State#ban_st{ban_ip_list = NewBanIpList}}.

%% @doc 添加禁止的device
private_ban_device(Device, State) when is_binary(Device) ->
    private_ban_device([Device], State);
private_ban_device(DevList, State) when is_list(DevList) ->
    #ban_st{ban_device_list = BanDevList} = State,
    Fun = fun(Device, Acc) ->
        erlang:spawn(fun() -> private_kick_out_role_by_device(Device, State) end),
        sets:del_element(Device, Acc)
    end,
    NewBanDevList = lists:foldl(Fun, BanDevList, DevList),
    {ok, State#ban_st{ban_device_list = NewBanDevList}}.

%% @doc 解禁device
private_unban_device(Device, State) when is_binary(Device) ->
    private_unban_device([Device], State);
private_unban_device(DevList, State) when is_list(DevList) ->
    #ban_st{ban_device_list = BanDevList} = State,
    Fun = fun(Device, Acc) ->
        db_ban_del(?BAN_DEVICE, Device),
        sets:del_element(Device, Acc)
    end,
    NewBanDevList = lists:foldl(Fun, BanDevList, DevList),
    {ok, State#ban_st{ban_device_list = NewBanDevList}}.

%% @doc 封禁多角色
private_ban_roles(IdList) ->
    F = fun(Id) ->
        erlang:spawn(fun() ->
            lib_login:stop_role(Id),
            lib_role_db:set_role_state(Id, ?STATE_BAN_ROLE)
        end)
    end,
    [F(Value) || Value <- IdList].

%% @doc 封禁多角色, 指定State
private_ban_roles(IdList, State) ->
    F = fun(Id) ->
        erlang:spawn(fun() ->
            lib_login:stop_role(Id),
            lib_role_db:set_role_state(Id, State)
        end)
    end,
    [F(Value) || Value <- IdList].

%% @doc 解禁角色
private_unban_roles(IdList) ->
    [lib_role_db:set_role_state(Id, ?STATE_NORMAL) || Id <- IdList].

%% @doc 插入数据并把角色踢下线(根据IP)
private_kick_out_role(Ip, State) ->
    db_ban_login_ip(Ip, ?STATE_BAN_IP),
    db_ban_put(?BAN_IP, Ip),
    dict:map(fun(Key, Value) ->
        case Value == Ip of
            true ->
                lib_login:stop_role(Key),
                timer:sleep(200);
            false ->
                skip
        end
    end, State#ban_st.role_ip_dict).

%% @doc 插入数据并把角色踢下线(根据Device)
private_kick_out_role_by_device(Device, State) ->
    db_ban_login_device(Device, ?STATE_BAN_DEVICE),
    db_ban_put(?BAN_DEVICE, Device),
    dict:map(fun(Key, Value) ->
        case Value =:= Device of
            true ->
                lib_login:stop_role(Key),
                timer:sleep(200);
            false ->
                skip
        end
    end, State#ban_st.role_device_dict).

%% @doc 获取一个类型的禁止数据
db_ban_get(Type) ->
    SQL = io_lib:format("SELECT `value` FROM `ban_info` WHERE `type` = ~p", [Type]),
    case ?DB:get_all(SQL) of
        [] -> [];
        D -> [Dv || [Dv] <- D]
    end.

%% @doc 更改指定IP的角色的数据库
db_ban_login_ip(Ip, Type) ->
    IpStr = binary_to_list(Ip),
    SQL = io_lib:format("UPDATE `role_basic` SET `state`=~p WHERE `last_login_ip`='~s', and state != ~p", [Type, IpStr, ?STATE_BAN_PERMANENT]),
    ?DB:execute(SQL).

%% @doc 更改指定设备id的角色的数据库
db_ban_login_device(Device, Type) ->
    DeviceStr = binary_to_list(Device),
    SQL = io_lib:format("UPDATE `role_basic` SET `state`=~p WHERE `device`='~s' and state != ~p", [Type, DeviceStr, ?STATE_BAN_PERMANENT]),
    ?DB:execute(SQL).

%% @doc 插入一条新的规则
db_ban_put(Type, Ip) ->
    IpStr = binary_to_list(Ip),
    SQL = io_lib:format("INSERT INTO `ban_info`(`type`, `value`) VALUES (~p, '~s')", [Type, IpStr]),
    ?DB:execute(SQL),
    ok.

%% @doc 删除一条规则(指定类型 1 封号 2 白名单 3 封设备)
db_ban_del(Type, Ip) ->
    IpStr = binary_to_list(Ip),
    SQL = io_lib:format("DELETE FROM `ban_info` WHERE `type`=~p AND `value`='~s'", [Type, IpStr]),
    ?DB:execute(SQL),
    ok.
