%%%-------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     聊天系统
%%% @end
%%%-------------------------------------------------------------------
-module(lib_role_chat).
-author("Ryuu").

-include("chat.hrl").
-include("drop.hrl").
-include("role.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("vow.hrl").
-include("proto/prot_402.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    send_info/1,
    handle_info/2,
    public_chat/7,
    public_chat/8,
    private_chat/6,
    format_sender/1,
    get_role_data/1,
    send_to_channel/5,
    update_role_data/2
]).

%% -----------------------------------------------------------------------------
%% 模块消息
%% -----------------------------------------------------------------------------

handle_info({chat, ?CHAT_CHANNEL_PRIVATE, Sender, Bin}, PS) ->
    receive_chat(PS, Sender, Bin);
handle_info({ban, Type, Time}, PS) ->
    ban(PS, Type, Time);
handle_info(unban, PS) ->
    unban(PS);
handle_info(_Info, _PS) ->
    ok.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_PS, _) ->
    ignore.

%% @doc 收到聊天
receive_chat(PS, _Sender, Bin) ->
    lib_role_send:send_to_role(PS, Bin).

%% -----------------------------------------------------------------------------
%% 玩家请求
%% -----------------------------------------------------------------------------

do(40201, PS, _Req) ->
    send_info(PS);
do(40203, PS, #cs_chat_public{channel = CType, target = Target, content = Content, voice = Voice,
    extra = Extra, voice_time = VoiceTime}) ->
    public_chat(PS, CType, Target, Content, Voice, VoiceTime, Extra);
do(40205, PS, #cs_chat_private{id = Target, content = Content, voice = Voice,
    voice_time = VoiceTime, extra = Extra, svr_num = SvrNum}) ->
    TTarget = {Target, SvrNum},
    private_chat(PS, TTarget, Content, Voice, VoiceTime, Extra);
do(40209, PS, #cs_chat_horn{content = Content, extra = Extra}) ->
    send_horn(PS, Content, Extra);
do(40213, PS, _Req) ->
    get_chat_cache(PS);
do(40215, PS, #cs_chat_clear_cache{id = TargetID}) ->
    clear_chat_cache(PS, TargetID);
do(_Cmd, _PS, _Req) ->
    ok.

%% @doc 获取聊天信息
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{channels := Channels} = RoleData,
    CltChannels = convert_channel(Channels, []),
    Rec = #sc_chat_info{
        channels = CltChannels
    },
    {ok, Bin} = prot_msg:encode_msg(40202, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_channel([], Acc) ->
    Acc;
convert_channel([Channel | T], Acc) ->
    #{type := Type, times := Times} = Channel,
    NewAcc = [{Type, Times} | Acc],
    convert_channel(T, NewAcc).

%% @doc 公共频道聊天
public_chat(PS, CType, Target, Content, Voice, VoiceTime, Extra) ->
    public_chat(PS, CType, Target, Content, Voice, VoiceTime, Extra, []).

public_chat(PS, CType, Target, Content, Voice, VoiceTime, Extra, Opts) ->
    #role_state{id = RoleID} = PS,
    case catch check_public_chat(PS, CType, Target, Content, Voice, Extra, Opts) of
        {ok, NewData, Sender, Cross, NewTarget, NewContent, Now, _Cost} ->
            update_role_data(RoleID, NewData),
            Rec0 = #sc_chat_public_notify{
                channel = CType, target = Target, content = NewContent, voice = Voice,
                sender = Sender, time = Now, extra = Extra, voice_time = VoiceTime
            },
            {ok, Bin0} = prot_msg:encode_msg(40207, Rec0),
            send_to_channel(CType, PS, Cross, NewTarget, Bin0),
            Rec1 = #sc_chat_public{
                channel = CType, target = Target, content = Content, voice = Voice,
                extra = Extra, voice_time = VoiceTime
            },
            {ok, Bin1} = prot_msg:encode_msg(40204, Rec1),
            lib_role_send:send_to_role(PS, Bin1),
            svr_chat:public_chat(CType, RoleID, NewTarget, NewContent, Voice, VoiceTime, Extra),
            ?TASK_EVENT(RoleID, {'chat', CType, Voice =/= ""}),
            log_chat(PS, CType, 0, Content),
            ok;
        {ban, Code, BanType, NewData} ->
            sensitive_ban(RoleID, NewData, BanType),
            ?ERROR_TOC(PS, Code);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% @doc 检查是否可以发送公共聊天
