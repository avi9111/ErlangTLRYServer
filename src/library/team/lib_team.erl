%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     组队
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_team).
-author("Ryuu").

-include("team.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("scene_objs.hrl").
-include("proto/prot_420.hrl").

-include_lib("stdlib/include/ms_transform.hrl").

-export([
    info/1,
    init/0,
    loop/2,
    invite/2,
    demise/2,
    online/1,
    offline/1,
    recruit/1,
    clean_up/0,
    kick_out/2,
    mod_info/3,
    mod_info/4,
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
    sync_state/2,
    set_follow/2,
    attr_change/2,
    create_team/2,
    match_teams/2,
    accept_apply/3,
    team_command/2,
    accept_invite/4,
    get_role_data/1,
    get_role_team/1,
    get_role_team_id/1,
    set_team_info/2,
    get_team_info/1,
    publish_rumor/3,
    accept_promote/3,
    get_apply_list/1,
    one_key_invite/2,
    send_role_team/1,
    set_team_match/2,
    get_nearby_team/2,
    promote_request/1,
    set_team_target/4,
    broadcast_except/3,
    get_target_teams/2
]).

-export([
    scene_attr/1,
    sync_leader_pos/2
]).

info(State) ->
    [
        {state, State},
        {team_num, ets:info(?ETS_TEAM, size)}
    ].

init() ->
    svr_timer:register(),
    ?team_mgr_state#{}.

online(RoleInfo) ->
    RoleData = init_role_data(RoleInfo),
    #{key := RoleID, team_id := TeamID0} = RoleData,
    TeamInfo = get_team_info(TeamID0),
    TeamID = ?iif(is_map(TeamInfo), TeamID0, 0),
    NewData = RoleData#{
        offline => 0, online => true, team_id => TeamID
    },
    set_role_data(RoleID, NewData),
    TeamID > 0 andalso begin
        notify_role_team(RoleData, TeamInfo, ?TEAM_CHANGE_SYNC),
        broad_attr(TeamID, RoleID, [{?TEAM_MEM_ATTR_OFFLINE, 0}])
    end.

offline(RoleID) ->
    leave_team(RoleID, true).

send_role_team(RoleInfo) ->
    RoleData = init_role_data(RoleInfo),
    #{key := RoleID, team_id := TeamID} = RoleData,
    set_role_data(RoleID, RoleData),
    Rec = #sc_team_get_info{
        team = convert_team_detail(TeamID)
    },
    {ok, Bin} = prot_msg:encode_msg(42002, Rec),
    lib_role_send:send_to_role(RoleData, Bin).

create_team(RoleInfo, Target) ->
    case catch check_create_team(RoleInfo, Target) of
        {ok, TeamID, TeamInfo, RoleID, RoleData} ->
            set_role_data(RoleID, RoleData),
            set_team_info(TeamID, update_team_leader(TeamInfo)),
            notify_role_team(RoleData, TeamInfo, ?TEAM_CHANGE_CREATE),
            create_resp(RoleData, TeamInfo),
            cancel_match(RoleID),
            TeamID;
        {error, Code} ->
            ?ERROR_TOC(RoleInfo, Code),
            0
    end.

check_create_team(RoleInfo, Target) ->
    RoleData = init_role_data(RoleInfo),
    #{key := RoleID, team_id := CurTeamID, level := RoleLv} = RoleData,
    CurTeamID =:= 0 orelse erlang:throw({error, ?RC_TEAM_ALREADY_HAVE_TEAM}),
    target_check(Target, true),
    TeamID = svr_generator:gen_team_id(),
    Members = [RoleID],
    {MinLv, MaxLv} = apply_level(Target, RoleLv),
    TeamInfo = ?team#{
        id => TeamID, leader => RoleID, members => Members, mem_num => 1,
        target => Target, min_lv => MinLv, max_lv => MaxLv
    },
    NewData = RoleData#{key => RoleID, team_id => TeamID},
    {ok, TeamID, TeamInfo, RoleID, NewData}.

create_resp(RoleData, TeamInfo) ->
    Rec = #sc_team_create{team = convert_team_detail(TeamInfo)},
    {ok, Bin} = prot_msg:encode_msg(42008, Rec),
    lib_role_send:send_to_role(RoleData, Bin).

leave_team(RoleID) ->
    leave_team(RoleID, false).

leave_team(RoleID, Offline) ->
    case catch check_leave(RoleID, Offline) of
        {leave, Del, TeamID, TeamInfo, RoleData, LeaderChange} ->
            set_role_data(RoleID, RoleData),
            notify_role_team(RoleData, 0, ?TEAM_CHANGE_LEAVE),
            case Del of
                true ->
                    del_team_info(TeamID),
                    del_team_invite_apply(TeamID);
                _ ->
                    set_team_info(TeamID, TeamInfo),
                    LType = ?iif(Offline, ?TEAM_LEAVE_OFFLINE, ?TEAM_LEAVE_ACTIVE),
                    notify_member_leave(TeamInfo, RoleData, LType),
                    LeaderChange andalso notify_leader_demise(TeamInfo)
            end,
            leave_team_resp(RoleData),
            sync_state(RoleID, 0);
        {offline, TeamID, RoleData, Now} ->
            set_role_data(RoleID, RoleData),
            cancel_match(RoleID),
            del_role_invite_apply(RoleID),
            TeamID > 0 andalso broad_attr(TeamID, RoleID, [{?TEAM_MEM_ATTR_OFFLINE, Now}]),
            sync_state(RoleID, 0);
        {error, Code} when not Offline ->
            ?ERROR_TOC(RoleID, Code);
        _ ->
            ignore
    end.

check_leave(RoleID, Offline) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamID =/= 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    TeamInfo = get_team_info(TeamID),
    #{members := Members, leader := Leader} = TeamInfo,
    case Offline of
        true ->
            Now = time:unixtime(),
            NewRoleData = RoleData#{offline => Now, targets => [], online => false},
            {offline, TeamID, NewRoleData, Now};
        _ ->
            NewMembers = del_member(RoleID, Members),
            {Del, NewLeader} =
                if
                    NewMembers =:= [] -> {true, 0};
                    Leader =:= RoleID -> {false, lists:last(NewMembers)};
                    true -> {false, Leader}
                end,
            LeaderChange = Leader =/= NewLeader,
            NewMemNum = length(NewMembers),
            NewTeamInfo = update_team_leader(TeamInfo#{
                members => NewMembers, mem_num => NewMemNum,
                leader => NewLeader
            }),
            NewRoleData = RoleData#{team_id => 0, assist => 0},
            {leave, Del, TeamID, NewTeamInfo, NewRoleData, LeaderChange}
    end.

leave_team_resp(RoleData) ->
    Rec = #sc_team_leave{},
    {ok, Bin} = prot_msg:encode_msg(42028, Rec),
    lib_role_send:send_to_role(RoleData, Bin).

apply_for(RoleInfo, TeamID) ->
    case catch check_apply_for(RoleInfo, TeamID) of
        {apply, RoleID, RoleData} ->
            set_role_data(RoleID, RoleData),
            new_team_apply(TeamID, RoleID),
            notify_team_apply(TeamID, RoleData),
            apply_for_resp(RoleID, TeamID);
        {error, Code} ->
            ?ERROR_TOC(RoleInfo, Code)
    end.

check_apply_for(RoleInfo, TeamID) ->
    RoleData = init_role_data(RoleInfo),
    #{key := RoleID, team_id := CurTeamID, level := RoleLv} = RoleData,
    CurTeamID =:= 0 orelse erlang:throw({error, ?RC_TEAM_ALREADY_HAVE_TEAM}),
    TeamInfo = get_team_info(TeamID),
    TeamInfo =/= undefined orelse erlang:throw({error, ?RC_TEAM_TEAM_NOT_FOUND}),
    is_team_full(TeamInfo) andalso erlang:throw({error, ?RC_TEAM_MEMBER_NUM_LIMIT}),
    #{min_lv := MinLv, max_lv := MaxLv} = TeamInfo,
    (RoleLv >= MinLv andalso RoleLv =< MaxLv) orelse
        erlang:throw({error, ?RC_TEAM_LEVEL_ZONE_LIMIT}),
    team_apply_exists(TeamID, RoleID) andalso erlang:throw({error, ?RC_TEAM_ALREADY_APPLY}),
    {apply, RoleID, RoleData}.

