%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     帮派
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_guild_mgr).
-author("Ryuu").

-include("guild.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    mfa/2,
    mfa/3,
    stop/0,
    cast/1,
    call/1,
    permanent/0,
    force_save/0,
    info_guild/1,
    start_link/0,
    timer_hour/0,
    change_name/2,
    data_update/2,
    create_guild/1,
    delete_guild/2,
    refresh_rank/0,
    approve_apply/2,
    get_guild_list/1,
    start_activity/1,
    cross_day_reset/0,
    desolation_check/0,
    get_guild_detail/2,
    prepare_activity/1,
    auto_impeach_check/0,
    guild_weekly_reset/0
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    code_change/3,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    do_handle_call/3,
    do_handle_cast/2
]).

-export([
    gm_denf_cost/0
]).

-define(SCOPE, local).
-define(SERVER, ?MODULE).
-record(state, {}).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

%% @doc 获取帮派进程信息
i() ->
    call(info).

%% @doc 管理进程Pid
p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

%% @doc MFA
mfa(M, F) ->
    mfa(M, F, []).

mfa(M, F, A) when is_list(A) ->
    call({mfa, M, F, A}).

%% @doc 停止
stop() ->
    call(stop).

%% @doc 持久化
permanent() ->
    call(permanent).

%% @doc 跨天重置
cross_day_reset() ->
    cast(cross_day_reset).

%% @doc 创建帮派
create_guild(CreateInfo) ->
    call({create_guild, CreateInfo}).

%% @doc 删除帮派
delete_guild(GuildID, Num) ->
    cast({delete_guild, GuildID, Num}).

%% @doc 获取帮派列表
get_guild_list(RoleID) ->
    cast({get_guild_list, RoleID}).

%% @doc 查看帮派
get_guild_detail(RoleID, GuildID) ->
    cast({get_guild_detail, RoleID, GuildID}).

%% @doc 同意申请 [管理进程]
approve_apply(GuildID, TargetID) ->
    call({approve_apply, GuildID, TargetID}).

%% @doc 帮派改名
change_name(GuildID, Name) ->
    call({change_name, GuildID, Name}).

%% @doc 数据更新
data_update(Type, Key) ->
    cast({data_update, Type, Key}).

%% @doc 刷新帮派排名
refresh_rank() ->
    cast(refresh_rank).

%% @doc 定时
timer_hour() ->
    cast(timer_hour).

%% @doc 强制保存
force_save() ->
    cast(force_save).

%% @doc 活动准备
prepare_activity(Activity) ->
    cast({prepare_activity, Activity}).

%% @doc 活动开启 [帮派相关活动，需要根据活动ID特殊处理]
start_activity(Activity) ->
    cast({start_activity, Activity}).

%% @doc 帮派自动解散检查
desolation_check() ->
    cast(desolation_check).

%% @doc 帮派弹劾检查
auto_impeach_check() ->
    cast(auto_impeach_check).

%% @doc 每周一0点重置
guild_weekly_reset() ->
    cast(guild_weekly_reset).

gm_denf_cost() ->
    cast(interval_denf).

%% @doc 广播消息给帮派进程
info_guild(Info) ->
    cast(Info).

%% @doc call
call(Info) ->
    ?call(Info).