check_public_chat(PS, CType, Target, Content, Voice, Extra, Opts) ->
    lists:member(CType, ?VALID_PUBLIC_CHANNEL) orelse erlang:throw({error, ?RC_CHAT_NOT_PUBLIC_CHANNEL}),
    check_chat(PS, CType, Target, Content, Voice, Extra, Opts).

%% @doc 私聊
private_chat(PS, Target, Content, Voice, VoiceTime, Extra) ->
    #role_state{id = RoleID} = PS,
    case catch check_private_chat(PS, Target, Content, Voice, Extra) of
        {ok, NewData, Sender, Cross, NewTarget, NewContent, Now, _Cost} ->
            update_role_data(RoleID, NewData),
            Rec = #sc_chat_private_notify{
                content = NewContent, voice = Voice, sender = Sender,
                time = Now, extra = Extra, voice_time = VoiceTime
            },
            {ok, Bin} = prot_msg:encode_msg(40208, Rec),
            send_to_channel(?CHAT_CHANNEL_PRIVATE, PS, Cross, NewTarget, Bin),
            {TRoleID, TSvrNum} = NewTarget,
            #{name := Name, career := Career, gender := Sex, level := Level,
                frame := Frame, bubble := Bubble, icon := Icon} = lib_cache:get_role_view(TRoleID),
            TargetInfo = #clt_chat_role{
                id = TRoleID, name = Name, svr_num = TSvrNum, career = Career,
                gender = Sex, level = Level, icon = Icon, frame = Frame,
                bubble = Bubble
            },
            Rec1 = #sc_chat_private{
                target = TargetInfo, content = Content, voice = Voice,
                extra = Extra, voice_time = VoiceTime
            },
            {ok, Bin1} = prot_msg:encode_msg(40206, Rec1),
            lib_role_send:send_to_role(PS, Bin1),
            Cross orelse svr_chat:private_chat(RoleID, TRoleID, NewContent, Voice, VoiceTime, Extra),
            ?TASK_EVENT(RoleID, {'chat', ?CHAT_CHANNEL_PRIVATE, Voice =/= ""}),
            DeedType = ?iif(Voice =/= "", ?DEED_TYPE_VOICE_PRI_CHAT, ?DEED_TYPE_PRI_CHAT),
            lib_role:mod_info(RoleID, lib_role_vow, {trigger, DeedType, 0, TRoleID}),
            log_chat(PS, ?CHAT_CHANNEL_PRIVATE, TRoleID, Content),
            ok;
        {ban, Code, BanType, NewData} ->
            sensitive_ban(RoleID, NewData, BanType),
            ?ERROR_TOC(PS, Code);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% @doc 检查私聊
check_private_chat(PS, Target, Content, Voice, Extra) ->
    check_chat(PS, ?CHAT_CHANNEL_PRIVATE, Target, Content, Voice, Extra).

