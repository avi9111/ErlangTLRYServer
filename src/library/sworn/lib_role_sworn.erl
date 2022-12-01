%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     结拜系统
%%% @end
%%% Created : 15. 二月 2019 20:27
%%%-------------------------------------------------------------------
-module(lib_role_sworn).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("chat.hrl").
-include("scene.hrl").
-include("title.hrl").
-include("sworn.hrl").
-include("friend.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_402.hrl").
-include("proto/prot_540.hrl").


%% API
-export([
    init/1,
    save/1,
    event/2,
    handle_info/2
]).

-export([
    info/1,
    greet/3,
    is_sworn/1,
    is_sworn/2,
    create_new/1,
    up_quality/1,
    modify_name/3,
    is_in_group/2,
    is_in_range/5,
    leave_group/1,
    vote_senior/2,
    modify_word/2,
    make_confirm/3,
    gather_member/1,
    change_senior/1,
    get_sworn_name/2,
    recruit_member/1,
    dismiss_member/3,
    modify_enounce/2,
    greet_send_msg/3,
    greet_send_msg/4,
    add_sworn_value/2,
    modify_name_req/1,
    platform_register/4,
    get_platform_list/2,
    dismiss_member_req/1,
    get_name_concat_str/3,
    get_kill_mon_exp_add/1,
    is_team_with_brothers/1,
    platform_cancel_register/1
]).


handle_info({save_group_id, GroupId}, PS) ->
    lib_role_kv:set_kv(PS#role_state.id, ?KEY_SWORN_GROUP_ID, GroupId),
    case GroupId of
        0 ->
            lib_sworn:remove_relation(PS#role_state.id),
            svr_title:deprive(PS#role_state.id, ?TITLE_ID_SWORN);
        _ ->
            lib_sworn:add_relation(PS#role_state.id, GroupId),
            ?TASK_EVENT(PS#role_state.id, 'add_sworn')
    end;
handle_info({transport_here, TargetRoleID}, PS) ->
    #role_state{id = RoleID, role_scene = #role_scene{scene_id = SceneID, line_id = LineID, x = X, y = Y}} = PS,
    lib_role_kv:set_kv(RoleID, ?KEY_SWORN_GATHER_TIME, time:unixtime()),
    lib_scene_api:change_scene_async(TargetRoleID, SceneID, LineID, X, Y);
handle_info(cancel_register_person, PS) ->
    #role_state{id = RoleID} = PS,
    {Registered, _} = check_platform_register(RoleID),
    do_cancel_register_person(RoleID, Registered);
handle_info(notify_sworn_title, PS) ->
    case lib_role_title:activate(PS, ?TITLE_ID_SWORN) of
        ok -> PS;
        {error, _} ->
            lib_role_title:refresh_title(PS, ?TITLE_ID_SWORN)
    end;
handle_info(_, _) ->
    ignore.


event(PS, {'timer', 'quarter_hour'}) ->
    update_personal_info(PS);
event(PS, {'kill_mon_in_dungeon', SceneId, MonId}) ->
    do_kill_monster(PS, SceneId, MonId);
event(_PS, _Event) ->
    ignore.

%%-------------------------lib_role回调----------------------------------
%% 初始化
init(PS) ->
    svr_sworn:get_person(PS#role_state.id),
    ok.


%% 下线保存
save(PS) ->
    update_personal_info(PS),
    svr_sworn:save_person_to_db(PS#role_state.id),
    ok.


%%--------------------------接口调用---------------------------------------
%% 获取结拜系统信息
info(PS) ->
    #role_state{id = RoleID} = PS,
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    case Group of
        undefined ->
            lib_role_kv:set_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
            skip;
        _ ->
            router_540:send_create_group_msg([RoleID], Group),
            ok
    end.

%% 发起结拜请求
create_new(PS) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    lib_role_func:is_active(RoleID, ?FUNC_ID_SWORN) orelse erlang:throw({error, ?RC_SWORN_FUNC_NOT_OPEN}),
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_SWORN_NO_TEAM});
        ConfData -> ConfData
    end,
    #{open_lv := OpenLv, num_limit := NumMax, confirm_cd1 := ConfirmCD, wangfuzi_pos := {WangScene, WangX, WangY}} = conf_sworn_base:get(),
    MemNum = length(Members),
    MemNum >= ?SWORN_MIN_NUM andalso MemNum =< NumMax orelse erlang:throw({error, ?RC_SWORN_INVALID_MEM_NUM}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    Func = fun(MemID, NameAcc) ->
        MemName = lib_cache:get_role_name(MemID),
        MemLv = lib_cache:get_role_level(MemID),
        lib_role:is_online(MemID) orelse erlang:throw({error, ?RC_SWORN_MEM_OFFLINE, [MemName]}),
        if
            MemID =:= RoleID ->
                {_, Reply} = is_in_range(PS, WangScene, WangX, WangY, ?SWORN_NPC_RANGE),
                Reply orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                {_, Reply1} = is_in_group(PS, 0),
                not Reply1 orelse erlang:throw({error, ?RC_SWORN_MEM_ALREADY_IN_GROUP, [MemName]});
            true ->
                lib_role:apply_call2(MemID, {?MODULE, is_in_range, [WangScene, WangX, WangY, ?SWORN_NPC_RANGE]}) orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                not lib_role:apply_call2(MemID, {?MODULE, is_in_group, [0]}) orelse erlang:throw({error, ?RC_SWORN_MEM_ALREADY_IN_GROUP, [MemName]})
        end,
        MemLv >= OpenLv orelse erlang:throw({error, ?RC_SWORN_MEM_LACK_OF_LV, [MemName]}),
        FriendList = lib_friend:get_friend_id_list(MemID),
        [begin
            TmpName = lib_cache:get_role_name(Rid),
            lists:member(Rid, FriendList) orelse erlang:throw({error, ?RC_SWORN_NOT_FRIENDS, [MemName, TmpName]}),
            not lib_mentor:is_mentor(Rid, MemID) orelse erlang:throw({error, ?RC_SWORN_ALREADY_MENTOR, [MemName, TmpName]}),
            not lib_marriage:is_married(Rid, MemID) orelse erlang:throw({error, ?RC_SWORN_ALREADY_MARRY, [MemName, TmpName]})
        end || Rid <- Members, Rid =/= MemID],
        [{MemID, MemName} | NameAcc]
    end,
    NameArr = lists:foldl(Func, [], Members),
    router_540:send_confirm_ui_special(Members, ?CONFIRM_TYPE_CREATE_NEW, NameArr, ConfirmCD),
    svr_sworn:confirm_start(?CONFIRM_TYPE_CREATE_NEW, TeamID, ?team_confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => Members, target_ids => Members}),
    ok.

%% 接纳新人请求
recruit_member(PS) ->
    #role_state{id = RoleID, name = RoleName, team_id = TeamID} = PS,
    lib_role_func:is_active(RoleID, ?FUNC_ID_SWORN) orelse erlang:throw({error, ?RC_SWORN_FUNC_NOT_OPEN}),
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_SWORN_NO_TEAM});
        ConfData -> ConfData
    end,
    #{open_lv := OpenLv, num_limit := NumMax, confirm_cd1 := ConfirmCD, duanfuzi_pos := {DuanScene, DuanX, DuanY}} = conf_sworn_base:get(),
    MemNum = length(Members),
    MemNum >= ?SWORN_MIN_NUM andalso MemNum =< NumMax orelse erlang:throw({error, ?RC_SWORN_INVALID_MEM_NUM}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList} = Group,
    MemNum < length(MemList) + 1 andalso erlang:throw({error, ?RC_SWORN_GROUP_MEM_NOT_ALL_HERE}),
    MemNum > length(MemList) + 1 andalso erlang:throw({error, ?RC_SWORN_OVER_NEW_MEMBER_NUM}),

    Func = fun(MemID, NotInAcc) ->
        MemName = lib_cache:get_role_name(MemID),
        lib_role:is_online(MemID) orelse erlang:throw({error, ?RC_SWORN_MEM_OFFLINE, [MemName]}),
        if
            MemID =:= RoleID ->
                {_, Reply} = is_in_range(PS, DuanScene, DuanX, DuanY, ?SWORN_NPC_RANGE),
                Reply orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                {_, Reply1} = is_in_group(PS, 0),
                case Reply1 of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end;
            true ->
                lib_role:apply_call2(MemID, {?MODULE, is_in_range, [DuanScene, DuanX, DuanY, ?SWORN_NPC_RANGE]}) orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                case lib_role:apply_call2(MemID, {?MODULE, is_in_group, [GroupID]}) of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end
        end
    end,
    NotInList = lists:foldl(Func, [], Members),
    NotInNum = length(NotInList),
    NotInNum =/= 0 orelse erlang:throw({error, ?RC_SWORN_NO_NEW_MEMBER}),
    NotInNum =:= 1 orelse erlang:throw({error, ?RC_SWORN_OVER_NEW_MEMBER_NUM}),
    [NotInRoleID] = NotInList,
    NotInName = lib_cache:get_role_name(NotInRoleID),
    NotInLv = lib_cache:get_role_level(NotInRoleID),
    NotInLv >= OpenLv orelse erlang:throw({error, ?RC_SWORN_MEM_LACK_OF_LV, [NotInName]}),
    FriendList = lib_friend:get_friend_id_list(NotInRoleID),
    [begin
        TmpName = lib_cache:get_role_name(Rid),
        lists:member(Rid, FriendList) orelse erlang:throw({error, ?RC_SWORN_NOT_FRIENDS, [NotInName, TmpName]}),
        not lib_mentor:is_mentor(Rid, NotInRoleID) orelse erlang:throw({error, ?RC_SWORN_ALREADY_MENTOR, [NotInName, TmpName]}),
        not lib_marriage:is_married(Rid, NotInRoleID) orelse erlang:throw({error, ?RC_SWORN_ALREADY_MARRY, [NotInName, TmpName]})
    end || Rid <- Members, Rid =/= NotInRoleID],
    Msg = io_lib:format(config:get_string(sworn_recruit_member_confirm), [RoleName, NotInName]),
    router_540:send_confirm_ui(Members, ?CONFIRM_TYPE_RECRUIT_MEMBER, Msg, ConfirmCD),
    svr_sworn:confirm_start(?CONFIRM_TYPE_RECRUIT_MEMBER, TeamID, ?team_confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => Members, target_ids => [NotInRoleID], group_id => GroupID}),
    ok.

%% 请离旧人发起
dismiss_member_req(PS) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    lib_role_func:is_active(RoleID, ?FUNC_ID_SWORN) orelse erlang:throw({error, ?RC_SWORN_FUNC_NOT_OPEN}),
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_SWORN_NO_TEAM});
        ConfData -> ConfData
    end,
    length(Members) >= ?SWORN_MIN_NUM orelse erlang:throw({error, ?RC_SWORN_DISMISS_LACK_MEM_NUM}),
    #{confirm_cd2 := ConfirmCD, duanfuzi_pos := {DuanScene, DuanX, DuanY}} = conf_sworn_base:get(),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    Func = fun(MemID, NotInAcc) ->
        MemName = lib_cache:get_role_name(MemID),
        lib_role:is_online(MemID) orelse erlang:throw({error, ?RC_SWORN_MEM_OFFLINE, [MemName]}),
        if
            MemID =:= RoleID ->
                {_, Reply} = is_in_range(PS, DuanScene, DuanX, DuanY, ?SWORN_NPC_RANGE),
                Reply orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                {_, Reply1} = is_in_group(PS, 0),
                case Reply1 of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end;
            true ->
                lib_role:apply_call2(MemID, {?MODULE, is_in_range, [DuanScene, DuanX, DuanY, ?SWORN_NPC_RANGE]}) orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                case lib_role:apply_call2(MemID, {?MODULE, is_in_group, [GroupID]}) of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end
        end
    end,
    NotInList = lists:foldl(Func, [], Members),
    length(NotInList) =:= 0 orelse erlang:throw({error, ?RC_SWORN_NOT_GROUP_MEMBER_EXIST}),
    svr_sworn:confirm_start(?CONFIRM_TYPE_DISMISS_MEMBER, TeamID, ?team_confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => [RoleID]}),
    ok.

