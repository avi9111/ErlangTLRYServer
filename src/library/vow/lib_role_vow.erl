%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     众里寻卿
%%% @end
%%% Created : 25. 二月 2019 10:35
%%%-------------------------------------------------------------------
-module(lib_role_vow).

-include("common.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("vow.hrl").
-include("op_type.hrl").
-include("proto/prot_541.hrl").
-include("proto/prot_ud.hrl").

%% API
-export([
    do/3,
    init/1,
    event/2,
    handle_info/2,
    save/1,
    send_info/1,
    get_role_db_data/1,
    cross_day/1
]).

-export([
    gm_fin_all/1,
    gm_change_day/2
]).

%% ----------------许愿--------------
do(54101, PS, _Req) ->
    panel_info(PS);
do(54103, PS, _Req) ->
    my_like(PS);
do(54105, PS, _Req) ->
    my_vow(PS);
do(54107, PS, #cs_vow_other_vow{target_id = TargetID}) ->
    other_vow(PS, TargetID);
do(54109, PS, #cs_vow_refresh{type = Type}) ->
    refresh(PS, Type);
do(54110, PS, #cs_vow{context = Context}) ->
    vow(PS, Context);
do(54112, PS, #cs_vow_get{target_id = TargetID}) ->
    get_other_vow(PS, TargetID);
do(54114, PS, #cs_vow_agree{target_id = TargetID}) ->
    like(PS, TargetID);
do(54116, PS, #cs_vow_cancel_like{target_id = TargetID}) ->
    cancel_like(PS, TargetID);
do(54118, PS, _Req) ->
    revoke(PS);
%% ----------------契约--------------
do(54151, PS, _Req) ->
    send_info(PS);
do(54153, PS, _Req) ->
    invite(PS);
do(54155, PS, #cs_deed_res{res = Res}) ->
    res(PS, Res);
do(54158, PS, #cs_deed_reward{id = ID}) ->
    get_reward(PS, ID);
do(_, _, _) ->
    skip.

handle_info({deed_invite, InviteID}, _PS) ->
    set_deed_agree_time(),
    set_deed_target(InviteID);
handle_info({return_res, Return}, PS) ->
    handle_return(PS, Return);
handle_info({trigger, Type, Arg, TargetID}, PS) ->
    filter_trigger(PS, Type, Arg, TargetID);
handle_info(_, _) ->
    skip.

event(PS, {'finish_dung', _DungType, DungID, _Times}) ->
    lib_dungeon_util:is_team_dung(DungID) andalso filter_trigger(PS, ?DEED_TYPE_JOIN_DUNG, DungID, 0);
event(_, _) ->
    skip.

filter_trigger(PS, Type, Arg, TargetID) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    RoleData = get_role_data(RoleID),
    #{time := EndTime, target := DeedID} = RoleData,
    case EndTime >= time:unixtime() of
        true ->
            case lists:member(Type, ?NEED_TEAM_TYPE_LIST) of
                _ when Type =:= ?DEED_TYPE_HORN ->  %% 刷喇叭
                    maybe_trigger(PS, Type, Arg);
                true when TeamID > 0 -> %% 需要组队
                    #{members := Members} = lib_team:get_team_info(TeamID),
                    case lists:member(DeedID, Members) of
                        true -> %% 契约对象在队伍里
                            maybe_trigger(PS, Type, Arg);
                        _ ->
                            skip
                    end;
                false ->  %% 不需要组队
                    case TargetID =:= DeedID of
                        true ->
                            maybe_trigger(PS, Type, Arg);
                        _ ->
                            skip
                    end;
                _ ->    %% 需要组队,但是没有队伍
                    skip
            end;
        _ ->
            skip
    end.

%% ------------------------许愿---------------------

%% @doc 面板信息
panel_info(PS) ->
    case common_check(PS#role_state.id) of
        true ->
            #role_state{id = RoleID} = PS,
            RTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_VOW_REFRESH_TIMES),
            svr_vow:panel_info(RoleID, RTimes);
        _ ->
            skip
    end.


%% @doc 查看我的点赞
my_like(PS) ->
    case common_check(PS#role_state.id) of
        true ->
            #role_state{id = RoleID} = PS,
            svr_vow:my_like(RoleID);
        _ ->
            ?ERROR_TOC(PS, ?RC_DEED_ALREADY_DEED)
    end.

%% @doc 查看我的心愿
my_vow(PS) ->
    case common_check(PS#role_state.id) of
        true ->
            #role_state{id = RoleID, name = Name, career = Career, level = Lv} = PS,
            Args = {Name, Career, Lv},
            svr_vow:my_vow(RoleID, Args);
        _ ->
            ?ERROR_TOC(PS, ?RC_DEED_ALREADY_DEED)
    end.

%% 查看他人心愿
other_vow(PS, TargetID) ->
    case common_check(PS#role_state.id) of
        true ->
            #role_state{id = RoleID} = PS,
            svr_vow:other_vow(RoleID, TargetID);
        _ ->
            ?ERROR_TOC(PS, ?RC_DEED_ALREADY_DEED)
    end.


%% @doc 刷新
refresh(PS, Type) ->
    case check_refresh(PS) of
        {ok, RefreshTimes} ->
            #role_state{id = RoleID, guild_id = GuildID} = PS,
            svr_vow:refresh(RoleID, Type, RefreshTimes, GuildID),
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_VOW_REFRESH_TIMES, RefreshTimes),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_refresh(PS) ->
    #role_state{id = RoleID} = PS,
    common_check(RoleID) orelse erlang:throw({error, ?RC_DEED_ALREADY_DEED}),
    RTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_VOW_REFRESH_TIMES),
    #{daily_refresh_times := MaxTimes} = conf_vow_info:get(),
    RTimes < MaxTimes orelse erlang:throw({error, ?RC_VOW_REFRESH_TIMES_NOT_ENOUGH}),
    {ok, RTimes + 1}.

%% @doc 许愿
vow(PS, Context) ->
    case catch check_vow(PS, Context) of
        {ok, NewContext} ->
            #role_state{id = RoleID, guild_id = GuildID} = PS,
            svr_vow:vow(RoleID, GuildID, NewContext),
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_VOW_REVOKE, 1),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_vow(PS, Context) ->
    #role_state{id = RoleID} = PS,
    common_check(RoleID) orelse erlang:throw({error, ?RC_DEED_ALREADY_DEED}),
    Times = lib_role_kv:get_kv(RoleID, ?KEY_DAILY_VOW_REVOKE, 0),
    Times =:= 0 orelse erlang:throw({error, ?RC_VOW_DAILE_ONE_TIMES}),
    NewContext = util:escape_varchar(Context),
    util:check_filter(NewContext) andalso erlang:throw({error, ?RC_CHAT_SENSITIVE_CONTENT}),
    #{word_num := WordNum} = conf_vow_info:get(),
    util:check_length(NewContext, 2, WordNum) orelse erlang:throw({error, ?RC_VOW_CONTEXT_LENGTH_LIMIT}),
    {ok, NewContext}.

%% @doc 接取他人心愿
get_other_vow(PS, TargetID) ->
    case common_check(PS#role_state.id) of
        true ->
            case lib_role:is_online(TargetID) of
                true ->
                    #role_state{id = RoleID, server_num = SvrNum} = PS,
                    case TargetID =/= RoleID of
                        true ->
                            #{string := ChatStr} = conf_string:get(get_vow_send_info),
                            lib_role_sworn:greet_send_msg(PS, {TargetID, SvrNum}, ChatStr),
                            ok;
                        _ ->
                            ?ERROR_TOC(PS, ?RC_VOW_CAN_NOT_GET_MYSELF)
                    end;
                _ ->
                    ?ERROR_TOC(PS, ?RC_MARRY_TARGET_NOT_ONLINE)
            end;
        _ ->
            ?ERROR_TOC(PS, ?RC_DEED_ALREADY_DEED)
    end.

%% @doc 点赞
like(PS, TargetID) ->
    #role_state{id = RoleID} = PS,
    case common_check(RoleID) of
        true ->
            case TargetID =/= RoleID of
                true ->
                    svr_vow:like(RoleID, TargetID);
                _ ->
                    ?ERROR_TOC(PS, ?RC_VOW_CAN_NOT_LIKE_MYSELF)
            end;
        _ ->
            ?ERROR_TOC(PS, ?RC_DEED_ALREADY_DEED)
    end.

%% @doc 取消点赞
cancel_like(PS, TargetID) ->
    #role_state{id = RoleID} = PS,
    case common_check(RoleID) of
        true ->
            case TargetID =/= RoleID of
                true ->
                    svr_vow:cancel_like(RoleID, TargetID);
                _ ->
                    ?ERROR_TOC(PS, ?RC_VOW_CAN_NOT_CANCEL_LIKE_MYSELF)
            end;
        _ ->
            ?ERROR_TOC(PS, ?RC_DEED_ALREADY_DEED)
    end.

%% @doc 撤销许愿
revoke(PS) ->
    case catch check_revoke(PS) of
        ok ->
            #role_state{id = RoleID} = PS,
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_VOW_REVOKE, 1),
            svr_vow:revoke(RoleID),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_revoke(PS) ->
    #role_state{id = RoleID} = PS,
    common_check(RoleID) orelse erlang:throw({error, ?RC_DEED_ALREADY_DEED}),
    Times = lib_role_kv:get_kv(RoleID, ?KEY_DAILY_VOW_REVOKE, 0),
    Times =:= 0 orelse erlang:throw({error, ?RC_VOW_DAILE_ONE_TIMES}),
    ok.


common_check(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{target := Target, time := EndTime} = RoleData,
    not (Target > 0 andalso EndTime >= time:unixtime()).

%% ---------------------------契约------------------------
%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_db_data(RoleID),
    #{target := TargetID, time := EndTime, complete := Complete, get_list := GetList} = RoleData,
    Now = time:unixtime(),
    case EndTime =< Now + 1 andalso TargetID > 0 of
        true ->
            send_reward(RoleID, Complete, GetList),
            svr_mail:sys2p(RoleID, 2703, [], ?OPT_DEED),
            NewRoleData = RoleData#{target => 0, time => 0, complete => init_complete(), get_list => []},
            update_role_data(RoleID, NewRoleData);
        _ ->
            set_role_data(RoleID, RoleData)
    end.

send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{target := Target, time := Time, complete := Complete, get_list := GetList} = RoleData,
    Deed = calc_deed(Complete),
    MsgRecord = #sc_deed_info{
        target_name = lib_cache:get_role_name(Target),
        end_time = Time,
        deed = Deed,
        complete = gain_client_complete(Complete),
        get_list = GetList
    },
    {ok, Bin} = prot_msg:encode_msg(54152, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 邀请契约
invite(PS) ->
    case catch check_invite(PS) of
        {ok, TargetID} ->
            lib_role:mod_info(TargetID, ?MODULE, {deed_invite, PS#role_state.id}),
            set_deed_target(TargetID),
            MsgRecord = #sc_deed_notify{},
            {ok, Bin} = prot_msg:encode_msg(54154, MsgRecord),
            lib_role_send:send_to_role(TargetID, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_invite(PS) ->
    #role_state{id = RoleID, team_id = TeamID, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID} = RoleScene,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_ONLY_TWO_PEOPLE}),
    TeamInfo = lib_team:get_team_info(TeamID),
    #{leader := Leader, members := Members, mem_num := MenNum} = TeamInfo,
    Leader =:= RoleID orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    MenNum =:= 2 orelse erlang:throw({error, ?RC_VOW_ONLY_TWO_ROLE}),
    #{deed_npc := NpcID} = conf_vow_info:get(),
    {_, X, Y} = lib_scene_api:get_npc_pos(NpcID),
    lib_scene_api:is_team_near(Members, SceneID, LineID, X, Y) orelse erlang:throw({error, ?RC_TREASURE_MAP_TEAM_NOT_TOGHER}),
    [TargetID] = lists:delete(Leader, Members),
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_CIRCLE_TARGET_OFFLINE}),
    {ok, TargetID}.

%% 结果
res(PS, Res) ->
    TargetID = get_deed_target(),
    case Res of
        1 ->
            case catch check_res(PS, TargetID) of
                {ok, RoleData, EndTime} ->
                    update_role_data(PS#role_state.id, RoleData),
                    notify_begin(PS#role_state.sid, TargetID, EndTime),
                    lib_role:mod_info(TargetID, ?MODULE, {return_res, {ok, EndTime, PS#role_state.id}}),
                    set_deed_target(0),
                    svr_vow:revoke(PS#role_state.id),
                    lib_friend:is_friend(PS#role_state.id, TargetID) andalso
                        lib_role:mod_info(PS#role_state.id, lib_role_vow, {trigger, ?DEED_TYPE_ADD_FRIEND, 0, TargetID}),
                    ok;
                {error, Code} ->
                    ?ERROR_TOC(PS, Code)
            end;
        _ ->
            lib_role:mod_info(TargetID, ?MODULE, {return_res, {error, ?RC_DEED_REJUSE}})
    end.

check_res(PS, TargetID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{target := ID, time := Time} = RoleData,
    Now = time:unixtime(),
    (ID > 0 andalso Time >= Now) andalso erlang:throw({error, ?RC_DEED_ALREADY_DEED}),
    TargetID = get_deed_target(),
    AgreeTime = get_deed_agree_time(),
    TargetID > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    AgreeTime >= Now orelse erlang:throw({error, ?RC_DEED_OVER_AGREE_TIME}),
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_TEAM_TARGET_NOT_ONLINE}),
    EndTime = time:unixdate() + 7 * ?ONE_DAY_SECONDS - 1,
    NewRoleData = RoleData#{target => TargetID, time => EndTime},
    {ok, NewRoleData, EndTime}.

%% 邀请者收到返回
handle_return(PS, Return) ->
    case Return of
        {ok, EndTime, TargetID} ->
            #role_state{id = RoleID, sid = RoleSid} = PS,
            RoleData = get_role_data(RoleID),
            NewRoleData = RoleData#{target => TargetID, time => EndTime},
            update_role_data(RoleID, NewRoleData),
            notify_begin(RoleSid, TargetID, EndTime),
            set_deed_target(0),
            svr_vow:revoke(RoleID),
%%            lib_role_daily_lively:trigger_event(PS#role_state.id, 1017, 1),
            lib_friend:is_friend(RoleID, TargetID) andalso
                lib_role:mod_info(RoleID, lib_role_vow, {trigger, ?DEED_TYPE_ADD_FRIEND, 0, TargetID}),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% 领取契约奖励
get_reward(PS, ID) ->
    case catch check_get_reward(PS, ID) of
        {ok, RoleData, DropID} ->
            update_role_data(PS#role_state.id, RoleData),
            lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_DEED),
            MsgRecord = #sc_deed_reward{id = ID},
            {ok, Bin} = prot_msg:encode_msg(54159, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{complete := Complete, get_list := GetList} = RoleData,
    not lists:member(ID, GetList) orelse erlang:throw({error, ?RC_EXAMINE_ALREADY_GET}),
    Deed = calc_deed(Complete),
    #{deed_reward := Rewards} = conf_vow_info:get(),
    Info = lists:keyfind(ID, 1, Rewards),
    Info =/= false orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    {_, NeedDeed, Reward, MulReward} = Info,
    Deed >= NeedDeed orelse erlang:throw({error, ?RC_DEED_NOT_ENOUGH}),
    Res = is_mul_activity(),
    DropID = ?iif(Res, MulReward, Reward),
    NewGetList = [ID | GetList],
    NewRoleData = RoleData#{get_list => NewGetList},
    {ok, NewRoleData, DropID}.

%% 触发契约任务
maybe_trigger(PS, Type, Arg) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{complete := Complete, target := DeedID} = RoleData,
    Day = get_day(RoleData),
    IDs = conf_vow_task:get_day_ids(Day),
    DayComplete = util:prop_get_value(Day, Complete),
    {NewDayComplete, Updated} = maybe_trigger_helper(IDs, Day, Arg, Type, DayComplete),
    Updated andalso begin
        NewComplete = util:prop_store(Day, NewDayComplete, Complete),
        OldDeed = calc_deed(Complete),
        Deed = calc_deed(NewComplete),
        NewRoleData = RoleData#{complete => NewComplete},
        update_role_data(RoleID, NewRoleData),
        MsgRecord = #sc_deed_complete{deed = Deed, complete = gain_client_complete(NewComplete)},
        {ok, Bin} = prot_msg:encode_msg(54157, MsgRecord),
        lib_role_send:send_to_sid(RoleSid, Bin),
        %% 发送特殊奖励
        #{spec_reward := Spec} = conf_vow_info:get(),
        {NeedDeed, Reward} = Spec,
        (OldDeed < NeedDeed andalso Deed >= NeedDeed) andalso
            svr_mail:sys2p(RoleID, 2701, [lib_cache:get_role_name(DeedID)], Reward, ?OPT_DEED)
    end.

maybe_trigger_helper([], _, _, _, DayComplete) ->
    {DayComplete, false};
maybe_trigger_helper([ID | T], Day, CArg, CType, DayComplete) ->
    case conf_vow_task:get(Day, ID) of
        #{type := TType, arg := TArg, times := NeedTimes} when CArg =:= TArg, CType =:= TType ->
            CompleteTimes = util:prop_get_value(ID, DayComplete),
            case CompleteTimes >= NeedTimes of
                true ->
                    {DayComplete, false};
                _ ->
                    {util:prop_increase(ID, DayComplete), true}
            end;
        _ ->
            maybe_trigger_helper(T, Day, CArg, CType, DayComplete)
    end.

%% @doc 跨天处理
cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{target := TargetID, time := EndTime, complete := Complete, get_list := GetList} = RoleData,
    Now = time:unixtime(),
    case EndTime =< Now + 1 andalso TargetID > 0 of
        true ->
            send_reward(RoleID, Complete, GetList),
            svr_mail:sys2p(RoleID, 2703, [], ?OPT_DEED),
            NewRoleData = RoleData#{target => 0, time => 0, complete => init_complete(), get_list => []},
            update_role_data(RoleID, NewRoleData);
        _ ->
            skip
    end.

send_reward(RoleID, Complete, GetList) ->
    Deed = calc_deed(Complete),
    #{deed_reward := DeedReward} = conf_vow_info:get(),
    send_reward(RoleID, Deed, GetList, DeedReward).
send_reward(_, _, _, []) -> ok;
send_reward(RoleID, Deed, GetList, [{ID, NeedDeed, Reward, _} | T]) ->
    case lists:member(ID, GetList) of
        true ->
            send_reward(RoleID, Deed, GetList, T);
        _ ->
            case Deed >= NeedDeed of
                true ->
                    svr_mail:sys2p(RoleID, 2702, Reward, ?OPT_DEED);
                _ ->
                    ok
            end
    end.

get_day(RoleID) when is_integer(RoleID) ->
    RoleData = get_role_data(RoleID),
    get_day(RoleData);
get_day(#{time := EndTime}) ->
    7 - time:get_diff_days(time:unixtime(), EndTime).

%% 是否是多倍奖励
is_mul_activity() ->
    false.

notify_begin(RoleSid, TargetID, EndTime) ->
    MsgRecord = #sc_deed_begin{target_name = lib_cache:get_role_name(TargetID), end_time = EndTime},
    {ok, Bin} = prot_msg:encode_msg(54156, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 生成客户端数据
gain_client_complete(Complete) ->
    [#clt_deed_list{day = Day, list = List} || {Day, List} <- Complete].

%% 计算契约值
calc_deed(Complete) ->
    lists:foldl(fun({Day, List}, Acc) ->
        Value =
        lists:foldl(fun({ID, Times}, Acc1) ->
            #{times := NeedTimes, deed := Deed} = conf_vow_task:get(Day, ID),
            ?iif(Times >= NeedTimes, Acc1 + Deed, Acc1)
        end, 0, List),
        Acc + Value
    end, 0, Complete).

%% 初始化契约值
init_complete() ->
    Days = conf_vow_task:get_days(),
    lists:foldl(fun(Day, Acc) ->
        IDs = conf_vow_task:get_day_ids(Day),
        List = [{ID, 0} || ID <- IDs],
        [{Day, List} | Acc]
    end, [], Days).

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#{updated => true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

set_deed_target(RoleID) ->
    erlang:put({?MODULE, deed}, RoleID).

get_deed_target() ->
    case erlang:get({?MODULE, deed}) of
        RoleID when is_integer(RoleID) -> RoleID;
        _ -> 0
    end.

set_deed_agree_time() ->
    erlang:put({?MODULE, agree_time}, time:unixtime() + 60).

get_deed_agree_time() ->
    case erlang:get({?MODULE, agree_time}) of
        Time when is_integer(Time) -> Time;
        _ -> 0
    end.


%% 下线保存
save(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    case Updated of
        true ->
            #{target := Target, time := Time, complete := Complete, get_list := GetList} = RoleData,
            save_role_data(RoleID, Target, Time, Complete, GetList);
        _ ->
            skip
    end.


get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DEED_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [Target, Time, DbComplete, DbGetList] ->
            ?deed#{
                target => Target,
                time => Time,
                complete => type:convert_db_field(list, DbComplete, []),
                get_list => type:convert_db_field(list, DbGetList, [])
            };
        [] ->
            Complete = init_complete(),
            ?deed#{complete => Complete}
    end.

save_role_data(RoleID, Target, Time, Complete, GetList) ->
    DbComplete = type:term_to_bitstring(Complete),
    DbGetList = type:term_to_bitstring(GetList),
    SQL = io_lib:format(?SQL_SET_ROLE_DEED_DATA, [RoleID, Target, Time, DbComplete, DbGetList]),
    ?DB:execute(SQL).

gm_fin_all(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{complete := Complete, target := DeedID} = RoleData,
    NewComplete =
    lists:map(fun({Day, List}) ->
        NewList =
        lists:map(fun({ID, _}) ->
            #{times := NeedTimes} = conf_vow_task:get(Day, ID),
            {ID, NeedTimes}
        end, List),
        {Day, NewList}
    end, Complete),
    NewRoleData = RoleData#{complete := NewComplete},
    update_role_data(RoleID, NewRoleData),
    OldDeed = calc_deed(Complete),
    Deed = calc_deed(NewComplete),
    #{spec_reward := Spec} = conf_vow_info:get(),
    {NeedDeed, Reward} = Spec,
    (OldDeed < NeedDeed andalso Deed >= NeedDeed) andalso
        svr_mail:sys2p(RoleID, 2701, [lib_cache:get_role_name(DeedID)], Reward, ?OPT_DEED),
    MsgRecord = #sc_deed_complete{deed = Deed, complete = NewComplete},
    {ok, Bin} = prot_msg:encode_msg(54157, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    ok.

gm_change_day(RoleID, Day) ->
    RoleData = get_role_data(RoleID),
    #{target := Target, complete := Complete, get_list := GetList} = RoleData,
    Deed = calc_deed(Complete),
    EndTime = time:unixdate() + (7 - (Day - 1)) * ?ONE_DAY_SECONDS - 1,
    NewRoleData = RoleData#{time => EndTime},
    update_role_data(RoleID, NewRoleData),
    MsgRecord = #sc_deed_info{
        target_name = lib_cache:get_role_name(Target),
        end_time = EndTime,
        deed = Deed,
        complete = gain_client_complete(Complete),
        get_list = GetList
    },
    {ok, Bin} = prot_msg:encode_msg(54152, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    ok.