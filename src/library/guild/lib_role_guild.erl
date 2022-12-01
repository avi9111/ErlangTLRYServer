%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     帮派
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_guild).
-author("Ryuu").

-include("drop.hrl").
-include("role.hrl").
-include("cache.hrl").
-include("goods.hrl").
-include("guild.hrl").
-include("skill.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("task.hrl").
-include("keyvalue.hrl").
-include("guild_wages.hrl").
-include("dungeon.hrl").
-include("scene_objs.hrl").
-include("guild_wine_act.hrl").
-include("proto/prot_414.hrl").
-include("proto/prot_205.hrl").
-include("proto/prot_535.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    rename/2,
    get_attr/1,
    cross_day/1,
    get_fight/1,
    get_skills/1,
    handle_info/2,
    lucky_money/2,
    add_live_exp/2,
    get_rival_map/1,
    get_role_data/1,
    is_enemy_guild/2,
    is_hostile_guild/2,
    get_hostile_sets/1,
    get_relation_type/2,
    practice_skill_up/2,
    get_practice_skill/1,
    level_up_prac_max_lv/1,
    get_practice_skills_attr/1
]).

-define(NO_GUILD_CHECK(PS, Other),
    case PS#role_state.guild_id =:= 0 of
        false -> {error, ?RC_GUILD_ALREADY_HAVE_GUILD};
        _ -> Other
    end).

-define(GUILD_CHECK_NOTIFY(PS, Other),
    case PS#role_state.guild_id > 0 of
        false -> ?ERROR_TOC(PS, ?RC_GUILD_HAVE_NO_GUILD);
        _ -> Other
    end).

