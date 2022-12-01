%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     组队
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_team_mgr).
-author("Ryuu").

-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    call/1,
    cast/1,
    demise/2,
    invite/2,
    online/1,
    offline/1,
    recruit/1,
    kick_out/2,
    apply_for/2,
    broadcast/2,
    broadcast/3,
    fast_join/1,
    info_team/2,
    set_level/3,
    leave_team/1,
    leave_team/2,
    set_assist/2,
    kick_robot/2,
    add_robot/1,
    set_option/3,
    start_link/0,
    sync_state/2,
    set_follow/2,
    attr_change/2,
    create_team/2,
    match_teams/2,
    accept_apply/3,
    team_command/2,
    accept_invite/4,
    get_role_team/1,
    get_team_info/1,
    accept_promote/3,
    get_apply_list/1,
    one_key_invite/2,
    set_team_match/2,
    get_nearby_team/2,
    promote_request/1,
    set_team_target/4,
    broadcast_except/3,
    get_target_teams/2
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

-define(SERVER, ?MODULE).
-define(SCOPE, local).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

%% @doc 组队进程信息
i() ->
    call(info).

%% @doc 组队进程Pid
p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

%% @doc 上线
online(RoleInfo) ->
    cast({online, RoleInfo}).

%% @doc 上线
offline(RoleInfo) ->
    cast({offline, RoleInfo}).

%% @doc 获取队伍信息
get_team_info(TeamID) ->
    call({get_team_info, TeamID}).

%% @doc 下发队伍信息
get_role_team(RoleInfo) ->
    cast({get_role_team, RoleInfo}).

%% @doc 创建队伍
create_team(RoleInfo, Target) ->
    call({create_team, RoleInfo, Target}).

%% @doc 离开队伍
leave_team(RoleID) ->
    leave_team(RoleID, false).

leave_team(RoleID, Offline) ->
    cast({leave_team, RoleID, Offline}).

%% @doc 申请加入队伍
apply_for(RoleInfo, TeamID) ->
    cast({apply_for, RoleInfo, TeamID}).

%% @doc get apply list
get_apply_list(RoleID) ->
    cast({get_apply_list, RoleID}).

%% @doc 同意申请
accept_apply(RoleID, TargetID, Opt) ->
    cast({accept_apply, RoleID, TargetID, Opt}).

%% @doc 踢出队伍
kick_out(RoleID, TargetID) ->
    cast({kick_out, RoleID, TargetID}).

%% @doc 邀请加入
invite(RoleID, TargetID) ->
    cast({invite, RoleID, TargetID}).

%% @doc one_key_invite
one_key_invite(RoleID, TargetList) ->
    cast({one_key_invite, RoleID, TargetList}).

%% @doc 同意申请
accept_invite(RoleID, TeamID, TargetID, Opt) ->
    cast({accept_invite, RoleID, TeamID, TargetID, Opt}).

%% @doc 转移队长
demise(RoleID, TargetID) ->
    cast({demise, RoleID, TargetID}).

%% @doc
promote_request(RoleID) ->
    cast({promote_request, RoleID}).

%% @doc
accept_promote(RoleID, TargetID, Opt) ->
    cast({accept_promote, RoleID, TargetID, Opt}).

%% @doc 快速加入
fast_join(RoleInfo) ->
    cast({fast_join, RoleInfo}).

%% @doc 设置选项
set_option(RoleID, Apply, Invite) ->
    cast({set_option, RoleID, Apply, Invite}).

%% @doc 获取附近队伍
get_nearby_team(RoleID, IDList) ->
    cast({get_nearby_team, RoleID, IDList}).

%% @doc set team target
set_team_target(RoleID, Target, MinLv, MaxLv) ->
    cast({set_team_target, RoleID, Target, MinLv, MaxLv}).

set_team_match(RoleID, Match) ->
    cast({set_team_match, RoleID, Match}).

%% @doc recruit
recruit(RoleID) ->
    cast({recruit, RoleID}).

%% @doc get target teams
get_target_teams(RoleID, Target) ->
    cast({get_target_teams, RoleID, Target}).

%% @doc match teams
match_teams(RoleInfo, Targets) ->
    cast({match_teams, RoleInfo, Targets}).

%% @doc recall member
set_follow(RoleID, Opt) ->
    cast({set_follow, RoleID, Opt}).

%% @doc attr change
attr_change(RoleID, AttrList) ->
    cast({attr_change, RoleID, AttrList}).

sync_state(RoleID, State) ->
    cast({sync_state, RoleID, State}).

set_assist(RoleID, Assist) ->
    cast({set_assist, RoleID, Assist}).

team_command(RoleID, Command) ->
    cast({team_command, RoleID, Command}).

set_level(RoleID, MinLv, MaxLv) ->
    cast({set_level, RoleID, MinLv, MaxLv}).

kick_robot(RoleID, RobotCid) ->
    cast({kick_robot, RoleID, RobotCid}).

add_robot(RoleID) ->
    cast({add_robot, RoleID}).

%% @doc 广播
broadcast(TeamID, Bin) ->
    cast({broadcast, TeamID, Bin}).

broadcast(TeamID, Bin, Except) ->
    cast({broadcast, TeamID, Bin, Except}).

broadcast_except(TeamID, Bin, Except) ->
    cast({broadcast_except, TeamID, Bin, Except}).

%% @doc 队伍消息
info_team(TeamID, Info) ->
    cast({info_team, TeamID, Info}).

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
    State = lib_team:init(),
    {ok, State}.

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

