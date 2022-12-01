%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_hero_effect
%% @Brief  : 指点效果
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_hero_effect).

-include("skill.hrl").

-export([
    get/1,
    get_ids/0
]).

get({10010016, Level, 1, 0}) when Level >= 1 ->
    #{
        id => 1,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,1020,1}]}, {#base_skill.repel, [6]}, {#base_skill.hero, 1}, {#base_skill.legend, 0}]
    };
get({10040016, Level, 1, 0}) when Level >= 1 ->
    #{
        id => 1,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_buff, {{0,3,16},{1,{4004,1}}}}, {#base_skill.hero, 1}, {#base_skill.legend, 0}]
    };
get({10020016, Level, 1, 0}) when Level >= 1 ->
    #{
        id => 1,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 0}, {#base_skill.target_buff, [{10000,2006,1}]}, {#base_skill.hero, 1}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 1, 0}) when Level >= 1 ->
    #{
        id => 1,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 12000}, {#base_skill.self_buff, [{10000,10,1}]}, {#base_skill.flyitems, [1002]}, {#base_skill.hero, 1}, {#base_skill.legend, 0}]
    };
get({10010017, Level, 2, 0}) when Level >= 1 ->
    #{
        id => 2,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1005}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10040017, Level, 2, 0}) when Level >= 1 ->
    #{
        id => 2,
        level => 1,
        legend => 0,
        effect => [{#base_skill.remove_cd, [{0,10040017}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 200 ->
    #{
        id => 2,
        level => 200,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 199 ->
    #{
        id => 2,
        level => 199,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 198 ->
    #{
        id => 2,
        level => 198,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 197 ->
    #{
        id => 2,
        level => 197,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 196 ->
    #{
        id => 2,
        level => 196,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 195 ->
    #{
        id => 2,
        level => 195,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 194 ->
    #{
        id => 2,
        level => 194,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 193 ->
    #{
        id => 2,
        level => 193,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 192 ->
    #{
        id => 2,
        level => 192,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 191 ->
    #{
        id => 2,
        level => 191,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 190 ->
    #{
        id => 2,
        level => 190,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 189 ->
    #{
        id => 2,
        level => 189,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 188 ->
    #{
        id => 2,
        level => 188,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 187 ->
    #{
        id => 2,
        level => 187,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 186 ->
    #{
        id => 2,
        level => 186,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 185 ->
    #{
        id => 2,
        level => 185,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 184 ->
    #{
        id => 2,
        level => 184,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 183 ->
    #{
        id => 2,
        level => 183,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 182 ->
    #{
        id => 2,
        level => 182,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 181 ->
    #{
        id => 2,
        level => 181,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 180 ->
    #{
        id => 2,
        level => 180,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 179 ->
    #{
        id => 2,
        level => 179,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 178 ->
    #{
        id => 2,
        level => 178,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 177 ->
    #{
        id => 2,
        level => 177,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 176 ->
    #{
        id => 2,
        level => 176,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 175 ->
    #{
        id => 2,
        level => 175,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 174 ->
    #{
        id => 2,
        level => 174,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 173 ->
    #{
        id => 2,
        level => 173,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 172 ->
    #{
        id => 2,
        level => 172,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 171 ->
    #{
        id => 2,
        level => 171,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 170 ->
    #{
        id => 2,
        level => 170,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 169 ->
    #{
        id => 2,
        level => 169,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 168 ->
    #{
        id => 2,
        level => 168,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 167 ->
    #{
        id => 2,
        level => 167,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 166 ->
    #{
        id => 2,
        level => 166,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 165 ->
    #{
        id => 2,
        level => 165,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 164 ->
    #{
        id => 2,
        level => 164,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 163 ->
    #{
        id => 2,
        level => 163,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 162 ->
    #{
        id => 2,
        level => 162,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 161 ->
    #{
        id => 2,
        level => 161,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 160 ->
    #{
        id => 2,
        level => 160,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 159 ->
    #{
        id => 2,
        level => 159,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 158 ->
    #{
        id => 2,
        level => 158,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 157 ->
    #{
        id => 2,
        level => 157,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 156 ->
    #{
        id => 2,
        level => 156,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 155 ->
    #{
        id => 2,
        level => 155,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 154 ->
    #{
        id => 2,
        level => 154,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 153 ->
    #{
        id => 2,
        level => 153,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 152 ->
    #{
        id => 2,
        level => 152,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 151 ->
    #{
        id => 2,
        level => 151,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 150 ->
    #{
        id => 2,
        level => 150,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 149 ->
    #{
        id => 2,
        level => 149,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 148 ->
    #{
        id => 2,
        level => 148,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 147 ->
    #{
        id => 2,
        level => 147,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 146 ->
    #{
        id => 2,
        level => 146,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 145 ->
    #{
        id => 2,
        level => 145,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 144 ->
    #{
        id => 2,
        level => 144,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 143 ->
    #{
        id => 2,
        level => 143,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 142 ->
    #{
        id => 2,
        level => 142,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 141 ->
    #{
        id => 2,
        level => 141,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 140 ->
    #{
        id => 2,
        level => 140,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 139 ->
    #{
        id => 2,
        level => 139,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 138 ->
    #{
        id => 2,
        level => 138,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 137 ->
    #{
        id => 2,
        level => 137,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 136 ->
    #{
        id => 2,
        level => 136,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 135 ->
    #{
        id => 2,
        level => 135,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 134 ->
    #{
        id => 2,
        level => 134,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 133 ->
    #{
        id => 2,
        level => 133,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 132 ->
    #{
        id => 2,
        level => 132,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 131 ->
    #{
        id => 2,
        level => 131,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 130 ->
    #{
        id => 2,
        level => 130,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 129 ->
    #{
        id => 2,
        level => 129,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 128 ->
    #{
        id => 2,
        level => 128,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 127 ->
    #{
        id => 2,
        level => 127,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 126 ->
    #{
        id => 2,
        level => 126,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 125 ->
    #{
        id => 2,
        level => 125,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 124 ->
    #{
        id => 2,
        level => 124,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 123 ->
    #{
        id => 2,
        level => 123,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 122 ->
    #{
        id => 2,
        level => 122,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 121 ->
    #{
        id => 2,
        level => 121,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 120 ->
    #{
        id => 2,
        level => 120,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 119 ->
    #{
        id => 2,
        level => 119,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 118 ->
    #{
        id => 2,
        level => 118,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 117 ->
    #{
        id => 2,
        level => 117,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 116 ->
    #{
        id => 2,
        level => 116,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 115 ->
    #{
        id => 2,
        level => 115,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 114 ->
    #{
        id => 2,
        level => 114,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 113 ->
    #{
        id => 2,
        level => 113,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 112 ->
    #{
        id => 2,
        level => 112,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 111 ->
    #{
        id => 2,
        level => 111,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 110 ->
    #{
        id => 2,
        level => 110,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 109 ->
    #{
        id => 2,
        level => 109,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 108 ->
    #{
        id => 2,
        level => 108,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 107 ->
    #{
        id => 2,
        level => 107,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 106 ->
    #{
        id => 2,
        level => 106,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 105 ->
    #{
        id => 2,
        level => 105,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 104 ->
    #{
        id => 2,
        level => 104,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 103 ->
    #{
        id => 2,
        level => 103,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 102 ->
    #{
        id => 2,
        level => 102,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 101 ->
    #{
        id => 2,
        level => 101,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 100 ->
    #{
        id => 2,
        level => 100,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 99 ->
    #{
        id => 2,
        level => 99,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 98 ->
    #{
        id => 2,
        level => 98,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 97 ->
    #{
        id => 2,
        level => 97,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 96 ->
    #{
        id => 2,
        level => 96,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 95 ->
    #{
        id => 2,
        level => 95,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 94 ->
    #{
        id => 2,
        level => 94,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 93 ->
    #{
        id => 2,
        level => 93,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 92 ->
    #{
        id => 2,
        level => 92,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 91 ->
    #{
        id => 2,
        level => 91,
        legend => 0,
        effect => [{#base_skill.mp, 1826}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 90 ->
    #{
        id => 2,
        level => 90,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 89 ->
    #{
        id => 2,
        level => 89,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 88 ->
    #{
        id => 2,
        level => 88,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 87 ->
    #{
        id => 2,
        level => 87,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 86 ->
    #{
        id => 2,
        level => 86,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 85 ->
    #{
        id => 2,
        level => 85,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 84 ->
    #{
        id => 2,
        level => 84,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 83 ->
    #{
        id => 2,
        level => 83,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 82 ->
    #{
        id => 2,
        level => 82,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 81 ->
    #{
        id => 2,
        level => 81,
        legend => 0,
        effect => [{#base_skill.mp, 1388}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 80 ->
    #{
        id => 2,
        level => 80,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 79 ->
    #{
        id => 2,
        level => 79,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 78 ->
    #{
        id => 2,
        level => 78,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 77 ->
    #{
        id => 2,
        level => 77,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 76 ->
    #{
        id => 2,
        level => 76,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 75 ->
    #{
        id => 2,
        level => 75,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 74 ->
    #{
        id => 2,
        level => 74,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 73 ->
    #{
        id => 2,
        level => 73,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 72 ->
    #{
        id => 2,
        level => 72,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 71 ->
    #{
        id => 2,
        level => 71,
        legend => 0,
        effect => [{#base_skill.mp, 966}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 70 ->
    #{
        id => 2,
        level => 70,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 69 ->
    #{
        id => 2,
        level => 69,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 68 ->
    #{
        id => 2,
        level => 68,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 67 ->
    #{
        id => 2,
        level => 67,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 66 ->
    #{
        id => 2,
        level => 66,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 65 ->
    #{
        id => 2,
        level => 65,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 64 ->
    #{
        id => 2,
        level => 64,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 63 ->
    #{
        id => 2,
        level => 63,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 62 ->
    #{
        id => 2,
        level => 62,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 61 ->
    #{
        id => 2,
        level => 61,
        legend => 0,
        effect => [{#base_skill.mp, 660}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 60 ->
    #{
        id => 2,
        level => 60,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 59 ->
    #{
        id => 2,
        level => 59,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 58 ->
    #{
        id => 2,
        level => 58,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 57 ->
    #{
        id => 2,
        level => 57,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 56 ->
    #{
        id => 2,
        level => 56,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 55 ->
    #{
        id => 2,
        level => 55,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 54 ->
    #{
        id => 2,
        level => 54,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 53 ->
    #{
        id => 2,
        level => 53,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 52 ->
    #{
        id => 2,
        level => 52,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 51 ->
    #{
        id => 2,
        level => 51,
        legend => 0,
        effect => [{#base_skill.mp, 440}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 50 ->
    #{
        id => 2,
        level => 50,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 49 ->
    #{
        id => 2,
        level => 49,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 48 ->
    #{
        id => 2,
        level => 48,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 47 ->
    #{
        id => 2,
        level => 47,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 46 ->
    #{
        id => 2,
        level => 46,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 45 ->
    #{
        id => 2,
        level => 45,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 44 ->
    #{
        id => 2,
        level => 44,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 43 ->
    #{
        id => 2,
        level => 43,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 42 ->
    #{
        id => 2,
        level => 42,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 41 ->
    #{
        id => 2,
        level => 41,
        legend => 0,
        effect => [{#base_skill.mp, 336}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 40 ->
    #{
        id => 2,
        level => 40,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 39 ->
    #{
        id => 2,
        level => 39,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 38 ->
    #{
        id => 2,
        level => 38,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 37 ->
    #{
        id => 2,
        level => 37,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 36 ->
    #{
        id => 2,
        level => 36,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 35 ->
    #{
        id => 2,
        level => 35,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 34 ->
    #{
        id => 2,
        level => 34,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 33 ->
    #{
        id => 2,
        level => 33,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 32 ->
    #{
        id => 2,
        level => 32,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 31 ->
    #{
        id => 2,
        level => 31,
        legend => 0,
        effect => [{#base_skill.mp, 254}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 30 ->
    #{
        id => 2,
        level => 30,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 29 ->
    #{
        id => 2,
        level => 29,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 28 ->
    #{
        id => 2,
        level => 28,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 27 ->
    #{
        id => 2,
        level => 27,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 26 ->
    #{
        id => 2,
        level => 26,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 25 ->
    #{
        id => 2,
        level => 25,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 24 ->
    #{
        id => 2,
        level => 24,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 23 ->
    #{
        id => 2,
        level => 23,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 22 ->
    #{
        id => 2,
        level => 22,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 21 ->
    #{
        id => 2,
        level => 21,
        legend => 0,
        effect => [{#base_skill.mp, 184}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 20 ->
    #{
        id => 2,
        level => 20,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 19 ->
    #{
        id => 2,
        level => 19,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 18 ->
    #{
        id => 2,
        level => 18,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 17 ->
    #{
        id => 2,
        level => 17,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 16 ->
    #{
        id => 2,
        level => 16,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 15 ->
    #{
        id => 2,
        level => 15,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 14 ->
    #{
        id => 2,
        level => 14,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 13 ->
    #{
        id => 2,
        level => 13,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 12 ->
    #{
        id => 2,
        level => 12,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 11 ->
    #{
        id => 2,
        level => 11,
        legend => 0,
        effect => [{#base_skill.mp, 112}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 10 ->
    #{
        id => 2,
        level => 10,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 9 ->
    #{
        id => 2,
        level => 9,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 8 ->
    #{
        id => 2,
        level => 8,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 7 ->
    #{
        id => 2,
        level => 7,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 6 ->
    #{
        id => 2,
        level => 6,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 5 ->
    #{
        id => 2,
        level => 5,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 4 ->
    #{
        id => 2,
        level => 4,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 3 ->
    #{
        id => 2,
        level => 3,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 2 ->
    #{
        id => 2,
        level => 2,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 2, 0}) when Level >= 1 ->
    #{
        id => 2,
        level => 1,
        legend => 0,
        effect => [{#base_skill.mp, 44}, {#base_skill.self_buff, [{10000,2007}]}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10030017, Level, 2, 0}) when Level >= 1 ->
    #{
        id => 2,
        level => 1,
        legend => 0,
        effect => [{#base_skill.rec_blood_ratio, 10000}, {#base_skill.rec_blood_perc, 4000}, {#base_skill.hero, 2}, {#base_skill.legend, 0}]
    };
get({10010018, Level, 3, 0}) when Level >= 1 ->
    #{
        id => 3,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1006,1}]}, {#base_skill.hero, 3}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 3, 0}) when Level >= 1 ->
    #{
        id => 3,
        level => 1,
        legend => 0,
        effect => [{#base_skill.pos_skill, 10042018}, {#base_skill.hero, 3}, {#base_skill.legend, 0}]
    };
get({10020018, Level, 3, 0}) when Level >= 1 ->
    #{
        id => 3,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 0}, {#base_skill.hero, 3}, {#base_skill.legend, 0}]
    };
get({10030018, Level, 3, 0}) when Level >= 1 ->
    #{
        id => 3,
        level => 1,
        legend => 0,
        effect => [{#base_skill.to_obj, 6}, {#base_skill.self_buff, [{10000,10,1}]}, {#base_skill.target_buff, [{10000,3015,1}]}, {#base_skill.hero, 3}, {#base_skill.legend, 0}]
    };
get({10010014, Level, 4, 0}) when Level >= 1 ->
    #{
        id => 4,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10}]}, {#base_skill.att_times, [0,800,1600,2400,3200,4000,4800,5600,6400,7200]}, {#base_skill.self_buff, [{10000,1021,1}]}, {#base_skill.hero, 4}, {#base_skill.legend, 0}]
    };
get({10040014, Level, 4, 0}) when Level >= 1 ->
    #{
        id => 4,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4001},{10000,4007}]}, {#base_skill.hero, 4}, {#base_skill.legend, 0}]
    };
get({10020014, Level, 4, 0}) when Level >= 1 ->
    #{
        id => 4,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 50000}, {#base_skill.target_buff, [{10000,2003,1}]}, {#base_skill.hero, 4}, {#base_skill.legend, 0}]
    };
get({10030014, Level, 4, 0}) when Level >= 1 ->
    #{
        id => 4,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{1,1,3000}],5000}}, {#base_skill.hero, 4}, {#base_skill.legend, 0}]
    };
get({10010013, Level, 5, 0}) when Level >= 1 ->
    #{
        id => 5,
        level => 1,
        legend => 0,
        effect => [{#base_skill.to_obj, 2}, {#base_skill.hero, 5}, {#base_skill.legend, 0}]
    };
get({10040013, Level, 5, 0}) when Level >= 1 ->
    #{
        id => 5,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_buff, {{0,3,16},{1,{4008,1}}}}, {#base_skill.hero, 5}, {#base_skill.legend, 0}]
    };
get({10020013, Level, 5, 0}) when Level >= 1 ->
    #{
        id => 5,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 7500}, {#base_skill.hero, 5}, {#base_skill.legend, 0}]
    };
get({10030013, Level, 5, 0}) when Level >= 1 ->
    #{
        id => 5,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,3024,1}]}, {#base_skill.target_buff, [{10000,10,1}]}, {#base_skill.hero, 5}, {#base_skill.legend, 0}]
    };
get({10010012, Level, 6, 0}) when Level >= 1 ->
    #{
        id => 6,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,10,1}]}, {#base_skill.extra_harm, {[{0,1,10000}], 10000}}, {#base_skill.hero, 6}, {#base_skill.legend, 0}]
    };
get({10040012, Level, 6, 0}) when Level >= 1 ->
    #{
        id => 6,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,4019,1}]}, {#base_skill.hero, 6}, {#base_skill.legend, 0}]
    };