apply_for_resp(RoleID, TeamID) ->
    Rec = #sc_team_apply_for{team_id = TeamID},
    {ok, Bin} = prot_msg:encode_msg(42014, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

get_apply_list(RoleID) ->
    case catch check_get_apply_list(RoleID) of
        {ok, TeamID, RoleData} ->
            List = get_team_apply(TeamID),
            CltList = convert_team_apply(List, []),
            Rec = #sc_team_apply_list{roles = CltList},
            {ok, Bin} = prot_msg:encode_msg(42010, Rec),
            lib_role_send:send_to_role(RoleData, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_get_apply_list(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    leader_check(TeamID, RoleID),
    {ok, TeamID, RoleData}.

convert_team_apply([], Acc) ->
    Acc;
convert_team_apply([RoleID | T], Acc) ->
    RoleData = get_role_data(RoleID),
    #{name := Name, level := Level, career := Career} = RoleData,
    NewAcc = [{RoleID, Name, Level, Career} | Acc],
    convert_team_apply(T, NewAcc).

accept_apply(RoleID, TargetID, Opt) ->
    case catch check_accept_apply(RoleID, TargetID, Opt) of
        {ok, TeamID, TeamInfo, TargetData} ->
            set_role_data(TargetID, TargetData),
            set_team_info(TeamID, TeamInfo),
            del_team_apply(TeamID, TargetID),
            notify_new_member(TeamInfo, TargetData),
            accept_apply_resp(RoleID, TargetID, Opt);
        {reject, TeamID} ->
            del_team_apply(TeamID, TargetID),
            notify_apply_rejected(TeamID, TargetID),
            accept_apply_resp(RoleID, TargetID, Opt);
        {one_key_reject, TeamID} ->
            del_team_apply(TeamID),
            accept_apply_resp(RoleID, TargetID, Opt);
        {error, Code} ->
            accept_apply_resp(RoleID, TargetID, 2),
            ?ERROR_TOC(RoleID, Code)
    end.

check_accept_apply(RoleID, TargetID, Opt) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    TeamInfo = leader_check(TeamID, RoleID),
    Opt =/= 0 andalso begin
        ApplyExists = team_apply_exists(TeamID, TargetID),
        ApplyExists orelse erlang:throw({error, ?RC_TEAM_APPLY_EXPIRED})
    end,
    if
        Opt =:= 0 ->
            {one_key_reject, TeamID};
        Opt =:= ?TEAM_ACCEPT_TRUE ->
            #{members := Members} = TeamInfo,
            is_team_full(TeamInfo) andalso erlang:throw({error, ?RC_TEAM_MEMBER_NUM_LIMIT}),
            TargetData = get_role_data(TargetID),
            #{team_id := TTeamID} = TargetData,
            TTeamID =:= 0 orelse erlang:throw({error, ?RC_TEAM_TARGET_HAVE_TEAM}),
            NewTargetData = TargetData#{team_id => TeamID},
            NewMembers = add_member(TargetID, Members),
            NewMemNum = length(NewMembers),
            NewTeamInfo = TeamInfo#{members => NewMembers, mem_num => NewMemNum},
            {ok, TeamID, NewTeamInfo, NewTargetData};
        true ->
            {reject, TeamID}
    end.

accept_apply_resp(RoleID, TargetID, Option) ->
    Rec = #sc_team_accept_apply{
        role_id = TargetID, accept = Option
    },
    {ok, Bin} = prot_msg:encode_msg(42016, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

one_key_invite(RoleID, TargetList) ->
    one_key_invite2(TargetList, 3, RoleID),
    ok.

one_key_invite2(_, 0, _RoleID) ->
    ok;
one_key_invite2([], _Num, _RoleID) ->
    ok;
one_key_invite2([TargetID | T], Num, RoleID) ->
    case catch check_invite(RoleID, TargetID) of
        {invite, TeamID, TargetID} ->
            new_team_invite(TeamID, RoleID, TargetID),
            notify_team_invite(TeamID, RoleID, TargetID),
            one_key_invite2(T, Num - 1, RoleID);
        _ ->
            one_key_invite2(T, Num, RoleID)
    end.

invite(RoleID, TargetID) ->
    case catch check_invite(RoleID, TargetID) of
        {invite, TeamID, TargetID} ->
            new_team_invite(TeamID, RoleID, TargetID),
            notify_team_invite(TeamID, RoleID, TargetID),
            invite_resp(RoleID, TargetID);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_invite(RoleID, TargetID) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    TeamInfo = get_team_info(TeamID),
    is_team_full(TeamInfo) andalso erlang:throw({error, ?RC_TEAM_MEMBER_NUM_LIMIT}),
    TargetData = get_role_data(TargetID),
    #{team_id := TTeamID} = TargetData,
    TTeamID =:= 0 orelse erlang:throw({error, ?RC_TEAM_TARGET_HAVE_TEAM}),
    TargetOnline = lib_role:is_online(TargetID),
    TargetOnline orelse erlang:throw({error, ?RC_TEAM_TARGET_NOT_ONLINE}),
    {invite, TeamID, TargetID}.

invite_resp(RoleID, TargetID) ->
    Rec = #sc_team_invite_join{target = TargetID},
    {ok, Bin} = prot_msg:encode_msg(42022, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

accept_invite(RoleInfo, TeamID, TargetID, Opt) ->
    case catch check_accept_invite(RoleInfo, TeamID, TargetID, Opt) of
        {join, TeamInfo, RoleID, RoleData} ->
            set_team_info(TeamID, TeamInfo),
            set_role_data(RoleID, RoleData),
            del_team_invite(TeamID, RoleID),
            notify_new_member(TeamInfo, RoleData),
            accept_invite_resp(RoleID, TeamID, Opt);
        {reject, RoleID, Leader} ->
            del_team_invite(TeamID, RoleID),
            notify_invite_rejected(Leader, RoleInfo),
            accept_invite_resp(RoleID, TeamID, Opt);
        {apply, RoleInfo} ->
            apply_for(RoleInfo, TeamID);
        {error, Code} ->
            ?ERROR_TOC(RoleInfo, Code)
    end.

check_accept_invite(RoleInfo, TeamID, TargetID, Opt) ->
    Accept = Opt =:= ?TEAM_ACCEPT_TRUE,
    RoleData = init_role_data(RoleInfo),
    #{key := RoleID} = RoleData,
    TeamInfo = get_team_info(TeamID),
    TeamInfo =/= undefined orelse erlang:throw({error, ?RC_TEAM_TEAM_NOT_FOUND}),
    #{leader := LeaderID} = TeamInfo,
    InviteExists = team_invite_exists(TeamID, RoleID),
    case Accept of
        true when TargetID =:= LeaderID ->
            #{team_id := CurTeamID} = RoleData,
            CurTeamID =:= 0 orelse erlang:throw({error, ?RC_TEAM_ALREADY_HAVE_TEAM}),
            InviteExists orelse erlang:throw({error, ?RC_TEAM_INVITE_EXPIRED}),
            #{members := Members} = TeamInfo,
            is_team_full(TeamInfo) andalso erlang:throw({error, ?RC_TEAM_MEMBER_NUM_LIMIT}),
            NewMembers = add_member(RoleID, Members),
            NewMemNum = length(NewMembers),
            NewRoleData = RoleData#{team_id => TeamID},
            NewTeamInfo = TeamInfo#{members => NewMembers, mem_num => NewMemNum},
            {join, NewTeamInfo, RoleID, NewRoleData};
        true ->
            {apply, RoleInfo};
        _ ->
            #{leader := Leader} = TeamInfo,
            {reject, RoleID, Leader}
    end.

accept_invite_resp(RoleID, TeamID, Option) ->
    Rec = #sc_team_accept_invite{
        team_id = TeamID, accept = Option
    },
    {ok, Bin} = prot_msg:encode_msg(42024, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

demise(RoleID, TargetID) ->
    case catch check_demise(RoleID, TargetID) of
        {ok, TeamID, TeamInfo} ->
            set_team_info(TeamID, TeamInfo),
            notify_leader_demise(TeamInfo),
            demise_resp(RoleID, TargetID);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_demise(RoleID, TargetID) ->
    RoleID =/= TargetID orelse erlang:throw({error, ?RC_TEAM_ALREADY_LEADER}),
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    member_check(TeamInfo, TargetID),
    NewTeamInfo = update_team_leader(TeamInfo#{leader => TargetID}),
    {ok, TeamID, NewTeamInfo}.

demise_resp(RoleID, TargetID) ->
    Rec = #sc_team_demise_leader{target = TargetID},
    {ok, Bin} = prot_msg:encode_msg(42040, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

promote_request(RoleID) ->
    case catch check_promote_request(RoleID) of
        {ok, TeamID, TeamInfo, Name} ->
            set_team_info(TeamID, TeamInfo),
            Rec1 = #sc_team_notify_promote_request{role_id = RoleID, name = Name},
            {ok, Bin1} = prot_msg:encode_msg(42046, Rec1),
            broadcast(TeamInfo, Bin1, [RoleID]),
            Rec2 = #sc_team_promote_request{},
            {ok, Bin2} = prot_msg:encode_msg(42042, Rec2),
            lib_role_send:send_to_role(RoleID, Bin2);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_promote_request(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID, name := Name} = RoleData,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    TeamInfo = get_team_info(TeamID),
    #{leader := Leader, promote := Promote} = TeamInfo,
    RoleID =/= Leader orelse erlang:throw({error, ?RC_TEAM_ALREADY_LEADER}),
    Now = time:unixtime(),
    case Promote of
        {ReqID, Time, _Votes} when ReqID > 0 andalso Now - Time < ?TEAM_PROMOTE_TIME ->
            NewPromote = Promote,
            if
                RoleID =:= ReqID -> erlang:throw({error, ?RC_TEAM_ALREADY_REQ_PROMOTE});
                true -> erlang:throw({error, ?RC_TEAM_OTHER_REQ_PROMOTE})
            end;
        {_, Time, _} when Now - Time < ?TEAM_PROMOTE_CD ->
            NewPromote = Promote,
            erlang:throw({error, ?RC_TEAM_PROMOTE_REQUEST_CD});
        _ ->
            NewPromote = {RoleID, Now, [RoleID]}
    end,
    NewTeamInfo = TeamInfo#{promote => NewPromote},
    {ok, TeamID, NewTeamInfo, Name}.

accept_promote(RoleID, TargetID, Opt) ->
    case catch check_accept_promote(RoleID, TargetID, Opt) of
        {ok, Change, TeamID, TeamInfo, Rumor, RName, TName} ->
            set_team_info(TeamID, TeamInfo),
            Rec1 = #sc_team_accept_promote{role_id = TargetID, opt = Opt},
            {ok, Bin1} = prot_msg:encode_msg(42044, Rec1),
            lib_role_send:send_to_role(RoleID, Bin1),
            Rec2 = #sc_team_notify_accept_promote{role_id = RoleID, name = RName, opt = Opt},
            {ok, Bin2} = prot_msg:encode_msg(42047, Rec2),
            broadcast(TeamInfo, Bin2),
            publish_rumor(TeamInfo, Rumor, [RName, TName]),
            Change andalso notify_leader_demise(TeamInfo);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_accept_promote(RoleID, TargetID, Opt) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID, name := RName} = RoleData,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    TargetData = get_role_data(TargetID),
    #{team_id := TTeamID, name := TName} = TargetData,
    TeamID =:= TTeamID orelse erlang:throw({error, ?RC_TEAM_TARGET_IS_NOT_MEMBER}),
    TeamInfo = get_team_info(TeamID),
    #{leader := Leader, promote := Promote, members := Members} = TeamInfo,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    Now = time:unixtime(),
    {ReqID, Time, Votes} = Promote,
    ReqID =:= TargetID orelse erlang:throw({error, ?RC_TEAM_PROMOTE_INVALID}),
    RoleID =/= TargetID orelse erlang:throw({error, ?RC_TEAM_PROMOTE_ACCEPT_SELF}),
    Now - Time < ?TEAM_PROMOTE_TIME orelse erlang:throw({error, ?RC_TEAM_PROMOTE_INVALID}),
    ReqID > 0 orelse erlang:throw({error, ?RC_TEAM_PROMOTE_NOT_EXISTS}),
    if
        Opt =:= 0 ->
            Accept = false,
            NewPromote = {0, Time, []},
            Rumor = config:get_sys_config(team_reject_promote_rumor);
        RoleID =:= Leader ->
            Accept = true,
            NewPromote = {0, Time, []},
            Rumor = config:get_sys_config(team_approve_promote_rumor);
        true ->
            NewVotes = [RoleID | Votes],
            NewPromote = {ReqID, Time, NewVotes},
            Accept = (Members -- NewVotes) =:= [],
            Rumor = config:get_sys_config(team_approve_promote_rumor)
    end,
    case Accept of
        true ->
            NewTeamInfo = update_team_leader(TeamInfo#{leader => TargetID, promote => {0, Time, []}});
        _ ->
            NewTeamInfo = TeamInfo#{promote => NewPromote}
    end,
    {ok, Accept, TeamID, NewTeamInfo, Rumor, RName, TName}.

kick_out(RoleID, TargetID) ->
    case catch check_kick_out(RoleID, TargetID) of
        {ok, TeamID, TeamInfo, TargetData} ->
            set_team_info(TeamID, TeamInfo),
            set_role_data(TargetID, TargetData),
            notify_role_team(TargetData, 0, ?TEAM_CHANGE_KICK),
            notify_kick_out(TargetData),
            notify_member_leave(TeamInfo, TargetData, ?TEAM_LEAVE_KICK),
            kick_out_resp(RoleID, TargetID),
            sync_state(TargetID, 0);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_kick_out(RoleID, TargetID) ->
    RoleID =/= TargetID orelse erlang:throw({error, ?RC_TEAM_CAN_NOT_KICK_SELF}),
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    member_check(TeamInfo, TargetID),
    #{members := Members} = TeamInfo,
    NewMembers = del_member(TargetID, Members),
    NewMemNum = length(NewMembers),
    TargetData = get_role_data(TargetID),
    NewTargetData = TargetData#{team_id => 0, state => 0, assist => 0},
    NewTeamInfo = TeamInfo#{members => NewMembers, mem_num => NewMemNum},
    {ok, TeamID, NewTeamInfo, NewTargetData}.

kick_out_resp(RoleID, TargetID) ->
    Rec = #sc_team_kick_out{target = TargetID},
    {ok, Bin} = prot_msg:encode_msg(42030, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

fast_join(RoleInfo) ->
    case catch check_fast_join(RoleInfo) of
        {ok, TeamID, TeamInfo, RoleID, RoleData} ->
            set_team_info(TeamID, TeamInfo),
            set_role_data(RoleID, RoleData),
            notify_new_member(TeamInfo, RoleData),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_fast_join(RoleInfo) ->
    RoleData = init_role_data(RoleInfo),
    #{key := RoleID, team_id := CurTeamID} = RoleData,
    CurTeamID =:= 0 orelse erlang:throw({error, ?RC_TEAM_ALREADY_HAVE_TEAM}),
    TeamInfo = select_not_full_team(ets:first(?ETS_TEAM)),
    TeamInfo =/= undefined orelse erlang:throw({error, ?RC_TEAM_NO_AVAILABLE_TEAM}),
    #{id := TeamID, members := Members} = TeamInfo,
    NewMembers = add_member(RoleID, Members),
    NewMemNum = length(NewMembers),
    NewTeamInfo = TeamInfo#{members => NewMembers, mem_num => NewMemNum},
    NewRoleData = RoleData#{team_id => TeamID},
    {ok, TeamID, NewTeamInfo, RoleID, NewRoleData}.

select_not_full_team('$end_of_table') ->
    undefined;
select_not_full_team(Key) ->
    TeamInfo = get_team_info(Key),
    #{mem_num := MemNum} = TeamInfo,
    MaxMemNum = max_member_num(),
    case MemNum < MaxMemNum of
        true -> TeamInfo;
        _ -> select_not_full_team(ets:next(?ETS_TEAM, Key))
    end.

get_nearby_team(RoleID, IDList) ->
    TeamList = convert_teams_brief(IDList, []),
    Rec = #sc_team_get_nearby{teams = TeamList},
    {ok, Bin} = prot_msg:encode_msg(42004, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

set_team_target(RoleID, Target, MinLv, MaxLv) ->
    case catch check_set_team_target(RoleID, Target, MinLv, MaxLv) of
        {ok, TeamID, TeamInfo, OldTeamInfo} ->
            set_team_info(TeamID, TeamInfo),
            Rec = #sc_team_set_target{target = Target, min = MinLv, max = MaxLv},
            {ok, Bin} = prot_msg:encode_msg(42036, Rec),
            broadcast(TeamInfo, Bin),
            TargetName = team_target_name(Target),
            Rumor = config:get_sys_config(team_target_change_rumor),
            publish_rumor(TeamInfo, Rumor, [TargetName, MinLv, MaxLv]),
            #{leader := Leader, match := NewMatch} = TeamInfo,
            #{min_lv := OMinLv, max_lv := OMaxLv, match := OldMatch, target := OldTarget} = OldTeamInfo,
            (
                OldMatch =/= NewMatch orelse
                    conf_team_target:is_fill_robot(OldTarget) =/= conf_team_target:is_fill_robot(Target)
            ) andalso set_team_match(Leader, NewMatch),
            {OMinLv, OMaxLv} =/= {MinLv, MaxLv} andalso set_level(RoleID, MinLv, MaxLv),
            ok;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_set_team_target(RoleID, Target, MinLv, MaxLv) ->
    target_check(Target, true),
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    #{match := Match, match_beg := MatchBeg, robots := Robots} = TeamInfo,
    IsFillRobot = conf_team_target:is_fill_robot(Target),
    {MatchBegN, RobotsN} = case IsFillRobot andalso (not is_team_full(TeamInfo)) of
        true when Match =:= ?TEAM_OPT_TRUE ->
            MatchBegT = ?iif(MatchBeg > 0, MatchBeg, time:unixtime()),
            {MatchBegT, Robots};
        _ ->
            {0, []}
    end,
    TmpTeamInfo = TeamInfo#{target => Target, match_beg => MatchBegN, robots => RobotsN},
    NewMatch = case (not is_team_full(TmpTeamInfo)) andalso Target > 0 of
        true -> ?TEAM_OPT_TRUE;
        _ -> ?TEAM_OPT_FALSE
    end,
    check_apply_lv(MinLv, MaxLv),
    NewTeamInfo = TmpTeamInfo#{match => NewMatch, min_lv => MinLv, max_lv => MaxLv},
    {ok, TeamID, NewTeamInfo, TeamInfo}.

team_target_name(0) ->
    config:get_string(team_target_nil);
team_target_name(Target) ->
    TargetConf = conf_team_target:get(Target),
    #{name := Name} = TargetConf,
    Name.

set_team_match(RoleID, Match) ->
    case catch check_set_team_match(RoleID, Match) of
        {ok, TeamID, TeamInfo} ->
            set_team_info(TeamID, TeamInfo),
            set_team_match_resp(TeamInfo, Match);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_set_team_match(RoleID, Match) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    #{match_beg := MatchBeg, target := Target} = TeamInfo,
    IsFillRobot = conf_team_target:is_fill_robot(Target),

    % 匹配开始时间(若已成功等待匹配机器人，则不更新开始匹配时间)
    MatchBegN = if
        Match =:= ?TEAM_OPT_TRUE andalso IsFillRobot ->
            ?iif(MatchBeg > 0, MatchBeg, time:unixtime());
        Match =:= ?TEAM_OPT_FALSE andalso IsFillRobot ->
            Now = time:unixtime(),
            MaxMatchBeg = Now - config:get_sys_config(team_match_robot_wait),
            ?iif(MatchBeg < MaxMatchBeg, MatchBeg, 0);
        true ->
            0
    end,
    NewTeamInfo = TeamInfo#{match => Match, match_beg := MatchBegN},
    {ok, TeamID, NewTeamInfo}.

set_team_match_resp(TeamInfo, Match) ->
    MatchBeg = maps:get(match_beg, TeamInfo, 0),
    Rec = #sc_team_set_match{match = Match, match_beg = MatchBeg},
    {ok, Bin} = prot_msg:encode_msg(42038, Rec),
    broadcast(TeamInfo, Bin),
    publish_match_rumor(TeamInfo, Match).

publish_match_rumor(TeamInfo, ?TEAM_OPT_TRUE) ->
    Rumor = config:get_sys_config(team_start_match_rumor),
    publish_rumor(TeamInfo, Rumor, []);
publish_match_rumor(TeamInfo, _) ->
    Rumor = config:get_sys_config(team_stop_match_rumor),
    publish_rumor(TeamInfo, Rumor, []).

recruit(RoleID) ->
    case catch check_recruit(RoleID) of
        {ok, Rumor, Args} ->
            Rec = #sc_team_recruit{},
            {ok, Bin} = prot_msg:encode_msg(42034, Rec),
            lib_role_send:send_to_role(RoleID, Bin),
            svr_rumor:publish(world, Rumor, Args);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_recruit(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    is_team_full(TeamInfo) andalso erlang:throw({error, ?RC_TEAM_MEMBER_NUM_LIMIT}),
    #{target := Target, name := Name, min_lv := MinLv, max_lv := MaxLv} = TeamInfo,
    Target > 0 orelse erlang:throw({error, ?RC_TEAM_MUST_HAVE_TARGET}),
    TargetConf = conf_team_target:get(Target),
    #{name := TName} = TargetConf,
    Rumor = config:get_sys_config(team_recruit_rumor),
    {ok, Rumor, [Name, TName, ?STR(MinLv), ?STR(MaxLv), ?STR(TeamID)]}.

get_target_teams(RoleID, Target) ->
    List = collect_target_teams(Target),
    Rec = #sc_team_target_list{target = Target, teams = List},
    {ok, Bin} = prot_msg:encode_msg(42006, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

collect_target_teams(Target) ->
    collect_target_teams(ets:first(?ETS_TEAM), ?TEAM_TARGET_TEAM_NUM, Target, []).

collect_target_teams('$end_of_table', _Num, _Target, Acc) ->
    Acc;
collect_target_teams(_TeamID, 0, _Target, Acc) ->
    Acc;
collect_target_teams(TeamID, Num, Target, Acc) ->
    TeamInfo = get_team_info(TeamID),
    #{target := TTarget} = TeamInfo,
    {NewNum, NewAcc} =
        case (TTarget =:= Target orelse Target =:= 0) andalso
            (not is_team_full(TeamInfo)) of
            true ->
                Brief = convert_team_brief(TeamInfo),
                {Num - 1, [Brief | Acc]};
            _ ->
                {Num, Acc}
        end,
    collect_target_teams(ets:next(?ETS_TEAM, TeamID), NewNum, Target, NewAcc).

match_teams(RoleInfo, Target) ->
    Targets = ?iif(Target > 0, [Target], []),
    case catch check_match_teams(RoleInfo, Targets) of
        {ok, RoleID, RoleData} ->
            set_role_data(RoleID, RoleData),
            modify_queue(RoleID, Targets),
            Rec = #sc_team_match{target = Target},
            {ok, Bin} = prot_msg:encode_msg(42012, Rec),
            lib_role_send:send_to_role(RoleData, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleInfo, Code)
    end.

check_match_teams(RoleInfo, Targets) ->
    target_check(Targets, false),
    RoleData = init_role_data(RoleInfo),
    #{key := RoleID, team_id := TeamID} = RoleData,
    TeamID =:= 0 orelse erlang:throw({error, ?RC_TEAM_ALREADY_HAVE_TEAM}),
    {ok, RoleID, RoleData}.

set_follow(RoleID, Opt) ->
    case catch check_set_follow(RoleID, Opt) of
        {ok, TeamID, TeamInfo} ->
            set_team_info(TeamID, TeamInfo),
            set_follow_resp(TeamInfo, RoleID, Opt),
            #{members := Members} = TeamInfo,
            case Opt of
                0 ->
                    [sync_state(MemID, 0) || MemID <- Members];
                _ ->
                    ignore
            end;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_set_follow(RoleID, Opt) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    NewTeamInfo = TeamInfo#{follow => Opt},
    {ok, TeamID, NewTeamInfo}.

set_follow_resp(TeamInfo, RoleID, Opt) ->
    Rec1 = #sc_team_follow{opt = Opt},
    {ok, Bin1} = prot_msg:encode_msg(42050, Rec1),
    lib_role_send:send_to_role(RoleID, Bin1),
    Rec2 = #sc_team_notify_follow{opt = Opt},
    {ok, Bin2} = prot_msg:encode_msg(42053, Rec2),
    broadcast_except(TeamInfo, Bin2, [RoleID]).

set_assist(RoleID, Assist) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    NewData = RoleData#{assist => Assist},
    set_role_data(RoleID, NewData),
    Rec = #sc_team_assist{role_id = RoleID, assist = Assist},
    {ok, Bin} = prot_msg:encode_msg(42058, Rec),
    broadcast(TeamID, Bin).

team_command(RoleID, Command) ->
    case catch check_team_command(RoleID, Command) of
        {ok, TeamInfo} ->
            Rec = #sc_team_command{command = Command},
            {ok, Bin} = prot_msg:encode_msg(42062, Rec),
            broadcast(TeamInfo, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_team_command(RoleID, _Command) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    {ok, TeamInfo}.

set_level(RoleID, MinLv, MaxLv) ->
    case catch check_set_level(RoleID, MinLv, MaxLv) of
        {ok, TeamID, TeamInfo} ->
            set_team_info(TeamID, TeamInfo),
            Rec = #sc_team_set_level{min = MinLv, max = MaxLv},
            {ok, Bin} = prot_msg:encode_msg(42064, Rec),
            broadcast(TeamInfo, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_set_level(RoleID, MinLv, MaxLv) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    check_apply_lv(MinLv, MaxLv),
    TeamInfo = leader_check(TeamID, RoleID),
    NewTeamInfo = TeamInfo#{min_lv => MinLv, max_lv => MaxLv},
    {ok, TeamID, NewTeamInfo}.

kick_robot(RoleID, RobotCid) ->
    case catch check_kick_robot(RoleID, RobotCid) of
        {ok, TeamID, TeamInfo} ->
            set_team_info(TeamID, TeamInfo),
            KickRobotMsg = #sc_kick_robot{robot_cid = RobotCid},
            {ok, KickRobotBin} = prot_msg:encode_msg(42072, KickRobotMsg),
            broadcast(TeamInfo, KickRobotBin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_kick_robot(RoleID, RobotCid) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    #{robots := Robots} = TeamInfo,
    case lists:member(RobotCid, Robots) of
        true ->
            RobotsN = lists:delete(RobotCid, Robots),
            TeamInfoN = TeamInfo#{robots => RobotsN},
            {ok, TeamID, TeamInfoN};
        false ->
            {error, ?RC_TEAM_NO_SUCH_ROBOT_IN_TEAM}
    end.

add_robot(RoleID) ->
    case catch check_add_robot(RoleID) of
        {ok, RobotCid, TeamID, TeamInfo} ->
            set_team_info(TeamID, TeamInfo),
            sync_add_robots(TeamInfo, [RobotCid]);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_add_robot(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    TeamInfo = leader_check(TeamID, RoleID),
    Now = time:unixtime(),
    MaxMatchBeg = Now - config:get_sys_config(team_match_robot_wait),
    #{target := Target, match_beg := MatchBeg, mem_num := MemNum, robots := Robots} = TeamInfo,
    MaxMemNum = max_member_num(),
    IsFillRobot = conf_team_target:is_fill_robot(Target),
    if
        not IsFillRobot ->
            {error, ?RC_TEAM_CANNOT_ADD_ROBOT};
        MatchBeg =:= 0 orelse MatchBeg > MaxMatchBeg ->
            {error, ?RC_TEAM_STILL_WAITING_ROLE_JOIN};
        MemNum + length(Robots) >= MaxMemNum ->
            {error, ?RC_TEAM_MEMBER_NUM_LIMIT};
        true ->
            RobotIds = conf_team_robot:get_ids(),
            ValidRobotIds = RobotIds -- Robots,
            RobotCid = util:list_rand(ValidRobotIds),
            RobotsN = lists:append(Robots, [RobotCid]),
            TeamInfoN = TeamInfo#{robots => RobotsN},
            {ok, RobotCid, TeamID, TeamInfoN}
    end.

sync_add_robots(TeamInfo, Ids) ->
    AddRobotMsg = #sc_add_robot{ids = Ids},
    {ok, AddRobotBin} = prot_msg:encode_msg(42074, AddRobotMsg),
    broadcast(TeamInfo, AddRobotBin).

sync_state(RoleID, State) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    NewData = RoleData#{state => State},
    set_role_data(RoleID, NewData),
    case TeamID > 0 of
        true ->
            TeamInfo = get_team_info(TeamID),
            #{leader := Leader, follow := Follow} = TeamInfo,
            FState = ?iif(State > 1 andalso Follow =:= 1, Leader, 0),
            Rec = #sc_team_notify_sync_state{role_id = RoleID, state = State},
            {ok, Bin} = prot_msg:encode_msg(42054, Rec),
            lib_role_team:broadcast(TeamID, Bin);
        _ ->
            FState = 0
    end,
    lib_role:mod_info(RoleID, lib_role_team, {'update_fllow', FState}),
    ok.

attr_change(RoleID, AttrList) ->
    RoleData = get_role_data(RoleID),
    {NewData, List} = update_attr(AttrList, RoleData, []),
    set_role_data(RoleID, NewData),
    #{team_id := TeamID} = NewData,
    TeamID > 0 andalso broad_attr(TeamID, RoleID, List).

update_attr([], RoleData, Acc) ->
    {RoleData, Acc};
update_attr([{Key, Value} | T], RoleData, Acc) ->
    NewData = maps:put(Key, Value, RoleData),
    AttrKey = attr_map(Key),
    NewAcc = ?iif(AttrKey > 0, [{AttrKey, Value} | Acc], Acc),
    update_attr(T, NewData, NewAcc).

attr_map(level) ->
    ?TEAM_MEM_ATTR_LV;
attr_map(career) ->
    ?TEAM_MEM_ATTR_CAREER;
attr_map(scene) ->
    ?TEAM_MEM_ATTR_SCENE;
attr_map(line) ->
    ?TEAM_MEM_ATTR_LINE;
attr_map(_) ->
    0.

broad_attr(_TeamID, _RoleID, []) ->
    ignore;
broad_attr(TeamID, RoleID, List) ->
    Rec = #sc_team_member_attr{role_id = RoleID, list = List},
    {ok, Bin} = prot_msg:encode_msg(42059, Rec),
    TeamID > 0 andalso broadcast(TeamID, Bin, [RoleID]).

loop(_State, Now) ->
    Now rem 20 =:= 7 andalso begin
        match_team(),
        match_new_team()
    end,
    Now rem 60 =:= 3 andalso handle_offline(Now),
    Now rem 60 =:= 9 andalso del_expire_invite_apply(Now),
    Now rem 10 =:= 8 andalso match_robot(Now),
    ok.

match_team() ->
    Queue = get_match_queue(),
    MaxNum = max_member_num(),
    NewQueue = match_team_member(ets:first(?ETS_TEAM), MaxNum, Queue),
    set_match_queue(NewQueue).

match_team_member('$end_of_table', _MaxNum, Queue) ->
    Queue;
match_team_member(TeamID, MaxNum, Queue) ->
    TeamInfo = get_team_info(TeamID),
    #{target := Target, match := Match, members := Members, robots := Robots} = TeamInfo,
    TotalMemNum = length(Members) + length(Robots),
    RoleSet = util:dict_find(Target, Queue, sets:new()),
    case Target > 0 andalso Match > 0 andalso TotalMemNum < MaxNum andalso
        sets:size(RoleSet) > 0 of
        true ->
            List = sets:to_list(RoleSet),
            {Roles, Rest} = util:split_list(MaxNum - TotalMemNum, List),
            NewTeamInfo = add_team_members(Roles, MaxNum, TeamInfo),
            #{match := NewMatch} = NewTeamInfo,
            set_team_info(TeamID, NewTeamInfo),
            Match =/= NewMatch andalso set_team_match_resp(NewTeamInfo, NewMatch),
            NewQueue = dict:store(Target, sets:from_list(Rest), Queue),
            match_team_member(ets:next(?ETS_TEAM, TeamID), MaxNum, NewQueue);
        _ ->
            match_team_member(ets:next(?ETS_TEAM, TeamID), MaxNum, Queue)
    end.

add_team_members([], _MaxNum, Info) ->
    Info;
add_team_members([RoleID | T], MaxNum, TeamInfo) ->
    #{id := TeamID, members := Members, min_lv := MinLv, max_lv := MaxLv} = TeamInfo,
    RoleData = get_role_data(RoleID),
    #{level := RoleLv} = RoleData,
    case RoleLv >= MinLv andalso RoleLv =< MaxLv of
        true ->
            NewRoleData = RoleData#{team_id => TeamID},
            set_role_data(RoleID, NewRoleData),
            NewMembers = add_member(RoleID, Members),
            NewNum = length(NewMembers),
            Match = ?iif(NewNum >= MaxNum, 0, 1),
            NewTeamInfo = TeamInfo#{
                members => NewMembers, mem_num => NewNum, match => Match
            },
            notify_new_member(NewTeamInfo, NewRoleData, false),
            add_team_members(T, MaxNum, NewTeamInfo);
        _ ->
            add_team_members(T, MaxNum, TeamInfo)
    end.

match_new_team() ->
    Queue = get_match_queue(),
    IDList = conf_team_target:get_ids(),
    MemNum = max_member_num(),
    MatSet = match_new_team(IDList, Queue, MemNum, sets:new()),
    NewQueue = remove_from_queue(IDList, MatSet, Queue),
    set_match_queue(NewQueue).

match_new_team([], _Queue, _MemNum, MSet) ->
    MSet;
match_new_team([ID | T], Queue, MemNum, MatAcc) ->
    Target = util:dict_find(ID, Queue, sets:new()),
    RoleList = sets:to_list(sets:subtract(Target, MatAcc)),
    NewMatAcc = match_target(RoleList, MemNum, ID, MatAcc),
    match_new_team(T, Queue, MemNum, NewMatAcc).

match_target(_RoleList, MemNum, _ID, MatAcc) when MemNum =< 0 ->
    MatAcc;
match_target(RoleList, MemNum, _ID, MatAcc) when length(RoleList) < MemNum ->
    MatAcc;
match_target(RoleList, MemNum, ID, MatAcc) ->
    {Members, Rest} = util:split_list(MemNum, RoleList),
    create_from_list(ID, Members, MemNum),
    NewMatAcc = sets:union(MatAcc, sets:from_list(Members)),
    match_target(Rest, MemNum, ID, NewMatAcc).

create_from_list(Target, Members, MemNum) ->
    TeamID = svr_generator:gen_team_id(),
    [Leader | _] = Members,
    TeamInfo = ?team#{
        id => TeamID, leader => Leader, members => Members,
        mem_num => MemNum, target => Target
    },
    set_team_info(TeamID, update_team_leader(TeamInfo)),
    Rec = #sc_team_join_new{
        team = convert_team_detail(TeamInfo)
    },
    {ok, Bin} = prot_msg:encode_msg(42020, Rec),
    [begin
        RoleData = get_role_data(RoleID),
        NewData = RoleData#{team_id => TeamID},
        set_role_data(RoleID, NewData),
        notify_role_team(NewData, TeamInfo, ?TEAM_CHANGE_CREATE),
        lib_role_send:send_to_role(NewData, Bin)
    end || RoleID <- Members],
    ok.

remove_from_queue([], _MatSet, Queue) ->
    Queue;
remove_from_queue([ID | T], MatSet, Queue) ->
    Target = util:dict_find(ID, Queue, sets:new()),
    NewTarget = sets:subtract(Target, MatSet),
    NewQueue = dict:store(ID, NewTarget, Queue),
    remove_from_queue(T, MatSet, NewQueue).

handle_offline(Now) ->
    Timeout = config:get_sys_config(team_offline_timeout),
    Key = ets:first(?ETS_TEAM_MEMBER),
    handle_offline(Key, Now - Timeout).

handle_offline('$end_of_table', _Timeout) ->
    ok;
handle_offline(RoleID, Timeout) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID, offline := Offline} = RoleData,
    case TeamID > 0 andalso Offline > 0 andalso Offline < Timeout of
        true ->
            leave_team(RoleID, false);
        _ ->
            ok
    end,
    handle_offline(ets:next(?ETS_TEAM_MEMBER, RoleID), Timeout).

%% -----------------------------------------------------------------------------

convert_team_detail(undefined) ->
    #clt_team{};
convert_team_detail(TeamID) when is_integer(TeamID) ->
    TeamInfo = get_team_info(TeamID),
    convert_team_detail(TeamInfo);
convert_team_detail(TeamInfo) ->
    #{id := TeamID, leader := Leader, members := Members, target := Target,
        match := Match, follow := Follow, robots := Robots, match_beg := MatchBeg,
        min_lv := MinLv, max_lv := MaxLv} = TeamInfo,
    #clt_team{
        id = TeamID, leader = Leader, members = get_member_details(Members, []),
        target = Target, match = Match, follow = Follow, robots = Robots,
        match_beg = MatchBeg, min_lv = MinLv, max_lv = MaxLv
    }.

get_member_details([], Acc) ->
    Acc;
get_member_details([RoleID | T], Acc) ->
    RoleData = get_role_data(RoleID),
    Member = get_member_detail(RoleData),
    get_member_details(T, [Member | Acc]).

get_member_detail(RoleData) ->
    #{id := RoleID, name := Name, level := RoleLv, gender := Sex, career := Career,
        icon := Icon, offline := Offline, state := State, scene := Scene,
        hp := Hp, hp_lim := HpLim, frame := Frame, line := LineID} = RoleData,
    #clt_team_member{
        id = RoleID, name = Name, level = RoleLv, gender = Sex, career = Career,
        offline = Offline, state = State, scene = Scene, hp = hp_pert(Hp, HpLim),
        hp_lim = 100, icon = Icon, frame = Frame, line = LineID
    }.

convert_teams_brief([], Acc) ->
    Acc;
convert_teams_brief([TeamID | T], Acc) ->
    TeamDetail = convert_team_brief(TeamID),
    NewAcc = [TeamDetail | Acc],
    convert_teams_brief(T, NewAcc).

convert_team_brief(TeamID) when is_integer(TeamID) ->
    TeamInfo = get_team_info(TeamID),
    convert_team_brief(TeamInfo);
convert_team_brief(TeamInfo) ->
    #{id := TeamID, name := Name, mem_num := MemNum, leader := Leader,
        level := Level, career := Career, robots := Robots} = TeamInfo,
    TotalMemNum = MemNum + length(Robots),
    #clt_team_brief{
        id = TeamID, name = Name, mem_num = TotalMemNum,
        level = Level, leader = Leader, career = Career
    }.

leader_check(TeamID, RoleID) ->
    TeamInfo = get_team_info(TeamID),
    TeamInfo =/= undefined orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{leader := Leader} = TeamInfo,
    Leader =:= RoleID orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    TeamInfo.

member_check(TeamID, TargetID) ->
    TeamInfo = get_team_info(TeamID),
    #{members := Members} = TeamInfo,
    lists:member(TargetID, Members) orelse erlang:throw({error, ?RC_TEAM_TARGET_IS_NOT_MEMBER}),
    ok.

target_check(Targets, AllowNo) when is_list(Targets) ->
    target_check_(Targets, AllowNo, sets:new());
target_check(Target, AllowNo) ->
    target_check([Target], AllowNo).

target_check_([], _AllowNo, _Acc) ->
    true;
target_check_([0 | _T], false, _Acc) ->
    erlang:throw({error, ?RC_TEAM_MUST_HAVE_TARGET});
target_check_([0 | T], true, Acc) ->
    target_check_(T, true, sets:add_element(0, Acc));
target_check_([Target | T], AllowNo, Acc) ->
    TargetConf = conf_team_target:get(Target),
    TargetConf =/= undefined orelse erlang:throw({error, ?RC_TEAM_TARGET_NOT_FOUND}),
    sets:is_element(Target, Acc) andalso erlang:throw({error, ?RC_TEAM_TARGET_DUPLICATE}),
    target_check_(T, AllowNo, sets:add_element(Target, Acc)).

is_team_full(TeamInfo) ->
    #{robots := Robots, members := Members} = TeamInfo,
    length(Members) + length(Robots) >= max_member_num().

max_member_num() ->
    config:get_sys_config(team_max_member_num).

check_apply_lv(MinLv, MaxLv) ->
    MaxRoleLv = conf_level:get_max_lv(),
    (MinLv > 0 andalso MinLv =< MaxRoleLv andalso
        MaxLv > 0 andalso MaxLv =< MaxRoleLv andalso
        MinLv =< MaxLv) orelse erlang:throw({error, ?RC_TEAM_INVALID_LEVEL}),
    ok.

apply_level(0, _RoleLv) ->
    {1, conf_level:get_max_lv()};
apply_level(Target, RoleLv) ->
    Conf = conf_team_target:get(Target),
    #{apply_lv := List} = Conf,
    case [{Min, Max} || {Min, Max} <- List, RoleLv >= Min, RoleLv =< Max] of
        [{MinLv, MaxLv} | _] -> {MinLv, MaxLv};
        _ -> {1, conf_level:get_max_lv()}
    end.

notify_role_team(RoleID, 0, Type) ->
    lib_role:mod_info(RoleID, lib_role_team, {team_changed, ?team, Type});
notify_role_team(RoleID, TeamID, Type) when is_integer(TeamID) ->
    TeamInfo = get_team_info(TeamID),
    notify_role_team(RoleID, TeamInfo, Type);
notify_role_team(RoleID, TeamInfo, Type) ->
    lib_role:mod_info(RoleID, lib_role_team, {team_changed, TeamInfo#{version => time:unixtime()}, Type}).

notify_leader_demise(TeamID) ->
    TeamInfo = get_team_info(TeamID),
    #{leader := Leader, name := Name} = TeamInfo,
    set_follow(Leader, 0),
    Rec = #sc_team_notify_leader_demise{leader = Leader},
    {ok, Bin} = prot_msg:encode_msg(42045, Rec),
    broadcast(TeamID, Bin),
    member_change(TeamInfo, ?TEAM_CHANGE_DEMISE),
    Rumor = config:get_sys_config(team_leader_change_rumor),
    publish_rumor(TeamInfo, Rumor, [Name]).

notify_team_apply(TeamID, RoleInfo) ->
    TeamInfo = get_team_info(TeamID),
    #{leader := Leader} = TeamInfo,
    #{key := RoleID} = RoleInfo,
    BaseInfo = lib_cache:get_role_base(RoleID),
    #{name := Nickname, level := Level, career := Career} = BaseInfo,
    Rec = #sc_team_notify_apply{
        role_id = RoleID, role_name = Nickname,
        level = Level, career = Career
    },
    {ok, Bin} = prot_msg:encode_msg(42017, Rec),
    lib_role_send:send_to_role(Leader, Bin).

notify_team_invite(TeamID, RoleID, TargetID) ->
    RoleData = get_role_data(RoleID),
    #{name := RoleName} = RoleData,
    Rec = #sc_team_new_invite{
        team_id = TeamID, role_id = RoleID, name = RoleName
    },
    {ok, Bin} = prot_msg:encode_msg(42025, Rec),
    lib_role_send:send_to_role(TargetID, Bin).

notify_new_member(TeamInfo, RoleData) ->
    notify_new_member(TeamInfo, RoleData, true).

notify_new_member(TeamInfo, RoleData, Queue) ->
    #{key := RoleID, name := RoleName} = RoleData,
    Queue andalso cancel_match(RoleID),
    Rec1 = #sc_team_new_member{member = get_member_detail(RoleData)},
    {ok, Bin1} = prot_msg:encode_msg(42019, Rec1),
    broadcast_except(TeamInfo, Bin1, RoleID),
    CltTeam = convert_team_detail(TeamInfo),
    Rec2 = #sc_team_join_new{team = CltTeam},
    {ok, Bin2} = prot_msg:encode_msg(42020, Rec2),
    lib_role_send:send_to_role(RoleID, Bin2),
    member_change(TeamInfo, ?TEAM_CHANGE_JOIN),
    Rumor = config:get_sys_config(team_member_join_rumor),
    publish_rumor(TeamInfo, Rumor, [RoleName]).

notify_member_leave(TeamInfo, RoleData, Type) ->
    #{key := RoleID, name := RoleName} = RoleData,
    Rec = #sc_team_member_leave{role_id = RoleID},
    {ok, Bin} = prot_msg:encode_msg(42031, Rec),
    broadcast(TeamInfo, Bin),
    member_change(TeamInfo, ?TEAM_CHANGE_LEAVE),
    case Type of
        ?TEAM_LEAVE_KICK ->
            Rumor = config:get_sys_config(team_kick_member_rumor);
        _ ->
            Rumor = config:get_sys_config(team_member_leave_rumor)
    end,
    publish_rumor(TeamInfo, Rumor, [RoleName]).

member_change(TeamInfo, Type) ->
    #{members := Members} = TeamInfo,
    [notify_role_team(Member, TeamInfo, Type) || Member <- Members].

notify_apply_rejected(TeamID, RoleID) ->
    Rec = #sc_team_apply_reject{team_id = TeamID},
    {ok, Bin} = prot_msg:encode_msg(42018, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

notify_invite_rejected(Leader, RoleInfo) ->
    #{key := RoleID, name := Name} = RoleInfo,
    Rec = #sc_team_invite_reject{role_id = RoleID, name = Name},
    {ok, Bin} = prot_msg:encode_msg(42026, Rec),
    lib_role_send:send_to_role(Leader, Bin).

notify_kick_out(TargetData) ->
    Rec = #sc_team_notify_kick_out{},
    {ok, Bin} = prot_msg:encode_msg(42032, Rec),
    lib_role_send:send_to_role(TargetData, Bin).

publish_rumor(TeamInfo, Rumor, Args) ->
    Bin = lib_rumor:encode(team, Rumor, Args),
    broadcast(TeamInfo, Bin).

broadcast(TeamID, Bin) ->
    broadcast(TeamID, Bin, []).

broadcast(TeamID, Bin, Except) ->
    broadcast_except(TeamID, Bin, Except).

broadcast_except(TeamID, Bin, Except) when is_integer(TeamID) ->
    TeamInfo = get_team_info(TeamID),
    broadcast_except(TeamInfo, Bin, Except);
broadcast_except(TeamInfo, Bin, Except) when is_map(TeamInfo) ->
    #{members := Members} = TeamInfo,
    broadcast_except(Members, Bin, Except);
broadcast_except(Members, Bin, Except) when is_list(Members), is_integer(Except) ->
    broadcast_except(Members, Bin, [Except]);
broadcast_except(Members, Bin, Except) when is_list(Members), is_list(Except) ->
    [begin
        lib_role_send:send_to_role(RoleID, Bin)
    end || RoleID <- Members, not lists:member(RoleID, Except)];
broadcast_except(_Members, _Bin, _Except) ->
    ignore.

mod_info(TeamID, Module, Info) ->
    mod_info_except(TeamID, Module, Info, []).

mod_info(TeamID, Module, Info, Except) ->
    mod_info_except(TeamID, Module, Info, Except).

mod_info_except(TeamID, Module, Info, Except) ->
    info_team_except(TeamID, {mod, Module, Info}, Except).

info_team(TeamID, Info) ->
    info_team_except(TeamID, Info, []).

info_team_except(TeamID, Info, Except) when is_integer(TeamID) ->
    TeamInfo = get_team_info(TeamID),
    info_team_except(TeamInfo, Info, Except);
info_team_except(TeamInfo, Info, Except) when is_map(TeamInfo) ->
    #{members := Members} = TeamInfo,
    info_team_except(Members, Info, Except);
info_team_except(Members, Info, Except) when is_list(Members) ->
    [begin
        role_info(RoleID, Info)
    end || RoleID <- Members, not lists:member(RoleID, Except)];
info_team_except(_, _Info, _Except) ->
    ignore.

role_info(Role, Info) ->
    lib_role:info_role(Role, Info).

clean_up() ->
    util:cls_ets(?ETS_TEAM),
    util:cls_ets(?ETS_TEAM_MEMBER),
    util:cls_ets(?ETS_TEAM_APPLY_INVITE),
    ok.

%% -----------------------------------------------------------------------------
%% Scene
%% -----------------------------------------------------------------------------

scene_attr(SceneRole) ->
    #scene_role{id = RoleID, hp = Hp, bt_attr = #bt_attr{hp_lim = HpLim}} = SceneRole,
    List = [{?TEAM_MEM_ATTR_HP, hp_pert(Hp, HpLim)}],
    Rec = #sc_team_member_attr{role_id = RoleID, list = List},
    {ok, Bin} = prot_msg:encode_msg(42059, Rec),
    Bin.

sync_leader_pos(SceneRole, SceneID) ->
    #scene_role{id = RoleID, team = TeamID, x = X, y = Y} = SceneRole,
    Roles = lib_team_agent:get_team_role(TeamID),
    Rec = #sc_team_mem_pos{role_id = RoleID, scene_id = SceneID, x = X, y = Y},
    {ok, Bin} = prot_msg:encode_msg(42056, Rec),
    sync_leader_pos(Roles, RoleID, Bin).

sync_leader_pos([], _RoleID, _Bin) ->
    ok;
sync_leader_pos([RoleID | T], RoleID, Bin) ->
    sync_leader_pos(T, RoleID, Bin);
sync_leader_pos([RID | T], RoleID, Bin) ->
    case lib_scene_agent:get_roler(RID) of
        #scene_role{follow = RoleID, sid = Sid} ->
            lib_role_send:send_to_sid(Sid, Bin);
        _ ->
            ignore
    end,
    sync_leader_pos(T, RoleID, Bin).

hp_pert(Hp, HpLim) when Hp =:= 0 orelse HpLim =:= 0 ->
    0;
hp_pert(Hp, HpLim) ->
    erlang:min(erlang:floor(Hp * 100 / HpLim), 100).

%% -----------------------------------------------------------------------------

get_team_info(TeamID) when is_integer(TeamID) ->
    util:get_ets(?ETS_TEAM, TeamID);
get_team_info(TeamInfo) when is_map(TeamInfo) ->
    TeamInfo.

set_team_info(TeamID, TeamInfo) ->
    util:put_ets(?ETS_TEAM, TeamID, TeamInfo#{version => time:unixtime()}).

del_team_info(TeamID) ->
    util:del_ets(?ETS_TEAM, TeamID).

update_team_leader(TeamInfo) ->
    #{leader := Leader} = TeamInfo,
    RoleData = get_role_data(Leader),
    #{level := Level, career := Career, name := Name} = RoleData,
    TeamInfo#{
        name => Name, level => Level, career => Career
    }.

add_member(RoleID, Members) ->
    [RoleID | del_member(RoleID, Members)].

del_member(RoleID, Members) ->
    [RKey || RKey <- Members, RKey =/= RoleID].

init_role_data(RoleInfo) ->
    #{key := RoleID} = RoleInfo,
    RoleData0 = get_role_data(RoleID),
    update_role_data(RoleData0#{online => true, offline => 0}, RoleInfo).

update_role_data(RoleData, InitInfo) ->
    maps:merge(RoleData, InitInfo).

get_role_data(RoleID) ->
    case util:get_ets(?ETS_TEAM_MEMBER, RoleID) of
        M when is_map(M) -> M;
        _ -> ?team_role#{key => RoleID}
    end.

set_role_data(RoleID, RoleData) ->
    util:put_ets(?ETS_TEAM_MEMBER, RoleID, RoleData).

-spec get_role_team(RoleID :: integer()) -> #{} | undefined.
get_role_team(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{team_id := TeamID} = RoleData,
    get_team_info(TeamID).

get_role_team_id(RoleID) ->
    RoleData = get_role_data(RoleID),
    maps:get(team_id, RoleData, 0).

%% -----------------------------------------------------------------------------

new_team_apply(TeamID, RoleID) ->
    Expire = time:unixtime() + 300,
    Rec = #team_invite_apply{
        key = {apply, TeamID, RoleID}, team_id = TeamID, role_id = RoleID, type = apply,
        expire = Expire
    },
    ets:insert(?ETS_TEAM_APPLY_INVITE, Rec).

new_team_invite(TeamID, RoleID, TargetID) ->
    Expire = time:unixtime() + 30,
    Rec = #team_invite_apply{
        key = {invite, TeamID, TargetID}, team_id = TeamID, role_id = RoleID,
        type = invite, expire = Expire
    },
    ets:insert(?ETS_TEAM_APPLY_INVITE, Rec).

get_team_apply(TeamID) ->
    Pattern = ets:fun2ms(fun(#team_invite_apply{team_id = TID, type = Type, role_id = RoleID})
        when TID =:= TeamID andalso Type =:= apply -> RoleID
    end),
    ets:select(?ETS_TEAM_APPLY_INVITE, Pattern).

del_expire_invite_apply(Now) ->
    Pattern = ets:fun2ms(fun(#team_invite_apply{expire = Expire}) ->
        Expire =< Now
    end),
    ets:select_delete(?ETS_TEAM_APPLY_INVITE, Pattern).

match_robot(Now) ->
    MaxMemNum = max_member_num(),
    MaxMatchBeg = Now - config:get_sys_config(team_match_robot_wait),
    FilterFun = fun({_, #{match_beg := MatchBeg, robots := Robots, mem_num := MemNum} = TeamInfo}, Acc) ->
        case MatchBeg > 1 andalso MatchBeg =< MaxMatchBeg andalso Robots =:= [] andalso MemNum < MaxMemNum of
            true -> [TeamInfo | Acc];
            false -> Acc
        end
    end,
    NeedMatchTeams = ets:foldl(FilterFun, [], ?ETS_TEAM),
    [handle_match_robot(TeamInfo) || TeamInfo <- NeedMatchTeams],
    ok.

handle_match_robot(#{id := TeamID, mem_num := MemNum} = TeamInfo) ->
    MaxMemNum = max_member_num(),
    ConfRobotIds = conf_team_robot:get_ids(),
    RobotIds = util:list_disorder(ConfRobotIds),
    RobotNum = MaxMemNum - MemNum,
    Robots = lists:sublist(RobotIds, RobotNum),
    TeamInfoN = TeamInfo#{
        match => ?TEAM_OPT_FALSE,
        match_beg => 1,
        robots => Robots
    },
    set_team_info(TeamID, TeamInfoN),
    sync_add_robots(TeamInfoN, Robots),
    ok.

del_team_invite_apply(TeamID) ->
    Pattern = ets:fun2ms(fun(#team_invite_apply{team_id = TID}) -> TID =:= TeamID end),
    ets:select_delete(?ETS_TEAM_APPLY_INVITE, Pattern).

del_team_apply(TeamID) ->
    Pattern = ets:fun2ms(fun(#team_invite_apply{team_id = TID, type = Type}) ->
        TID =:= TeamID andalso Type =:= apply
    end),
    ets:select_delete(?ETS_TEAM_APPLY_INVITE, Pattern).

del_role_invite_apply(RoleID) ->
    Pattern = ets:fun2ms(fun(#team_invite_apply{role_id = RID}) -> RID =:= RoleID end),
    ets:select_delete(?ETS_TEAM_APPLY_INVITE, Pattern).

del_team_invite(TeamID, RoleID) ->
    ets:delete(?ETS_TEAM_APPLY_INVITE, {invite, TeamID, RoleID}).

del_team_apply(TeamID, RoleID) ->
    ets:delete(?ETS_TEAM_APPLY_INVITE, {apply, TeamID, RoleID}).

team_invite_exists(TeamID, RoleID) ->
    ets:lookup(?ETS_TEAM_APPLY_INVITE, {invite, TeamID, RoleID}) =/= [].

team_apply_exists(TeamID, RoleID) ->
    ets:lookup(?ETS_TEAM_APPLY_INVITE, {apply, TeamID, RoleID}) =/= [].

get_match_queue() ->
    case erlang:get(match_queue) of
        undefined -> dict:new();
        Queue -> Queue
    end.

set_match_queue(Queue) ->
    erlang:put(match_queue, Queue).

cancel_match(RoleID) ->
    modify_queue(RoleID, []).

modify_queue(RoleID, Target) ->
    Queue = get_match_queue(),
    IDList = conf_team_target:get_ids(),
    NewQueue = modify_queue(IDList, RoleID, sets:from_list(Target), Queue),
    set_match_queue(NewQueue).

modify_queue([], _RoleID, _TSet, Queue) ->
    Queue;
modify_queue([ID | T], RoleID, TSet, Queue) ->
    Target = util:dict_find(ID, Queue, sets:new()),
    case sets:is_element(ID, TSet) of
        true ->
            NewTarget = sets:add_element(RoleID, Target);
        _ ->
            NewTarget = sets:del_element(RoleID, Target)
    end,
    modify_queue(T, RoleID, TSet, dict:store(ID, NewTarget, Queue)).
