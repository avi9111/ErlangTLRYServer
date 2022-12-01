%%%-----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     邮件系统
%%% @end
%%%-----------------------------------------------------------------------------
-module(lib_role_mail).
-author("Ryuu").

-include("drop.hrl").
-include("mail.hrl").
-include("role.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_403.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    send_info/1,
    handle_info/2,
    get_role_data/1
]).


%% =============================================================================
%% 消息处理
%% =============================================================================

handle_info({new_mail, Mail}, PS) ->
    add_new_mail(PS, Mail);
handle_info(_Info, _PS) ->
    ok.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_PS, _Event) ->
    ignore.

do(40301, PS, _Data) ->
    send_info(PS);
do(40305, PS, #cs_mail_get_attach{id = MailID}) ->
    get_attach(PS, MailID);
do(40307, PS, #cs_mail_delete{id = MailID}) ->
    delete_mail(PS, MailID);
do(40309, PS, _Data) ->
    get_all_attach(PS);
do(40311, PS, _Data) ->
    delete_all_mail(PS);
do(40313, PS, #cs_mail_mark_as_read{id = MailID}) ->
    mark_as_read(PS, MailID);
do(_Cmd, _PS, _Req) ->
    ok.

%% @doc 获得新邮件
add_new_mail(PS, Mail) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mails := Mails, to_del := ToDel} = RoleData,
    {NewMails, Expired} = filter_overflow_mail([Mail | Mails]),
    NewRoleData = RoleData#{mails => NewMails, to_del => Expired ++ ToDel},
    update_role_data(RoleID, NewRoleData),
    notify_new_mail(RoleID, Mail),
    notify_expired_mails(RoleID, Expired),
    ok.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mails := Mails} = RoleData,
    {NewMails, _} = filter_expired_mail(Mails),
    Rec = #sc_mail_list{mails = convert_sc_mail(NewMails)},
    {ok, Bin} = prot_msg:encode_msg(40302, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 提取附件
get_attach(PS, MailID) ->
    #role_state{id = RoleID} = PS,
    case catch check_get_attach(PS, MailID) of
        {ok, NewData, NewMail, Items} ->
            save_mail(RoleID, NewMail),
            update_role_data(RoleID, NewData),
            NewPS = lib_role_assets:add_items_notify(PS, Items, ?OPT_MAIL_ATTACH),
            Rec = #sc_mail_get_attach{id = MailID},
            {ok, Bin} = prot_msg:encode_msg(40306, Rec),
            lib_role_send:send_to_role(PS, Bin),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_attach(PS, MailID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mails := Mails} = RoleData,
    Mail = map:keyfind(MailID, id, Mails),
    Mail =:= false andalso erlang:throw({error, ?RC_MAIL_NO_SUCH_MAIL}),
    #{state := State, items := Items} = Mail,
    is_expired(Mail) andalso erlang:throw({error, ?RC_MAIL_MAIL_EXPIRED}),
    lib_role_assets:check_can_add_items(PS, Items),
    (State band ?MAIL_STATE_ATTACH =/= 0) orelse erlang:throw({error, ?RC_MAIL_HAVE_NO_ATTACH}),
    (State band ?MAIL_STATE_FETCH =:= 0) orelse erlang:throw({error, ?RC_MAIL_ALREADY_FETCH}),
    NewState = State bor ?MAIL_STATE_FETCH bor ?MAIL_STATE_READ,
    NewMail = Mail#{state => NewState},
    NewMails = map:keystore(MailID, id, Mails, NewMail),
    NewRoleData = RoleData#{mails => NewMails},
    {ok, NewRoleData, NewMail, Items}.

%% @doc 全部提取（将所有附件提取进背包，并将其邮件改为已读状态）
get_all_attach(PS) ->
    #role_state{id = RoleID} = PS,
    case catch check_get_all_attach(PS) of
        {ok, NewData, Items, Collects, Changes} ->
            save_mail(RoleID, Changes),
            update_role_data(RoleID, NewData),
            NewPS = lib_role_assets:add_items_notify(PS, Items, ?OPT_MAIL_ATTACH),
            Rec = #sc_mail_one_key_get_attach{list = Collects},
            {ok, Bin} = prot_msg:encode_msg(40310, Rec),
            lib_role_send:send_to_role(PS, Bin),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_all_attach(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mails := Mails} = RoleData,
    {NewMails, Items, Collects, Changes, Full} = collect_mail_attach(Mails, PS, [], [], [], [], false),
    if
        Items =/= [] -> ok;
        Full -> erlang:throw({error, ?RC_GOODS_NOT_ENOUGH_ROOM});
        true -> erlang:throw({error, ?RC_MAIL_NO_CAN_FETCH_MAILS})
    end,
    lib_role_assets:check_can_add_items(PS, Items),
    NewRoleData = RoleData#{mails => NewMails},
    {ok, NewRoleData, Items, Collects, Changes}.

collect_mail_attach([], _PS, MailAcc, ItemAcc, CollectAcc, ChangeAcc, FAcc) ->
    {lists:reverse(MailAcc), ItemAcc, CollectAcc, ChangeAcc, FAcc};
collect_mail_attach([Mail | T], PS, MailAcc, ItemAcc, CollectAcc, ChangeAcc, FAcc) ->
    #{id := MailID, state := State, items := Items} = Mail,
    case (State band ?MAIL_STATE_ATTACH =/= 0) andalso
        (State band ?MAIL_STATE_FETCH =:= 0) andalso
        not is_expired(Mail) of
        true ->
            NewItems = Items ++ ItemAcc,
            case lib_role_assets:can_add_items(PS, NewItems) of
                true -> %% f.u.c.k <--
                    NewState = State bor ?MAIL_STATE_FETCH bor ?MAIL_STATE_READ,
                    NewMail = Mail#{state => NewState},
                    collect_mail_attach(T, PS, [NewMail | MailAcc], NewItems, [MailID | CollectAcc], [NewMail | ChangeAcc], FAcc);
                _ ->
                    collect_mail_attach(T, PS, [Mail | MailAcc], ItemAcc, CollectAcc, ChangeAcc, true)
            end;
        _ ->
            collect_mail_attach(T, PS, [Mail | MailAcc], ItemAcc, CollectAcc, ChangeAcc, FAcc)
    end.

%% @doc 删除邮件
delete_mail(PS, MailID) ->
    #role_state{id = RoleID} = PS,
    case catch check_delete_mail(PS, MailID) of
        {ok, NewData} ->
            update_role_data(RoleID, NewData),
            Rec = #sc_mail_delete{id = MailID},
            {ok, Bin} = prot_msg:encode_msg(40308, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_delete_mail(PS, MailID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mails := Mails, to_del := ToDel} = RoleData,
    Result = map:keytake(MailID, id, Mails),
    Result =:= false andalso erlang:throw({error, ?RC_MAIL_NO_SUCH_MAIL}),
    {value, Mail, Rest} = Result,
    #{state := State} = Mail,
    (State band ?MAIL_STATE_READ =:= 0) andalso erlang:throw({error, ?RC_MAIL_HAVE_NOT_READ}),
    case (State band ?MAIL_STATE_ATTACH =/= 0) andalso
        (State band ?MAIL_STATE_FETCH =:= 0) of
        true -> erlang:throw({error, ?RC_MAIL_ATTACH_NOT_FETCH});
        _ -> next
    end,
    NewState = State band ?MAIL_STATE_DELETE,
    NewMail = Mail#{state => NewState},
    NewData = RoleData#{mails => Rest, to_del => [NewMail | ToDel]},
    {ok, NewData}.

%% @doc 全部删除（将所有无附件、有附件但已领取的邮件删除，有未领取附件的邮件保留）
delete_all_mail(PS) ->
    #role_state{id = RoleID} = PS,
    case catch check_delete_all_mail(PS) of
        {ok, NewData, DelList} ->
            update_role_data(RoleID, NewData),
            Rec = #sc_mail_one_key_delete{list = DelList},
            {ok, Bin} = prot_msg:encode_msg(40312, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% @doc 检查全部删除
check_delete_all_mail(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mails := Mails, to_del := ToDel} = RoleData,
    {NewMails, NewToDel} = collect_can_delete(Mails, [], []),
    NewToDel =:= [] andalso erlang:throw({error, ?RC_MAIL_NO_CAN_DEL_MAILS}),
    NewRoleData = RoleData#{mails => NewMails, to_del => NewToDel ++ ToDel},
    DelList = [MailID || #{id := MailID} <- NewToDel],
    {ok, NewRoleData, DelList}.

collect_can_delete([], MailAcc, DelAcc) ->
    {lists:reverse(MailAcc), DelAcc};
collect_can_delete([Mail | T], MailAcc, DelAcc) ->
    #{state := State} = Mail,
    case (State band ?MAIL_STATE_ATTACH =/= 0) andalso
        (State band ?MAIL_STATE_FETCH =:= 0) of
        true ->
            collect_can_delete(T, [Mail | MailAcc], DelAcc);
        _ ->
            NewState = State bor ?MAIL_STATE_DELETE,
            NewMail = Mail#{state => NewState},
            collect_can_delete(T, MailAcc, [NewMail | DelAcc])
    end.

%% @doc 标记未已读取
mark_as_read(PS, MailID) ->
    #role_state{id = RoleID} = PS,
    case catch check_mark_as_read(PS, MailID) of
        {ok, NewData} ->
            update_role_data(RoleID, NewData),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_mark_as_read(PS, MailID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mails := Mails} = RoleData,
    Mail = map:keyfind(MailID, id, Mails),
    Mail =/= false orelse erlang:throw({error, ?RC_MAIL_NO_SUCH_MAIL}),
    #{state := State} = Mail,
    (State band ?MAIL_STATE_READ =:= ?MAIL_STATE_READ) andalso erlang:throw({error, ?RC_MAIL_ALREADY_READ}),
    NewState = State bor ?MAIL_STATE_READ,
    NewMail = Mail#{state => NewState},
    NewMails = map:keystore(MailID, id, Mails, NewMail),
    NewRoleData = RoleData#{mails => NewMails},
    {ok, NewRoleData}.

%% =============================================================================
%% 通知
%% =============================================================================

%% @doc 通知玩家邮件到达
notify_new_mail(RoleID, Mail) when is_map(Mail) ->
    notify_new_mail(RoleID, [Mail]);
notify_new_mail(RoleID, Mails) ->
    NewMails = convert_sc_mail(Mails),
    Rec = #sc_mail_notify_new{mails = NewMails},
    {ok, Bin} = prot_msg:encode_msg(40303, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc 通知玩家邮件过期
notify_expired_mails(_RoleID, []) ->
    ignore;
notify_expired_mails(RoleID, Expired) when is_list(Expired) ->
    ExpireList = convert_expired(Expired),
    Rec = #sc_mail_notify_expired{list = ExpireList},
    {ok, Bin} = prot_msg:encode_msg(40304, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

convert_expired(List) when is_list(List) ->
    [convert_expired(Mail) || Mail <- List];
convert_expired(#{id := MailID}) ->
    MailID.

%% =============================================================================
%% 其它
%% =============================================================================

%% @doc 转换数据库字段
convert_mail_to_map([ID, Type, ?MAIL_VER, Time, State, Title, Content, FromID,
    FromName, DbGoods]) ->
    Goods = type:convert_db_field(list, DbGoods, []),
    ValidItems = lib_role_assets:valid_items(Goods),
    ?mail#{
        id => ID, type => Type, time => Time, state => State, title => Title,
        content => Content, from_id => FromID, from_name => FromName,
        items => ValidItems
    }.

%% @doc 转换前端结构
convert_sc_mail(Mails) when is_list(Mails) ->
    [convert_sc_mail(Mail) || Mail <- Mails];
convert_sc_mail(Mail) when is_map(Mail) ->
    #{id := ID, type := _Type, time := Time, state := State, title := Title,
        content := Content, from_id := FromID, from_name := FromName,
        items := Items} = Mail,
    Goods = convert_mail_attach(Items, []),
    FrontGoods = #clt_mail_goods_list{list = Goods},
    {ID, Time, State, Title, Content, FromID, FromName, FrontGoods}.

convert_mail_attach([], Acc) ->
    Acc;
convert_mail_attach([{Type, Num} | T], Acc) when ?AST_IS_MONEY(Type) ->
    Goods = #clt_mail_goods{type = Type, id = Type, num = Num, bind = 0},
    NewAcc = [Goods | Acc],
    convert_mail_attach(T, NewAcc);
convert_mail_attach([{Type, Goods} | T], Acc) when ?AST_ITEM_LIKE(Type) ->
    NewAcc = convert_mail_goods(Goods, Acc),
    convert_mail_attach(T, NewAcc);
convert_mail_attach([_ | T], Acc) ->
    convert_mail_attach(T, Acc).

%% @doc 转换物品
convert_mail_goods([], Acc) ->
    Acc;
convert_mail_goods([{TypeID, Num} | T], Acc) ->
    Goods = #clt_mail_goods{type = ?AST_ITEM, id = TypeID, num = Num},
    convert_mail_goods(T, [Goods | Acc]);
convert_mail_goods([{TypeID, Num, Bind} | T], Acc) ->
    Goods = #clt_mail_goods{type = ?AST_ITEM, id = TypeID, num = Num, bind = Bind},
    convert_mail_goods(T, [Goods | Acc]);
convert_mail_goods([{TypeID, Num, Bind, _ExpireTime} | T], Acc) ->
    Goods = #clt_mail_goods{type = ?AST_ITEM, id = TypeID, num = Num, bind = Bind},
    convert_mail_goods(T, [Goods | Acc]);
convert_mail_goods([#{id := TypeID, num := Num, bind := Bind} | T], Acc) ->
    Goods = #clt_mail_goods{type = ?AST_ITEM, id = TypeID, num = Num, bind = Bind},
    convert_mail_goods(T, [Goods | Acc]);
convert_mail_goods([_ | T], Acc) ->
    convert_mail_goods(T, Acc).

%% @doc 过滤掉超出数量限制的邮件
filter_overflow_mail(Mails) ->
    MaxNum = get_max_mail_num(),
    CurNum = erlang:length(Mails),
    DelNum = erlang:max(CurNum - MaxNum, 0),
    select_overflow(Mails, DelNum, MaxNum).

%% @doc 选择需要删除的邮件
select_overflow(Mails, 0, _MaxNum) ->
    {Mails, []};
select_overflow(Mails, DelNum, MaxNum) ->
    {Candidate1, Candidate2, Candidate3} = select_candidate(Mails, [], [], []),
    Candidate = Candidate1 ++ Candidate2 ++ Candidate3,
    {NewDelNum, NewMails, Expired} = select_delete1(DelNum, Candidate, Mails, []),
    select_delete2(NewMails, Expired, NewDelNum, MaxNum).

select_candidate([], Acc1, Acc2, Acc3) ->
    {Acc1, Acc2, Acc3};
select_candidate([Mail | T], Acc1, Acc2, Acc3) ->
    #{state := State} = Mail,
    if
        (State band ?MAIL_STATE_READ =/= 0 andalso
            State band ?MAIL_STATE_ATTACH =:= 0) orelse
            (State band ?MAIL_STATE_ATTACH =/= 0 andalso
                State band ?MAIL_STATE_FETCH =/= 0) ->  %% 已读无附件 or 已读，已领取
            select_candidate(T, [Mail | Acc1], Acc2, Acc3);
        (State band ?MAIL_STATE_READ =:= 0 andalso
            State band ?MAIL_STATE_ATTACH =:= 0) ->     %% 未读，无附件
            select_candidate(T, Acc1, [Mail | Acc2], Acc3);
        (State band ?MAIL_STATE_READ =/= 0 andalso
            State band ?MAIL_STATE_ATTACH =/= 0 andalso
            State band ?MAIL_STATE_FETCH =:= 0) ->      %% 已读，未领取
            select_candidate(T, Acc1, Acc2, [Mail | Acc3]);
        true ->
            select_candidate(T, Acc1, Acc2, Acc3)
    end.

select_delete1(0, _Candidate, Mails, Acc) ->
    {0, Mails, Acc};
select_delete1(DelNum, [], Mails, Acc) ->
    {DelNum, Mails, Acc};
select_delete1(DelNum, [Candidate | T], Mails, Acc) ->
    NewDelNum = DelNum - 1,
    #{id := MailID, state := State} = Candidate,
    NewMails = map:keydelete(MailID, id, Mails),
    NewAcc = [Candidate#{state => State bor ?MAIL_STATE_EXPIRE} | Acc],
    select_delete1(NewDelNum, T, NewMails, NewAcc).

select_delete2(Mails, Expired, 0, _MaxNum) ->
    {Mails, Expired};
select_delete2(Mails, Expired, _DelNum, MaxNum) ->
    {NewMails, Expired2} = lists:split(MaxNum, Mails),
    {NewMails, mark_expired(Expired2, Expired)}.

%% @doc 过滤掉已经过期的邮件
filter_expired_mail(Mails) ->
    ExpTime = get_expire_time(),
    {NewMails, Expired} = filter_expired_mail(Mails, ExpTime, [], []),
    {NewMails, mark_expired(Expired, [])}.

filter_expired_mail([], _ExpTime, ValidAcc, ExpireAcc) ->
    {ValidAcc, ExpireAcc};
filter_expired_mail([Mail | T], ExpTime, ValidAcc, ExpireAcc) ->
    case is_expired(Mail, ExpTime) of
        true -> filter_expired_mail(T, ExpTime, ValidAcc, [Mail | ExpireAcc]);
        _ -> filter_expired_mail(T, ExpTime, [Mail | ValidAcc], ExpireAcc)
    end.

mark_expired([], Acc) ->
    Acc;
mark_expired([Mail | T], Acc) ->
    #{state := State} = Mail,
    NewMail = Mail#{state => State bor ?MAIL_STATE_EXPIRE},
    mark_expired(T, [NewMail | Acc]).

%% @doc 是否过期
is_expired(Mail) ->
    ExpireTime = get_expire_time(),
    is_expired(Mail, ExpireTime).

is_expired(Mail, ExpireTime) ->
    #{time := Time} = Mail,
    Time =< ExpireTime.

%% @doc 过期时间
get_expire_time() ->
    ValidPeriod = config:get_sys_config(mail_valid_period),
    Now = time:unixtime(),
    Now - ValidPeriod.

%% @doc 最大邮件数量
get_max_mail_num() ->
    config:get_sys_config(mail_max_num).

%% =============================================================================
%% 玩家数据
%% =============================================================================

%% @doc 初始化玩家数据
init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_MAIL_DATA, [RoleID, get_expire_time()]),
    List = ?DB:get_all(SQL),
    Mails = lists:map(fun convert_mail_to_map/1, List),
    {NewMails, Expired} = filter_overflow_mail(Mails),
    Updated = ?iif(Expired =:= [], false, true),
    RoleData = ?role_mail#{
        role_id => RoleID, mails => NewMails, to_del => Expired, updated => Updated
    },
    case Updated of
        true -> update_role_data(RoleID, RoleData);
        _ -> set_role_data(RoleID, RoleData)
    end.

%% @doc 下线逻辑
save(PS) ->
    save_(PS).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    case Updated of
        true -> save_role_mail(RoleID, RoleData);
        _ -> ok
    end.

save_role_mail(RoleID, RoleData) ->
    #{mails := Mails, to_del := ToDel} = RoleData,
    {NewMails, Expired} = filter_expired_mail(Mails),
    save_mail(RoleID, NewMails ++ Expired ++ ToDel),
    NewData = RoleData#{
        updated => false, mails => NewMails, to_del => []
    },
    set_role_data(RoleID, NewData),
    ok.

save_mail(RoleID, Mail) when is_map(Mail) ->
    save_mail(RoleID, [Mail]);
save_mail(RoleID, Mails) when is_list(Mails) ->
    Fun = fun(#{id := MailID, state := State, time := Time}) ->
        [RoleID, MailID, State, Time]
    end,
    db:insert_values(?SQL_SAVE_ROLE_MAIL_DATA2, ?SQL_SAVE_ROLE_MAIL_DATA3, Fun, Mails).

%% @doc 更新玩家数据
update_role_data(RoleID, RoleData) ->
    #{to_del := ToDel} = RoleData,
    case length(ToDel) >= ?MAIL_BATCH_DEL of
        false ->
            NewData = RoleData#{updated => true},
            set_role_data(RoleID, NewData);
        _ ->
            save_role_mail(RoleID, RoleData)
    end.

%% @doc 设置玩家邮件数据
set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

%% @doc 获取玩家邮件数据
get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        V when is_map(V) -> V;
        _ -> ?role_mail#{role_id => RoleID}
    end.