%% @doc 处理消息 [玩家进程]
%%handle_info({guild_upgrade, NewLevel}, PS) ->
%%    guild_upgrade(PS, NewLevel);
handle_info(clear_guild_wine_data, #role_state{id = RoleID, role_scene = #role_scene{scene_id = SceneId}} = _PS) ->
    lib_role_guild_wine_act:daily_lively(RoleID, SceneId),
    lib_role_guild_wine_act:update_role_data(RoleID, lib_role_guild_wine_act:get_default_guild_wine());
handle_info({guild_rename, NewName}, PS) ->
    guild_renamed(PS, NewName);
handle_info({guild_pos_change, GuildID, GuildName, Pos}, PS) ->
    role_guild_pos_change(PS, GuildID, GuildName, Pos);
handle_info(init_ex_timer, PS) ->
    init_ex_timer(PS),
    init_metall(PS);
handle_info(refresh_exchange, PS) ->
    refresh_exchange(PS);
handle_info({add_live_exp, AddExp}, PS) ->
    add_live_exp(PS, AddExp);
handle_info({add_guild_funds, AddFunds, OpType}, PS) ->
    add_guild_funds(PS, AddFunds, OpType);
handle_info({gm_reduce_funds, ReduceFunds, OpType}, PS) ->
    gm_reduce_funds(PS, ReduceFunds, OpType);
handle_info(gm_set_max_lv, PS) ->
    gm_set_max_lv(PS);
handle_info({'add_exploit', DGuildID}, PS) ->
    maybe_add_exploit(PS, DGuildID);
handle_info(sync_guild_declare, PS) ->
    sync_guild_declare(PS);
handle_info(sync_guild_hostile, PS) ->
    sync_guild_hostile(PS);
handle_info(_Info, _PS) ->
    ok.

event(PS, {fin_live_task, ID}) -> %% 完成活跃任务
    finish_liveness_task(PS, ID);
event(PS, {add_money, ?AST_CONT, Amount}) ->
    cont_added(PS, Amount);
event(PS, level_up) ->
    refresh_attr_fight(PS);
event(PS, {'finish_task', TaskID}) ->
    #{type := Type} = conf_task:get({TaskID, PS#role_state.career}),
    ?iif(lists:member(Type, [?TASK_TYPE_BMETALL, ?TASK_TYPE_SMETALL]), finish_metall_task(PS, TaskID), skip),
    ?iif(TaskID =:= 20501, add_metall_lively(PS, 30), skip);
event(#role_state{guild_id = GuildID} = PS, {'finish_dung', DungType, DungID, Times}) ->
    ?iif(DungType =:= ?DUNG_TEAM_SH andalso GuildID > 0, finish_sh_dung(PS, DungID, Times), skip);
event(PS, {'coll_collect', #{scene := SceneID, id := CollID}}) ->
    ?iif(SceneID =:= 40001 andalso CollID =:= 1136, metall_coll(PS), skip);
event(_PS, _Event) ->
    ignore.

do(41401, PS, _Req) ->
    get_info(PS);
do(41403, PS, _Req) ->
    get_guild_list(PS);
do(41405, PS, #cs_guild_get_detail{id = GuildID}) ->
    get_guild_detail(PS, GuildID);
do(41407, PS, _Req) ->
    get_guild_member(PS);
do(41409, PS, _Req) ->
    get_apply_list(PS);
do(41411, PS, #cs_guild_create{name = Name, announce = Announce}) ->
    create_guild(PS, Name, Announce);
do(41413, PS, #cs_guild_join_req{id = GuildID}) ->
    apply_guild(PS, GuildID);
do(41415, PS, #cs_guild_cancel_req{id = GuildID}) ->
    cancel_apply(PS, GuildID);
do(41419, PS, #cs_guild_handle_req{id = TargetID, approve = Approve}) ->
    handle_apply(PS, Approve, TargetID);
do(41421, PS, #cs_invite_join_guild{role_id = TargetID}) ->
    invite(PS, TargetID);
do(41425, PS, _Req) ->
    leave(PS);
do(41429, PS, #cs_guild_kick_member{id = TargetID}) ->
    kick_member(PS, TargetID);
do(41433, PS, #cs_guild_rename{name = Name}) ->
    rename(PS, Name);
do(41435, PS, #cs_guild_appoint_pos{role_id = TargetID, pos = Pos}) ->
    appoint_member_pos(PS, TargetID, Pos);
do(41439, PS, #cs_guild_change_announce{announce = Announce}) ->
    change_announce(PS, Announce);
do(41441, PS, #cs_guild_change_accept_type{type = Type, auto = Auto}) ->
    change_accept_type(PS, Type, Auto);
do(41447, PS, _Req) ->
    recruit(PS);
do(41449, PS, _Req) ->
    get_guild_logs(PS);
do(41455, PS, _Req) ->
    get_liveness_info(PS);
do(41457, PS, #cs_guild_get_live_reward{id = ID}) ->
    get_liveness_reward(PS, ID);
do(41459, PS, _Req) ->
    upgrade_liveness(PS);
do(41463, PS, _Req) ->
    get_cook_info(PS);
do(41465, PS, #cs_guild_cook{type = Type}) ->
    cook(PS, Type);
do(41467, PS, #cs_guild_get_cook_reward{id = ID}) ->
    get_cook_reward(PS, ID);
do(41471, PS, _Req) ->
    enter_seat(PS);
do(41473, PS, _Req) ->
    leave_seat(PS);
do(41475, PS, _Req) ->
    get_exchange_info(PS);
do(41477, PS, #cs_guild_exchange{id = ID}) ->
    exchange_item(PS, ID);
do(41479, PS, _Req) ->
    manual_refresh_ex(PS);
do(41481, PS, _Req) ->
    guild_upgrade(PS);
do(41483, PS, _Req) ->
    practice_info(PS);
do(41485, PS, #cs_guild_practice_up{id = ID}) ->
    practice_skill_up(PS, ID);
do(41487, PS, _Req) ->
    junket(PS);
do(41489, PS, _Req) ->
    metall_info(PS);
do(41491, PS, #cs_guild_metall_task{type = Type}) ->
    get_metall_task(PS, Type);
do(41493, PS, #cs_guild_build_up{id = ID}) ->
    build_up(PS, ID);
do(41495, PS, #cs_guild_study_up{id = ID}) ->
    study_up(PS, ID);
do(53501, PS, #cs_guild_declare{guild_id = DGuildID}) ->
    guild_declare(PS, DGuildID);
do(53503, PS, #cs_guild_hostile{guild_id = DGuildID}) ->
    set_hostile(PS, DGuildID);
do(53505, PS, _Req) ->
    get_declare_list(PS);
do(53507, PS, _Req) ->
    get_hostile_list(PS);
do(53510, PS, _Req) ->
    get_bless(PS);
do(53512, PS, #cs_guild_bless{id = ID}) ->
    bless(PS, ID);
do(53516, PS, #cs_guild_money_get{id = ID}) ->
    get_lucky_money(PS, ID);
do(53519, PS, #cs_guild_hostile_cancel{guild_id = DGuildID}) ->
    cancel_hostile(PS, DGuildID);
do(_Cmd, _PS, _Req) ->
    ok.

%% @doc 跨天
cross_day(PS) ->
    reset_role_data(PS).

%% @doc 获取自己的帮派信息
get_info(PS) ->
    #role_state{id = _RoleID, guild_id = GuildID} = PS,
    Rec = #sc_guild_info{
        guild = lib_guild:get_guild_detail(GuildID)
    },
    {ok, Bin} = prot_msg:encode_msg(41402, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 获取所有的帮派列表
get_guild_list(PS) ->
    #role_state{id = RoleID} = PS,
    svr_guild_mgr:get_guild_list(RoleID).

%% @doc 获取单个帮派信息
get_guild_detail(PS, GuildID) ->
    #role_state{id = RoleID} = PS,
    svr_guild_mgr:get_guild_detail(RoleID, GuildID).

%% @doc 获取成员列表
get_guild_member(PS) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:get_member_list(GuildID, RoleID)
    end).

%% @doc 创建帮派
create_guild(PS, Name, Announce) ->
    case catch check_create_guild(PS, Name, Announce) of
        {ok, GuildID, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_GUILD_CREATE),
            Rec = #sc_guild_create{id = GuildID},
            {ok, Bin} = prot_msg:encode_msg(41412, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% @doc 检查创建帮派
check_create_guild(PS, Name, Announce) ->
    #role_state{id = RoleID, name = RoleName} = PS,
    lib_guild:check_guild_name(Name),
    %% 现在只有一种创建方式
    ConfCreate = conf_guild_create:get(),
    ConfCreate =/= undefined orelse erlang:throw({error, ?RC_GUILD_INVALID_CREATE_TYPE}),
    #{silver := Cost, init_funds := Funds, level := GuildLv} = ConfCreate,
    Costs = [{?AST_SILVER, Cost}],
    lib_role_assets:check_items_enough(PS, Costs),
    CreateInfo = {Name, 1, GuildLv, Funds, RoleID, RoleName, Announce},
    {ok, GuildID} = ?MAKE_SURE(svr_guild_mgr:create_guild(CreateInfo)),
    {ok, GuildID, Costs}.

%% @doc 修改公告
change_announce(PS, Announce) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:change_announce(GuildID, RoleID, Announce)
    end).

%% @doc 修改招人条件
change_accept_type(PS, Type, Auto) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:change_accept_type(GuildID, RoleID, Type, Auto)
    end).

%% @doc 喊话招募
recruit(PS) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:recruit(GuildID, RoleID)
    end).

%% @doc 获取帮派记录
get_guild_logs(PS) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:get_guild_logs(GuildID, RoleID)
    end).

%% @doc 获取申请列表
get_apply_list(PS) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:get_apply_list(GuildID, RoleID)
    end).

%% @doc 申请加入帮派
apply_guild(PS, GuildID) ->
    ?NO_GUILD_CHECK(PS, begin
        Apply = apply_info(PS),
        GuildList = ?iif(GuildID =:= 0, lib_guild:get_guild_list(), [GuildID]),
        ID = apply_guild_list(GuildList, Apply),
        Rec = #sc_guild_join_req{id = ID},
        {ok, Bin} = prot_msg:encode_msg(41414, Rec),
        lib_role_send:send_to_role(PS, Bin)
    end).

apply_guild_list([], _Apply) ->
    0;
apply_guild_list([GuildID | T], Apply) ->
    case svr_guild:apply_for(GuildID, Apply) of
        join -> GuildID;
        _ -> apply_guild_list(T, Apply)
    end.

%% @doc 申请信息
apply_info(PS) ->
    #role_state{id = RoleID, name = Name, level = Level, combat_power = Fight} = PS,
    VipLv = lib_role_vip:get_vip_lv(),
    {RoleID, Name, Level, Fight, VipLv}.

%% @doc 取消帮派申请
cancel_apply(PS, GuildID) ->
    ?NO_GUILD_CHECK(PS, begin
        svr_guild:cancel_apply(GuildID, PS#role_state.id)
    end).

%% @doc 同意申请
handle_apply(PS, Approve, TargetID) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:handle_apply(GuildID, RoleID, Approve, TargetID)
    end).

%% @doc 邀请加入帮派
invite(PS, TargetID) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:invite(GuildID, RoleID, TargetID)
    end).

%% @doc 离开帮派
leave(PS) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:leave(GuildID, RoleID)
    end).

%% @doc 任命成员职位
appoint_member_pos(PS, TargetID, Pos) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:appoint_member_pos(GuildID, RoleID, TargetID, Pos)
    end).

%% @doc 踢人
kick_member(PS, TargetID) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:kick_out(GuildID, RoleID, TargetID)
    end).

%% @doc 帮派改名
rename(PS, Name) ->
    case catch check_rename(PS, Name) of
        {ok, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_GUILD_RENAME),
            Rec = #sc_guild_rename{name = Name},
            {ok, Bin} = prot_msg:encode_msg(41434, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_rename(PS, Name) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    GuildID =/= 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    lib_guild:check_guild_name(Name),
    ItemID = config:get_sys_config(guild_rename_item),
    Costs = [{?AST_ITEM, [{ItemID, 1}]}],
    lib_role_assets:check_items_enough(PS, Costs),
    ok = ?MAKE_SURE(svr_guild:rename(GuildID, RoleID, Name)),
    {ok, Costs}.

%% @doc 帮派重命名了
guild_renamed(PS, Name) ->
    PS1 = PS#role_state{guild_name = Name},
    {ok, PS1}.

%% @doc 帮派、职位变化
role_guild_pos_change(PS, GuildID, GuildName, Pos) ->
    #role_state{id = RoleID, guild_id = OldGuildID} = PS,
    PS1 = PS#role_state{guild_id = GuildID, guild_name = GuildName, guild_pos = Pos},
    if
        OldGuildID =:= 0 andalso GuildID > 0 -> %% 加入帮派
            ?TASK_EVENT(RoleID, 'join_guild'),
            PS2 = PS1;
        OldGuildID > 0 andalso GuildID =:= 0 -> %% 离开帮派
            PS2 = del_guild_metall(force_leave_guild_scene(PS1));
        true -> %% 职位等变化
            PS2 = PS1
    end,
    OldGuildID =/= GuildID andalso begin
        ?EVENT(RoleID, 'guild_changed'),
        lib_scene_api:update(guild, PS2),
        svr_role_agent:update(RoleID, [{#role_online.guild_id, GuildID}])
    end,
    NewPS = lib_role_attr:refresh_combat_power(PS2),
    {ok, NewPS}.

%% @doc 贡献增加，同步历史帮贡
cont_added(PS, Amount) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    GuildID > 0 andalso svr_guild:add_cont(GuildID, RoleID, Amount).

guild_upgrade(PS) ->
    ?GUILD_CHECK_NOTIFY(PS, begin
        #role_state{id = RoleID, guild_id = GuildID} = PS,
        svr_guild:upgrade(GuildID, RoleID)
    end).

%% 增加活跃值
add_live_exp(PS, AddExp) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:add_live_exp(GuildID, RoleID, AddExp),
        add_metall_lively(PS, AddExp)
    end),
    ok.

%% 增加帮派资金
add_guild_funds(PS, AddFunds, OpType) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:add_funds(GuildID, RoleID, AddFunds, OpType)
    end),
    ok.

%% 帮派建筑升级
build_up(PS, ID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:build_up(GuildID, RoleID, ID)
    end),
    ok.

%% 帮派研究升级
study_up(PS, ID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:study_up(GuildID, RoleID, ID)
    end),
    ok.

%% 宣战帮派
guild_declare(PS, DGuildID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:guild_declare(GuildID, RoleID, DGuildID)
    end),
    ok.

%% 设置敌对
set_hostile(PS, DGuildID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:set_hostile(GuildID, RoleID, DGuildID)
    end),
    ok.

cancel_hostile(PS, DGuildID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:cancel_hostile(GuildID, RoleID, DGuildID)
    end),
    ok.

%% 获得宣战&应战列表
get_declare_list(PS) ->
    #role_state{sid = RoleSid, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:get_declare_list(GuildID, RoleSid)
    end),
    ok.

%% 获得敌对列表
get_hostile_list(PS) ->
    #role_state{sid = RoleSid, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:get_hostile_list(GuildID, RoleSid)
    end),
    ok.

%% 增加战绩
maybe_add_exploit(PS, DGuildID) ->
    #role_state{guild_id = GuildID} = PS,
    is_enemy_guild(GuildID, DGuildID)
        andalso svr_guild:add_exploit(GuildID, 1),
    ok.

%% 查看祝福列表
get_bless(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:get_bless(GuildID, RoleID)
    end),
    ok.

%% 帮派祝福
bless(PS, ID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:bless(GuildID, RoleID, ID)
    end),
    ok.

%% 帮派红包
lucky_money(PS, ID) ->
    case catch check_lucky_money(PS, ID) of
        {ok, GuildID, Conf} ->
            #role_state{id = RoleID, name = Name, personal = Personal} = PS,
            #{icon := Icon} = Personal,
            Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_GET_LUCKY_MONEY_TIMES),
            #{max_times := MaxTimes} = conf_guild_lucky_money_info:get(),
            {ok, GetBgold} = svr_guild:lucky_money(GuildID, Name, Icon, Conf, RoleID, Times < MaxTimes),
            NewPS =
                case GetBgold > 0 of
                    true ->
                        PS0 = lib_role_assets:add_items_notify(PS, [{?AST_BGOLD, GetBgold}], ?OPT_LUCKY_MONEY),
                        router_105:send_commonly_keyvalue(PS#role_state.sid, ?KEY_DAILY_GET_LUCKY_MONEY_TIMES, Times + 1),
                        lib_role_kv:set_kv(PS#role_state.id, ?KEY_DAILY_GET_LUCKY_MONEY_TIMES, Times + 1),
                        PS0;
                    _ ->
                        PS
                end,
            ?TASK_EVENT(PS, 'give_lucky_money'),
            {ok, NewPS};
        {error, Code} ->
            {error, Code}
    end.

check_lucky_money(PS, ID) ->
    #role_state{guild_id = GuildID} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    Conf = conf_guild_lucky_money:get(ID),
    Conf =/= undefiend orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    {ok, GuildID, Conf}.

%% 抢红包
get_lucky_money(PS, ID) ->
    case catch check_get_lucky_money(PS, ID) of
        {ok, Times, GetBgold} ->
            NewPS = lib_role_assets:add_items_notify(PS, [{?AST_BGOLD, GetBgold}], ?OPT_LUCKY_MONEY),
            router_105:send_commonly_keyvalue(PS#role_state.sid, ?KEY_DAILY_GET_LUCKY_MONEY_TIMES, Times),
            lib_role_kv:set_kv(PS#role_state.id, ?KEY_DAILY_GET_LUCKY_MONEY_TIMES, Times),
            ?TASK_EVENT(PS, 'get_lucky_money'),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_lucky_money(PS, ID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_GET_LUCKY_MONEY_TIMES),
    #{max_times := MaxTimes} = conf_guild_lucky_money_info:get(),
    Times < MaxTimes orelse erlang:throw({error, ?RC_GUILD_MONEY_MAX_TIMES}),
    {ok, GetBgold} = ?MAKE_SURE(svr_guild:get_lucky_money(GuildID, RoleID, ID)),
    {ok, Times + 1, GetBgold}.

gm_reduce_funds(PS, ReduceFunds, OpType) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    ?GUILD_CHECK_NOTIFY(PS, begin
        svr_guild:gm_reduce_funds(GuildID, RoleID, ReduceFunds, OpType)
    end),
    ok.

%% 完成少室山副本
finish_sh_dung(PS, DungID, Times) ->
    #role_state{guild_id = GuildID} = PS,
    ID = conf_sh_dung_info:get_id(DungID),
    svr_guild:finish_sh_dung(GuildID, ID, Times).

%% 同步宣战Map
sync_guild_declare(PS) ->
    #role_state{guild_id = GuildID} = PS,
    RivalGuildMap = get_rival_map(GuildID),
    RoleKvList = [{#scene_role.rival_guild_map, RivalGuildMap}],
    PetKvList = [{rival_guild_map, RivalGuildMap}],
    lib_scene_api:update({'sync_role_and_pet', RoleKvList, PetKvList}, PS),
    ok.

%% 同步敌对Sets
sync_guild_hostile(PS) ->
    #role_state{guild_id = GuildID} = PS,
    HostileSets = get_hostile_sets(GuildID),
    RoleKvList = [{#scene_role.hostile_guild_set, HostileSets}],
    PetKvList = [{hostile_guild_set, HostileSets}],
    lib_scene_api:update({'sync_role_and_pet', RoleKvList, PetKvList}, PS),
    ok.

%% -----------------------------------------------------------------------------
%% 帮派烹饪
%% -----------------------------------------------------------------------------

%% @doc 获取烹饪信息
get_cook_info(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    RoleData = get_role_data(RoleID),
    #{cook_type := CookType, cook_reward := CookReward} = RoleData,
    {Total, Num, Logs} = lib_guild:get_cook_info(GuildID),
    Rec = #sc_guild_cook_info{
        type = CookType, total = Total, reward = CookReward, logs = Logs,
        num = Num
    },
    {ok, Bin} = prot_msg:encode_msg(41464, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 烹饪
cook(PS, Type) ->
    case catch check_cook(PS, Type) of
        {ok, RoleID, RoleData, _GuildID, Funds, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_GUILD_COOK),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_GUILD_COOK),
            update_role_data(RoleID, RoleData),
            add_guild_funds(PS, Funds, ?OPT_GUILD_COOK),
            Rec = #sc_guild_cook{type = Type},
            {ok, Bin} = prot_msg:encode_msg(41466, Rec),
            lib_role_send:send_to_role(PS, Bin),
            ?EVENT(RoleID, {'fin_live_task', ?GUILD_LIVENESS_TASK_COOK}),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_cook(PS, Type) ->
    #role_state{id = RoleID, name = Name, guild_id = GuildID} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    RoleData = get_role_data(RoleID),
    #{cook_type := CType} = RoleData,
    CType =:= 0 orelse erlang:throw({error, ?RC_GUILD_ALREADY_COOK_TODAY}),
    ConfCook = conf_guild_cook_type:get(Type),
    ConfCook =/= undefined orelse erlang:throw({error, ?RC_GUILD_INVALID_COOK_TYPE}),
    #{cost := Costs, funds := AddFunds, cont := AddCont, value := AddVal} = ConfCook,
    lib_role_assets:check_items_enough(PS, Costs),
    Rewards = [{?AST_CONT, AddCont}],
    {ok, _NVal} = ?MAKE_SURE(svr_guild:cook(GuildID, RoleID, Name, Type, AddVal)),
    NewData = RoleData#{cook_type => Type},
    {ok, RoleID, NewData, GuildID, AddFunds, Costs, Rewards}.

%% @doc 领取烹饪奖励
get_cook_reward(PS, ID) ->
    case catch check_get_cook_reward(PS, ID) of
        {ok, RoleID, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_GUILD_COOK),
            update_role_data(RoleID, RoleData),
            Rec = #sc_guild_get_cook_reward{id = ID},
            {ok, Bin} = prot_msg:encode_msg(41468, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_cook_reward(PS, ID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    ConfCook = conf_guild_cook_reward:get(ID),
    ConfCook =/= undefined orelse erlang:throw({error, ?RC_GUILD_COOK_REWARD_NOT_FOUND}),
    #{total := Total, reward := Reward} = ConfCook,
    CVal = lib_guild:get_cook_val(GuildID),
    CVal >= Total orelse erlang:throw({error, ?RC_GUILD_COOK_VAL_LIMIT}),
    RoleData = get_role_data(RoleID),
    #{cook_reward := CookHis} = RoleData,
    lists:member(ID, CookHis) andalso erlang:throw({error, ?RC_GUILD_COOK_REWARD_GOT}),
    NewCookHis = [ID | CookHis],
    NewData = RoleData#{cook_reward => NewCookHis},
    {ok, RoleID, NewData, Reward}.

%% -----------------------------------------------------------------------------
%% 帮派活跃
%% -----------------------------------------------------------------------------

%% @doc 获取活跃信息
get_liveness_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{live_tasks := LiveTasks, live_level := LiveLv, live_exp := LiveExp,
        live_daily := LiveDaily, live_reward := LiveReward} = RoleData,
    Rec = #sc_guild_live_info{
        level = LiveLv, exp = LiveExp, daily = LiveDaily, reward = LiveReward,
        tasks = LiveTasks
    },
    {ok, Bin} = prot_msg:encode_msg(41456, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc 完成活跃任务
finish_liveness_task(PS, ID) ->
    case catch check_finish_liveness_task(PS, ID) of
        {ok, RoleID, RoleData, Exp, Daily} ->
            update_role_data(RoleID, RoleData),
            Rec = #sc_guild_live_notify{
                exp = Exp, daily = Daily
            },
            {ok, Bin} = prot_msg:encode_msg(41461, Rec),
            lib_role_send:send_to_role(PS, Bin);
        _ ->
            ignore
    end.

check_finish_liveness_task(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{live_tasks := LiveTasks, live_exp := LiveExp, live_daily := LiveDaily} = RoleData,
    ConfTask = conf_guild_liveness_task:get(ID),
    ConfTask =/= undefined orelse erlang:throw({error, ?RC_GUILD_LIVE_TASK_NOT_FOUND}),
    #{times := MaxTimes, exp := Exp} = ConfTask,
    CTimes = util:prop_get_value(ID, LiveTasks, 0),
    CTimes < MaxTimes orelse erlang:throw({error, ?RC_GUILD_MAX_LIVE_TASK_TIMES}),
    NewLiveExp = LiveExp + Exp,
    NewLiveDaily = LiveDaily + Exp,
    NewLiveTasks = util:prop_increase(ID, LiveTasks, 1),
    NewData = RoleData#{
        live_tasks => NewLiveTasks, live_exp => NewLiveExp,
        live_daily => NewLiveDaily
    },
    {ok, RoleID, NewData, NewLiveExp, NewLiveDaily}.

%% @doc 升级活跃等级
upgrade_liveness(PS) ->
    case catch check_upgrade_liveness(PS) of
        {ok, RoleID, RoleData, Reward, Level, Exp} ->
            lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_GUILD_LIVENESS),
            update_role_data(RoleID, RoleData),
            Rec = #sc_guild_live_upgrade{level = Level, exp = Exp},
            {ok, Bin} = prot_msg:encode_msg(41460, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_upgrade_liveness(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{live_exp := LiveExp, live_level := LiveLv} = RoleData,
    NewLv = LiveLv + 1,
    Conf = conf_guild_liveness:get(LiveLv),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GUILD_LIVE_NOT_CONFIG}),
    ConfNext = conf_guild_liveness:get(NewLv),
    ConfNext =/= undefined orelse erlang:throw({error, ?RC_GUILD_LIVE_MAX_LV}),
    #{liveness := NeedExp, reward := Reward} = Conf,
    LiveExp >= NeedExp orelse erlang:throw({error, ?RC_GUILD_LIVE_EXP_LIMIT}),
    NewExp = LiveExp - NeedExp,
    NewData = RoleData#{live_level => NewLv, live_exp => NewExp},
    {ok, RoleID, NewData, Reward, NewLv, NewExp}.

%% @doc 领取每日活跃奖励
get_liveness_reward(PS, ID) ->
    case catch check_get_liveness_reward(PS, ID) of
        {ok, RoleID, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_GUILD_LIVENESS),
            update_role_data(RoleID, RoleData),
            Rec = #sc_guild_get_live_reward{id = ID},
            {ok, Bin} = prot_msg:encode_msg(41458, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_liveness_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{live_daily := LiveDaily, live_reward := LiveReward} = RoleData,
    Conf = conf_guild_liveness_reward:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GUILD_LIVE_REWARD_NOT_FOUND}),
    #{liveness := NeedVal, reward := Reward} = Conf,
    LiveDaily >= NeedVal orelse erlang:throw({error, ?RC_GUILD_DAILY_LIVE_LIMIT}),
    lists:member(ID, LiveReward) andalso erlang:throw({error, ?RC_GUILD_DAILY_LIVE_REWARD_GOT}),
    NewLiveReward = [ID | LiveReward],
    NewData = RoleData#{live_reward => NewLiveReward},
    {ok, RoleID, NewData, Reward}.

%% -----------------------------------------------------------------------------
%% 帮派炼金
%% -----------------------------------------------------------------------------

init_metall(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    case lib_role_task:has_metall_task(RoleID) of
        true when GuildID > 0 ->
            PS;
        true ->
            del_guild_metall(PS);
        _ ->
            PS
    end.

%% 炼金信息
metall_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{metall_lively := LiveLy} = RoleData,
    Rec = #sc_guild_metall_info{metall_lively = LiveLy},
    {ok, Bin} = prot_msg:encode_msg(41490, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% 接取帮派炼金任务
get_metall_task(PS, Type) ->
    case catch check_get_metall_task(PS, Type) of
        {ok, RoleData, TaskID, LiveLy} ->
            #role_state{id = RoleID, sid = RoleSid} = PS,
            update_role_data(RoleID, RoleData),
            Rec = #sc_guild_metall_task{metall_lively = LiveLy, task_id = TaskID},
            {ok, Bin} = prot_msg:encode_msg(41492, Rec),
            lib_role_send:send_to_sid(RoleSid, Bin),
            NewPS = lib_role_task:add_task(PS, TaskID),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_metall_task(PS, Type) ->
    #role_state{id = RoleID, guild_id = GuildID, tran_stat = TranStat} = PS,
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    TranStat =:= 0 orelse erlang:throw({error, ?RC_TASK_IN_TRAN_STAT}),
    not lib_role_task:has_metall_task(RoleID) orelse erlang:throw({error, ?RC_THIEF_HAVE_TASK}),
    (Type =:= ?TASK_TYPE_BMETALL orelse Type =:= ?TASK_TYPE_SMETALL) orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{cost_lively := EachCost, big_ratio := BigRatio} = conf_guild_metall:get(),
    Cost = ?iif(Type =:= ?TASK_TYPE_BMETALL, EachCost * BigRatio, EachCost),
    RoleData = get_role_data(RoleID),
    #{metall_lively := LiveLy} = RoleData,
    LiveLy >= Cost orelse erlang:throw({error, ?RC_GUILD_METALL_LIVELY_NOT_ENOUGH}),
    NewLiveLy = LiveLy - Cost,
    NewRoleData = RoleData#{metall_lively => NewLiveLy},
    TaskIDs = conf_task:get_by_type(Type),
    TaskID = util:list_rand(TaskIDs),
    {ok, NewRoleData, TaskID, NewLiveLy}.

%% 增加活跃度
add_metall_lively(PS, Add) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{metall_lively := LiveLy} = RoleData,
    #{max_lively := Max} = conf_guild_metall:get(),
    NewLively = min(Max, LiveLy + Add),
    NewRoleData = RoleData#{metall_lively => NewLively},
    update_role_data(RoleID, NewRoleData),
    Rec = #sc_guild_metall_info{metall_lively = NewLively},
    {ok, Bin} = prot_msg:encode_msg(41490, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% 完成帮派炼金任务发奖励
finish_metall_task(PS, TaskID) ->
    #role_state{id = RoleID, level = Lv, career = Career, guild_id = GuildID} = PS,
    #{type := Type} = conf_task:get({TaskID, Career}),
    #{extra_reward := Reward, big_ratio := BigRatio} = conf_guild_metall:get(),
    #{silver := Silver, funds := Funds} = conf_guild_metall_reward:get(Lv),
    case Type =:= ?TASK_TYPE_BMETALL of
        true ->
            Drop = Reward,
            AddNum = lib_guild:guild_study_effect(PS#role_state.guild_id, ?GUILD_STUDY_9, Silver * BigRatio),
            AddItems = [{?AST_SILVER, AddNum}],
            AddFunds = (Funds + guild_metall_add(GuildID)) * BigRatio;
        _ ->
            Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_GUILD_METALL_TIMES),
            {Drop, NewTimes} = ?iif(Times + 1 >= BigRatio, {Reward, 0}, {0, Times + 1}),
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_GUILD_METALL_TIMES, NewTimes),
            AddNum = lib_guild:guild_study_effect(PS#role_state.guild_id, ?GUILD_STUDY_9, Silver),
            AddItems = [{?AST_SILVER, AddNum}],
            AddFunds = Funds + guild_metall_add(GuildID)
    end,
    Drop > 0 andalso lib_drop_api:give_drop_asyn(RoleID, Drop, ?OPT_GUILD_METALL),
    NewPS = lib_role_assets:add_items_notify(PS, AddItems, ?OPT_GUILD_METALL),
    add_guild_funds(PS, AddFunds, ?OPT_GUILD_METALL),
    lib_role_daily_lively:trigger_event(RoleID, 1014, ?iif(Type =:= ?TASK_TYPE_BMETALL, 5, 1)),
    ?TASK_EVENT(PS, guild_metall),
    {ok, NewPS}.

metall_coll(PS) ->
    #role_state{id = RoleID} = PS,
    case lib_role_task:has_metall_task(RoleID) of
        true ->
            [#{id := TaskID, masks := Mask} | _] = lib_role_task:get_metall_task(RoleID),
            [#{current := Cur, total := Total}] = Mask,
            case Cur + 1 >= Total andalso (TaskID =:= 30202 orelse TaskID =:= 30205) of
                true ->
                    lib_role_trans:trans(PS, ?TRAN_STAT_HORSE_METALL);
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

%% 炼金阁对帮派炼金加成
guild_metall_add(GuildID) ->
    Lv = lib_guild:get_build_lv(GuildID, ?GUILD_BUILD_METALL),
    case conf_guild_build:get(?GUILD_BUILD_METALL, Lv) of
        #{effect := Effect} ->
            Effect;
        _ ->
            0
    end.

%% 退出帮派时删除炼金任务
del_guild_metall(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewRoleData = RoleData#{metall_lively => 0},
    update_role_data(RoleID, NewRoleData),
    case lib_role_task:get_metall_task(RoleID) of
        [#{id := TaskID} | _] ->
            lib_role_task:del_task(PS, TaskID);
        _ ->
            PS
    end.

%% -----------------------------------------------------------------------------
%% 帮派领地
%% -----------------------------------------------------------------------------

%% @doc 进入帮派驻地 [特殊协议]
enter_seat(PS) ->
    case catch check_enter_scene(PS) of
        {ok, SceneID, GuildID, X, Y} ->
            {ok, PS1} = lib_scene_api:change_scene(PS, SceneID, GuildID, X, Y),
            Rec = #sc_guild_enter_seat{},
            {ok, Bin} = prot_msg:encode_msg(41472, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter_scene(PS) ->
    #role_state{id = RoleID, guild_id = GuildID, role_scene = RoleScene} = PS,
    GuildID =/= 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    SceneID = lib_guild:get_seat_scene(),
    (not in_guild_scene(RoleScene)) orelse erlang:throw({error, ?RC_GUILD_ALREADY_IN_GUILD_SEAT}),
%%    lib_convoy:in_convoy(PS) andalso erlang:throw({error, ?RC_SCENE_CONVOY_CANNOT_ENTER}),
    lib_scene_api:is_normal_scene(RoleScene) orelse erlang:throw({error, ?RC_GUILD_CAN_ENTER_SEAT_FROM_CUR_SCENE}),
    ok = ?MAKE_SURE(svr_guild:enter_seat(GuildID, RoleID)),
    {X, Y} = lib_guild:get_seat_enter_pos(),
    {ok, SceneID, GuildID, X, Y}.

%% @doc 离开帮派驻地
leave_seat(PS) ->
    case in_guild_scene(PS#role_state.role_scene) of
        true ->
            {ok, PS1} = lib_scene_api:return_scene(PS),
            Rec = #sc_guild_leave_seat{},
            {ok, Bin} = prot_msg:encode_msg(41474, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        _ ->
            ?ERROR_TOC(PS, ?RC_GUILD_NOT_IN_SEAT_SCENE)
    end.

%% -----------------------------------------------------------------------------
%% 修炼技能
%% -----------------------------------------------------------------------------

%% 修炼技能信息
practice_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{practice_skill := PracticeSkill, prac_max_lv := PracMaxLv} = RoleData,
    Rec = #sc_guild_practice_info{prac_max_lv = PracMaxLv, practice_skill = PracticeSkill},
    {ok, Bin} = prot_msg:encode_msg(41484, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 获得帮派修炼技能
get_practice_skill(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{practice_skill := PracticeSkill} = RoleData,
    PracticeSkill.

%% 修炼技能提升
practice_skill_up(PS, ID) ->
    case catch check_practice_skill_up(PS, ID) of
        {ok, RoleData, NewLv, Cost} ->
            NewPS = lib_role_assets:cost_items_notify(PS, Cost, ?OPT_GUILD_PRACTICE),
            update_role_data(PS#role_state.id, RoleData),
            Rec = #sc_guild_practice_up{id = ID, lv = NewLv},
            {ok, Bin} = prot_msg:encode_msg(41486, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            NewPS2 = lib_role_attr:refresh_combat_power(NewPS),
            {ok, NewPS2};
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

check_practice_skill_up(PS, ID) ->
    #role_state{id = RoleID, guild_id = GuildID, level = RoleLv, career = Career} = PS,
    GuildID =/= 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    RoleData = get_role_data(RoleID),
    #{practice_skill := PracticeSkill, prac_max_lv := PracMaxLv} = RoleData,
    %% 获取修炼技能等级
    Lv = util:prop_get_value(ID, PracticeSkill),
    Lv =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    %% 获取当前等级下最大修炼技能等级
    ConfLv = conf_level:get(RoleLv),
    ConfLv =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{max_practice := MaxPLv} = ConfLv,
    Lv < MaxPLv orelse Lv < PracMaxLv orelse erlang:throw({error, ?RC_GUILD_PRACTICE_MAX_LEVEL}),
    Conf = conf_guild_practice:get(ID, Lv),
    Conf =/= undefiend orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{cost_cont := CostContT, cost_exp := CostExp} = Conf,
    CostCont = lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_1, CostContT),
    Cost = [{?AST_CONT, CostCont}, {?AST_EXP, CostExp}],
    lib_role_assets:check_items_enough(PS, Cost),
    NewLv = Lv + 1,
    NewPracticeSkill = lists:keystore(ID, 1, PracticeSkill, {ID, NewLv}),
    Attr = calc_practice_skills_attr(NewPracticeSkill, Career, RoleLv),
    Fight = lib_role_attr:calc_combat_power(Attr),
    NewRoleData = RoleData#{practice_skill => NewPracticeSkill, practice_attr => Attr, fight => Fight},
    {ok, NewRoleData, NewLv, Cost}.

gm_set_max_lv(PS) ->
    #role_state{id = RoleID, level = RoleLv, career = Career} = PS,
    RoleData = get_role_data(RoleID),
    #{max_practice := MaxPLv} = conf_level:get(RoleLv),
    IDs = conf_guild_practice:get_ids(),
    NewPracticeSkill =
        lists:foldl(fun(ID, Acc) ->
            case util:prop_get_value(ID, Acc) of
                undefined -> [{ID, MaxPLv} | Acc];
                _ -> Acc
            end
        end, [], IDs),
    Attr = calc_practice_skills_attr(NewPracticeSkill, Career, RoleLv),
    Fight = lib_role_attr:calc_combat_power(Attr),
    NewRoleData = RoleData#{practice_skill => NewPracticeSkill, practice_attr => Attr, fight => Fight},
    update_role_data(PS#role_state.id, NewRoleData),
    NewPS2 = lib_role_attr:refresh_combat_power(PS),
    {ok, NewPS2}.


%% -----------------------------------------------------------------------------
%% 帮派宴请
%% -----------------------------------------------------------------------------
junket(PS) ->
    case catch check_junket(PS) of
        {ok, Cost, Get} ->
            NewPS1 = lib_role_assets:cost_items_notify(PS, Cost, ?OPT_GUILD_JUNKET),
            NewPS2 = lib_role_assets:add_items_notify(NewPS1, Get, ?OPT_GUILD_JUNKET),
            Rec = #sc_guild_banquet{},
            {ok, Bin} = prot_msg:encode_msg(41488, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            svr_rumor:publish({guild, PS#role_state.guild_id}, 10009, [PS#role_state.name]),
            {ok, NewPS2};
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

check_junket(PS) ->
    #role_state{guild_id = GuildID} = PS,
    GuildID =/= 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    not lib_guild:get_is_low_defend_state(GuildID) orelse erlang:throw({error, ?RC_GUILD_LOW_DEFEND_STATE}),
    #{
        cost_gold := CostGold, get_cont := GetContT, num := Num,
        coll_id := CollID, location := LList, scene_id := SceneID
    } = conf_guild_junket:get(),
    CostItems = [{?AST_GOLD, CostGold}],
    GetCont = lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_5, GetContT),
    GetItems = [{?AST_CONT, GetCont}],
    lib_role_assets:check_items_enough(PS, CostItems),
    Borns = util:list_rand_n(LList, Num),
    [begin
        lib_scene_api:create_coll_async(CollID, SceneID, GuildID, X, Y, [])
    end || {X, Y} <- Borns],
    {ok, CostItems, GetItems}.

%% -----------------------------------------------------------------------------
%% 帮派收购(兑换)
%% -----------------------------------------------------------------------------

%% @doc 获取兑换物品
get_exchange_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{ex_goods := ExList, ex_refresh := RefreshTime, ex_manual := ManualTimes} = RoleData,
    Rec = #sc_guild_ex_info{
        items = ExList, refresh = RefreshTime, manual = ManualTimes
    },
    {ok, Bin} = prot_msg:encode_msg(41476, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 兑换物品
exchange_item(PS, ID) ->
    case catch check_exchange_item(PS, ID) of
        {ok, RoleID, RoleData, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_GUILD_EXCHANGE),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_GUILD_EXCHANGE),
            update_role_data(RoleID, RoleData),
            Rec = #sc_guild_exchange{id = ID},
            {ok, Bin} = prot_msg:encode_msg(41478, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_exchange_item(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{ex_goods := ExList} = RoleData,
    Num = util:prop_get_value(ID, ExList),
    Num =/= undefined orelse erlang:throw({error, ?RC_GUILD_NO_SUCH_EXCHANGE}),
    Num =:= 0 orelse erlang:throw({error, ?RC_GUILD_ALREADY_EXCHANGE}),
    Conf = conf_guild_exchange:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GUILD_EXCHANGE_INVALID}),
    #{cost := Material, item := ItemID} = Conf,
    Costs = [{?AST_ITEM, Material}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewList = util:prop_store(ID, 1, ExList),
    NewData = RoleData#{ex_goods => NewList},
    Rewards = [{?AST_ITEM, [{ItemID, 1}]}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    {ok, RoleID, NewData, Costs, Rewards}.

%% @doc 手动刷新兑换物品
manual_refresh_ex(PS) ->
    case catch check_manual_refresh_ex(PS) of
        {ok, RoleID, RoleData, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_GUILD_REFRESH_EX),
            update_role_data(RoleID, RoleData),
            Rec = #sc_guild_ex_refresh{},
            {ok, Bin} = prot_msg:encode_msg(41480, Rec),
            lib_role_send:send_to_role(PS, Bin),
            get_exchange_info(PS1),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_manual_refresh_ex(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{ex_manual := CurTimes} = RoleData,
    MaxTimes = config:get_sys_config(guild_ex_refresh_times),
    CurTimes < MaxTimes orelse erlang:throw({error, ?RC_GUILD_MAX_EX_REFRESH_TIMES}),
    NewTimes = CurTimes + 1,
    Gold = config:get_sys_config(guild_ex_refresh_gold),
    Costs = [{?AST_GOLD, Gold}],
    lib_role_assets:check_items_enough(PS, Costs),
    ExList = refresh_ex_goods(),
    NewData = RoleData#{ex_goods => ExList, ex_manual => NewTimes},
    {ok, RoleID, NewData, Costs}.

%% @doc 定时刷新兑换物品
refresh_exchange(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{ex_timer := ExTimer} = RoleData,
    util:cancel_timer(ExTimer),
    Now = time:unixtime(),
    ExList = refresh_ex_goods(),
    NewTimer = lib_role:mod_after(?GUILD_EX_REF_SPAN * 1000, ?MODULE, refresh_exchange),
    NewData = RoleData#{ex_refresh => Now, ex_goods => ExList, ex_timer => NewTimer},
    update_role_data(RoleID, NewData),
    get_exchange_info(PS).

refresh_ex_goods() ->
    List = conf_guild_exchange:get_weight(),
    select_ex_goods(?GUILD_EXCHANGE_NUM, List, []).

select_ex_goods(0, _Weight, Acc) ->
    Acc;
select_ex_goods(N, Weight, Acc) ->
    {ID, _} = util:rand_by_weight(Weight, 2),
    select_ex_goods(N - 1, util:prop_delete(ID, Weight), [{ID, 0} | Acc]).

%% @doc 初始化兑换
init_ex_timer(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{ex_refresh := RefreshTime} = RoleData,
    Now = time:unixtime(),
    LastTime = last_ex_time(),
    Span = erlang:max(next_ex_time() - Now, 0) * 1000,
    case (not time:is_same_day(Now, RefreshTime)) orelse RefreshTime < LastTime of
        true ->
            NewTimer = lib_role:mod_after(Span, ?MODULE, refresh_exchange),
            NewData = RoleData#{ex_goods => refresh_ex_goods(), ex_timer => NewTimer, ex_refresh => LastTime},
            update_role_data(RoleID, NewData);
        _ ->
            NewTimer = lib_role:mod_after(Span, ?MODULE, refresh_exchange),
            NewData = RoleData#{ex_timer => NewTimer},
            set_role_data(RoleID, NewData)
    end.

last_ex_time() ->
    Secs = time:get_secs_from_midnight(),
    time:unixdate() + erlang:floor(Secs / ?GUILD_EX_REF_SPAN) * ?GUILD_EX_REF_SPAN.

next_ex_time() ->
    Secs = time:get_secs_from_midnight(),
    time:unixdate() + erlang:ceil(Secs / ?GUILD_EX_REF_SPAN) * ?GUILD_EX_REF_SPAN.

%% -----------------------------------------------------------------------------
%% 属性
%% -----------------------------------------------------------------------------

%% @doc 获取帮派属性
get_attr(#role_state{guild_id = 0}) ->
    [];
get_attr(_PS) ->
    case erlang:get({?MODULE, cache_attr}) of
        L when is_list(L) ->
            L;
        _ ->
            []
    end.

%% @doc 获取技能列表
get_skills(#role_state{guild_id = 0}) ->
    [];
get_skills(#role_state{id = RoleID}) ->
    RoleData = get_role_data(RoleID),
    #{skills := Skills} = RoleData,
    lib_skill_util:make_skills(Skills).

%% 获得修炼技能属性(无论是否有帮派)
get_practice_skills_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{practice_attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

%% @doc 升级刷新属性 & 通知
refresh_attr_fight(PS) ->
    #role_state{id = RoleID, career = Career, level = Level} = PS,
    RoleData = get_role_data(RoleID),
    #{practice_skill := PracticeSkills} = RoleData,
    Attr = calc_practice_skills_attr(PracticeSkills, Career, Level),
    Fight = lib_role_attr:calc_combat_power(Attr),
    NewRoleData = RoleData#{practice_attr => Attr, fight := Fight},
    set_role_data(RoleID, NewRoleData),
    lib_role_attr:refresh_combat_power(PS).

%%%% 计算修炼技能属性
%%calc_practice_skills_attr(PS) ->
%%    #role_state{id = RoleID, career = Career, level = Level} = PS,
%%    RoleData = get_role_data(RoleID),
%%    #{practice_skill := PracticeSkills} = RoleData,
%%    calc_practice_skills_attr(PracticeSkills, Career, Level).
calc_practice_skills_attr(PracticeSkills, Career, Level) ->
    {BaseAttr, BtAttr} = conf_career_attr:get_attr(Career, Level),
    AttrList =
        lists:foldl(fun({ID, Lv}, Acc) ->
            case conf_guild_practice:get(ID, Lv) of
                #{attr := Attr} ->
                    List = calc_add_attr(Attr, BaseAttr, BtAttr, []),
                    add_attr(Acc, List)
            end
        end, [], PracticeSkills),
    attr_floor(AttrList, []).

calc_add_attr([], _, _, List) -> List;
calc_add_attr([{Type, AddPerc} | T], BaseAttr, BtAttr, List) ->
    Value = ?iif(Type > 100, element(Type - 100 + 1, BaseAttr), element(Type + 1, BtAttr)),
    AddValue = Value * AddPerc / 10000,
    NewList = ?iif(AddValue > 0, [{Type, AddValue} | List], List),
    calc_add_attr(T, BaseAttr, BtAttr, NewList).

%% @doc 增加属性
add_attr(Attr, AddAttr) ->
    NewAttr = AddAttr ++ Attr,
    lib_role_attr:merge_attr(NewAttr).

attr_floor([], List) ->
    List;
attr_floor([Attr | T], List) ->
    NewAttr = setelement(2, Attr, erlang:floor(element(2, Attr))),
    attr_floor(T, [NewAttr | List]).

%% =============================================================================
%% 其它
%% =============================================================================

%% @doc 检查是否强行将玩家传送
force_leave_guild_scene(PS) ->
    case in_guild_scene(PS) of
        true ->
            case lib_scene_api:return_scene(PS) of
                {ok, NewPS} -> NewPS;
                _ -> PS
            end;
        _ ->
            PS
    end.

%% @doc 是否在帮派相关场景
in_guild_scene(#role_state{role_scene = RoleScene}) ->
    in_guild_scene(RoleScene);
in_guild_scene(#role_scene{scene_id = SceneID}) ->
    lib_guild:is_seat_scene(SceneID).

%% @doc 完整技能列表
get_complete_skill(Skills) ->
    IDs = lib_skill_util:get_guild_skill(),
    lists:foldl(fun(SkillID, Acc) ->
        case util:prop_get_value(SkillID, Acc) of
            undefined -> [{SkillID, conf_skill:get_min_lv(SkillID)} | Acc];
            _ -> Acc
        end
    end, Skills, IDs).

%% @doc 完整修炼技能列表
get_complete_practice_skill(Skills) ->
    IDs = conf_guild_practice:get_ids(),
    lists:foldl(fun(ID, Acc) ->
        case util:prop_get_value(ID, Acc) of
            undefined -> [{ID, 0} | Acc];
            _ -> Acc
        end
    end, Skills, IDs).

%% @doc 提升修炼等级上限
level_up_prac_max_lv(PS) ->
    case catch check_level_up_prac_max_lv(PS) of
        {ok, NewLv} ->
            RoleData = get_role_data(PS#role_state.id),
            update_role_data(PS#role_state.id, RoleData#{prac_max_lv => NewLv}),
            Rec = #sc_level_up_practice_max_lv{prac_max_lv = NewLv},
            {ok, Bin} = prot_msg:encode_msg(20506, Rec),
            lib_role_send:send_to_role(PS, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_level_up_prac_max_lv(PS) ->
    #role_state{level = Lv} = PS,
    #{break_max_practice := MaxPracLv} = conf_level:get(Lv),
    MaxPracLv =/= 0 orelse erlang:throw({error, ?RC_GUILD_CANT_BREAK_PRAC_MAX_LV}),
    {ok, MaxPracLv}.

%% @doc 获取帮派间关系
%% @spec get_relation_type(GuildID, TargetGuildID) -> Type
%% GuildID = TargetGuildID = Type       :: integer()
%% GuildID          :: 攻击方帮派ID
%% TargetGuildID    :: 死亡方帮派ID
%% Type             :: 0没有关联|1死亡方为被宣战方|2死亡方为宣战方
get_relation_type(GuildID, DieGuildID) when is_integer(GuildID), GuildID > 0, DieGuildID > 0, GuildID =/= DieGuildID ->
    Guild = lib_guild:get_guild_info(GuildID),
    get_relation_type(Guild, DieGuildID);
get_relation_type(Guild, DietGuildID) when is_record(Guild, guild) ->
    #guild{declare = Declare, back = Back} = Guild,
    DExpire = util:prop_get_value(DietGuildID, Declare, 0),
    BExpire = util:prop_get_value(DietGuildID, Back, 0),
    Now = time:unixtime(),
    if
        DExpire > Now -> 1;
        BExpire > Now -> 2;
        true -> 0
    end;
get_relation_type(_, _) ->
    0.

%% @doc 是否为宣战或应战帮派
%% @spec is_enemy_guild(GuildID, TargetGuildID) -> boolean()
%% GuildID          ::  攻击方帮派ID
%% TargetGuildID    ::  防守方帮派ID
is_enemy_guild(GuildID, DietGuildID) ->
    get_relation_type(GuildID, DietGuildID) > 0.

%% 获取宣战&被宣战帮派Map
get_rival_map(GuildID) when GuildID > 0 ->
    Guild = lib_guild:get_guild_info(GuildID),
    #guild{declare = DeclareT, back = BackT} = Guild,
    Declare = lib_guild:fix_declare_or_back(DeclareT),
    Back = lib_guild:fix_declare_or_back(BackT),
    maps:from_list(Declare ++ Back);
get_rival_map(_) ->
    #{}.

%% @doc 是否为敌对帮派
%% @spec is_hostile_guild(GuildID, DieGuildID) -> boolean() 返回 防守方是否为攻击方设置的敌对
%% GuildID          ::  攻击方帮派ID
%% DieGuildID       ::  防守方帮派ID
%% 击杀方帮派设置了被击杀方帮派为敌对帮派且被击杀方正在运镖才有劫镖奖励
is_hostile_guild(GuildID, DieGuildID) when GuildID > 0 ->
    Guild = lib_guild:get_guild_info(GuildID),
    #guild{hostile = Hostile} = Guild,
    sets:is_element(DieGuildID, Hostile);
is_hostile_guild(_, _) ->
    false.

%% 获得敌对帮派Sets
get_hostile_sets(GuildID) when GuildID > 0 ->
    Guild = lib_guild:get_guild_info(GuildID),
    #guild{hostile = Hostile} = Guild,
    Hostile;
get_hostile_sets(_) ->
    sets:new().
%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 初始化玩家数据
init(PS) ->
    #role_state{id = RoleID, career = Career, level = Level} = PS,
    {GuildID, GuildName, GuildPos} = guild_info_login(RoleID),
    PS1 = PS#role_state{guild_id = GuildID, guild_name = GuildName, guild_pos = GuildPos},
    SQL = io_lib:format(?SQL_GET_GUILD_PRIVATE_DATA, [RoleID]),
    RoleData = case ?DB:get_row(SQL) of
        [CookType, DbCookReward, LiveLv, LiveExp, LiveDaily, DbLiveTask,
            DbLiveReward, DbSkills, DbExGoods, ExRefresh, ExManual, DbPracticeSkills,
            Time, PracMaxLv, MetallLively] ->
            CookReward = type:convert_db_field(list, DbCookReward, []),
            LiveTask = type:convert_db_field(list, DbLiveTask, []),
            LiveReward = type:convert_db_field(list, DbLiveReward, []),
            Skills = type:convert_db_field(list, DbSkills, []),
            ExGoods = type:convert_db_field(list, DbExGoods, []),
            PracticeSkillsT = type:convert_db_field(list, DbPracticeSkills, []),
            CompleteSkills = get_complete_skill(Skills),
            PracticeSkills = get_complete_practice_skill(PracticeSkillsT),
            PracticeAttr = calc_practice_skills_attr(PracticeSkills, Career, Level),
            Fight = lib_role_attr:calc_combat_power(PracticeAttr),
            ?role_guild#{
                role_id => RoleID, cook_type => CookType, cook_reward => CookReward,
                live_level => LiveLv, live_exp => LiveExp, live_daily => LiveDaily,
                live_tasks => LiveTask, live_reward => LiveReward, skills => CompleteSkills,
                ex_goods => ExGoods, ex_refresh => ExRefresh, ex_manual => ExManual, time => Time,
                practice_skill => PracticeSkills, practice_attr => PracticeAttr, fight => Fight,
                prac_max_lv => PracMaxLv, metall_lively => MetallLively
            };
        _ -> %% 初始化玩家数据
            Now = time:unixtime(),
            ?DB:execute(io_lib:format(?SQL_INIT_GUILD_PRIVATE_DATA, [RoleID, Now])),
            CompleteSkills = get_complete_skill([]),
            ParcticeSkills = get_complete_practice_skill([]),
            ?role_guild#{
                role_id => RoleID, time => Now, skills => CompleteSkills,
                practice_skill => ParcticeSkills
            }
    end,
    set_role_data(RoleID, RoleData),
    lib_role:mod_after(0, ?MODULE, init_ex_timer),
    GuildID > 0 andalso svr_guild:online(GuildID, RoleID),
    {ok, PS1}.


%% @doc 登陆时获取的帮派信息
guild_info_login(RoleID) ->
    SQL = io_lib:format(?SQL_GET_GUILD_AND_POS, [RoleID]),
    case ?DB:get_row(SQL) of
        [GuildID, GuildName, Pos] when GuildID > 0 ->
            {GuildID, GuildName, Pos};
        _ ->
            {0, "", 0}
    end.

%% @doc 保存玩家数据
save(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    GuildID > 0 andalso svr_guild:offline(GuildID, RoleID),
    save_(PS).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    case Updated of
        true -> save_role_data(RoleID, RoleData);
        _ -> ignore
    end.

%% @doc 保存玩家数据
save_role_data(RoleID, RoleData) ->
    #{role_id := _RoleID, cook_type := CookType, cook_reward := CookReward,
        live_level := LiveLv, live_exp := LiveExp, live_daily := LiveDaily,
        live_tasks := LiveTask, live_reward := LiveReward, skills := Skills,
        ex_goods := ExGoods, ex_refresh := ExRefresh, ex_manual := ExManual,
        time := Time, practice_skill := PracticeSkill, prac_max_lv := PracMaxLv,
        metall_lively := MetallLively} = RoleData,
    DbCookReward = type:term_to_bitstring(CookReward),
    DbLiveTask = type:term_to_bitstring(LiveTask),
    DbLiveReward = type:term_to_bitstring(LiveReward),
    DbSkills = type:term_to_bitstring(Skills),
    DbExGoods = type:term_to_bitstring(ExGoods),
    DbPracticeSkill = type:term_to_bitstring(PracticeSkill),
    SQL = io_lib:format(?SQL_SAVE_GUILD_PRIVATE_DATA, [
        CookType, DbCookReward, LiveLv, LiveExp, LiveDaily, DbLiveTask, DbLiveReward,
        DbSkills, DbExGoods, ExRefresh, ExManual, DbPracticeSkill, Time, PracMaxLv, MetallLively, RoleID
    ]),
    ?DB:execute(SQL),
    NewData = RoleData#{updated => false},
    set_role_data(RoleID, NewData).

%% @doc 更新玩家数据
update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

%% @doc 设置玩家数据
set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).

%% @doc 获取玩家数据
get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            check_reset_data(RoleID, RoleData);
        _ ->
            ?role_guild#{role_id => RoleID, time => time:unixtime()}
    end.

%% @doc 重置玩家数据
reset_role_data(PS) when is_record(PS, role_state) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    check_reset_data(RoleID, RoleData).

check_reset_data(RoleID, RoleData) ->
    #{time := Time} = RoleData,
    Now = time:unixtime(),
    case time:is_same_day(Now, Time) of
        true ->
            RoleData;
        _ ->
            NewData = RoleData#{
                time => Now, daily_cont => 0, cook_type => 0, cook_reward => [],
                live_tasks => [], live_daily => 0, live_reward => [],
                ex_manual => 0
            },
            update_role_data(RoleID, NewData),
            NewData
    end.
