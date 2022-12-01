%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_team_robot
%% @Brief  : 组队机器人
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_team_robot).

-export([
    get_ids/0,
    get_robot_conf/1
]).

get_ids() -> [1, 2, 3, 4].


% @spec get_robot_conf(RobotId) -> {Career, Name, SkillIds} | undefined.
get_robot_conf(1) ->
    {1, <<"乔峰">>, [10010001,10010002,10010003,10010011,10010012,10010013,10010014,10010015,10010016,10010017,10010018]};
get_robot_conf(2) ->
    {2, <<"段誉">>, [10020001,10020002,10020003,10020011,10020012,10020013,10020014,10020015,10020016,10020017,10020018]};
get_robot_conf(3) ->
    {3, <<"钟灵儿">>, [10030001,10030002,10030003,10030011,10030012,10030013,10030014,10030015,10030016,10030017,10030018]};
get_robot_conf(4) ->
    {4, <<"叶二娘">>, [10040001,10040002,10040003,10040011,10040012,10040013,10040014,10040015,10040016,10040017,10040018]};
get_robot_conf(_RobotId) ->
    undefined.
