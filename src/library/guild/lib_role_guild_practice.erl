%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派练功
%%% @end
%%% Created : 21. 十一月 2018 14:21
%%%-------------------------------------------------------------------
-module(lib_role_guild_practice).
-author("Tom").
-include("op_type.hrl").
-include("mentor.hrl").
-include("log.hrl").
-include("role.hrl").
-include("chat.hrl").
-include("guild.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("guild_practice.hrl").
-include("proto/prot_ud.hrl").
-include("proto/prot_520.hrl").

%% API
-export([
    handle_info/2,
    begin_practice/1,
    send_team_invite/1,
    join_in_practice/1
]).


handle_info(add_exp, PS) ->
    add_exp(PS);
handle_info({stop_practice, Stat_New}, PS) ->
    stop_practice(PS, Stat_New);
handle_info({activate_practice, CenterX, CenterY, EndTime}, PS) ->
    activate_practice(PS, CenterX, CenterY, EndTime);
handle_info(_, _) ->
    ignore.

%%----------------------------接口实现------------------------------------
begin_practice(PS) ->
    #role_state{stat = CurStat, id = RoleID, level = Lv, role_scene = RoleScene, team_id = TeamID, guild_id = GuildID} = PS,
    #{
        open_lv := OpenLv, times := MaxTimes, team_num := TargetMemNum,
        area := [{CenterX, PosYMin, PosYMax}], during_time := DuringTime
    } = conf_guild_wine_practice:get(),
    lib_activity:is_ongoing(?ACT_ID_GUILD_PRACTICE) orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    not bit_map:is_set(?SPEC_STAT_BIT_SIT, CurStat) orelse erlang:throw({error, ?RC_GUILD_PRACTICE_ALREADY}),
    lib_guild:is_seat_scene(RoleScene#role_scene.scene_id) orelse erlang:throw({error, ?RC_GUILD_NOT_IN_SEAT_SCENE}),
    Lv >= OpenLv orelse erlang:throw({error, ?RC_GUILD_WINE_PRACTICE_LACK_OF_LV}),
    Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_GUILD_PRACTICE_TIMES),
    Times < MaxTimes orelse erlang:throw({error, ?RC_GUILD_WINE_PRACTICE_LACK_OF_TIMES}),
    #{members := Members, leader := Leader} = case svr_team_mgr:get_team_info(TeamID) of
        undefined -> erlang:throw({error, ?RC_GUILD_WINE_PRACTICE_LACK_OF_MEMNUM});
        ConfData -> ConfData
    end,
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    MemNum = length(Members),
    MemNum =:= TargetMemNum orelse MemNum > TargetMemNum andalso erlang:throw({error, ?RC_GUILD_WINE_PRACTICE_OVER_MEMNUM})
        orelse MemNum < TargetMemNum andalso erlang:throw({error, ?RC_GUILD_WINE_PRACTICE_LACK_OF_MEMNUM}),
    Guild = lib_guild:get_guild_info(GuildID),
    #guild{members = GuildMembers} = Guild,
    TotalNum = lists:foldl(fun(#guild_member{role_id = RoleID_T} = _Member, Acc) ->
        case lists:member(RoleID_T, Members) of
            true -> Acc + 1;
            false -> Acc
        end
    end, 0, GuildMembers),
    TotalNum == MemNum orelse erlang:throw({error, ?RC_GUILD_WINE_PRACTICE_NOT_SAME_GUILD}),

    %% 激活练功
    EndTime = trunc(time:unixtime() + DuringTime/1000),
    svr_team_mgr:info_team(TeamID, {'mod', ?MODULE, {activate_practice, CenterX, 0, EndTime}}),
    RandPosY = util:rand(PosYMin, PosYMax),
    {_, LvGapT} = lists:foldl(fun(MemRoleID, {OffSet, LvGap}) ->
        #{level := MemLv} = lib_team:get_role_data(MemRoleID),
        %% 传送队员到练功区域
        SceneID = lib_guild:get_seat_scene(),
        lib_scene_api:change_scene_async(MemRoleID, SceneID, GuildID, CenterX + OffSet, RandPosY),
        LvGapN = ?iif(LvGap =:= 0, MemLv, erlang:abs(LvGap - MemLv)),
        {OffSet + 4, LvGapN}
    end, {-2, 0}, Members),
    svr_guild_practice:set_lv_gap(TeamID, LvGapT),
%%    MsgRecord = #sc_guild_begin_practice{end_time = trunc(time:unixtime() + DuringTime/1000)},
    ok.

join_in_practice(PS) ->
    #role_state{id = RoleID, level = Lv, guild_id = GuildID} = PS,
    #{open_lv := OpenLv, mentor_pos := [{MentorX, MentorY}]} = conf_guild_wine_practice:get(),
    Lv >= OpenLv orelse erlang:throw({error, ?RC_GUILD_WINE_PRACTICE_LACK_OF_LV}),
    GuildID =/= 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    SceneID = lib_guild:get_seat_scene(),
    lib_scene_api:change_scene_async(RoleID, SceneID, GuildID, MentorX, MentorY),
    ok.

send_team_invite(#role_state{team_id = TeamID} = PS) ->
    TeamIDNew = case TeamID of
        0 -> lib_role_team:create_team(PS, 0);
        _ -> TeamID
    end,
    %% 发信息到帮派频道
    lib_role_chat:public_chat(PS, ?CHAT_CHANNEL_GUILD, 0, "", "", 0, ?STR(?INVITE_TEAM_CHAT_MSG) ++ "|0|0|" ++ ?STR(TeamIDNew)).


%% 激活练功
activate_practice(PS, CenterX, CenterY, EndTime) ->
    #role_state{id = RoleID, stat = Stat} = PS,
    %%增加每日活跃度
    lib_role_daily_lively:trigger_event(RoleID, 9, 1),
    lib_role_marriage:part_team_act(RoleID, 9, ?OPT_GUILD_WINE_PRACTICE),
    ?TASK_EVENT(RoleID, 'part_guild_practice'),
    Param = #state_param{
        center_x = CenterX,
        center_y = CenterY,
        end_time = EndTime
    },
    NewState = PS#role_state{stat = bit_map:set(?SPEC_STAT_BIT_SIT, Stat), stat_params = [Param]},
    NewState.

%% 停止练功
stop_practice(#role_state{id = RoleID} = PS, Stat_New) ->
    IsMentorSitting = lib_role_mentor:is_sitting(RoleID),
    {DailyNumKey, NewTimes} = if
        IsMentorSitting ->
            Key = ?KEY_DAILY_MENTOR_PRACTICE_NUM,
            Times = lib_role_kv:get_counter(RoleID, Key),
            TimesN = ?iif(not lib_role_mentor:is_mentor(RoleID), Times + 1, Times),
            lib_role_mentor:stop_sitting(RoleID, TimesN),
            {Key, TimesN};
        true ->
            Key = ?KEY_DAILY_GUILD_PRACTICE_TIMES,
            {Key, lib_role_kv:get_counter(RoleID, Key) + 1}
    end,
    lib_role_kv:set_kv(RoleID, DailyNumKey, NewTimes),
    NewState = PS#role_state{stat = Stat_New, stat_params = []},
    NewState.

%% 增加经验
add_exp(#role_state{id = RoleID, level = Lv, team_id = TeamID} = PS) ->
    IsMentorSitting = lib_role_mentor:is_sitting(RoleID),
    if
        IsMentorSitting ->
            #{tudi_practice_num := MaxTimes} = conf_mentor_base:get(),
            Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_MENTOR_PRACTICE_NUM),
            IsMentor = lib_role_mentor:is_mentor(RoleID),
            if
                Times < MaxTimes andalso not IsMentor ->
                    #{base_exp := Exp} = conf_mentor_exp_base:get(Lv),
                    LvGap = abs(lib_role_mentor:get_mentor_lv(RoleID) - Lv),
                    #{add_per := AddPer} = conf_mentor_exp_add:get(LvGap),
                    ExpNew = floor(Exp * (1 + AddPer/100) * util:rand(90, 100) / 100),
                    lib_role_assets:add_items_notify(PS, [{?AST_EXP, ExpNew}], ?OPT_MENTOR_PRACTICE);
                true -> PS
            end;
        true ->
            #{times := MaxTimes} = conf_guild_wine_practice:get(),
            Times = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_GUILD_PRACTICE_TIMES),
            case Times < MaxTimes of
                true ->
                    #{exp := Exp} = conf_guild_wine_practice_by_lv:get(Lv),
                    LvGap = svr_guild_practice:get_lv_gap(TeamID),
                    #{exp_add_per := AddPer} = conf_guild_wine_practice_by_gap:get(LvGap),
                    ExpN = floor(Exp * util:rand(90, 100) / 100),
                    ExtraExp = erlang:floor(ExpN * AddPer / 100),
                    NewState = lib_role_assets:add_items_notify(PS, [{?AST_EXP, ExpN}], ?OPT_GUILD_WINE_PRACTICE),
                    case ExtraExp > 0 of
                        true ->
                            ?ERROR_TOC(RoleID, ?RC_GUILD_PRACTICE_EXP_ADD_EXTRA, [type:term_to_string(LvGap), type:term_to_string(ExtraExp)]),
                            lib_role_assets:add_items_notify(NewState, [{?AST_EXP, ExtraExp}], ?OPT_GUILD_WINE_PRACTICE);
                        false -> NewState
                    end;
                false -> PS
            end
    end.
    