do_handle_call({create_team, RoleInfo, Target}, _From, State) ->
    TeamID = lib_team:create_team(RoleInfo, Target),
    {reply, TeamID, State};
do_handle_call(info, _From, State) ->
    Reply = lib_team:info(State),
    {reply, Reply, State};
do_handle_call({get_team_info, TeamID}, _From, State) ->
    Reply = lib_team:get_team_info(TeamID),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({online, RoleInfo}, State) ->
    lib_team:online(RoleInfo),
    {noreply, State};
do_handle_cast({offline, RoleID}, State) ->
    lib_team:offline(RoleID),
    {noreply, State};
do_handle_cast({apply_for, RoleInfo, TeamID}, State) ->
    lib_team:apply_for(RoleInfo, TeamID),
    {noreply, State};
do_handle_cast({get_apply_list, RoleID}, State) ->
    lib_team:get_apply_list(RoleID),
    {noreply, State};
do_handle_cast({accept_apply, RoleID, TargetID, Opt}, State) ->
    lib_team:accept_apply(RoleID, TargetID, Opt),
    {noreply, State};
do_handle_cast({leave_team, RoleID, Offline}, State) ->
    lib_team:leave_team(RoleID, Offline),
    {noreply, State};
do_handle_cast({kick_out, RoleID, TargetID}, State) ->
    lib_team:kick_out(RoleID, TargetID),
    {noreply, State};
do_handle_cast({invite, RoleID, TargetID}, State) ->
    lib_team:invite(RoleID, TargetID),
    {noreply, State};
do_handle_cast({one_key_invite, RoleID, TargetList}, State) ->
    lib_team:one_key_invite(RoleID, TargetList),
    {noreply, State};
do_handle_cast({accept_invite, RoleID, TeamID, TargetID, Opt}, State) ->
    lib_team:accept_invite(RoleID, TeamID, TargetID, Opt),
    {noreply, State};
do_handle_cast({fast_join, RoleInfo}, State) ->
    lib_team:fast_join(RoleInfo),
    {noreply, State};
do_handle_cast({get_nearby_team, RoleID, IDList}, State) ->
    lib_team:get_nearby_team(RoleID, IDList),
    {noreply, State};
do_handle_cast({demise, RoleID, TargetID}, State) ->
    lib_team:demise(RoleID, TargetID),
    {noreply, State};
do_handle_cast({promote_request, RoleID}, State) ->
    lib_team:promote_request(RoleID),
    {noreply, State};
do_handle_cast({accept_promote, RoleID, TargetID, Opt}, State) ->
    lib_team:accept_promote(RoleID, TargetID, Opt),
    {noreply, State};
do_handle_cast({get_role_team, RoleInfo}, State) ->
    lib_team:send_role_team(RoleInfo),
    {noreply, State};
do_handle_cast({set_team_target, RoleID, Target, MinLv, MaxLv}, State) ->
    lib_team:set_team_target(RoleID, Target, MinLv, MaxLv),
    {noreply, State};
do_handle_cast({set_team_match, RoleID, Match}, State) ->
    lib_team:set_team_match(RoleID, Match),
    {noreply, State};
do_handle_cast({recruit, RoleID}, State) ->
    lib_team:recruit(RoleID),
    {noreply, State};
do_handle_cast({get_target_teams, RoleID, Target}, State) ->
    lib_team:get_target_teams(RoleID, Target),
    {noreply, State};
do_handle_cast({match_teams, RoleInfo, Targets}, State) ->
    lib_team:match_teams(RoleInfo, Targets),
    {noreply, State};
do_handle_cast({set_follow, RoleID, Opt}, State) ->
    lib_team:set_follow(RoleID, Opt),
    {noreply, State};
do_handle_cast({set_assist, RoleID, Assist}, State) ->
    lib_team:set_assist(RoleID, Assist),
    {noreply, State};
do_handle_cast({team_command, RoleID, Command}, State) ->
    lib_team:team_command(RoleID, Command),
    {noreply, State};
do_handle_cast({set_level, RoleID, MinLv, MaxLv}, State) ->
    lib_team:set_level(RoleID, MinLv, MaxLv),
    {noreply, State};
do_handle_cast({kick_robot, RoleID, RobotCid}, State) ->
    lib_team:kick_robot(RoleID, RobotCid),
    {noreply, State};
do_handle_cast({add_robot, RoleID}, State) ->
    lib_team:add_robot(RoleID),
    {noreply, State};
do_handle_cast({attr_change, RoleID, AttrList}, State) ->
    lib_team:attr_change(RoleID, AttrList),
    {noreply, State};
do_handle_cast({sync_state, RoleID, FState}, State) ->
    lib_team:sync_state(RoleID, FState),
    {noreply, State};
do_handle_cast({broadcast, TeamID, Bin}, State) ->
    lib_team:broadcast(TeamID, Bin),
    {noreply, State};
do_handle_cast({broadcast, TeamID, Bin, Except}, State) ->
    lib_team:broadcast(TeamID, Bin, Except),
    {noreply, State};
do_handle_cast({broadcast_except, TeamID, Bin, Except}, State) ->
    lib_team:broadcast_except(TeamID, Bin, Except),
    {noreply, State};
do_handle_cast({info_team, TeamID, Info}, State) ->
    lib_team:info_team(TeamID, Info),
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_team:loop(State, Now),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
