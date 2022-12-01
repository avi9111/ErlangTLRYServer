%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     副本
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_dungeon).
-author("Ryuu").

-include("common.hrl").
-include("dungeon.hrl").
-include("battle.hrl").
-include("proto/prot_252.hrl").

-export([
    info/1,
    init/1,
    enter/3,
    leave/2,
    kill_mon/2,
    mon_drop/3,
    role_die/2,
    stop_clear/2,
    finish_dung/2,
    finish_wave/2,
    refresh_wave/2,
    wave_timeout/2
]).

info(State) ->
    [
        {state, State}
    ].

init([Roles, Leader, Wave, ConfDungLv, MonOpts]) ->
    #{id := DungID, scene := SceneID, wave_list := WaveList, level := Level,
        pass_cond := PassCond, born_xy := BornPosList} = ConfDungLv,
    MaxWave = length(WaveList),
    Cate = lib_dungeon_util:get_dung_cate(DungID),
    erlang:send_after(0 * 1000, self(), {refresh_wave, Wave}),
    {LineID, _} = svr_scene_mgr:add_scene_line(SceneID),
    BeginTime = time:unixtime(),
    DungTimer = start_timeout_timer(PassCond),
    {X, Y} = lib_dungeon_util:wave_born_pos(SceneID, Wave, BornPosList),
    EnterOpt = [DungID, SceneID, LineID, X, Y],
    RoleList = init_roles(Roles, EnterOpt, []),
    register_dung(SceneID, LineID),
    ?dungeon_state#{
        id => DungID, level => Level, wave => Wave, max_wave => MaxWave,
        begin_time => BeginTime, dung_timer => DungTimer, conf => ConfDungLv,
        scene => SceneID, line => LineID, cate => Cate, roles => RoleList,
        mon_opts => MonOpts, leader => Leader
    }.

init_roles([], _Opt, Acc) ->
    Acc;