%% 正式请离旧人
dismiss_member(PS, TargetRoleID, Reason) ->
    ReasonConf = conf_sworn_dismiss_reason:get(Reason),
    ReasonConf =/= undefined orelse erlang:throw({error, ?RC_SWORN_DISMISS_REASON_INVALID}),
    #{reason := ReasonStr} = ReasonConf,
    #role_state{id = RoleID, team_id = TeamID} = PS,
    #{confirm_cd1 := ConfirmCD} = conf_sworn_base:get(),
    #{members := Members} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_SWORN_NO_TEAM});
        ConfData -> ConfData
    end,
    #{members := ReqMems} = svr_sworn:get_confirm_data(?CONFIRM_TYPE_DISMISS_MEMBER, TeamID),
    lists:member(RoleID, ReqMems) orelse erlang:throw({error, ?RC_SWORN_NO_DISMISS_MEM_REQ}),
    MemName = lib_cache:get_role_name(TargetRoleID),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Msg = io_lib:format(config:get_string(sworn_dismiss_member_confirm), [MemName, ReasonStr]),
    router_540:send_confirm_ui(Members, ?CONFIRM_TYPE_DISMISS_MEMBER, Msg, ConfirmCD),
    svr_sworn:confirm_start(?CONFIRM_TYPE_DISMISS_MEMBER, TeamID, ?team_confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => Members, target_ids => [TargetRoleID], group_id => GroupID}),
    ok.

%% 主动离开结拜组
leave_group(PS) ->
    #role_state{id = RoleID} = PS,
    lib_role_func:is_active(RoleID, ?FUNC_ID_SWORN) orelse erlang:throw({error, ?RC_SWORN_FUNC_NOT_OPEN}),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList} = Group,
    lists:keymember(RoleID, #sworn_member.role_id, MemList) orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),

    delete_mem_logic(RoleID, Group),
    ok.

%% 修改辈分
change_senior(PS) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    lib_role_func:is_active(RoleID, ?FUNC_ID_SWORN) orelse erlang:throw({error, ?RC_SWORN_FUNC_NOT_OPEN}),
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_SWORN_NO_TEAM});
        ConfData -> ConfData
    end,
    #{num_limit := NumMax, confirm_cd1 := ConfirmCD, wangfuzi_pos := {WangScene, WangX, WangY}} = conf_sworn_base:get(),
    MemNum = length(Members),
    MemNum >= ?SWORN_MIN_NUM andalso MemNum =< NumMax orelse erlang:throw({error, ?RC_SWORN_INVALID_MEM_NUM}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList} = Group,
    MemNum =:= length(MemList) orelse erlang:throw({error, ?RC_SWORN_GROUP_MEM_NOT_ALL_HERE}),
    Func = fun(MemID, NotInAcc) ->
        MemName = lib_cache:get_role_name(MemID),
        lib_role:is_online(MemID) orelse erlang:throw({error, ?RC_SWORN_MEM_OFFLINE, [MemName]}),
        if
            MemID =:= RoleID ->
                {_, Reply} = is_in_range(PS, WangScene, WangX, WangY, ?SWORN_NPC_RANGE),
                Reply orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                {_, Reply1} = is_in_group(PS, 0),
                case Reply1 of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end;
            true ->
                lib_role:apply_call2(MemID, {?MODULE, is_in_range, [WangScene, WangX, WangY, ?SWORN_NPC_RANGE]}) orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                case lib_role:apply_call2(MemID, {?MODULE, is_in_group, [GroupID]}) of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end
        end
    end,
    NotInList = lists:foldl(Func, [], Members),
    length(NotInList) =:= 0 orelse erlang:throw({error, ?RC_SWORN_NOT_GROUP_MEMBER_EXIST}),
    Msg = config:get_string(sworn_change_senior_confirm),
    router_540:send_confirm_ui(Members, ?CONFIRM_TYPE_CHANGE_SENIOR, Msg, ConfirmCD),
    svr_sworn:confirm_start(?CONFIRM_TYPE_CHANGE_SENIOR, TeamID, ?team_confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => Members, target_ids => Members, group_id => GroupID}),
    ok.

