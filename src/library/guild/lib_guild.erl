%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     帮派
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_guild).
-author("Ryuu").

-include("drop.hrl").
-include("rank.hrl").
-include("role.hrl").
-include("goods.hrl").
-include("guild.hrl").
-include("assets.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("proto/prot_414.hrl").
-include("proto/prot_514.hrl").
-include("proto/prot_535.hrl").
-include("proto/prot_ud.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

%% API
-export([
    init/1,
    loop/1,
    bless/3,
    leave/2,
    invite/3,
    online/2,
    rename/3,
    upgrade/2,
    recruit/2,
    offline/2,
    add_cont/3,
    kick_out/3,
    study_up/3,
    build_up/3,
    add_funds/4,
    apply_for/2,
    broadcast/1,
    broadcast/2,
    get_bless/2,
    init_build/0,
    init_study/0,
    enter_seat/2,
    guild_info/2,
    timer_hour/0,
    guild_task/1,
    set_hostile/3,
    change_name/2,
    fast_select/3,
    guild_bonus/1,
    add_exploit/2,
    lucky_money/6,
    gen_num_list/0,
    get_build_lv/2,
    auto_impeach/1,
    cancel_apply/2,
    get_chief_id/1,
    handle_apply/4,
    refresh_rank/0,
    set_guild_id/1,
    add_live_exp/3,
    get_study_lv/2,
    add_rob_times/2,
    gen_guild_num/2,
    guild_declare/3,
    approve_apply/2,
    dismiss_guild/1,
    get_join_time/1,
    get_role_data/1,
    is_seat_scene/1,
    cancel_hostile/3,
    fix_guild_task/1,
    get_task_stage/2,
    get_guild_logs/2,
    get_seat_scene/0,
    get_role_guild/1,
    get_rank_guild/1,
    get_guild_rank/1,
    get_apply_list/2,
    get_guild_info/1,
    get_guild_list/0,
    get_guild_name/1,
    gm_appoint_pos/3,
    init_for_start/0,
    save_role_data/1,
    rob_times_reset/1,
    get_study_value/2,
    get_member_list/2,
    change_announce/3,
    cross_day_reset/1,
    get_guild_level/1,
    role_guild_info/2,
    save_guild_data/1,
    send_guild_list/1,
    cost_denf_funds/1,
    get_lucky_money/3,
    broadcast_except/2,
    broadcast_except/3,
    broadcast_to_pos/2,
    broadcast_to_pos/3,
    check_guild_name/1,
    desolation_check/1,
    get_guild_detail/1,
    update_role_data/2,
    get_declare_list/2,
    get_hostile_list/2,
    rob_times_effect/3,
    get_chief_members/1,
    get_guild_by_name/1,
    get_role_guild_id/1,
    is_forbidden_join/0,
    save_update_roles/0,
    send_guild_detail/2,
    update_guild_info/1,
    finish_bonus_task/3,
    finish_guild_task/3,
    appoint_member_pos/4,
    auto_impeach_check/0,
    change_accept_type/4,
    get_member_id_list/1,
    get_seat_enter_pos/0,
    save_update_guilds/0,
    set_role_guild_pos/4,
    guild_study_effect/3,
    fix_declare_or_back/1,
    activity_is_blessed/2,
    start_guild_process/1,
    get_guild_task_stage/1,
    get_guild_brief_list/1,
    delay_desolation_check/1,
    desolation_guild_check/0,
    get_is_low_defend_state/1,
    role_delete/2,
    select_open_guild_defend/0
]).

%% 帮派烹饪
-export([
    cook/5,
    get_cook_val/1,
    get_cook_info/1
]).

%% 少室山
-export([
    fix_sh_dung/1,
    sh_dung_reset/1,
    finish_sh_dung/3,
    get_cur_chapter/1,
    get_cur_dung_id/1
]).

-export([
    gm_reduce_funds/4
]).

%% -----------------------------------------------------------------------------

init(GuildID) ->
    set_guild_id(GuildID),
    svr_timer:register().

loop(Now) ->
    lucky_money_loop(Now),
    declare_loop(Now),
    ok.

%% @doc 获取帮派列表 [异步]
send_guild_list(RoleID) ->
    GuildList = get_guild_brief_list(RoleID),
    Resp = #sc_guild_list{list = GuildList},
    {ok, Bin} = prot_msg:encode_msg(41404, Resp),
    lib_role_send:send_to_role(RoleID, Bin).

get_guild_brief_list(RoleID) ->
    [begin
        #guild{id = GuildID, name = GuildName, level = Level, members = Members,
            apply = ApplyList, chief_name = ChiefName, auto_accept = AutoAccept,
            accept_type = AcceptType, denf_state = DenfState, num = Num
        } = Guild,
        Rank = get_guild_rank(GuildID),
        MemNum = erlang:length(Members),
        TotalFight = get_total_fight(Members),
        Apply = lists:keyfind(RoleID, #guild_apply.role_id, ApplyList),
        HasApply = ?iif(Apply =/= false, 1, 0),
        MaxNum = get_max_member_num(GuildID),
        #clt_guild_brief{
            id = GuildID, rank = Rank, name = GuildName, level = Level,
            mem_num = MemNum, fight = TotalFight, apply = HasApply,
            chief_name = ChiefName, auto_accept = AutoAccept, accept_type = AcceptType,
            denf_state = DenfState, max_num = MaxNum, num = Num
        }
    end || Guild <- ets:tab2list(?ETS_GUILD)].

get_total_fight(GuildID) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    get_total_fight(Guild);
get_total_fight(Guild) when is_record(Guild, guild) ->
    #guild{members = Members} = Guild,
    get_total_fight(Members);
get_total_fight(Members) when is_list(Members) ->
    lists:sum([get_member_fight(RoleID) || #guild_member{role_id = RoleID} <- Members, RoleID > 0]);
get_total_fight(_) ->
    0.

get_member_fight(RoleID) ->
    case lib_cache:get_role_base(RoleID) of
        #{fight := Fight} ->
            erlang:floor(Fight);
        _ ->
            0
    end.

%% @doc 获取帮派数据
send_guild_detail(RoleID, GuildID) ->
    Rec = #sc_guild_get_detail{guild = get_guild_detail(GuildID)},
    {ok, Bin} = prot_msg:encode_msg(41406, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

get_guild_detail(undefined) ->
    get_guild_detail(#guild{});
get_guild_detail(GuildID) when is_integer(GuildID) ->
    get_guild_detail(get_guild_info(GuildID));
get_guild_detail(Guild) ->
    #guild{
        id = GuildID, name = GuildName, level = Level, members = Members,
        funds = Funds, announce = Announce, accept_type = AcceptType,
        chief_id = ChiefID, auto_accept = AutoAccept, recently_live = RLive,
        denf_state = DenfState, pause_denf_time = PauseDenfTime, bonus = Bonus,
        build = Build, study = Study, battle = Battle, lucky_money = LuckyMoney0,
        num = Num, sh_dung = ShDung, recruit = RecruitTime
    } = Guild,
    TotalFight = get_total_fight(Members),
    Rank = get_guild_rank(GuildID),
    ChiefName = lib_cache:get_role_name(ChiefID),
    RLiveRxp = calc_recently_live_exp(RLive),
    LuckyMoney = lib_lucky_money_util:make_lucky_money_list(LuckyMoney0),
    ShCurPage = get_cur_chapter(ShDung),
    #clt_guild{
        id = GuildID, name = GuildName, rank = Rank, level = Level,
        funds = Funds, fight = TotalFight, announce = Announce,
        members = get_member_detail(Members), chief_name = ChiefName,
        accept_type = AcceptType, auto_accept = AutoAccept,
        recently_live = RLiveRxp, denf_state = DenfState,
        pause_denf_time = PauseDenfTime, bonus = Bonus, num = Num,
        build = Build, study = Study, battle = Battle, lucky_money = LuckyMoney,
        sh_dung = ShDung, sh_cur_page = ShCurPage, recruit_time = RecruitTime
    }.

%% @doc 获取成员列表
get_member_list(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    #guild{members = Members} = Guild,
    CltMembers = get_member_detail(Members),
    Rec = #sc_guild_get_members{members = CltMembers},
    {ok, Bin} = prot_msg:encode_msg(41408, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

get_member_detail(Members) when is_list(Members) ->
    [get_member_detail(Member) || #guild_member{role_id = RoleID} = Member <- Members, RoleID > 0];
get_member_detail(Member) ->
    #guild_member{role_id = RoleID, pos = Pos} = Member,
    RoleBase = lib_cache:get_role_base(RoleID),
    #{name := RoleName, level := RoleLv, fight := RoleFight, offline := Offline,
        vip_lv := VipLv, gender := Sex, career := Career} = RoleBase,
    #{frame := Frame, icon := Icon} = lib_cache:get_role_view(RoleID),
    NewOffline = ?iif(lib_role:is_online(RoleID), 0, Offline),
    RoleData = get_role_data(RoleID),
    #guild_role{cont = Cont, weekly_funds = WeeklyFunds, weekly_live = WeeklyLive, weekly_cont = WeeklyCont} = RoleData,
    #clt_guild_member{
        id = RoleID, pos = Pos, name = RoleName, level = RoleLv, career = Career,
        fight = RoleFight, offline = NewOffline, vip_lv = VipLv, gender = Sex,
        contri = Cont, weekly_funds = WeeklyFunds, weekly_cont = WeeklyCont,
        weekly_live = WeeklyLive, frame = Frame, icon = Icon
    }.

%% @doc 自动选择新的帮主
auto_renew_chief(Guild) ->
    case select_new_chief(Guild, false) of
        RoleID when RoleID > 0 ->
            #guild{id = GuildID} = Guild,
            gm_appoint_pos(GuildID, RoleID, ?GUILD_POS_CHIEF);
        _ ->
            ignore
    end.

gm_appoint_pos(GuildID, TargetID, Pos) ->
    Guild = get_guild_info(GuildID),
    #guild{chief_id = ChiefID, members = Members} = Guild,
    case lists:keyfind(?GUILD_POS_CHIEF, #guild_member.pos, Members) of
        #guild_member{role_id = RID} when RID =:= ChiefID ->
            appoint_member_pos(GuildID, ChiefID, TargetID, Pos);
        _ ->
            appoint_member_pos(Guild#guild{chief_id = 0}, 0, TargetID, Pos)
    end.

%% @doc 任命成员职位
appoint_member_pos(GuildID, RoleID, TargetID, Pos) ->
    case catch check_appoint_member_pos(GuildID, RoleID, TargetID, Pos) of
        {ok, OldGuild, NewGuild, PosList} ->
            handle_appoint_result(NewGuild, PosList),
            update_guild_info(NewGuild),
            Pos =:= ?GUILD_POS_CHIEF andalso handle_chief_changed(OldGuild, NewGuild, false),
            send_pos_change_rumor(GuildID, TargetID, Pos, NewGuild#guild.level),
            Rec = #sc_guild_appoint_pos{},
            {ok, Bin} = prot_msg:encode_msg(41436, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

%% @doc 检查任命成员职位
check_appoint_member_pos(GuildID, RoleID, TargetID, Pos) ->
    Guild = get_guild_info(GuildID),
    #guild{chief_id = ChiefID, members = Members, level = Level} = Guild,
    if
        RoleID > 0 ->
            MemRole = lists:keyfind(RoleID, #guild_member.role_id, Members),
            MemRole =/= false orelse erlang:throw({error, ?RC_GUILD_ROLE_IS_NOT_GUILD_MEM}),
            #guild_member{pos = RolePos} = MemRole;
        true ->
            MemRole = lists:keyfind(ChiefID, #guild_member.role_id, Members),
            RolePos = ?GUILD_POS_GM
    end,
    MemTarget = lists:keyfind(TargetID, #guild_member.role_id, Members),
    MemTarget =/= false orelse erlang:throw({error, ?RC_GUILD_TARGET_IS_NOT_GUILD_MEM}),
    #guild_member{pos = TargetPos} = MemTarget,
    TargetName = lib_cache:get_role_name(TargetID),
    {NewGuild, PosList} =
        if
            RolePos =< ?GUILD_POS_ELDER ->
                erlang:throw({error, ?RC_GUILD_NORMAL_CANNOT_OP});
            Pos =:= ?GUILD_POS_CHIEF andalso ChiefID > 0 -> %% 玩家禅让
                RolePos =:= ?GUILD_POS_CHIEF orelse erlang:throw({error, ?RC_GUILD_ONLY_CHIEF_CAN_ABDICATE}),
                Members1 = lists:keystore(ChiefID, #guild_member.role_id, Members, MemRole#guild_member{pos = ?GUILD_POS_NORMAL}),
                Members2 = lists:keystore(TargetID, #guild_member.role_id, Members1, MemTarget#guild_member{pos = ?GUILD_POS_CHIEF}),
                Guild1 = Guild#guild{members = Members2, chief_id = TargetID, chief_name = TargetName},
                {Guild1, [{ChiefID, ?GUILD_POS_NORMAL}, {TargetID, ?GUILD_POS_CHIEF}]};
            Pos =:= ?GUILD_POS_CHIEF -> %% GM禅让
                Members1 = lists:keystore(TargetID, #guild_member.role_id, Members, MemTarget#guild_member{pos = ?GUILD_POS_CHIEF}),
                Guild1 = Guild#guild{members = Members1, chief_id = TargetID, chief_name = TargetName},
                {Guild1, [{TargetID, ?GUILD_POS_CHIEF}]};
            RoleID =:= TargetID -> %% 卸任
                RolePos =/= ?GUILD_POS_CHIEF orelse erlang:throw({error, ?RC_GUILD_CHIEF_CAN_NOT_STEP_DOWN}),
                Pos =:= ?GUILD_POS_NORMAL orelse erlang:throw({error, ?RC_GUILD_STEP_DOWN_TO_NORMAL_ONLY}),
                Members1 = lists:keystore(RoleID, #guild_member.role_id, Members, MemRole#guild_member{pos = ?GUILD_POS_NORMAL}),
                {Guild#guild{members = Members1}, [{RoleID, ?GUILD_POS_NORMAL}]};
            true -> %% 提、降
                RolePos > TargetPos orelse erlang:throw({error, ?RC_GUILD_CAN_ONLY_APPOINT_POS_LOWER}),
                RolePos > Pos orelse erlang:throw({error, ?RC_GUILD_APPOINT_POS_LARGE_THAN_SELF}),
                %% 职位人数
                CurNum = get_pos_member_num(Members, Pos),
                MaxNum = get_max_pos_mem_num(Pos, Level),
                CurNum < MaxNum orelse erlang:throw({error, ?RC_GUILD_POS_MEM_NUM_LIMIT}),
                Members1 = lists:keystore(TargetID, #guild_member.role_id, Members, MemTarget#guild_member{pos = Pos}),
                {Guild#guild{members = Members1}, [{TargetID, Pos}]}
        end,
    NewGuild2 = ?iif(Pos =:= ?GUILD_POS_NORMAL, NewGuild,
        add_log(NewGuild, ?GUILD_LOG_POS_CHG, [TargetName, get_pos_string(Pos, Level)])),
    {ok, Guild, NewGuild2, PosList}.

handle_appoint_result(Guild, PosList) ->
    #guild{id = GuildID, name = GuildName} = Guild,
    ok = ?DB:transaction(fun() ->
        [set_role_guild_pos(RID, GuildID, GuildName, RPos) || {RID, RPos} <- PosList],
        ok
    end),
    Rec = #sc_guild_notify_pos{change = PosList},
    {ok, Bin} = prot_msg:encode_msg(41438, Rec),
    broadcast(GuildID, Bin).

handle_chief_changed(OldGuild, NewGuild, Impeach) ->
    #guild{chief_id = OldChiefID} = OldGuild,
    OldChiefName = lib_cache:get_role_name(OldChiefID),
    #guild{id = GuildID, chief_id = NewChiefID} = NewGuild,
    NewChiefName = lib_cache:get_role_name(NewChiefID),
    set_guild_chief_db(GuildID, NewChiefID, NewChiefName),
    send_become_guild_chief_rumor(GuildID, NewChiefID),
    Impeach andalso begin
        MailID = config:get_sys_config(guild_chief_abdicate_mail),
        Fun = fun(Title, Content) -> {Title, io_lib:format(Content, [OldChiefName, NewChiefName])} end,
        {Title, Content} = lib_mail:format_mail_temp(MailID, Fun),
        send_guild_mail(NewGuild, Title, Content, [])
    end,
    ok.

%% @doc 踢人
kick_out(GuildID, RoleID, TargetID) ->
    case catch check_kick_out(GuildID, RoleID, TargetID) of
        {ok, _OldGuild, NewGuild, NewTargetData, NeedDel, NeedNewChief} ->
            update_guild_info(NewGuild),
            update_role_data(TargetID, NewTargetData),
            kick_out_db(TargetID),
            notify_kick_from_guild(GuildID, NewGuild#guild.name, TargetID),
            send_leave_rumor(GuildID, TargetID),
            NeedNewChief andalso auto_renew_chief(NewGuild#guild{chief_id = 0}),
            NeedDel andalso dismiss_guild(NewGuild),
            Rec = #sc_guild_kick_member{id = TargetID},
            {ok, Bin} = prot_msg:encode_msg(41430, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_kick_out(GuildID, RoleID, TargetID) ->
    Guild = get_guild_info(GuildID),
    #guild{members = Members, chief_id = ChiefID} = Guild,
    TRoleBase = lib_cache:get_role_base(TargetID),
    #{name := TName} = TRoleBase,
    MemTarget = lists:keyfind(TargetID, #guild_member.role_id, Members),
    MemTarget =/= false orelse erlang:throw({error, ?RC_GUILD_TARGET_IS_NOT_GUILD_MEM}),
    #guild_member{pos = TargetPos} = MemTarget,
    %% 非GM处理
    RoleID > 0 andalso begin
        MemRole = check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
        #guild_member{pos = RolePos} = MemRole,
        RolePos > TargetPos orelse erlang:throw({error, ?RC_GUILD_CAN_ONLY_KICK_POS_LOWER}),
        is_forbidden_leave() andalso erlang:throw({error, ?RC_GUILD_CANNOT_KICK_WHILE_IN_GUILD_ACT})
    end,
    NewMembers = lists:keydelete(TargetID, #guild_member.role_id, Members),
    NewChiefID = ?iif(TargetPos =:= ?GUILD_POS_CHIEF, 0, ChiefID),
    NewGuild = add_log(Guild#guild{
        members = NewMembers, chief_id = NewChiefID
    }, ?GUILD_LOG_KICKED, [TName]),
    TargetData = get_role_data(TargetID),
    Now = time:unixtime(),
    NewTargetData = TargetData#guild_role{guild_id = 0, last_leave = Now, cont = 0},
    NeedDel = erlang:length(NewMembers) =:= 0,
    NeedNewChief = (not NeedDel) andalso TargetPos =:= ?GUILD_POS_CHIEF,
    {ok, Guild, NewGuild, NewTargetData, NeedDel, NeedNewChief}.

notify_kick_from_guild(GuildID, GuildName, TargetID) ->
    Rec = #sc_guild_notify_kick{id = GuildID},
    {ok, Bin} = prot_msg:encode_msg(41431, Rec),
    lib_role_send:send_to_role(TargetID, Bin),
    notify_leave_guild(GuildID, TargetID),
    TempID = config:get_sys_config(guild_kick_mail),
    svr_mail:sys2p(TargetID, TempID, join_mail_temp_fun(GuildName), [], ?OPT_GM),
    ok.

%% @doc 离开帮派
leave(GuildID, RoleID) ->
    case catch check_leave_guild(GuildID, RoleID) of
        {ok, _OldGuild, NewGuild, NewData, NeedDel} ->
            kick_out_db(RoleID),
            update_guild_info(NewGuild),
            update_role_data(RoleID, NewData),
            notify_leave_guild(GuildID, RoleID),
            NeedDel andalso svr_guild_mgr:delete_guild(GuildID, NewGuild#guild.num),
            send_leave_rumor(GuildID, RoleID),
            Rec = #sc_guild_leave{},
            {ok, Bin} = prot_msg:encode_msg(41426, Rec),
            lib_role_send:send_to_role(RoleID, Bin),
            {ok, NeedDel};
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_leave_guild(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    #guild{members = Members} = Guild,
    RoleBase = lib_cache:get_role_base(RoleID),
    #{name := RName} = RoleBase,
    %% 是否帮派成员
    MemRole = lists:keyfind(RoleID, #guild_member.role_id, Members),
    MemRole =/= false orelse erlang:throw({error, ?RC_GUILD_ROLE_IS_NOT_GUILD_MEM}),
    %% 帮派成员不少于1人时禁止帮主退出
    #guild_member{pos = RolePos} = MemRole,
    MemNum = erlang:length(Members),
    (RolePos =:= ?GUILD_POS_CHIEF andalso MemNum > 1) andalso erlang:throw({error, ?RC_GUILD_CHIEF_CAN_NOT_LEAVE}),
    is_forbidden_leave() andalso erlang:throw({error, ?RC_GUILD_CANNOT_LEAVE_WHILE_IN_GUILD_ACT}),
    NewMembers = lists:keydelete(RoleID, #guild_member.role_id, Members),
    NeedDel = RolePos =:= ?GUILD_POS_CHIEF,
    NeedDel andalso (dismiss_guild(GuildID) orelse erlang:throw({error, ?RC_SYS_ERROR})),
    case RolePos =:= ?GUILD_POS_CHIEF of
        false ->
            NewGuild = add_log(Guild#guild{members = NewMembers}, ?GUILD_LOG_LEAVE, [RName]);
        _ ->
            NewGuild = Guild#guild{
                members = NewMembers, chief_id = 0, chief_name = ""
            }
    end,
    RoleData = get_role_data(RoleID),
    Now = time:unixtime(),
    NewData = RoleData#guild_role{guild_id = 0, last_leave = Now, cont = 0},
    {ok, Guild, NewGuild, NewData, NeedDel}.

notify_leave_guild(GuildID, RoleID) ->
    Rec = #sc_guild_notify_leave{id = RoleID},
    {ok, Bin} = prot_msg:encode_msg(41428, Rec),
    broadcast(GuildID, Bin).

%% @doc 更改公告
change_announce(GuildID, RoleID, Announce) ->
    case catch check_change_announce(GuildID, RoleID, Announce) of
        {ok, NewGuild} ->
            update_guild_info(NewGuild),
            notify_announce_change(NewGuild),
            Rec = #sc_guild_change_announce{},
            {ok, Bin} = prot_msg:encode_msg(41440, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_change_announce(GuildID, RoleID, Announce) ->
    Guild = get_guild_info(GuildID),
    check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
    NewAnnounce = util:escape_varchar(Announce),
    util:check_filter(NewAnnounce) andalso erlang:throw({error, ?RC_CHAT_SENSITIVE_CONTENT}),
    {MinLen, MaxLen} = config:get_sys_config(guild_announce_length),
    util:check_length(NewAnnounce, MinLen, MaxLen) orelse erlang:throw({error, ?RC_GUILD_ANNOUNCE_LENGTH_LIMIT}),
    NewGuild = Guild#guild{announce = NewAnnounce},
    {ok, NewGuild}.

notify_announce_change(Guild) ->
    #guild{id = GuildID, announce = Announce} = Guild,
    Rec = #sc_guild_notify_announce{announce = Announce},
    {ok, Bin} = prot_msg:encode_msg(41443, Rec),
    broadcast(GuildID, Bin).

%% @doc 设置招人条件
change_accept_type(GuildID, RoleID, Type, Auto) ->
    case catch check_change_accept_type(GuildID, RoleID, Type, Auto) of
        {ok, NewGuild} ->
            update_guild_info(NewGuild),
            Rec = #sc_guild_change_accept_type{type = Type, auto = Auto},
            {ok, Bin} = prot_msg:encode_msg(41442, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_change_accept_type(GuildID, RoleID, Type, Auto) ->
    Guild = get_guild_info(GuildID),
    check_guild_member(GuildID, RoleID, ?GUILD_POS_SUB_CHIEF),
    ConfAccept = conf_guild_accept:get(Type),
    ConfAccept =/= undefined orelse erlang:throw({error, ?RC_GUILD_INVALID_ACCEPT_TYPE}),
    NewGuild = Guild#guild{accept_type = Type, auto_accept = Auto},
    {ok, NewGuild}.

%% @doc 喊话招募
recruit(GuildID, RoleID) ->
    case catch check_recruit(GuildID, RoleID) of
        {ok, NewGuild, RumorID, Args, RecruitTime} ->
            update_guild_info(NewGuild),
            svr_rumor:publish(world, RumorID, Args),
            Rec = #sc_guild_recruit{recruit_time = RecruitTime},
            {ok, Bin} = prot_msg:encode_msg(41448, Rec),
            broadcast(GuildID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_recruit(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    check_guild_member(GuildID, RoleID, ?GUILD_POS_SUB_CHIEF),
    #guild{name = Name, recruit = LastRecruit, accept_type = Type} = Guild,
    CD = config:get_sys_config(guild_recruit_cd),
    Now = time:unixtime(),
    Now - LastRecruit > CD orelse erlang:throw({error, ?RC_GUILD_RECRUIT_IN_CD}),
    Rumor = config:get_sys_config(guild_recruit_rumor),
    ConfAccept = conf_guild_accept:get(Type),
    ConfAccept =/= undefined orelse erlang:throw({error, ?RC_GUILD_INVALID_ACCEPT_TYPE}),
    #{fight := Fight} = ConfAccept,
    NewGuild = Guild#guild{recruit = Now},
    Args = [Name, Fight, GuildID],
    {ok, NewGuild, Rumor, Args, Now}.

%% @doc 邀请加入帮派
invite(GuildID, RoleID, TargetID) ->
    case catch check_invite(GuildID, RoleID, TargetID) of
        {ok, Guild} ->
            notify_new_invite(Guild, RoleID, TargetID),
            Rec = #sc_invite_join_guild{role_id = TargetID},
            {ok, Bin} = prot_msg:encode_msg(41422, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_invite(GuildID, _RoleID, TargetID) ->
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_GUILD_TARGET_IS_NOT_ONLINE}),
    Guild = get_guild_info(GuildID),
    #guild{members = Members} = Guild,
%%    check_guild_member(Guild, RoleID, ?GUILD_POS_ELDER),
    %% 帮派人数限制
    CurNum = erlang:length(Members),
    MaxNum = get_max_member_num(GuildID),
    CurNum < MaxNum orelse erlang:throw({error, ?RC_GUILD_NO_MORE_MEMBER}),
    %% 对方是否已经拥有帮派
    TargetData = get_role_data(TargetID),
    #guild_role{guild_id = TGuildID} = TargetData,
    TGuildID > 0 andalso erlang:throw({error, ?RC_GUILD_TARGET_ALREADY_HAVE_GUILD}),
    {ok, Guild}.

notify_new_invite(Guild, RoleID, TargetID) ->
    #guild{id = GuildID, name = GuildName} = Guild,
    RoleName = lib_cache:get_role_name(RoleID),
    Rec = #sc_new_guild_invite{
        guild_id = GuildID, guild_name = GuildName,
        role_id = RoleID, role_name = RoleName
    },
    {ok, Bin} = prot_msg:encode_msg(41424, Rec),
    lib_role_send:send_to_role(TargetID, Bin).

%% @doc 申请加入帮派
apply_for(GuildID, Apply) ->
    case catch check_apply_for(GuildID, Apply) of
        {join, NewGuild, RoleID} ->
            update_guild_info(NewGuild),
            notify_apply_result(?GUILD_APPLY_APPROVE, NewGuild, [RoleID]),
            join;
        {apply, NewGuild, ApplyRec} ->
            update_guild_info(NewGuild),
            add_apply_db(GuildID, ApplyRec),
            notify_new_apply(GuildID, ApplyRec),
            apply;
        {error, Code} ->
            {error, Code}
    end.

check_apply_for(GuildID, Apply) ->
    {RoleID, Name, Level, Fight, _VipLv} = Apply,
    RoleData = get_role_data(RoleID),
    #guild_role{guild_id = RoleGuildID} = RoleData,
    RoleGuildID =:= 0 orelse erlang:throw({error, ?RC_GUILD_ALREADY_HAVE_GUILD}),
    Guild = get_guild_info(GuildID),
    #guild{apply = ApplyList, accept_type = AcceptType, auto_accept = AutoAccept, members = Members} = Guild,
    MemRole = lists:keyfind(RoleID, #guild_member.role_id, Members),
    MemRole =:= false orelse erlang:throw({error, ?RC_GUILD_ALREADY_GUILD_MEMBER}),
    is_forbidden_join() andalso erlang:throw({error, ?RC_GUILD_FORBIDDEN_JOIN}),
    CurNum = erlang:length(Members),
    MaxNum = get_max_member_num(GuildID),
    NotFull = CurNum < MaxNum,
    ConfAccept = conf_guild_accept:get(AcceptType),
    #{fight := AutoFight} = ConfAccept,
    Auto = AutoAccept =:= 1 andalso Fight >= AutoFight andalso NotFull,
    ApplyRec = #guild_apply{role_id = RoleID, role_name = Name, level = Level, fight = Fight},
    NewList = [ApplyRec | lists:keydelete(RoleID, #guild_apply.role_id, ApplyList)],
    NewGuild = Guild#guild{apply = NewList},
    case NotFull andalso Auto andalso (catch approve_one_role(NewGuild, RoleID)) of
        JoinGuild when is_record(JoinGuild, guild) ->
            {join, JoinGuild, RoleID};
        _ when NotFull ->
            {apply, NewGuild, ApplyRec};
        _ ->
            erlang:throw({error, ?RC_GUILD_NO_MORE_MEMBER})
    end.

notify_new_apply(GuildID, Apply) ->
    #guild_apply{role_id = RoleID, role_name = Name, level = Level, fight = Fight} = Apply,
    Rec = #sc_guild_notify_join_req{
        id = RoleID, name = Name, level = Level, fight = Fight
    },
    {ok, Bin} = prot_msg:encode_msg(41417, Rec),
    broadcast_to_pos(GuildID, {ge, ?GUILD_POS_ELDER}, Bin).

%% @doc 删号
role_delete(GuildID, RoleIDs) ->
    case get_guild_info(GuildID) of
        undefined ->
            skip;
        #guild{apply = ApplyList} = Guild ->
            {ApplyListN, NotifyIds} = lists:foldl(fun(H = #guild_apply{role_id = RoleID}, {ApplyAcc, NotifyAcc}) ->
                ?iif(lists:member(RoleID, RoleIDs), {ApplyAcc, [RoleID | NotifyAcc]}, {[H | ApplyAcc], NotifyAcc})
            end, {[], []}, ApplyList),
            NotifyIds =/= [] andalso notify_cancel_apply(GuildID, NotifyIds),
            update_guild_info(Guild#guild{apply = ApplyListN})
    end.


%% @doc 取消申请
cancel_apply(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    #guild{apply = ApplyList} = Guild,
    NewList = lists:keydelete(RoleID, #guild_apply.role_id, ApplyList),
    %% 如果有该玩家的申请
    ApplyList =/= NewList andalso begin
        NewGuild = Guild#guild{apply = NewList},
        update_guild_info(NewGuild),
        del_apply_db(GuildID, RoleID),
        notify_cancel_apply(GuildID, RoleID)
    end.

notify_cancel_apply(GuildID, RoleID) when is_integer(RoleID) ->
    notify_cancel_apply(GuildID, [RoleID]);
notify_cancel_apply(GuildID, RoleList) when is_list(RoleList) ->
    Rec = #sc_guild_notify_cancel_req{list = RoleList},
    {ok, Bin} = prot_msg:encode_msg(41418, Rec),
    broadcast_to_pos(GuildID, {ge, ?GUILD_POS_ELDER}, Bin).

%% @doc 获取申请列表
get_apply_list(GuildID, RoleID) ->
    case catch check_get_apply_list(GuildID, RoleID) of
        {ok, List} ->
            Rec = #sc_guild_get_join_req{list = List},
            {ok, Bin} = prot_msg:encode_msg(41410, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_get_apply_list(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    #guild{apply = ApplyList} = Guild,
    check_guild_member(Guild, RoleID, ?GUILD_POS_ELDER),
    List = convert_apply_list(ApplyList, []),
    {ok, List}.

convert_apply_list([], Acc) ->
    Acc;
convert_apply_list([Apply | T], Acc) ->
    #guild_apply{role_id = RoleID} = Apply,
    case has_guild(RoleID) of
        true ->
            convert_apply_list(T, Acc);
        _ ->
            case convert_apply(Apply) of
                invalid -> convert_apply_list(T, Acc);
                Convert -> convert_apply_list(T, [Convert | Acc])
            end
    end.

convert_apply(Apply) ->
    #guild_apply{role_id = RoleID} = Apply,
    case lib_cache:get_role_base(RoleID) of
        RoleBase when is_map(RoleBase) ->
            #{name := RoleName, level := RoleLv, fight := RoleFight} = RoleBase,
            Info =
                #clt_guild_request{
                    id = RoleID, name = RoleName, level = RoleLv, fight = erlang:floor(RoleFight)
                },
            case lib_cache:get_role_view(RoleID) of
                #{icon := Icon, frame := Frame} ->
                    Info#clt_guild_request{icon = Icon, frame = Frame};
                _ ->
                    Info
            end;
        _ ->
            invalid
    end.

%% @doc 申请操作
handle_apply(GuildID, RoleID, Action, TargetID) ->
    case catch check_handle_apply(GuildID, RoleID, Action, TargetID) of
        {ok, NewGuild, RoleList} ->
            update_guild_info(NewGuild),
            notify_apply_result(Action, NewGuild, RoleList),
            Rec = #sc_guild_handle_req{list = RoleList, approve = Action},
            {ok, Bin} = prot_msg:encode_msg(41420, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_handle_apply(GuildID, RoleID, Action, TargetID) ->
    Guild = get_guild_info(GuildID),
    #guild{members = Members} = Guild,
    check_guild_member(Guild, RoleID, ?GUILD_POS_ELDER),
    CurNum = erlang:length(Members),
    MaxNum = get_max_member_num(GuildID),
    {NewGuild, RoleList} =
        if
            Action =:= ?GUILD_APPLY_APPROVE andalso TargetID > 0 ->
                CurNum < MaxNum orelse erlang:throw({error, ?RC_GUILD_NO_MORE_MEMBER}),
                {approve_one_role(Guild, TargetID), [TargetID]};
            Action =:= ?GUILD_APPLY_APPROVE ->
                one_key_approve(MaxNum - CurNum, Guild, []);
            TargetID > 0 ->
                {reject_one_role(Guild, TargetID), [TargetID]};
            true ->
                one_key_reject(Guild, [])
        end,
    {ok, NewGuild, RoleList}.

one_key_approve(Num, Guild, Acc) when Num =< 0 ->
    {Guild, Acc};
one_key_approve(Num, #guild{apply = List} = Guild, Acc) when List =/= [] ->
    #guild_apply{role_id = TargetID} = hd(List),
    case catch approve_one_role(Guild, TargetID) of
        NewGuild when is_record(NewGuild, guild) ->
            one_key_approve(Num - 1, NewGuild, [TargetID | Acc]);
        {error, _Code} ->
            one_key_approve(Num, Guild#guild{apply = tl(List)}, Acc)
    end;
one_key_approve(_Num, Guild, Acc) ->
    {Guild, Acc}.

approve_one_role(Guild, TargetID) ->
    #guild{id = GuildID, apply = ApplyList, members = Members} = Guild,
    Apply = lists:keyfind(TargetID, #guild_apply.role_id, ApplyList),
    Apply =/= false orelse erlang:throw({error, ?RC_GUILD_TARGET_IS_NOT_IN_APPLY_LIST}),
    is_forbidden_join() andalso erlang:throw({error, ?RC_GUILD_FORBIDDEN_JOIN}),
    case svr_guild_mgr:approve_apply(GuildID, TargetID) of
        ok ->
            NewList = lists:keydelete(TargetID, #guild_apply.role_id, ApplyList),
            NewMembers = [#guild_member{role_id = TargetID, pos = ?GUILD_POS_NORMAL} | Members],
            #guild_apply{role_name = TName} = Apply,
            NewGuild = add_log(Guild#guild{apply = NewList, members = NewMembers}, ?GUILD_LOG_JOIN, [TName]),
            NewGuild;
        {error, Code} ->
            erlang:throw({error, Code})
    end.

one_key_reject(#guild{apply = List} = Guild, Acc) when List =:= [] ->
    {Guild, Acc};
one_key_reject(Guild, Acc) ->
    #guild{apply = List} = Guild,
    #guild_apply{role_id = TargetID} = hd(List),
    case catch reject_one_role(Guild, TargetID) of
        NewGuild when is_record(NewGuild, guild) ->
            one_key_reject(NewGuild, [TargetID | Acc]);
        {error, _Code} ->
            one_key_reject(Guild, Acc)
    end.

reject_one_role(Guild, TargetID) ->
    #guild{apply = ApplyList} = Guild,
    Apply = lists:keytake(TargetID, #guild_apply.role_id, ApplyList),
    Apply =/= false orelse erlang:throw({error, ?RC_GUILD_TARGET_IS_NOT_IN_APPLY_LIST}),
    {value, _, NewList} = Apply,
    NewGuild = Guild#guild{apply = NewList},
    NewGuild.

notify_apply_result(?GUILD_APPLY_APPROVE, Guild, RoleList) ->
    GuildList = get_guild_list(),
    #guild{id = GuildID, name = GuildName} = Guild,
    Rec = #sc_guild_approve_result{id = GuildID, name = GuildName, approve = 1},
    {ok, Bin} = prot_msg:encode_msg(41423, Rec),
    send_join_mail(RoleList, GuildName),
    NewMembers =
        [begin
            set_role_guild_pos(RoleID, GuildID, GuildName, ?GUILD_POS_NORMAL),
            %% 删除帮派申请
            [svr_guild:cancel_apply(GID, RoleID) || GID <- GuildList, GID =/= GuildID],
            del_apply_db(GuildID, RoleID),
            lib_role_send:send_to_role(RoleID, Bin),
            RoleBase = lib_cache:get_role_base(RoleID),
            #{name := RoleName, fight := Fight, level := Lv, offline := Offline,
                vip_lv := VipLv, gender := Sex} = RoleBase,
            send_join_rumor(GuildID, RoleName),
            NewOffline = ?iif(lib_role:is_online(RoleID), 0, Offline),
            #clt_guild_member{
                id = RoleID, pos = ?GUILD_POS_NORMAL, name = RoleName,
                fight = erlang:floor(Fight), contri = 0, level = Lv,
                offline = NewOffline, vip_lv = VipLv, gender = Sex
            }
        end || RoleID <- RoleList],
    Rec2 = #sc_guild_notify_join{list = NewMembers},
    {ok, Bin2} = prot_msg:encode_msg(41427, Rec2),
    broadcast_except(GuildID, Bin2, RoleList);
notify_apply_result(_Action, Guild, RoleList) ->
    #guild{id = GuildID} = Guild,
    Rec = #sc_guild_approve_result{id = GuildID, approve = 0},
    {ok, Bin} = prot_msg:encode_msg(41423, Rec),
    [begin
        del_apply_db(GuildID, RoleID),
        lib_role_send:send_to_role(RoleID, Bin)
    end || RoleID <- RoleList],
    notify_cancel_apply(GuildID, RoleList).

%% @doc 同意申请 [管理进程]
approve_apply(GuildID, TargetID) when is_integer(GuildID) ->
    RoleData = get_role_data(TargetID),
    #guild_role{guild_id = CurGuildID} = RoleData,
    case CurGuildID =:= 0 of
        true ->
            NewData = RoleData#guild_role{guild_id = GuildID, last_join = time:unixtime()},
            update_role_data(TargetID, NewData),
            ok;
        _ ->
            {error, ?RC_GUILD_ALREADY_HAVE_GUILD}
    end.

%% @doc 筛选符合快速加入的帮派
fast_select(RoleID, Level, VipLv) ->
    AutoLv = Level >= ?AUTO_ACCEPT_LEVEL,
    AutoVip = VipLv > 0,
    Fun = fun(Guild, {AutoAcc, NormalAcc}) ->
        #guild{
            id = GuildID, accept_type = AcceptType, members = Members,
            apply = ApplyList
        } = Guild,
        CurNum = erlang:length(Members),
        MaxNum = get_max_member_num(GuildID),
        Full = CurNum >= MaxNum,
        Apply = lists:keyfind(RoleID, #guild_apply.role_id, ApplyList),
        if
            Full orelse Apply =/= false ->
                {AutoAcc, NormalAcc};
            (AcceptType band ?ACCEPT_TYPE_LEVEL > 0 andalso AutoLv) orelse
                (AcceptType band ?ACCEPT_TYPE_VIP > 0 andalso AutoVip) ->
                {[GuildID | AutoAcc], NormalAcc};
            AcceptType > 0 ->
                {AutoAcc, NormalAcc};
            true ->
                {AutoAcc, [GuildID | NormalAcc]}
        end
    end,
    {AutoList, NormalList} = ets:foldl(Fun, {[], []}, ?ETS_GUILD),
    if
        AutoList =/= [] ->
            util:list_rand(AutoList);
        NormalList =/= [] ->
            util:list_rand(NormalList);
        true ->
            0
    end.

%% @doc 玩家上线
online(GuildID, RoleID) ->
%%    RoleData = get_role_data(RoleID),
%%    NewData = RoleData#guild_role{},
%%    set_role_data(RoleID, NewData),
    notify_member_online(GuildID, RoleID, 0),
    ok.

%% @doc 玩家下线
offline(GuildID, RoleID) ->
    Now = time:unixtime(),
%%    RoleData = get_role_data(RoleID),
%%    NewData = RoleData#guild_role{},
%%    set_role_data(RoleID, NewData),
    notify_member_online(GuildID, RoleID, Now),
    ok.

notify_member_online(GuildID, RoleID, Time) ->
    Rec = #sc_guild_notify_online{
        role_id = RoleID, time = Time
    },
    {ok, Bin} = prot_msg:encode_msg(41445, Rec),
    broadcast(GuildID, Bin).

%% @doc 帮派改名 [玩家, 帮派进程]
rename(GuildID, RoleID, Name) ->
    case catch check_normal_rename(GuildID, RoleID, Name) of
        {ok, NewGuild} ->
            update_guild_info(NewGuild),
            notify_guild_rename(NewGuild),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_normal_rename(GuildID, RoleID, NewName) ->
    Guild = get_guild_info(GuildID),
    #guild{name = OldName} = Guild,
    if
        RoleID > 0 -> %% 是否帮派成员
            check_guild_member(Guild, RoleID, ?GUILD_POS_CHIEF);
        true ->
            ok
    end,
    OldName =/= NewName orelse erlang:throw({error, ?RC_GUILD_NAME_SAME_AS_CURRENT}),
    check_guild_name(NewName),
    case svr_guild_mgr:change_name(GuildID, NewName) of
        ok ->
            NewGuild = Guild#guild{name = NewName},
            {ok, NewGuild};
        {error, Code} ->
            {error, Code}
    end.

notify_guild_rename(GuildInfo) ->
    #guild{id = GuildID, name = NewName} = GuildInfo,
    guild_info(GuildID, {guild_rename, NewName}),
    Rec = #sc_guild_notify_rename{guild_id = GuildID, guild_name = NewName},
    {ok, Bin} = prot_msg:encode_msg(41437, Rec),
    broadcast(GuildInfo, Bin).

%% @doc 帮派改名 [管理进程]
change_name(GuildID, Name) ->
    case ?DB:transaction(fun() ->
        DuplicateSQL = io_lib:format(?SQL_GET_GUILD_BY_NAME, [Name]),
        ?DB:get_one(DuplicateSQL) =:= undefined orelse erlang:throw({error, ?RC_GUILD_HAVE_SAME_NAME_GUILD}),
        RenameSQL = io_lib:format(?SQL_SET_GUILD_NAME, [Name, GuildID]),
        ?DB:execute(RenameSQL),
        ok
    end) of
        ok ->
            ok;
        {aborted, {error, Code}} ->
            {error, Code};
        {aborted, Error} ->
            ?ERROR("rename guild failed, guild_id ~w, new name ~s, error ~w", [GuildID, Name, Error]),
            {error, ?RC_SYS_ERROR}
    end.

%% @doc 帮派升级
upgrade(GuildID, RoleID) ->
    case catch check_upgrade(GuildID, RoleID) of
        {ok, Guild} ->
            update_guild_info(Guild),
            notify_build_change(Guild#guild.build),
            handle_guild_upgrade(Guild);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_upgrade(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    #guild{funds = Funds, level = Level, build = Build} = Guild,
    check_can_up(Level, Build) orelse erlang:throw({error, ?RC_GUILD_BUILD_NOT_ENOUGH}),
    check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
    NewLevel = Level + 1,
    ID = ?GUILD_BUILD_LOYALTY,
    Conf = conf_guild_build:get(ID, NewLevel),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GUILD_BUILD_LEVEL_MAX}),
    NeedHaveFunds0 = calc_need_have_funds(Build),
    #{cost_funds := CostFunds} = Conf,
    NeedHaveFunds = CostFunds + NeedHaveFunds0,
    Funds >= NeedHaveFunds orelse erlang:throw({error, ?RC_GUILD_FUND_NOT_ENOUGH}),
    NewFunds = Funds - CostFunds,
    NewBuild = util:prop_store(ID, NewLevel, Build),
    NewGuild = Guild#guild{funds = NewFunds, level = NewLevel, build = NewBuild},
    {ok, NewGuild}.

%% @doc 增加帮派资金
add_funds(GuildID, RoleID, Funds, _OpType) ->
    Guild = get_guild_info(GuildID),
    #guild{funds = OldFunds} = Guild,
    NewFunds = erlang:floor(OldFunds + Funds),
    NewGuild = Guild#guild{funds = NewFunds},
    update_guild_info(NewGuild),
    RoleID > 0 andalso
        begin
            RoleData = get_role_data(RoleID),
            #guild_role{weekly_funds = WeeklyFunds} = RoleData,
            NewData = RoleData#guild_role{weekly_funds = WeeklyFunds + Funds},
            update_role_data(RoleID, NewData)
        end,
    notify_funds_change(NewGuild),
    ok.

handle_guild_upgrade(Guild) ->
    save_guild_data(Guild),
    #guild{id = GuildID, level = NewLevel, funds = Funds} = Guild,
%%    guild_info(GuildID, {guild_upgrade, NewLevel}),
    %% 帮派升级传闻
    send_guild_upgrade_rumor(GuildID, NewLevel),
    %% 帮派升级通知
    Rec = #sc_guild_notify_level_up{level = NewLevel, funds = Funds},
    {ok, Bin} = prot_msg:encode_msg(41444, Rec),
    broadcast(Guild, Bin),
    ok.

%% @doc 增加活跃值
add_live_exp(GuildID, RoleID, AddExp) ->
    Guild = get_guild_info(GuildID),
    #guild{today_live = TodayLive, battle = Battle} = Guild,
    NewTodayLive = TodayLive + AddExp,
    #{max_battle := MaxBattle} = conf_guild_declare:get(),
    NewBattle = min(MaxBattle, Battle + AddExp),
    NewGuild = Guild#guild{today_live = NewTodayLive, battle = NewBattle},
    update_guild_info(NewGuild),
    RoleID > 0 andalso begin
        RoleData = get_role_data(RoleID),
        #guild_role{weekly_live = WeeklyLive} = RoleData,
        NewData = RoleData#guild_role{weekly_live = WeeklyLive + AddExp},
        update_role_data(RoleID, NewData)
    end,
    ok.

%% @doc 记录历史贡献
add_cont(_GuildID, RoleID, Cont) ->
    RoleData = get_role_data(RoleID),
    #guild_role{cont = OCont, weekly_cont = WeeklyCont} = RoleData,
    NewData = RoleData#guild_role{cont = OCont + Cont, weekly_cont = WeeklyCont + Cont},
    update_role_data(RoleID, NewData).

%% @doc 获取帮派记录
get_guild_logs(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    #guild{record = Logs} = Guild,
    Rec = #sc_guild_logs{logs = Logs},
    {ok, Bin} = prot_msg:encode_msg(41450, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc 进入帮派领地
enter_seat(GuildID, RoleID) ->
    case catch check_enter_seat(GuildID, RoleID) of
        ok -> ok;
        {error, Code} -> {error, Code}
    end.

check_enter_seat(GuildID, RoleID) ->
    RoleData = get_role_data(RoleID),
    #guild_role{last_leave = _LastLeave, guild_id = CGuildID} = RoleData,
    CGuildID =:= GuildID orelse erlang:throw({error, ?RC_GUILD_ROLE_IS_NOT_GUILD_MEM}),
%%    CD = config:get_sys_config(guild_leave_guild_enter_seat_cd),
%%    Now = time:unixtime(),
%%    Now - LastLeave >= CD orelse erlang:throw({error, ?RC_GUILD_LEAVE_GUILD_ENTER_SEAT_CD}),
    ok.

%% @doc GM减少帮派资金
gm_reduce_funds(GuildID, RoleID, Funds, _OpType) ->
    Guild = get_guild_info(GuildID),
    #guild{funds = OldFunds} = Guild,
    NewFunds = erlang:floor(OldFunds - Funds),
    NewGuild = Guild#guild{funds = NewFunds},
    update_guild_info(NewGuild),
    Rec = #sc_guild_info{
        guild = lib_guild:get_guild_detail(NewGuild)
    },
    {ok, Bin} = prot_msg:encode_msg(41402, Rec),
    lib_role_send:send_to_role(RoleID, Bin),
    ok.

%% -----------------------------------------------------------------------------
%% 帮派烹饪
%% -----------------------------------------------------------------------------

%% @doc 烹饪
cook(GuildID, RoleID, Name, Type, AddVal) ->
    case catch check_cook(GuildID, RoleID, Name, Type, AddVal) of
        {ok, Guild, NVal} ->
            update_guild_info(Guild),
            {ok, NVal};
        {error, Code} ->
            {error, Code}
    end.

check_cook(GuildID, RoleID, Name, Type, AddVal) ->
    Guild = get_guild_info(GuildID),
    #guild{cook_val = CVal, cook_num = CNum, cook_logs = CLogs} = Guild,
    CNum < get_max_member_num(GuildID) orelse erlang:throw({error, ?RC_GUILD_MAX_COOK_NUM}),
    NVal = CVal + AddVal,
    NNum = CNum + 1,
    Now = time:unixtime(),
    NLogs = lists:sublist([{Now, RoleID, Name, Type} | CLogs], 1, ?GUILD_COOK_LOG_NUM),
    NewGuild = Guild#guild{cook_num = NNum, cook_val = NVal, cook_logs = NLogs},
    {ok, NewGuild, NVal}.

get_cook_val(GuildID) ->
    case get_guild_info(GuildID) of
        #guild{cook_val = Val} -> Val;
        _ -> 0
    end.

get_cook_info(GuildID) ->
    case get_guild_info(GuildID) of
        #guild{cook_val = Val, cook_num = Num, cook_logs = Logs} ->
            {Val, Num, Logs};
        _ ->
            {0, 0, []}
    end.

%% -----------------------------------------------------------------------------
%% 排行
%% -----------------------------------------------------------------------------

%% @doc 小时timer
timer_hour() ->
    refresh_rank(),
    ok.

%% @doc 排行信息
refresh_rank() ->
    Now = time:unixtime(),
    %% sort
    List = ets:foldl(fun(Guild, Acc) ->
        #guild{id = GuildID, members = Members} = Guild,
        [{GuildID, get_total_fight(Members)} | Acc]
    end, [], ?ETS_GUILD),
    Fun1 = fun({GuildID1, Fight1}, {GuildID2, Fight2}) ->
        if
            Fight1 > Fight2 -> true;
            Fight1 =:= Fight2 andalso GuildID1 < GuildID2 -> true;
            true -> false
        end
    end,
    SortList = lists:sort(Fun1, List),
    %% update
    Fun2 = fun({GuildID, Fight}, {Rank, RankAcc}) ->
        util:put_ets(?ETS_GUILD_OTHERS, {rank1, GuildID}, Rank),
        util:put_ets(?ETS_GUILD_OTHERS, {rank2, Rank}, GuildID),
        RankItem = ?rank_guild_fight#{
            rank => Rank, key => GuildID, guild_id => GuildID,
            fight => Fight, time => Now
        },
        {Rank + 1, [RankItem | RankAcc]}
    end,
    {_, RRankList} = lists:foldl(Fun2, {1, []}, SortList),
    RankList = lists:reverse(RRankList),
    erlang:spawn(
        fun() ->
            timer:sleep(5000),
            svr_rank:reset_rank(?RANK_GUILD_FIGHT, RankList)
        end),
    RankList.

%% @doc 获取帮派排名
get_rank_guild(Rank) ->
    GuildID = util:get_ets(?ETS_GUILD_OTHERS, {rank2, Rank}),
    case is_integer(GuildID) of
        true -> GuildID;
        _ -> 0
    end.

%% @doc 获取帮派排名
get_guild_rank(GuildID) ->
    Rank = util:get_ets(?ETS_GUILD_OTHERS, {rank1, GuildID}),
    case is_integer(Rank) of
        true -> Rank;
        _ -> 0
    end.

%% 筛选开启帮派守卫战的帮派
select_open_guild_defend() ->
    #{rank := NeedRank} = conf_guild_defend:get(),
    SelectMS = ets:fun2ms(
        fun({{RankType, Rank}, GuildID}) when RankType =:= rank2 andalso Rank =< NeedRank ->
            GuildID
        end),
    GuildIDList = ets:select(?ETS_GUILD_OTHERS, SelectMS),
    lists:filter(fun(GuildID) ->
        case lib_guild:get_guild_info(GuildID) of
            #guild{funds = Funds, level = GuildLv} ->
                #{guild_lv := NeedLv, guild_funds := NeedFunds} = conf_guild_defend:get(),
                Funds >= NeedFunds andalso GuildLv >= NeedLv;
            _ ->
                false
        end
    end, GuildIDList).

%% -----------------------------------------------------------------------------
%% 自动解散
%% -----------------------------------------------------------------------------

%% @doc 检查
desolation_guild_check() ->
    ?ERROR("start desolation check"),
    Time = time:unixtime() - ?GUILD_DESOLATION_SPAN,
    SQL = io_lib:format(?SQL_GET_DESOLATION_GUILD, [Time]),
    [delay_desolation_check(GuildID) || [GuildID] <- ?DB:get_all(SQL)],
    ok.

%% @doc 延迟检查
delay_desolation_check(GuildID) ->
    erlang:send_after(util:rand(300, 600) * 1000, svr_guild:p(GuildID), {desolation_check, GuildID}).

%% @doc 荒废检查
desolation_check(GuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{members = Members, num = Num} = Guild,
    Now = time:unixtime(),
    Span = config:get_sys_config(guild_desolation_span) * 24 * 3600,
    member_lose(Members, Now, Span) andalso begin
        case dismiss_guild(Guild) of
            true ->
                MailID = config:get_sys_config(guild_desolation_mail),
                send_guild_mail(Guild, MailID, []),
                [begin
                    RoleData = get_role_data(RoleID),
                    NewData = RoleData#guild_role{guild_id = 0},
                    update_role_data(RoleID, NewData),
                    %% 通知玩家帮派变化
                    role_guild_info(RoleID, {guild_pos_change, 0, <<"">>, 0, false})
                end || #guild_member{role_id = RoleID} <- Members],
                svr_guild_mgr:delete_guild(GuildID, Num);
            _ ->
                ignore
        end
    end.

member_lose([], _Now, _Span) ->
    true;
member_lose([Member | T], Now, Span) ->
    #guild_member{role_id = RoleID} = Member,
    case is_member_lose(RoleID, Now, Span) of
        true ->
            member_lose(T, Now, Span);
        _ ->
            false
    end.

is_member_lose(RoleID, Now, Span) ->
    (catch is_member_lose2(RoleID, Now, Span)).

is_member_lose2(RoleID, Now, Span) ->
    lib_role:is_online(RoleID) andalso erlang:throw(false),
    case lib_cache:get_role_base(RoleID) of
        #{offline := Offline} when Now - Offline < Span ->
            erlang:throw(false);
        _ ->
            next
    end,
    true.

%% @doc 解散帮派
dismiss_guild(GuildID) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    dismiss_guild(Guild);
dismiss_guild(Guild) ->
    DismissTime = time:unixtime(),
    #guild{id = GuildID, members = Members} = Guild,
    MemList = [{RoleID, Pos} || #guild_member{role_id = RoleID, pos = Pos} <- Members],
    case ?DB:transaction(fun() ->
        %% 备份、日志
        DbMembers = type:term_to_bitstring(MemList),
        BackupSQL = io_lib:format(?SQL_GUILD_DISMISS_BACKUP, [DbMembers, DismissTime, GuildID]),
        ?DB:execute(BackupSQL),
        %% 踢出帮派成员
        KickSQL = io_lib:format(?SQL_GUILD_DISMISS_KICK, [GuildID]),
        ?DB:execute(KickSQL),
        %% 删除帮派
        DelGuild = io_lib:format(?SQL_DEL_GUILD, [GuildID]),
        ?DB:execute(DelGuild),
        %% 删除申请
        DelGuildApply = io_lib:format(?SQL_DEL_GUILD_APPLY, [GuildID]),
        ?DB:execute(DelGuildApply),
        ok
    end) of
        ok ->
            svr_scene_mgr:close_line(get_seat_scene(), GuildID),
            svr_timer:unregister(),
            svr_rank:delete_rank(?RANK_GUILD_FIGHT, GuildID),
            svr_rank:delete_rank(?RANK_GUILD_LIVE, GuildID),
            svr_rank:delete_rank(?RANK_MASTER_GUILD, GuildID),
            true;
        {db_error, Error} ->
            ?ERROR("dismiss guild ~w failed due to ~w", [GuildID, Error]),
            false
    end.

%% -----------------------------------------------------------------------------
%% 自动弹劾
%% -----------------------------------------------------------------------------

%% @doc 自动弹劾检查
auto_impeach_check() ->
    IDList = get_guild_list(),
    [erlang:send_after(util:rand(300, 600) * 1000, svr_guild:p(GuildID), {auto_impeach, GuildID}) || GuildID <- IDList].

%% @doc 自动弹劾
auto_impeach(GuildID) ->
    case catch check_auto_impeach(GuildID) of
        {ok, NewGuild, ChiefID, Candidate} ->
            appoint_member_pos(NewGuild#guild.id, ChiefID, Candidate, ?GUILD_POS_CHIEF);
        _ ->
            ignore
    end.

check_auto_impeach(GuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{chief_id = ChiefID} = Guild,
    RoleBase = lib_cache:get_role_base(ChiefID),
    RoleBase =/= undefined orelse erlang:throw({error, fatal}),
    %% 帮主5天都不在线
    #{offline := LastOffline} = RoleBase,
    Now = time:unixtime(),
    AutoImpeachSpan = config:get_sys_config(guild_auto_impeach_day) * 24 * 3600,
    Sloth = not (Now - LastOffline < AutoImpeachSpan orelse lib_role:is_online(ChiefID)),
    Sloth orelse erlang:throw({error, not_sloth}),
    %% 按优先级选择新帮主
    Candidate = select_new_chief(Guild, true),
    Candidate > 0 orelse erlang:throw({error, no_candidate}),
    %% 自动弹劾时清除帮派公告
    NewGuild = Guild#guild{announce = <<"">>},
    {ok, NewGuild, ChiefID, Candidate}.

%% @doc 选择新的帮主ID
select_new_chief(Guild, ActiveOnly) ->
    #guild{chief_id = ChiefID, members = Members} = Guild,
    Now = time:unixtime(),
    ActiveSpan = config:get_sys_config(guild_auto_impeach_active) * 24 * 3600,
    LastActive = Now - ActiveSpan,
    Candidates = filter_candidate2(Members, [], [ChiefID], LastActive, []),
    ActiveList = [Mem || {_, _, _, _, Active} = Mem <- Candidates, Active],
    if
        ActiveList =/= [] -> element(4, hd(ActiveList));
        (not ActiveOnly) andalso Candidates =/= [] -> element(4, hd(Candidates));
        true -> 0
    end.

filter_candidate2([], _DonateHis, _Except, _LastActive, Acc) ->
    lists:sort(Acc);
filter_candidate2([Member | T], DonateHis, Except, LastActive, Acc) ->
    #guild_member{role_id = RoleID} = Member,
    RoleBase = lib_cache:get_role_base(RoleID),
    case lists:member(RoleID, Except) =:= false
        andalso RoleBase =/= undefined of
        true ->
            #{vip_lv := VipLv, level := RoleLv, offline := LastOffline} = RoleBase,
            Active = LastOffline > LastActive,
            Cont = util:prop_get_value(RoleID, DonateHis, 0),
            NewAcc = [{-VipLv, -RoleLv, -Cont, RoleID, Active} | Acc],
            filter_candidate2(T, DonateHis, Except, LastActive, NewAcc);
        _ ->
            filter_candidate2(T, DonateHis, Except, LastActive, Acc)
    end.

%% -----------------------------------------------------------------------------

%% @doc 检查帮派成员
check_guild_member(GuildID, RoleID, Pos) when is_integer(GuildID) ->
    Guild = lib_guild:get_guild_info(GuildID),
    check_guild_member(Guild, RoleID, Pos);
check_guild_member(Guild, RoleID, Pos) when is_record(Guild, guild) ->
    #guild{members = Members} = Guild,
    MemRole = lists:keyfind(RoleID, #guild_member.role_id, Members),
    MemRole =/= false orelse erlang:throw({error, ?RC_GUILD_ROLE_IS_NOT_GUILD_MEM}),
    #guild_member{pos = RolePos} = MemRole,
    RolePos >= Pos orelse erlang:throw({error, ?RC_GUILD_POS_HIGHER_CAN_OPERATE}),
    MemRole.

%% @doc 名字检查
check_guild_name(Name) ->
    util:check_name(Name).

add_log(Guild, ID, Args) ->
    case conf_guild_record:get(ID) of
        #{desc := Desc} ->
            Now = time:unixtime(),
            Log = util:safe_format(Desc, Args),
            #guild{record = Logs} = Guild,
            NewLogs = util:sublist([{Now, Log} | Logs], 1, ?GUILD_LOG_NUM),
            NewGuild = Guild#guild{record = NewLogs},
            NewGuild;
        _ ->
            Guild
    end.

%% -----------------------------------------------------------------------------
%% 维护相关
%% -----------------------------------------------------------------------------
%% 扣除维护资金
cost_denf_funds(GuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{level = Level, build = Build} = Guild,
    SDefFunds = calc_standard_denf_funds(Build),
    handle_cost_denf_funds(SDefFunds, Level, Guild).

handle_cost_denf_funds(SDefFunds, Level, Guild) ->
    #guild{
        id = GuildID, funds = Funds, denf_state = DenfState, pause_denf_time = PauseDenfTime,
        members = Members, build = Build, num = Num
    } = Guild,
    DenfFundsT = erlang:floor(SDefFunds / 72),
    LowDenfFundsT = erlang:floor(DenfFundsT * 0.54),
    %% 正常维护资金
    DenfFunds = guild_study_effect(Guild, ?GUILD_STUDY_2, DenfFundsT),
    %% 低维护资金
    LowDenfFunds = guild_study_effect(Guild, ?GUILD_STUDY_2, LowDenfFundsT),
    CostFunds = ?iif(Funds >= SDefFunds, DenfFunds, LowDenfFunds),
    NewFunds = Funds - CostFunds,
    Now = time:unixtime(),
    if
        PauseDenfTime > 0 andalso PauseDenfTime >= Now ->  %% 处于维护保护状态
            ignore;
        DenfState =:= ?GUILD_NORMAL_DENF_STATE ->   %% 正常维护
            NewDenfState = ?iif(NewFunds >= SDefFunds, ?GUILD_NORMAL_DENF_STATE, ?GUILD_LOW_DENF_STATE),
            NewGuild = Guild#guild{denf_state = NewDenfState, funds = NewFunds},
            notify_funds_change(Guild),
            update_guild_info(NewGuild);
        DenfState =:= ?GUILD_LOW_DENF_STATE andalso NewFunds >= SDefFunds -> %% 从低维护状态变成正常维护状态
            NewDenfState = ?GUILD_NORMAL_DENF_STATE,
            NewGuild = Guild#guild{denf_state = NewDenfState, funds = NewFunds},
            notify_funds_change(Guild),
            update_guild_info(NewGuild);
        DenfState =:= ?GUILD_LOW_DENF_STATE andalso NewFunds > 0 ->  %% 低维护状态
            NewGuild = Guild#guild{funds = NewFunds},
            notify_funds_change(Guild),
            update_guild_info(NewGuild);
        true ->    %% 降级or解散
            case Level > 1 of
                true -> %% 帮派降级
                    NewLevel = Level - 1,
                    PauseDenfTimeN = Now + ?ONE_DAY_SECONDS,
                    NewDenfState = ?GUILD_LOW_DENF_STATE,
                    NewBuild = util:prop_store(?GUILD_BUILD_LOYALTY, NewLevel, Build),
                    NewGuild = Guild#guild{level = NewLevel, denf_state = NewDenfState, pause_denf_time = PauseDenfTimeN, build = NewBuild},
                    %% 帮派降级通知
                    Rec = #sc_guild_notify_level_up{level = NewLevel, funds = Funds},
                    {ok, Bin} = prot_msg:encode_msg(41444, Rec),
                    broadcast(NewGuild, Bin),
                    MailID = config:get_sys_config(guild_down_mail),
                    send_guild_mail(NewGuild, MailID, []),
                    update_guild_info(NewGuild);
                _ -> %% 帮派解散
                    case is_forbidden_leave() of
                        false ->
                            case dismiss_guild(Guild) of
                                true ->
                                    MailID = config:get_sys_config(guild_desolation_mail),
                                    send_guild_mail(Guild, MailID, []),
                                    [begin
                                        RoleData = get_role_data(RoleID),
                                        NewData = RoleData#guild_role{guild_id = 0},
                                        update_role_data(RoleID, NewData),
                                        %% 通知玩家帮派变化
                                        role_guild_info(RoleID, {guild_pos_change, 0, <<"">>, 0, false})
                                    end || #guild_member{role_id = RoleID} <- Members],
                                    svr_guild_mgr:delete_guild(GuildID, Num);
                                _ ->
                                    ignore
                            end;
                        _ ->
                            ignore
                    end
            end
    end.

notify_funds_change(Guild) ->
    #guild{funds = Funds} = Guild,
    Rec = #sc_guild_cost_denf{funds = Funds},
    {ok, Bin} = prot_msg:encode_msg(41482, Rec),
    broadcast(Guild, Bin),
    ok.

%% -----------------------------------------------------------------------------
%% 帮派分红
%% -----------------------------------------------------------------------------

%% @doc 完成分红任务
finish_bonus_task(GuildID, Type, Times) ->
    Guild = get_guild_info(GuildID),
    #guild{bonus = Bonus} = Guild,
    Conf = conf_guild_bonus:get_type_stages(Type),
    Conf =/= [] orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    OldTimes = util:prop_get_value(Type, Bonus, 0),
    NewTimes = OldTimes + Times,
    NewBonus = util:prop_store(Type, NewTimes, Bonus),
    NewGuild = Guild#guild{bonus = NewBonus},
    update_guild_info(NewGuild),
    ok.

%% @doc 计算基础分红通宝
calc_bonus(Bonus) ->
    lists:foldl(fun({Type, Times}, Acc) ->
        Stages = conf_guild_bonus:get_type_stages(Type),
        TypeAddBonus =
            lists:foldl(fun(Stage, AccN) ->
                #{num := NeedTimes, bonus := AddBonus} = conf_guild_bonus:get(Type, Stage),
                ?iif(Times >= NeedTimes, AccN + AddBonus, AccN)
            end, 0, Stages),
        TypeAddBonus + Acc
    end, 0, Bonus).

%% @doc 分红
guild_bonus(GuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{bonus = Bonus, members = Members, denf_state = DenfState} = Guild,
    case DenfState =:= ?GUILD_NORMAL_DENF_STATE of
        true ->
            RoleList = get_bonus_role_list(Members, [?GUILD_POS_CHIEF, ?GUILD_POS_SUB_CHIEF, ?GUILD_POS_ELDER]),
            BaseCurrency = calc_bonus(Bonus),
            case BaseCurrency > 0 of
                true ->
                    lists:foreach(fun({RoleID, Pos}) ->
                        Ratio = conf_guild_bonus_info:get(Pos),
                        GetCurrency = erlang:floor(BaseCurrency * Ratio),
                        svr_mail:sys2p(RoleID, 107, [{?AST_CURRENCY, GetCurrency}], ?OPT_GUILD_BONUS)
                    end, RoleList);
                _ ->
                    skip
            end,
            NewGuild = Guild#guild{bonus = fix_bonus([])},
            update_guild_info(NewGuild),
            ok;
        _ ->
            skip
    end.

get_bonus_role_list(Members, PosList) ->
    [{RoleID, RolePos} || #guild_member{role_id = RoleID, pos = RolePos} <- Members, lists:member(RolePos, PosList)].

fix_bonus(Bonus) ->
    Types = conf_guild_bonus:get_types(),
    lists:foldl(fun(Type, Acc) ->
        case lists:keyfind(Type, 1, Acc) of
            false ->
                lists:keystore(Type, 1, Acc, {Type, 0});
            _ ->
                Acc
        end
    end, Bonus, Types).

%% -----------------------------------------------------------------------------
%% 帮派任务
%% -----------------------------------------------------------------------------
%% 完成帮派任务
finish_guild_task(GuildID, Type, Times) ->
    Guild = get_guild_info(GuildID),
    #guild{task = Task, task_stage = TaskStage} = Guild,
    OldTimes = util:prop_get_value(Type, Task),
    NewTimes = OldTimes + Times,
    NewTask0 = util:prop_store(Type, NewTimes, Task),
    {NewTaskStage, NewTask} = ?iif(
        TaskStage >= ?GUILD_TASK_MAX_STAGE,
        {TaskStage, NewTask0},
        get_task_stage(NewTask0, TaskStage)
    ),
    NewGuild = Guild#guild{task = NewTask, task_stage = NewTaskStage},
    update_guild_info(NewGuild),
    MsgRecord = #sc_guild_task_info{task_info = NewTask, task_stage = NewTaskStage},
    {ok, Bin} = prot_msg:encode_msg(51407, MsgRecord),
    broadcast(Bin),
    ok.

%% 重置帮派任务
guild_task(GuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{task = Task, task_stage = TaskStage} = Guild,
    #{task_stage := List, stage_reward := StageReward, mail_id := MailID} = conf_guild_task_info:get(),
    NeedTimes = util:prop_get_value(TaskStage, List),
    IsAllAchieve =
        lists:all(fun({_, Times}) ->
            Times >= NeedTimes
        end, Task),
    RealTaskStage = ?iif(IsAllAchieve, TaskStage, TaskStage - 1),
    case RealTaskStage > 0 of
        true ->
            {_, Reward, _} = lists:keyfind(RealTaskStage, 1, StageReward),
            RoleList = get_member_id_list(Guild),
            svr_mail:sys2select(RoleList, MailID, [?STR(RealTaskStage)], Reward, ?OPT_GUILD_TASK);
        _ ->
            skip
    end,
    NewTask = fix_guild_task([]),
    NewTaskStage = 1,
    NewGuild = Guild#guild{task = NewTask, task_stage = NewTaskStage},
    update_guild_info(NewGuild),
    MsgRecord = #sc_guild_task_info{task_info = NewTask, task_stage = NewTaskStage},
    {ok, Bin} = prot_msg:encode_msg(51407, MsgRecord),
    broadcast(Bin),
    ok.

fix_guild_task([]) ->
    [{Type, 0} || Type <- conf_guild_task_reward:get_types()];
fix_guild_task(Task) ->
    Task.

%%%% @doc 获得帮派任务阶段
%%get_task_stage(Task) when is_list(Task) ->
%%    #{task_stage := TaskStage} = conf_guild_task_info:get(),
%%    get_task_stage(Task, lists:sort(TaskStage)).
%%
%%get_task_stage(_, [{Stage, _}]) -> Stage;
%%get_task_stage(Task, [{Stage, NeedTimes} | T]) ->
%%    IsAllAchieve =
%%        lists:all(fun({_, Times}) ->
%%            Times >= NeedTimes
%%                  end, Task),
%%    case IsAllAchieve of
%%        true ->
%%            get_task_stage(Task, T);
%%        _ ->
%%            Stage
%%    end.

get_task_stage(Task, TaskStage) ->
    #{task_stage := List} = conf_guild_task_info:get(),
    NeedTimes = util:prop_get_value(TaskStage, List),
    IsAllAchieve =
        lists:all(fun({_, Times}) ->
            Times >= NeedTimes
        end, Task),
    case IsAllAchieve of
        true ->
            NewTaskStage = TaskStage + 1,
            NewTask = fix_guild_task([]),
            {NewTaskStage, NewTask};
        _ ->
            {TaskStage, Task}
    end.

%% -----------------------------------------------------------------------------
%% 帮派建筑
%% -----------------------------------------------------------------------------
build_up(GuildID, RoleID, ID) ->
    case ID =:= ?GUILD_BUILD_LOYALTY of
        true ->
            upgrade(GuildID, RoleID);
        _ ->
            case catch check_build_up(GuildID, RoleID, ID) of
                {ok, Guild, Build} ->
                    update_guild_info(Guild),
                    notify_funds_change(Guild),
                    notify_build_change(Build);
                {error, Code} ->
                    ?ERROR_TOC(RoleID, Code)
            end
    end.

check_build_up(GuildID, RoleID, ID) ->
    Guild = get_guild_info(GuildID),
    #guild{funds = Funds, build = Build, level = GuildLv} = Guild,
    check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
    Lv = util:prop_get_value(ID, Build, 1),
    Lv < GuildLv orelse erlang:throw({error, ?RC_GUILD_BUILD_LEVEL_MAX}),
    NextLv = Lv + 1,
    Conf = conf_guild_build:get(ID, NextLv),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GUILD_BUILD_LEVEL_MAX}),
    NeedHaveFunds0 = calc_need_have_funds(Build),
    #{cost_funds := CostFunds} = Conf,
    NeedHaveFunds = CostFunds + NeedHaveFunds0,
    Funds >= NeedHaveFunds orelse erlang:throw({error, ?RC_GUILD_FUND_NOT_ENOUGH}),
    NewFunds = Funds - CostFunds,
    NewBuild = util:prop_store(ID, NextLv, Build),
    NewGuild = Guild#guild{funds = NewFunds, build = NewBuild},
    {ok, NewGuild, NewBuild}.

calc_need_have_funds(Build) ->
    erlang:floor(calc_standard_denf_funds(Build) / 72) * 24.

calc_standard_denf_funds(Build) ->
    lists:foldl(fun({ID, BuildLv}, Acc) ->
        #{denf_funds := DenfFunds} = conf_guild_build:get(ID, BuildLv),
        DenfFunds + Acc
    end, 0, Build).

init_build() ->
    IDs = conf_guild_build:get_ids(),
    [{ID, 1} || ID <- IDs].

fix_build(Level, Build) ->
    IDs = conf_guild_build:get_ids(),
    case length(IDs) =:= length(Build) of
        true ->
            util:prop_store(?GUILD_BUILD_LOYALTY, Level, Build);
        _ ->
            NewBuild = fix_build_helper(IDs, Build),
            util:prop_store(?GUILD_BUILD_LOYALTY, Level, NewBuild)
    end.
fix_build_helper([], Build) -> Build;
fix_build_helper([ID | T], Build) ->
    case util:prop_get_value(ID, Build) of
        undefined ->
            NewBuild = util:prop_store(ID, 1, Build),
            fix_build_helper(T, NewBuild);
        _ ->
            fix_build_helper(T, Build)
    end.

check_can_up(Level, Build) ->
    lists:all(fun({_, Lv}) ->
        Lv >= Level
    end, Build).

notify_build_change(Build) ->
    MsgRecord = #sc_guild_build_up{build = Build},
    {ok, Bin} = prot_msg:encode_msg(41494, MsgRecord),
    broadcast(Bin).

get_build_lv(GuildID, Type) when GuildID > 0 ->
    Guild = get_guild_info(GuildID),
    #guild{build = Build} = Guild,
    util:prop_get_value(Type, Build, 1);
get_build_lv(_, _) -> 0.

%% -----------------------------------------------------------------------------
%% 帮派研究
%% -----------------------------------------------------------------------------
study_up(GuildID, RoleID, ID) ->
    case catch check_study_up(GuildID, RoleID, ID) of
        {ok, Guild, Study} ->
            update_guild_info(Guild),
            notify_funds_change(Guild),
            MsgRecord = #sc_guild_study_up{study = Study},
            {ok, Bin} = prot_msg:encode_msg(41496, MsgRecord),
            broadcast(Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_study_up(GuildID, RoleID, ID) ->
    Guild = get_guild_info(GuildID),
    #guild{funds = Funds, build = Build, study = Study} = Guild,
    check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
    %% 军机阁等级
    MilitLv = util:prop_get_value(?GUILD_BUILD_MILIT, Build, 1),
    Lv = util:prop_get_value(ID, Study, 0),
    NextLv = Lv + 1,
    Info = conf_guild_research_info:get(ID),
    Info =/= undefined orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{type := Type, need_lv := NeedLv, prev := Prev, need_num := NeedNum} = Info,
    Lv =:= 0 andalso begin
        MilitLv >= NeedLv orelse erlang:throw({error, ?RC_GUILD_MILIT_LV_NOT_ENOUGH}),
        (Prev =:= 0 orelse util:prop_get_value(Prev, Study, 0) >= ?MAX_STUDY_LV)
            orelse erlang:throw({error, ?RC_GUILD_BUILD_PREV_LV_NOT_ENOUGH}),
        get_type_max_num(Type, Study) >= NeedNum
            orelse erlang:throw({error, ?RC_GUILD_BUILD_TYPE_MAX_NUM_NOT_ENOUGH})
    end,
    Conf = conf_guild_research:get(ID, NextLv),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GUILD_STUDY_MAX_LV}),
    #{cost := CostFunds} = Conf,
    Funds >= CostFunds orelse erlang:throw({error, ?RC_GUILD_FUND_NOT_ENOUGH}),
    NewFunds = Funds - CostFunds,
    NewStudy = util:prop_store(ID, NextLv, Study),
    NewGuild = Guild#guild{funds = NewFunds, study = NewStudy},
    {ok, NewGuild, NewStudy}.

init_study() ->
    IDs = conf_guild_research_info:get_ids(),
    [{ID, 0} || ID <- IDs].

fix_study(Study) ->
    IDs = conf_guild_research_info:get_ids(),
    case length(IDs) =:= length(Study) of
        true ->
            Study;
        _ ->
            fix_study_helper(IDs, Study)
    end.
fix_study_helper([], Study) -> Study;
fix_study_helper([ID | T], Study) ->
    case util:prop_get_value(ID, Study) of
        undefined ->
            NewStudy = util:prop_store(ID, 0, Study),
            fix_build_helper(T, NewStudy);
        _ ->
            fix_build_helper(T, Study)
    end.

get_type_max_num(Type, Study) ->
    IDs = conf_guild_research_info:get_type_ids(Type),
    lists:foldl(fun({ID, Lv}, Acc) ->
        case lists:member(ID, IDs) of
            true when Lv >= ?MAX_STUDY_LV ->
                Acc + 1;
            _ ->
                Acc
        end
    end, 0, Study).

%% 计算研究效果
guild_study_effect(GuildID, ID, Value) when is_integer(GuildID), GuildID > 0 ->
    Guild = lib_guild:get_guild_info(GuildID),
    guild_study_effect(Guild, ID, Value);
guild_study_effect(Guild, ID, Value) when is_record(Guild, guild) ->
    #guild{study = Study} = Guild,
    Lv = util:prop_get_value(ID, Study, 0),
    case conf_guild_research:get(ID, Lv) of
        #{effect := Effect} when Effect > 0 ->
            case conf_guild_research_info:get(ID) of
                #{cate := Cate} when Cate =:= 1 -> %% 固定加
                    Value + Effect;
                #{cate := Cate} when Cate =:= 2 -> %% 百分比加
                    erlang:floor(Value * (1 + Effect / 100));
                #{cate := Cate} when Cate =:= 3 -> %% 固定减
                    max(Value - Effect, 0);
                #{cate := Cate} when Cate =:= 4 -> %% 百分比减
                    erlang:floor(Value * max(0, (1 - Effect / 100)));
                _ ->
                    Value
            end;
        _ ->
            Value
    end;
guild_study_effect(_, _, Value) ->
    Value.

%% 获得研究等级
get_study_lv(GuildID, ID) when is_integer(GuildID), GuildID > 0 ->
    Guild = lib_guild:get_guild_info(GuildID),
    get_study_lv(Guild, ID);
get_study_lv(Guild, ID) when is_record(Guild, guild) ->
    #guild{study = Study} = Guild,
    util:prop_get_value(ID, Study, 0);
get_study_lv(_, _) ->
    0.

%% 获得研究效果
get_study_value(GuildID, ID) ->
    Lv = get_study_lv(GuildID, ID),
    case conf_guild_research:get(ID, Lv) of
        #{effect := Effect} -> Effect;
        _ -> 0
    end.


%% -----------------------------------------------------------------------------
%% 帮派宣战
%% -----------------------------------------------------------------------------

guild_declare(GuildID, RoleID, DGuildID) ->
    case catch check_guild_declare(GuildID, RoleID, DGuildID) of
        {ok, Guild, DGuild, ExpireTime} ->
            update_guild_info(Guild),
            svr_guild_mgr:data_update(?GUILD_UP_TYPE_GUILD, DGuildID),
            set_guild_info(DGuild),
            svr_rumor:publish({guild, DGuildID}, 21003, [Guild#guild.name]),
            MsgRecord = #sc_guild_declare{
                guild_id = DGuildID, expire_time = ExpireTime, exploit = DGuild#guild.exploit,
                num = DGuild#guild.num, guild_name = DGuild#guild.name, type = 1
            },
            {ok, Bin} = prot_msg:encode_msg(53502, MsgRecord),
            broadcast(GuildID, Bin),
            MsgRecord2 = #sc_guild_declare{
                guild_id = GuildID, expire_time = ExpireTime, exploit = Guild#guild.exploit,
                num = Guild#guild.num, guild_name = Guild#guild.name, type = 2
            },
            {ok, Bin2} = prot_msg:encode_msg(53502, MsgRecord2),
            broadcast(DGuildID, Bin2),
            guild_info(GuildID, sync_guild_declare),
            guild_info(DGuildID, sync_guild_declare),
            ok;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.


check_guild_declare(GuildID, RoleID, DGuildID) ->
    Guild = get_guild_info(GuildID),
    DGuild = get_guild_info(DGuildID),
    DGuild =/= undefined orelse erlang:throw({error, ?RC_GUILD_DECLARE_NO_GUILD}),
    #guild{battle = BattleValue, declare = DeclareT, back = Back, level = GuildLv} = Guild,
    #guild{back = DBackT, hostile = DHostile, level = DGuildLv} = DGuild,
    Declare = fix_declare_or_back(DeclareT),
    DBack = fix_declare_or_back(DBackT),
    check_guild_member(Guild, RoleID, ?GUILD_POS_CHIEF),
    #{
        cost_battle := CostT,
        declare_time := CanDeclareTime,
        last_time := LastTime,
        guild_lv_diff := GuildLvDiff,
        max_declare_times := MaxDeclareNum,
        max_back_times := MaxBackNum
    } = conf_guild_declare:get(),
    Now = time:unixtime(),

    %% 不能宣战自己帮派
    GuildID =/= DGuildID orelse erlang:throw({error, ?RC_GUILD_DECLARE_MYSELF}),
    %% 判断是否在可宣战时间段内
    TimePoint = time:get_time_point_floor(),
    {BeginHour, EndHour} = CanDeclareTime,
    BeginHour * 2 < TimePoint andalso TimePoint =< EndHour * 2
        orelse erlang:throw({error, ?RC_GUILD_DECLARE_NOT_IN_TIME}),
    %% 判断该帮派是否已被宣战过
    DExpireTime = util:prop_get_value(DGuildID, Declare, 0),
    (DExpireTime =:= 0 orelse DExpireTime < Now)
        orelse erlang:throw({error, ?RC_GUILD_DECLARE_ALREADY_DECLARE}),
    %% 判断对方帮派是否对本帮派宣战
    BExpireTime = util:prop_get_value(DGuildID, Back, 0),
    (BExpireTime =:= 0 orelse BExpireTime < Now)
        orelse erlang:throw({error, ?RC_GUILD_DECLARE_IS_IN_BACK}),
    %% 判断是被设置为敌对帮派,可忽略等级差宣战
    IsHostile = sets:is_element(GuildID, DHostile),
    LvDiff = ?iif(GuildLv > DGuildID, GuildLv - DGuildID, DGuildLv - GuildLv),
    CannotDeclare = (not IsHostile) andalso (LvDiff > GuildLvDiff),
    CannotDeclare andalso erlang:throw({error, ?RC_GUILD_DECLARE_LV_DIFF_MUCH}),
    %% 最多宣战MaxDeclareNum个帮派,被宣战帮派最多被MaxBackNum个帮派宣战
    DeclareNum = length(Declare),
    DBackNum = length(DBack),
    DeclareNum < MaxDeclareNum orelse erlang:throw({error, ?RC_GUILD_DECLARE_NUM_MAX}),
    DBackNum < MaxBackNum orelse erlang:throw({error, ?RC_GUILD_DECLARE_BACK_NUM_MAX}),
    Cost = guild_study_effect(GuildID, ?GUILD_STUDY_102, CostT),
    BattleValue >= Cost orelse erlang:throw({error, ?RC_GUILD_DECLARE_BATTLE_VALUE_NOT_ENOUGH}),

    ExpireTime = Now + LastTime,
    NewBattleValue = BattleValue - Cost,
    NewDeclare = util:prop_store(DGuildID, ExpireTime, Declare),
    NewDBack = util:prop_store(GuildID, ExpireTime, DBack),
    NewGuild = Guild#guild{battle = NewBattleValue, declare = NewDeclare},
    NewDGuild = DGuild#guild{back = NewDBack},
    {ok, NewGuild, NewDGuild, ExpireTime}.

fix_declare_or_back(List) ->
    Now = time:unixtime(),
    lists:filter(fun({_, ExpireTime}) ->
        ExpireTime > Now
    end, List).

%% 设置为敌对帮派
set_hostile(GuildID, RoleID, DGuildID) ->
    case catch check_set_hostile(GuildID, RoleID, DGuildID) of
        {ok, Guild, RobProfit, DGuild} ->
            update_guild_info(Guild),
            MsgRecord = #sc_guild_hostile{
                guild_id = DGuildID,
                rob = RobProfit,
                num = DGuild#guild.num,
                guild_lv = DGuild#guild.level,
                guild_name = DGuild#guild.name
            },
            {ok, Bin} = prot_msg:encode_msg(53504, MsgRecord),
            broadcast(Bin),
            guild_info(GuildID, sync_guild_hostile),
            ok;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_set_hostile(GuildID, RoleID, DGuildID) ->
    Guild = get_guild_info(GuildID),
    DGuild = get_guild_info(DGuildID),
    DGuild =/= undefined orelse erlang:throw({error, ?RC_GUILD_DECLARE_NO_GUILD}),
    #guild{hostile = Hostile, rob_list = RobList} = Guild,
    sets:size(Hostile) < 5 orelse erlang:throw({error, ?RC_GUILD_HOSTILE_MAX_NUM}),
    check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
    not sets:is_element(DGuildID, Hostile) orelse erlang:throw({error, ?RC_GUILD_HOSTILE_IS_IN}),
    NewHostile = sets:add_element(DGuildID, Hostile),
    RobProfit = get_rob_profit(RobList, DGuildID),
    NewGuild = Guild#guild{hostile = NewHostile},
    {ok, NewGuild, RobProfit, DGuild}.

%% @doc 取消敌对帮派
cancel_hostile(GuildID, RoleID, DGuildID) ->
    case catch check_cancel_hostile(GuildID, RoleID, DGuildID) of
        {ok, Guild} ->
            update_guild_info(Guild),
            MsgRecord = #sc_guild_hostile_cancel{guild_id = DGuildID},
            {ok, Bin} = prot_msg:encode_msg(53520, MsgRecord),
            lib_role_send:send_to_role(RoleID, Bin),
            guild_info(GuildID, sync_guild_hostile),
            ok;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_cancel_hostile(GuildID, RoleID, DGuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{hostile = Hostile} = Guild,
    check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
    sets:is_element(DGuildID, Hostile) orelse erlang:throw({error, ?RC_GUILD_HOSTILE_NOT_IN}),
    NewHostile = sets:del_element(DGuildID, Hostile),
    NewGuild = Guild#guild{hostile = NewHostile},
    {ok, NewGuild}.

%% @doc 查看宣战列表
get_declare_list(GuildID, RoleSid) ->
    Guild = get_guild_info(GuildID),
    #guild{declare = DeclareT, back = BackT} = Guild,
    Declare = fix_declare_or_back(DeclareT),
    Back = fix_declare_or_back(BackT),
    Fun =
        fun({DGuildID, ExpireTime}, Acc) ->
            case get_guild_info(DGuildID) of
                #guild{num = Num, exploit = Exploit, name = Name} ->
                    [{Num, ExpireTime, Exploit, Name, DGuildID} | Acc];
                _ ->
                    Acc
            end
        end,
    DeclareList = lists:foldl(Fun, [], Declare),
    BackList = lists:foldl(Fun, [], Back),
    MsgRecord = #sc_guild_declare_list{declare = DeclareList, back = BackList},
    {ok, Bin} = prot_msg:encode_msg(53506, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin).

%% @doc 查看敌对列表
get_hostile_list(GuildID, RoleSid) ->
    Guild = get_guild_info(GuildID),
    #guild{hostile = HostileSets, rob_list = RobList} = Guild,
    HostileList =
        lists:foldl(fun(DGuildID, Acc) ->
            case get_guild_info(DGuildID) of
                #guild{num = Num, level = Lv, name = Name} ->
                    RobProfit = get_rob_profit(RobList, DGuildID),
                    [{Num, RobProfit, Lv, Name, DGuildID} | Acc];
                _ ->
                    Acc
            end
        end, [], sets:to_list(HostileSets)),
    MsgRecord = #sc_guild_hostile_list{hostile = HostileList},
    {ok, Bin} = prot_msg:encode_msg(53508, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin).

get_rob_profit(RobList, DGuildID) ->
    EffectList = config:get_sys_config(rob_times_effect),
    RobTimes = util:prop_get_value(DGuildID, RobList, 0),
    util:get_zone_config(EffectList, RobTimes).

%% 增加战绩
add_exploit(GuildID, AddNum) ->
    Guild = get_guild_info(GuildID),
    #guild{exploit = OldExploit} = Guild,
    NewExploit = OldExploit + AddNum,
    NewGuild = Guild#guild{exploit = NewExploit},
    update_guild_info(NewGuild),
    ok.

%%%% 增加劫镖收益
%%add_rob(GuildID, Value) ->
%%    Guild = get_guild_info(GuildID),
%%    #guild{rob = Rob} = Guild,
%%    NewRob = Rob + Value,
%%    NewGuild = Guild#guild{rob = NewRob},
%%    update_guild_info(NewGuild),
%%    ok.

%% 增加劫镖次数
add_rob_times(GuildID, DGuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{rob_list = RobList} = Guild,
    NewRobList = util:prop_increase(DGuildID, RobList),
    NewGuild = Guild#guild{rob_list = NewRobList},
    update_guild_info(NewGuild),
    ok.

%% 劫镖次数对收益影响
rob_times_effect(GuildID, DGuildID, Value) ->
    Guild = get_guild_info(GuildID),
    #guild{rob_list = RobList} = Guild,
    RobTimes = util:prop_get_value(DGuildID, RobList, 0),
    EffectList = config:get_sys_config(rob_times_effect),
    Effect = util:get_zone_config(EffectList, RobTimes),
    erlang:floor(Value * Effect / 100).

%% 重置劫镖次数
rob_times_reset(GuildID) ->
    Guild = get_guild_info(GuildID),
    NewGuild = Guild#guild{rob_list = []},
    update_guild_info(NewGuild),
    ok.

%% 检查帮派宣战or被宣战过期
declare_loop(Now) ->
    GuildID = get_guild_id(),
    Guild = get_guild_info(GuildID),
    #guild{declare = Declare, back = Back} = Guild,
    Fun = fun({DGuildID, ExpireTime}, {Acc, DelAcc}) ->
        ?iif(Now >= ExpireTime, {Acc, [DGuildID | DelAcc]}, {[{DGuildID, ExpireTime} | Acc], DelAcc})
    end,
    {NewDeclare, DelDeclare} = lists:foldl(Fun, {[], []}, Declare),
    {NewBack, DelBack} = lists:foldl(Fun, {[], []}, Back),
    (DelDeclare =/= [] orelse DelBack =/= []) andalso
        begin
            NewGuild = Guild#guild{declare = NewDeclare, back = NewBack},
            update_guild_info(NewGuild),
            MsgRecord = #sc_guild_declare_expire{list = DelDeclare ++ DelBack},
            {ok, Bin} = prot_msg:encode_msg(53509, MsgRecord),
            broadcast(Bin)
        end,
    ok.
%% -----------------------------------------------------------------------------
%% 帮派祝福
%% -----------------------------------------------------------------------------
get_bless(GuildID, RoleID) ->
    Guild = get_guild_info(GuildID),
    #guild{bless = Bless} = Guild,
    MsgRecord = #sc_guild_bless_info{bless = Bless},
    {ok, Bin} = prot_msg:encode_msg(53511, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin).

bless(GuildID, RoleID, ID) ->
    case catch check_bless(GuildID, RoleID, ID) of
        {ok, Guild, ExpireTime} ->
            update_guild_info(Guild),
            notify_funds_change(Guild),
            MsgRecord = #sc_guild_bless{id = ID, expire = ExpireTime},
            {ok, Bin} = prot_msg:encode_msg(53513, MsgRecord),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_bless(GuildID, RoleID, ID) ->
    Guild = get_guild_info(GuildID),
    check_guild_member(Guild, RoleID, ?GUILD_POS_SUB_CHIEF),
    #guild{bless = Bless, funds = Funds, build = Build} = Guild,
    IsAllMax =
        lists:all(fun({_, Lv}) ->
            Lv >= ?MAX_STUDY_LV
        end, Build),
    IsAllMax orelse erlang:throw({error, ?RC_GUILD_BLESS_NOT_ALL_MAX}),
    Conf = conf_guild_bless:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{cost_funds := Cost} = Conf,
    Funds >= Cost orelse erlang:throw({error, ?RC_GUILD_FUND_NOT_ENOUGH}),
    OldExpire = util:prop_get_value(ID, Bless, 0),
    OldExpire < time:unixtime() orelse erlang:throw({error, ?RC_GUILD_BLESS_ALREADY}),
    ExpireTime = time:unixdate() + ?ONE_DAY_SECONDS * 2,
    NewFunds = Funds - Cost,
    NewBless = util:prop_store(ID, ExpireTime, Bless),
    NewGuild = Guild#guild{bless = NewBless, funds = NewFunds},
    {ok, NewGuild, ExpireTime}.

fix_bless(Bless) ->
    Now = time:unixtime(),
    lists:filter(fun({_, ExpireTime}) ->
        Now < ExpireTime
    end, Bless).

%% 活动是否被祝福
activity_is_blessed(GuildID, ID) when is_integer(GuildID), ID > 0 ->
    Guild = lib_guild:get_guild_info(GuildID),
    activity_is_blessed(Guild, ID);
activity_is_blessed(Guild, ID) when is_record(Guild, guild) ->
    #guild{bless = Bless} = Guild,
    ExpireTime = util:prop_get_value(ID, Bless, 0),
    Now = time:unixtime(),
    case Now < ExpireTime andalso Now >= (ExpireTime - ?ONE_DAY_SECONDS) of
        true ->
            #{mul := Mul} = conf_guild_bless:get(ID),
            Mul;
        _ ->
            1
    end;
activity_is_blessed(_, _) -> 1.
%% -----------------------------------------------------------------------------
%% 帮派红包(停服更新不会保存红包数据)
%% -----------------------------------------------------------------------------
%% 发红包
lucky_money(GuildID, RoleName, Icon, Conf, RoleID, IsAutoGet) ->
    Guild = get_guild_info(GuildID),
    #guild{lucky_money = List} = Guild,
    #{id := CID, bgold := Bgold, times := Times, limit := {Min, Max}} = Conf,
    #{expire := Expire} = conf_guild_lucky_money_info:get(),
    ID = get_new_lucky_money_id(),
    RedList = lib_lucky_money_util:create_list(Bgold, Times, Min, Max),
    ExpireTime = time:unixtime() + Expire,
    LuckyMoney =
        #lucky_money{
            id = ID,
            cid = CID,
            sender = RoleName,
            icon = Icon,
            red_list = RedList,
            num = Times,
            expired_time = ExpireTime
        },

    %% 自己发的自动抢
    {NewLuckyMoney, RoleGetBgold} =
        case IsAutoGet of
            true ->
                GetBgold = util:list_rand(RedList),
                NewRedList = lists:delete(GetBgold, RedList),
                NewFetchList0 = [{RoleID, GetBgold, time:unixtime()}],
                NewFetchList = lib_lucky_money_util:sort_fetch_rank(NewFetchList0),
                {LuckyMoney#lucky_money{fetch_list = NewFetchList, red_list = NewRedList}, GetBgold};
            _ ->
                {LuckyMoney, 0}
        end,
    NewList = [NewLuckyMoney | List],
    NewGuild = Guild#guild{lucky_money = NewList},
    set_guild_info(NewGuild),
    notify_lucky_money_change(NewLuckyMoney, 1),
    #{name := Name} = conf_guild_lucky_money:get(CID),
    svr_rumor:publish({guild, GuildID}, 22007, [RoleName, Name]),
    {ok, RoleGetBgold}.

%% 抢红包
get_lucky_money(GuildID, RoleID, ID) ->
    case catch check_get_lucky_money(GuildID, RoleID, ID) of
        {ok, Guild, LuckyMoney, GetBgold} ->
            set_guild_info(Guild),
            notify_lucky_money_change(LuckyMoney, 2),
            {ok, GetBgold};
        {error, Code} ->
            {error, Code}
    end.

check_get_lucky_money(GuildID, RoleID, ID) ->
    Guild = get_guild_info(GuildID),
    #guild{lucky_money = List} = Guild,
    LuckyMoney = lists:keyfind(ID, #lucky_money.id, List),
    LuckyMoney =/= false orelse erlang:throw({error, ?RC_GUILD_MONEY_NOT_EXIST}),
    #lucky_money{fetch_list = FetchList, red_list = RedList, num = Num, expired_time = ExpiredTime, sender = Sender} = LuckyMoney,
    Now = time:unixtime(),
    lists:keyfind(RoleID, 1, FetchList) =:= false orelse erlang:throw({error, ?RC_GUILD_MONEY_ALREADY_GOT}),
    ExpiredTime > Now orelse erlang:throw({error, ?RC_GUILD_MONEY_EXPIRED}),
    length(FetchList) < Num orelse erlang:throw({error, ?RC_GUILD_MONEY_ALL_GOT}),
    GetBgold = util:list_rand(RedList),
    NewRedList = lists:delete(GetBgold, RedList),
    NewFetchList0 = [{RoleID, GetBgold, Now} | FetchList],
    NewFetchList = lib_lucky_money_util:sort_fetch_rank(NewFetchList0),
    NewLuckyMoney = LuckyMoney#lucky_money{fetch_list = NewFetchList, red_list = NewRedList},
    NewList = lists:keystore(ID, #lucky_money.id, List, NewLuckyMoney),
    NewGuild = Guild#guild{lucky_money = NewList},
    maybe_send_rumor(length(NewFetchList) =:= Num, NewFetchList, Sender),
    {ok, NewGuild, NewLuckyMoney, GetBgold}.

maybe_send_rumor(true, [{RoleID, Bgold, _Time} | _], Sender) ->
    GuildID = get_guild_id(),
    RoleName = lib_cache:get_role_name(RoleID),
    svr_rumor:publish({guild, GuildID}, 22008, [RoleName, Sender, ?STR(Bgold)]),
    ok;
maybe_send_rumor(_, _, _) ->
    ok.

%% 通知红包修改
notify_lucky_money_change(LuckyMoney, Type) ->
    #lucky_money{
        id = ID,
        cid = CID,
        sender = Sender,
        icon = Icon,
        fetch_list = FetchList,
        expired_time = ExpireTime
    } = LuckyMoney,
    List = lib_lucky_money_util:make_client_sort_rank(FetchList),
    Info =
        #clt_lucky_money{
            id = ID,
            cid = CID,
            sender = Sender,
            icon = Icon,
            list = List,
            expire_time = ExpireTime
        },
    MsgRecord = #sc_guild_money_change{lucky_money = [Info], type = Type},
    {ok, Bin} = prot_msg:encode_msg(53515, MsgRecord),
    broadcast(Bin).

lucky_money_loop(Now) ->
    GuildID = get_guild_id(),
    Guild = get_guild_info(GuildID),
    #guild{lucky_money = List} = Guild,
    {NewList, Removes} = lib_lucky_money_util:loop(List, Now),
    Removes =/= [] andalso begin
        MsgRecord = #sc_guild_money_remove{remove_list = Removes},
        {ok, Bin} = prot_msg:encode_msg(53517, MsgRecord),
        broadcast(Bin)
    end,
    NewGuild = Guild#guild{lucky_money = NewList},
    set_guild_info(NewGuild),
    ok.

%% 新红包ID
get_new_lucky_money_id() ->
    ID = get_lucky_money_id(),
    NewID = ID + 1,
    erlang:put(lucky_money_id, NewID),
    NewID.

%% 当前的红包ID
get_lucky_money_id() ->
    case erlang:get(lucky_money_id) of
        V when is_integer(V) -> V;
        _ -> 0
    end.

%% -----------------------------------------------------------------------------
%% 少室山副本
%% -----------------------------------------------------------------------------
%% 跨周重置
sh_dung_reset(GuildID) ->
    Guild = get_guild_info(GuildID),
    IDs = conf_sh_dung_info:get_ids(),
    NewGuild = Guild#guild{sh_dung = [{ID, 0, 0} || ID <- IDs]},
    update_guild_info(NewGuild),
    ok.

%% 完成少室山副本
finish_sh_dung(GuildID, ID, Times) ->
    Guild = get_guild_info(GuildID),
    #guild{sh_dung = List} = Guild,
    CurID = get_cur_chapter(List),
    case CurID =:= ID of
        true ->
            {_, ChalTimes, RewardTimes} = lists:keyfind(ID, 1, List),
            #{name := Name, times := MaxTimes, rewards := Rewards} = conf_sh_dung_info:get(ID),
            NewChalTimes = ChalTimes + Times,
            MaxRewardTimes = length(Rewards),
            case NewChalTimes >= MaxTimes of
                true when RewardTimes < MaxRewardTimes ->
                    NewRewardTimes = RewardTimes + 1,
                    Reward = util:prop_get_value(NewRewardTimes, Rewards),
                    NewList = lists:keystore(ID, 1, List, {ID, 0, NewRewardTimes}),
                    RoleList = get_member_id_list(Guild),
                    svr_mail:sys2select(RoleList, 2510, [Name, NewRewardTimes], Reward, ?OPT_DUNGEON);
                true ->
                    NewList = lists:keystore(ID, 1, List, {ID, 0, RewardTimes + 1});
                _ ->
                    NewList = lists:keystore(ID, 1, List, {ID, ChalTimes + Times, RewardTimes})
            end,
            NewGuild = Guild#guild{sh_dung = NewList},
            update_guild_info(NewGuild),
            CurPage = get_cur_chapter(NewList),
            MsgRecord = #sc_guild_sh_dung_change{sh_dung = NewList, sh_cur_page = CurPage},
            {ok, Bin} = prot_msg:encode_msg(53518, MsgRecord),
            broadcast(Bin);
        _ ->
            skip
    end,
    ok.


%% 获取当前可挑战副本ID
get_cur_dung_id(Arg) ->
    ID = get_cur_chapter(Arg),
    #{dung_id := DungID} = conf_sh_dung_info:get(ID),
    DungID.

%% 获取当前可挑战配置ID
get_cur_chapter(GuildID) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    #guild{sh_dung = List} = Guild,
    get_cur_chapter(List);
get_cur_chapter(List) ->
    SortList = lists:sort(List),
    get_cur_chapter_helper(SortList, 1, 0).

get_cur_chapter_helper([], Chapter, _) -> Chapter;
get_cur_chapter_helper([{ID, ChalTimes, RewardTimes} | T], Chapter, MaxRewardTimes) ->
    case ChalTimes > 0 of
        true ->
            ID;
        _ when RewardTimes < MaxRewardTimes ->
            ID;
        _ when RewardTimes > MaxRewardTimes ->
            get_cur_chapter_helper(T, ID, RewardTimes);
        _ ->
            get_cur_chapter_helper(T, Chapter, MaxRewardTimes)
    end.

fix_sh_dung([]) ->
    IDs = conf_sh_dung_info:get_ids(),
    [{ID, 0, 0} || ID <- IDs];
fix_sh_dung(ShDung) ->
    ShDung.

%% -----------------------------------------------------------------------------
%% 帮派邮件、传闻
%% -----------------------------------------------------------------------------

%% @doc 发送加入帮派邮件
send_join_mail(RoleList, GuildName) ->
    TempID = config:get_sys_config(guild_join_mail_temp_id),
    {Title, Content} = lib_mail:format_mail_temp(TempID, join_mail_temp_fun(GuildName)),
    case RoleList of
        RoleID when is_integer(RoleID) ->
            svr_mail:sys2p(RoleID, Title, Content, [], ?OPT_GM);
        [RoleID] ->
            svr_mail:sys2p(RoleID, Title, Content, [], ?OPT_GM);
        _ ->
            svr_mail:sys2select(RoleList, Title, Content, [], ?OPT_GM)
    end.

join_mail_temp_fun(GuildName) ->
    fun(Title, Content) -> {Title, io_lib:format(Content, [GuildName])} end.

%% @doc 帮派的所有玩家 [含不在线的]
send_guild_mail(Guild, TempID, Items) ->
    RoleList = get_member_id_list(Guild),
    svr_mail:sys2select(RoleList, TempID, Items, ?OPT_GM).

send_guild_mail(Guild, Title, Content, Items) ->
    RoleList = get_member_id_list(Guild),
    svr_mail:sys2select(RoleList, Title, Content, Items, ?OPT_GM).

%% @doc 发送加入帮派传闻
send_join_rumor(GuildID, RoleName) ->
    JoinRumor = config:get_sys_config(guild_join_rumor),
    svr_rumor:publish({guild, GuildID}, JoinRumor, [RoleName]).

%% @doc 发送离开帮派传闻
send_leave_rumor(GuildID, RoleID) ->
    LeaveRumor = config:get_sys_config(guild_leave_rumor),
    RoleName = lib_cache:get_role_name(RoleID),
    svr_rumor:publish({guild, GuildID}, LeaveRumor, [RoleName]).

%% @doc 成为帮主传闻
send_become_guild_chief_rumor(GuildID, RoleID) ->
    BecomeChiefRumor = config:get_sys_config(guild_become_chief_rumor),
    RoleName = lib_cache:get_role_name(RoleID),
    svr_rumor:publish({guild, GuildID}, BecomeChiefRumor, [RoleName]).

%% @doc 职位变化传闻
send_pos_change_rumor(GuildID, RoleID, Pos, Level) ->
    Pos =/= ?GUILD_POS_CHIEF andalso Pos =/= ?GUILD_POS_NORMAL andalso begin
        RoleName = lib_cache:get_role_name(RoleID),
        PosStr = get_pos_string(Pos, Level),
        Rumor = config:get_sys_config(guild_pos_change_rumor),
        svr_rumor:publish({guild, GuildID}, Rumor, [RoleName, PosStr])
    end.

%% @doc 帮派升级传闻
send_guild_upgrade_rumor(GuildID, Level) ->
    UpgradeRumor = config:get_sys_config(guild_upgrade_rumor),
    svr_rumor:publish({guild, GuildID}, UpgradeRumor, [Level]).

%% @doc 广播
broadcast(Bin) ->
    GuildID = get_guild_id(),
    broadcast(GuildID, Bin).

broadcast(GuildID, Bin) ->
    broadcast_except(GuildID, Bin, []).

%%broadcast(GuildID, Bin) when is_integer(GuildID) ->
%%    Guild = get_guild_info(GuildID),
%%    broadcast(Guild, Bin);
%%broadcast(Guild, Bin) when is_record(Guild, guild) ->
%%    #guild{members = Members} = Guild,
%%    broadcast(Members, Bin);
%%broadcast(Members, Bin) when is_list(Members) ->
%%    [lib_role_send:send_to_role(RoleID, Bin) || #guild_member{role_id = RoleID} <- Members];
%%broadcast(_Members, _Bin) ->
%%    ignore.

%% @doc 广播
broadcast_except(Bin, Except) ->
    GuildID = get_guild_id(),
    broadcast_except(GuildID, Bin, Except).

broadcast_except(GuildID, Bin, Except) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    broadcast_except(Guild, Bin, Except);
broadcast_except(Guild, Bin, Except) when is_record(Guild, guild) ->
    #guild{members = Members} = Guild,
    broadcast_except(Members, Bin, Except);
broadcast_except(Members, Bin, Except) when is_list(Members), is_integer(Except) ->
    broadcast_except(Members, Bin, [Except]);
broadcast_except(Members, Bin, Except) when is_list(Members) ->
    [begin
        lib_role_send:send_to_role(RoleID, Bin)
    end || #guild_member{role_id = RoleID} <- Members, not lists:member(RoleID, Except)];
broadcast_except(_Members, _Bin, _Except) ->
    ignore.

%% @doc 广播给指定职位的玩家
broadcast_to_pos(Pos, Bin) ->
    GuildID = get_guild_id(),
    broadcast_to_pos(GuildID, Pos, Bin).

broadcast_to_pos(GuildID, Pos, Bin) ->
    Members = get_pos_member(GuildID, Pos),
    broadcast(Members, Bin).

%% @doc
info(GuildID, Info) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    info(Guild, Info);
info(Guild, Info) when is_record(Guild, guild) ->
    #guild{members = Members} = Guild,
    info(Members, Info);
info(Members, Info) ->
    [begin
        lib_role:info_role(RoleID, Info)
    end || #guild_member{role_id = RoleID} <- Members].

%% @doc 指定模块的消息
guild_info(GuildID, Info) ->
    info(GuildID, {mod, lib_role_guild, Info}).

%% @doc 单个玩家指定模块的消息
role_guild_info(RoleID, Info) ->
    lib_role:info_role(RoleID, {mod, lib_role_guild, Info}).

%% -----------------------------------------------------------------------------

%% @doc 帮派活动是否进行中 [帮派战、帮派Boss、领地战]
is_forbidden_leave() ->
    lib_activity:is_ongoing(?ACT_ID_MASTER) orelse
        lib_activity:is_ongoing(?ACT_ID_WORLD_BOSS) orelse
        lib_activity:is_ongoing(?ACT_ID_JOUSTS_HALL) orelse
        lib_territory_mgr:is_ongoing() orelse
        lib_activity:is_ongoing(?ACT_ID_GUILD_DEFEND).

is_forbidden_join() ->
    lib_activity:is_ongoing(?ACT_ID_MASTER) orelse
        lib_activity:is_ongoing(?ACT_ID_WORLD_BOSS) orelse
        lib_activity:is_ongoing(?ACT_ID_JOUSTS_HALL) orelse
        lib_activity:is_ongoing(?ACT_ID_GUILD_DEFEND).

%% @doc 某个职位的玩家数量
get_pos_member_num(Guild, Pos) ->
    length(get_pos_member(Guild, Pos)).

%% @doc 某个职位的玩家
get_pos_member(GuildID, Pos) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    get_pos_member(Guild, Pos);
get_pos_member(Guild, Pos) when is_record(Guild, guild) ->
    #guild{members = Members} = Guild,
    get_pos_member(Members, Pos);
get_pos_member(Members, Pos) when is_integer(Pos) ->
    [Member || #guild_member{pos = RolePos} = Member <- Members, RolePos =:= Pos];
get_pos_member(Members, {ge, Pos}) when is_integer(Pos) ->
    [Member || #guild_member{pos = RolePos} = Member <- Members, RolePos >= Pos].

%% @doc 获取帮派成员列表
get_member_id_list(undefined) ->
    [];
get_member_id_list(GuildID) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    get_member_id_list(Guild);
get_member_id_list(Guild) ->
    #guild{members = Members} = Guild,
    [RoleID || #guild_member{role_id = RoleID} <- Members].

%% @doc 获取帮派成员列表
get_chief_members(undefined) ->
    {0, []};
get_chief_members(GuildID) when is_integer(GuildID) ->
    Guild = get_guild_info(GuildID),
    get_chief_members(Guild);
get_chief_members(Guild) ->
    #guild{chief_id = ChiefID, members = Members} = Guild,
    {ChiefID, [RoleID || #guild_member{role_id = RoleID} <- Members, RoleID =/= ChiefID]}.

%% @doc 职位最大人数
get_max_pos_mem_num(Pos, Level) ->
    case conf_guild_pos:get(Level, Pos) of
        #{num := Num} -> Num;
        _ -> 0
    end.

%% @doc 帮派职位字符串
get_pos_string(Pos, Level) ->
    case conf_guild_pos:get(Level, Pos) of
        #{name := Name} -> Name;
        _ -> <<"">>
    end.


%% @doc 获取帮派最大成员数量
get_max_member_num(GuildID) ->
    RoomLv = get_build_level(GuildID, ?GUILD_BUILD_ROOM),
    case conf_guild_build:get(?GUILD_BUILD_ROOM, RoomLv) of
        #{effect := Num} -> Num;
        _ -> 0
    end.

get_build_level(GuildID, Type) ->
    #guild{build = Build} = get_guild_info(GuildID),
    util:prop_get_value(Type, Build, 0).

%% @doc 是否帮派驻地场景
is_seat_scene(SceneID) ->
    SceneID =:= get_seat_scene().

%% @doc 获取帮派驻地场景ID
get_seat_scene() ->
    config:get_sys_config(guild_seat_scene).

%% @doc 获取帮派驻地进入坐标
get_seat_enter_pos() ->
    lib_scene_api:get_scene_born_pos(get_seat_scene()).

%% -----------------------------------------------------------------------------

%% @doc 申请
add_apply_db(GuildID, Apply) ->
    #guild_apply{role_id = RoleID} = Apply,
    Now = time:unixtime(),
    SQL = io_lib:format(?SQL_ADD_ROLE_GUILD_APPLY, [RoleID, GuildID, Now]),
    ?DB:execute(SQL).

%% @doc 取消申请
del_apply_db(GuildID, RoleID) ->
    SQL = io_lib:format(?SQL_DEL_ROLE_GUILD_APPLY, [RoleID, GuildID]),
    ?DB:execute(SQL).

%% @doc 修改成员职位
kick_out_db(RoleID) ->
    SQL = io_lib:format(?SQL_KICK_GUILD_MEMBER, [time:unixtime(), RoleID]),
    ?DB:execute(SQL),
    role_guild_info(RoleID, {guild_pos_change, 0, <<"">>, 0}).

%% @doc 修改成员职位
set_role_guild_pos(RoleID, GuildID, GuildName, Pos) ->
    SQL = io_lib:format(?SQL_UPDATE_MEMBER_POS, [GuildID, Pos, RoleID]),
    ?DB:execute(SQL),
    role_guild_info(RoleID, {guild_pos_change, GuildID, GuildName, Pos}).

%% @doc 直接修改帮主信息
set_guild_chief_db(GuildID, ChiefID, ChiefName) ->
    SQL = io_lib:format(?SQL_UPDATE_GUILD_CHIEF_INFO, [ChiefID, ChiefName, GuildID]),
    ?DB:execute(SQL).

%% =============================================================================
%% 初始化、保存
%% =============================================================================
%% @doc 生成帮派编号列表
gen_num_list() ->
    DbNumList = ?DB:get_all(?SQL_GET_ALL_GUILD_NUM),
    NumList = [Num || [Num] <- DbNumList],
    erlang:put(guild_num_list, NumList).

%% @doc 启动加载数据
init_for_start() ->
    %% 成员
    MemberList = ?DB:get_all(?SQL_GET_ALL_GUILD_MEMBER),
    MemFun = fun([RoleID, GuildID, Position, LastLeave, LastJoin, Cont, Time, WeeklyLive, WeeklyFunds, WeeklyCont]) ->
        RoleGuild = #guild_role{
            role_id = RoleID, guild_id = GuildID, last_leave = LastLeave, last_join = LastJoin,
            cont = Cont, time = Time, weekly_cont = WeeklyCont,
            weekly_funds = WeeklyFunds, weekly_live = WeeklyLive
        },
        set_role_data(RoleID, RoleGuild),
        Members = case erlang:get({member, GuildID}) of undefined -> []; V -> V end,
        NewMembers = [#guild_member{role_id = RoleID, pos = Position} | Members],
        erlang:put({member, GuildID}, NewMembers)
    end,
    lists:map(MemFun, MemberList),
    %% 申请
    ApplyList = ?DB:get_all(?SQL_GET_ALL_APPLY),
    ApplyFun = fun([RoleID, GuildID, Name, Level, Fight]) ->
        Apply = #guild_apply{role_id = RoleID, role_name = Name, level = Level, fight = Fight},
        List = case erlang:get({apply, GuildID}) of undefined -> []; V -> V end,
        erlang:put({apply, GuildID}, [Apply | List])
    end,
    lists:map(ApplyFun, ApplyList),
    %% 帮派
    GuildList = ?DB:get_all(?SQL_GET_ALL_GUILD),
    GuildFun = fun([ID, Name, CreatorID, CreatorName, CreateTime, CreateType,
        ChiefID, ChiefName, AcceptType, AutoAccept, Recruit, Announce, Level,
        Funds, DbRecord, CookVal, CookNum, DbCookLogs, Time, PauseDenfTime,
        DbRecentlyLive, TodayLive, DbBonus, DbTask, TaskStage, DbBuild, DbStudy, Exploit,
        Battle, DbDeclare, DbBack, DbHostile, Rob, DbBless, Num0, DbShDung, DbRobList]) ->
        Apply = case erlang:erase({apply, ID}) of undefined -> []; V1 -> V1 end,
        Members = case erlang:erase({member, ID}) of undefined -> []; V2 -> V2 end,
        Record = type:convert_db_field(list, DbRecord, []),
        CookLogs = type:convert_db_field(list, DbCookLogs, []),
        RecentlyLive = type:convert_db_field(list, DbRecentlyLive, []),
        Bonus = fix_bonus(type:convert_db_field(list, DbBonus, [])),
        Build = fix_build(Level, type:convert_db_field(list, DbBuild, [])),
        Study = fix_study(type:convert_db_field(list, DbStudy, [])),
        Declare = type:convert_db_field(list, DbDeclare, []),
        Back = type:convert_db_field(list, DbBack, []),
        Hostile = sets:from_list(type:convert_db_field(list, DbHostile, [])),
        Bless = type:convert_db_field(list, DbBless, []),
        Task = fix_guild_task(type:convert_db_field(list, DbTask, [])),
        %% 判断帮派维护状态
        SDenfFunds = calc_standard_denf_funds(Build),
        DenfState =
            ?iif(
                (PauseDenfTime =:= 0 orelse PauseDenfTime < time:unixtime()) andalso Funds >= SDenfFunds,
                ?GUILD_NORMAL_DENF_STATE,
                ?GUILD_LOW_DENF_STATE
            ),
        Num = gen_guild_num(Num0, ID),
        ShDung = fix_sh_dung(type:convert_db_field(list, DbShDung, [])),
        RobList = type:convert_db_field(list, DbRobList, []),
        %% 忽略成员数量为0的帮派
        Members =/= [] andalso begin
            Guild = #guild{
                id = ID, name = Name, creator_id = CreatorID, creator_name = CreatorName,
                chief_id = ChiefID, chief_name = ChiefName, announce = Announce,
                accept_type = AcceptType, auto_accept = AutoAccept, recruit = Recruit,
                level = Level, funds = Funds, apply = Apply, time = Time, members = Members,
                create_time = CreateTime, create_type = CreateType, record = Record,
                cook_val = CookVal, cook_num = CookNum, cook_logs = CookLogs,
                denf_state = DenfState, pause_denf_time = PauseDenfTime,
                recently_live = RecentlyLive, today_live = TodayLive, bonus = Bonus,
                task = Task, task_stage = TaskStage, build = Build, study = Study,
                exploit = Exploit, battle = Battle, declare = Declare, back = Back,
                hostile = Hostile, rob = Rob, bless = Bless, num = Num, sh_dung = ShDung,
                rob_list = RobList
            },
            set_guild_info(Guild),
            check_reset_guild_data(Guild),
            GuildIDList = case erlang:get(guild) of undefined -> []; V -> V end,
            erlang:put(guild, [ID | GuildIDList])
        end
    end,
    lists:map(GuildFun, GuildList),
    erlang:erase({member, 0}),
    %% 启动帮派进程
    GuildIDList = case erlang:erase(guild) of undefined -> []; V -> V end,
    [start_guild_process(GuildID) || GuildID <- GuildIDList],
    %% 重命名邮件
    guild_rename_mail(),
    ok.

%% 生成帮派编号
gen_guild_num(0, GuildID) ->
    NumList = erlang:get(guild_num_list),
    Num =
        case NumList =:= [] of
            true ->
                1;
            _ ->
                MaxNum = lists:max(NumList),
                case MaxNum =:= length(NumList) of
                    true ->
                        MaxNum + 1;
                    _ ->
                        get_insert_num(NumList)
                end
        end,
    NumListN = [Num | NumList],
    erlang:put(guild_num_list, NumListN),
    SetGuildNumSQL = io_lib:format(?SQL_SET_GUILD_NUM, [Num, GuildID]),
    ?DB:execute(SetGuildNumSQL),
    Num;
gen_guild_num(Num, _) ->
    Num.

get_insert_num(NumList) ->
    SortList = lists:sort(NumList),
    get_insert_num(SortList, 1).

get_insert_num([], SortNum) -> SortNum;
get_insert_num([SortNum | T], SortNum) ->
    get_insert_num(T, SortNum + 1);
get_insert_num(_, SortNum) -> SortNum.

%% @doc 处理帮重命名邮件
guild_rename_mail() ->
    %% 发放改名邮件
    List = ?DB:get_all(?SQL_GET_RENAME_MAIL_CHIEF),
    RoleList = [RoleID || [RoleID] <- List],
    MailID = config:get_sys_config(guild_rename_mail),
    ItemID = config:get_sys_config(guild_rename_item),
    Costs = [{?AST_ITEM, [{ItemID, 1}]}],
    svr_mail:sys2select(RoleList, MailID, Costs, ?OPT_GM),
    %% 删除改名标记
    ?DB:execute(?SQL_DEL_RENAME_TAG),
    ok.

%% @doc 启动帮派进程
start_guild_process(GuildID) ->
    SceneID = get_seat_scene(),
    sup_guild_svr:start_child(GuildID),
    svr_scene_mgr:add_scene_line_asyn(SceneID, GuildID).

%% @doc 保存改变的玩家数据
save_update_roles() ->
    Fun = fun({RoleID, _}, Acc) ->
        save_role_data(RoleID),
        Acc
    end,
    ets:foldl(Fun, ok, ?ETS_GUILD_ROLE_UPDATE),
    ets:delete_all_objects(?ETS_GUILD_ROLE_UPDATE).

%% @doc 保存玩家数据
save_role_data(RoleID) when is_integer(RoleID) ->
    RoleData = get_role_data(RoleID),
    save_role_data(RoleData);
save_role_data(RoleData) when is_record(RoleData, guild_role) ->
    #guild_role{role_id = RoleID, last_leave = LastLeave, cont = Cont, time = Time, last_join = LastJoin,
        weekly_cont = WeeklyCont, weekly_live = WeeklyLive, weekly_funds = WeeklyFonds} = RoleData,
    SQL = io_lib:format(?SQL_SET_GUILD_MEMBER, [LastLeave, LastJoin, Cont, Time, WeeklyLive, WeeklyFonds, WeeklyCont, RoleID]),
    ?DB:execute(SQL);
save_role_data(_) ->
    ok.

%% @doc 保存改变的帮派数据
save_update_guilds() ->
    Fun = fun({GuildID, _}, Acc) ->
        save_guild_data(GuildID),
        Acc
    end,
    ets:foldl(Fun, ok, ?ETS_GUILD_UPDATE),
    ets:delete_all_objects(?ETS_GUILD_UPDATE).

%% @doc 保存帮派数据
save_guild_data(GuildID) when is_integer(GuildID) ->
    Guild = lib_guild:get_guild_info(GuildID),
    save_guild_data(Guild);
save_guild_data(Guild) when is_record(Guild, guild) ->
    #guild{
        id = GuildID, chief_id = ChiefID, chief_name = ChiefName, accept_type = AcceptType,
        auto_accept = AutoAccept, recruit = Recruit, announce = Announce, level = Level,
        funds = Funds, record = Record, cook_val = CookVal, cook_num = CookNum,
        cook_logs = CookLogs, time = Time, pause_denf_time = PauseDenfTime,
        recently_live = RecentlyLive, today_live = TodayLive, bonus = Bonus, task_stage = TaskStage,
        task = Task, build = Build, study = Study, exploit = Exploit, battle = Battle,
        declare = Declare, back = Back, hostile = Hostile, rob = Rob, bless = Bless, sh_dung = ShDung,
        rob_list = RobList
    } = Guild,
    DbRecord = type:term_to_bitstring(Record),
    DbCookLogs = type:term_to_bitstring(CookLogs),
    DbRecentlyLive = type:term_to_bitstring(RecentlyLive),
    DbBonus = type:term_to_bitstring(Bonus),
    DbTask = type:term_to_bitstring(Task),
    DbBuild = type:term_to_bitstring(Build),
    DbStudy = type:term_to_bitstring(Study),
    DbDeclare = type:term_to_bitstring(fix_declare_or_back(Declare)),
    DbBack = type:term_to_bitstring(fix_declare_or_back(Back)),
    DbHostile = type:term_to_bitstring(sets:to_list(Hostile)),
    DbBless = type:term_to_bitstring(fix_bless(Bless)),
    DbShDung = type:term_to_bitstring(ShDung),
    DbRobList = type:term_to_bitstring(RobList),
    SQL = io_lib:format(?SQL_SAVE_GUILD_DATA, [
        ChiefID, ChiefName, AcceptType, AutoAccept, Recruit, Announce, Level,
        Funds, DbRecord, CookVal, CookNum, DbCookLogs, Time, PauseDenfTime,
        DbRecentlyLive, TodayLive, DbBonus, DbTask, TaskStage, DbBuild, DbStudy, Exploit,
        Battle, DbDeclare, DbBack, DbHostile, Rob, DbBless, DbShDung, DbRobList, GuildID
    ]),
    ?DB:execute(SQL);
save_guild_data(_) ->
    ok.

%% =============================================================================
%% 数据 [公共进程]
%% =============================================================================

%% @doc 玩家帮派数据
get_role_data(RoleID) ->
    case ets:lookup(?ETS_GUILD_ROLE, RoleID) of
        [RoleData] -> reset_role_data(RoleID, RoleData);
        _ -> load_role_data(RoleID)
    end.

%% @doc 加载玩家数据 [启动时已经加载。。。。]
load_role_data(RoleID) ->
    case ?DB:get_row(io_lib:format(?SQL_GET_GUILD_MEMBER, [RoleID])) of
        [GuildID, _Pos, LastLeave, LastJoin, Cont, Time, WeeklyLive, WeeklyFunds, WeeklyCont] ->
            RoleData = #guild_role{
                role_id = RoleID, guild_id = GuildID, last_leave = LastLeave, last_join = LastJoin,
                cont = Cont, time = Time, weekly_cont = WeeklyCont, weekly_funds = WeeklyFunds,
                weekly_live = WeeklyLive
            },
            reset_role_data(RoleID, RoleData);
        _ ->
            %% 初始化数据
            SQL = io_lib:format(?SQL_INIT_ROLE_DATA, [RoleID]),
            ?DB:execute(SQL),
            RoleData = #guild_role{role_id = RoleID, time = time:unixtime()},
            set_role_data(RoleID, RoleData),
            RoleData
    end.

reset_role_data(RoleID, RoleData) ->
    #guild_role{time = Time} = RoleData,
    case time:is_today(Time) of
        true ->
            RoleData;
        _ ->
            Now = time:unixtime(),
            NewData = RoleData#guild_role{time = Now},
            NewData2 =
                %% 重置周数据
                case time:is_same_week(Now, Time) of
                    true ->
                        NewData;
                    _ ->
                        NewData#guild_role{weekly_live = 0, weekly_funds = 0, weekly_cont = 0}
                end,
            update_role_data(RoleID, NewData2),
            NewData2
    end.

%% @doc 更新玩家数据
update_role_data(RoleID, RoleData) ->
    svr_guild_mgr:data_update(?GUILD_UP_TYPE_ROLE, RoleID),
%%    save_role_data(RoleData),
    set_role_data(RoleID, RoleData).

%% @doc 设置玩家数据
set_role_data(_RoleID, RoleData) ->
    NewData = RoleData#guild_role{updated = true},
    ets:insert(?ETS_GUILD_ROLE, NewData).

%% @doc 获取玩家帮派ID
get_role_guild_id(RoleID) ->
    case ets:lookup(?ETS_GUILD_ROLE, RoleID) of
        [#guild_role{guild_id = GuildID}] -> GuildID;
        _ -> 0
    end.

%% @doc 获取玩家帮派ID
get_role_guild(RoleID) ->
    GuildID = get_role_guild_id(RoleID),
    get_guild_info(GuildID).

%% @doc 是否拥有帮派
has_guild(RoleID) ->
    get_role_guild_id(RoleID) =/= 0.

%% @doc
get_join_time(RoleID) ->
    RoleData = get_role_data(RoleID),
    #guild_role{last_join = JoinTime} = RoleData,
    JoinTime.

%% @doc 获取帮派数据
get_guild_info(Guild) when is_record(Guild, guild) ->
    Guild;
get_guild_info(GuildID) when is_integer(GuildID) ->
    case ets:lookup(?ETS_GUILD, GuildID) of
        [V] -> V;
        _ -> undefined
    end.

%% @doc 获取帮派等级
get_guild_level(GuildID) ->
    get_guild_element(GuildID, #guild.level, 0).

%% @doc 获取帮主ID
get_chief_id(GuildID) ->
    get_guild_element(GuildID, #guild.chief_id, 0).

%% @doc 获取帮派名
get_guild_name(GuildID) ->
    get_guild_element(GuildID, #guild.name, "").

%% @doc 获取帮派任务阶段
get_guild_task_stage(GuildID) ->
    get_guild_element(GuildID, #guild.task_stage, 1).

get_guild_element(GuildID, Index, Default) ->
    case get_guild_info(GuildID) of
        #guild{} = Guild ->
            element(Index, Guild);
        _ ->
            Default
    end.

%% @doc 获得帮派是否低维护状态
get_is_low_defend_state(GuildID) ->
    get_guild_element(GuildID, #guild.denf_state, 1) =:= ?GUILD_LOW_DENF_STATE.

%% @doc 更新帮派数据
update_guild_info(GuildInfo) ->
    svr_guild_mgr:data_update(?GUILD_UP_TYPE_GUILD, GuildInfo#guild.id),
%%    save_guild_data(GuildInfo),
    set_guild_info(GuildInfo).

%% @doc 设置帮派信息
set_guild_info(GuildInfo) ->
    ets:insert(?ETS_GUILD, GuildInfo).

%% @doc 跨天重置帮派数据
cross_day_reset(undefined) ->
    ignore;
cross_day_reset(GuildID) when is_integer(GuildID) ->
    cross_day_reset(get_guild_info(GuildID));
cross_day_reset(Guild) when is_record(Guild, guild) ->
    GuildN = calc_recently_live(Guild),
    reset_guild_data(GuildN, true).

%% @doc 检查重置帮派数据
check_reset_guild_data(Guild) ->
    #guild{time = Time} = Guild,
    case time:is_today(Time) of
        true -> ignore;
        _ -> reset_guild_data(Guild, false)
    end.

%% @doc 重置帮派数据
reset_guild_data(Guild, _ZeroClock) ->
    Now = time:unixtime(),
    NewGuild = Guild#guild{
        cook_val = 0, cook_num = 0, time = Now
    },
    update_guild_info(NewGuild).

%% 重新计算帮派活跃
calc_recently_live(Guild) ->
    #guild{id = GuildID, today_live = TodayLive, recently_live = RecentlyLive, name = GuildName} = Guild,
    %% 计算最近7天
    NewRecentlyLive =
        case length(RecentlyLive) >= 7 of
            true ->
                [_ | T] = lists:sort(RecentlyLive),
                [{time:unixtime(), TodayLive} | T];
            _ ->
                [{time:unixtime(), TodayLive} | RecentlyLive]
        end,
    TotalLiveExp = calc_recently_live_exp(NewRecentlyLive),
    TotalLiveExp > 0 andalso lib_role_rank:update_guild_lively_rank(GuildID, TotalLiveExp, GuildName),
    Guild#guild{recently_live = NewRecentlyLive, today_live = 0}.

calc_recently_live_exp(RecentlyLive) ->
    lists:foldl(fun({_, Exp}, TotolExp) ->
        TotolExp + Exp
    end, 0, RecentlyLive).


%% @doc 根据名字查找帮派
get_guild_by_name(Name) ->
    Fun = ets:fun2ms(fun(#guild{id = GuildID, name = GuildName})
        when Name =:= GuildName ->
        GuildID
    end),
    ets:select(?ETS_GUILD, Fun).

%% @doc 设置帮派ID
set_guild_id(GuildID) ->
    erlang:put(guild_id, GuildID).

%% @doc 帮派ID
get_guild_id() ->
    erlang:get(guild_id).

%% @doc 获取帮派列表
get_guild_list() ->
    Fun = ets:fun2ms(fun(#guild{id = GuildID}) -> GuildID end),
    ets:select(?ETS_GUILD, Fun).