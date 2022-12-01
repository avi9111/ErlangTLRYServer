%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      运镖场景
%% @author      cablsbs
%%----------------------------------
-module(conf_guild_carry_scene).

-include("log.hrl").

-export([
	get_carry_scene/2,
	get_init_scene/1
]).


%% @doc 获取运镖场景配置
%% @spec get_carry_scene(Line, Scene) -> #{}.
%% Line = Scene     :: integer()
get_carry_scene(1, 40001) ->
    #{
        scene => 40001,
        next_scene => 10000,
        npc => 2001,
        start_pos => {270,545},
        end_pos => {312,384},
        path => [{273,465},{324,456},{335,383},{312,384}]
    };
get_carry_scene(1, 10000) ->
    #{
        scene => 10000,
        next_scene => 10004,
        npc => 0,
        start_pos => {224,256},
        end_pos => {303,210},
        path => [{303,256},{303,210}]
    };
get_carry_scene(1, 10004) ->
    #{
        scene => 10004,
        next_scene => 10006,
        npc => 0,
        start_pos => {424,462},
        end_pos => {589,363},
        path => [{424,462},{476,490},{516,520},{560,520},{582,474},{589,363}]
    };
get_carry_scene(1, 10006) ->
    #{
        scene => 10006,
        next_scene => 0,
        npc => 2002,
        start_pos => {378,444},
        end_pos => {531,410},
        path => [{360,397},{335,346},{374,332},{440,325},{481,323},{481,400},{531,410}]
    };
get_carry_scene(2, 40001) ->
    #{
        scene => 40001,
        next_scene => 10000,
        npc => 2001,
        start_pos => {270,545},
        end_pos => {312,384},
        path => [{273,465},{324,456},{335,383},{312,384}]
    };
get_carry_scene(2, 10000) ->
    #{
        scene => 10000,
        next_scene => 10004,
        npc => 0,
        start_pos => {224,256},
        end_pos => {303,210},
        path => [{303,256},{303,210}]
    };
get_carry_scene(2, 10004) ->
    #{
        scene => 10004,
        next_scene => 10006,
        npc => 0,
        start_pos => {424,462},
        end_pos => {589,363},
        path => [{424,462},{476,490},{516,520},{560,520},{582,474},{589,363}]
    };
get_carry_scene(2, 10006) ->
    #{
        scene => 10006,
        next_scene => 0,
        npc => 2002,
        start_pos => {378,444},
        end_pos => {531,410},
        path => [{360,397},{335,346},{374,332},{440,325},{481,323},{481,400},{531,410}]
    };
get_carry_scene(Line, Scene) ->
    ?ERROR_FUNC_CALL([Line, Scene]),
    undefined.


%% @doc 根据路线获取运镖起始场景配置
%% @spec get_init_scene(Line) -> #{}.
%% Line         :: integer()
get_init_scene(1) ->
    get_carry_scene(1, 40001);
get_init_scene(2) ->
    get_carry_scene(2, 40001);
get_init_scene(_Line) ->
    undefined.