%% @doc 发送喇叭消息
send_horn(PS, Content, Extra) ->
    #role_state{id = RoleID} = PS,
    case catch check_send_horn(PS, Content) of
        {ok, NewData, Sender, Cross, NewTarget, NewContent, Now, Cost} ->
            PS1 = ?iif(Cost =/= [], lib_role_assets:cost_items_notify(PS, Cost, ?OPT_CHAT), PS),
            update_role_data(RoleID, NewData),
            Rec0 = #sc_chat_horn_notify{
                content = NewContent, sender = Sender, time = Now, extra = Extra
            },
            {ok, Bin0} = prot_msg:encode_msg(40211, Rec0),
            send_to_channel(?CHAT_CHANNEL_HORN, PS, Cross, NewTarget, Bin0),
            Rec1 = #sc_chat_horn{content = Content, extra = Extra},
            {ok, Bin1} = prot_msg:encode_msg(40210, Rec1),
            lib_role_send:send_to_role(PS, Bin1),
            lib_role:mod_info(RoleID, lib_role_vow, {trigger, ?DEED_TYPE_HORN, 0, 0}),
            {ok, PS1};
        {ban, Code, BanType, NewData} ->
            sensitive_ban(RoleID, NewData, BanType),
            ?ERROR_TOC(PS, Code);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_send_horn(PS, Content) ->
    check_chat(PS, ?CHAT_CHANNEL_HORN, 0, Content, "", "").

%% @doc 禁言处理（发送敏感内容）
sensitive_ban(RoleID, RoleData, BanType) when BanType > 0 ->
    #{role_id := RoleID, ban_times := BanTimes} = RoleData,
    BanTime = get_ban_span(BanTimes + 1),
    Now = time:unixtime(),
    BanUntil = BanTime + Now,
    NewData = RoleData#{ban_times => BanTimes + 1},
    update_role_data(RoleID, NewData),
    svr_chat:ban(RoleID, BanType, BanUntil);
sensitive_ban(RoleID, NewData, _BanType) ->
    update_role_data(RoleID, NewData).

%% -----------------------------------------------------------------------------

check_chat(PS, CType, Target, Content, Voice, Extra) ->
    check_chat(PS, CType, Target, Content, Voice, Extra, []).

check_chat(PS, CType, Target, Content, _Voice, Extra, Opts) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    RoleData = get_role_data(RoleID),
    #{channels := Channels, ban_until := BanUtil} = RoleData,
    Conf = conf_chat_channel:get(CType),
    Conf =/= undefined orelse erlang:throw({error, ?RC_CHAT_NO_SUCH_CHANNEL}),
    #{level := NeedLv, cd := ChatCD, cost := Item, vip := _Vip} = Conf,
    Now = time:unixtime(),
    (BanUtil =/= 0 andalso BanUtil >= Now) andalso erlang:throw({error, ?RC_CHAT_CURRENTLY_IN_BAN}),
    RoleLv >= NeedLv orelse erlang:throw({error, ?RC_CHAT_LEVEL_LIMIT}),
    Channel =
        case map:keyfind(CType, type, Channels) of
            V when is_map(V) -> V;
            _ -> ?chat_channel#{type => CType}
        end,
    #{last_chat := LastChat} = Channel,
    ChatTimes = maps:get(times, Channel, 0),
    (LastChat > Now orelse Now - LastChat >= ChatCD) orelse erlang:throw({error, ?RC_CHAT_COOLING_DOWN}),
    Cost = ?iif(Item > 0, [{?AST_ITEM, [{Item, 1}]}], []),
    lib_role_assets:check_items_enough(PS, Cost),
    NewData1 = check_chat_content(RoleLv, RoleData, Content, Extra =/= "", Conf, Opts),
    {Cross, NewTarget} = check_chat_target(CType, PS, Target),
    NewChatTimes = ChatTimes + 1,
    NewChannel = Channel#{last_chat => Now, times => NewChatTimes},
    NewChannels = map:keystore(CType, type, Channels, NewChannel),
    NewData2 = NewData1#{channels => NewChannels},
    Sender = format_sender(PS),
    {ok, NewData2, Sender, Cross, NewTarget, Content, Now, Cost}.

