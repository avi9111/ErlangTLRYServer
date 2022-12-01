%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 九月 2019 14:20
%%%-------------------------------------------------------------------
-module(test_login).
-author("Administrator").

%% API
-include("svr_client.hrl").
-export([handle/3]).

%% @doc 处理返回消息
% 登陆验证结果
handle(#client{cli_id = CliId, accname = Name} = Client, 90001, #role_login_check_resp{res = LoginChkRet}) ->
    case LoginChkRet of
        ?RC_SUCCEED ->
            svr_client:send_heart_beat(CliId),
            role_list(Client),
            Client;
        _ ->
            ?INFO("CliId:~p , From Name ~p, res:~p", [CliId, Name, LoginChkRet]),
            svr_client:logout(CliId)
    end;
handle(Client, 90003, #get_role_list_resp{role_list = []}) ->
    create_role(Client);
handle(Client = #client{role_id = RoleID}, 90003, #get_role_list_resp{role_list = List}) ->
    case RoleID of
        0 ->
            #role_login_info{role_id = ID} = util:list_rand(List);
        _ ->
            lists:keyfind(RoleID, #role_login_info.role_id, List) =:= false andalso throw({"no_role", RoleID}),
            ID = RoleID
    end,
    login(Client, ID);
handle(#client{cli_id = _CliId} = Client, 90007, #role_create_resp{result = Result}) ->
    case Result of
        ?RC_SUCCEED ->
            role_list(Client),
            Client;
        _ ->
            Client
%%            exit({error, 90007, Resp})
    end;
% 登陆返回
handle(Client, 90011, Resp) ->
    #client{cli_id = CliId} = Client,
    #select_role_login_resp{result = Result} = Resp,
    ?INFO("login:~p, resp:~p", [CliId, Resp]),
    case Result of
        ?RC_SUCCEED ->
            svr_client:enter_scene_info(CliId),
            Client;
        _ ->
            Client
    end;

% 其他 TODO
handle(Client, _Cmd, _Data) ->
    Client.

role_list(#client{socket = Socket}) ->
    recv_loop:do_send_req(Socket, 90002, <<>>).

create_role(Client) ->
    #client{accname = Accname, socket = Socket, server_id = ServerId} = Client,
    CliId = Client#client.cli_id,
    Name = case is_integer(CliId) of
        true ->
            lists:concat(["robotNo_", Accname, "_", CliId]);
        _ ->
            CliId
    end,
    {Career, Gender} = rand_career_gender(),
    NameBinary = unicode:characters_to_binary(Name),
    NameStr = binary_to_list(NameBinary),
    NameBin = prot_util:pack(NameStr, string),
    SourceBin = prot_util:pack("source", string),
    DeviceBin = prot_util:pack("device", string),
    Icon = gen_role_icon(Gender),
    HairId = util:list_rand(conf_hair_style:get_by_sex(Gender)),
    Hair = HairId bsl 24,
    CreateReq = <<
        NameBin/binary, Gender:8, Career:8, Icon:16, Hair:32,
        SourceBin/binary, DeviceBin/binary, ServerId:32
    >>,
    recv_loop:do_send_req(Socket, 90006, CreateReq),
    Client.

login(Client, RoleId) ->
    #client{socket = Socket} = Client,
    Time = time:unixtime(),
    TicketBin = gen_encrypted_ticket(RoleId, Time),
    DeviceBin = prot_util:pack("device", string),
    LoginReqBin = <<RoleId:64, Time:32, TicketBin/binary, DeviceBin/binary>>,
    recv_loop:do_send_req(Socket, 90008, LoginReqBin),
    Client#client{role_id = RoleId}.

gen_encrypted_ticket(RoleIdOrAccname, Time) ->
    TICKET = config:get_ticket(),
    TicketEncrypt = util:md5(lists:concat([RoleIdOrAccname, Time, TICKET])),
    prot_util:pack(TicketEncrypt, string).

gen_role_icon(1) ->
    util:list_rand([101, 102, 103, 104]);
gen_role_icon(2) ->
    util:list_rand([1, 2, 3, 4]).

rand_career_gender() ->
    CGList = [
        {1, 1}, {2, 1},
        {3, 2}, {4, 2}
    ],
    util:list_rand(CGList).