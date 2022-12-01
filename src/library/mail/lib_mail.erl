%% -----------------------------------------------------------------------------
%% @author Ryuu
%% @copyright (C) 2016, <COMPANY>
%% @doc
%%     邮件系统
%% @end
%% -----------------------------------------------------------------------------
-module(lib_mail).
-author("Ryuu").

-include("mail.hrl").
-include("common.hrl").

%% API
-export([
    sys_share/1,
    split_send/2,
    valid_items/1,
    sys_personal/5,
    get_mail_temp/1,
    format_mail_temp/2
]).

%% @doc 系统共享邮件
sys_share({sys2common, Scope, Title, Content, Items, OpType}) ->
    sys2common(Scope, Title, Content, Items, OpType);
sys_share({sys2online, Scope, Title, Content, Items, OpType}) ->
    sys2online(Scope, Title, Content, Items, OpType);
sys_share({sys2select, RoleList, Title, Content, Items, OpType}) ->
    split_send(RoleList, Title, Content, Items, OpType).

%% @doc 发送邮件给指定条件玩家
sys2common(all, Title, Content, Items, OpType) ->
    sys_share(Title, Content, Items, OpType, ?SQL_MAIL_SHARE_WHOLE, []);
sys2common({lv, MinLv}, Title, Content, Items, OpType) ->
    sys_share(Title, Content, Items, OpType, ?SQL_MAIL_SHARE_LEVEL, [MinLv, 999]);
sys2common({lv, MinLv, MaxLv}, Title, Content, Items, OpType) ->
    sys_share(Title, Content, Items, OpType, ?SQL_MAIL_SHARE_LEVEL, [MinLv, MaxLv]);
sys2common(Scope, Title, Content, Items, OpType) ->
    RoleList = db_select(Scope),
    split_send(RoleList, Title, Content, Items, OpType).

%% @doc 全服邮件特殊处理
sys_share(Title, Content, Items, OpType, SQL, Args) ->
    Fun = fun(Mail) ->
        #{id := MailID, state := State, time := Time} = Mail,
        SQL2 = io_lib:format(SQL, [MailID, State, Time] ++ Args),
        ?DB:execute(SQL2)
    end,
    sys_share(Title, Content, Items, OpType, Fun).

sys_share(Title, Content, Items, OpType, Fun) ->
    case create_mail(?MAIL_TYPE_SYS, ?MAIL_FROM_ID_SYS, ?TR(mail_from_name_sys), Title, Content, Items, OpType, Fun) of
        {ok, Mail, RoleList} ->
            notify_new_mail(RoleList, Mail);
        _ ->
            ignore
    end.

%% @doc 发送邮件给在线玩家
sys2online(Scope, Title, Content, Items, OpType) ->
    OnlineList = lib_role_agent:select(Scope),
    split_send(OnlineList, Title, Content, Items, OpType).

%% @doc 分批发送
split_send([], _Title, _Content, _Items, _OpType) ->
    ignore;
split_send(RoleList, Title, Content, Items, OpType) ->
    case create_mail(?MAIL_TYPE_SYS, ?MAIL_FROM_ID_SYS, ?TR(mail_from_name_sys), Title, Content, Items, OpType) of
        {ok, Mail} ->
            split_send(RoleList, Mail);
        _ ->
            ignore
    end.

split_send(RoleList, Mail) ->
    {SendList, Rest} =
        case length(RoleList) > ?MAIL_BATCH_SIZE of
            true -> lists:split(?MAIL_BATCH_SIZE, RoleList);
            _ -> {RoleList, []}
        end,
    [sys_personal2(RoleID, Mail) || RoleID <- SendList],
    case Rest of
        [] -> ignore;
        _ -> erlang:send_after(?MAIL_BATCH_SLEEP, self(), {split_send, Rest, Mail})
    end.

%% @doc 系统个人邮件
sys_personal(RoleID, Title, Content, Items, OpType) ->
    case create_mail(?MAIL_TYPE_S2P, ?MAIL_FROM_ID_SYS, ?TR(mail_from_name_sys), Title, Content, Items, OpType) of
        {ok, Mail} ->
            sys_personal2(RoleID, Mail);
        _ ->
            ignore
    end.