%% @doc 检查聊天内容
check_chat_content(RoleLv, RoleData, Content, HasExtra, ChatConf, Opts) ->
    MaxLen = case util:prop_get_value(max_len, Opts) of
        ConfMaxLen when is_integer(ConfMaxLen) -> ConfMaxLen;
        _ -> maps:get(len, ChatConf)
    end,
    UContent = type:unicode_string(Content),
    is_list(UContent) orelse erlang:throw({error, ?RC_CHAT_CONTENT_CANNOT_RESOLVED}),
    Len = util:string_width(UContent),
    Len =< MaxLen orelse erlang:throw({error, ?RC_CHAT_TEXT_TOO_LONG}),
    check_same_content(RoleLv, RoleData, Content, HasExtra, ChatConf).

check_same_content(RoleLv, RoleData, Content, HasExtra, _ChatConf) ->
    {FilterLv, ChatSameTimes} = config:get_sys_config(chat_same_times),
    #{last_content := LastContent, same_times := SameTimes} = RoleData,
    NewSameTimes = ?iif(Content =:= LastContent andalso not HasExtra, SameTimes + 1, 0),
    NewData = RoleData#{last_content => Content, same_times => NewSameTimes},
    RoleLv =< FilterLv andalso NewSameTimes >= ChatSameTimes andalso begin
        erlang:throw({ban, ?RC_CHAT_SAME_CONTENT, ?BAN_TYPE_SAME_CONTENT, NewData#{
            same_times => 0, last_content => ""
        }})
    end,
    check_word_group(RoleLv, NewData, Content, _ChatConf).

check_word_group(RoleLv, RoleData, Content, _ChatConf) ->
    {FilterLv, MaxSensitive} = config:get_sys_config(chat_ban_times),
    #{sensitive := Sensitive} = RoleData,
    MatchGroup = lib_filter:match_word_group(Content),
    NewSensitive = ?iif(MatchGroup, Sensitive + 1, Sensitive),
    BanType = ?iif(NewSensitive >= MaxSensitive, ?BAN_TYPE_SENSITIVE, 0),
    RoleLv =< FilterLv andalso (BanType > 0 orelse MatchGroup) andalso begin
        erlang:throw({ban, ?RC_CHAT_SENSITIVE_CONTENT, BanType, RoleData#{sensitive => 0}})
    end,
    RoleData#{sensitive => NewSensitive}.

%% @doc 检查聊天对象
check_chat_target(?CHAT_CHANNEL_GUILD, PS, _Target) ->
    #role_state{guild_id = GuildID} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_CHAT_NOT_IN_GUILD}),
    {false, GuildID};
check_chat_target(?CHAT_CHANNEL_TEAM, PS, _Target) ->
    #role_state{team_id = TeamID} = PS,
    TeamID > 0 orelse erlang:throw({error, ?RC_CHAT_NOT_IN_TEAM}),
    {false, TeamID};
check_chat_target(?CHAT_CHANNEL_PRIVATE, PS, Target) ->
    {_TRoleID, TSvrNum} = Target,
    #role_state{id = _RoleID, server_num = SvrNum} = PS,
    Cross = util_svr:is_cross(SvrNum, TSvrNum),
    {Cross, Target};
check_chat_target(?CHAT_CHANNEL_GROUP, PS, GroupID) ->
    #role_state{id = RoleID} = PS,
    lib_friend:is_member(GroupID, RoleID) orelse erlang:throw({error, ?RC_CHAT_NOT_GROUP_MEMBER}),
    {false, GroupID};
check_chat_target(?CHAT_CHANNEL_WORLD, _PS, Target) ->
    {false, Target};
check_chat_target(?CHAT_CHANNEL_WORLD_C, _PS, Target) ->
    {true, Target};
check_chat_target(_CType, _PS, Target) ->
    {false, Target}.

%% @doc 获取发送发数据
format_sender(PS) ->
    #role_state{
        id = RoleID, name = Nick, career = Career, gender = Sex, level = Level,
        server_num = ServerNum, personal = #{icon := Icon, bubble := Bubble, frame := Frame}
    } = PS,
    #clt_chat_role{
        id = RoleID, name = Nick, svr_num = ServerNum, career = Career,
        gender = Sex, level = Level, icon = Icon, bubble = Bubble, frame = Frame
    }.

