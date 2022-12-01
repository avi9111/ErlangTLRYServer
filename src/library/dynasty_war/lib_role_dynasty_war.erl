%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争 [玩家]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_dynasty_war).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("dynasty_war.hrl").
-include("proto/prot_307.hrl").

%% API
-export([
    do/3,
    save/1,
    gm_clear/1,
    send_info/1,
    handle_info/2
]).

-define(IN_ACTIVITY_CHECK(PS, InScene, Other),
    case catch in_activity_check(PS, InScene) of
        {error, Code} ->
            ?ERROR_TOC(PS, Code);
        _ ->
            Other
    end).

handle_info({enter_async, Options}, PS) ->
    enter_async(PS, Options);
handle_info({settle_up, Reward, Win}, PS) ->
    settle_up(PS, Reward, Win);
handle_info(_Info, _PS) ->
    ignore.

do(30701, PS, _) ->
    enter(PS);
do(30703, PS, _) ->
    leave(PS);
do(30721, PS, _) ->
    send_info(PS);
do(30723, PS, #cs_dynasty_exchange{id = ID}) ->
    exchange(PS, ID);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    Times = lib_role_data:get_value(RoleID, ?KEY_DYNASTY_WIN_TIMES, 0),
    Titles = lib_role_data:get_value(RoleID, ?KEY_DYNASTY_EX_TITLES, []),
    Rec = #sc_dynasty_info{win_times = Times, titles = Titles},
    {ok, Bin} = prot_msg:encode_msg(30722, Rec),
    lib_role_send:send_to_role(PS, Bin).

exchange(PS, ID) ->
    case catch check_exchange(PS, ID) of
        {ok, RoleID, Titles, Rewards} ->
            PS1 = lib_role_assets:add_items_notify(PS, Rewards, ?OPT_DYNASTY_WAR_EXCHANGE),
            lib_role_data:put_value(RoleID, ?KEY_DYNASTY_EX_TITLES, Titles),
            Rec = #sc_dynasty_exchange{id = ID},
            {ok, Bin} = prot_msg:encode_msg(30724, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_exchange(PS, ID) ->
    #role_state{id = RoleID} = PS,
    Conf = conf_dynasty_war_title:get(ID),
    #{score := Score, win_times := NeedTimes, item := ItemID} = Conf,
    WinTimes = lib_role_data:get_value(RoleID, ?KEY_DYNASTY_WIN_TIMES, 0),
    WinTimes >= NeedTimes orelse erlang:throw({error, ?RC_DYNASTY_WAR_WIN_TIMES_LIMIT}),
    HisScore = lib_role_money:get_his_money(PS, ?AST_SONG_LIAO),
    HisScore >= Score orelse erlang:throw({error, ?RC_DYNASTY_WAR_HIS_SCORE_LIMIT}),
    Titles = lib_role_data:get_value(RoleID, ?KEY_DYNASTY_EX_TITLES, []),
    lists:member(ID, Titles) andalso erlang:throw({error, ?RC_DYNASTY_WAR_ALREADY_EXCHANGE}),
    Rewards = [{?AST_ITEM, [{ItemID, 1}]}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewTitles = [ID | Titles],
    {ok, RoleID, NewTitles, Rewards}.

%% @doc 下线保存
save(PS) ->
    leave(PS).

enter(PS) ->
    case catch check_enter(PS) of
        ok ->
            router_group(svr_dynasty_war_mgr, enter, [enter_info(PS)]);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter(PS) ->
    in_activity_check(PS, false),
    #role_state{id = RoleID, level = RoleLv} = PS,
    EnterTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_DYNASTY_ENTER_TIMES),
    EnterTimes < ?ENTER_TIMES orelse erlang:throw({error, ?RC_DYNASTY_WAR_ENTER_ONCE}),
    EnterLv = config:get_sys_config(dynamic_war_enter_level),
    RoleLv >= EnterLv orelse erlang:throw({error, ?RC_DYNASTY_WAR_ENTER_LV_LIMIT}),
    ok.

%% @doc 进入 [异步]
enter_async(PS, [SceneID, LineID, X, Y]) ->
    #role_state{id = RoleID} = PS,
    lib_scene_api:change_scene_async(RoleID, SceneID, LineID, X, Y),
    lib_role_daily:add_counter(RoleID, ?KEY_DAILY_DYNASTY_ENTER_TIMES, 1).

%% @doc 离开活动场景
leave(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    NowInScene = lib_dynasty_war:is_in_scene(SceneID),
    NowInScene andalso begin
        {ok, PS1} = lib_scene_api:return_scene(PS),
        {ok, Bin} = prot_msg:encode_msg(30704, #sc_dynasty_war_leave{}),
        lib_role_send:send_to_role(PS, Bin),
        PS1
    end.

settle_up(PS, Reward, Win) ->
    #role_state{id = RoleID} = PS,
    lib_role_daily_lively:trigger_event(RoleID, 2, 1),
    ?TASK_EVENT(RoleID, {'part_dynasty_war', Win}),
    Win andalso lib_role_data:add_counter(RoleID, ?KEY_DYNASTY_WIN_TIMES, 1),
    lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_DYNASTY_WAR_SETTLE),
    ok.

gm_clear(RoleID) ->
    lib_role_daily:put_value(RoleID, ?KEY_DAILY_DYNASTY_ENTER_TIMES, 0).

%% -----------------------------------------------------------------------------

in_activity_check(PS, InScene) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    Ongoing = lib_activity:is_ongoing(?ACT_ID_DYNASTY_WAR),
    Ongoing orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    NowInScene = lib_dynasty_war:is_in_scene(SceneID),
    (InScene =:= true andalso not NowInScene) andalso erlang:throw({error, ?RC_DYNASTY_WAR_NOT_IN_SCENE}),
    (InScene =:= false andalso NowInScene) andalso erlang:throw({error, ?RC_DYNASTY_WAR_ALREADY_IN_SCENE}),
    ok.

router_group(M, F, A) ->
    lib_activity:router_cluster(?ACT_ID_DYNASTY_WAR, M, F, A).

enter_info(PS) ->
    #role_state{id = RoleID, name = Name, server_id = ServerID, career = Career,
        sid = Sid, level = RoleLv} = PS,
    Division = conf_dynasty_war_room:get_div(RoleLv),
    ?dynasty_war_enter#{
        id => RoleID, sid => Sid, pid => self(), name => Name, server_id => ServerID,
        node => node(), career => Career, division => Division
    }.