sys_personal2(RoleID, Mail) ->
    #{id := MailID, state := State, time := Time} = Mail,
    SQL = io_lib:format(?SQL_SAVE_ROLE_MAIL_DATA, [RoleID, MailID, State, Time]),
    ?DB:execute(SQL),
    notify_new_mail(RoleID, Mail).

%% @doc 创建邮件
create_mail(Type, FromID, FromName, Title, Content, Items, OpType) ->
    create_mail(Type, FromID, FromName, Title, Content, Items, OpType, undefined).

create_mail(Type, FromID, FromName, Title, Content, Items, OpType, Fun) ->
    Time = time:unixtime(),
    MailID = svr_generator:gen_mail_id(),
    SQLCreateMail = io_lib:format(?SQL_CREATE_MAIL_ATTR, [
        MailID, Type, ?MAIL_VER, Time, Title, Content, FromID, FromName,
        type:term_to_bitstring(Items), OpType
    ]),
    case ?DB:transaction(fun() ->
        ?DB:execute(SQLCreateMail),
        MailState = ?iif(Items =:= [], ?MAIL_STATE_NEW, ?MAIL_STATE_ATTACH),
        Mail = #{
            id => MailID, type => Type, time => Time, state => MailState, title => Title,
            content => Content, from_id => FromID, from_name => FromName, items => Items
        },
        RoleList = mail_callback(Fun, MailID, Mail),
        {ok, Mail, RoleList}
    end) of
        {ok, Mail, RoleList} when is_function(Fun, 1) ->
            {ok, Mail, RoleList};
        {ok, Mail, _RoleList} ->
            {ok, Mail};
        {aborted, Error} ->
            ?ERROR("create mail failed, type ~w, from_id ~w, from_name ~ts, title ~ts, content ~ts, items ~w, error ~w",
                [Type, FromID, FromName, Title, Content, Items, Error])
    end.

mail_callback(Fun, MailID, Mail) when is_function(Fun, 1) ->
    Fun(Mail),
    SQL = io_lib:format(?SQL_GET_GET_MAIL_ROLE, [MailID]),
    [RoleID || [RoleID] <- ?DB:get_all(SQL)];
mail_callback(_Fun, _MailID, _Mail) ->
    [].

%% @doc 特殊条件邮件处理
db_select(Scope) ->
    SQL = db_select_sql(Scope),
    case SQL of
        "" ->
            [];
        _ ->
            [RoleID || [RoleID] <- ?DB:get_all(SQL)]
    end.

db_select_sql(_Scope) ->
    "".

%% =============================================================================
%% 通用
%% =============================================================================

%% @doc 通知指定玩家获得邮件
notify_new_mail(RoleID, Mail) when is_integer(RoleID) ->
    notify_new_mail([RoleID], Mail);
notify_new_mail(RoleList, Mail) ->
    [lib_role:mod_info(RoleID, lib_role_mail, {new_mail, Mail}) || RoleID <- RoleList].

%% @doc 邮件模板
get_mail_temp(TempID) ->
    case conf_mail_template:get(TempID) of
        #{title := Title, content := Content} ->
            {Title, Content};
        _ ->
            {?TR(mail_default_title), ?TR(mail_default_content)}
    end.

%% @doc 验证数据
valid_items(DropID) when is_integer(DropID) ->
    valid_items([DropID]);
valid_items(Items) when is_list(Items) ->
    ItemList = collect_items(Items, []),
    lib_role_assets:valid_items(ItemList).

collect_items([], Acc) ->
    Acc;
collect_items([DropID | T], Acc) when is_integer(DropID) -> %% DropID: DropID
    Items = lib_drop_base:get_drop_goods(DropID),
    collect_items(T, Items ++ Acc);
collect_items([Item | T], Acc) when is_tuple(Item) -> %% Item: {DropType, DropItem}
    collect_items(T, [Item | Acc]).

-define(VFR(Title), (is_list(Title) orelse is_binary(Title))).

%% @doc 获取邮件模板
format_mail_temp(TempID, Fun) when is_integer(TempID), is_function(Fun, 2) ->
    {TitleTemp, ContentTemp} = lib_mail:get_mail_temp(TempID),
    case catch Fun(TitleTemp, ContentTemp) of
        {Title, Content} when ?VFR(Title) andalso ?VFR(Content) ->
            {Title, Content};
        _ ->
            {TitleTemp, ContentTemp}
    end.
