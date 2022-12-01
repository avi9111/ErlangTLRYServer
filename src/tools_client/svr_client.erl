%%-------------------------------------------------------
%% @File     : svr_client
%% @Brief    : 测试客户端
%% @Author   : cablsbs
%% @Date     : 2018-6-15
%%---------------------------------------------------------
-module(svr_client).

-behaviour(gen_server).

-include("log.hrl").
-include("scene.hrl").

-export([
    presure_test_start/2,   % 开始压测
    presure_test_stop/1,    % 停止压测
    start_link/2,           % 开启客户端
    get_pid/1,              % 获取 client 进程id
    info_after/3            % 发送延时消息
]).

-export([
    call/2,
    cast/2,
    create/4,           % 创号
    login/1,            % 登陆游戏
    login/2,            % 一键登录(开启客户端，登陆，加载场景)
    send_req/3,         % 发送请求
    logout/1,           % 退出登陆
    enter_scene/2,      % 切换场景
    enter_scene_info/1, % 请求场景信息
    load_scene/2,       % 加载场景
    send_heart_beat/1,  % 发送心跳
    attack/4            % 攻击
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-define(PROTO_HEART_BEAT, 90009).           % TCP心跳包协议号

-define(CLI_TCP_OPT, [                      % 客户端tcp连接选项
    binary,
    {packet, raw},
    {active, false},
    {reuseaddr, true},
    {nodelay, false},
    {delay_send, true},
    {send_timeout, 10000},
    {keepalive, true},
    {exit_on_close, true}
]).

-record(state, {
    cli_id = 0,
    role_id = 0,
    scene_id = 0,
    cur_pos = {0, 0},
    cur_dest = {0, 0},
    reset_index = 0,
    server_id = 0,
    accname = undefined,
    sock = undefined,
    recv_pid = undefined,
    recv_list = [],
    sent_list = []
}).

% @doc 开始压测
% @spec presure_test_start(SceneId, Num) -> ok.
presure_test_start(_SceneId, Num) ->
    CreateFun = fun(CliId) ->
        Accname = gen_accname(CliId),
        supervisor:start_child(sup_client, [CliId, Accname]),
        util:sleep(util:rand(10, 30)),
        cast(CliId, 'connect')
    end,
    [spawn(fun() -> CreateFun(CliId) end) || CliId <- lists:seq(1, Num)],
    ok.

% @doc 停止压测
% @spec presure_test_stop(Num) -> ok.
presure_test_stop(Num) ->
    [logout(CliId) || CliId <- lists:seq(1, Num)],
    ok.

% @doc 启动并登陆
login(CliId, RoleId) when is_integer(RoleId) ->
    supervisor:start_child(sup_client, [CliId, CliId]),
    call(CliId, {'connect', RoleId});
login(CliId, Accname) ->
    supervisor:start_child(sup_client, [CliId, Accname]),
    call(CliId, {'connect', 0}).


call(CliId, Msg) when is_pid(CliId) ->
    gen_server:call(CliId, Msg);
call(CliId, Msg) ->
    gen_server:call(get_pid(CliId), Msg).
% @doc 创建 client 进程
% @spec start_link([CliId, Accname]) -> ok.
% AccName   :: string
% CliId     :: atom() or integer() is better
start_link(CliId, Accname) ->
    config:is_release() andalso gen_server:start_link({global, {cli, CliId}}, ?MODULE, [CliId, Accname], []).

% @doc 获取client pid
get_pid(CliId) ->
    dist:whereis_name(global, {cli, CliId}).

% @doc 发送延时消息
info_after(CliId, Msg, After) ->
    erlang:send_after(After, get_pid(CliId), Msg).

% @doc 创角
create(CliId, Name, Career, Gender) ->
    cast(CliId, {'create', Name, Career, Gender}).

% @doc 登陆
login(CliId) ->
    call(CliId, 'login').

% @doc 发送协议
send_req(Pid, ProtNum, Bin) when is_pid(Pid) ->
    gen_server:cast(Pid, {'send_req', ProtNum, Bin});
send_req(CliId, ProtNum, Bin) ->
    cast(CliId, {'send_req', ProtNum, Bin}).

% @doc 登出并退出
logout(CliId) ->
    cast(CliId, 'logout').

% @doc 切场景
enter_scene(CliId, SceneId) ->
    send_req(CliId, 90208, <<SceneId:32>>).

% @doc 请求场景信息
enter_scene_info(CliId) ->
    send_req(CliId, 90100, <<>>).

% @doc 加载场景
load_scene(CliId, SceneId) ->
    cast(CliId, {'load_scene', SceneId}).

% @doc 发送心跳
send_heart_beat(CliId) ->
    info(CliId, 'send_heart_beat').

% @doc 发动攻击
attack(CliId, {DeferType, DeferId}, SkillId, {AssistX, AssistY}) ->
    Req = <<DeferType:8, DeferId:64, SkillId:32, AssistX:16, AssistY:16>>,
    send_req(CliId, 90300, Req).


%% callbacks --------------
init([CliId, Accname]) ->
    ServerId = config:get_server_num(),
    {ok, #state{cli_id = CliId, server_id = ServerId, accname = Accname}}.


% 登陆
handle_call('login', _From, State) ->
    #state{accname = Accname, server_id = ServerId} = State,
    case lib_role_db:get_role_list(Accname, ServerId) of
        [[RoleId | _] = Role | _] ->
            ?INFO("RoleId: ~p login !", [Role]),
            Time = time:unixtime(),
            TicketBin = gen_encrypted_ticket(RoleId, Time),
            DeviceBin = prot_util:pack("device", string),
            LoginReqBin = <<RoleId:64, Time:32, TicketBin/binary, DeviceBin/binary>>,
            StateT = do_send_req(90008, LoginReqBin, State),
            StateN = StateT#state{role_id = RoleId},
            {reply, ok, StateN};
        _ ->
            CliId = State#state.cli_id,
            Name = case is_integer(CliId) of
                true ->
                    lists:concat(["robotNo_", Accname, "_", CliId]);
                _ ->
                    CliId
            end,
            {Career, Gender} = rand_career_gender(),
            create(CliId, Name, Career, Gender),
            {reply, ok, State}
    end;
handle_call({'connect', RoleID}, _From, State) ->
    #state{cli_id = CliId, accname = Accname} = State,
    Ip = config:get_test_ip(),
    Port = config:get_test_port(),
    ServerId = config:get_test_server_id(),
    {ok, Sock} = gen_tcp:connect(Ip, Port, ?CLI_TCP_OPT),
    {ok, RecvPid} = start_client_recv(CliId, Sock, Accname, ServerId, RoleID),
    Time = time:unixtime(),
    AccnameBin = prot_util:pack(Accname, string),
    DeviceBin = prot_util:pack("device", string),
    TicketBin = gen_encrypted_ticket(Accname, Time),
    LoginCheckReqBin = <<
        AccnameBin/binary,
        ServerId:32,
        Time:32,
        TicketBin/binary,
        DeviceBin/binary
    >>,
    CliPid = self(),
    send_req(CliPid, 90000, LoginCheckReqBin),
    {reply, ok, State#state{sock = Sock, recv_pid = RecvPid, server_id = ServerId}};
handle_call(_Msg, _From, State) ->
    {reply, reply, State}.

%%% 连接并验证
%%handle_cast('connect', State) ->
%%    #state{cli_id = CliId, accname = Accname, server_id = ServerId} = State,
%%    IpStr = config:get_server_ip(),
%%    Port = config:get_server_port(),
%%    {ok, Sock} = gen_tcp:connect(IpStr, Port, ?CLI_TCP_OPT),
%%    {ok, RecvPid} = start_client_recv(CliId, Sock, Accname),
%%    Time = time:unixtime(),
%%    AccnameBin = prot_util:pack(Accname, string),
%%    DeviceBin = prot_util:pack("device", string),
%%    TicketBin = gen_encrypted_ticket(Accname, Time),
%%    LoginCheckReqBin = <<
%%        AccnameBin/binary,
%%        ServerId:32,
%%        Time:32,
%%        TicketBin/binary,
%%        DeviceBin/binary
%%    >>,
%%    CliPid = self(),
%%    send_req(CliPid, 90000, LoginCheckReqBin),
%%    {noreply, State#state{sock = Sock, recv_pid = RecvPid}};

% 创角
%%handle_cast({'create', Name, Career, Gender}, State) ->
%%    #state{cli_id = CliId, accname = Accname, server_id = ServerId} = State,
%%    ?INFO("Create role in account: ~p, server: ~p", [Accname, ServerId]),
%%    case lib_role_db:get_role_list(Accname, ServerId) of
%%        [[RoleId | _] | _] ->
%%            ?INFO("Create failed, already has Role: ~p, Login instead !", [RoleId]),
%%            login(CliId),
%%            {noreply, State};
%%        _ ->
%%            NameBinary = unicode:characters_to_binary(Name),
%%            NameStr = binary_to_list(NameBinary),
%%            NameBin = prot_util:pack(NameStr, string),
%%            SourceBin = prot_util:pack("source", string),
%%            DeviceBin = prot_util:pack("device", string),
%%            Icon = gen_role_icon(Gender),
%%            HairId = util:list_rand(conf_hair_style:get_by_sex(Gender)),
%%            Hair = HairId bsl 24,
%%            CreateReq = <<
%%                NameBin/binary, Gender:8, Career:8, Icon:16, Hair:32,
%%                SourceBin/binary, DeviceBin/binary, ServerId:32
%%            >>,
%%            StateN = do_send_req(90006, CreateReq, State),
%%            {noreply, StateN}
%%    end;

% 发送请求
handle_cast({'send_req', ProtNum, Bin}, State) ->
    StateN = do_send_req(ProtNum, Bin, State),
    {noreply, StateN};

% 退出客户端
handle_cast('logout', State) ->
    gen_tcp:close(State#state.sock),
    supervisor:terminate_child(sup_client_recv, State#state.recv_pid),
    {stop, normal, State};

% 加载场景并开始移动
handle_cast({'load_scene', SceneId}, #state{} = State) ->
    StateT = do_send_req(90207, <<>>, State),
    StateN = StateT#state{scene_id = SceneId},
%%    After = util:rand(3000, 6000),
%%    erlang:send_after(After, self(), 'role_walk'),
    {noreply, StateN};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info('send_heart_beat', State) ->
    Now = time:unixtime(),
    StateN = do_send_req(?PROTO_HEART_BEAT, <<Now:32>>, State),
    {noreply, StateN};

handle_info('role_walk', State) ->
    #state{
        role_id = RoleId, scene_id = SceneId,
        cur_pos = {CX, CY}, cur_dest = {DX, DY},
        reset_index = ResetIndex
    } = State,
    WalkReqBin = <<
        SceneId:32, RoleId:64,
        CX:16, CY:16, DX:16, DY:16,
        ?MT_WALK:8, ResetIndex:16
    >>,
    StateN = do_send_req(?PROTO_HEART_BEAT, WalkReqBin, State),
    {noreply, StateN};

handle_info(_Msg, State) ->
    {noreply, State}.


terminate(_Reason, _State) ->
%%    ?DEBUG("Client: ~p Exit", [State#state.role_id]),
    ok.


code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% Privates ----------------------------------------------
gen_accname(Idx) ->
    AccnamePrefix = "robot_",
    lists:concat([AccnamePrefix, Idx]).

rand_career_gender() ->
    CGList = [
        {1, 1}, {2, 1},
        {3, 2}, {4, 2}
    ],
    util:list_rand(CGList).

start_client_recv(CliId, Sock, Accname, ServerId, RoleID) ->
    {ok, RecvPid} = supervisor:start_child(sup_client_recv, [CliId, Sock, Accname, ServerId, RoleID]),
    ok = gen_tcp:controlling_process(Sock, RecvPid),
    RecvPid ! {ok, Sock},
    {ok, RecvPid}.

info(CliId, Msg) ->
    erlang:send(get_pid(CliId), Msg).

cast(CliId, Msg) ->
    gen_server:cast(get_pid(CliId), Msg).

gen_encrypted_ticket(RoleIdOrAccname, Time) ->
    TICKET = config:get_ticket(),
    TicketEncrypt = util:md5(lists:concat([RoleIdOrAccname, Time, TICKET])),
    prot_util:pack(TicketEncrypt, string).
%%
%%gen_role_icon(1) ->
%%    util:list_rand([101, 102, 103, 104]);
%%gen_role_icon(2) ->
%%    util:list_rand([1, 2, 3, 4]).

do_send_req(ProtNum, Bin, State) ->
    WithHeader = with_header(ProtNum, Bin),
    gen_tcp:send(State#state.sock, WithHeader),
    NewSentList = lists:sublist([WithHeader | State#state.sent_list], 20),
    State#state{sent_list = NewSentList}.

with_header(ProtNum, Bin) ->
    BinSize = size(Bin),
    PackSize = BinSize + 6,
    <<PackSize:16, ProtNum:32, Bin/binary>>.