init_roles([#{role_id := RoleID, assist := Assist} | T], Opt, Acc) ->
    Role = #{role_id => RoleID, online => false, assist => Assist},
    lib_role:mod_info(RoleID, lib_role_dungeon, {enter, Opt ++ [Assist]}),
    init_roles(T, Opt, [Role | Acc]).

start_timeout_timer(PassCond) ->
    case lists:keyfind(?DUNG_PASS_TIME, 1, PassCond) of
        {_, Time} ->
            erlang:send_after(Time * 1000, self(), {finish_dung, ?DUNG_FIN_TIMEOUT});
        _ ->
            undefined
    end.

%% @doc enter dungeon
enter(State, RoleID, Enter) ->
    #{roles := Roles} = State,
    NewRoles = set_online(Roles, RoleID, true),
    notify_dung_info(State, RoleID),
    Enter andalso lib_role_dungeon:log_dung(State, RoleID, 1),
    State#{roles => NewRoles}.

%% @doc leave dungeon
leave(State, RoleID) ->
    #{finish := Finish, cate := Cate, roles := Roles} = State,
    NewRoles = set_online(Roles, RoleID, false),
    if
        Finish ->
            erlang:send(self(), stop);
        Cate =:= ?DUNG_CATE_SINGLE ->
            lib_role_dungeon:log_dung(State, RoleID, 2),
            erlang:send(self(), {finish_dung, ?DUNG_FIN_QUIT});
        true ->
            lib_role_dungeon:log_dung(State, RoleID, 2),
            ignore
    end,
    State#{roles => NewRoles}.

%% @doc role dead
role_die(State, _RoleID) ->
    #{die_times := DieTimes, conf := DungLvConf} = State,
    NewDieTimes = DieTimes + 1,
    #{pass_cond := PassCond} = DungLvConf,
    case lists:keyfind(?DUNG_PASS_DIE, 1, PassCond) of
        {_, Limit} when NewDieTimes > Limit ->
            erlang:send(self(), {finish_dung, ?DUNG_FIN_DIE});
        _ ->
            ignore
    end,
    State#{die_times => NewDieTimes}.

%% @doc kill mon
kill_mon(State, MonID) ->
    #{wave_kill := WaveKill, kill_mon := KillList, wave := Wave, wave_mon := WaveMon} = State,
    NewKillList = dict:update_counter(MonID, 1, KillList),
    NewWaveKill = dict:update_counter(MonID, 1, WaveKill),
    WaveFin = lib_dungeon_util:kill_finish(WaveMon, NewWaveKill),
    WaveFin andalso erlang:send(self(), {finish_wave, Wave}),
    State#{kill_mon => NewKillList, wave_kill => NewWaveKill}.

%% @doc mon drop
mon_drop(State, DropID, MID) ->
    #{id := DungID, roles := Roles} = State,
    info_role(State, {dung_drop, DungID, DropID, MID, Roles}),
    State.

%% @doc finish one wave
finish_wave(State, _Wave) ->
    #{wave := CurWave, max_wave := MaxWave, wave_timer := WaveTimer} = State,
    {NewWave, Fin} = ?iif(CurWave < MaxWave, {CurWave + 1, false}, {MaxWave, true}),
    util:cancel_timer(WaveTimer),
    if
        Fin ->
            erlang:send(self(), {finish_dung, ?DUNG_FIN_WAVE});
        true ->
            erlang:send(self(), {refresh_wave, NewWave})
    end,
    info_role(State, {finish_wave, State, CurWave}),
    State#{wave => NewWave, wave_timer => undefined}.

%% @doc refresh next wave
refresh_wave(State, Wave) ->
    #{id := DungID, conf := ConfDungLv, scene := SceneID, line := LineID,
        mon_opts := MonOpts, leader := Leader} = State,
    #{wave_list := WaveList, partner_mon := PartnerMon} = ConfDungLv,
    {_, Time, WaveMon0} = lists:keyfind(Wave, 1, WaveList),
    TimerRef = start_wave_timer(Time, Wave),
    {WaveMon, Mons, Specials} = create_wave_mon(WaveMon0, SceneID, LineID, MonOpts, dict:new(), [], []),
    Rec = #sc_dung_refresh_mon{wave = Wave, mons = Mons},
    {ok, Bin} = prot_msg:encode_msg(25230, Rec),
    send_special_rumor(DungID, Leader, Specials),
    lib_scene_api:send_to_scene(SceneID, LineID, Bin),
    PartnerMon =/= [] andalso create_partner_mon(Wave, PartnerMon, SceneID, LineID),
    State#{wave => Wave, wave_timer => TimerRef, wave_kill => dict:new(), wave_mon => WaveMon}.

create_wave_mon([], _SceneID, _LineID, _Options, CAcc, MAcc, SAcc) ->
    {dict:to_list(CAcc), MAcc, SAcc};
create_wave_mon([{Mons, MonNum, X, Y} | T], SceneID, LineID, Options0, CAcc, MAcc, SAcc) ->
    Options = [{xy, {X, Y}}] ++ Options0,
    if
        is_list(Mons) ->
            {MTypeID, _, Special} = util:rand_by_weight(Mons, 2);
        true ->
            MTypeID = Mons,
            Special = 0
    end,
    Fun = fun(_, Acc) ->
        MID = lib_scene_api:create_mon(MTypeID, SceneID, LineID, Options),
        add_boss_buff(Options0, MID, SceneID, LineID),
        [{MID, MTypeID, X, Y, Special}] ++ Acc
    end,
    NMAcc = lists:foldl(Fun, MAcc, lists:seq(1, MonNum)),
    NCAcc = dict:update_counter(MTypeID, MonNum, CAcc),
    NSAcc = ?iif(Special =:= 1, [MTypeID | SAcc], SAcc),
    create_wave_mon(T, SceneID, LineID, Options0, NCAcc, NMAcc, NSAcc).

create_partner_mon(Wave, PartnerMon, SceneID, LineID) ->
    case lists:keyfind(Wave, 1, PartnerMon) of
        {Wave, MonList} ->
            [
                lib_scene_api:create_mon_async(MTypeId, SceneID, LineID, [{xy, {X, Y}}, {realm, ?DUNG_REALM_ROLE}])
                || {MTypeId, X, Y} <- MonList
            ];
        _ ->
            skip
    end.

send_special_rumor(_, _, []) ->
    ignore;
send_special_rumor(DungID, Leader, Specials) ->
    Rumor = config:get_sys_config(dung_special_mon_rumor),
    LeaderName = lib_cache:get_role_name(Leader),
    DungName = lib_dungeon_util:get_dung_name(DungID),
    [begin
        MonName = lib_scene_api:get_mon_name(MonID),
        svr_rumor:publish(world, Rumor, [LeaderName, DungName, MonName])
    end || MonID <- Specials].

start_wave_timer(0, _Wave) ->
    undefined;
start_wave_timer(Time, Wave) ->
    erlang:send_after(Time * 1000, self(), {wave_timeout, Wave}).

wave_timeout(State, _Wave) ->
    erlang:send(self(), {finish_dung, ?DUNG_FIN_TIMEOUT}),
    State.

%% @doc finish dungeon
finish_dung(#{finish := true} = State, _Type) ->
    State;
finish_dung(State, Type) ->
    #{conf := DungLvConf, wave_timer := WaveTimer, dung_timer := DungTimer} = State,
    util:cancel_timer(WaveTimer),
    util:cancel_timer(DungTimer),
    #{eval_cond := EvalCond, pass_cond := PassEval} = DungLvConf,
    Succeed = lists:member(Type, [?DUNG_FIN_WAVE]) andalso lib_dungeon_util:check_pass_conds(PassEval, State),
    Now = time:unixtime(),
    Stars = lib_dungeon_util:calc_star(EvalCond, State),
    NewState = State#{
        finish => true, end_time => Now, succeed => Succeed, stars => Stars
    },
    info_role(State, {finish_dung, NewState}),
    case Type =:= ?DUNG_FIN_QUIT of
        true ->
            erlang:send(self(), stop);
        _ ->
            erlang:send_after(30 * 1000, self(), stop_clear)
    end,
    NewState.

stop_clear(State, _) ->
    #{scene := SceneID, line := LineID} = State,
    svr_scene_mgr:close_line_later(SceneID, LineID, 2500),
    State.

%% -----------------------------------------------------------------------------
%% info
%% -----------------------------------------------------------------------------

info_role(#{cate := ?DUNG_CATE_SINGLE, roles := Roles}, Info) ->
    [info_role(RoleID, Info) || #{role_id := RoleID} <- Roles];
info_role(#{roles := Roles}, Info) ->
    [info_role(RoleID, Info) || #{role_id := RoleID, online := Online} <- Roles, Online];
info_role(RoleID, Info) ->
    lib_role:mod_info(RoleID, lib_role_dungeon, Info).

notify_dung_info(State, RoleID) ->
    #{id := DungID, wave := Wave, begin_time := BeginTime, conf := ConfDungLv,
        roles := Roles} = State,
    #{level := Level} = ConfDungLv,
    Members = convert_members(Roles, []),
    Rec = #sc_dung_data{
        dung_id = DungID, begin_time = BeginTime, level = Level, wave = Wave,
        members = Members
    },
    {ok, Bin} = prot_msg:encode_msg(25228, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

convert_members([], Acc) ->
    Acc;
convert_members([Role | T], Acc) ->
    #{role_id := RoleID, assist := Assist} = Role,
    Mode = ?iif(Assist, 1, 0),
    convert_members(T, [{RoleID, Mode} | Acc]).

%% -----------------------------------------------------------------------------
%% others
%% -----------------------------------------------------------------------------

register_dung(SceneID, LineID) ->
    RegName = svr_dungeon:reg_name({SceneID, LineID}),
    erlang:register(RegName, self()).

set_online(Roles, RoleID, Online) ->
    map:keyupdate(RoleID, role_id, Roles, online, Online).

add_boss_buff(Options, MID, SceneID, LineID) ->
    case util:prop_get_value(buff, Options) of
        AddEffects when is_list(AddEffects) ->
            ObjKey = {?BATTLE_MON, MID},
            svr_scene_agent:push_cmd(SceneID, LineID, {'add_effects', {ObjKey, ObjKey, AddEffects}});
        _ ->
            skip
    end.
