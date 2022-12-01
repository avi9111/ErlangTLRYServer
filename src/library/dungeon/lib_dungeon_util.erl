%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     副本
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_dungeon_util).
-author("Ryuu").

-include("dungeon.hrl").

-export([
    calc_star/2,
    is_assist/2,
    kill_finish/2,
    is_team_dung/1,
    get_dung_cate/1,
    get_dung_name/1,
    get_dung_type/1,
    is_dung_scene/1,
    is_team_scene/1,
    wave_born_pos/3,
    is_single_scene/1,
    is_sh_team_dung/1,
    check_pass_conds/2
]).

is_dung_scene(SceneID) ->
    conf_dungeon_lv:scene_dung(SceneID) > 0.

is_single_scene(SceneID) ->
    is_single_dung(conf_dungeon_lv:scene_dung(SceneID)).

is_single_dung(DungID) ->
    get_dung_cate(DungID) =:= ?DUNG_CATE_SINGLE.

is_team_scene(SceneID) ->
    is_team_dung(conf_dungeon_lv:scene_dung(SceneID)).

is_team_dung(DungID) ->
    get_dung_cate(DungID) =:= ?DUNG_CATE_TEAM.

is_sh_team_dung(DungID) ->
    get_dung_type(DungID) =:= ?DUNG_TEAM_SH.

get_dung_cate(DungID) ->
    dung_conf_field(DungID, cate, 0).

get_dung_type(DungID) ->
    dung_conf_field(DungID, type, 0).

get_dung_name(DungID) ->
    dung_conf_field(DungID, name, <<"dungeon">>).

dung_conf_field(DungID, Field, Def) ->
    case conf_dungeon:get(DungID) of
        #{} = Conf ->
            maps:get(Field, Conf, Def);
        _ ->
            Def
    end.

wave_born_pos(SceneID, Wave, BornPosList) ->
    case lists:keyfind(Wave, 1, BornPosList) of
        {_, X, Y} ->
            {X, Y};
        _ ->
            lib_scene_api:get_scene_born_pos(SceneID)
    end.

%% @doc calc star
calc_star(EvalCond, State) ->
    calc_star(EvalCond, State, []).

calc_star([], _State, Acc) ->
    Acc;
calc_star([{Star, Cond} | T], State, Acc) ->
    case catch check_star_cond(Cond, State) of
        true ->
            calc_star(T, State, [Star | Acc]);
        _ ->
            calc_star(T, State, Acc)
    end.

check_star_cond({?DUNG_PASS_MON, MonList}, State) ->
    #{kill_mon := KillMon} = State,
    kill_finish(MonList, KillMon);
check_star_cond({?DUNG_PASS_TIME, MaxTime}, State) ->
    #{begin_time := BeginTime} = State,
    time:unixtime() - BeginTime < MaxTime;
check_star_cond({?DUNG_PASS_DIE, MaxTimes}, State) ->
    #{die_times := DieTimes} = State,
    DieTimes =< MaxTimes;
check_star_cond(_, _) ->
    erlang:throw({error, not_support}).

%% @doc check dung is finished
check_pass_conds([], _State) ->
    true;
check_pass_conds([Cond | T], State) ->
    case catch check_pass_cond(Cond, State) of
        true ->
            check_pass_conds(T, State);
        _ ->
            false
    end.

check_pass_cond({?DUNG_PASS_MON, MonList}, State) ->
    #{kill_mon := KillMon} = State,
    kill_finish(MonList, KillMon);
check_pass_cond({?DUNG_PASS_TIME, MaxTime}, State) ->
    #{begin_time := BeginTime} = State,
    time:unixtime() - BeginTime < MaxTime;
check_pass_cond({?DUNG_PASS_DIE, MaxTimes}, State) ->
    #{die_times := DieTimes} = State,
    DieTimes =< MaxTimes;
check_pass_cond(?DUNG_PASS_MON2, State) ->
    #{wave_mon := WaveMon, kill_mon := KillMon} = State,
    kill_finish(WaveMon, KillMon);
check_pass_cond(_, _) ->
    erlang:throw({error, not_support}).

kill_finish([], _KillList) ->
    true;
kill_finish([{Type, Num} | T], KillList) ->
    case util:dict_find(Type, KillList, 0) >= Num of
        true ->
            kill_finish(T, KillList);
        _ ->
            false
    end.

is_assist(RoleID, Roles) ->
    case map:keyfind(RoleID, role_id, Roles) of
        #{assist := Assist} -> Assist;
        _ -> false
    end.