%% @doc 发送到指定聊天频道
send_to_channel(?CHAT_CHANNEL_WORLD, PS, _Cross, _Target, Bin) ->
    #role_state{id = RoleID} = PS,
    svr_role_agent:broadcast(Bin, RoleID);
send_to_channel(?CHAT_CHANNEL_HORN, PS, _Cross, _Target, Bin) ->
    #role_state{id = RoleID} = PS,
    svr_role_agent:broadcast(Bin, RoleID);
send_to_channel(?CHAT_CHANNEL_NEARBY, PS, _Cross, _Target, Bin) ->
    lib_scene_api:send_to_role_area_scene(PS, Bin, [PS#role_state.id]);
send_to_channel(?CHAT_CHANNEL_PRIVATE, _PS, _Cross, Target, Bin) ->
    {TRoleID, _} = Target,
    lib_role_send:send_to_role(TRoleID, Bin);
send_to_channel(?CHAT_CHANNEL_GUILD, PS, _Cross, GuildID, Bin) ->
    #role_state{id = RoleID} = PS,
    svr_guild:broadcast_except(GuildID, Bin, RoleID);
send_to_channel(?CHAT_CHANNEL_TEAM, PS, _Cross, _TeamID, Bin) ->
    lib_role_team:broadcast_except(PS, Bin);
send_to_channel(?CHAT_CHANNEL_GROUP, PS, _Cross, GroupID, Bin) ->
    lib_friend:broadcast(GroupID, Bin, [PS#role_state.id]);
send_to_channel(_Channel, _PS, _Cross, _Target, _Bin) ->
    ignore.

%% @doc 获取禁言时长
get_ban_span(Times) ->
    Spans = config:get_sys_config(chat_ban_span),
    util:get_zone_config(Spans, Times, 3600).

%% -----------------------------------------------------------------------------
%% 聊天缓存
%% -----------------------------------------------------------------------------

get_chat_cache(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    PubChannels = lists:flatten([
        ?CHAT_CHANNEL_WORLD,
        ?iif(GuildID > 0, [{?CHAT_CHANNEL_GUILD, GuildID}], []),
        [{?CHAT_CHANNEL_GROUP, GroupID} || GroupID <- lib_friend:get_role_groups(RoleID)]
    ]),
    {ok, PubCaches, PriCaches} = lib_chat:get_chat_cache(RoleID, PubChannels),
    Rec = #sc_chat_cache{
        offline_time = 0,
        pub = PubCaches,
        pri = PriCaches
    },
    {ok, Bin} = prot_msg:encode_msg(40214, Rec),
    lib_role_send:send_to_role(PS, Bin).

clear_chat_cache(PS, TargetID) ->
    #role_state{id = RoleID} = PS,
    svr_chat:clear_chat_cache(RoleID, TargetID),
    Rec = #sc_chat_clear_cache{id = TargetID},
    {ok, Bin} = prot_msg:encode_msg(40216, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% -----------------------------------------------------------------------------
%% 禁言
%% -----------------------------------------------------------------------------

%% @doc 禁言
ban(PS, Type, Time) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewData = RoleData#{ban_type := Type, ban_until := Time},
    update_role_data(RoleID, NewData).

%% @doc 取消禁言
unban(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewData = RoleData#{
        ban_type => 0, ban_until => 0, sensitive => 0
    },
    update_role_data(RoleID, NewData).

%% -----------------------------------------------------------------------------
%% log
%% -----------------------------------------------------------------------------

-define(CHAT_LOG_FORMAT, "{\"time\": ~w, \"channel\": ~w, \"s_role_id\": ~w, \"s_accname\": \"~s\", \"s_name\": \"~ts\", \"s_lv\": ~w, \"guild_id\": ~w, \"guild\": \"~ts\", \"s_ip\": \"~s\", \"source\": \"~ts\", \"is_pay\": ~w, \"r_role_id\": ~w, \"r_accname\": \"~s\", \"r_name\": \"~ts\", \"r_lv\": ~w, \"content\": \"~ts\"}").

log_chat(PS, Channel, TargetID, Content) ->
    Now = time:unixtime(),
    #role_state{id = RoleID, name = RoleName, accname = AccName, login_ip = LoginIP,
        guild_id = GuildID, guild_name = GuildName, level = RoleLv} = PS,
    Source = lib_role_agent:get_source(RoleID),
    {TAccName, TargetName, TargetLv} = get_target_info(TargetID),
    Charge = ?iif(lib_role:get_total_charge(RoleID) > 0, 1, 0),
    Log = io_lib:format(?CHAT_LOG_FORMAT, [
        Now, Channel, RoleID, AccName, ?T2B(RoleName), RoleLv, GuildID, ?T2B(GuildName),
        LoginIP, ?T2B(Source), Charge, TargetID, TAccName, ?T2B(TargetName), TargetLv,
        ?T2B(Content)
    ]),
    sys_log:log_chat(Log),
    ok.

get_target_info(0) ->
    {"", "", 0};
get_target_info(TargetID) when is_integer(TargetID) ->
    Target = lib_cache:get_role_base(TargetID),
    get_target_info(Target);
get_target_info(#{name := TargetName, level := TargetLv, accname := TAccName}) ->
    {TAccName, TargetName, TargetLv};
get_target_info(_) ->
    {"", "", 0}.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 初始化玩家数据
init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_CHAT_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [DbChannels, Sensitive, BanType, BanTimes, BanUntil, Time] ->
            Channels = type:convert_db_field(list, DbChannels, []),
            RoleData = ?role_chat#{
                role_id => RoleID, channels => Channels, updated => false,
                time => Time, ban_type => BanType, ban_until => BanUntil,
                sensitive => Sensitive, ban_times => BanTimes
            },
            set_role_data(RoleID, RoleData);
        _ ->
            init_role_data(RoleID)
    end,
    ok.

%% @doc 初始化玩家数据
init_role_data(RoleID) ->
    Now = time:unixtime(),
    SQL = io_lib:format(?SQL_INIT_ROLE_CHAT_DATA, [RoleID, Now]),
    ?DB:execute(SQL),
    RoleData = ?role_chat#{role_id => RoleID, time => Now},
    set_role_data(RoleID, RoleData),
    RoleData.

%% @doc 保存玩家数据
save(PS) ->
    save_(PS).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    Updated andalso save_role_data(RoleID, RoleData),
    ok.

%% @doc 保存玩家数据
save_role_data(RoleID, RoleData) ->
    #{channels := Channels, time := Time,
        sensitive := Sensitive, ban_times := BanTimes} = RoleData,
    SQL = io_lib:format(?SQL_SAVE_ROLE_CHAT_DATA, [
        type:term_to_bitstring(Channels), Sensitive,
        BanTimes, Time, RoleID
    ]),
    ?DB:execute(SQL),
    set_role_data(RoleID, RoleData#{updated => false}).

%% @doc 更新玩家数据
update_role_data(RoleID, Data) ->
    NewData = Data#{updated => true},
    set_role_data(RoleID, NewData).

%% @doc 设置玩家数据
set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).

%% @doc 获取玩家数据
get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        V when is_map(V) -> check_renew_data(RoleID, V);
        _ -> ?role_chat#{role_id => RoleID, time => time:unixtime()}
    end.

check_renew_data(RoleID, RoleData) ->
    #{time := Time, channels := Channels} = RoleData,
    case time:is_today(Time) of
        true ->
            RoleData;
        _ ->
            Now = time:unixtime(),
            NewChannels = [Channel#{times => 0} || Channel <- Channels],
            NewData = RoleData#{
                channels => NewChannels, time => Now, sensitive => 0
            },
            update_role_data(RoleID, NewData),
            NewData
    end.