%% @doc cast
cast(Info) ->
    ?cast(Info).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    erlang:send_after(1000, self(), init_for_start),
    start_interval_save_timer(),
    start_interval_denf_timer(),
    {ok, #state{}}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call({create_guild, CreateInfo}, _From, State) ->
    Reply = do_create_guild(CreateInfo),
    {reply, Reply, State};
do_handle_call({approve_apply, GuildID, TargetID}, _From, State) ->
    Reply = lib_guild:approve_apply(GuildID, TargetID),
    {reply, Reply, State};
do_handle_call({change_name, GuildID, Name}, _From, State) ->
    Reply = lib_guild:change_name(GuildID, Name),
    {reply, Reply, State};
do_handle_call(info, _From, State) ->
    Reply = do_info(),
    {reply, Reply, State};
do_handle_call(permanent, _From, State) ->
    Reply = do_permanent(),
    {reply, Reply, State};
do_handle_call({mfa, M, F, A}, _From, State) ->
    Reply = erlang:apply(M, F, A),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(init_for_start, State) ->
    lib_guild:gen_num_list(),
    lib_guild:init_for_start(),
    lib_guild:refresh_rank(),
    {noreply, State};
do_handle_cast(interval_save, State) ->
    interval_save(),
    {noreply, State};
do_handle_cast(force_save, State) ->
    do_force_save(),
    {noreply, State};
do_handle_cast(cross_day_reset, State) ->
    do_cross_day_reset(),
    {noreply, State};
do_handle_cast({data_update, Type, Key}, State) ->
    do_data_update(Type, Key),
    {noreply, State};
do_handle_cast({delete_guild, GuildID, Num}, State) ->
    do_delete_guild(GuildID, Num),
    {noreply, State};
do_handle_cast(guild_weekly_reset, State) ->
    do_weekly_reset(),
    {noreply, State};
do_handle_cast(refresh_rank, State) ->
    lib_guild:refresh_rank(),
    {noreply, State};
do_handle_cast(timer_hour, State) ->
    lib_guild:timer_hour(),
    {noreply, State};
do_handle_cast(desolation_check, State) ->
    lib_guild:desolation_guild_check(),
    {noreply, State};
do_handle_cast(auto_impeach_check, State) ->
    lib_guild:auto_impeach_check(),
    {noreply, State};
do_handle_cast({get_guild_list, RoleID}, State) ->
    lib_guild:send_guild_list(RoleID),
    {noreply, State};
do_handle_cast({get_guild_detail, RoleID, GuildID}, State) ->
    lib_guild:send_guild_detail(RoleID, GuildID),
    {noreply, State};
do_handle_cast(interval_denf, State) ->
    interval_denf(),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.

%% @doc 服务信息
do_info() ->
    [
        {guild_num, ets:info(?ETS_GUILD, size)},
        {role_num, ets:info(?ETS_GUILD_ROLE, size)},
        {update, ets:info(?ETS_GUILD_UPDATE, size)}
    ].

%% @doc 创建帮派
do_create_guild(CreateInfo) ->
    case catch check_create_guild(CreateInfo) of
        {ok, GuildID, GuildName, NewGuildInfo, RoleID, NewRoleInfo} ->
            lib_guild:update_guild_info(NewGuildInfo),
            lib_guild:update_role_data(RoleID, NewRoleInfo),
            lib_guild:set_role_guild_pos(RoleID, GuildID, GuildName, ?GUILD_POS_CHIEF),
            lib_guild:start_guild_process(GuildID),
            lib_guild:refresh_rank(),
            {ok, GuildID};
        {error, Code} ->
            {error, Code}
    end.

check_create_guild(CreateInfo) ->
    {GuildName, CreateType, GuildLv, Funds, RoleID, RoleName, Announce} = CreateInfo,
    RoleInfo = lib_guild:get_role_data(RoleID),
    #guild_role{guild_id = CurGuild} = RoleInfo,
    CurGuild =:= 0 orelse erlang:throw({error, ?RC_GUILD_ALREADY_HAVE_GUILD}),
    lib_guild:is_forbidden_join() andalso erlang:throw({error, ?RC_GUILD_FORBIDDEN_JOIN}),
    Now = time:unixtime(),
    %% 检查公告
    NewAnnounce = util:escape_varchar(Announce),
    util:check_filter(NewAnnounce) andalso erlang:throw({error, ?RC_CHAT_SENSITIVE_CONTENT}),
    {MinLen, MaxLen} = config:get_sys_config(guild_announce_length),
    util:check_length(NewAnnounce, MinLen, MaxLen) orelse erlang:throw({error, ?RC_GUILD_ANNOUNCE_LENGTH_LIMIT}),
    {RetCode, GuildID} = create_guild_get_id(GuildName, CreateType, GuildLv, Funds, RoleID, RoleName, Now, NewAnnounce),
    RetCode =:= ?RC_SUCCEED orelse erlang:throw({error, RetCode}),
    Num = lib_guild:gen_guild_num(0, GuildID),
    NewRoleInfo = RoleInfo#guild_role{
        role_id = RoleID, guild_id = GuildID
    },
    Member = #guild_member{role_id = RoleID, pos = ?GUILD_POS_CHIEF},
    Task = lib_guild:fix_guild_task([]),
    Build = lib_guild:init_build(),
    Study = lib_guild:init_study(),
    ShDung = lib_guild:fix_sh_dung([]),
    NewGuildInfo = #guild{
        id = GuildID, name = GuildName, creator_id = RoleID, creator_name = RoleName,
        chief_id = RoleID, chief_name = RoleName, members = [Member], level = GuildLv,
        time = Now, create_type = CreateType, funds = Funds, task = Task,
        build = Build, study = Study, num = Num, announce = NewAnnounce,
        sh_dung = ShDung
    },
    {ok, GuildID, GuildName, NewGuildInfo, RoleID, NewRoleInfo}.

