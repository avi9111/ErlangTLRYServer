%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 九月 2019 10:04
%%%-------------------------------------------------------------------
-module(test_scene).
-author("Administrator").
-include("svr_client.hrl").
%% API
-export([handle/3, walk/3, auto_walk/4, auto_walk/5, a_star_path/7, re_born/1, a_star_path/4, test_walk/1]).

re_born(CliId) ->
    Ets = ?to_ets(CliId),
    Socket = util:get_ets(Ets, 'socket'),
    Bin = <<
        0:8
    >>,
    recv_loop:do_send_req(Socket, 90307, Bin).
walk(CliId, ToX, ToY) ->
    Ets = ?to_ets(CliId),
    {SceneId, _LineId, CurX, CurY, ResetIndex} = util:get_ets(Ets, 'scene'),
    RoleId = util:get_ets(Ets, 'role_id'),
    Socket = util:get_ets(Ets, 'socket'),
    #scene{x = X, y = Y} = conf_scene:get(SceneId),
    case ToX =:= ?DEFAULT_POS orelse ToY =:= ?DEFAULT_POS of
        true ->
            DX = util:rand(1, X),
            DY = util:rand(1, Y);
        _ ->
            DX = ToX, DY = ToY
    end,
    WalkReqBin = <<
        SceneId:32, RoleId:64,
        CurX:16, CurY:16, DX:16, DY:16,
        ?MT_WALK:8, ResetIndex:16
    >>,
    recv_loop:do_send_req(Socket, 90200, WalkReqBin).

test_walk(CliId) ->
    auto_walk(CliId, ?RUN_TYPE, ?DEFAULT_POS, ?DEFAULT_POS).

auto_walk(CliId, Type, ToX, ToY) ->
    auto_walk(CliId, Type, 0, ToX, ToY).

auto_walk(CliId, Type, MonId, ToX, ToY) ->
    Ets = ?to_ets(CliId),
    {SceneId, LineId, CurX, CurY, ResetIndex} = util:get_ets(Ets, 'scene'),
    RoleId = util:get_ets(Ets, 'role_id'),
    Socket = util:get_ets(Ets, 'socket'),
    #scene{x = X, y = Y} = conf_scene:get(SceneId),
    case ToX =:= ?DEFAULT_POS orelse ToY =:= ?DEFAULT_POS of
        true ->
            DX = util:rand(1, X),
            DY = util:rand(1, Y);
        _ ->
            DX = ToX, DY = ToY
    end,
    case lib_scene_sign:is_line_through(SceneId, {X, Y}, {DX, DY}) of
        true ->
            WalkReqBin = <<
                SceneId:32, RoleId:64,
                CurX:16, CurY:16, DX:16, DY:16,
                ?MT_WALK:8, ResetIndex:16
            >>,
            recv_loop:do_send_req(Socket, 90200, WalkReqBin);
        _ ->
            case test_scene:a_star_path(SceneId, 1, CurX, CurY, DX, DX, ?SIGHT) of
                [] ->
                    walk(CliId, ?DEFAULT_POS, ?DEFAULT_POS);
                [H | Rest] ->
                    {Init, Args} = case Type of
                        ?ATTACK_TYPE ->
                            {true, {CliId, ?PATH_STATE, Type, MonId, Rest, {DX, DY}, H}};
                        ?RUN_TYPE ->
                            {true, {CliId, ?PATH_STATE, Type, Rest, H}};
                        _ ->
                            {false, skip}
                    end,
                    Init andalso client_trig:type_init(Args);
                _ ->
                    ?ERROR("auto_walk_error, cliid:~p", [{CliId, SceneId, LineId}])
            end
    end.



a_star_path(CliId, ToX, ToY, Depth) ->
    Ets = ?to_ets(CliId),
    {SceneId, LineId, Cx, Cy, _ResetIndex} = util:get_ets(Ets, 'scene'),
    a_star_path(SceneId, LineId, Cx, Cy, ToX, ToY, Depth).
a_star_path(SceneId, LineId, X, Y, ToX, ToY, Depth) ->
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    svr_scene_agent:apply_call(LinePid, 'lib_scene_sign', 'get_a_star_path', [X, Y, ToX, ToY, Depth]).

