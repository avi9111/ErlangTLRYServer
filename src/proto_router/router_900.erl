%%-------------------------------------------------------
%% @File     : router_900
%% @Brief    : 登录协议组
%% @Author   : cablsbs
%% @Date     : 2018-6-11
%%---------------------------------------------------------

-module(router_900).

-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_900.hrl").
-include("op_type.hrl").

-export([
    do/3,
    response/3
]).

%% Apis -------------------------------------------------
%% Req: #role_login_check_req{accname, time_stamp, ticket}
do(90000, Role, #role_login_check_req{} = Req) ->
    NowTime = time:unixtime(),
    #role_login_check_req{accname = Accname, server_id = ServerId} = Req,
    case catch basic_check(Role, Req, NowTime) of
        % 登录成功
        true ->
            MsgRecord = #role_login_check_resp{res = ?RC_SUCCEED, timestamp = NowTime},
            {ok, BinData} = prot_msg:encode_msg(90001, MsgRecord),
            lib_role_send:send_to_role(Role, BinData),
            {ok, Role#role{login_flag = 1, accname = Accname, server_id = ServerId}};
        % 断线重连
        {ok, RoleId} ->
            MsgRecord = #role_login_check_resp{res = ?RC_SUCCEED, cur_login = RoleId, timestamp = NowTime},
            {ok, BinData} = prot_msg:encode_msg(90001, MsgRecord),
            lib_role_send:send_to_role(Role, BinData),
            {ok, Role#role{accname = Accname, cur_login = RoleId, server_id = ServerId}};
        % 登录失败(换设备顶号)
        {relogin, RoleId} ->
            lib_login:stop_role(RoleId),
            MsgRecord = #role_login_check_resp{res = ?RC_FAILED, timestamp = NowTime},
            {ok, BinData} = prot_msg:encode_msg(90001, MsgRecord),
            lib_role_send:send_to_role(Role, BinData),
            ?ERROR_TOC(Role, ?RC_LINK_STATE_LOGIN_WAIT, [10]),
            {ok, Role#role{accname = Accname, login_enable = NowTime + 10}};
        % 登录失败
        {error, RetCode} ->
            ?ERROR_TOC(Role, RetCode),
            MsgRecord = #role_login_check_resp{res = ?RC_FAILED, timestamp = NowTime},
            {ok, BinData} = prot_msg:encode_msg(90001, MsgRecord),
            lib_role_send:send_to_role(Role, BinData),
            {ok, Role};
        % 登录失败(带参返回码)
        {error, RetCode, RetCodeArgs} ->
            ?ERROR_TOC(Role, RetCode, RetCodeArgs),
            MsgRecord = #role_login_check_resp{res = ?RC_FAILED, timestamp = NowTime},
            {ok, BinData} = prot_msg:encode_msg(90001, MsgRecord),
            lib_role_send:send_to_role(Role, BinData),
            {ok, Role}
    end;

%% Req: #get_role_list_req{}
do(90002, #role{login_flag = LoginFlag} = Role, #get_role_list_req{}) ->
    LoginFlag =/= 1 andalso check_kick_logined(Role#role.accname, 0),
    TransferFun = fun([RId, RegTime, Stat, Name, Gender, Level, Career, LastLogin, RolePersonalBin, DBCurAvatar]) ->
        CurAvatar = ?iif(DBCurAvatar =:= null, 0, DBCurAvatar),
        RolePersonal0 = type:bitstring_to_term(RolePersonalBin),
        #{fashion := Fashion, icon := Icon, hair := Hair} = lib_role_personal:parse_role_personal(RolePersonal0),
        StatN = ?iif(svr_role_delete:judge_del(RId), bit_map:set(?STAT_BIT_DELETE, Stat), Stat),
        #role_login_info{
            role_id = RId, name = Name, career = Career, gender = Gender, level = Level,
            fashion = Fashion, icon = Icon, hair = Hair, state = StatN, reg_time = RegTime, last_login_time = LastLogin,
            artifact = CurAvatar
        }
    end,
    RoleListRaw = lib_role_db:get_role_list(Role#role.accname, Role#role.server_id),
    RoleLoginInfos = lists:map(TransferFun, RoleListRaw),
    {ok, BinData} = prot_msg:encode_msg(90003, #get_role_list_resp{role_list = RoleLoginInfos}),
    lib_role_send:send_to_role(Role, BinData),
    {ok, Role};

%% Req: #role_name_check_req{nickname_list}
do(90004, #role{login_flag = 1, cur_login = 0} = Role, #role_name_check_req{name_list = NameListReq}) ->
    F = fun(NameReq, Acc) ->
        Name = util:escape_varchar(NameReq),
        NameStr = binary_to_list(Name),
        case catch lib_role_name:validate_name_unique(NameStr) of
            true -> [Name | Acc];
            _ -> Acc
        end
    end,
    NameListResp = lists:foldl(F, [], NameListReq),
    MsgRecord = #role_name_check_resp{name_list = NameListResp},
    {ok, BinData} = prot_msg:encode_msg(90005, MsgRecord),
    lib_role_send:send_to_role(Role, BinData),
    {ok, Role};

%% Req: #role_create_req{name, gender, career}
do(90006, #role{accname = Accname, login_flag = 1, cur_login = 0} = Role, #role_create_req{name = NameReq} = Req) when is_list(Accname), is_list(NameReq) ->
    #role_create_req{
        career = Career, gender = Gender, source = Source,
        device = Device, server_id = ServerId, icon = Icon, hair = Hair
    } = Req,
    Ip = util:get_ip(Role#role.socket),
    ChkRet = case catch create_check(Accname, Ip, Req) of
        ?RC_SUCCEED -> ?RC_SUCCEED;
        ChkRetT -> ChkRetT
    end,
    if
        ChkRet =:= ?RC_SUCCEED ->
            Name = util:escape_varchar(NameReq),
            IconN = ?iif(Icon =:= 0, 1, Icon),  %% TODO 策划没配置暂时这样处理
            case lib_role:create_role(Accname, ServerId, Name, Career, Gender, IconN, Hair, Ip, Source, Device) of
                {ok, RoleId, Time} ->
                    MsgRecord = #role_create_resp{
                        result = ?RC_SUCCEED, role_id = RoleId, role_name = Name,
                        career = Career, gender = Gender, reg_time = Time, icon = IconN, hair = Hair
                    },
                    {ok, BinData} = prot_msg:encode_msg(90007, MsgRecord),
                    lib_role_send:send_to_role(Role, BinData);
                {error, Code} -> %% 角色创建失败
                    ?ERROR_TOC(Role, Code),
                    MsgRecord = #role_create_resp{result = ?RC_FAILED, role_id = 0},
                    {ok, BinData} = prot_msg:encode_msg(90007, MsgRecord),
                    lib_role_send:send_to_role(Role, BinData)
            end;
        true ->
            ?ERROR_TOC(Role, element(2, ChkRet)),
            {ok, BinData} = prot_msg:encode_msg(90007, #role_create_resp{result = ?RC_FAILED, role_id = 0}),
            lib_role_send:send_to_role(Role, BinData)
    end,
    {ok, Role};

do(90008, #role{accname = Accname, login_flag = 1, cur_login = CurLogin} = Role, #select_role_login{} = Req) ->
    #select_role_login{
        role_id = RoleIdReq, timestamp = TimeStamp,
        ticket = Ticket, device = Device
    } = Req,
    RoleId = ?iif(CurLogin > 0, CurLogin, RoleIdReq),
    check_kick_logined(Accname, RoleId),
    case svr_role_delete:judge_del(RoleId) of
        false ->
            LoginRet = case is_encrypt_pass(RoleId, TimeStamp, Ticket) of
                true ->
                    #role{accname = Accname, socket = Socket} = Role,
                    Ip = util:get_ip(Socket),
                    %% 检查ip封禁状态
                    case svr_ban:login_check(RoleId, Ip, Device) of
                        passed -> %% 通过验证
                            case lib_login:login(start, [RoleId, Accname, Ip, Socket, Device]) of
                                {error, MLR} ->
                                    %%告诉角色登陆失败
                                    ?ERROR_TOC(Role, MLR);
                                {ok, Pid} ->
                                    %%告诉角色登陆成功, 进入逻辑处理
                                    ?ERROR_TOC(Role, ?RC_LINK_STATE_LOGIN_SUCCESS),
                                    %% 合服重名发放改名卡
                                    svr_merge:send_rename_card(RoleId),
                                    {ok, start, Role#role{id = RoleId, pid = Pid}}
                            end;
                        login_more ->
                            ?ERROR_TOC(Role, ?RC_LINK_STATE_LOGIN_MORE);            %% 登录太频繁
                        forbidall ->
                            ?ERROR_TOC(Role, ?RC_LINK_STATE_ACC_BAN);               %% 所有账号登陆都被禁止
                        forbidip ->
                            ?ERROR_TOC(Role, ?RC_LINK_STATE_IP_BAN);                %% IP被封
                        opening_entrance ->
                            ?ERROR_TOC(Role, ?RC_LINK_OPENING_ENTRANCE);            %% 服务器入口尚未开放
                        Error ->
                            ?ERROR("Login State ABNORMAL:~p", [Error]),
                            ?ERROR_TOC(Role, ?RC_LINK_STATE_INNORMAL)               %% 状态不正常
                    end;
                false ->
                    ?ERROR("Char encrypt_string failed!~nRole: ~p~nReq:~p", [Role, Req]),
                    ?ERROR_TOC(Role, ?RC_LINK_STATE_INNORMAL)                       %% 加密验证失败
            end,
            case LoginRet of
                {ok, start, RoleN} ->
                    send_login_ret(RoleN, ?RC_SUCCEED),
                    gen_server:cast(RoleN#role.pid, 'send_init_info'),
                    {ok, RoleN};
                _ ->
                    send_login_ret(Role, ?RC_FAILED),
                    {ok, Role}
            end;
        _ ->
            ?ERROR_TOC(Role, ?RC_DELETE_ROLE_IN_DELETE)
    end;

%% 心跳处理(at svr_router)
%% Req = #heart_beat_req{}
do(90009, #role{} = Role, #heart_beat_req{client_time = ClientTime}) ->
    NowMS = time:unixtime_ms(),
    MsgRecord = #heart_beat_resp{client_time = ClientTime, server_time = NowMS},
    {ok, Bin} = prot_msg:encode_msg(90010, MsgRecord),
    lib_role_send:send_to_role(Role, Bin),
    {ok, Role#role{timeout_total_num = 0}};

%% 角色重连请求 取消重连
do(90012, #role{cur_login = RoleId} = Role, #role_relogin_req{relogin = 0}) ->
    lib_login:stop_role(RoleId),
    LoginEnable = time:unixtime() + 10,
    ?ERROR_TOC(Role, ?RC_LINK_STATE_KICKING_ROLE),
    {ok, Role#role{cur_login = 0, login_enable = LoginEnable}};
%% 角色重连请求 请求重连
do(90012, Role, #role_relogin_req{}) ->
    {ok, Role#role{login_flag = 1}};
%% 删角色
do(90013, #role{accname = Accname, cur_login = CurLogin} = Role, Req) ->
    #oper_role_req{
        role_id = RoleIdReq, timestamp = TimeStamp,
        ticket = Ticket, device = Device, type = Type
    } = Req,
    RoleId = ?iif(CurLogin > 0, CurLogin, RoleIdReq),
    lib_login:stop_role(RoleId),
    case is_encrypt_pass(RoleId, TimeStamp, Ticket) of
        true ->
            #role{accname = Accname, socket = Socket} = Role,
            Ip = util:get_ip(Socket),
            %% 检查ip封禁状态
            case svr_ban:oper_check(Ip, Device) of
                true ->
                    case catch svr_role_delete:role_delete(Accname, Type, RoleId) of
                        {error, Err} ->
%%                            io:format("Module:[~p], Line:[~p],  Err...........:~p~n", [?MODULE, ?LINE, Err]),
                            ?ERROR_TOC(Role, Err);
                        _ ->
                            MsgRecord = #oper_role_resp{result = 0},
                            {ok, Bin} = prot_msg:encode_msg(90014, MsgRecord),
                            lib_role_send:send_to_role(Role, Bin),
                            {ok, Role}
                    end;
                false ->
                    ?ERROR_TOC(Role, ?RC_LINK_BAN_BY_IP);
                _ ->
                    ?ERROR_TOC(Role, ?RC_LINK_OPENING_ENTRANCE)            %% 服务器入口尚未开放
            end;
        _ ->
            ?ERROR_TOC(Role, ?RC_LINK_STATE_INNORMAL)                       %% 加密验证失败
    end;
%% 处理未定义协议
do(Cmd, Role, _MsgRecord) ->
    ?ERROR("bad login request from Accname: ~p, Cmd: ~p", [Role, Cmd, _MsgRecord]),
    {ok, Role}.

%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).


%%% Privates -------------------------------------------------------------
%% 基础检测(加密、内侧、顶号检测)
basic_check(#role{login_enable = LoginEnable} = Role, Req, NowTime) when LoginEnable < NowTime ->
    #role_login_check_req{accname = Accname, timestamp = Timestamp, ticket = TK, device = Device} = Req,
    Ip = util:get_ip(Role#role.socket),
    EncryptChk = is_encrypt_pass(Accname, Timestamp, TK),
    EncryptChk orelse throw({error, ?RC_LINK_STATE_INNORMAL}),
    case close_test_check(Ip, Accname) of
        true -> relogin_check(Accname, Device);
        CloseTestChk -> CloseTestChk
    end;
basic_check(Role, _Req, NowTime) ->
    {error, ?RC_LINK_STATE_LOGIN_WAIT, [Role#role.login_enable - NowTime]}.

%% 加密验证
is_encrypt_pass(RoleIdOrAccname, Time, TK) ->
    TICKET = config:get_ticket(),
    Hex = util:md5(lists:concat([RoleIdOrAccname, Time, TICKET])),
    Hex =:= TK.

% 顶号、重登检测 TODO
relogin_check(Accname, Device) ->
    case lib_role_agent:select({accname, Accname}) of
        [] ->
            true;
        [{RoleId, Device}] ->
            {ok, RoleId};
        [{RoleId, _DeviceOnline}] ->
            {relogin, RoleId}
    end.

%% 账号角色数量检测
role_num_check(Accname, ServerId) ->
    RoleNum = lib_role_db:get_role_num(Accname, ServerId),
    RoleNum < ?MAX_ACCOUNT_ROLE.

%% 职业性别检测
career_gender_check(Career, Gender) ->
    InitConf = conf_career_init:get_conf(Career, Gender),
    InitConf =/= undefined.

%% 头发检测检测
gender_hair_check(_Gender, 0) ->
    true;
gender_hair_check(Gender, Hair) ->
    <<ID:8, _:24>> = <<Hair:32>>,
    Conf = conf_hair_style:get({ID, Gender}),
    Conf =/= undefined.

%% 内测检测
close_test_check(Ip, Accname) ->
    case config:is_close_test() of
        true ->
            close_test_time_check(),
            CloseTestIpChk = close_test_ip_check(Ip),
            CloseTestIpChk orelse close_test_accname_check(Ip, Accname);
        false ->
            true
    end.

%% 内测开放时间检查
close_test_time_check() ->
    CloseTestTime = config:get_close_test_time(),
    ChkRet = CloseTestTime =< time:unixtime(),
    ChkRet orelse throw({error, ?RC_LINK_NOT_OPEN_CREATE_YET}).

%% 内测IP检测
% 内网通过
close_test_ip_check({192, 168, SubNet, _}) when SubNet > 0 andalso SubNet < 4 ->
    true;
% 外网过滤
close_test_ip_check(Ip) ->
    case config:get_close_test_ip() of
        [] -> true;
        IpList -> lists:member(Ip, IpList)
    end.

%% 内测账号检测
close_test_accname_check(Ip, Accname) ->
    ChkRet = case config:get_close_test_white() of
        true -> do_close_test_accname_check(Ip, Accname);
        false -> true
    end,
    ChkRet orelse throw({error, ?RC_LINK_STATE_ACC_BAN}).

do_close_test_accname_check(Ip, Accname) ->
    Sql = io_lib:format(<<"SELECT `ip` FROM `base_white_accname` WHERE binary `accname` = '~s'">>, [Accname]),
    case ?DB:get_one(Sql) of
        undefined ->
            false;
        IpRaw ->
            IpWhite = type:bitstring_to_term(IpRaw),
            IpWhite =:= all orelse IpWhite =:= Ip
    end.

%% 登陆返回
send_login_ret(Role, Ret) ->
    MsgRecord = #select_role_login_resp{result = Ret},
    {ok, Bin} = prot_msg:encode_msg(90011, MsgRecord),
    lib_role_send:send_to_role(Role, Bin).

%% 创号检测
create_check(Accname, Ip, Req) ->
    #role_create_req{career = Career, gender = Gender, server_id = ServerId, hair = Hair} = Req,
    role_num_check(Accname, ServerId) orelse throw({?RC_FAILED, ?RC_LINK_ACCOUNT_ROLE_NUM_LMT}),
    career_gender_check(Career, Gender) orelse throw({?RC_FAILED, ?RC_GENDER_CHECK_FAIL}),
    gender_hair_check(Gender, Hair) orelse throw({?RC_FAILED, ?RC_HAIR_CONF_NOT_FOUND}),
    svr_ban:create_check_ip(Ip) =:= passed orelse throw({?RC_FAILED, ?RC_LINK_BAN_BY_IP}),
    ?RC_SUCCEED.

check_kick_logined(Accname, RoleId) ->
    case lib_role_agent:select({accname, Accname}) of
        [{RRoleId, _}] when RRoleId =/= RoleId ->
            ?ERROR_TOC(RRoleId, ?RC_LINK_STATE_LOGIN_ELSEWHERE),
            lib_login:stop_role(RRoleId);
        _ ->
            skip
    end.
