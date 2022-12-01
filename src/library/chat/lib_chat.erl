%%%-------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     聊天服务
%%% @end
%%%-------------------------------------------------------------------
-module(lib_chat).
-author("Ryuu").

-include("chat.hrl").
-include("cache.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("proto/prot_ud.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

%% API
-export([
    ban/3,
    info/0,
    unban/1,
    public_chat/7,
    private_chat/6,
    expire_check/0,
    send_ban_mail/2,
    get_chat_cache/2,
    init_for_start/0,
    clear_chat_cache/2,
    get_public_cache/1,
    get_private_cache/2
]).

%% @doc 初始化
init_for_start() ->
    ok.

%% @doc 服务信息
info() ->
    [
    ].

%% =============================================================================
%% 聊天缓存、离线聊天
%% =============================================================================

get_public_cache(ChannelKey) ->
    case ets:lookup(?ETS_CHAT_CACHE_PUBLIC, ChannelKey) of
        [#chat_cache_public{} = V] -> V;
        _ -> #chat_cache_public{channel_key = ChannelKey}
    end.

set_public_cache(Cache) ->
    ets:insert(?ETS_CHAT_CACHE_PUBLIC, Cache).

public_chat(Channel, RoleID, Target, Content, Voice, VoiceTime, Extra) ->
    Time = time:unixtime(),
    ChannelKey = channel_key(Channel, Target),
    Data = get_public_cache(ChannelKey),
    #chat_cache_public{history = His} = Data,
    Item = #{
        role_id => RoleID, content => Content, voice => Voice,
        voice_time => VoiceTime, extra => Extra, time => Time
    },
    FinHis = lists:sublist([Item | His], 1, ?CHAT_CACHE_PUBLIC_NUM),
    NewData = Data#chat_cache_public{
        history = FinHis, channel = Channel, target = Target
    },
    set_public_cache(NewData).

channel_key(Channel, _Target) when Channel =:= ?CHAT_CHANNEL_WORLD ->
    Channel;
channel_key(Channel, Target) ->
    {Channel, Target}.

extra_channel(Channel) when is_integer(Channel) ->
    Channel;
extra_channel({Channel, _Target}) ->
    Channel.

%% @doc
get_private_cache(RoleID, TargetID) ->
    Key = cache_key(RoleID, TargetID),
    case ets:lookup(?ETS_CHAT_CACHE_PRIVATE, Key) of
        [#chat_cache_private{} = V] ->
            V;
        _ ->
            {FID, TID} = Key,
            #chat_cache_private{
                key = Key, role_id = FID, target_id = TID,
                clear = [{FID, 0}, {TID, 0}]
            }
    end.

%% @doc 缓存数据
set_private_cache(Data) ->
    ets:insert(?ETS_CHAT_CACHE_PRIVATE, Data).

%% @doc 缓存key
cache_key(RoleID, TargetID) when RoleID >= TargetID ->
    {RoleID, TargetID};
cache_key(RoleID, TargetID) ->
    {TargetID, RoleID}.

%% @doc 聊天对象
target_id(RoleID, {RoleID, TID}) ->
    TID;
target_id(RoleID, {FID, RoleID}) ->
    FID.

%% @doc 私聊
private_chat(RoleID, TargetID, Content, Voice, VoiceTime, Extra) ->
    Time = time:unixtime(),
    Data = get_private_cache(RoleID, TargetID),
    #chat_cache_private{history = His} = Data,
    Item = #{
        role_id => RoleID, content => Content, voice => Voice,
        voice_time => VoiceTime, extra => Extra, time => Time
    },
    NewHis = [Item | His],
    {FinHis, _} = util:split_list(?CHAT_CACHE_PRIVATE_NUM, NewHis),
    NewData = Data#chat_cache_private{history = FinHis, last_chat = Time},
    set_private_cache(NewData).

%% @doc 获取缓存
get_chat_cache(RoleID, PubChannels) ->
    PubCaches = convert_public_caches(PubChannels, RoleID, []),
    MatchSpec = ets:fun2ms(fun(#chat_cache_private{role_id = FID, target_id = TID} = Cache)
        when FID =:= RoleID orelse TID =:= RoleID -> Cache
    end),
    PriCaches = ets:select(?ETS_CHAT_CACHE_PRIVATE, MatchSpec),
    CPriCaches = convert_private_caches(PriCaches, RoleID, []),
    {ok, PubCaches, CPriCaches}.

%% @doc 转换公共缓存
convert_public_caches([], _RoleID, Acc) ->
    lists:reverse(Acc);
convert_public_caches([ChannelKey | T], RoleID, Acc) ->
    Data = get_public_cache(ChannelKey),
    #chat_cache_public{history = His, target = Target} = Data,
    CltHis = convert_public_his(His, RoleID, []),
    Channel = extra_channel(ChannelKey),
    Item = #clt_chat_public_cache{
        channel = Channel, history = CltHis, target = Target
    },
    NewAcc = [Item | Acc],
    convert_public_caches(T, RoleID, NewAcc).

convert_public_his([], _RoleID, Acc) ->
    lists:reverse(Acc);