%% 修改江湖名号发起
modify_name_req(PS) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    lib_role_func:is_active(RoleID, ?FUNC_ID_SWORN) orelse erlang:throw({error, ?RC_SWORN_FUNC_NOT_OPEN}),
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_SWORN_NO_TEAM});
        ConfData -> ConfData
    end,
    #{num_limit := NumMax, confirm_cd1 := ConfirmCD, wangfuzi_pos := {WangScene, WangX, WangY}} = conf_sworn_base:get(),
    MemNum = length(Members),
    MemNum >= ?SWORN_MIN_NUM andalso MemNum =< NumMax orelse erlang:throw({error, ?RC_SWORN_INVALID_MEM_NUM}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList} = Group,
    MemNum =:= length(MemList) orelse erlang:throw({error, ?RC_SWORN_GROUP_MEM_NOT_ALL_HERE}),
    Func = fun(MemID, NotInAcc) ->
        MemName = lib_cache:get_role_name(MemID),
        lib_role:is_online(MemID) orelse erlang:throw({error, ?RC_SWORN_MEM_OFFLINE, [MemName]}),
        if
            MemID =:= RoleID ->
                {_, Reply} = is_in_range(PS, WangScene, WangX, WangY, ?SWORN_NPC_RANGE),
                Reply orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                {_, Reply1} = is_in_group(PS, 0),
                case Reply1 of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end;
            true ->
                lib_role:apply_call2(MemID, {?MODULE, is_in_range, [WangScene, WangX, WangY, ?SWORN_NPC_RANGE]}) orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC, [MemName]}),
                case lib_role:apply_call2(MemID, {?MODULE, is_in_group, [GroupID]}) of
                    false -> [MemID | NotInAcc];
                    _ -> NotInAcc
                end
        end
    end,
    NotInList = lists:foldl(Func, [], Members),
    length(NotInList) =:= 0 orelse erlang:throw({error, ?RC_SWORN_NOT_GROUP_MEMBER_EXIST}),
    Msg = config:get_string(sworn_modify_name_req_confirm),
    router_540:send_confirm_ui(Members, ?CONFIRM_TYPE_CHANGE_NAME, Msg, ConfirmCD),
    svr_sworn:confirm_start(?CONFIRM_TYPE_CHANGE_NAME, TeamID, ?team_confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => Members, target_ids => Members, group_id => GroupID}),
    ok.

