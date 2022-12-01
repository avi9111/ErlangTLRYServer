%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      角色战斗常数
%% @author      cablsbs
%%----------------------------------
-module(conf_battle_const_role).

-export([
	get_battle_klv/2
]).


%% Apis ------------------------------------------------
%% @doc 获取klv
%% @spec get_battle_klv(Level) -> #{}.
%% Level    :: integer()
get_battle_klv(1, Level) ->
    if
        Level =< 30 ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 200, penetrate_crit_def => 500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000};
        Level =< 999 ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 1000, penetrate_crit_def => 2500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000};
        true ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 1000, penetrate_crit_def => 2500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000}
    end;
get_battle_klv(2, Level) ->
    if
        Level =< 30 ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 200, penetrate_crit_def => 500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000};
        Level =< 999 ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 1000, penetrate_crit_def => 2500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000};
        true ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 1000, penetrate_crit_def => 2500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000}
    end;
get_battle_klv(3, Level) ->
    if
        Level =< 30 ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 200, penetrate_crit_def => 500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000};
        Level =< 999 ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 1000, penetrate_crit_def => 2500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000};
        true ->
            #{inner_att => 100, inner_def => 100, inner_att_factor => 1, inner_def_factor => 1.5, outer_att => 100, outer_def => 100, outer_att_factor => 1, outer_def_factor => 1.5, penetrate_att => 100, penetrate_def => 100, penetrate_att_factor => 1, penetrate_def_factor => 1.5, crit => 100, crit_def => 200, crit_def_factor => 2.5, hit => 200, dodge => 100, floating => 700, penetrate_crit => 1000, penetrate_crit_def => 2500, penetrate_crit_def_factor => 2.5, cure_crit => 2000, cure_crit_fix => 5000}
    end;
get_battle_klv(_Career, _Level) ->
    undefined.