% 场景信息返回
handle(#client{cli_id = CliId, role_id = RoleId} = Client, 90101,
        #role_enter_scene_info_resp{role_id = RoleId, scene_id = SceneId} = Resp) ->
    handle_login_scene(Client, Resp),
    svr_client:load_scene(CliId, SceneId),
    Client;
%% 移动广播
handle(#client{role_id = RoleId, cli_id = CliId, ets = Ets} = Client, 90201, Resp) ->
    #bcast_obj_walk{type = Type, id = Id, cx = CurX, cy = CurY, x = X, y = Y} = Resp,
    case Type of
        ?BATTLE_ROLE ->
            Id =:= RoleId andalso Type =:= ?MT_STOP andalso begin
%%                io:format("Module:[~p], Line:[~p],  ...........:~p~n", [?MODULE, ?LINE, {CurX, CurY}]),
                {SceneId, LineId, _, _, ResIndex} = util:get_ets(Ets, 'scene'),
                ets:insert(Ets, {'scene', {SceneId, LineId, X, Y, ResIndex}})
            end;
        ?BATTLE_MON ->
            client_trig:obj_walk(CliId, Id, CurX, CurY);
        _ ->
            ok
    end,
    Client;
%% 重置坐标
handle(#client{role_id = RoleId, ets = Ets} = Client, 90203, #reset_point{obj_type = ?BATTLE_ROLE, obj_id = RoleId} = Resp) ->
    #reset_point{x = CurX, y = CurY, reset_index = RestIndex} = Resp,
    {SceneId, LineId, _X, _Y, _ResIndex} = util:get_ets(Ets, 'scene'),
%%    ?dev_print(90203, "reset_point", {{_X, CurX}, {_Y, CurY}}),
    ets:insert(Ets, {'scene', {SceneId, LineId, CurX, CurY, RestIndex}}),
    Client;
handle(#client{role_id = RoleId, ets = Ets} = Client, 90251, #bcast_role_info_change{role_id = RoleId} = Resp) ->
    #bcast_role_info_change{level = Level} = Resp,
    {Name, ServerNum, ServerTime, Gender, _, Exp} = util:get_ets(Ets, 'role'),
    ets:insert(Ets, {'role', {Name, ServerNum, ServerTime, Gender, Level, Exp}}),
    Client;
%% 场景属性信息90232
handle(#client{ets = Ets} = Client, 90102, Resp) ->
    ets:insert(Ets, {'role_scene_attr', Resp}),
    Client;
%%handle(#client{cli_id = CliId} = Client, 90232, Resp) ->
%%    io:format("Module:[~p], Line:[~p],  Resp...........:~p~n", [?MODULE, ?LINE, Resp]),
%%    Client;
handle(#client{cli_id = CliId} = Client, 90248, #bcast_obj_die{type = ?BATTLE_MON, id = MonId}) ->
%%    io:format("Module:[~p], Line:[~p],  MonId...........:~p~n", [?MODULE, ?LINE, MonId]),
    client_trig:monster_die(CliId, [MonId]),
    Client;
handle(#client{cli_id = CliId, role_id = RoleId} = Client, 90248, #bcast_obj_die{type = ?BATTLE_ROLE, id = RoleId}) ->
    re_born(CliId),
    Client;
handle(#client{cli_id = CliId, role_id = RoleId} = Client, 90243, #bcast_obj_hp_change{type = ?BATTLE_ROLE, id = RoleId, hp = Hp, hp_lim = HpLim}) ->
    Hp =< (HpLim div 3) andalso test_role:cheat(CliId, "full_hp"),
    Client;
handle(#client{cli_id = CliId, role_id = RoleId} = Client, 90244, #bcast_mp_change{role_id = RoleId, mp = Mp, mp_lim = MpLim}) ->
    Mp =< (MpLim div 3) andalso test_role:cheat(CliId, "full_mp"),
    Client;
%%       90310
%%handle(#client{cli_id = CliId} = Client, 90308, #bcast_revive{obj_type = ?BATTLE_ROLE, obj_id = _RoleId}) ->
%%    SceneId = pressure_test:scene_id(CliId),
%%    test_req:cs_change_scene(CliId, SceneId),
%%    Client;
handle(#client{ets = Ets} = Client, 90310, #notify_clear_skill_cd{skill_ids = Ids}) ->
    Cds = util:get_ets(Ets, 'skill_cd'),
    Cds =/= 'undefined' andalso begin
        ets:insert(Ets, {'skill_cd', [{Id, Time} || {Id, Time} <- Cds, lists:member(Id, Ids) orelse Time > time:unixtime_ms()]})
    end,
    Client;
handle(#client{ets = Ets} = Client, 90128, #notify_anger_change{anger = Anger}) ->
    Maps = util:get_ets(Ets, 'battle'),
    M = maps:update('anger', Anger, Maps),
    ets:insert(Ets, {'anger', M}),
    Client;
%% 添加怪物通知
handle(#client{ets = Ets} = Client, 90234, #bcast_add_mon_scene_info{mon_list = MonList}) ->
    CurList = util:get_ets(Ets, 'monster', []),
    ets:insert(Ets, {'monster', MonList ++ CurList}),
    Client;
%% 移除怪物通知
handle(#client{ets = Ets} = Client, 90235, #bcast_del_mon{mon_ids = MonIds}) ->
    CurList = util:get_ets(Ets, 'monster', []),
    ListN = [H || H = #mon_scene_info{id = Id} <- CurList, not lists:member(Id, MonIds)],
    ets:insert(Ets, {'monster', ListN}),
    Client;
handle(Client, _Cmd, _Resp) ->
%%    io:format("Module:[~p], Line:[~p],  _Resp...........:~p~n", [?MODULE, ?LINE, {_Cmd, _Resp}]),
    Client.

handle_login_scene(Client, Resp) ->
    #client{ets = Ets} = Client,
    #role_enter_scene_info_resp{
        level = Level,
        role_id = RoleId, server_num = ServerNum, server_time = ServerTime,
        name = Name, career = Career, gender = Gender, guild = _GuildId, exp = Exp,
        scene_id = SceneId, line_id = LineId, x = X, y = Y, reset_index = ResetIndex,
        skill_list = SkillListTuples, skill_cd = _SkillList, hp = Hp, mp = Mp, anger = Anger
%%        combat_power = CombatPower,
%%        guild_name = GuildName, team = TeamId,
%%        murderous = Murderous, base_attr = BaseAttr, attr = BtAttr,
%%        icon = Icon, hair = Hair, title = Title, title_extra = SwornTitle,
%%        title_quality = Quality, fashion = Fashion, exteriors = Exteriors,
%%        title_honor = TitleHonor, artifact = Artifact, warrior_soul = WarriorSoul,
%%        artifact = lib_role_artifact:get_artifact_cur_avatar(RoleId),
%%        warrior_soul = lib_role_warrior_soul:get_Warrior_soul_cur_avatar(RoleId),
%%        frame = Frame, bubble = Bubble, tran_stat = TranStat, state = Stat,
%%        state_params = StatParams, mate_id = MateID, mate_name = MateName
    } = Resp,
    ?dev_print(?MODULE, "role_enter_scene_info_resp", {SceneId, X, Y, ResetIndex}),
    ets:insert(Ets, {role_id, RoleId}),
    ets:insert(Ets, {'role', {Name, ServerNum, ServerTime, Gender, Level, Exp}}),
    ets:insert(Ets, {'battle', #{career => Career, hp => Hp, mp => Mp, anger => Anger}}),
    ets:insert(Ets, {'scene', {SceneId, LineId, X, Y, ResetIndex}}),
    Skills = [#skill{id = Id, level = Level1, hero = Guide, legend = Legenda} || {Id, Level1, Guide, Legenda} <- SkillListTuples],
    ets:insert(Ets, {'skill', Skills}).
%%    ets:insert(Ets, {'skill_cd', maps:from_list(SkillList)}).
%%    ets:insert(Ets, {'team_id', TeamId}),
%%    ets:insert(Ets, {'guild', GuildId, GuildName}),
%%    ets:insert(Ets, {'attr', {Hp, Mp, Anger, CombatPower, Murderous, BaseAttr, BtAttr}}),
%%    Personal = #{icon := Icon, hair := Hair, title := Title, fashion := Fashion, title_honor := TitleHonor,
%%        frame := Frame, bubble := Bubble},
%%    ets:insert(Ets, {'person', Personal}),