get({10020012, Level, 6, 0}) when Level >= 1 ->
    #{
        id => 6,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,2008}]}, {#base_skill.hero, 6}, {#base_skill.legend, 0}]
    };
get({10030012, Level, 6, 0}) when Level >= 1 ->
    #{
        id => 6,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,3005,1}]}, {#base_skill.hero, 6}, {#base_skill.legend, 0}]
    };
get({10010015, Level, 7, 0}) when Level >= 1 ->
    #{
        id => 7,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_num, 6}, {#base_skill.att_area, [{3,6,18}]}, {#base_skill.hero, 7}, {#base_skill.legend, 0}]
    };
get({10040015, Level, 7, 0}) when Level >= 1 ->
    #{
        id => 7,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 60000}, {#base_skill.to_obj, 6}, {#base_skill.att_num, 5}, {#base_skill.att_area, [{4,0,16}]}, {#base_skill.att_times, [0]}, {#base_skill.target_buff, [{10000,4002}]}, {#base_skill.hero, 7}, {#base_skill.legend, 0}]
    };
get({10020015, Level, 7, 0}) when Level >= 1 ->
    #{
        id => 7,
        level => 1,
        legend => 0,
        effect => [{#base_skill.category, 10}, {#base_skill.hero, 7}, {#base_skill.legend, 0}]
    };
get({10030015, Level, 7, 0}) when Level >= 1 ->
    #{
        id => 7,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,3006,1}]}, {#base_skill.hero, 7}, {#base_skill.legend, 0}]
    };
get({10010011, Level, 8, 0}) when Level >= 1 ->
    #{
        id => 8,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,5000}], 3000}}, {#base_skill.hero, 8}, {#base_skill.legend, 0}]
    };
get({10040011, Level, 8, 0}) when Level >= 1 ->
    #{
        id => 8,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_buff, {{0,4,1},{0,{4009,1}}}}, {#base_skill.hero, 8}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 8, 0}) when Level >= 1 ->
    #{
        id => 8,
        level => 1,
        legend => 0,
        effect => [{#base_skill.remove_cd, [{800,10020014}]}, {#base_skill.hero, 8}, {#base_skill.legend, 0}]
    };
get({10030011, Level, 8, 0}) when Level >= 1 ->
    #{
        id => 8,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{1,22}]}, {#base_skill.hero, 8}, {#base_skill.legend, 0}]
    };