convert_public_his([Info | T], RoleID, Acc) ->
    #{role_id := RID, content := Content, voice := Voice, voice_time := VoiceTime,
        extra := Extra, time := Time} = Info,
    {FmtRlt, CltSender} = get_sender(RID),
    case FmtRlt =:= ok of
        true ->
            Item1 = #clt_chat_his_item{
                role = ?iif(RID =:= RoleID, 1, 0), content = Content,
                voice = Voice, voice_time = VoiceTime, extra = Extra,
                time = Time
            },
            Item2 = #clt_chat_public_item{sender = CltSender, item = Item1},
            NewAcc = [Item2 | Acc],
            convert_public_his(T, RoleID, NewAcc);
        _ ->
            convert_public_his(T, RoleID, Acc)
    end.

%% @doc 转换私聊缓存
convert_private_caches([], _RoleID, Acc) ->
    Acc;
convert_private_caches([Cache | T], RoleID, Acc) ->
    case catch convert_private_cache(RoleID, Cache) of
        CltCache when is_record(CltCache, clt_chat_private_cache) ->
            convert_private_caches(T, RoleID, [CltCache | Acc]);
        _ ->
            convert_private_caches(T, RoleID, Acc)
    end.

convert_private_cache(RoleID, Cache) ->
    #chat_cache_private{key = Key, history = His, clear = Clear} = Cache,
    TargetID = target_id(RoleID, Key),
    {FmtRlt, CltSender} = get_sender(TargetID),
    FmtRlt =:= ok orelse erlang:throw(false),
    ClearTime = util:prop_get_value(RoleID, Clear),
    CltHis = convert_private_his(His, RoleID, ClearTime, []),
    CltHis =/= [] orelse erlang:throw(false),
    #clt_chat_private_cache{
        sender = CltSender, history = CltHis
    }.

convert_private_his([], _RoleID, _ClearTime, Acc) ->
    lists:reverse(Acc);
convert_private_his([Info | T], RoleID, ClearTime, Acc) ->
    #{role_id := RID, content := Content, voice := Voice,
        voice_time := VoiceTime, extra := Extra, time := Time} = Info,
    case ClearTime =:= 0 orelse Time > ClearTime of
        true ->
            Item = #clt_chat_his_item{
                role = ?iif(RID =:= RoleID, 1, 0), content = Content,
                voice = Voice, voice_time = VoiceTime, extra = Extra,
                time = Time
            },
            NewAcc = [Item | Acc],
            convert_private_his(T, RoleID, ClearTime, NewAcc);
        _ ->
            convert_private_his(T, RoleID, ClearTime, Acc)
    end.

get_sender(RoleID) ->
    case lib_cache:get_role_base(RoleID) of
        RoleBase when is_map(RoleBase) ->
            #{name := RoleName, level := RoleLv, gender := RoleSex,
                career := Career} = RoleBase,
            ServerNum = config:get_server_num(),
            Sender = #clt_chat_role{
                id = RoleID, name = RoleName, svr_num = ServerNum, career = Career,
                gender = RoleSex, level = RoleLv
            },
            SenderN = case lib_cache:get_role_view(RoleID) of
                #{icon := Icon, frame := Frame, bubble := Bubble} ->
                    Sender#clt_chat_role{icon = Icon, bubble = Bubble, frame = Frame};
                _ ->
                    Sender
            end,
            {ok, SenderN};
        _ ->
            {error, not_found}
    end.

%% @doc 清理聊天缓存
clear_chat_cache(RoleID, TargetID) ->
    Now = time:unixtime(),
    Data = get_private_cache(RoleID, TargetID),
    #chat_cache_private{clear = Clear} = Data,
    NewClear = lists:keystore(RoleID, 1, Clear, {RoleID, Now}),
    NewData = Data#chat_cache_private{clear = NewClear},
    set_private_cache(NewData).

%% @doc 过期检查
expire_check() ->
    Now = time:unixtime(),
    MatchSpec = ets:fun2ms(fun(#chat_cache_private{last_chat = LastChat})
        when LastChat - Now >= ?CHAT_CACHE_VALID_TIME ->
        true
    end),
    ets:select_delete(?ETS_CHAT_CACHE_PRIVATE, MatchSpec).

%% =============================================================================
%% 禁言
%% =============================================================================

%% @doc 禁言
ban(RoleID, Type, Time) ->
    ban_role(RoleID, Type, Time),
    lib_role:mod_info(RoleID, lib_role_chat, {ban, Type, Time}).

ban_role(RoleID, Type, Time) ->
    SQL = io_lib:format(?SQL_BAN_ROLE_CHAT, [Type, Time, RoleID]),
    ?DB:execute(SQL),
    send_ban_mail(RoleID, Time).

%% @doc 取消禁言
unban(RoleID) ->
    unban_role(RoleID),
    lib_role:mod_info(RoleID, lib_role_chat, unban).

unban_role(RoleID) ->
    SQL = io_lib:format(?SQL_UNBAN_ROLE_CHAT, [RoleID]),
    ?DB:execute(SQL).

%% @doc 发送禁言邮件
send_ban_mail(RoleID, Time) ->
    MailID = config:get_sys_config(chat_ban_mail),
    {{Year, Mon, Day}, {Hour, Min, Sec}} = time:unixtime_to_localtime(Time),
    svr_mail:sys2p(RoleID, MailID, [Year, Mon, Day, Hour, Min, Sec], [], ?OPT_GM).