%% 正式修改结拜名号
modify_name(PS, NameHead, NameTail) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    ConfirmData = svr_sworn:get_confirm_data(?CONFIRM_TYPE_CHANGE_NAME, {leader, TeamID}),
    #{members := Members, target_ids := TargetIDs} = ConfirmData,
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    lists:member(RoleID, Members) orelse erlang:throw({error, ?RC_SWORN_NO_RIGHT_MODIFY_NAME}),
    validate_msg(binary_to_list(util:escape_varchar(NameHead)), 2),
    validate_msg(binary_to_list(util:escape_varchar(NameTail)), 1),
    NewName = io_lib:format("~s~s~s", [NameHead, ?NUMSTR(length(TargetIDs)), NameTail]),
    NewName =/= Group#sworn_group.name orelse erlang:throw({error, ?RC_SWORN_SAME_NAME}),
    #{modify_name_coin_cost := CoinCost} = conf_sworn_base:get(),
    Costs = [{?AST_COIN, CoinCost}],
    lib_role_assets:check_items_enough(PS, Costs),

    #sworn_group{members = MemList, params = Params} = Group,
    svr_sworn:clear_confirm_data(?CONFIRM_TYPE_CHANGE_NAME, TeamID),
    PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_SWORN_MODIFY_NAME),
    svr_sworn:update_group(Group#sworn_group{name = NewName, params = Params#{name_head => NameHead, name_tail => NameTail}}),
    router_540:send_group_name_update(TargetIDs, NewName),
    %% 更新场景里称号
    [lib_role:mod_info(MID, ?MODULE, notify_sworn_title) || #sworn_member{role_id = MID} <- MemList],
    {ok, PSN}.

%% 修改江湖字号
modify_word(PS, Word) ->
    #role_state{id = RoleID} = PS,
    util:check_action_limit({?MODULE, modify_word}, ?MODIFY_CDTIME),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{name = SwornName, members = MemList} = Group,
    SwornName =/= "" orelse erlang:throw({error, ?RC_SWORN_NAME_NOT_EXIST}),
    CurMem = util:list_find(RoleID, #sworn_member.role_id, MemList, undefined),
    CurMem =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_member{word = CurWord} = CurMem,
    CurWord =/= Word orelse erlang:throw({error, ?RC_SWORN_SAME_WORD}),
    validate_msg(binary_to_list(util:escape_varchar(Word)), 2),
    OtherMems = [begin
        OtherWord =/= Word orelse erlang:throw({error, ?RC_SWORN_SAME_OTHER_WORD}),
        RID
    end
        || #sworn_member{role_id = RID, word = OtherWord} <- MemList, RID =/= RoleID],
    CurMemN = CurMem#sworn_member{word = Word},
    MemListN = lists:keystore(RoleID, #sworn_member.role_id, MemList, CurMemN),
    svr_sworn:update_group(Group#sworn_group{members = MemListN}),
    router_540:send_member_update_msg(OtherMems, [CurMemN]),
    %% 更新场景里称号
    lib_role:mod_info(RoleID, ?MODULE, notify_sworn_title),
    {ok, PS}.

%% 提升称号品质
up_quality(PS) ->
    #role_state{id = RoleID} = PS,
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList, quality = Quality, sworn_value = SwornValue} = Group,
    Members = [MemID || #sworn_member{role_id = MemID} <- MemList],
    Quality < ?QUALITY_ORANGE orelse erlang:throw({error, ?RC_SWORN_REACH_TOP_QUALITY}),
    #{sworn_value_need := SwornValueNeed} = conf_sworn_quality:get(Quality),
    SwornValue >= SwornValueNeed orelse erlang:throw({error, ?RC_SWORN_LACK_OF_SWORN_VALUE}),
    NewQuality = Quality + 1,
    svr_sworn:update_group(Group#sworn_group{quality = NewQuality}),
    router_540:send_group_name_quality_update(Members, NewQuality),
    %% 更新场景里称号
    [lib_role:mod_info(MID, ?MODULE, notify_sworn_title) || #sworn_member{role_id = MID} <- MemList],
    ok.

%% 修改金兰宣言
modify_enounce(PS, Enounce) ->
    #role_state{id = RoleID} = PS,
    util:check_action_limit({?MODULE, modify_enounce}, ?MODIFY_CDTIME),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList} = Group,
    Members = [MemID || #sworn_member{role_id = MemID} <- MemList],
    #{sworn_word_limit := Limit} = conf_sworn_base:get(),
    validate_msg(binary_to_list(util:escape_varchar(Enounce)), 1, Limit),
    svr_sworn:update_group(Group#sworn_group{enounce = Enounce}),
    router_540:send_enounce_update(Members, Enounce),
    ok.

%% 召集成员
gather_member(PS) ->
    CurTime = time:unixtime(),
    #role_state{id = RoleID, name = RoleName, role_scene = #role_scene{scene_id = SceneID}} = PS,
    lib_role_func:is_active(RoleID, ?FUNC_ID_SWORN) orelse erlang:throw({error, ?RC_SWORN_FUNC_NOT_OPEN}),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList} = Group,
    #{confirm_cd2 := ConfirmCD, gather_cd := GatherCD} = conf_sworn_base:get(),
    GatherTime = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GATHER_TIME, 0),
    CurTime - GatherTime > GatherCD orelse erlang:throw({error, ?RC_SWORN_GATHER_CD_EXIST}),
    SceneType = lib_scene_api:get_scene_type(SceneID),
    SceneName = lib_scene_api:get_scene_name(SceneID),
    lists:member(SceneType, ?NORMAL_SCENE_TYPES) orelse erlang:throw({error, ?RC_SWORN_NEED_NORMAL_SCENE_ACT}),
    Msg = io_lib:format(config:get_string(sworn_gather_member_confirm), [RoleName, SceneName]),
    Members = [MemID || #sworn_member{role_id = MemID} <- MemList, MemID =/= RoleID],
    router_540:send_confirm_ui(Members, ?CONFIRM_TYPE_GATHER_MEMBERS, Msg, ConfirmCD),
    svr_sworn:confirm_start(?CONFIRM_TYPE_GATHER_MEMBERS, {group_id, GroupID}, ?team_confirm_data#{expire_time => time:unixtime() + ConfirmCD, members => Members, target_ids => [RoleID], group_id => GroupID}),
    ok.

%% 确认框作出选择确认
make_confirm(PS, Type, Choice) ->
    #role_state{id = RoleID, name = RoleName, team_id = TeamID, role_scene = #role_scene{scene_id = SceneID}} = PS,
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Key = ?iif(Type =:= ?CONFIRM_TYPE_GATHER_MEMBERS, {group_id, GroupID}, TeamID),
    ConfirmData = svr_sworn:get_confirm_data(Type, Key),
    #{members := Members, target_ids := TargetIDs, agree_list := AgreeList, group_id := GroupIDN} = ConfirmData,
    not lists:member(RoleID, AgreeList) orelse erlang:throw({error, ?RC_SWORN_ALREADY_CONFIRM}),
    lists:member(RoleID, Members) orelse erlang:throw({error, ?RC_SWORN_CANT_CONFIRM}),

    case Choice of
        ?CONFIRM_CHOICE_AGREE ->
            AgreeListN = [RoleID | AgreeList],
            case Type of
                ?CONFIRM_TYPE_GATHER_MEMBERS ->
                    SceneType = lib_scene_api:get_scene_type(SceneID),
                    lists:member(SceneType, ?NORMAL_SCENE_TYPES) orelse erlang:throw({error, ?RC_SWORN_NEED_NORMAL_SCENE_ACT}),
                    confirm_execute(PS, Type, TargetIDs, GroupIDN),
                    svr_sworn:confirm_start(Type, Key, ConfirmData#{agree_list => AgreeListN});
                _ ->
                    if
                        length(Members) =:= length(AgreeListN) ->
                            confirm_execute(PS, Type, TargetIDs, GroupIDN),
                            svr_sworn:clear_confirm_data(Type, Key);
                        true ->
                            svr_sworn:confirm_start(Type, Key, ConfirmData#{agree_list => AgreeListN})
                    end
            end;
        _ ->%% 反对
            case Type of
                ?CONFIRM_TYPE_GATHER_MEMBERS -> skip;
                _ ->
                    svr_sworn:clear_confirm_data(Type, Key),
                    router_540:send_confirm_cancel_msg(Members, Type, get_cancel_retcode(Type), [RoleName])
            end
    end,
    ok.

%% 投票改辈分
vote_senior(PS, TargetRoleID) ->
    #{vote_cd := ConfirmCD} = conf_sworn_base:get(),
    #role_state{id = RoleID} = PS,
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =/= undefined orelse erlang:throw({error, ?RC_SWORN_NOT_IN_GROUP}),
    #sworn_group{members = MemList} = Group,
    ChangeSeniorData = svr_sworn:get_change_senior_data(GroupID),
    #{expire_time := ExpireTime, members := Members, cur_senior := CurSenior, sorted_list := SortedList, raw_list := RawList, voted_list := VotedList} = ChangeSeniorData,
    lists:member(RoleID, Members) orelse erlang:throw({error, ?RC_SWORN_CANT_VOTE}),
    not lists:member(RoleID, VotedList) orelse erlang:throw({error, ?RC_SWORN_ALREADY_VOTE}),
    TargetSortInfo = util:list_find(TargetRoleID, #sworn_sort_info.role_id, RawList, undefined),
    TargetSortInfo =/= undefined orelse erlang:throw({error, ?RC_SWORN_VOTE_TARGET_INVALID}),
    #sworn_sort_info{votes = Votes} = TargetSortInfo,
    TargetSortInfoN = TargetSortInfo#sworn_sort_info{votes = Votes + 1},
    RawListN = lists:keystore(TargetRoleID, #sworn_sort_info.role_id, RawList, TargetSortInfoN),
    VotedListN = [RoleID | VotedList],
    {SortedList1, RawList1, Finish} = if
        length(VotedListN) =:= length(Members) ->
            SortFun = fun(#sworn_sort_info{role_id = RoleID1, votes = Votes1}, #sworn_sort_info{role_id = RoleID2, votes = Votes2}) ->
                Lv1 = lib_cache:get_role_level(RoleID1),
                Lv2 = lib_cache:get_role_level(RoleID2),
                if
                    Votes1 > Votes2 -> true;
                    true ->
                        if
                            Votes1 =:= Votes2 ->
                                if
                                    Lv1 > Lv2 -> true;
                                    true ->
                                        if
                                            Lv1 =:= Lv2 ->
                                                if
                                                    RoleID1 < RoleID2 -> true;
                                                    true -> false
                                                end;
                                            true -> false
                                        end
                                end;
                            true -> false
                        end
                end
            end,
            [SelectMem | RawListM] = lists:sort(SortFun, RawListN),
            SortedListN = [SelectMem#sworn_sort_info{senior = CurSenior} | SortedList],
            RawListMN = [RawInfo#sworn_sort_info{votes = 0} || RawInfo <- RawListM],
            {SortedListN, RawListMN, true};
        true -> {SortedList, RawListN, false}
    end,
    {CurSeniorN, ExpireTimeN, VotedListM, SortedList2, RawList2} = case Finish of
        true when length(Members) - 1 =:= CurSenior, length(RawList1) =:= 1 ->
            [RawTmp] = RawList1,
            {0, 0, [], [RawTmp#sworn_sort_info{senior = CurSenior + 1} | SortedList1], []};
        true ->
            {CurSenior + 1, time:unixtime() + ConfirmCD, [], SortedList1, RawList1};
        _ ->
            {CurSenior, ExpireTime, VotedListN, SortedList1, RawList1}
    end,
    ChangeSeniorDataN = ChangeSeniorData#{expire_time => ExpireTimeN, cur_senior => CurSeniorN, sorted_list => SortedList2, raw_list => RawList2, voted_list => VotedListM},
    if
        CurSeniorN =:= 0 andalso ExpireTimeN =:= 0 ->
            MemListN = [begin
                #sworn_sort_info{senior = Senior} = util:list_find(MID, #sworn_sort_info.role_id, SortedList2, #sworn_sort_info{}),
                Member#sworn_member{senior = Senior}
            end || #sworn_member{role_id = MID} = Member <- MemList],
            svr_sworn:update_group(Group#sworn_group{members = MemListN}),
            router_540:send_member_update_msg(Members, MemListN),
            svr_sworn:clear_change_senior_data(GroupID);
        true ->
            svr_sworn:change_senior_start(GroupID, ChangeSeniorDataN)
    end,
    router_540:send_change_senior_ui(Members, ChangeSeniorDataN),
    ok.

%% 获取一批结拜平台信息
get_platform_list(PS, Type) ->
    #role_state{id = RoleID} = PS,
    GreetNum = lib_role_kv:get_kv(RoleID, ?KEY_DAILY_SWORN_GREET_NUM, 0),
    {Registered, _} = check_platform_register(RoleID),
    {PersonList, GroupList} = case Type of
        ?SWORN_PLATFORM_PERSON ->
            util:check_action_limit({?MODULE, get_person}, ?PLATFORM_CDTIME),
            {svr_sworn:get_rand_persons(RoleID, ?PLATFORM_PERSON_PAGE_NUM), []};
        ?SWORN_PLATFORM_GROUP ->
            util:check_action_limit({?MODULE, get_group}, ?PLATFORM_CDTIME),
            {[], svr_sworn:get_rand_reg_groups(RoleID, ?PLATFORM_GROUP_PAGE_NUM)};
        _ -> {[], []}
    end,

    PersonListN = [#sworn_person_plat{
        role_id = PID,
        name = PName,
        title_honor = PTitleHonor,
        lv = PLv,
        career = PCareer,
        icon = PIcon,
        frame = Frame,
        guild_name = PGuildName,
        tend_career = PTendCareer,
        tend_lv = PTendLv,
        tend_time = PTendTime
    } || #sworn_person{
        role_id = PID,
        name = PName,
        lv = PLv,
        icon = PIcon,
        frame = Frame,
        career = PCareer,
        title_honor = PTitleHonor,
        guild_name = PGuildName,
        tend_career = PTendCareer,
        tend_lv = PTendLv,
        tend_time = PTendTime
    } <- PersonList],
    GroupListN = [
        begin
            MemListPlat = [#sworn_member_simple{
                role_id = RID,
                name = MName,
                lv = MLv,
                career = MCareer,
                gender = MGender
            } || #sworn_member{
                role_id = RID,
                name = MName,
                lv = MLv,
                career = MCareer,
                gender = MGender
            } <- MemList],
            #sworn_group_plat{
                group_id = GroupIDT,
                mem_list = MemListPlat,
                sworn_value = SwornValue,
                tend_career = TendCareer,
                tend_lv = TendLv,
                tend_time = TendTime
            }
        end
        || #sworn_group{
            group_id = GroupIDT,
            members = MemList,
            tend_career = TendCareer,
            tend_lv = TendLv,
            tend_time = TendTime,
            sworn_value = SwornValue
        } <- GroupList],
    MsgRecord = #sc_sworn_get_platform_list{
        registered = Registered,
        greet_num = GreetNum,
        person_list = PersonListN,
        group_list = GroupListN
    },
    {ok, MsgRecord}.

%% 平台报名登记结拜
platform_register(PS, TendCareer, TendLv, TendTime) ->
    #{num_limit := NumLimit} = conf_sworn_base:get(),
    #role_state{id = RoleID, name = RoleName, level = Lv, career = Career, guild_name = GuildName, personal = #{icon := Icon, title_honor := TitleHonor, frame := Frame}} = PS,
    {RegisteredN, Group} = check_platform_register(RoleID),
    RegisteredN =/= ?PLATFORM_REGISTERED orelse erlang:throw({error, ?RC_SWORN_ALREADY_REGISTER}),
    Members = case Group of
        #sworn_group{members = MemList} ->
            length(MemList) < NumLimit orelse erlang:throw({error, ?RC_SWORN_GROUP_FULL_MEMBERS}),
            svr_sworn:update_group(Group#sworn_group{tend_career = TendCareer, tend_lv = TendLv, tend_time = TendTime, registered = ?PLATFORM_REGISTERED}),
            [RID || #sworn_member{role_id = RID} <- MemList];
        undefined ->
            Person = #sworn_person{
                role_id = RoleID,
                name = RoleName,
                lv = Lv,
                icon = Icon,
                frame = Frame,
                career = Career,
                title_honor = TitleHonor,
                guild_name = GuildName,
                tend_career = TendCareer,
                tend_lv = TendLv,
                tend_time = TendTime
            },
            svr_sworn:register_person(Person),
            [RoleID]
    end,
    router_540:send_register_button_update(Members, ?PLATFORM_REGISTERED),
    ok.

%% 取消个人或者结拜组的报名
platform_cancel_register(PS) ->
    #role_state{id = RoleID} = PS,
    {Registered, Group} = check_platform_register(RoleID),
    Registered =:= ?PLATFORM_REGISTERED orelse erlang:throw({error, ?RC_SWORN_NOT_REGISTERED}),
    case Group of
        undefined -> do_cancel_register_person(RoleID, Registered);
        _ -> do_cancel_register_group(Registered, Group, [])
    end,
    ok.

%% 打招呼
greet(PS, Type, Id) ->
    CurTime = time:unixtime(),
    #role_state{id = RoleID, server_num = SvrNum} = PS,
    util:check_action_limit({?MODULE, greet}, ?GREET_CDTIME),
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    Group =:= undefined orelse erlang:throw({error, ?RC_SWORN_ALREADY_IN_GROUP}),
    GreetNum = lib_role_kv:get_kv(RoleID, ?KEY_DAILY_SWORN_GREET_NUM, 0),
    #{daily_greet_num := DailyGreetNum} = conf_sworn_base:get(),
    GreetNum < DailyGreetNum orelse erlang:throw({error, ?RC_SWORN_GREET_NUM_DAILY_LIMIT}),
    #{person_cd := PersonCD, group_cd := GroupCD} = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GREET_TIME, #{person_cd => [], group_cd => []}),
    {TargetIDs, GreetTimeParam} = case Type of
        ?SWORN_PLATFORM_PERSON ->
            Person = svr_sworn:get_person(Id),
            case Person of
                undefined -> erlang:throw({error, ?RC_SWORN_GREET_TARGET_NOT_EXIST});
                #sworn_person{} ->
                    {_, GreetTime} = util:list_find(Id, 1, PersonCD, {Id, 0}),
                    CurTime - GreetTime > ?GREET_SAME_TARGET_CDTIME orelse erlang:throw({error, ?RC_SWORN_GREET_CD_EXIST}),
                    {[Id], #{person_cd => lists:keystore(Id, 1, PersonCD, {Id, CurTime}), group_cd => GroupCD}}
            end;
        _ ->
            TargetGroup = svr_sworn:get_group(Id),
            case TargetGroup of
                undefined -> erlang:throw({error, ?RC_SWORN_GREET_TARGET_NOT_EXIST});
                #sworn_group{members = MemList} ->
                    {_, GreetTime} = util:list_find(Id, 1, GroupCD, {Id, 0}),
                    CurTime - GreetTime > ?GREET_SAME_TARGET_CDTIME orelse erlang:throw({error, ?RC_SWORN_GREET_CD_EXIST}),
                    {[RID || #sworn_member{role_id = RID} <- MemList], #{person_cd => PersonCD, group_cd => lists:keystore(Id, 1, GroupCD, {Id, CurTime})}}
            end
    end,
    lib_role_kv:set_kv(RoleID, ?KEY_SWORN_GREET_TIME, GreetTimeParam),
    ChatStr = config:get_string(sworn_greet_msg),
    [greet_send_msg(PS, {TargetID, SvrNum}, ChatStr) || TargetID <- TargetIDs],
    GreetNumN = GreetNum + 1,
    lib_role_kv:set_kv(RoleID, ?KEY_DAILY_SWORN_GREET_NUM, GreetNumN),
    {ok, GreetNumN}.

%%------------------------------------public----------------------------------------------------
%% @doc 增加结拜组的金兰值
add_sworn_value(PS, AddValue) ->
    #role_state{id = RoleID} = PS,
    CurGroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    CurGroup = svr_sworn:get_group(CurGroupID),
    case CurGroup of
        #sworn_group{members = MemList, sworn_value = SwornValue} ->
            SwornValueN = SwornValue + AddValue,
            svr_sworn:update_group(CurGroup#sworn_group{sworn_value = SwornValueN}),
            Members = [RID || #sworn_member{role_id = RID} <- MemList],
            router_540:send_sworn_value_update(Members, SwornValueN);
        undefined -> skip
    end.

%% @doc 是否已经结拜了
is_sworn(RoleID) ->
    CurGroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    CurGroup = svr_sworn:get_group(CurGroupID),
    CurGroup =/= undefined.

%% @doc 是否与别人结拜了
is_sworn(RoleID, TargetRoleID) ->
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    case Group of
        #sworn_group{members = MemList} ->
            lists:keymember(TargetRoleID, #sworn_member.role_id, MemList);
        undefined -> false
    end.

%% @doc 获取结拜称号，整合师徒称号
get_sworn_name(RoleID, Title) ->
    if
        Title =:= ?TITLE_ID_SWORN ->
            CurGroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
            CurGroup = svr_sworn:get_group(CurGroupID),
            case CurGroup of
                #sworn_group{name = Name, quality = Quality, members = MemList} ->
                    SwornMem = util:list_find(RoleID, #sworn_member.role_id, MemList, #sworn_member{}),
                    #{fix_word := FixWord} = conf_sworn_base:get(),
                    {io_lib:format("~s~s~s", [Name, FixWord, SwornMem#sworn_member.word]), Quality};
                undefined -> {"", 0}
            end;
        Title =:= ?TITLE_ID_NORMAL_TUDI orelse Title =:= ?TITLE_ID_SENIOR_TUDI ->
            {lib_role_mentor:get_mentor_title_extra(RoleID), 0};
        true -> {"", 0}
    end.

%% @doc 是否和结拜组成员一起组队
is_team_with_brothers(#role_state{id = RoleID, team_id = TeamID} = _PS) when TeamID > 0 ->
    CurGroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    CurGroup = svr_sworn:get_group(CurGroupID),
    #{members := Members} = case lib_team:get_team_info(TeamID) of
        undefined -> #{members => []};
        TeamInfo -> TeamInfo
    end,
    case CurGroup of
        #sworn_group{members = MemList} when length(Members) >= 2 ->
            Pred = fun(MID) ->
                MID =/= RoleID andalso lists:keymember(MID, #sworn_member.role_id, MemList)
            end,
            lists:any(Pred, Members);
        _ -> false
    end;
is_team_with_brothers(_PS) ->
    false.

%% @doc 获取组队打怪经验加成
get_kill_mon_exp_add(#role_state{id = RoleID} = PS) ->
    IsWithBro = is_team_with_brothers(PS),
    if
        IsWithBro ->
            CurGroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
            CurGroup = svr_sworn:get_group(CurGroupID),
            #{exp_add := ExpAdd} = conf_sworn_exp_add:get(CurGroup#sworn_group.sworn_value),
            ExpAdd;
        true -> 0
    end.

%%------------------------------------private----------------------------------------------------
%% 确认窗口执行逻辑
confirm_execute(PS, Type, TargetIDs, CurGroupID) ->
    CurTime = time:unixtime(),
    #role_state{id = RoleID, team_id = TeamID} = PS,
    #{num_limit := NumLimit, vote_cd := ConfirmCD} = conf_sworn_base:get(),
    CurGroup = svr_sworn:get_group(CurGroupID),
    CurTeam = svr_team_mgr:get_team_info(TeamID),
%%    Number = length(TargetIDs),
    case Type of
        ?CONFIRM_TYPE_CREATE_NEW ->
%%            WordList = get_rand_word(Number),
            MemList = [begin
                #{name := Name, career := Career, gender := Sex, level := Level, frame := Frame,
                    icon := Icon, title_honor := TitleHonor} = lib_cache:get_role_view(MemID),
                #{scene := Scene} = lib_cache:get_role_base(MemID),
                #sworn_member{
                    role_id = MemID,
                    name = Name,
                    title_honor = TitleHonor,
                    lv = Level,
                    career = Career,
                    gender = Sex,
                    icon = Icon,
                    frame = Frame,
                    senior = 0,
                    word = "",
                    scene = Scene
                }
            end || MemID <- TargetIDs],
            SortFun = fun(#sworn_member{role_id = RoleID1, lv = Lv1}, #sworn_member{role_id = RoleID2, lv = Lv2}) ->
                if
                    Lv1 > Lv2 -> true;
                    true ->
                        if
                            Lv1 =:= Lv2 ->
                                if
                                    RoleID1 < RoleID2 -> true;
                                    true -> false
                                end;
                            true -> false
                        end
                end
            end,
            MemListN = lists:sort(SortFun, MemList),
            Func = fun(Index, {MemListAcc, NameAcc}) ->
                Member = lists:nth(Index, MemListN),
                lib_role:mod_info(Member#sworn_member.role_id, ?MODULE, cancel_register_person),
                MemberN = Member#sworn_member{senior = Index},
                MemName = io_lib:format("[~s]", [Member#sworn_member.name]),
                {[MemberN | MemListAcc], [{Member#sworn_member.role_id, MemName} | NameAcc]}
            end,
            {MemListM, NameList} = lists:foldl(Func, {[], []}, lists:seq(1, length(MemListN))),
            NameAccStr = get_name_concat_str(<<",">>, NameList, ""),
%%            {Name, NameHead, NameTail} = get_rand_name(Number),
            Group = #sworn_group{
%%                name = Name,
                quality = ?QUALITY_WHITE,
                members = MemListM,
                enounce = config:get_string(sworn_default_enounce),
                last_update_time = CurTime
%%                params = ?sworn_params#{name_head => NameHead, name_tail => NameTail}
            },
            GroupID = svr_sworn:create_group(Group),
            [lib_role:mod_info(MemID, ?MODULE, {save_group_id, GroupID}) || MemID <- TargetIDs],
            GroupN = Group#sworn_group{group_id = GroupID},
            router_540:send_create_group_msg(TargetIDs, GroupN, ?OPEN_UI),
            %% 发送结拜传闻
            svr_rumor:publish(world, ?RUMOR_SWORN_CREATE, [NameAccStr]),
            %% 结拜群相关
            [LeaderId | LeftMemIdList] = TargetIDs,
            ID = svr_friend:create_group(LeaderId, ?GROUP_TYPE_BROTHER, config:get_string(sworn_friend_group), ""),
            svr_friend:join_in_sys_group(ID, LeftMemIdList);
        ?CONFIRM_TYPE_RECRUIT_MEMBER when CurGroup =/= undefined ->
            #sworn_group{group_id = GroupID, members = MemList, params = #{name_head := NameHead, name_tail := NameTail}} = CurGroup,
            Func = fun(#sworn_member{role_id = RID, word = Word}, {MemIDAcc, MemWordAcc}) ->
                {[RID | MemIDAcc], [Word | MemWordAcc]}
            end,
            {Members, _WordArr} = lists:foldl(Func, {[], []}, MemList),
            [NewMemID] = TargetIDs,
            #{name := Name, career := Career, gender := Sex, level := Level, frame := Frame,
                icon := Icon, title_honor := TitleHonor} = lib_cache:get_role_view(NewMemID),
            #{scene := Scene} = lib_cache:get_role_base(NewMemID),
            NewMem = #sworn_member{
                role_id = NewMemID,
                name = Name,
                title_honor = TitleHonor,
                lv = Level,
                career = Career,
                gender = Sex,
                icon = Icon,
                frame = Frame,
                senior = 0,
%%                word = lists:nth(1, get_rand_word(1, WordArr)),
                scene = Scene
            },
            MemListN = lists:keystore(NewMemID, #sworn_member.role_id, MemList, NewMem),
            MemListM = [begin
                Member = lists:nth(Index, MemListN),
                Member#sworn_member{senior = Index}
            end || Index <- lists:seq(1, length(MemListN))],
            NewName = ?iif(CurGroup#sworn_group.name =/= "", io_lib:format("~s~s~s", [NameHead, ?NUMSTR(length(MemListM)), NameTail]), ""),
            GroupN = CurGroup#sworn_group{name = NewName, members = MemListM},
            svr_sworn:update_group(GroupN),
            router_540:send_member_update_msg(Members, MemListM),
            lib_role:mod_info(NewMemID, ?MODULE, cancel_register_person),
            lib_role:mod_info(NewMemID, ?MODULE, {save_group_id, GroupID}),
            router_540:send_create_group_msg([NewMemID], GroupN, ?OPEN_UI),
            GroupN#sworn_group.name =/= "" andalso begin
                [lib_role:mod_info(Mid, ?MODULE, notify_sworn_title) || Mid <- [NewMemID | Members]],
                router_540:send_group_name_update(Members, NewName)
            end,
            [OneMemID | _] = Members,
            FriendInfo = lib_friend:get_role_friend(OneMemID),
            #role_friend{group_id_list = GroupIdList} = FriendInfo,
            [begin
                FriendGroup = lib_friend:get_group(FriendGroupID),
                FriendGroup#group.type =:= ?GROUP_TYPE_BROTHER andalso svr_friend:join_in_sys_group(FriendGroupID, [NewMemID])
            end || FriendGroupID <- GroupIdList],
            length(MemListM) =:= NumLimit andalso begin
                {Registered, Group} = check_platform_register(RoleID),
                do_cancel_register_group(Registered, Group, [NewMemID])
            end;
        ?CONFIRM_TYPE_DISMISS_MEMBER when CurGroup =/= undefined ->
            [DismissMemID] = TargetIDs,
            delete_mem_logic(DismissMemID, CurGroup);
        ?CONFIRM_TYPE_CHANGE_SENIOR when CurGroup =/= undefined ->
            #sworn_group{group_id = GroupID, members = MemList} = CurGroup,
            RawList = [#sworn_sort_info{role_id = MID, name = MName, icon = MIcon, frame = Frame} || #sworn_member{role_id = MID, name = MName, icon = MIcon, frame = Frame} <- MemList],
            ChangeSeniorData = ?change_senior_data#{
                expire_time => CurTime + ConfirmCD,
                members => TargetIDs,
                cur_senior => ?SWORN_SENIOR_MIN,
                raw_list => RawList
            },
            svr_sworn:change_senior_start(GroupID, ChangeSeniorData),
            router_540:send_change_senior_ui(TargetIDs, ChangeSeniorData);
        ?CONFIRM_TYPE_CHANGE_NAME when CurGroup =/= undefined, CurTeam =/= undefined ->
            #{leader := Leader} = CurTeam,
            router_540:send_change_group_name_ui(Leader),
            svr_sworn:confirm_start(?CONFIRM_TYPE_CHANGE_NAME, {leader, TeamID}, ?team_confirm_data#{expire_time => time:unixtime() + ?SWORN_CHANGE_NAME_CD, members => [Leader], target_ids => TargetIDs});
        ?CONFIRM_TYPE_GATHER_MEMBERS when CurGroup =/= undefined ->
            [TargetID] = TargetIDs,
            lib_role:mod_info(TargetID, ?MODULE, {transport_here, RoleID});
        _ -> skip
    end.

%% 把某成员从结拜组中删除
delete_mem_logic(RoleID, Group) ->
    #sworn_group{group_id = GroupID, members = MemList, sworn_value = SwornValue, registered = Registered,
        params = #{name_head := NameHead, name_tail := NameTail}} = Group,
    MemListN = lists:keydelete(RoleID, #sworn_member.role_id, MemList),
    Func = fun(#sworn_member{role_id = MemId}) ->
        MemId
    end,
    MemIdList = lists:map(Func, MemListN),
    #{sworn_value_cost := {OverValue, CostValue}} = conf_sworn_base:get(),
    RoleFriend = lib_friend:get_role_friend(RoleID),
    #role_friend{group_id_list = GroupIdList} = RoleFriend,

    case length(MemListN) of
        1 ->    %% 解散结拜组和结拜群
            [lib_role:mod_info(MID, ?MODULE, {save_group_id, 0}) || MID <- [RoleID | MemIdList]],
            do_cancel_register_group(Registered, Group, []),
            svr_sworn:delete_group(GroupID),
            router_540:send_leave_group_msg([RoleID | MemIdList]),
            [begin
                FriendGroup = lib_friend:get_group(FriendGroupId),
                FriendGroup#group.type =:= ?GROUP_TYPE_BROTHER andalso svr_friend:dismiss_group(RoleID, FriendGroupId, true)
            end || FriendGroupId <- GroupIdList];
        _ ->    %% 当事人删除结拜群，其他更新结拜群
            router_540:send_leave_group_msg([RoleID]),
            lib_role:mod_info(RoleID, ?MODULE, {save_group_id, 0}),
            SwornValueN = if
                SwornValue > OverValue -> SwornValue - CostValue;
                true -> SwornValue
            end,
            MemListM = [begin
                Member = lists:nth(Index, MemListN),
                Member#sworn_member{senior = Index}
            end || Index <- lists:seq(1, length(MemListN))],
            NewName = ?iif(Group#sworn_group.name =/= "", io_lib:format("~s~s~s", [NameHead, ?NUMSTR(length(MemListM)), NameTail]), ""),
            GroupN = Group#sworn_group{name = NewName, members = MemListM, sworn_value = SwornValueN},
            svr_sworn:update_group(GroupN),
            router_540:send_member_del_msg(MemIdList, RoleID, SwornValueN),
            GroupN#sworn_group.name =/= "" andalso begin
                [lib_role:mod_info(MID, ?MODULE, notify_sworn_title) || MID <- MemIdList],
                router_540:send_group_name_update(MemIdList, NewName)
            end,
            [begin
                FriendGroup = lib_friend:get_group(FriendGroupId),
                FriendGroup =/= undefined andalso FriendGroup#group.type =:= ?GROUP_TYPE_BROTHER andalso begin
                    if
                        length(FriendGroup#group.mem_list) =< 1 ->
                            svr_friend:dismiss_group(RoleID, FriendGroupId, true);
                        true ->
                            svr_friend:leave_sys_group(RoleID, FriendGroupId)
                    end
                end
            end || FriendGroupId <- GroupIdList]
    end.

%% 更新结拜组个人信息
update_personal_info(PS) ->
    #role_state{id = RoleID, name = Name, level = Level, guild_name = GuildName, career = Career, gender = Sex, personal = #{icon := Icon, title_honor := TitleHonor, frame := Frame},
        role_scene = #role_scene{scene_id = Scene}} = PS,
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    case Group of
        #sworn_group{members = MemList} ->
            Members = [RID || #sworn_member{role_id = RID} <- MemList, RID =/= RoleID],
            CurMem = util:list_find(RoleID, #sworn_member.role_id, MemList, undefined),
            case CurMem of
                #sworn_member{} ->
                    CurMemN = CurMem#sworn_member{
                        name = Name,
                        title_honor = TitleHonor,
                        lv = Level,
                        career = Career,
                        gender = Sex,
                        icon = Icon,
                        frame = Frame,
                        scene = Scene
                    },
                    MemListN = lists:keystore(RoleID, #sworn_member.role_id, MemList, CurMemN),
                    svr_sworn:update_group(Group#sworn_group{members = MemListN}),
                    router_540:send_member_update_msg(Members, [CurMemN]);
                undefined -> skip
            end;
        undefined -> skip
    end,

    Person = svr_sworn:get_person(RoleID),
    case Person of
        #sworn_person{} ->
            PersonN = Person#sworn_person{
                role_id = RoleID,
                name = Name,
                lv = Level,
                icon = Icon,
                frame = Frame,
                career = Career,
                title_honor = TitleHonor,
                guild_name = GuildName
            },
            svr_sworn:register_person(PersonN);
        undefined -> skip
    end,
    ok.

%% 检查是否平台报名了
check_platform_register(RoleID) ->
    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    Group = svr_sworn:get_group(GroupID),
    case Group of
        #sworn_group{registered = Registered} -> {Registered, Group};
        undefined ->
            Person = svr_sworn:get_person(RoleID),
            case Person of
                #sworn_person{} -> {?PLATFORM_REGISTERED, undefined};
                undefined -> {0, undefined}
            end
    end.

%% 删除相关报名信息
do_cancel_register_person(RoleID, Register) ->
    case Register of
        ?PLATFORM_REGISTERED ->
            svr_sworn:delete_person(RoleID),
            router_540:send_register_button_update([RoleID], 0);
        _ -> skip
    end.

do_cancel_register_group(Register, Group, ExcepList) ->
    case Register of
        ?PLATFORM_REGISTERED ->
            case Group of
                #sworn_group{members = MemList} ->
                    svr_sworn:update_group(Group#sworn_group{tend_time = 0, tend_lv = 0, tend_career = 0, registered = 0}),
                    Members = [RID || #sworn_member{role_id = RID} <- MemList, not lists:member(RID, ExcepList)],
                    router_540:send_register_button_update(Members, 0);
                undefined -> skip
            end;
        _ -> skip
    end.

do_kill_monster(PS, SceneId, _MonID) ->
    ZeroTime = time:unixdate(),
    #role_state{id = RoleID, team_id = TeamID} = PS,
    #{dungeon_id_list := DungeonIdList, daily_sworn_value := DailySwornValue} = conf_sworn_base:get(),
    case lists:member(SceneId, DungeonIdList) of
        true ->
            case svr_team_mgr:get_team_info(TeamID) of
                #{members := Members} ->
                    GroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
                    Group = svr_sworn:get_group(GroupID),
                    case Group of
                        #sworn_group{members = MemList, params = Params} ->
                            #{last_add_sworn_value_time := LastTime, daily_sworn_value_get := DailyGet} = Params,
                            DailyGetN = ?iif(LastTime < ZeroTime, 0, DailyGet),
                            if
                                DailyGetN < DailySwornValue ->
                                    Func = fun(#sworn_member{role_id = RID}) ->
                                        lists:member(RID, Members)
                                    end,
                                    MemListN = lists:filter(Func, MemList),
                                    {LastTimeN, DailyGetM} = if
                                        length(MemListN) > 1 ->
                                            #{sworn_value := AddValue} = conf_sworn_value_get:get(length(MemListN)),
                                            add_sworn_value(PS, AddValue),
                                            {time:unixtime(), DailyGetN + AddValue};
                                        true -> {LastTime, DailyGetN}
                                    end,
                                    GroupN = svr_sworn:get_group(GroupID),
                                    svr_sworn:update_group(GroupN#sworn_group{params = Params#{last_add_sworn_value_time => LastTimeN, daily_sworn_value_get => DailyGetM}});
                                true -> skip
                            end;
                        undefined -> skip
                    end;
                undefined -> skip
            end;
        false -> skip
    end.

%% 打招呼发送消息
greet_send_msg(PS, Target, Content) ->
    greet_send_msg(PS, Target, Content, "").

greet_send_msg(PS, Target, Content, Extra) ->
    #role_state{id = RoleID, server_num = SvrNum} = PS,
    {TRoleID, TSvrNum} = Target,
    Cross = util_svr:is_cross(SvrNum, TSvrNum),
    Sender = lib_role_chat:format_sender(PS),
    NewData = lib_role_chat:get_role_data(RoleID),
    lib_role_chat:update_role_data(RoleID, NewData),
    Rec = #sc_chat_private_notify{
        content = Content, sender = Sender, extra = Extra,
        time = time:unixtime()
    },
    {ok, Bin} = prot_msg:encode_msg(40208, Rec),
    lib_role_chat:send_to_channel(?CHAT_CHANNEL_PRIVATE, PS, Cross, Target, Bin),
    #{name := Name, career := Career, gender := Sex, level := Level, frame := Frame, bubble := Bubble,
        icon := Icon} = lib_cache:get_role_view(TRoleID),
    TargetInfo = #clt_chat_role{
        id = TRoleID,
        name = Name,
        svr_num = TSvrNum,
        career = Career,
        gender = Sex,
        level = Level,
        icon = Icon,
        frame = Frame,
        bubble = Bubble
    },
    Rec1 = #sc_chat_private{
        target = TargetInfo, content = Content, extra = Extra
    },
    {ok, Bin1} = prot_msg:encode_msg(40206, Rec1),
    lib_role_send:send_to_role(PS, Bin1),
    Cross orelse svr_chat:private_chat(RoleID, TRoleID, Content, "", 0, Extra).

%% 玩家是否在指定范围之内
is_in_range(PS, DesScene, DesX, DesY, Range) ->
    #role_state{role_scene = #role_scene{scene_id = SceneID, x = X, y = Y}} = PS,
    Reply = if
        SceneID =:= DesScene ->
            lib_battle_chk:check_distance({X, Y}, {DesX, DesY}, Range);
%%            math:pow(X-DesX, 2) + math:pow(Y-DesY, 2) =< math:pow(Range, 2);
        true -> false
    end,
    {ok, Reply}.

%% 玩家是否在结拜组中
is_in_group(PS, GroupID) ->
    #role_state{id = RoleID} = PS,
    CurGroupID = lib_role_kv:get_kv(RoleID, ?KEY_SWORN_GROUP_ID, 0),
    GroupIDN = case GroupID of
        0 -> CurGroupID;
        _ -> GroupID
    end,
    Group = svr_sworn:get_group(GroupIDN),
    Reply = Group =/= undefined andalso CurGroupID =:= GroupIDN,
    {ok, Reply}.

%% 获取取消确认时对应的错误提示码
get_cancel_retcode(?CONFIRM_TYPE_CREATE_NEW) ->
    ?RC_SWORN_REFUSE_CREATE;
get_cancel_retcode(?CONFIRM_TYPE_RECRUIT_MEMBER) ->
    ?RC_SWORN_REFUSE_RECRUIT_MEMBER;
get_cancel_retcode(?CONFIRM_TYPE_DISMISS_MEMBER) ->
    ?RC_SWORN_REFUSE_DISMISS_MEMBER;
get_cancel_retcode(?CONFIRM_TYPE_CHANGE_SENIOR) ->
    ?RC_SWORN_REFUSE_CHANGE_SENIOR;
get_cancel_retcode(?CONFIRM_TYPE_CHANGE_NAME) ->
    ?RC_SWORN_REFUSE_CHANGE_NAME;
get_cancel_retcode(_) ->
    ?RC_FAILED.

%% 获取随机名号
%%get_rand_name(Number) ->
%%    NameHeadRand = util:rand(1, conf_sworn_name_head:length()),
%%    #{name_head := NameHead} = conf_sworn_name_head:get(NameHeadRand),
%%    NameTailRand = util:rand(1, conf_sworn_name_tail:length()),
%%    #{name_tail := NameTail} = conf_sworn_name_tail:get(NameTailRand),
%%    {io_lib:format("~s~s~s", [NameHead, ?NUMSTR(Number), NameTail]), NameHead, NameTail}.

%% 获取随机字号
%%get_rand_word(Number) ->
%%    get_rand_word(Number, []).
%%
%%get_rand_word(Number, ExpList) ->
%%    Func = fun(Index) ->
%%                #{word := Word} = conf_sworn_rand_word:get(Index),
%%                not lists:member(Word, ExpList)
%%           end,
%%    IndexList = lists:filter(Func, lists:seq(1, conf_sworn_rand_word:length())),
%%    RandList = util:list_rand_n(IndexList, Number),
%%    Func1 = fun(Rand) ->
%%                #{word := Word} = conf_sworn_rand_word:get(Rand),
%%                Word
%%           end,
%%    lists:map(Func1, RandList).

%% 获取连接字符串，翻转原list
get_name_concat_str(_Token, [{_, T}], AccStr) ->
    io_lib:format("~s~s", [AccStr, T]);
get_name_concat_str(Token, [{_, H} | T], AccStr) ->
    AccStrN = io_lib:format("~s~s", [AccStr, H]),
    get_name_concat_str(Token, T, io_lib:format("~s~s", [AccStrN, Token])).

%% 检查内容合法性
validate_msg(Msg, Len) ->
    validate_msg(Msg, Len, Len).

validate_msg(Msg, Len1, Len2) ->
    validate_msg_sub(len, Msg, Len1, Len2),
    validate_msg_sub(keyword, Msg).

%% 检测长度
validate_msg_sub(len, Msg, Len1, Len2) ->
    case util:check_length(Msg, Len1, Len2) of
        false -> throw({error, ?RC_SWORN_MSG_LEN_INVALID});
        true -> true
    end.

%% 检测关键字
validate_msg_sub(keyword, Msg) ->
    case util:check_filter(Msg) of
        false -> true;
        _ -> throw({error, ?RC_SWORN_MSG_SENSITIVE})
    end.