get({10010012, Level, 9, 0}) when Level >= 1 ->
    #{
        id => 9,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,1015,1}]}, {#base_skill.hero, 9}, {#base_skill.legend, 0}]
    };
get({10040012, Level, 9, 0}) when Level >= 1 ->
    #{
        id => 9,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4001,255},{10000,4012,255},{10000,4014,255},{10000,4017,255}]}, {#base_skill.hero, 9}, {#base_skill.legend, 0}]
    };
get({10020012, Level, 9, 0}) when Level >= 1 ->
    #{
        id => 9,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,2023,1}]}, {#base_skill.hero, 9}, {#base_skill.legend, 0}]
    };
get({10030012, Level, 9, 0}) when Level >= 1 ->
    #{
        id => 9,
        level => 1,
        legend => 0,
        effect => [{#base_skill.to_obj, 6}, {#base_skill.att_num, 1}, {#base_skill.target_buff, [{10000,3018,1}]}, {#base_skill.sp, 2}, {#base_skill.hero, 9}, {#base_skill.legend, 0}]
    };
get({10010016, Level, 10, 0}) when Level >= 1 ->
    #{
        id => 10,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_buff, {{0,5,3},{0,{1014,1}}}}, {#base_skill.hero, 10}, {#base_skill.legend, 0}]
    };
get({10040016, Level, 10, 0}) when Level >= 1 ->
    #{
        id => 10,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4001,255},{10000,4012,255},{10000,4014,255},{10000,4017,255}]}, {#base_skill.hero, 10}, {#base_skill.legend, 0}]
    };
get({10020016, Level, 10, 0}) when Level >= 1 ->
    #{
        id => 10,
        level => 1,
        legend => 0,
        effect => [{#base_skill.remove_cd, [{1500,10020014}]}, {#base_skill.hero, 10}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 10, 0}) when Level >= 1 ->
    #{
        id => 10,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,3019}]}, {#base_skill.hero, 10}, {#base_skill.legend, 0}]
    };
get({10010015, Level, 11, 0}) when Level >= 1 ->
    #{
        id => 11,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,10,1}]}, {#base_skill.extra_harm, {[{0,1,10000}], 20000}}, {#base_skill.hero, 11}, {#base_skill.legend, 0}]
    };
get({10040015, Level, 11, 0}) when Level >= 1 ->
    #{
        id => 11,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4016}]}, {#base_skill.hero, 11}, {#base_skill.legend, 0}]
    };
get({10020015, Level, 11, 0}) when Level >= 1 ->
    #{
        id => 11,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,2010,1}]}, {#base_skill.hero, 11}, {#base_skill.legend, 0}]
    };
get({10030015, Level, 11, 0}) when Level >= 1 ->
    #{
        id => 11,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,3007,1}]}, {#base_skill.hero, 11}, {#base_skill.legend, 0}]
    };
get({10010018, Level, 12, 0}) when Level >= 1 ->
    #{
        id => 12,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,1007,1}]}, {#base_skill.hero, 12}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 12, 0}) when Level >= 1 ->
    #{
        id => 12,
        level => 1,
        legend => 0,
        effect => [{#base_skill.to_obj, 2}, {#base_skill.pos_type, 1}, {#base_skill.pos_dist, 15}, {#base_skill.pos_time, 200}, {#base_skill.pos_skill, 10043018}, {#base_skill.hero, 12}, {#base_skill.legend, 0}]
    };
get({10020018, Level, 12, 0}) when Level >= 1 ->
    #{
        id => 12,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_num, 6}, {#base_skill.att_area, [{4,16,4},{4,16,4},{4,16,4},{4,16,4}]}, {#base_skill.att_times, [600,700,800,900]}, {#base_skill.hero, 12}, {#base_skill.legend, 0}]
    };
get({10030018, Level, 12, 0}) when Level >= 1 ->
    #{
        id => 12,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,3004,1},{10000,3008,1}]}, {#base_skill.hero, 12}, {#base_skill.legend, 0}]
    };
get({10010014, Level, 13, 0}) when Level >= 1 ->
    #{
        id => 13,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1009,1},{10000,1002,1}]}, {#base_skill.hero, 13}, {#base_skill.legend, 0}]
    };
get({10040014, Level, 13, 0}) when Level >= 1 ->
    #{
        id => 13,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4017}]}, {#base_skill.hero, 13}, {#base_skill.legend, 0}]
    };
get({10020014, Level, 13, 0}) when Level >= 1 ->
    #{
        id => 13,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,2011,1}]}, {#base_skill.hero, 13}, {#base_skill.legend, 0}]
    };
get({10030014, Level, 13, 0}) when Level >= 1 ->
    #{
        id => 13,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,3016}]}, {#base_skill.hero, 13}, {#base_skill.legend, 0}]
    };
get({10010017, Level, 14, 0}) when Level >= 1 ->
    #{
        id => 14,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1010,1},{10000,1004}]}, {#base_skill.hero, 14}, {#base_skill.legend, 0}]
    };
get({10040017, Level, 14, 0}) when Level >= 1 ->
    #{
        id => 14,
        level => 1,
        legend => 0,
        effect => [{#base_skill.category, 1}, {#base_skill.cd, 23000}, {#base_skill.dup_ratio, [0]}, {#base_skill.dup_skill, 0}, {#base_skill.hero, 14}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 14, 0}) when Level >= 1 ->
    #{
        id => 14,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,2005},{10000,2013}]}, {#base_skill.hero, 14}, {#base_skill.legend, 0}]
    };
get({10030017, Level, 14, 0}) when Level >= 1 ->
    #{
        id => 14,
        level => 1,
        legend => 0,
        effect => [{#base_skill.category, 26}, {#base_skill.hero, 14}, {#base_skill.legend, 0}]
    };
get({10010013, Level, 15, 0}) when Level >= 1 ->
    #{
        id => 15,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1019}]}, {#base_skill.hero, 15}, {#base_skill.legend, 0}]
    };
get({10040013, Level, 15, 0}) when Level >= 1 ->
    #{
        id => 15,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 12500}, {#base_skill.extra_harm, {[{0,1,10000}], -2000}}, {#base_skill.hero, 15}, {#base_skill.legend, 0}]
    };
get({10020013, Level, 15, 0}) when Level >= 1 ->
    #{
        id => 15,
        level => 1,
        legend => 0,
        effect => [{#base_skill.flyitems, [1005]}, {#base_skill.hero, 15}, {#base_skill.legend, 0}]
    };
get({10030013, Level, 15, 0}) when Level >= 1 ->
    #{
        id => 15,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_num, 6}, {#base_skill.att_area, [{4,16,6}]}, {#base_skill.hero, 15}, {#base_skill.legend, 0}]
    };
get({10010011, Level, 16, 0}) when Level >= 1 ->
    #{
        id => 16,
        level => 1,
        legend => 0,
        effect => [{#base_skill.category, 10}, {#base_skill.hero, 16}, {#base_skill.legend, 0}]
    };
get({10040011, Level, 16, 0}) when Level >= 1 ->
    #{
        id => 16,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,3,16},{0,2,102}], 7000}}, {#base_skill.hero, 16}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 16, 0}) when Level >= 1 ->
    #{
        id => 16,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{1,8,11714}],3000}}, {#base_skill.hero, 16}, {#base_skill.legend, 0}]
    };
get({10030011, Level, 16, 0}) when Level >= 1 ->
    #{
        id => 16,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{1,6,7000}],5000}}, {#base_skill.hero, 16}, {#base_skill.legend, 0}]
    };
get({10010012, Level, 17, 0}) when Level >= 1 ->
    #{
        id => 17,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1022}]}, {#base_skill.hero, 17}, {#base_skill.legend, 0}]
    };
get({10040012, Level, 17, 0}) when Level >= 1 ->
    #{
        id => 17,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}], 1500}}, {#base_skill.hero, 17}, {#base_skill.legend, 0}]
    };
get({10020012, Level, 17, 0}) when Level >= 1 ->
    #{
        id => 17,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,2022}]}, {#base_skill.hero, 17}, {#base_skill.legend, 0}]
    };
get({10030012, Level, 17, 0}) when Level >= 1 ->
    #{
        id => 17,
        level => 1,
        legend => 0,
        effect => [{#base_skill.hero, 17}, {#base_skill.legend, 0}]
    };
get({10010017, Level, 18, 0}) when Level >= 1 ->
    #{
        id => 18,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1012,1},{10000,1004}]}, {#base_skill.hero, 18}, {#base_skill.legend, 0}]
    };
get({10040017, Level, 18, 0}) when Level >= 1 ->
    #{
        id => 18,
        level => 1,
        legend => 0,
        effect => [{#base_skill.dup_ratio, [{6000,0},{2500,1},{1500,2},{1000,3}]}, {#base_skill.dup_skill, 10041017}, {#base_skill.hero, 18}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 18, 0}) when Level >= 1 ->
    #{
        id => 18,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,2005},{10000,2015}]}, {#base_skill.hero, 18}, {#base_skill.legend, 0}]
    };
get({10030017, Level, 18, 0}) when Level >= 1 ->
    #{
        id => 18,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,3009,1}]}, {#base_skill.hero, 18}, {#base_skill.legend, 0}]
    };
