%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_career_battle_grade
%% @Brief  : 门派竞技段位
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_career_battle_grade).

-export([
    get_grade_name/1
]).

get_grade_name(1) -> <<"青铜">>;
get_grade_name(2) -> <<"白银">>;
get_grade_name(3) -> <<"黄金">>;
get_grade_name(4) -> <<"钻石">>;
get_grade_name(_Career) ->
    <<"">>.