%% @doc 创建帮派并返回帮派ID
create_guild_get_id(GuildName, CType, GuildLv, Funds, RoleID, RoleName, Time, NewAnnounce) ->
    case db:transaction(fun() ->
        DuplicateSQL = io_lib:format(?SQL_GET_GUILD_BY_NAME, [GuildName]),
        ?DB:get_one(DuplicateSQL) =:= undefined orelse erlang:throw({error, ?RC_GUILD_HAVE_SAME_NAME_GUILD}),
        ID = svr_generator:gen_guild_id(),
        SQLCreate = io_lib:format(?SQL_CREATE_GUILD, [ID, GuildName, GuildLv, Funds, RoleID, RoleName, Time, CType, RoleID, RoleName, NewAnnounce]),
        ?DB:execute(SQLCreate),
        SQLChief = io_lib:format(?SQL_UPDATE_MEMBER_POS, [ID, ?GUILD_POS_CHIEF, RoleID]),
        ?DB:execute(SQLChief),
        {ok, ID}
    end) of
        {ok, GuildID} ->
            {?RC_SUCCEED, GuildID};
        {aborted, {error, Code}} ->
            {Code, 0};
        {aborted, Error} ->
            ?ERROR("create guild failed, roleid ~w, guild_name ~s, RoleName ~s, error ~w",
                [RoleID, GuildName, RoleName, Error]),
            {?RC_SYS_ERROR, 0}
    end.

%% @doc 删除帮派
do_delete_guild(GuildID, Num) ->
%%    %% 删除帮派
%%    DelGuild = io_lib:format(?SQL_DEL_GUILD, [GuildID]),
%%    ?DB:execute(DelGuild),
%%    %% 删除申请
%%    DelGuildApply = io_lib:format(?SQL_DEL_GUILD_APPLY, [GuildID]),
%%    ?DB:execute(DelGuildApply),
    %% 删除ETS记录
    ets:delete(?ETS_GUILD, GuildID),
    ets:delete(?ETS_GUILD_UPDATE, {?GUILD_UP_TYPE_GUILD, GuildID}),
    %% 结束帮派、帮派Boss进程
    svr_guild:stop(GuildID),
    NumList = erlang:get(guild_num_list),
    NumListN = lists:delete(Num, NumList),
    erlang:put(guild_num_list, NumListN),
    ok.

%% @doc 记录数据变化
do_data_update(?GUILD_UP_TYPE_ROLE, RoleID) ->
    util:put_ets(?ETS_GUILD_ROLE_UPDATE, RoleID, 1);
do_data_update(_, GuildID) ->
    util:put_ets(?ETS_GUILD_UPDATE, GuildID, 1).

%% @doc 强制保存
do_force_save() ->
    save(false).

%% @doc 定时保存
interval_save() ->
    save(false),
    start_interval_save_timer().

%% @doc 定时扣除维护资金
interval_denf() ->
    GuildList = lib_guild:get_guild_list(),
    [svr_guild:cost_denf_funds(GuildID) || GuildID <- GuildList],
    start_interval_denf_timer().

%% @doc 定时保存定时器
start_interval_save_timer() ->
    erlang:send_after(?GUILD_INTERVAL_SAVE_SPAN, self(), interval_save).

%% @doc 定时扣除维护资金定时器
start_interval_denf_timer() ->
    erlang:send_after(?GUILD_INTERVAL_DENF_SPAN, self(), interval_denf).

%% @doc 持久化
do_permanent() ->
    save(true).

%% @doc 保存数据
save(_Down) ->
    ?TRY_CATCH(lib_guild:save_update_roles()),
    ?TRY_CATCH(lib_guild:save_update_guilds()),
    ok.

%% @doc 跨天重置
do_cross_day_reset() ->
    GuildList = lib_guild:get_guild_list(),
    [svr_guild:cross_day_reset(GuildID) || GuildID <- GuildList],
    ok.

%% @doc 跨周重置
do_weekly_reset() ->
    do_guild_bonus(),
    do_guild_task(),
    do_sh_dung_reset(),
    do_rob_times_reset(),
    ok.

%% @doc 帮派分红
do_guild_bonus() ->
    GuildList = lib_guild:get_guild_list(),
    [svr_guild:guild_bonus(GuildID) || GuildID <- GuildList],
    ok.

%% @doc 帮派任务
do_guild_task() ->
    GuildList = lib_guild:get_guild_list(),
    [svr_guild:guild_task(GuildID) || GuildID <- GuildList],
    ok.

%% @doc 少室山副本
do_sh_dung_reset() ->
    GuildList = lib_guild:get_guild_list(),
    [svr_guild:sh_dung_reset(GuildID) || GuildID <- GuildList],
    ok.

%% @doc 劫镖次数
do_rob_times_reset() ->
    GuildList = lib_guild:get_guild_list(),
    [svr_guild:rob_times_reset(GuildID) || GuildID <- GuildList],
    ok.