get({10010011, Level, 19, 0}) when Level >= 1 ->
    #{
        id => 19,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{3000,1015,1}]}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10040011, Level, 19, 0}) when Level >= 1 ->
    #{
        id => 19,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 4000}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 200 ->
    #{
        id => 19,
        level => 200,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 199 ->
    #{
        id => 19,
        level => 199,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 198 ->
    #{
        id => 19,
        level => 198,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 197 ->
    #{
        id => 19,
        level => 197,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 196 ->
    #{
        id => 19,
        level => 196,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 195 ->
    #{
        id => 19,
        level => 195,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 194 ->
    #{
        id => 19,
        level => 194,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 193 ->
    #{
        id => 19,
        level => 193,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 192 ->
    #{
        id => 19,
        level => 192,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 191 ->
    #{
        id => 19,
        level => 191,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 190 ->
    #{
        id => 19,
        level => 190,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 189 ->
    #{
        id => 19,
        level => 189,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 188 ->
    #{
        id => 19,
        level => 188,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 187 ->
    #{
        id => 19,
        level => 187,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 186 ->
    #{
        id => 19,
        level => 186,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 185 ->
    #{
        id => 19,
        level => 185,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 184 ->
    #{
        id => 19,
        level => 184,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 183 ->
    #{
        id => 19,
        level => 183,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 182 ->
    #{
        id => 19,
        level => 182,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 181 ->
    #{
        id => 19,
        level => 181,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 180 ->
    #{
        id => 19,
        level => 180,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 179 ->
    #{
        id => 19,
        level => 179,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 178 ->
    #{
        id => 19,
        level => 178,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 177 ->
    #{
        id => 19,
        level => 177,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 176 ->
    #{
        id => 19,
        level => 176,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 175 ->
    #{
        id => 19,
        level => 175,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 174 ->
    #{
        id => 19,
        level => 174,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 173 ->
    #{
        id => 19,
        level => 173,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 172 ->
    #{
        id => 19,
        level => 172,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 171 ->
    #{
        id => 19,
        level => 171,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 170 ->
    #{
        id => 19,
        level => 170,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 169 ->
    #{
        id => 19,
        level => 169,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 168 ->
    #{
        id => 19,
        level => 168,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 167 ->
    #{
        id => 19,
        level => 167,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 166 ->
    #{
        id => 19,
        level => 166,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 165 ->
    #{
        id => 19,
        level => 165,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 164 ->
    #{
        id => 19,
        level => 164,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 163 ->
    #{
        id => 19,
        level => 163,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 162 ->
    #{
        id => 19,
        level => 162,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 161 ->
    #{
        id => 19,
        level => 161,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 160 ->
    #{
        id => 19,
        level => 160,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 159 ->
    #{
        id => 19,
        level => 159,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 158 ->
    #{
        id => 19,
        level => 158,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 157 ->
    #{
        id => 19,
        level => 157,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 156 ->
    #{
        id => 19,
        level => 156,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 155 ->
    #{
        id => 19,
        level => 155,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 154 ->
    #{
        id => 19,
        level => 154,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 153 ->
    #{
        id => 19,
        level => 153,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 152 ->
    #{
        id => 19,
        level => 152,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 151 ->
    #{
        id => 19,
        level => 151,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 150 ->
    #{
        id => 19,
        level => 150,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 149 ->
    #{
        id => 19,
        level => 149,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 148 ->
    #{
        id => 19,
        level => 148,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 147 ->
    #{
        id => 19,
        level => 147,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 146 ->
    #{
        id => 19,
        level => 146,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 145 ->
    #{
        id => 19,
        level => 145,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 144 ->
    #{
        id => 19,
        level => 144,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 143 ->
    #{
        id => 19,
        level => 143,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 142 ->
    #{
        id => 19,
        level => 142,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 141 ->
    #{
        id => 19,
        level => 141,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 140 ->
    #{
        id => 19,
        level => 140,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 139 ->
    #{
        id => 19,
        level => 139,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 138 ->
    #{
        id => 19,
        level => 138,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 137 ->
    #{
        id => 19,
        level => 137,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 136 ->
    #{
        id => 19,
        level => 136,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 135 ->
    #{
        id => 19,
        level => 135,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 134 ->
    #{
        id => 19,
        level => 134,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 133 ->
    #{
        id => 19,
        level => 133,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 132 ->
    #{
        id => 19,
        level => 132,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 131 ->
    #{
        id => 19,
        level => 131,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 130 ->
    #{
        id => 19,
        level => 130,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 129 ->
    #{
        id => 19,
        level => 129,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 128 ->
    #{
        id => 19,
        level => 128,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 127 ->
    #{
        id => 19,
        level => 127,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 126 ->
    #{
        id => 19,
        level => 126,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 125 ->
    #{
        id => 19,
        level => 125,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 124 ->
    #{
        id => 19,
        level => 124,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 123 ->
    #{
        id => 19,
        level => 123,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 122 ->
    #{
        id => 19,
        level => 122,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 121 ->
    #{
        id => 19,
        level => 121,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 120 ->
    #{
        id => 19,
        level => 120,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 119 ->
    #{
        id => 19,
        level => 119,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 118 ->
    #{
        id => 19,
        level => 118,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 117 ->
    #{
        id => 19,
        level => 117,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 116 ->
    #{
        id => 19,
        level => 116,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 115 ->
    #{
        id => 19,
        level => 115,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 114 ->
    #{
        id => 19,
        level => 114,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 113 ->
    #{
        id => 19,
        level => 113,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 112 ->
    #{
        id => 19,
        level => 112,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 111 ->
    #{
        id => 19,
        level => 111,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 110 ->
    #{
        id => 19,
        level => 110,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 109 ->
    #{
        id => 19,
        level => 109,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 108 ->
    #{
        id => 19,
        level => 108,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 107 ->
    #{
        id => 19,
        level => 107,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 106 ->
    #{
        id => 19,
        level => 106,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 105 ->
    #{
        id => 19,
        level => 105,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 104 ->
    #{
        id => 19,
        level => 104,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 103 ->
    #{
        id => 19,
        level => 103,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 102 ->
    #{
        id => 19,
        level => 102,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 101 ->
    #{
        id => 19,
        level => 101,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 100 ->
    #{
        id => 19,
        level => 100,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 99 ->
    #{
        id => 19,
        level => 99,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 98 ->
    #{
        id => 19,
        level => 98,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 97 ->
    #{
        id => 19,
        level => 97,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 96 ->
    #{
        id => 19,
        level => 96,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 95 ->
    #{
        id => 19,
        level => 95,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 94 ->
    #{
        id => 19,
        level => 94,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 93 ->
    #{
        id => 19,
        level => 93,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 92 ->
    #{
        id => 19,
        level => 92,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 91 ->
    #{
        id => 19,
        level => 91,
        legend => 0,
        effect => [{#base_skill.mp, 475}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 90 ->
    #{
        id => 19,
        level => 90,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 89 ->
    #{
        id => 19,
        level => 89,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 88 ->
    #{
        id => 19,
        level => 88,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 87 ->
    #{
        id => 19,
        level => 87,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 86 ->
    #{
        id => 19,
        level => 86,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 85 ->
    #{
        id => 19,
        level => 85,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 84 ->
    #{
        id => 19,
        level => 84,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 83 ->
    #{
        id => 19,
        level => 83,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 82 ->
    #{
        id => 19,
        level => 82,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 81 ->
    #{
        id => 19,
        level => 81,
        legend => 0,
        effect => [{#base_skill.mp, 360}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 80 ->
    #{
        id => 19,
        level => 80,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 79 ->
    #{
        id => 19,
        level => 79,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 78 ->
    #{
        id => 19,
        level => 78,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 77 ->
    #{
        id => 19,
        level => 77,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 76 ->
    #{
        id => 19,
        level => 76,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 75 ->
    #{
        id => 19,
        level => 75,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 74 ->
    #{
        id => 19,
        level => 74,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 73 ->
    #{
        id => 19,
        level => 73,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 72 ->
    #{
        id => 19,
        level => 72,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 71 ->
    #{
        id => 19,
        level => 71,
        legend => 0,
        effect => [{#base_skill.mp, 251}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 70 ->
    #{
        id => 19,
        level => 70,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 69 ->
    #{
        id => 19,
        level => 69,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 68 ->
    #{
        id => 19,
        level => 68,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 67 ->
    #{
        id => 19,
        level => 67,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 66 ->
    #{
        id => 19,
        level => 66,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 65 ->
    #{
        id => 19,
        level => 65,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 64 ->
    #{
        id => 19,
        level => 64,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 63 ->
    #{
        id => 19,
        level => 63,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 62 ->
    #{
        id => 19,
        level => 62,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 61 ->
    #{
        id => 19,
        level => 61,
        legend => 0,
        effect => [{#base_skill.mp, 172}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 60 ->
    #{
        id => 19,
        level => 60,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 59 ->
    #{
        id => 19,
        level => 59,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 58 ->
    #{
        id => 19,
        level => 58,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 57 ->
    #{
        id => 19,
        level => 57,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 56 ->
    #{
        id => 19,
        level => 56,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 55 ->
    #{
        id => 19,
        level => 55,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 54 ->
    #{
        id => 19,
        level => 54,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 53 ->
    #{
        id => 19,
        level => 53,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 52 ->
    #{
        id => 19,
        level => 52,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 51 ->
    #{
        id => 19,
        level => 51,
        legend => 0,
        effect => [{#base_skill.mp, 114}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 50 ->
    #{
        id => 19,
        level => 50,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 49 ->
    #{
        id => 19,
        level => 49,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 48 ->
    #{
        id => 19,
        level => 48,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 47 ->
    #{
        id => 19,
        level => 47,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 46 ->
    #{
        id => 19,
        level => 46,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 45 ->
    #{
        id => 19,
        level => 45,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 44 ->
    #{
        id => 19,
        level => 44,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 43 ->
    #{
        id => 19,
        level => 43,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 42 ->
    #{
        id => 19,
        level => 42,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 41 ->
    #{
        id => 19,
        level => 41,
        legend => 0,
        effect => [{#base_skill.mp, 87}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 40 ->
    #{
        id => 19,
        level => 40,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 39 ->
    #{
        id => 19,
        level => 39,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 38 ->
    #{
        id => 19,
        level => 38,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 37 ->
    #{
        id => 19,
        level => 37,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 36 ->
    #{
        id => 19,
        level => 36,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 35 ->
    #{
        id => 19,
        level => 35,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 34 ->
    #{
        id => 19,
        level => 34,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 33 ->
    #{
        id => 19,
        level => 33,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 32 ->
    #{
        id => 19,
        level => 32,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 31 ->
    #{
        id => 19,
        level => 31,
        legend => 0,
        effect => [{#base_skill.mp, 65}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 30 ->
    #{
        id => 19,
        level => 30,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 29 ->
    #{
        id => 19,
        level => 29,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 28 ->
    #{
        id => 19,
        level => 28,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 27 ->
    #{
        id => 19,
        level => 27,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 26 ->
    #{
        id => 19,
        level => 26,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 25 ->
    #{
        id => 19,
        level => 25,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 24 ->
    #{
        id => 19,
        level => 24,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 23 ->
    #{
        id => 19,
        level => 23,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 22 ->
    #{
        id => 19,
        level => 22,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 21 ->
    #{
        id => 19,
        level => 21,
        legend => 0,
        effect => [{#base_skill.mp, 47}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 20 ->
    #{
        id => 19,
        level => 20,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 19 ->
    #{
        id => 19,
        level => 19,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 18 ->
    #{
        id => 19,
        level => 18,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 17 ->
    #{
        id => 19,
        level => 17,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 16 ->
    #{
        id => 19,
        level => 16,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 15 ->
    #{
        id => 19,
        level => 15,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 14 ->
    #{
        id => 19,
        level => 14,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 13 ->
    #{
        id => 19,
        level => 13,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 12 ->
    #{
        id => 19,
        level => 12,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 11 ->
    #{
        id => 19,
        level => 11,
        legend => 0,
        effect => [{#base_skill.mp, 29}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 10 ->
    #{
        id => 19,
        level => 10,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 9 ->
    #{
        id => 19,
        level => 9,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 8 ->
    #{
        id => 19,
        level => 8,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 7 ->
    #{
        id => 19,
        level => 7,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 6 ->
    #{
        id => 19,
        level => 6,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 5 ->
    #{
        id => 19,
        level => 5,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 4 ->
    #{
        id => 19,
        level => 4,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 3 ->
    #{
        id => 19,
        level => 3,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 2 ->
    #{
        id => 19,
        level => 2,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 19, 0}) when Level >= 1 ->
    #{
        id => 19,
        level => 1,
        legend => 0,
        effect => [{#base_skill.mp, 12}, {#base_skill.extra_harm, {[{0,1,10000}], 3000}}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10030011, Level, 19, 0}) when Level >= 1 ->
    #{
        id => 19,
        level => 1,
        legend => 0,
        effect => [{#base_skill.rec_magic_ratio, 2000}, {#base_skill.rec_magic_perc, 500}, {#base_skill.hero, 19}, {#base_skill.legend, 0}]
    };
get({10010013, Level, 20, 0}) when Level >= 1 ->
    #{
        id => 20,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{4,0,12}]}, {#base_skill.hero, 20}, {#base_skill.legend, 0}]
    };
get({10040013, Level, 20, 0}) when Level >= 1 ->
    #{
        id => 20,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}], 1500}}, {#base_skill.hero, 20}, {#base_skill.legend, 0}]
    };
get({10020013, Level, 20, 0}) when Level >= 1 ->
    #{
        id => 20,
        level => 1,
        legend => 0,
        effect => [{#base_skill.flyitems, [1003]}, {#base_skill.hero, 20}, {#base_skill.legend, 0}]
    };
get({10030013, Level, 20, 0}) when Level >= 1 ->
    #{
        id => 20,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,3010,1}]}, {#base_skill.hero, 20}, {#base_skill.legend, 0}]
    };
get({10010016, Level, 21, 0}) when Level >= 1 ->
    #{
        id => 21,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{1,8,10403}],5000}}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10040016, Level, 21, 0}) when Level >= 1 ->
    #{
        id => 21,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4018,1}]}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10020016, Level, 21, 0}) when Level >= 1 ->
    #{
        id => 21,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{1,7,6}], 5000}}, {#base_skill.extra_buff, {{1,7,6},{1,{2017,1}}}}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 200 ->
    #{
        id => 21,
        level => 200,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 199 ->
    #{
        id => 21,
        level => 199,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 198 ->
    #{
        id => 21,
        level => 198,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 197 ->
    #{
        id => 21,
        level => 197,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 196 ->
    #{
        id => 21,
        level => 196,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 195 ->
    #{
        id => 21,
        level => 195,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 194 ->
    #{
        id => 21,
        level => 194,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 193 ->
    #{
        id => 21,
        level => 193,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 192 ->
    #{
        id => 21,
        level => 192,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 191 ->
    #{
        id => 21,
        level => 191,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 190 ->
    #{
        id => 21,
        level => 190,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 189 ->
    #{
        id => 21,
        level => 189,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 188 ->
    #{
        id => 21,
        level => 188,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 187 ->
    #{
        id => 21,
        level => 187,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 186 ->
    #{
        id => 21,
        level => 186,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 185 ->
    #{
        id => 21,
        level => 185,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 184 ->
    #{
        id => 21,
        level => 184,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 183 ->
    #{
        id => 21,
        level => 183,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 182 ->
    #{
        id => 21,
        level => 182,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 181 ->
    #{
        id => 21,
        level => 181,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 180 ->
    #{
        id => 21,
        level => 180,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 179 ->
    #{
        id => 21,
        level => 179,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 178 ->
    #{
        id => 21,
        level => 178,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 177 ->
    #{
        id => 21,
        level => 177,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 176 ->
    #{
        id => 21,
        level => 176,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 175 ->
    #{
        id => 21,
        level => 175,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 174 ->
    #{
        id => 21,
        level => 174,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 173 ->
    #{
        id => 21,
        level => 173,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 172 ->
    #{
        id => 21,
        level => 172,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 171 ->
    #{
        id => 21,
        level => 171,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 170 ->
    #{
        id => 21,
        level => 170,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 169 ->
    #{
        id => 21,
        level => 169,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 168 ->
    #{
        id => 21,
        level => 168,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 167 ->
    #{
        id => 21,
        level => 167,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 166 ->
    #{
        id => 21,
        level => 166,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 165 ->
    #{
        id => 21,
        level => 165,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 164 ->
    #{
        id => 21,
        level => 164,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 163 ->
    #{
        id => 21,
        level => 163,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 162 ->
    #{
        id => 21,
        level => 162,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 161 ->
    #{
        id => 21,
        level => 161,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 160 ->
    #{
        id => 21,
        level => 160,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 159 ->
    #{
        id => 21,
        level => 159,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 158 ->
    #{
        id => 21,
        level => 158,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 157 ->
    #{
        id => 21,
        level => 157,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 156 ->
    #{
        id => 21,
        level => 156,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 155 ->
    #{
        id => 21,
        level => 155,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 154 ->
    #{
        id => 21,
        level => 154,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 153 ->
    #{
        id => 21,
        level => 153,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 152 ->
    #{
        id => 21,
        level => 152,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 151 ->
    #{
        id => 21,
        level => 151,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 150 ->
    #{
        id => 21,
        level => 150,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 149 ->
    #{
        id => 21,
        level => 149,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 148 ->
    #{
        id => 21,
        level => 148,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 147 ->
    #{
        id => 21,
        level => 147,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 146 ->
    #{
        id => 21,
        level => 146,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 145 ->
    #{
        id => 21,
        level => 145,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 144 ->
    #{
        id => 21,
        level => 144,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 143 ->
    #{
        id => 21,
        level => 143,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 142 ->
    #{
        id => 21,
        level => 142,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 141 ->
    #{
        id => 21,
        level => 141,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 140 ->
    #{
        id => 21,
        level => 140,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 139 ->
    #{
        id => 21,
        level => 139,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 138 ->
    #{
        id => 21,
        level => 138,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 137 ->
    #{
        id => 21,
        level => 137,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 136 ->
    #{
        id => 21,
        level => 136,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 135 ->
    #{
        id => 21,
        level => 135,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 134 ->
    #{
        id => 21,
        level => 134,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 133 ->
    #{
        id => 21,
        level => 133,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 132 ->
    #{
        id => 21,
        level => 132,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 131 ->
    #{
        id => 21,
        level => 131,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 130 ->
    #{
        id => 21,
        level => 130,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 129 ->
    #{
        id => 21,
        level => 129,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 128 ->
    #{
        id => 21,
        level => 128,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 127 ->
    #{
        id => 21,
        level => 127,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 126 ->
    #{
        id => 21,
        level => 126,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 125 ->
    #{
        id => 21,
        level => 125,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 124 ->
    #{
        id => 21,
        level => 124,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 123 ->
    #{
        id => 21,
        level => 123,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 122 ->
    #{
        id => 21,
        level => 122,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 121 ->
    #{
        id => 21,
        level => 121,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 120 ->
    #{
        id => 21,
        level => 120,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 119 ->
    #{
        id => 21,
        level => 119,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 118 ->
    #{
        id => 21,
        level => 118,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 117 ->
    #{
        id => 21,
        level => 117,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 116 ->
    #{
        id => 21,
        level => 116,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 115 ->
    #{
        id => 21,
        level => 115,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 114 ->
    #{
        id => 21,
        level => 114,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 113 ->
    #{
        id => 21,
        level => 113,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 112 ->
    #{
        id => 21,
        level => 112,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 111 ->
    #{
        id => 21,
        level => 111,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 110 ->
    #{
        id => 21,
        level => 110,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 109 ->
    #{
        id => 21,
        level => 109,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 108 ->
    #{
        id => 21,
        level => 108,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 107 ->
    #{
        id => 21,
        level => 107,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 106 ->
    #{
        id => 21,
        level => 106,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 105 ->
    #{
        id => 21,
        level => 105,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 104 ->
    #{
        id => 21,
        level => 104,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 103 ->
    #{
        id => 21,
        level => 103,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 102 ->
    #{
        id => 21,
        level => 102,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 101 ->
    #{
        id => 21,
        level => 101,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 100 ->
    #{
        id => 21,
        level => 100,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 99 ->
    #{
        id => 21,
        level => 99,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 98 ->
    #{
        id => 21,
        level => 98,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 97 ->
    #{
        id => 21,
        level => 97,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 96 ->
    #{
        id => 21,
        level => 96,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 95 ->
    #{
        id => 21,
        level => 95,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 94 ->
    #{
        id => 21,
        level => 94,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 93 ->
    #{
        id => 21,
        level => 93,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 92 ->
    #{
        id => 21,
        level => 92,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 91 ->
    #{
        id => 21,
        level => 91,
        legend => 0,
        effect => [{#base_skill.mp, 456}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 90 ->
    #{
        id => 21,
        level => 90,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 89 ->
    #{
        id => 21,
        level => 89,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 88 ->
    #{
        id => 21,
        level => 88,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 87 ->
    #{
        id => 21,
        level => 87,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 86 ->
    #{
        id => 21,
        level => 86,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 85 ->
    #{
        id => 21,
        level => 85,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 84 ->
    #{
        id => 21,
        level => 84,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 83 ->
    #{
        id => 21,
        level => 83,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 82 ->
    #{
        id => 21,
        level => 82,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 81 ->
    #{
        id => 21,
        level => 81,
        legend => 0,
        effect => [{#base_skill.mp, 346}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 80 ->
    #{
        id => 21,
        level => 80,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 79 ->
    #{
        id => 21,
        level => 79,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 78 ->
    #{
        id => 21,
        level => 78,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 77 ->
    #{
        id => 21,
        level => 77,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 76 ->
    #{
        id => 21,
        level => 76,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 75 ->
    #{
        id => 21,
        level => 75,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 74 ->
    #{
        id => 21,
        level => 74,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 73 ->
    #{
        id => 21,
        level => 73,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 72 ->
    #{
        id => 21,
        level => 72,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 71 ->
    #{
        id => 21,
        level => 71,
        legend => 0,
        effect => [{#base_skill.mp, 241}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 70 ->
    #{
        id => 21,
        level => 70,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 69 ->
    #{
        id => 21,
        level => 69,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 68 ->
    #{
        id => 21,
        level => 68,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 67 ->
    #{
        id => 21,
        level => 67,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 66 ->
    #{
        id => 21,
        level => 66,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 65 ->
    #{
        id => 21,
        level => 65,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 64 ->
    #{
        id => 21,
        level => 64,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 63 ->
    #{
        id => 21,
        level => 63,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 62 ->
    #{
        id => 21,
        level => 62,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 61 ->
    #{
        id => 21,
        level => 61,
        legend => 0,
        effect => [{#base_skill.mp, 165}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 60 ->
    #{
        id => 21,
        level => 60,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 59 ->
    #{
        id => 21,
        level => 59,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 58 ->
    #{
        id => 21,
        level => 58,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 57 ->
    #{
        id => 21,
        level => 57,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 56 ->
    #{
        id => 21,
        level => 56,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 55 ->
    #{
        id => 21,
        level => 55,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 54 ->
    #{
        id => 21,
        level => 54,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 53 ->
    #{
        id => 21,
        level => 53,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 52 ->
    #{
        id => 21,
        level => 52,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 51 ->
    #{
        id => 21,
        level => 51,
        legend => 0,
        effect => [{#base_skill.mp, 110}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 50 ->
    #{
        id => 21,
        level => 50,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 49 ->
    #{
        id => 21,
        level => 49,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 48 ->
    #{
        id => 21,
        level => 48,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 47 ->
    #{
        id => 21,
        level => 47,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 46 ->
    #{
        id => 21,
        level => 46,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 45 ->
    #{
        id => 21,
        level => 45,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 44 ->
    #{
        id => 21,
        level => 44,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 43 ->
    #{
        id => 21,
        level => 43,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 42 ->
    #{
        id => 21,
        level => 42,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 41 ->
    #{
        id => 21,
        level => 41,
        legend => 0,
        effect => [{#base_skill.mp, 84}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 40 ->
    #{
        id => 21,
        level => 40,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 39 ->
    #{
        id => 21,
        level => 39,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 38 ->
    #{
        id => 21,
        level => 38,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 37 ->
    #{
        id => 21,
        level => 37,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 36 ->
    #{
        id => 21,
        level => 36,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 35 ->
    #{
        id => 21,
        level => 35,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 34 ->
    #{
        id => 21,
        level => 34,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 33 ->
    #{
        id => 21,
        level => 33,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 32 ->
    #{
        id => 21,
        level => 32,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 31 ->
    #{
        id => 21,
        level => 31,
        legend => 0,
        effect => [{#base_skill.mp, 64}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 30 ->
    #{
        id => 21,
        level => 30,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 29 ->
    #{
        id => 21,
        level => 29,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 28 ->
    #{
        id => 21,
        level => 28,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 27 ->
    #{
        id => 21,
        level => 27,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 26 ->
    #{
        id => 21,
        level => 26,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 25 ->
    #{
        id => 21,
        level => 25,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 24 ->
    #{
        id => 21,
        level => 24,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 23 ->
    #{
        id => 21,
        level => 23,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 22 ->
    #{
        id => 21,
        level => 22,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 21 ->
    #{
        id => 21,
        level => 21,
        legend => 0,
        effect => [{#base_skill.mp, 46}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 20 ->
    #{
        id => 21,
        level => 20,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 19 ->
    #{
        id => 21,
        level => 19,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 18 ->
    #{
        id => 21,
        level => 18,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 17 ->
    #{
        id => 21,
        level => 17,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 16 ->
    #{
        id => 21,
        level => 16,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 15 ->
    #{
        id => 21,
        level => 15,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 14 ->
    #{
        id => 21,
        level => 14,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 13 ->
    #{
        id => 21,
        level => 13,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 12 ->
    #{
        id => 21,
        level => 12,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 11 ->
    #{
        id => 21,
        level => 11,
        legend => 0,
        effect => [{#base_skill.mp, 28}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 10 ->
    #{
        id => 21,
        level => 10,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 9 ->
    #{
        id => 21,
        level => 9,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 8 ->
    #{
        id => 21,
        level => 8,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 7 ->
    #{
        id => 21,
        level => 7,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 6 ->
    #{
        id => 21,
        level => 6,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 5 ->
    #{
        id => 21,
        level => 5,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 4 ->
    #{
        id => 21,
        level => 4,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 3 ->
    #{
        id => 21,
        level => 3,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 2 ->
    #{
        id => 21,
        level => 2,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 21, 0}) when Level >= 1 ->
    #{
        id => 21,
        level => 1,
        legend => 0,
        effect => [{#base_skill.mp, 11}, {#base_skill.hero, 21}, {#base_skill.legend, 0}]
    };
get({10010015, Level, 22, 0}) when Level >= 1 ->
    #{
        id => 22,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_buff, {{1,8,10403},{1,{1017,1}}}}, {#base_skill.hero, 22}, {#base_skill.legend, 0}]
    };
get({10040015, Level, 22, 0}) when Level >= 1 ->
    #{
        id => 22,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4002},{10000,4011,1}]}, {#base_skill.hero, 22}, {#base_skill.legend, 0}]
    };
get({10020015, Level, 22, 0}) when Level >= 1 ->
    #{
        id => 22,
        level => 1,
        legend => 0,
        effect => [{#base_skill.pos_skill, 10021015}, {#base_skill.hero, 22}, {#base_skill.legend, 0}]
    };
get({10030015, Level, 22, 0}) when Level >= 1 ->
    #{
        id => 22,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 23000}, {#base_skill.target_buff, [{10000,3002,1}]}, {#base_skill.hero, 22}, {#base_skill.legend, 0}]
    };
get({10010014, Level, 23, 0}) when Level >= 1 ->
    #{
        id => 23,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1002,1}]}, {#base_skill.extra_harm, {[{1,8,10403}],3000}}, {#base_skill.hero, 23}, {#base_skill.legend, 0}]
    };
get({10040014, Level, 23, 0}) when Level >= 1 ->
    #{
        id => 23,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 20000}, {#base_skill.self_buff, [{10000,4012}]}, {#base_skill.hero, 23}, {#base_skill.legend, 0}]
    };
get({10020014, Level, 23, 0}) when Level >= 1 ->
    #{
        id => 23,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,10,1}]}, {#base_skill.rec_magic_ratio, 2000}, {#base_skill.rec_magic_perc, 5000}, {#base_skill.hero, 23}, {#base_skill.legend, 0}]
    };
get({10030014, Level, 23, 0}) when Level >= 1 ->
    #{
        id => 23,
        level => 1,
        legend => 0,
        effect => [{#base_skill.pre_time, 3000}, {#base_skill.extra_harm, {[{0,1,10000}],5500}}, {#base_skill.hero, 23}, {#base_skill.legend, 0}]
    };
get({10010018, Level, 24, 0}) when Level >= 1 ->
    #{
        id => 24,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,1016,1}]}, {#base_skill.hero, 24}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 24, 0}) when Level >= 1 ->
    #{
        id => 24,
        level => 1,
        legend => 0,
        effect => [{#base_skill.pos_skill, 10044018}, {#base_skill.hero, 24}, {#base_skill.legend, 0}]
    };
get({10020018, Level, 24, 0}) when Level >= 1 ->
    #{
        id => 24,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{1,16}]}, {#base_skill.att_times, [600]}, {#base_skill.self_buff, [{10000,2020}]}, {#base_skill.hero, 24}, {#base_skill.legend, 0}]
    };
get({10030018, Level, 24, 0}) when Level >= 1 ->
    #{
        id => 24,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,3011,1}]}, {#base_skill.hero, 24}, {#base_skill.legend, 0}]
    };
get({10010018, Level, 25, 0}) when Level >= 1 ->
    #{
        id => 25,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{1,20}]}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 105 ->
    #{
        id => 25,
        level => 105,
        legend => 0,
        effect => [{#base_skill.cd, 15050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 104 ->
    #{
        id => 25,
        level => 104,
        legend => 0,
        effect => [{#base_skill.cd, 15050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 103 ->
    #{
        id => 25,
        level => 103,
        legend => 0,
        effect => [{#base_skill.cd, 15050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 102 ->
    #{
        id => 25,
        level => 102,
        legend => 0,
        effect => [{#base_skill.cd, 15050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 101 ->
    #{
        id => 25,
        level => 101,
        legend => 0,
        effect => [{#base_skill.cd, 15050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 100 ->
    #{
        id => 25,
        level => 100,
        legend => 0,
        effect => [{#base_skill.cd, 15050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 99 ->
    #{
        id => 25,
        level => 99,
        legend => 0,
        effect => [{#base_skill.cd, 15100}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 98 ->
    #{
        id => 25,
        level => 98,
        legend => 0,
        effect => [{#base_skill.cd, 15150}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 97 ->
    #{
        id => 25,
        level => 97,
        legend => 0,
        effect => [{#base_skill.cd, 15200}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 96 ->
    #{
        id => 25,
        level => 96,
        legend => 0,
        effect => [{#base_skill.cd, 15250}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 95 ->
    #{
        id => 25,
        level => 95,
        legend => 0,
        effect => [{#base_skill.cd, 15300}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 94 ->
    #{
        id => 25,
        level => 94,
        legend => 0,
        effect => [{#base_skill.cd, 15350}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 93 ->
    #{
        id => 25,
        level => 93,
        legend => 0,
        effect => [{#base_skill.cd, 15400}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 92 ->
    #{
        id => 25,
        level => 92,
        legend => 0,
        effect => [{#base_skill.cd, 15450}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 91 ->
    #{
        id => 25,
        level => 91,
        legend => 0,
        effect => [{#base_skill.cd, 15500}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 90 ->
    #{
        id => 25,
        level => 90,
        legend => 0,
        effect => [{#base_skill.cd, 15550}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 89 ->
    #{
        id => 25,
        level => 89,
        legend => 0,
        effect => [{#base_skill.cd, 15600}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 88 ->
    #{
        id => 25,
        level => 88,
        legend => 0,
        effect => [{#base_skill.cd, 15650}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 87 ->
    #{
        id => 25,
        level => 87,
        legend => 0,
        effect => [{#base_skill.cd, 15700}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 86 ->
    #{
        id => 25,
        level => 86,
        legend => 0,
        effect => [{#base_skill.cd, 15750}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 85 ->
    #{
        id => 25,
        level => 85,
        legend => 0,
        effect => [{#base_skill.cd, 15800}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 84 ->
    #{
        id => 25,
        level => 84,
        legend => 0,
        effect => [{#base_skill.cd, 15850}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 83 ->
    #{
        id => 25,
        level => 83,
        legend => 0,
        effect => [{#base_skill.cd, 15900}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 82 ->
    #{
        id => 25,
        level => 82,
        legend => 0,
        effect => [{#base_skill.cd, 15950}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 81 ->
    #{
        id => 25,
        level => 81,
        legend => 0,
        effect => [{#base_skill.cd, 16000}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 80 ->
    #{
        id => 25,
        level => 80,
        legend => 0,
        effect => [{#base_skill.cd, 16050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 79 ->
    #{
        id => 25,
        level => 79,
        legend => 0,
        effect => [{#base_skill.cd, 16100}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 78 ->
    #{
        id => 25,
        level => 78,
        legend => 0,
        effect => [{#base_skill.cd, 16150}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 77 ->
    #{
        id => 25,
        level => 77,
        legend => 0,
        effect => [{#base_skill.cd, 16200}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 76 ->
    #{
        id => 25,
        level => 76,
        legend => 0,
        effect => [{#base_skill.cd, 16250}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 75 ->
    #{
        id => 25,
        level => 75,
        legend => 0,
        effect => [{#base_skill.cd, 16300}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 74 ->
    #{
        id => 25,
        level => 74,
        legend => 0,
        effect => [{#base_skill.cd, 16350}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 73 ->
    #{
        id => 25,
        level => 73,
        legend => 0,
        effect => [{#base_skill.cd, 16400}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 72 ->
    #{
        id => 25,
        level => 72,
        legend => 0,
        effect => [{#base_skill.cd, 16450}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 71 ->
    #{
        id => 25,
        level => 71,
        legend => 0,
        effect => [{#base_skill.cd, 16500}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 70 ->
    #{
        id => 25,
        level => 70,
        legend => 0,
        effect => [{#base_skill.cd, 16550}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 69 ->
    #{
        id => 25,
        level => 69,
        legend => 0,
        effect => [{#base_skill.cd, 16600}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 68 ->
    #{
        id => 25,
        level => 68,
        legend => 0,
        effect => [{#base_skill.cd, 16650}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 67 ->
    #{
        id => 25,
        level => 67,
        legend => 0,
        effect => [{#base_skill.cd, 16700}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 66 ->
    #{
        id => 25,
        level => 66,
        legend => 0,
        effect => [{#base_skill.cd, 16750}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 65 ->
    #{
        id => 25,
        level => 65,
        legend => 0,
        effect => [{#base_skill.cd, 16800}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 64 ->
    #{
        id => 25,
        level => 64,
        legend => 0,
        effect => [{#base_skill.cd, 16850}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 63 ->
    #{
        id => 25,
        level => 63,
        legend => 0,
        effect => [{#base_skill.cd, 16900}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 62 ->
    #{
        id => 25,
        level => 62,
        legend => 0,
        effect => [{#base_skill.cd, 16950}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 61 ->
    #{
        id => 25,
        level => 61,
        legend => 0,
        effect => [{#base_skill.cd, 17000}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 60 ->
    #{
        id => 25,
        level => 60,
        legend => 0,
        effect => [{#base_skill.cd, 17050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 59 ->
    #{
        id => 25,
        level => 59,
        legend => 0,
        effect => [{#base_skill.cd, 17100}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 58 ->
    #{
        id => 25,
        level => 58,
        legend => 0,
        effect => [{#base_skill.cd, 17150}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 57 ->
    #{
        id => 25,
        level => 57,
        legend => 0,
        effect => [{#base_skill.cd, 17200}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 56 ->
    #{
        id => 25,
        level => 56,
        legend => 0,
        effect => [{#base_skill.cd, 17250}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 55 ->
    #{
        id => 25,
        level => 55,
        legend => 0,
        effect => [{#base_skill.cd, 17300}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 54 ->
    #{
        id => 25,
        level => 54,
        legend => 0,
        effect => [{#base_skill.cd, 17350}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 53 ->
    #{
        id => 25,
        level => 53,
        legend => 0,
        effect => [{#base_skill.cd, 17400}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 52 ->
    #{
        id => 25,
        level => 52,
        legend => 0,
        effect => [{#base_skill.cd, 17450}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 51 ->
    #{
        id => 25,
        level => 51,
        legend => 0,
        effect => [{#base_skill.cd, 17500}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 50 ->
    #{
        id => 25,
        level => 50,
        legend => 0,
        effect => [{#base_skill.cd, 17550}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 49 ->
    #{
        id => 25,
        level => 49,
        legend => 0,
        effect => [{#base_skill.cd, 17600}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 48 ->
    #{
        id => 25,
        level => 48,
        legend => 0,
        effect => [{#base_skill.cd, 17650}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 47 ->
    #{
        id => 25,
        level => 47,
        legend => 0,
        effect => [{#base_skill.cd, 17700}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 46 ->
    #{
        id => 25,
        level => 46,
        legend => 0,
        effect => [{#base_skill.cd, 17750}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 45 ->
    #{
        id => 25,
        level => 45,
        legend => 0,
        effect => [{#base_skill.cd, 17800}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 44 ->
    #{
        id => 25,
        level => 44,
        legend => 0,
        effect => [{#base_skill.cd, 17850}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 43 ->
    #{
        id => 25,
        level => 43,
        legend => 0,
        effect => [{#base_skill.cd, 17900}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 42 ->
    #{
        id => 25,
        level => 42,
        legend => 0,
        effect => [{#base_skill.cd, 17950}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 41 ->
    #{
        id => 25,
        level => 41,
        legend => 0,
        effect => [{#base_skill.cd, 18000}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 40 ->
    #{
        id => 25,
        level => 40,
        legend => 0,
        effect => [{#base_skill.cd, 18050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 39 ->
    #{
        id => 25,
        level => 39,
        legend => 0,
        effect => [{#base_skill.cd, 18100}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 38 ->
    #{
        id => 25,
        level => 38,
        legend => 0,
        effect => [{#base_skill.cd, 18150}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 37 ->
    #{
        id => 25,
        level => 37,
        legend => 0,
        effect => [{#base_skill.cd, 18200}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 36 ->
    #{
        id => 25,
        level => 36,
        legend => 0,
        effect => [{#base_skill.cd, 18250}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 35 ->
    #{
        id => 25,
        level => 35,
        legend => 0,
        effect => [{#base_skill.cd, 18300}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 34 ->
    #{
        id => 25,
        level => 34,
        legend => 0,
        effect => [{#base_skill.cd, 18350}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 33 ->
    #{
        id => 25,
        level => 33,
        legend => 0,
        effect => [{#base_skill.cd, 18400}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 32 ->
    #{
        id => 25,
        level => 32,
        legend => 0,
        effect => [{#base_skill.cd, 18450}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 31 ->
    #{
        id => 25,
        level => 31,
        legend => 0,
        effect => [{#base_skill.cd, 18500}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 30 ->
    #{
        id => 25,
        level => 30,
        legend => 0,
        effect => [{#base_skill.cd, 18550}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 29 ->
    #{
        id => 25,
        level => 29,
        legend => 0,
        effect => [{#base_skill.cd, 18600}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 28 ->
    #{
        id => 25,
        level => 28,
        legend => 0,
        effect => [{#base_skill.cd, 18650}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 27 ->
    #{
        id => 25,
        level => 27,
        legend => 0,
        effect => [{#base_skill.cd, 18700}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 26 ->
    #{
        id => 25,
        level => 26,
        legend => 0,
        effect => [{#base_skill.cd, 18750}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 25 ->
    #{
        id => 25,
        level => 25,
        legend => 0,
        effect => [{#base_skill.cd, 18800}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 24 ->
    #{
        id => 25,
        level => 24,
        legend => 0,
        effect => [{#base_skill.cd, 18850}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 23 ->
    #{
        id => 25,
        level => 23,
        legend => 0,
        effect => [{#base_skill.cd, 18900}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 22 ->
    #{
        id => 25,
        level => 22,
        legend => 0,
        effect => [{#base_skill.cd, 18950}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 21 ->
    #{
        id => 25,
        level => 21,
        legend => 0,
        effect => [{#base_skill.cd, 19000}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 20 ->
    #{
        id => 25,
        level => 20,
        legend => 0,
        effect => [{#base_skill.cd, 19050}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 19 ->
    #{
        id => 25,
        level => 19,
        legend => 0,
        effect => [{#base_skill.cd, 19100}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 18 ->
    #{
        id => 25,
        level => 18,
        legend => 0,
        effect => [{#base_skill.cd, 19150}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 17 ->
    #{
        id => 25,
        level => 17,
        legend => 0,
        effect => [{#base_skill.cd, 19200}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 16 ->
    #{
        id => 25,
        level => 16,
        legend => 0,
        effect => [{#base_skill.cd, 19250}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 15 ->
    #{
        id => 25,
        level => 15,
        legend => 0,
        effect => [{#base_skill.cd, 19300}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 14 ->
    #{
        id => 25,
        level => 14,
        legend => 0,
        effect => [{#base_skill.cd, 19350}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 13 ->
    #{
        id => 25,
        level => 13,
        legend => 0,
        effect => [{#base_skill.cd, 19400}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 12 ->
    #{
        id => 25,
        level => 12,
        legend => 0,
        effect => [{#base_skill.cd, 19450}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 11 ->
    #{
        id => 25,
        level => 11,
        legend => 0,
        effect => [{#base_skill.cd, 19500}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 10 ->
    #{
        id => 25,
        level => 10,
        legend => 0,
        effect => [{#base_skill.cd, 19550}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 9 ->
    #{
        id => 25,
        level => 9,
        legend => 0,
        effect => [{#base_skill.cd, 19600}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 8 ->
    #{
        id => 25,
        level => 8,
        legend => 0,
        effect => [{#base_skill.cd, 19650}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 7 ->
    #{
        id => 25,
        level => 7,
        legend => 0,
        effect => [{#base_skill.cd, 19700}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 6 ->
    #{
        id => 25,
        level => 6,
        legend => 0,
        effect => [{#base_skill.cd, 19750}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 5 ->
    #{
        id => 25,
        level => 5,
        legend => 0,
        effect => [{#base_skill.cd, 19800}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 4 ->
    #{
        id => 25,
        level => 4,
        legend => 0,
        effect => [{#base_skill.cd, 19850}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 3 ->
    #{
        id => 25,
        level => 3,
        legend => 0,
        effect => [{#base_skill.cd, 19900}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 2 ->
    #{
        id => 25,
        level => 2,
        legend => 0,
        effect => [{#base_skill.cd, 19950}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10040018, Level, 25, 0}) when Level >= 1 ->
    #{
        id => 25,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 20000}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10020018, Level, 25, 0}) when Level >= 1 ->
    #{
        id => 25,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}],1500}}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10030018, Level, 25, 0}) when Level >= 1 ->
    #{
        id => 25,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,3014,1}]}, {#base_skill.hero, 25}, {#base_skill.legend, 0}]
    };
get({10010017, Level, 26, 0}) when Level >= 1 ->
    #{
        id => 26,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,1013}]}, {#base_skill.hero, 26}, {#base_skill.legend, 0}]
    };
get({10040017, Level, 26, 0}) when Level >= 1 ->
    #{
        id => 26,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}], 1500}}, {#base_skill.hero, 26}, {#base_skill.legend, 0}]
    };
get({10020017, Level, 26, 0}) when Level >= 1 ->
    #{
        id => 26,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 45000}, {#base_skill.hero, 26}, {#base_skill.legend, 0}]
    };
get({10030017, Level, 26, 0}) when Level >= 1 ->
    #{
        id => 26,
        level => 1,
        legend => 0,
        effect => [{#base_skill.skill_ratio, 10000}, {#base_skill.hero, 26}, {#base_skill.legend, 0}]
    };
get({10010015, Level, 27, 0}) when Level >= 1 ->
    #{
        id => 27,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 12000}, {#base_skill.hero, 27}, {#base_skill.legend, 0}]
    };
get({10040015, Level, 27, 0}) when Level >= 1 ->
    #{
        id => 27,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 15000}, {#base_skill.hero, 27}, {#base_skill.legend, 0}]
    };
get({10020015, Level, 27, 0}) when Level >= 1 ->
    #{
        id => 27,
        level => 1,
        legend => 0,
        effect => [{#base_skill.rec_magic_ratio, 10000}, {#base_skill.rec_magic_perc, 300}, {#base_skill.hero, 27}, {#base_skill.legend, 0}]
    };
get({10030015, Level, 27, 0}) when Level >= 1 ->
    #{
        id => 27,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}],3000}}, {#base_skill.hero, 27}, {#base_skill.legend, 0}]
    };
get({10010014, Level, 28, 0}) when Level >= 1 ->
    #{
        id => 28,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10},{4,0,10}]}, {#base_skill.att_times, [0,400,800,1200,1600,2000,2400,2800,3200,3600]}, {#base_skill.self_buff, [{10000,1002,1}]}, {#base_skill.hero, 28}, {#base_skill.legend, 0}]
    };
get({10040014, Level, 28, 0}) when Level >= 1 ->
    #{
        id => 28,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,4014}]}, {#base_skill.hero, 28}, {#base_skill.legend, 0}]
    };
get({10020014, Level, 28, 0}) when Level >= 1 ->
    #{
        id => 28,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{2000,2018,1}]}, {#base_skill.hero, 28}, {#base_skill.legend, 0}]
    };
get({10030014, Level, 28, 0}) when Level >= 1 ->
    #{
        id => 28,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 8000}, {#base_skill.pre_time, 0}, {#base_skill.hero, 28}, {#base_skill.legend, 0}]
    };
get({10010016, Level, 29, 0}) when Level >= 1 ->
    #{
        id => 29,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{3,14,18}]}, {#base_skill.hero, 29}, {#base_skill.legend, 0}]
    };
get({10040016, Level, 29, 0}) when Level >= 1 ->
    #{
        id => 29,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_area, [{1,16}]}, {#base_skill.hero, 29}, {#base_skill.legend, 0}]
    };
get({10020016, Level, 29, 0}) when Level >= 1 ->
    #{
        id => 29,
        level => 1,
        legend => 0,
        effect => [{#base_skill.pre_time, 0}, {#base_skill.hero, 29}, {#base_skill.legend, 0}]
    };
get({10030016, Level, 29, 0}) when Level >= 1 ->
    #{
        id => 29,
        level => 1,
        legend => 0,
        effect => [{#base_skill.self_buff, [{10000,3020}]}, {#base_skill.hero, 29}, {#base_skill.legend, 0}]
    };
get({10010013, Level, 30, 0}) when Level >= 1 ->
    #{
        id => 30,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 15000}, {#base_skill.hero, 30}, {#base_skill.legend, 0}]
    };
get({10040013, Level, 30, 0}) when Level >= 1 ->
    #{
        id => 30,
        level => 1,
        legend => 0,
        effect => [{#base_skill.att_num, 8}, {#base_skill.att_area, [{4,0,14},{4,0,14}]}, {#base_skill.hero, 30}, {#base_skill.legend, 0}]
    };
get({10020013, Level, 30, 0}) when Level >= 1 ->
    #{
        id => 30,
        level => 1,
        legend => 0,
        effect => [{#base_skill.flyitems, [1004]}, {#base_skill.hero, 30}, {#base_skill.legend, 0}]
    };
get({10030013, Level, 30, 0}) when Level >= 1 ->
    #{
        id => 30,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}],2000}}, {#base_skill.hero, 30}, {#base_skill.legend, 0}]
    };
get({10010012, Level, 31, 0}) when Level >= 1 ->
    #{
        id => 31,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 6000}, {#base_skill.hero, 31}, {#base_skill.legend, 0}]
    };
get({10040012, Level, 31, 0}) when Level >= 1 ->
    #{
        id => 31,
        level => 1,
        legend => 0,
        effect => [{#base_skill.remove_cd, [{3000,10040012}]}, {#base_skill.hero, 31}, {#base_skill.legend, 0}]
    };
get({10020012, Level, 31, 0}) when Level >= 1 ->
    #{
        id => 31,
        level => 1,
        legend => 0,
        effect => [{#base_skill.target_buff, [{10000,2021}]}, {#base_skill.hero, 31}, {#base_skill.legend, 0}]
    };
get({10030012, Level, 31, 0}) when Level >= 1 ->
    #{
        id => 31,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}],1500}}, {#base_skill.hero, 31}, {#base_skill.legend, 0}]
    };
get({10010011, Level, 32, 0}) when Level >= 1 ->
    #{
        id => 32,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}], 1000}}, {#base_skill.hero, 32}, {#base_skill.legend, 0}]
    };
get({10040011, Level, 32, 0}) when Level >= 1 ->
    #{
        id => 32,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}], 1000}}, {#base_skill.hero, 32}, {#base_skill.legend, 0}]
    };
get({10020011, Level, 32, 0}) when Level >= 1 ->
    #{
        id => 32,
        level => 1,
        legend => 0,
        effect => [{#base_skill.cd, 5000}, {#base_skill.hero, 32}, {#base_skill.legend, 0}]
    };
get({10030011, Level, 32, 0}) when Level >= 1 ->
    #{
        id => 32,
        level => 1,
        legend => 0,
        effect => [{#base_skill.extra_harm, {[{0,1,10000}],1000}}, {#base_skill.hero, 32}, {#base_skill.legend, 0}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32].
