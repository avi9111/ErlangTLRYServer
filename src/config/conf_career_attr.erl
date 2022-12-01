%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      职业属性等级配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_career_attr).

-include("log.hrl").
-include("proto/prot_ud.hrl").

-export([
	get_attr/2,
	get_max_lv/1
]).


%% @doc 获取职业特定等级属性
%% @spec get_attr(Career, Level) -> #bt_attr{} | undefined.
%% Career = Level   :: integer()
get_attr(1, 1) ->
    {
        #base_attr{power = 8, anima = 2, energy = 7, concent = 5, method = 4},
        #bt_attr{hp_lim = 358, mp_lim = 69, inner_att = 54, outer_att = 81, inner_def = 24, outer_def = 28, hit = 53, dodge = 11, crit_hurt = 7, crit_def = 7, move_speed = 240}
    };
get_attr(1, 2) ->
    {
        #base_attr{power = 11, anima = 2, energy = 9, concent = 7, method = 5},
        #bt_attr{hp_lim = 460, mp_lim = 90, inner_att = 61, outer_att = 89, inner_def = 27, outer_def = 31, hit = 60, dodge = 13, crit_hurt = 7, crit_def = 7, move_speed = 240}
    };
get_attr(1, 3) ->
    {
        #base_attr{power = 14, anima = 3, energy = 12, concent = 10, method = 7},
        #bt_attr{hp_lim = 562, mp_lim = 111, inner_att = 69, outer_att = 98, inner_def = 31, outer_def = 34, hit = 67, dodge = 15, crit_hurt = 8, crit_def = 8, move_speed = 240}
    };
get_attr(1, 4) ->
    {
        #base_attr{power = 17, anima = 3, energy = 14, concent = 12, method = 8},
        #bt_attr{hp_lim = 664, mp_lim = 132, inner_att = 76, outer_att = 106, inner_def = 34, outer_def = 37, hit = 74, dodge = 17, crit_hurt = 8, crit_def = 8, move_speed = 240}
    };
get_attr(1, 5) ->
    {
        #base_attr{power = 20, anima = 4, energy = 17, concent = 15, method = 10},
        #bt_attr{hp_lim = 766, mp_lim = 153, inner_att = 84, outer_att = 115, inner_def = 38, outer_def = 40, hit = 81, dodge = 19, crit_hurt = 9, crit_def = 9, move_speed = 240}
    };
get_attr(1, 6) ->
    {
        #base_attr{power = 23, anima = 4, energy = 19, concent = 17, method = 11},
        #bt_attr{hp_lim = 868, mp_lim = 174, inner_att = 91, outer_att = 123, inner_def = 41, outer_def = 43, hit = 88, dodge = 21, crit_hurt = 9, crit_def = 9, move_speed = 240}
    };
get_attr(1, 7) ->
    {
        #base_attr{power = 26, anima = 5, energy = 22, concent = 20, method = 13},
        #bt_attr{hp_lim = 970, mp_lim = 195, inner_att = 99, outer_att = 132, inner_def = 45, outer_def = 46, hit = 95, dodge = 23, crit_hurt = 10, crit_def = 10, move_speed = 240}
    };
get_attr(1, 8) ->
    {
        #base_attr{power = 29, anima = 5, energy = 24, concent = 22, method = 14},
        #bt_attr{hp_lim = 1072, mp_lim = 216, inner_att = 106, outer_att = 140, inner_def = 48, outer_def = 49, hit = 102, dodge = 25, crit_hurt = 10, crit_def = 10, move_speed = 240}
    };
get_attr(1, 9) ->
    {
        #base_attr{power = 32, anima = 6, energy = 27, concent = 25, method = 16},
        #bt_attr{hp_lim = 1174, mp_lim = 237, inner_att = 114, outer_att = 149, inner_def = 52, outer_def = 52, hit = 109, dodge = 27, crit_hurt = 11, crit_def = 11, move_speed = 240}
    };
get_attr(1, 10) ->
    {
        #base_attr{power = 35, anima = 6, energy = 29, concent = 27, method = 17},
        #bt_attr{hp_lim = 1276, mp_lim = 258, inner_att = 121, outer_att = 157, inner_def = 55, outer_def = 55, hit = 116, dodge = 29, crit_hurt = 11, crit_def = 11, move_speed = 240}
    };
get_attr(1, 11) ->
    {
        #base_attr{power = 38, anima = 7, energy = 32, concent = 30, method = 19},
        #bt_attr{hp_lim = 1378, mp_lim = 279, inner_att = 129, outer_att = 166, inner_def = 59, outer_def = 58, hit = 123, dodge = 31, crit_hurt = 12, crit_def = 12, move_speed = 240}
    };
get_attr(1, 12) ->
    {
        #base_attr{power = 41, anima = 7, energy = 34, concent = 32, method = 20},
        #bt_attr{hp_lim = 1480, mp_lim = 300, inner_att = 136, outer_att = 174, inner_def = 62, outer_def = 61, hit = 130, dodge = 33, crit_hurt = 12, crit_def = 12, move_speed = 240}
    };
get_attr(1, 13) ->
    {
        #base_attr{power = 44, anima = 8, energy = 37, concent = 35, method = 22},
        #bt_attr{hp_lim = 1582, mp_lim = 321, inner_att = 144, outer_att = 183, inner_def = 66, outer_def = 64, hit = 137, dodge = 35, crit_hurt = 13, crit_def = 13, move_speed = 240}
    };
get_attr(1, 14) ->
    {
        #base_attr{power = 47, anima = 8, energy = 39, concent = 37, method = 23},
        #bt_attr{hp_lim = 1684, mp_lim = 342, inner_att = 151, outer_att = 191, inner_def = 69, outer_def = 67, hit = 144, dodge = 37, crit_hurt = 13, crit_def = 13, move_speed = 240}
    };
get_attr(1, 15) ->
    {
        #base_attr{power = 50, anima = 9, energy = 42, concent = 40, method = 25},
        #bt_attr{hp_lim = 1786, mp_lim = 363, inner_att = 159, outer_att = 200, inner_def = 73, outer_def = 70, hit = 151, dodge = 39, crit_hurt = 14, crit_def = 14, move_speed = 240}
    };
get_attr(1, 16) ->
    {
        #base_attr{power = 53, anima = 9, energy = 44, concent = 42, method = 26},
        #bt_attr{hp_lim = 1888, mp_lim = 384, inner_att = 166, outer_att = 208, inner_def = 76, outer_def = 73, hit = 158, dodge = 41, crit_hurt = 14, crit_def = 14, move_speed = 240}
    };
get_attr(1, 17) ->
    {
        #base_attr{power = 56, anima = 10, energy = 47, concent = 45, method = 28},
        #bt_attr{hp_lim = 1990, mp_lim = 405, inner_att = 174, outer_att = 217, inner_def = 80, outer_def = 76, hit = 165, dodge = 43, crit_hurt = 15, crit_def = 15, move_speed = 240}
    };
get_attr(1, 18) ->
    {
        #base_attr{power = 59, anima = 10, energy = 49, concent = 47, method = 29},
        #bt_attr{hp_lim = 2092, mp_lim = 426, inner_att = 181, outer_att = 225, inner_def = 83, outer_def = 79, hit = 172, dodge = 45, crit_hurt = 15, crit_def = 15, move_speed = 240}
    };
get_attr(1, 19) ->
    {
        #base_attr{power = 62, anima = 11, energy = 52, concent = 50, method = 31},
        #bt_attr{hp_lim = 2194, mp_lim = 447, inner_att = 189, outer_att = 234, inner_def = 87, outer_def = 82, hit = 179, dodge = 47, crit_hurt = 16, crit_def = 16, move_speed = 240}
    };
get_attr(1, 20) ->
    {
        #base_attr{power = 65, anima = 11, energy = 54, concent = 52, method = 32},
        #bt_attr{hp_lim = 2296, mp_lim = 468, inner_att = 196, outer_att = 242, inner_def = 90, outer_def = 85, hit = 186, dodge = 49, crit_hurt = 16, crit_def = 16, move_speed = 240}
    };
get_attr(1, 21) ->
    {
        #base_attr{power = 68, anima = 12, energy = 57, concent = 55, method = 34},
        #bt_attr{hp_lim = 2398, mp_lim = 489, inner_att = 204, outer_att = 251, inner_def = 94, outer_def = 88, hit = 193, dodge = 51, crit_hurt = 17, crit_def = 17, move_speed = 240}
    };
get_attr(1, 22) ->
    {
        #base_attr{power = 71, anima = 12, energy = 59, concent = 57, method = 35},
        #bt_attr{hp_lim = 2500, mp_lim = 510, inner_att = 211, outer_att = 259, inner_def = 97, outer_def = 91, hit = 200, dodge = 53, crit_hurt = 17, crit_def = 17, move_speed = 240}
    };
get_attr(1, 23) ->
    {
        #base_attr{power = 74, anima = 13, energy = 62, concent = 60, method = 37},
        #bt_attr{hp_lim = 2602, mp_lim = 531, inner_att = 219, outer_att = 268, inner_def = 101, outer_def = 94, hit = 207, dodge = 55, crit_hurt = 18, crit_def = 18, move_speed = 240}
    };
get_attr(1, 24) ->
    {
        #base_attr{power = 77, anima = 13, energy = 64, concent = 62, method = 38},
        #bt_attr{hp_lim = 2704, mp_lim = 552, inner_att = 226, outer_att = 276, inner_def = 104, outer_def = 97, hit = 214, dodge = 57, crit_hurt = 18, crit_def = 18, move_speed = 240}
    };
get_attr(1, 25) ->
    {
        #base_attr{power = 80, anima = 14, energy = 67, concent = 65, method = 40},
        #bt_attr{hp_lim = 2806, mp_lim = 573, inner_att = 234, outer_att = 285, inner_def = 108, outer_def = 100, hit = 221, dodge = 59, crit_hurt = 19, crit_def = 19, move_speed = 240}
    };
get_attr(1, 26) ->
    {
        #base_attr{power = 83, anima = 14, energy = 69, concent = 67, method = 41},
        #bt_attr{hp_lim = 2908, mp_lim = 594, inner_att = 241, outer_att = 293, inner_def = 111, outer_def = 103, hit = 228, dodge = 61, crit_hurt = 19, crit_def = 19, move_speed = 240}
    };
get_attr(1, 27) ->
    {
        #base_attr{power = 86, anima = 15, energy = 72, concent = 70, method = 43},
        #bt_attr{hp_lim = 3010, mp_lim = 615, inner_att = 249, outer_att = 302, inner_def = 115, outer_def = 106, hit = 235, dodge = 63, crit_hurt = 20, crit_def = 20, move_speed = 240}
    };
get_attr(1, 28) ->
    {
        #base_attr{power = 89, anima = 15, energy = 74, concent = 72, method = 44},
        #bt_attr{hp_lim = 3112, mp_lim = 636, inner_att = 256, outer_att = 310, inner_def = 118, outer_def = 109, hit = 242, dodge = 65, crit_hurt = 20, crit_def = 20, move_speed = 240}
    };
get_attr(1, 29) ->
    {
        #base_attr{power = 92, anima = 16, energy = 77, concent = 75, method = 46},
        #bt_attr{hp_lim = 3214, mp_lim = 657, inner_att = 264, outer_att = 319, inner_def = 122, outer_def = 112, hit = 249, dodge = 67, crit_hurt = 21, crit_def = 21, move_speed = 240}
    };
get_attr(1, 30) ->
    {
        #base_attr{power = 95, anima = 16, energy = 79, concent = 77, method = 47},
        #bt_attr{hp_lim = 3316, mp_lim = 678, inner_att = 271, outer_att = 327, inner_def = 125, outer_def = 115, hit = 256, dodge = 69, crit_hurt = 21, crit_def = 21, move_speed = 240}
    };
get_attr(1, 31) ->
    {
        #base_attr{power = 98, anima = 17, energy = 82, concent = 80, method = 49},
        #bt_attr{hp_lim = 3418, mp_lim = 699, inner_att = 279, outer_att = 336, inner_def = 129, outer_def = 118, hit = 263, dodge = 71, crit_hurt = 22, crit_def = 22, move_speed = 240}
    };
get_attr(1, 32) ->
    {
        #base_attr{power = 101, anima = 17, energy = 84, concent = 82, method = 50},
        #bt_attr{hp_lim = 3520, mp_lim = 720, inner_att = 286, outer_att = 344, inner_def = 132, outer_def = 121, hit = 270, dodge = 73, crit_hurt = 22, crit_def = 22, move_speed = 240}
    };
get_attr(1, 33) ->
    {
        #base_attr{power = 104, anima = 18, energy = 87, concent = 85, method = 52},
        #bt_attr{hp_lim = 3622, mp_lim = 741, inner_att = 294, outer_att = 353, inner_def = 136, outer_def = 124, hit = 277, dodge = 75, crit_hurt = 23, crit_def = 23, move_speed = 240}
    };
get_attr(1, 34) ->
    {
        #base_attr{power = 107, anima = 18, energy = 89, concent = 87, method = 53},
        #bt_attr{hp_lim = 3724, mp_lim = 762, inner_att = 301, outer_att = 361, inner_def = 139, outer_def = 127, hit = 284, dodge = 77, crit_hurt = 23, crit_def = 23, move_speed = 240}
    };
get_attr(1, 35) ->
    {
        #base_attr{power = 110, anima = 19, energy = 92, concent = 90, method = 55},
        #bt_attr{hp_lim = 3826, mp_lim = 783, inner_att = 309, outer_att = 370, inner_def = 143, outer_def = 130, hit = 291, dodge = 79, crit_hurt = 24, crit_def = 24, move_speed = 240}
    };
get_attr(1, 36) ->
    {
        #base_attr{power = 113, anima = 19, energy = 94, concent = 92, method = 56},
        #bt_attr{hp_lim = 3928, mp_lim = 804, inner_att = 316, outer_att = 378, inner_def = 146, outer_def = 133, hit = 298, dodge = 81, crit_hurt = 24, crit_def = 24, move_speed = 240}
    };
get_attr(1, 37) ->
    {
        #base_attr{power = 116, anima = 20, energy = 97, concent = 95, method = 58},
        #bt_attr{hp_lim = 4030, mp_lim = 825, inner_att = 324, outer_att = 387, inner_def = 150, outer_def = 136, hit = 305, dodge = 83, crit_hurt = 25, crit_def = 25, move_speed = 240}
    };
get_attr(1, 38) ->
    {
        #base_attr{power = 119, anima = 20, energy = 99, concent = 97, method = 59},
        #bt_attr{hp_lim = 4132, mp_lim = 846, inner_att = 331, outer_att = 395, inner_def = 153, outer_def = 139, hit = 312, dodge = 85, crit_hurt = 25, crit_def = 25, move_speed = 240}
    };
get_attr(1, 39) ->
    {
        #base_attr{power = 122, anima = 21, energy = 102, concent = 100, method = 61},
        #bt_attr{hp_lim = 4234, mp_lim = 867, inner_att = 339, outer_att = 404, inner_def = 157, outer_def = 142, hit = 319, dodge = 87, crit_hurt = 26, crit_def = 26, move_speed = 240}
    };
get_attr(1, 40) ->
    {
        #base_attr{power = 125, anima = 21, energy = 104, concent = 102, method = 62},
        #bt_attr{hp_lim = 4336, mp_lim = 888, inner_att = 346, outer_att = 412, inner_def = 160, outer_def = 145, hit = 326, dodge = 89, crit_hurt = 26, crit_def = 26, move_speed = 240}
    };
get_attr(1, 41) ->
    {
        #base_attr{power = 128, anima = 22, energy = 107, concent = 105, method = 64},
        #bt_attr{hp_lim = 4438, mp_lim = 909, inner_att = 354, outer_att = 421, inner_def = 164, outer_def = 148, hit = 333, dodge = 91, crit_hurt = 27, crit_def = 27, move_speed = 240}
    };
get_attr(1, 42) ->
    {
        #base_attr{power = 131, anima = 22, energy = 109, concent = 107, method = 65},
        #bt_attr{hp_lim = 4540, mp_lim = 930, inner_att = 361, outer_att = 429, inner_def = 167, outer_def = 151, hit = 340, dodge = 93, crit_hurt = 27, crit_def = 27, move_speed = 240}
    };
get_attr(1, 43) ->
    {
        #base_attr{power = 134, anima = 23, energy = 112, concent = 110, method = 67},
        #bt_attr{hp_lim = 4642, mp_lim = 951, inner_att = 369, outer_att = 438, inner_def = 171, outer_def = 154, hit = 347, dodge = 95, crit_hurt = 28, crit_def = 28, move_speed = 240}
    };
get_attr(1, 44) ->
    {
        #base_attr{power = 137, anima = 23, energy = 114, concent = 112, method = 68},
        #bt_attr{hp_lim = 4744, mp_lim = 972, inner_att = 376, outer_att = 446, inner_def = 174, outer_def = 157, hit = 354, dodge = 97, crit_hurt = 28, crit_def = 28, move_speed = 240}
    };
get_attr(1, 45) ->
    {
        #base_attr{power = 140, anima = 24, energy = 117, concent = 115, method = 70},
        #bt_attr{hp_lim = 4846, mp_lim = 993, inner_att = 384, outer_att = 455, inner_def = 178, outer_def = 160, hit = 361, dodge = 99, crit_hurt = 29, crit_def = 29, move_speed = 240}
    };
get_attr(1, 46) ->
    {
        #base_attr{power = 143, anima = 24, energy = 119, concent = 117, method = 71},
        #bt_attr{hp_lim = 4948, mp_lim = 1014, inner_att = 391, outer_att = 463, inner_def = 181, outer_def = 163, hit = 368, dodge = 101, crit_hurt = 29, crit_def = 29, move_speed = 240}
    };
get_attr(1, 47) ->
    {
        #base_attr{power = 146, anima = 25, energy = 122, concent = 120, method = 73},
        #bt_attr{hp_lim = 5050, mp_lim = 1035, inner_att = 399, outer_att = 472, inner_def = 185, outer_def = 166, hit = 375, dodge = 103, crit_hurt = 30, crit_def = 30, move_speed = 240}
    };
get_attr(1, 48) ->
    {
        #base_attr{power = 149, anima = 25, energy = 124, concent = 122, method = 74},
        #bt_attr{hp_lim = 5152, mp_lim = 1056, inner_att = 406, outer_att = 480, inner_def = 188, outer_def = 169, hit = 382, dodge = 105, crit_hurt = 30, crit_def = 30, move_speed = 240}
    };
get_attr(1, 49) ->
    {
        #base_attr{power = 152, anima = 26, energy = 127, concent = 125, method = 76},
        #bt_attr{hp_lim = 5254, mp_lim = 1077, inner_att = 414, outer_att = 489, inner_def = 192, outer_def = 172, hit = 389, dodge = 107, crit_hurt = 31, crit_def = 31, move_speed = 240}
    };
get_attr(1, 50) ->
    {
        #base_attr{power = 155, anima = 26, energy = 129, concent = 127, method = 77},
        #bt_attr{hp_lim = 5356, mp_lim = 1098, inner_att = 421, outer_att = 497, inner_def = 195, outer_def = 175, hit = 396, dodge = 109, crit_hurt = 31, crit_def = 31, move_speed = 240}
    };
get_attr(1, 51) ->
    {
        #base_attr{power = 158, anima = 27, energy = 132, concent = 130, method = 79},
        #bt_attr{hp_lim = 5458, mp_lim = 1119, inner_att = 429, outer_att = 506, inner_def = 199, outer_def = 178, hit = 403, dodge = 111, crit_hurt = 32, crit_def = 32, move_speed = 240}
    };
get_attr(1, 52) ->
    {
        #base_attr{power = 161, anima = 27, energy = 134, concent = 132, method = 80},
        #bt_attr{hp_lim = 5560, mp_lim = 1140, inner_att = 436, outer_att = 514, inner_def = 202, outer_def = 181, hit = 410, dodge = 113, crit_hurt = 32, crit_def = 32, move_speed = 240}
    };
get_attr(1, 53) ->
    {
        #base_attr{power = 164, anima = 28, energy = 137, concent = 135, method = 82},
        #bt_attr{hp_lim = 5662, mp_lim = 1161, inner_att = 444, outer_att = 523, inner_def = 206, outer_def = 184, hit = 417, dodge = 115, crit_hurt = 33, crit_def = 33, move_speed = 240}
    };
get_attr(1, 54) ->
    {
        #base_attr{power = 167, anima = 28, energy = 139, concent = 137, method = 83},
        #bt_attr{hp_lim = 5764, mp_lim = 1182, inner_att = 451, outer_att = 531, inner_def = 209, outer_def = 187, hit = 424, dodge = 117, crit_hurt = 33, crit_def = 33, move_speed = 240}
    };
get_attr(1, 55) ->
    {
        #base_attr{power = 170, anima = 29, energy = 142, concent = 140, method = 85},
        #bt_attr{hp_lim = 5866, mp_lim = 1203, inner_att = 459, outer_att = 540, inner_def = 213, outer_def = 190, hit = 431, dodge = 119, crit_hurt = 34, crit_def = 34, move_speed = 240}
    };
get_attr(1, 56) ->
    {
        #base_attr{power = 173, anima = 29, energy = 144, concent = 142, method = 86},
        #bt_attr{hp_lim = 5968, mp_lim = 1224, inner_att = 466, outer_att = 548, inner_def = 216, outer_def = 193, hit = 438, dodge = 121, crit_hurt = 34, crit_def = 34, move_speed = 240}
    };
get_attr(1, 57) ->
    {
        #base_attr{power = 176, anima = 30, energy = 147, concent = 145, method = 88},
        #bt_attr{hp_lim = 6070, mp_lim = 1245, inner_att = 474, outer_att = 557, inner_def = 220, outer_def = 196, hit = 445, dodge = 123, crit_hurt = 35, crit_def = 35, move_speed = 240}
    };
get_attr(1, 58) ->
    {
        #base_attr{power = 179, anima = 30, energy = 149, concent = 147, method = 89},
        #bt_attr{hp_lim = 6172, mp_lim = 1266, inner_att = 481, outer_att = 565, inner_def = 223, outer_def = 199, hit = 452, dodge = 125, crit_hurt = 35, crit_def = 35, move_speed = 240}
    };
get_attr(1, 59) ->
    {
        #base_attr{power = 182, anima = 31, energy = 152, concent = 150, method = 91},
        #bt_attr{hp_lim = 6274, mp_lim = 1287, inner_att = 489, outer_att = 574, inner_def = 227, outer_def = 202, hit = 459, dodge = 127, crit_hurt = 36, crit_def = 36, move_speed = 240}
    };
get_attr(1, 60) ->
    {
        #base_attr{power = 185, anima = 31, energy = 154, concent = 152, method = 92},
        #bt_attr{hp_lim = 6376, mp_lim = 1308, inner_att = 496, outer_att = 582, inner_def = 230, outer_def = 205, hit = 466, dodge = 129, crit_hurt = 36, crit_def = 36, move_speed = 240}
    };
get_attr(1, 61) ->
    {
        #base_attr{power = 188, anima = 32, energy = 157, concent = 155, method = 94},
        #bt_attr{hp_lim = 6478, mp_lim = 1329, inner_att = 504, outer_att = 591, inner_def = 234, outer_def = 208, hit = 473, dodge = 131, crit_hurt = 37, crit_def = 37, move_speed = 240}
    };
get_attr(1, 62) ->
    {
        #base_attr{power = 191, anima = 32, energy = 159, concent = 157, method = 95},
        #bt_attr{hp_lim = 6580, mp_lim = 1350, inner_att = 511, outer_att = 599, inner_def = 237, outer_def = 211, hit = 480, dodge = 133, crit_hurt = 37, crit_def = 37, move_speed = 240}
    };
get_attr(1, 63) ->
    {
        #base_attr{power = 194, anima = 33, energy = 162, concent = 160, method = 97},
        #bt_attr{hp_lim = 6682, mp_lim = 1371, inner_att = 519, outer_att = 608, inner_def = 241, outer_def = 214, hit = 487, dodge = 135, crit_hurt = 38, crit_def = 38, move_speed = 240}
    };
get_attr(1, 64) ->
    {
        #base_attr{power = 197, anima = 33, energy = 164, concent = 162, method = 98},
        #bt_attr{hp_lim = 6784, mp_lim = 1392, inner_att = 526, outer_att = 616, inner_def = 244, outer_def = 217, hit = 494, dodge = 137, crit_hurt = 38, crit_def = 38, move_speed = 240}
    };
get_attr(1, 65) ->
    {
        #base_attr{power = 200, anima = 34, energy = 167, concent = 165, method = 100},
        #bt_attr{hp_lim = 6886, mp_lim = 1413, inner_att = 534, outer_att = 625, inner_def = 248, outer_def = 220, hit = 501, dodge = 139, crit_hurt = 39, crit_def = 39, move_speed = 240}
    };
get_attr(1, 66) ->
    {
        #base_attr{power = 203, anima = 34, energy = 169, concent = 167, method = 101},
        #bt_attr{hp_lim = 6988, mp_lim = 1434, inner_att = 541, outer_att = 633, inner_def = 251, outer_def = 223, hit = 508, dodge = 141, crit_hurt = 39, crit_def = 39, move_speed = 240}
    };
get_attr(1, 67) ->
    {
        #base_attr{power = 206, anima = 35, energy = 172, concent = 170, method = 103},
        #bt_attr{hp_lim = 7090, mp_lim = 1455, inner_att = 549, outer_att = 642, inner_def = 255, outer_def = 226, hit = 515, dodge = 143, crit_hurt = 40, crit_def = 40, move_speed = 240}
    };
get_attr(1, 68) ->
    {
        #base_attr{power = 209, anima = 35, energy = 174, concent = 172, method = 104},
        #bt_attr{hp_lim = 7192, mp_lim = 1476, inner_att = 556, outer_att = 650, inner_def = 258, outer_def = 229, hit = 522, dodge = 145, crit_hurt = 40, crit_def = 40, move_speed = 240}
    };
get_attr(1, 69) ->
    {
        #base_attr{power = 212, anima = 36, energy = 177, concent = 175, method = 106},
        #bt_attr{hp_lim = 7294, mp_lim = 1497, inner_att = 564, outer_att = 659, inner_def = 262, outer_def = 232, hit = 529, dodge = 147, crit_hurt = 41, crit_def = 41, move_speed = 240}
    };
get_attr(1, 70) ->
    {
        #base_attr{power = 215, anima = 36, energy = 179, concent = 177, method = 107},
        #bt_attr{hp_lim = 7396, mp_lim = 1518, inner_att = 571, outer_att = 667, inner_def = 265, outer_def = 235, hit = 536, dodge = 149, crit_hurt = 41, crit_def = 41, move_speed = 240}
    };
get_attr(1, 71) ->
    {
        #base_attr{power = 218, anima = 37, energy = 182, concent = 180, method = 109},
        #bt_attr{hp_lim = 7498, mp_lim = 1539, inner_att = 579, outer_att = 676, inner_def = 269, outer_def = 238, hit = 543, dodge = 151, crit_hurt = 42, crit_def = 42, move_speed = 240}
    };
get_attr(1, 72) ->
    {
        #base_attr{power = 221, anima = 37, energy = 184, concent = 182, method = 110},
        #bt_attr{hp_lim = 7600, mp_lim = 1560, inner_att = 586, outer_att = 684, inner_def = 272, outer_def = 241, hit = 550, dodge = 153, crit_hurt = 42, crit_def = 42, move_speed = 240}
    };
get_attr(1, 73) ->
    {
        #base_attr{power = 224, anima = 38, energy = 187, concent = 185, method = 112},
        #bt_attr{hp_lim = 7702, mp_lim = 1581, inner_att = 594, outer_att = 693, inner_def = 276, outer_def = 244, hit = 557, dodge = 155, crit_hurt = 43, crit_def = 43, move_speed = 240}
    };
get_attr(1, 74) ->
    {
        #base_attr{power = 227, anima = 38, energy = 189, concent = 187, method = 113},
        #bt_attr{hp_lim = 7804, mp_lim = 1602, inner_att = 601, outer_att = 701, inner_def = 279, outer_def = 247, hit = 564, dodge = 157, crit_hurt = 43, crit_def = 43, move_speed = 240}
    };
get_attr(1, 75) ->
    {
        #base_attr{power = 230, anima = 39, energy = 192, concent = 190, method = 115},
        #bt_attr{hp_lim = 7906, mp_lim = 1623, inner_att = 609, outer_att = 710, inner_def = 283, outer_def = 250, hit = 571, dodge = 159, crit_hurt = 44, crit_def = 44, move_speed = 240}
    };
get_attr(1, 76) ->
    {
        #base_attr{power = 233, anima = 39, energy = 194, concent = 192, method = 116},
        #bt_attr{hp_lim = 8008, mp_lim = 1644, inner_att = 616, outer_att = 718, inner_def = 286, outer_def = 253, hit = 578, dodge = 161, crit_hurt = 44, crit_def = 44, move_speed = 240}
    };
get_attr(1, 77) ->
    {
        #base_attr{power = 236, anima = 40, energy = 197, concent = 195, method = 118},
        #bt_attr{hp_lim = 8110, mp_lim = 1665, inner_att = 624, outer_att = 727, inner_def = 290, outer_def = 256, hit = 585, dodge = 163, crit_hurt = 45, crit_def = 45, move_speed = 240}
    };
get_attr(1, 78) ->
    {
        #base_attr{power = 239, anima = 40, energy = 199, concent = 197, method = 119},
        #bt_attr{hp_lim = 8212, mp_lim = 1686, inner_att = 631, outer_att = 735, inner_def = 293, outer_def = 259, hit = 592, dodge = 165, crit_hurt = 45, crit_def = 45, move_speed = 240}
    };
get_attr(1, 79) ->
    {
        #base_attr{power = 242, anima = 41, energy = 202, concent = 200, method = 121},
        #bt_attr{hp_lim = 8314, mp_lim = 1707, inner_att = 639, outer_att = 744, inner_def = 297, outer_def = 262, hit = 599, dodge = 167, crit_hurt = 46, crit_def = 46, move_speed = 240}
    };
get_attr(1, 80) ->
    {
        #base_attr{power = 245, anima = 41, energy = 204, concent = 202, method = 122},
        #bt_attr{hp_lim = 8416, mp_lim = 1728, inner_att = 646, outer_att = 752, inner_def = 300, outer_def = 265, hit = 606, dodge = 169, crit_hurt = 46, crit_def = 46, move_speed = 240}
    };
get_attr(1, 81) ->
    {
        #base_attr{power = 248, anima = 42, energy = 207, concent = 205, method = 124},
        #bt_attr{hp_lim = 8518, mp_lim = 1749, inner_att = 654, outer_att = 761, inner_def = 304, outer_def = 268, hit = 613, dodge = 171, crit_hurt = 47, crit_def = 47, move_speed = 240}
    };
get_attr(1, 82) ->
    {
        #base_attr{power = 251, anima = 42, energy = 209, concent = 207, method = 125},
        #bt_attr{hp_lim = 8620, mp_lim = 1770, inner_att = 661, outer_att = 769, inner_def = 307, outer_def = 271, hit = 620, dodge = 173, crit_hurt = 47, crit_def = 47, move_speed = 240}
    };
get_attr(1, 83) ->
    {
        #base_attr{power = 254, anima = 43, energy = 212, concent = 210, method = 127},
        #bt_attr{hp_lim = 8722, mp_lim = 1791, inner_att = 669, outer_att = 778, inner_def = 311, outer_def = 274, hit = 627, dodge = 175, crit_hurt = 48, crit_def = 48, move_speed = 240}
    };
get_attr(1, 84) ->
    {
        #base_attr{power = 257, anima = 43, energy = 214, concent = 212, method = 128},
        #bt_attr{hp_lim = 8824, mp_lim = 1812, inner_att = 676, outer_att = 786, inner_def = 314, outer_def = 277, hit = 634, dodge = 177, crit_hurt = 48, crit_def = 48, move_speed = 240}
    };
get_attr(1, 85) ->
    {
        #base_attr{power = 260, anima = 44, energy = 217, concent = 215, method = 130},
        #bt_attr{hp_lim = 8926, mp_lim = 1833, inner_att = 684, outer_att = 795, inner_def = 318, outer_def = 280, hit = 641, dodge = 179, crit_hurt = 49, crit_def = 49, move_speed = 240}
    };
get_attr(1, 86) ->
    {
        #base_attr{power = 263, anima = 44, energy = 219, concent = 217, method = 131},
        #bt_attr{hp_lim = 9028, mp_lim = 1854, inner_att = 691, outer_att = 803, inner_def = 321, outer_def = 283, hit = 648, dodge = 181, crit_hurt = 49, crit_def = 49, move_speed = 240}
    };
get_attr(1, 87) ->
    {
        #base_attr{power = 266, anima = 45, energy = 222, concent = 220, method = 133},
        #bt_attr{hp_lim = 9130, mp_lim = 1875, inner_att = 699, outer_att = 812, inner_def = 325, outer_def = 286, hit = 655, dodge = 183, crit_hurt = 50, crit_def = 50, move_speed = 240}
    };
get_attr(1, 88) ->
    {
        #base_attr{power = 269, anima = 45, energy = 224, concent = 222, method = 134},
        #bt_attr{hp_lim = 9232, mp_lim = 1896, inner_att = 706, outer_att = 820, inner_def = 328, outer_def = 289, hit = 662, dodge = 185, crit_hurt = 50, crit_def = 50, move_speed = 240}
    };
get_attr(1, 89) ->
    {
        #base_attr{power = 272, anima = 46, energy = 227, concent = 225, method = 136},
        #bt_attr{hp_lim = 9334, mp_lim = 1917, inner_att = 714, outer_att = 829, inner_def = 332, outer_def = 292, hit = 669, dodge = 187, crit_hurt = 51, crit_def = 51, move_speed = 240}
    };
get_attr(1, 90) ->
    {
        #base_attr{power = 275, anima = 46, energy = 229, concent = 227, method = 137},
        #bt_attr{hp_lim = 9436, mp_lim = 1938, inner_att = 721, outer_att = 837, inner_def = 335, outer_def = 295, hit = 676, dodge = 189, crit_hurt = 51, crit_def = 51, move_speed = 240}
    };
get_attr(1, 91) ->
    {
        #base_attr{power = 278, anima = 47, energy = 232, concent = 230, method = 139},
        #bt_attr{hp_lim = 9538, mp_lim = 1959, inner_att = 729, outer_att = 846, inner_def = 339, outer_def = 298, hit = 683, dodge = 191, crit_hurt = 52, crit_def = 52, move_speed = 240}
    };
get_attr(1, 92) ->
    {
        #base_attr{power = 281, anima = 47, energy = 234, concent = 232, method = 140},
        #bt_attr{hp_lim = 9640, mp_lim = 1980, inner_att = 736, outer_att = 854, inner_def = 342, outer_def = 301, hit = 690, dodge = 193, crit_hurt = 52, crit_def = 52, move_speed = 240}
    };
get_attr(1, 93) ->
    {
        #base_attr{power = 284, anima = 48, energy = 237, concent = 235, method = 142},
        #bt_attr{hp_lim = 9742, mp_lim = 2001, inner_att = 744, outer_att = 863, inner_def = 346, outer_def = 304, hit = 697, dodge = 195, crit_hurt = 53, crit_def = 53, move_speed = 240}
    };
get_attr(1, 94) ->
    {
        #base_attr{power = 287, anima = 48, energy = 239, concent = 237, method = 143},
        #bt_attr{hp_lim = 9844, mp_lim = 2022, inner_att = 751, outer_att = 871, inner_def = 349, outer_def = 307, hit = 704, dodge = 197, crit_hurt = 53, crit_def = 53, move_speed = 240}
    };
get_attr(1, 95) ->
    {
        #base_attr{power = 290, anima = 49, energy = 242, concent = 240, method = 145},
        #bt_attr{hp_lim = 9946, mp_lim = 2043, inner_att = 759, outer_att = 880, inner_def = 353, outer_def = 310, hit = 711, dodge = 199, crit_hurt = 54, crit_def = 54, move_speed = 240}
    };
get_attr(1, 96) ->
    {
        #base_attr{power = 293, anima = 49, energy = 244, concent = 242, method = 146},
        #bt_attr{hp_lim = 10048, mp_lim = 2064, inner_att = 766, outer_att = 888, inner_def = 356, outer_def = 313, hit = 718, dodge = 201, crit_hurt = 54, crit_def = 54, move_speed = 240}
    };
get_attr(1, 97) ->
    {
        #base_attr{power = 296, anima = 50, energy = 247, concent = 245, method = 148},
        #bt_attr{hp_lim = 10150, mp_lim = 2085, inner_att = 774, outer_att = 897, inner_def = 360, outer_def = 316, hit = 725, dodge = 203, crit_hurt = 55, crit_def = 55, move_speed = 240}
    };
get_attr(1, 98) ->
    {
        #base_attr{power = 299, anima = 50, energy = 249, concent = 247, method = 149},
        #bt_attr{hp_lim = 10252, mp_lim = 2106, inner_att = 781, outer_att = 905, inner_def = 363, outer_def = 319, hit = 732, dodge = 205, crit_hurt = 55, crit_def = 55, move_speed = 240}
    };
get_attr(1, 99) ->
    {
        #base_attr{power = 302, anima = 51, energy = 252, concent = 250, method = 151},
        #bt_attr{hp_lim = 10354, mp_lim = 2127, inner_att = 789, outer_att = 914, inner_def = 367, outer_def = 322, hit = 739, dodge = 207, crit_hurt = 56, crit_def = 56, move_speed = 240}
    };
get_attr(1, 100) ->
    {
        #base_attr{power = 305, anima = 51, energy = 254, concent = 252, method = 152},
        #bt_attr{hp_lim = 10456, mp_lim = 2148, inner_att = 796, outer_att = 922, inner_def = 370, outer_def = 325, hit = 746, dodge = 209, crit_hurt = 56, crit_def = 56, move_speed = 240}
    };
get_attr(1, 101) ->
    {
        #base_attr{power = 308, anima = 52, energy = 257, concent = 255, method = 154},
        #bt_attr{hp_lim = 10558, mp_lim = 2169, inner_att = 804, outer_att = 931, inner_def = 374, outer_def = 328, hit = 753, dodge = 211, crit_hurt = 57, crit_def = 57, move_speed = 240}
    };
get_attr(1, 102) ->
    {
        #base_attr{power = 311, anima = 52, energy = 259, concent = 257, method = 155},
        #bt_attr{hp_lim = 10660, mp_lim = 2190, inner_att = 811, outer_att = 939, inner_def = 377, outer_def = 331, hit = 760, dodge = 213, crit_hurt = 57, crit_def = 57, move_speed = 240}
    };
get_attr(1, 103) ->
    {
        #base_attr{power = 314, anima = 53, energy = 262, concent = 260, method = 157},
        #bt_attr{hp_lim = 10762, mp_lim = 2211, inner_att = 819, outer_att = 948, inner_def = 381, outer_def = 334, hit = 767, dodge = 215, crit_hurt = 58, crit_def = 58, move_speed = 240}
    };
get_attr(1, 104) ->
    {
        #base_attr{power = 317, anima = 53, energy = 264, concent = 262, method = 158},
        #bt_attr{hp_lim = 10864, mp_lim = 2232, inner_att = 826, outer_att = 956, inner_def = 384, outer_def = 337, hit = 774, dodge = 217, crit_hurt = 58, crit_def = 58, move_speed = 240}
    };
get_attr(1, 105) ->
    {
        #base_attr{power = 320, anima = 54, energy = 267, concent = 265, method = 160},
        #bt_attr{hp_lim = 10966, mp_lim = 2253, inner_att = 834, outer_att = 965, inner_def = 388, outer_def = 340, hit = 781, dodge = 219, crit_hurt = 59, crit_def = 59, move_speed = 240}
    };
get_attr(1, 106) ->
    {
        #base_attr{power = 323, anima = 54, energy = 269, concent = 267, method = 161},
        #bt_attr{hp_lim = 11068, mp_lim = 2274, inner_att = 841, outer_att = 973, inner_def = 391, outer_def = 343, hit = 788, dodge = 221, crit_hurt = 59, crit_def = 59, move_speed = 240}
    };
get_attr(1, 107) ->
    {
        #base_attr{power = 326, anima = 55, energy = 272, concent = 270, method = 163},
        #bt_attr{hp_lim = 11170, mp_lim = 2295, inner_att = 849, outer_att = 982, inner_def = 395, outer_def = 346, hit = 795, dodge = 223, crit_hurt = 60, crit_def = 60, move_speed = 240}
    };
get_attr(1, 108) ->
    {
        #base_attr{power = 329, anima = 55, energy = 274, concent = 272, method = 164},
        #bt_attr{hp_lim = 11272, mp_lim = 2316, inner_att = 856, outer_att = 990, inner_def = 398, outer_def = 349, hit = 802, dodge = 225, crit_hurt = 60, crit_def = 60, move_speed = 240}
    };
get_attr(1, 109) ->
    {
        #base_attr{power = 332, anima = 56, energy = 277, concent = 275, method = 166},
        #bt_attr{hp_lim = 11374, mp_lim = 2337, inner_att = 864, outer_att = 999, inner_def = 402, outer_def = 352, hit = 809, dodge = 227, crit_hurt = 61, crit_def = 61, move_speed = 240}
    };
get_attr(1, 110) ->
    {
        #base_attr{power = 335, anima = 56, energy = 279, concent = 277, method = 167},
        #bt_attr{hp_lim = 11476, mp_lim = 2358, inner_att = 871, outer_att = 1007, inner_def = 405, outer_def = 355, hit = 816, dodge = 229, crit_hurt = 61, crit_def = 61, move_speed = 240}
    };
get_attr(1, 111) ->
    {
        #base_attr{power = 338, anima = 57, energy = 282, concent = 280, method = 169},
        #bt_attr{hp_lim = 11578, mp_lim = 2379, inner_att = 879, outer_att = 1016, inner_def = 409, outer_def = 358, hit = 823, dodge = 231, crit_hurt = 62, crit_def = 62, move_speed = 240}
    };
get_attr(1, 112) ->
    {
        #base_attr{power = 341, anima = 57, energy = 284, concent = 282, method = 170},
        #bt_attr{hp_lim = 11680, mp_lim = 2400, inner_att = 886, outer_att = 1024, inner_def = 412, outer_def = 361, hit = 830, dodge = 233, crit_hurt = 62, crit_def = 62, move_speed = 240}
    };
get_attr(1, 113) ->
    {
        #base_attr{power = 344, anima = 58, energy = 287, concent = 285, method = 172},
        #bt_attr{hp_lim = 11782, mp_lim = 2421, inner_att = 894, outer_att = 1033, inner_def = 416, outer_def = 364, hit = 837, dodge = 235, crit_hurt = 63, crit_def = 63, move_speed = 240}
    };
get_attr(1, 114) ->
    {
        #base_attr{power = 347, anima = 58, energy = 289, concent = 287, method = 173},
        #bt_attr{hp_lim = 11884, mp_lim = 2442, inner_att = 901, outer_att = 1041, inner_def = 419, outer_def = 367, hit = 844, dodge = 237, crit_hurt = 63, crit_def = 63, move_speed = 240}
    };
get_attr(1, 115) ->
    {
        #base_attr{power = 350, anima = 59, energy = 292, concent = 290, method = 175},
        #bt_attr{hp_lim = 11986, mp_lim = 2463, inner_att = 909, outer_att = 1050, inner_def = 423, outer_def = 370, hit = 851, dodge = 239, crit_hurt = 64, crit_def = 64, move_speed = 240}
    };
get_attr(1, 116) ->
    {
        #base_attr{power = 353, anima = 59, energy = 294, concent = 292, method = 176},
        #bt_attr{hp_lim = 12088, mp_lim = 2484, inner_att = 916, outer_att = 1058, inner_def = 426, outer_def = 373, hit = 858, dodge = 241, crit_hurt = 64, crit_def = 64, move_speed = 240}
    };
get_attr(1, 117) ->
    {
        #base_attr{power = 356, anima = 60, energy = 297, concent = 295, method = 178},
        #bt_attr{hp_lim = 12190, mp_lim = 2505, inner_att = 924, outer_att = 1067, inner_def = 430, outer_def = 376, hit = 865, dodge = 243, crit_hurt = 65, crit_def = 65, move_speed = 240}
    };
get_attr(1, 118) ->
    {
        #base_attr{power = 359, anima = 60, energy = 299, concent = 297, method = 179},
        #bt_attr{hp_lim = 12292, mp_lim = 2526, inner_att = 931, outer_att = 1075, inner_def = 433, outer_def = 379, hit = 872, dodge = 245, crit_hurt = 65, crit_def = 65, move_speed = 240}
    };
get_attr(1, 119) ->
    {
        #base_attr{power = 362, anima = 61, energy = 302, concent = 300, method = 181},
        #bt_attr{hp_lim = 12394, mp_lim = 2547, inner_att = 939, outer_att = 1084, inner_def = 437, outer_def = 382, hit = 879, dodge = 247, crit_hurt = 66, crit_def = 66, move_speed = 240}
    };
get_attr(1, 120) ->
    {
        #base_attr{power = 365, anima = 61, energy = 304, concent = 302, method = 182},
        #bt_attr{hp_lim = 12496, mp_lim = 2568, inner_att = 946, outer_att = 1092, inner_def = 440, outer_def = 385, hit = 886, dodge = 249, crit_hurt = 66, crit_def = 66, move_speed = 240}
    };
get_attr(1, 121) ->
    {
        #base_attr{power = 368, anima = 62, energy = 307, concent = 305, method = 184},
        #bt_attr{hp_lim = 12598, mp_lim = 2589, inner_att = 954, outer_att = 1101, inner_def = 444, outer_def = 388, hit = 893, dodge = 251, crit_hurt = 67, crit_def = 67, move_speed = 240}
    };
get_attr(1, 122) ->
    {
        #base_attr{power = 371, anima = 62, energy = 309, concent = 307, method = 185},
        #bt_attr{hp_lim = 12700, mp_lim = 2610, inner_att = 961, outer_att = 1109, inner_def = 447, outer_def = 391, hit = 900, dodge = 253, crit_hurt = 67, crit_def = 67, move_speed = 240}
    };
get_attr(1, 123) ->
    {
        #base_attr{power = 374, anima = 63, energy = 312, concent = 310, method = 187},
        #bt_attr{hp_lim = 12802, mp_lim = 2631, inner_att = 969, outer_att = 1118, inner_def = 451, outer_def = 394, hit = 907, dodge = 255, crit_hurt = 68, crit_def = 68, move_speed = 240}
    };
get_attr(1, 124) ->
    {
        #base_attr{power = 377, anima = 63, energy = 314, concent = 312, method = 188},
        #bt_attr{hp_lim = 12904, mp_lim = 2652, inner_att = 976, outer_att = 1126, inner_def = 454, outer_def = 397, hit = 914, dodge = 257, crit_hurt = 68, crit_def = 68, move_speed = 240}
    };
get_attr(1, 125) ->
    {
        #base_attr{power = 380, anima = 64, energy = 317, concent = 315, method = 190},
        #bt_attr{hp_lim = 13006, mp_lim = 2673, inner_att = 984, outer_att = 1135, inner_def = 458, outer_def = 400, hit = 921, dodge = 259, crit_hurt = 69, crit_def = 69, move_speed = 240}
    };
get_attr(1, 126) ->
    {
        #base_attr{power = 383, anima = 64, energy = 319, concent = 317, method = 191},
        #bt_attr{hp_lim = 13108, mp_lim = 2694, inner_att = 991, outer_att = 1143, inner_def = 461, outer_def = 403, hit = 928, dodge = 261, crit_hurt = 69, crit_def = 69, move_speed = 240}
    };
get_attr(1, 127) ->
    {
        #base_attr{power = 386, anima = 65, energy = 322, concent = 320, method = 193},
        #bt_attr{hp_lim = 13210, mp_lim = 2715, inner_att = 999, outer_att = 1152, inner_def = 465, outer_def = 406, hit = 935, dodge = 263, crit_hurt = 70, crit_def = 70, move_speed = 240}
    };
get_attr(1, 128) ->
    {
        #base_attr{power = 389, anima = 65, energy = 324, concent = 322, method = 194},
        #bt_attr{hp_lim = 13312, mp_lim = 2736, inner_att = 1006, outer_att = 1160, inner_def = 468, outer_def = 409, hit = 942, dodge = 265, crit_hurt = 70, crit_def = 70, move_speed = 240}
    };
get_attr(1, 129) ->
    {
        #base_attr{power = 392, anima = 66, energy = 327, concent = 325, method = 196},
        #bt_attr{hp_lim = 13414, mp_lim = 2757, inner_att = 1014, outer_att = 1169, inner_def = 472, outer_def = 412, hit = 949, dodge = 267, crit_hurt = 71, crit_def = 71, move_speed = 240}
    };
get_attr(1, 130) ->
    {
        #base_attr{power = 395, anima = 66, energy = 329, concent = 327, method = 197},
        #bt_attr{hp_lim = 13516, mp_lim = 2778, inner_att = 1021, outer_att = 1177, inner_def = 475, outer_def = 415, hit = 956, dodge = 269, crit_hurt = 71, crit_def = 71, move_speed = 240}
    };
get_attr(1, 131) ->
    {
        #base_attr{power = 398, anima = 67, energy = 332, concent = 330, method = 199},
        #bt_attr{hp_lim = 13618, mp_lim = 2799, inner_att = 1029, outer_att = 1186, inner_def = 479, outer_def = 418, hit = 963, dodge = 271, crit_hurt = 72, crit_def = 72, move_speed = 240}
    };
get_attr(1, 132) ->
    {
        #base_attr{power = 401, anima = 67, energy = 334, concent = 332, method = 200},
        #bt_attr{hp_lim = 13720, mp_lim = 2820, inner_att = 1036, outer_att = 1194, inner_def = 482, outer_def = 421, hit = 970, dodge = 273, crit_hurt = 72, crit_def = 72, move_speed = 240}
    };
get_attr(1, 133) ->
    {
        #base_attr{power = 404, anima = 68, energy = 337, concent = 335, method = 202},
        #bt_attr{hp_lim = 13822, mp_lim = 2841, inner_att = 1044, outer_att = 1203, inner_def = 486, outer_def = 424, hit = 977, dodge = 275, crit_hurt = 73, crit_def = 73, move_speed = 240}
    };
get_attr(1, 134) ->
    {
        #base_attr{power = 407, anima = 68, energy = 339, concent = 337, method = 203},
        #bt_attr{hp_lim = 13924, mp_lim = 2862, inner_att = 1051, outer_att = 1211, inner_def = 489, outer_def = 427, hit = 984, dodge = 277, crit_hurt = 73, crit_def = 73, move_speed = 240}
    };
get_attr(1, 135) ->
    {
        #base_attr{power = 410, anima = 69, energy = 342, concent = 340, method = 205},
        #bt_attr{hp_lim = 14026, mp_lim = 2883, inner_att = 1059, outer_att = 1220, inner_def = 493, outer_def = 430, hit = 991, dodge = 279, crit_hurt = 74, crit_def = 74, move_speed = 240}
    };
get_attr(1, 136) ->
    {
        #base_attr{power = 413, anima = 69, energy = 344, concent = 342, method = 206},
        #bt_attr{hp_lim = 14128, mp_lim = 2904, inner_att = 1066, outer_att = 1228, inner_def = 496, outer_def = 433, hit = 998, dodge = 281, crit_hurt = 74, crit_def = 74, move_speed = 240}
    };
get_attr(1, 137) ->
    {
        #base_attr{power = 416, anima = 70, energy = 347, concent = 345, method = 208},
        #bt_attr{hp_lim = 14230, mp_lim = 2925, inner_att = 1074, outer_att = 1237, inner_def = 500, outer_def = 436, hit = 1005, dodge = 283, crit_hurt = 75, crit_def = 75, move_speed = 240}
    };
get_attr(1, 138) ->
    {
        #base_attr{power = 419, anima = 70, energy = 349, concent = 347, method = 209},
        #bt_attr{hp_lim = 14332, mp_lim = 2946, inner_att = 1081, outer_att = 1245, inner_def = 503, outer_def = 439, hit = 1012, dodge = 285, crit_hurt = 75, crit_def = 75, move_speed = 240}
    };
get_attr(1, 139) ->
    {
        #base_attr{power = 422, anima = 71, energy = 352, concent = 350, method = 211},
        #bt_attr{hp_lim = 14434, mp_lim = 2967, inner_att = 1089, outer_att = 1254, inner_def = 507, outer_def = 442, hit = 1019, dodge = 287, crit_hurt = 76, crit_def = 76, move_speed = 240}
    };
get_attr(1, 140) ->
    {
        #base_attr{power = 425, anima = 71, energy = 354, concent = 352, method = 212},
        #bt_attr{hp_lim = 14536, mp_lim = 2988, inner_att = 1096, outer_att = 1262, inner_def = 510, outer_def = 445, hit = 1026, dodge = 289, crit_hurt = 76, crit_def = 76, move_speed = 240}
    };
get_attr(1, 141) ->
    {
        #base_attr{power = 428, anima = 72, energy = 357, concent = 355, method = 214},
        #bt_attr{hp_lim = 14638, mp_lim = 3009, inner_att = 1104, outer_att = 1271, inner_def = 514, outer_def = 448, hit = 1033, dodge = 291, crit_hurt = 77, crit_def = 77, move_speed = 240}
    };
get_attr(1, 142) ->
    {
        #base_attr{power = 431, anima = 72, energy = 359, concent = 357, method = 215},
        #bt_attr{hp_lim = 14740, mp_lim = 3030, inner_att = 1111, outer_att = 1279, inner_def = 517, outer_def = 451, hit = 1040, dodge = 293, crit_hurt = 77, crit_def = 77, move_speed = 240}
    };
get_attr(1, 143) ->
    {
        #base_attr{power = 434, anima = 73, energy = 362, concent = 360, method = 217},
        #bt_attr{hp_lim = 14842, mp_lim = 3051, inner_att = 1119, outer_att = 1288, inner_def = 521, outer_def = 454, hit = 1047, dodge = 295, crit_hurt = 78, crit_def = 78, move_speed = 240}
    };
get_attr(1, 144) ->
    {
        #base_attr{power = 437, anima = 73, energy = 364, concent = 362, method = 218},
        #bt_attr{hp_lim = 14944, mp_lim = 3072, inner_att = 1126, outer_att = 1296, inner_def = 524, outer_def = 457, hit = 1054, dodge = 297, crit_hurt = 78, crit_def = 78, move_speed = 240}
    };
get_attr(1, 145) ->
    {
        #base_attr{power = 440, anima = 74, energy = 367, concent = 365, method = 220},
        #bt_attr{hp_lim = 15046, mp_lim = 3093, inner_att = 1134, outer_att = 1305, inner_def = 528, outer_def = 460, hit = 1061, dodge = 299, crit_hurt = 79, crit_def = 79, move_speed = 240}
    };
get_attr(1, 146) ->
    {
        #base_attr{power = 443, anima = 74, energy = 369, concent = 367, method = 221},
        #bt_attr{hp_lim = 15148, mp_lim = 3114, inner_att = 1141, outer_att = 1313, inner_def = 531, outer_def = 463, hit = 1068, dodge = 301, crit_hurt = 79, crit_def = 79, move_speed = 240}
    };
get_attr(1, 147) ->
    {
        #base_attr{power = 446, anima = 75, energy = 372, concent = 370, method = 223},
        #bt_attr{hp_lim = 15250, mp_lim = 3135, inner_att = 1149, outer_att = 1322, inner_def = 535, outer_def = 466, hit = 1075, dodge = 303, crit_hurt = 80, crit_def = 80, move_speed = 240}
    };
get_attr(1, 148) ->
    {
        #base_attr{power = 449, anima = 75, energy = 374, concent = 372, method = 224},
        #bt_attr{hp_lim = 15352, mp_lim = 3156, inner_att = 1156, outer_att = 1330, inner_def = 538, outer_def = 469, hit = 1082, dodge = 305, crit_hurt = 80, crit_def = 80, move_speed = 240}
    };
get_attr(1, 149) ->
    {
        #base_attr{power = 452, anima = 76, energy = 377, concent = 375, method = 226},
        #bt_attr{hp_lim = 15454, mp_lim = 3177, inner_att = 1164, outer_att = 1339, inner_def = 542, outer_def = 472, hit = 1089, dodge = 307, crit_hurt = 81, crit_def = 81, move_speed = 240}
    };
get_attr(1, 150) ->
    {
        #base_attr{power = 455, anima = 76, energy = 379, concent = 377, method = 227},
        #bt_attr{hp_lim = 15556, mp_lim = 3198, inner_att = 1171, outer_att = 1347, inner_def = 545, outer_def = 475, hit = 1096, dodge = 309, crit_hurt = 81, crit_def = 81, move_speed = 240}
    };
get_attr(2, 1) ->
    {
        #base_attr{power = 2, anima = 8, energy = 6, concent = 5, method = 4},
        #bt_attr{hp_lim = 285, mp_lim = 102, inner_att = 24, outer_att = 29, inner_def = 49, outer_def = 81, hit = 56, dodge = 8, crit_hurt = 7, crit_def = 7, move_speed = 240}
    };
get_attr(2, 2) ->
    {
        #base_attr{power = 2, anima = 11, energy = 8, concent = 8, method = 5},
        #bt_attr{hp_lim = 375, mp_lim = 132, inner_att = 26, outer_att = 33, inner_def = 56, outer_def = 89, hit = 63, dodge = 9, crit_hurt = 8, crit_def = 8, move_speed = 240}
    };
get_attr(2, 3) ->
    {
        #base_attr{power = 3, anima = 14, energy = 11, concent = 11, method = 6},
        #bt_attr{hp_lim = 465, mp_lim = 162, inner_att = 28, outer_att = 37, inner_def = 63, outer_def = 98, hit = 71, dodge = 11, crit_hurt = 9, crit_def = 9, move_speed = 240}
    };
get_attr(2, 4) ->
    {
        #base_attr{power = 3, anima = 17, energy = 13, concent = 14, method = 7},
        #bt_attr{hp_lim = 555, mp_lim = 192, inner_att = 30, outer_att = 41, inner_def = 70, outer_def = 106, hit = 78, dodge = 12, crit_hurt = 10, crit_def = 10, move_speed = 240}
    };
get_attr(2, 5) ->
    {
        #base_attr{power = 4, anima = 20, energy = 16, concent = 17, method = 8},
        #bt_attr{hp_lim = 645, mp_lim = 222, inner_att = 32, outer_att = 45, inner_def = 77, outer_def = 115, hit = 86, dodge = 14, crit_hurt = 11, crit_def = 11, move_speed = 240}
    };
get_attr(2, 6) ->
    {
        #base_attr{power = 4, anima = 23, energy = 18, concent = 20, method = 9},
        #bt_attr{hp_lim = 735, mp_lim = 252, inner_att = 34, outer_att = 49, inner_def = 84, outer_def = 123, hit = 93, dodge = 15, crit_hurt = 12, crit_def = 12, move_speed = 240}
    };
get_attr(2, 7) ->
    {
        #base_attr{power = 5, anima = 26, energy = 21, concent = 23, method = 10},
        #bt_attr{hp_lim = 825, mp_lim = 282, inner_att = 36, outer_att = 53, inner_def = 91, outer_def = 132, hit = 101, dodge = 17, crit_hurt = 13, crit_def = 13, move_speed = 240}
    };
get_attr(2, 8) ->
    {
        #base_attr{power = 5, anima = 29, energy = 23, concent = 26, method = 11},
        #bt_attr{hp_lim = 915, mp_lim = 312, inner_att = 38, outer_att = 57, inner_def = 98, outer_def = 140, hit = 108, dodge = 18, crit_hurt = 14, crit_def = 14, move_speed = 240}
    };
get_attr(2, 9) ->
    {
        #base_attr{power = 6, anima = 32, energy = 26, concent = 29, method = 12},
        #bt_attr{hp_lim = 1005, mp_lim = 342, inner_att = 40, outer_att = 61, inner_def = 105, outer_def = 149, hit = 116, dodge = 20, crit_hurt = 15, crit_def = 15, move_speed = 240}
    };
get_attr(2, 10) ->
    {
        #base_attr{power = 6, anima = 35, energy = 28, concent = 32, method = 13},
        #bt_attr{hp_lim = 1095, mp_lim = 372, inner_att = 42, outer_att = 65, inner_def = 112, outer_def = 157, hit = 123, dodge = 21, crit_hurt = 16, crit_def = 16, move_speed = 240}
    };
get_attr(2, 11) ->
    {
        #base_attr{power = 7, anima = 38, energy = 31, concent = 35, method = 14},
        #bt_attr{hp_lim = 1185, mp_lim = 402, inner_att = 44, outer_att = 69, inner_def = 119, outer_def = 166, hit = 131, dodge = 23, crit_hurt = 17, crit_def = 17, move_speed = 240}
    };
get_attr(2, 12) ->
    {
        #base_attr{power = 7, anima = 41, energy = 33, concent = 38, method = 15},
        #bt_attr{hp_lim = 1275, mp_lim = 432, inner_att = 46, outer_att = 73, inner_def = 126, outer_def = 174, hit = 138, dodge = 24, crit_hurt = 18, crit_def = 18, move_speed = 240}
    };
get_attr(2, 13) ->
    {
        #base_attr{power = 8, anima = 44, energy = 36, concent = 41, method = 16},
        #bt_attr{hp_lim = 1365, mp_lim = 462, inner_att = 48, outer_att = 77, inner_def = 133, outer_def = 183, hit = 146, dodge = 26, crit_hurt = 19, crit_def = 19, move_speed = 240}
    };
get_attr(2, 14) ->
    {
        #base_attr{power = 8, anima = 47, energy = 38, concent = 44, method = 17},
        #bt_attr{hp_lim = 1455, mp_lim = 492, inner_att = 50, outer_att = 81, inner_def = 140, outer_def = 191, hit = 153, dodge = 27, crit_hurt = 20, crit_def = 20, move_speed = 240}
    };
get_attr(2, 15) ->
    {
        #base_attr{power = 9, anima = 50, energy = 41, concent = 47, method = 18},
        #bt_attr{hp_lim = 1545, mp_lim = 522, inner_att = 52, outer_att = 85, inner_def = 147, outer_def = 200, hit = 161, dodge = 29, crit_hurt = 21, crit_def = 21, move_speed = 240}
    };
get_attr(2, 16) ->
    {
        #base_attr{power = 9, anima = 53, energy = 43, concent = 50, method = 19},
        #bt_attr{hp_lim = 1635, mp_lim = 552, inner_att = 54, outer_att = 89, inner_def = 154, outer_def = 208, hit = 168, dodge = 30, crit_hurt = 22, crit_def = 22, move_speed = 240}
    };
get_attr(2, 17) ->
    {
        #base_attr{power = 10, anima = 56, energy = 46, concent = 53, method = 20},
        #bt_attr{hp_lim = 1725, mp_lim = 582, inner_att = 56, outer_att = 93, inner_def = 161, outer_def = 217, hit = 176, dodge = 32, crit_hurt = 23, crit_def = 23, move_speed = 240}
    };
get_attr(2, 18) ->
    {
        #base_attr{power = 10, anima = 59, energy = 48, concent = 56, method = 21},
        #bt_attr{hp_lim = 1815, mp_lim = 612, inner_att = 58, outer_att = 97, inner_def = 168, outer_def = 225, hit = 183, dodge = 33, crit_hurt = 24, crit_def = 24, move_speed = 240}
    };
get_attr(2, 19) ->
    {
        #base_attr{power = 11, anima = 62, energy = 51, concent = 59, method = 22},
        #bt_attr{hp_lim = 1905, mp_lim = 642, inner_att = 60, outer_att = 101, inner_def = 175, outer_def = 234, hit = 191, dodge = 35, crit_hurt = 25, crit_def = 25, move_speed = 240}
    };
get_attr(2, 20) ->
    {
        #base_attr{power = 11, anima = 65, energy = 53, concent = 62, method = 23},
        #bt_attr{hp_lim = 1995, mp_lim = 672, inner_att = 62, outer_att = 105, inner_def = 182, outer_def = 242, hit = 198, dodge = 36, crit_hurt = 26, crit_def = 26, move_speed = 240}
    };
get_attr(2, 21) ->
    {
        #base_attr{power = 12, anima = 68, energy = 56, concent = 65, method = 24},
        #bt_attr{hp_lim = 2085, mp_lim = 702, inner_att = 64, outer_att = 109, inner_def = 189, outer_def = 251, hit = 206, dodge = 38, crit_hurt = 27, crit_def = 27, move_speed = 240}
    };
get_attr(2, 22) ->
    {
        #base_attr{power = 12, anima = 71, energy = 58, concent = 68, method = 25},
        #bt_attr{hp_lim = 2175, mp_lim = 732, inner_att = 66, outer_att = 113, inner_def = 196, outer_def = 259, hit = 213, dodge = 39, crit_hurt = 28, crit_def = 28, move_speed = 240}
    };
get_attr(2, 23) ->
    {
        #base_attr{power = 13, anima = 74, energy = 61, concent = 71, method = 26},
        #bt_attr{hp_lim = 2265, mp_lim = 762, inner_att = 68, outer_att = 117, inner_def = 203, outer_def = 268, hit = 221, dodge = 41, crit_hurt = 29, crit_def = 29, move_speed = 240}
    };
get_attr(2, 24) ->
    {
        #base_attr{power = 13, anima = 77, energy = 63, concent = 74, method = 27},
        #bt_attr{hp_lim = 2355, mp_lim = 792, inner_att = 70, outer_att = 121, inner_def = 210, outer_def = 276, hit = 228, dodge = 42, crit_hurt = 30, crit_def = 30, move_speed = 240}
    };
get_attr(2, 25) ->
    {
        #base_attr{power = 14, anima = 80, energy = 66, concent = 77, method = 28},
        #bt_attr{hp_lim = 2445, mp_lim = 822, inner_att = 72, outer_att = 125, inner_def = 217, outer_def = 285, hit = 236, dodge = 44, crit_hurt = 31, crit_def = 31, move_speed = 240}
    };
get_attr(2, 26) ->
    {
        #base_attr{power = 14, anima = 83, energy = 68, concent = 80, method = 29},
        #bt_attr{hp_lim = 2535, mp_lim = 852, inner_att = 74, outer_att = 129, inner_def = 224, outer_def = 293, hit = 243, dodge = 45, crit_hurt = 32, crit_def = 32, move_speed = 240}
    };
get_attr(2, 27) ->
    {
        #base_attr{power = 15, anima = 86, energy = 71, concent = 83, method = 30},
        #bt_attr{hp_lim = 2625, mp_lim = 882, inner_att = 76, outer_att = 133, inner_def = 231, outer_def = 302, hit = 251, dodge = 47, crit_hurt = 33, crit_def = 33, move_speed = 240}
    };
get_attr(2, 28) ->
    {
        #base_attr{power = 15, anima = 89, energy = 73, concent = 86, method = 31},
        #bt_attr{hp_lim = 2715, mp_lim = 912, inner_att = 78, outer_att = 137, inner_def = 238, outer_def = 310, hit = 258, dodge = 48, crit_hurt = 34, crit_def = 34, move_speed = 240}
    };
get_attr(2, 29) ->
    {
        #base_attr{power = 16, anima = 92, energy = 76, concent = 89, method = 32},
        #bt_attr{hp_lim = 2805, mp_lim = 942, inner_att = 80, outer_att = 141, inner_def = 245, outer_def = 319, hit = 266, dodge = 50, crit_hurt = 35, crit_def = 35, move_speed = 240}
    };
get_attr(2, 30) ->
    {
        #base_attr{power = 16, anima = 95, energy = 78, concent = 92, method = 33},
        #bt_attr{hp_lim = 2895, mp_lim = 972, inner_att = 82, outer_att = 145, inner_def = 252, outer_def = 327, hit = 273, dodge = 51, crit_hurt = 36, crit_def = 36, move_speed = 240}
    };
get_attr(2, 31) ->
    {
        #base_attr{power = 17, anima = 98, energy = 81, concent = 95, method = 34},
        #bt_attr{hp_lim = 2985, mp_lim = 1002, inner_att = 84, outer_att = 149, inner_def = 259, outer_def = 336, hit = 281, dodge = 53, crit_hurt = 37, crit_def = 37, move_speed = 240}
    };
get_attr(2, 32) ->
    {
        #base_attr{power = 17, anima = 101, energy = 83, concent = 98, method = 35},
        #bt_attr{hp_lim = 3075, mp_lim = 1032, inner_att = 86, outer_att = 153, inner_def = 266, outer_def = 344, hit = 288, dodge = 54, crit_hurt = 38, crit_def = 38, move_speed = 240}
    };
get_attr(2, 33) ->
    {
        #base_attr{power = 18, anima = 104, energy = 86, concent = 101, method = 36},
        #bt_attr{hp_lim = 3165, mp_lim = 1062, inner_att = 88, outer_att = 157, inner_def = 273, outer_def = 353, hit = 296, dodge = 56, crit_hurt = 39, crit_def = 39, move_speed = 240}
    };
get_attr(2, 34) ->
    {
        #base_attr{power = 18, anima = 107, energy = 88, concent = 104, method = 37},
        #bt_attr{hp_lim = 3255, mp_lim = 1092, inner_att = 90, outer_att = 161, inner_def = 280, outer_def = 361, hit = 303, dodge = 57, crit_hurt = 40, crit_def = 40, move_speed = 240}
    };
get_attr(2, 35) ->
    {
        #base_attr{power = 19, anima = 110, energy = 91, concent = 107, method = 38},
        #bt_attr{hp_lim = 3345, mp_lim = 1122, inner_att = 92, outer_att = 165, inner_def = 287, outer_def = 370, hit = 311, dodge = 59, crit_hurt = 41, crit_def = 41, move_speed = 240}
    };
get_attr(2, 36) ->
    {
        #base_attr{power = 19, anima = 113, energy = 93, concent = 110, method = 39},
        #bt_attr{hp_lim = 3435, mp_lim = 1152, inner_att = 94, outer_att = 169, inner_def = 294, outer_def = 378, hit = 318, dodge = 60, crit_hurt = 42, crit_def = 42, move_speed = 240}
    };
get_attr(2, 37) ->
    {
        #base_attr{power = 20, anima = 116, energy = 96, concent = 113, method = 40},
        #bt_attr{hp_lim = 3525, mp_lim = 1182, inner_att = 96, outer_att = 173, inner_def = 301, outer_def = 387, hit = 326, dodge = 62, crit_hurt = 43, crit_def = 43, move_speed = 240}
    };
get_attr(2, 38) ->
    {
        #base_attr{power = 20, anima = 119, energy = 98, concent = 116, method = 41},
        #bt_attr{hp_lim = 3615, mp_lim = 1212, inner_att = 98, outer_att = 177, inner_def = 308, outer_def = 395, hit = 333, dodge = 63, crit_hurt = 44, crit_def = 44, move_speed = 240}
    };
get_attr(2, 39) ->
    {
        #base_attr{power = 21, anima = 122, energy = 101, concent = 119, method = 42},
        #bt_attr{hp_lim = 3705, mp_lim = 1242, inner_att = 100, outer_att = 181, inner_def = 315, outer_def = 404, hit = 341, dodge = 65, crit_hurt = 45, crit_def = 45, move_speed = 240}
    };
get_attr(2, 40) ->
    {
        #base_attr{power = 21, anima = 125, energy = 103, concent = 122, method = 43},
        #bt_attr{hp_lim = 3795, mp_lim = 1272, inner_att = 102, outer_att = 185, inner_def = 322, outer_def = 412, hit = 348, dodge = 66, crit_hurt = 46, crit_def = 46, move_speed = 240}
    };
get_attr(2, 41) ->
    {
        #base_attr{power = 22, anima = 128, energy = 106, concent = 125, method = 44},
        #bt_attr{hp_lim = 3885, mp_lim = 1302, inner_att = 104, outer_att = 189, inner_def = 329, outer_def = 421, hit = 356, dodge = 68, crit_hurt = 47, crit_def = 47, move_speed = 240}
    };
get_attr(2, 42) ->
    {
        #base_attr{power = 22, anima = 131, energy = 108, concent = 128, method = 45},
        #bt_attr{hp_lim = 3975, mp_lim = 1332, inner_att = 106, outer_att = 193, inner_def = 336, outer_def = 429, hit = 363, dodge = 69, crit_hurt = 48, crit_def = 48, move_speed = 240}
    };
get_attr(2, 43) ->
    {
        #base_attr{power = 23, anima = 134, energy = 111, concent = 131, method = 46},
        #bt_attr{hp_lim = 4065, mp_lim = 1362, inner_att = 108, outer_att = 197, inner_def = 343, outer_def = 438, hit = 371, dodge = 71, crit_hurt = 49, crit_def = 49, move_speed = 240}
    };
get_attr(2, 44) ->
    {
        #base_attr{power = 23, anima = 137, energy = 113, concent = 134, method = 47},
        #bt_attr{hp_lim = 4155, mp_lim = 1392, inner_att = 110, outer_att = 201, inner_def = 350, outer_def = 446, hit = 378, dodge = 72, crit_hurt = 50, crit_def = 50, move_speed = 240}
    };
get_attr(2, 45) ->
    {
        #base_attr{power = 24, anima = 140, energy = 116, concent = 137, method = 48},
        #bt_attr{hp_lim = 4245, mp_lim = 1422, inner_att = 112, outer_att = 205, inner_def = 357, outer_def = 455, hit = 386, dodge = 74, crit_hurt = 51, crit_def = 51, move_speed = 240}
    };
get_attr(2, 46) ->
    {
        #base_attr{power = 24, anima = 143, energy = 118, concent = 140, method = 49},
        #bt_attr{hp_lim = 4335, mp_lim = 1452, inner_att = 114, outer_att = 209, inner_def = 364, outer_def = 463, hit = 393, dodge = 75, crit_hurt = 52, crit_def = 52, move_speed = 240}
    };
get_attr(2, 47) ->
    {
        #base_attr{power = 25, anima = 146, energy = 121, concent = 143, method = 50},
        #bt_attr{hp_lim = 4425, mp_lim = 1482, inner_att = 116, outer_att = 213, inner_def = 371, outer_def = 472, hit = 401, dodge = 77, crit_hurt = 53, crit_def = 53, move_speed = 240}
    };
get_attr(2, 48) ->
    {
        #base_attr{power = 25, anima = 149, energy = 123, concent = 146, method = 51},
        #bt_attr{hp_lim = 4515, mp_lim = 1512, inner_att = 118, outer_att = 217, inner_def = 378, outer_def = 480, hit = 408, dodge = 78, crit_hurt = 54, crit_def = 54, move_speed = 240}
    };
get_attr(2, 49) ->
    {
        #base_attr{power = 26, anima = 152, energy = 126, concent = 149, method = 52},
        #bt_attr{hp_lim = 4605, mp_lim = 1542, inner_att = 120, outer_att = 221, inner_def = 385, outer_def = 489, hit = 416, dodge = 80, crit_hurt = 55, crit_def = 55, move_speed = 240}
    };
get_attr(2, 50) ->
    {
        #base_attr{power = 26, anima = 155, energy = 128, concent = 152, method = 53},
        #bt_attr{hp_lim = 4695, mp_lim = 1572, inner_att = 122, outer_att = 225, inner_def = 392, outer_def = 497, hit = 423, dodge = 81, crit_hurt = 56, crit_def = 56, move_speed = 240}
    };
get_attr(2, 51) ->
    {
        #base_attr{power = 27, anima = 158, energy = 131, concent = 155, method = 54},
        #bt_attr{hp_lim = 4785, mp_lim = 1602, inner_att = 124, outer_att = 229, inner_def = 399, outer_def = 506, hit = 431, dodge = 83, crit_hurt = 57, crit_def = 57, move_speed = 240}
    };
get_attr(2, 52) ->
    {
        #base_attr{power = 27, anima = 161, energy = 133, concent = 158, method = 55},
        #bt_attr{hp_lim = 4875, mp_lim = 1632, inner_att = 126, outer_att = 233, inner_def = 406, outer_def = 514, hit = 438, dodge = 84, crit_hurt = 58, crit_def = 58, move_speed = 240}
    };
get_attr(2, 53) ->
    {
        #base_attr{power = 28, anima = 164, energy = 136, concent = 161, method = 56},
        #bt_attr{hp_lim = 4965, mp_lim = 1662, inner_att = 128, outer_att = 237, inner_def = 413, outer_def = 523, hit = 446, dodge = 86, crit_hurt = 59, crit_def = 59, move_speed = 240}
    };
get_attr(2, 54) ->
    {
        #base_attr{power = 28, anima = 167, energy = 138, concent = 164, method = 57},
        #bt_attr{hp_lim = 5055, mp_lim = 1692, inner_att = 130, outer_att = 241, inner_def = 420, outer_def = 531, hit = 453, dodge = 87, crit_hurt = 60, crit_def = 60, move_speed = 240}
    };
get_attr(2, 55) ->
    {
        #base_attr{power = 29, anima = 170, energy = 141, concent = 167, method = 58},
        #bt_attr{hp_lim = 5145, mp_lim = 1722, inner_att = 132, outer_att = 245, inner_def = 427, outer_def = 540, hit = 461, dodge = 89, crit_hurt = 61, crit_def = 61, move_speed = 240}
    };
get_attr(2, 56) ->
    {
        #base_attr{power = 29, anima = 173, energy = 143, concent = 170, method = 59},
        #bt_attr{hp_lim = 5235, mp_lim = 1752, inner_att = 134, outer_att = 249, inner_def = 434, outer_def = 548, hit = 468, dodge = 90, crit_hurt = 62, crit_def = 62, move_speed = 240}
    };
get_attr(2, 57) ->
    {
        #base_attr{power = 30, anima = 176, energy = 146, concent = 173, method = 60},
        #bt_attr{hp_lim = 5325, mp_lim = 1782, inner_att = 136, outer_att = 253, inner_def = 441, outer_def = 557, hit = 476, dodge = 92, crit_hurt = 63, crit_def = 63, move_speed = 240}
    };
get_attr(2, 58) ->
    {
        #base_attr{power = 30, anima = 179, energy = 148, concent = 176, method = 61},
        #bt_attr{hp_lim = 5415, mp_lim = 1812, inner_att = 138, outer_att = 257, inner_def = 448, outer_def = 565, hit = 483, dodge = 93, crit_hurt = 64, crit_def = 64, move_speed = 240}
    };
get_attr(2, 59) ->
    {
        #base_attr{power = 31, anima = 182, energy = 151, concent = 179, method = 62},
        #bt_attr{hp_lim = 5505, mp_lim = 1842, inner_att = 140, outer_att = 261, inner_def = 455, outer_def = 574, hit = 491, dodge = 95, crit_hurt = 65, crit_def = 65, move_speed = 240}
    };
get_attr(2, 60) ->
    {
        #base_attr{power = 31, anima = 185, energy = 153, concent = 182, method = 63},
        #bt_attr{hp_lim = 5595, mp_lim = 1872, inner_att = 142, outer_att = 265, inner_def = 462, outer_def = 582, hit = 498, dodge = 96, crit_hurt = 66, crit_def = 66, move_speed = 240}
    };
get_attr(2, 61) ->
    {
        #base_attr{power = 32, anima = 188, energy = 156, concent = 185, method = 64},
        #bt_attr{hp_lim = 5685, mp_lim = 1902, inner_att = 144, outer_att = 269, inner_def = 469, outer_def = 591, hit = 506, dodge = 98, crit_hurt = 67, crit_def = 67, move_speed = 240}
    };
get_attr(2, 62) ->
    {
        #base_attr{power = 32, anima = 191, energy = 158, concent = 188, method = 65},
        #bt_attr{hp_lim = 5775, mp_lim = 1932, inner_att = 146, outer_att = 273, inner_def = 476, outer_def = 599, hit = 513, dodge = 99, crit_hurt = 68, crit_def = 68, move_speed = 240}
    };
get_attr(2, 63) ->
    {
        #base_attr{power = 33, anima = 194, energy = 161, concent = 191, method = 66},
        #bt_attr{hp_lim = 5865, mp_lim = 1962, inner_att = 148, outer_att = 277, inner_def = 483, outer_def = 608, hit = 521, dodge = 101, crit_hurt = 69, crit_def = 69, move_speed = 240}
    };
get_attr(2, 64) ->
    {
        #base_attr{power = 33, anima = 197, energy = 163, concent = 194, method = 67},
        #bt_attr{hp_lim = 5955, mp_lim = 1992, inner_att = 150, outer_att = 281, inner_def = 490, outer_def = 616, hit = 528, dodge = 102, crit_hurt = 70, crit_def = 70, move_speed = 240}
    };
get_attr(2, 65) ->
    {
        #base_attr{power = 34, anima = 200, energy = 166, concent = 197, method = 68},
        #bt_attr{hp_lim = 6045, mp_lim = 2022, inner_att = 152, outer_att = 285, inner_def = 497, outer_def = 625, hit = 536, dodge = 104, crit_hurt = 71, crit_def = 71, move_speed = 240}
    };
get_attr(2, 66) ->
    {
        #base_attr{power = 34, anima = 203, energy = 168, concent = 200, method = 69},
        #bt_attr{hp_lim = 6135, mp_lim = 2052, inner_att = 154, outer_att = 289, inner_def = 504, outer_def = 633, hit = 543, dodge = 105, crit_hurt = 72, crit_def = 72, move_speed = 240}
    };
get_attr(2, 67) ->
    {
        #base_attr{power = 35, anima = 206, energy = 171, concent = 203, method = 70},
        #bt_attr{hp_lim = 6225, mp_lim = 2082, inner_att = 156, outer_att = 293, inner_def = 511, outer_def = 642, hit = 551, dodge = 107, crit_hurt = 73, crit_def = 73, move_speed = 240}
    };
get_attr(2, 68) ->
    {
        #base_attr{power = 35, anima = 209, energy = 173, concent = 206, method = 71},
        #bt_attr{hp_lim = 6315, mp_lim = 2112, inner_att = 158, outer_att = 297, inner_def = 518, outer_def = 650, hit = 558, dodge = 108, crit_hurt = 74, crit_def = 74, move_speed = 240}
    };
get_attr(2, 69) ->
    {
        #base_attr{power = 36, anima = 212, energy = 176, concent = 209, method = 72},
        #bt_attr{hp_lim = 6405, mp_lim = 2142, inner_att = 160, outer_att = 301, inner_def = 525, outer_def = 659, hit = 566, dodge = 110, crit_hurt = 75, crit_def = 75, move_speed = 240}
    };
get_attr(2, 70) ->
    {
        #base_attr{power = 36, anima = 215, energy = 178, concent = 212, method = 73},
        #bt_attr{hp_lim = 6495, mp_lim = 2172, inner_att = 162, outer_att = 305, inner_def = 532, outer_def = 667, hit = 573, dodge = 111, crit_hurt = 76, crit_def = 76, move_speed = 240}
    };
get_attr(2, 71) ->
    {
        #base_attr{power = 37, anima = 218, energy = 181, concent = 215, method = 74},
        #bt_attr{hp_lim = 6585, mp_lim = 2202, inner_att = 164, outer_att = 309, inner_def = 539, outer_def = 676, hit = 581, dodge = 113, crit_hurt = 77, crit_def = 77, move_speed = 240}
    };
get_attr(2, 72) ->
    {
        #base_attr{power = 37, anima = 221, energy = 183, concent = 218, method = 75},
        #bt_attr{hp_lim = 6675, mp_lim = 2232, inner_att = 166, outer_att = 313, inner_def = 546, outer_def = 684, hit = 588, dodge = 114, crit_hurt = 78, crit_def = 78, move_speed = 240}
    };
get_attr(2, 73) ->
    {
        #base_attr{power = 38, anima = 224, energy = 186, concent = 221, method = 76},
        #bt_attr{hp_lim = 6765, mp_lim = 2262, inner_att = 168, outer_att = 317, inner_def = 553, outer_def = 693, hit = 596, dodge = 116, crit_hurt = 79, crit_def = 79, move_speed = 240}
    };
get_attr(2, 74) ->
    {
        #base_attr{power = 38, anima = 227, energy = 188, concent = 224, method = 77},
        #bt_attr{hp_lim = 6855, mp_lim = 2292, inner_att = 170, outer_att = 321, inner_def = 560, outer_def = 701, hit = 603, dodge = 117, crit_hurt = 80, crit_def = 80, move_speed = 240}
    };
get_attr(2, 75) ->
    {
        #base_attr{power = 39, anima = 230, energy = 191, concent = 227, method = 78},
        #bt_attr{hp_lim = 6945, mp_lim = 2322, inner_att = 172, outer_att = 325, inner_def = 567, outer_def = 710, hit = 611, dodge = 119, crit_hurt = 81, crit_def = 81, move_speed = 240}
    };
get_attr(2, 76) ->
    {
        #base_attr{power = 39, anima = 233, energy = 193, concent = 230, method = 79},
        #bt_attr{hp_lim = 7035, mp_lim = 2352, inner_att = 174, outer_att = 329, inner_def = 574, outer_def = 718, hit = 618, dodge = 120, crit_hurt = 82, crit_def = 82, move_speed = 240}
    };
get_attr(2, 77) ->
    {
        #base_attr{power = 40, anima = 236, energy = 196, concent = 233, method = 80},
        #bt_attr{hp_lim = 7125, mp_lim = 2382, inner_att = 176, outer_att = 333, inner_def = 581, outer_def = 727, hit = 626, dodge = 122, crit_hurt = 83, crit_def = 83, move_speed = 240}
    };
get_attr(2, 78) ->
    {
        #base_attr{power = 40, anima = 239, energy = 198, concent = 236, method = 81},
        #bt_attr{hp_lim = 7215, mp_lim = 2412, inner_att = 178, outer_att = 337, inner_def = 588, outer_def = 735, hit = 633, dodge = 123, crit_hurt = 84, crit_def = 84, move_speed = 240}
    };
get_attr(2, 79) ->
    {
        #base_attr{power = 41, anima = 242, energy = 201, concent = 239, method = 82},
        #bt_attr{hp_lim = 7305, mp_lim = 2442, inner_att = 180, outer_att = 341, inner_def = 595, outer_def = 744, hit = 641, dodge = 125, crit_hurt = 85, crit_def = 85, move_speed = 240}
    };
get_attr(2, 80) ->
    {
        #base_attr{power = 41, anima = 245, energy = 203, concent = 242, method = 83},
        #bt_attr{hp_lim = 7395, mp_lim = 2472, inner_att = 182, outer_att = 345, inner_def = 602, outer_def = 752, hit = 648, dodge = 126, crit_hurt = 86, crit_def = 86, move_speed = 240}
    };
get_attr(2, 81) ->
    {
        #base_attr{power = 42, anima = 248, energy = 206, concent = 245, method = 84},
        #bt_attr{hp_lim = 7485, mp_lim = 2502, inner_att = 184, outer_att = 349, inner_def = 609, outer_def = 761, hit = 656, dodge = 128, crit_hurt = 87, crit_def = 87, move_speed = 240}
    };
get_attr(2, 82) ->
    {
        #base_attr{power = 42, anima = 251, energy = 208, concent = 248, method = 85},
        #bt_attr{hp_lim = 7575, mp_lim = 2532, inner_att = 186, outer_att = 353, inner_def = 616, outer_def = 769, hit = 663, dodge = 129, crit_hurt = 88, crit_def = 88, move_speed = 240}
    };
get_attr(2, 83) ->
    {
        #base_attr{power = 43, anima = 254, energy = 211, concent = 251, method = 86},
        #bt_attr{hp_lim = 7665, mp_lim = 2562, inner_att = 188, outer_att = 357, inner_def = 623, outer_def = 778, hit = 671, dodge = 131, crit_hurt = 89, crit_def = 89, move_speed = 240}
    };
get_attr(2, 84) ->
    {
        #base_attr{power = 43, anima = 257, energy = 213, concent = 254, method = 87},
        #bt_attr{hp_lim = 7755, mp_lim = 2592, inner_att = 190, outer_att = 361, inner_def = 630, outer_def = 786, hit = 678, dodge = 132, crit_hurt = 90, crit_def = 90, move_speed = 240}
    };
get_attr(2, 85) ->
    {
        #base_attr{power = 44, anima = 260, energy = 216, concent = 257, method = 88},
        #bt_attr{hp_lim = 7845, mp_lim = 2622, inner_att = 192, outer_att = 365, inner_def = 637, outer_def = 795, hit = 686, dodge = 134, crit_hurt = 91, crit_def = 91, move_speed = 240}
    };
get_attr(2, 86) ->
    {
        #base_attr{power = 44, anima = 263, energy = 218, concent = 260, method = 89},
        #bt_attr{hp_lim = 7935, mp_lim = 2652, inner_att = 194, outer_att = 369, inner_def = 644, outer_def = 803, hit = 693, dodge = 135, crit_hurt = 92, crit_def = 92, move_speed = 240}
    };
get_attr(2, 87) ->
    {
        #base_attr{power = 45, anima = 266, energy = 221, concent = 263, method = 90},
        #bt_attr{hp_lim = 8025, mp_lim = 2682, inner_att = 196, outer_att = 373, inner_def = 651, outer_def = 812, hit = 701, dodge = 137, crit_hurt = 93, crit_def = 93, move_speed = 240}
    };
get_attr(2, 88) ->
    {
        #base_attr{power = 45, anima = 269, energy = 223, concent = 266, method = 91},
        #bt_attr{hp_lim = 8115, mp_lim = 2712, inner_att = 198, outer_att = 377, inner_def = 658, outer_def = 820, hit = 708, dodge = 138, crit_hurt = 94, crit_def = 94, move_speed = 240}
    };
get_attr(2, 89) ->
    {
        #base_attr{power = 46, anima = 272, energy = 226, concent = 269, method = 92},
        #bt_attr{hp_lim = 8205, mp_lim = 2742, inner_att = 200, outer_att = 381, inner_def = 665, outer_def = 829, hit = 716, dodge = 140, crit_hurt = 95, crit_def = 95, move_speed = 240}
    };
get_attr(2, 90) ->
    {
        #base_attr{power = 46, anima = 275, energy = 228, concent = 272, method = 93},
        #bt_attr{hp_lim = 8295, mp_lim = 2772, inner_att = 202, outer_att = 385, inner_def = 672, outer_def = 837, hit = 723, dodge = 141, crit_hurt = 96, crit_def = 96, move_speed = 240}
    };
get_attr(2, 91) ->
    {
        #base_attr{power = 47, anima = 278, energy = 231, concent = 275, method = 94},
        #bt_attr{hp_lim = 8385, mp_lim = 2802, inner_att = 204, outer_att = 389, inner_def = 679, outer_def = 846, hit = 731, dodge = 143, crit_hurt = 97, crit_def = 97, move_speed = 240}
    };
get_attr(2, 92) ->
    {
        #base_attr{power = 47, anima = 281, energy = 233, concent = 278, method = 95},
        #bt_attr{hp_lim = 8475, mp_lim = 2832, inner_att = 206, outer_att = 393, inner_def = 686, outer_def = 854, hit = 738, dodge = 144, crit_hurt = 98, crit_def = 98, move_speed = 240}
    };
get_attr(2, 93) ->
    {
        #base_attr{power = 48, anima = 284, energy = 236, concent = 281, method = 96},
        #bt_attr{hp_lim = 8565, mp_lim = 2862, inner_att = 208, outer_att = 397, inner_def = 693, outer_def = 863, hit = 746, dodge = 146, crit_hurt = 99, crit_def = 99, move_speed = 240}
    };
get_attr(2, 94) ->
    {
        #base_attr{power = 48, anima = 287, energy = 238, concent = 284, method = 97},
        #bt_attr{hp_lim = 8655, mp_lim = 2892, inner_att = 210, outer_att = 401, inner_def = 700, outer_def = 871, hit = 753, dodge = 147, crit_hurt = 100, crit_def = 100, move_speed = 240}
    };
get_attr(2, 95) ->
    {
        #base_attr{power = 49, anima = 290, energy = 241, concent = 287, method = 98},
        #bt_attr{hp_lim = 8745, mp_lim = 2922, inner_att = 212, outer_att = 405, inner_def = 707, outer_def = 880, hit = 761, dodge = 149, crit_hurt = 101, crit_def = 101, move_speed = 240}
    };
get_attr(2, 96) ->
    {
        #base_attr{power = 49, anima = 293, energy = 243, concent = 290, method = 99},
        #bt_attr{hp_lim = 8835, mp_lim = 2952, inner_att = 214, outer_att = 409, inner_def = 714, outer_def = 888, hit = 768, dodge = 150, crit_hurt = 102, crit_def = 102, move_speed = 240}
    };
get_attr(2, 97) ->
    {
        #base_attr{power = 50, anima = 296, energy = 246, concent = 293, method = 100},
        #bt_attr{hp_lim = 8925, mp_lim = 2982, inner_att = 216, outer_att = 413, inner_def = 721, outer_def = 897, hit = 776, dodge = 152, crit_hurt = 103, crit_def = 103, move_speed = 240}
    };
get_attr(2, 98) ->
    {
        #base_attr{power = 50, anima = 299, energy = 248, concent = 296, method = 101},
        #bt_attr{hp_lim = 9015, mp_lim = 3012, inner_att = 218, outer_att = 417, inner_def = 728, outer_def = 905, hit = 783, dodge = 153, crit_hurt = 104, crit_def = 104, move_speed = 240}
    };
get_attr(2, 99) ->
    {
        #base_attr{power = 51, anima = 302, energy = 251, concent = 299, method = 102},
        #bt_attr{hp_lim = 9105, mp_lim = 3042, inner_att = 220, outer_att = 421, inner_def = 735, outer_def = 914, hit = 791, dodge = 155, crit_hurt = 105, crit_def = 105, move_speed = 240}
    };
get_attr(2, 100) ->
    {
        #base_attr{power = 51, anima = 305, energy = 253, concent = 302, method = 103},
        #bt_attr{hp_lim = 9195, mp_lim = 3072, inner_att = 222, outer_att = 425, inner_def = 742, outer_def = 922, hit = 798, dodge = 156, crit_hurt = 106, crit_def = 106, move_speed = 240}
    };
get_attr(2, 101) ->
    {
        #base_attr{power = 52, anima = 308, energy = 256, concent = 305, method = 104},
        #bt_attr{hp_lim = 9285, mp_lim = 3102, inner_att = 224, outer_att = 429, inner_def = 749, outer_def = 931, hit = 806, dodge = 158, crit_hurt = 107, crit_def = 107, move_speed = 240}
    };
get_attr(2, 102) ->
    {
        #base_attr{power = 52, anima = 311, energy = 258, concent = 308, method = 105},
        #bt_attr{hp_lim = 9375, mp_lim = 3132, inner_att = 226, outer_att = 433, inner_def = 756, outer_def = 939, hit = 813, dodge = 159, crit_hurt = 108, crit_def = 108, move_speed = 240}
    };
get_attr(2, 103) ->
    {
        #base_attr{power = 53, anima = 314, energy = 261, concent = 311, method = 106},
        #bt_attr{hp_lim = 9465, mp_lim = 3162, inner_att = 228, outer_att = 437, inner_def = 763, outer_def = 948, hit = 821, dodge = 161, crit_hurt = 109, crit_def = 109, move_speed = 240}
    };
get_attr(2, 104) ->
    {
        #base_attr{power = 53, anima = 317, energy = 263, concent = 314, method = 107},
        #bt_attr{hp_lim = 9555, mp_lim = 3192, inner_att = 230, outer_att = 441, inner_def = 770, outer_def = 956, hit = 828, dodge = 162, crit_hurt = 110, crit_def = 110, move_speed = 240}
    };
get_attr(2, 105) ->
    {
        #base_attr{power = 54, anima = 320, energy = 266, concent = 317, method = 108},
        #bt_attr{hp_lim = 9645, mp_lim = 3222, inner_att = 232, outer_att = 445, inner_def = 777, outer_def = 965, hit = 836, dodge = 164, crit_hurt = 111, crit_def = 111, move_speed = 240}
    };
get_attr(2, 106) ->
    {
        #base_attr{power = 54, anima = 323, energy = 268, concent = 320, method = 109},
        #bt_attr{hp_lim = 9735, mp_lim = 3252, inner_att = 234, outer_att = 449, inner_def = 784, outer_def = 973, hit = 843, dodge = 165, crit_hurt = 112, crit_def = 112, move_speed = 240}
    };
get_attr(2, 107) ->
    {
        #base_attr{power = 55, anima = 326, energy = 271, concent = 323, method = 110},
        #bt_attr{hp_lim = 9825, mp_lim = 3282, inner_att = 236, outer_att = 453, inner_def = 791, outer_def = 982, hit = 851, dodge = 167, crit_hurt = 113, crit_def = 113, move_speed = 240}
    };
get_attr(2, 108) ->
    {
        #base_attr{power = 55, anima = 329, energy = 273, concent = 326, method = 111},
        #bt_attr{hp_lim = 9915, mp_lim = 3312, inner_att = 238, outer_att = 457, inner_def = 798, outer_def = 990, hit = 858, dodge = 168, crit_hurt = 114, crit_def = 114, move_speed = 240}
    };
get_attr(2, 109) ->
    {
        #base_attr{power = 56, anima = 332, energy = 276, concent = 329, method = 112},
        #bt_attr{hp_lim = 10005, mp_lim = 3342, inner_att = 240, outer_att = 461, inner_def = 805, outer_def = 999, hit = 866, dodge = 170, crit_hurt = 115, crit_def = 115, move_speed = 240}
    };
get_attr(2, 110) ->
    {
        #base_attr{power = 56, anima = 335, energy = 278, concent = 332, method = 113},
        #bt_attr{hp_lim = 10095, mp_lim = 3372, inner_att = 242, outer_att = 465, inner_def = 812, outer_def = 1007, hit = 873, dodge = 171, crit_hurt = 116, crit_def = 116, move_speed = 240}
    };
get_attr(2, 111) ->
    {
        #base_attr{power = 57, anima = 338, energy = 281, concent = 335, method = 114},
        #bt_attr{hp_lim = 10185, mp_lim = 3402, inner_att = 244, outer_att = 469, inner_def = 819, outer_def = 1016, hit = 881, dodge = 173, crit_hurt = 117, crit_def = 117, move_speed = 240}
    };
get_attr(2, 112) ->
    {
        #base_attr{power = 57, anima = 341, energy = 283, concent = 338, method = 115},
        #bt_attr{hp_lim = 10275, mp_lim = 3432, inner_att = 246, outer_att = 473, inner_def = 826, outer_def = 1024, hit = 888, dodge = 174, crit_hurt = 118, crit_def = 118, move_speed = 240}
    };
get_attr(2, 113) ->
    {
        #base_attr{power = 58, anima = 344, energy = 286, concent = 341, method = 116},
        #bt_attr{hp_lim = 10365, mp_lim = 3462, inner_att = 248, outer_att = 477, inner_def = 833, outer_def = 1033, hit = 896, dodge = 176, crit_hurt = 119, crit_def = 119, move_speed = 240}
    };
get_attr(2, 114) ->
    {
        #base_attr{power = 58, anima = 347, energy = 288, concent = 344, method = 117},
        #bt_attr{hp_lim = 10455, mp_lim = 3492, inner_att = 250, outer_att = 481, inner_def = 840, outer_def = 1041, hit = 903, dodge = 177, crit_hurt = 120, crit_def = 120, move_speed = 240}
    };
get_attr(2, 115) ->
    {
        #base_attr{power = 59, anima = 350, energy = 291, concent = 347, method = 118},
        #bt_attr{hp_lim = 10545, mp_lim = 3522, inner_att = 252, outer_att = 485, inner_def = 847, outer_def = 1050, hit = 911, dodge = 179, crit_hurt = 121, crit_def = 121, move_speed = 240}
    };
get_attr(2, 116) ->
    {
        #base_attr{power = 59, anima = 353, energy = 293, concent = 350, method = 119},
        #bt_attr{hp_lim = 10635, mp_lim = 3552, inner_att = 254, outer_att = 489, inner_def = 854, outer_def = 1058, hit = 918, dodge = 180, crit_hurt = 122, crit_def = 122, move_speed = 240}
    };
get_attr(2, 117) ->
    {
        #base_attr{power = 60, anima = 356, energy = 296, concent = 353, method = 120},
        #bt_attr{hp_lim = 10725, mp_lim = 3582, inner_att = 256, outer_att = 493, inner_def = 861, outer_def = 1067, hit = 926, dodge = 182, crit_hurt = 123, crit_def = 123, move_speed = 240}
    };
get_attr(2, 118) ->
    {
        #base_attr{power = 60, anima = 359, energy = 298, concent = 356, method = 121},
        #bt_attr{hp_lim = 10815, mp_lim = 3612, inner_att = 258, outer_att = 497, inner_def = 868, outer_def = 1075, hit = 933, dodge = 183, crit_hurt = 124, crit_def = 124, move_speed = 240}
    };
get_attr(2, 119) ->
    {
        #base_attr{power = 61, anima = 362, energy = 301, concent = 359, method = 122},
        #bt_attr{hp_lim = 10905, mp_lim = 3642, inner_att = 260, outer_att = 501, inner_def = 875, outer_def = 1084, hit = 941, dodge = 185, crit_hurt = 125, crit_def = 125, move_speed = 240}
    };
get_attr(2, 120) ->
    {
        #base_attr{power = 61, anima = 365, energy = 303, concent = 362, method = 123},
        #bt_attr{hp_lim = 10995, mp_lim = 3672, inner_att = 262, outer_att = 505, inner_def = 882, outer_def = 1092, hit = 948, dodge = 186, crit_hurt = 126, crit_def = 126, move_speed = 240}
    };
get_attr(2, 121) ->
    {
        #base_attr{power = 62, anima = 368, energy = 306, concent = 365, method = 124},
        #bt_attr{hp_lim = 11085, mp_lim = 3702, inner_att = 264, outer_att = 509, inner_def = 889, outer_def = 1101, hit = 956, dodge = 188, crit_hurt = 127, crit_def = 127, move_speed = 240}
    };
get_attr(2, 122) ->
    {
        #base_attr{power = 62, anima = 371, energy = 308, concent = 368, method = 125},
        #bt_attr{hp_lim = 11175, mp_lim = 3732, inner_att = 266, outer_att = 513, inner_def = 896, outer_def = 1109, hit = 963, dodge = 189, crit_hurt = 128, crit_def = 128, move_speed = 240}
    };
get_attr(2, 123) ->
    {
        #base_attr{power = 63, anima = 374, energy = 311, concent = 371, method = 126},
        #bt_attr{hp_lim = 11265, mp_lim = 3762, inner_att = 268, outer_att = 517, inner_def = 903, outer_def = 1118, hit = 971, dodge = 191, crit_hurt = 129, crit_def = 129, move_speed = 240}
    };
get_attr(2, 124) ->
    {
        #base_attr{power = 63, anima = 377, energy = 313, concent = 374, method = 127},
        #bt_attr{hp_lim = 11355, mp_lim = 3792, inner_att = 270, outer_att = 521, inner_def = 910, outer_def = 1126, hit = 978, dodge = 192, crit_hurt = 130, crit_def = 130, move_speed = 240}
    };
get_attr(2, 125) ->
    {
        #base_attr{power = 64, anima = 380, energy = 316, concent = 377, method = 128},
        #bt_attr{hp_lim = 11445, mp_lim = 3822, inner_att = 272, outer_att = 525, inner_def = 917, outer_def = 1135, hit = 986, dodge = 194, crit_hurt = 131, crit_def = 131, move_speed = 240}
    };
get_attr(2, 126) ->
    {
        #base_attr{power = 64, anima = 383, energy = 318, concent = 380, method = 129},
        #bt_attr{hp_lim = 11535, mp_lim = 3852, inner_att = 274, outer_att = 529, inner_def = 924, outer_def = 1143, hit = 993, dodge = 195, crit_hurt = 132, crit_def = 132, move_speed = 240}
    };
get_attr(2, 127) ->
    {
        #base_attr{power = 65, anima = 386, energy = 321, concent = 383, method = 130},
        #bt_attr{hp_lim = 11625, mp_lim = 3882, inner_att = 276, outer_att = 533, inner_def = 931, outer_def = 1152, hit = 1001, dodge = 197, crit_hurt = 133, crit_def = 133, move_speed = 240}
    };
get_attr(2, 128) ->
    {
        #base_attr{power = 65, anima = 389, energy = 323, concent = 386, method = 131},
        #bt_attr{hp_lim = 11715, mp_lim = 3912, inner_att = 278, outer_att = 537, inner_def = 938, outer_def = 1160, hit = 1008, dodge = 198, crit_hurt = 134, crit_def = 134, move_speed = 240}
    };
get_attr(2, 129) ->
    {
        #base_attr{power = 66, anima = 392, energy = 326, concent = 389, method = 132},
        #bt_attr{hp_lim = 11805, mp_lim = 3942, inner_att = 280, outer_att = 541, inner_def = 945, outer_def = 1169, hit = 1016, dodge = 200, crit_hurt = 135, crit_def = 135, move_speed = 240}
    };
get_attr(2, 130) ->
    {
        #base_attr{power = 66, anima = 395, energy = 328, concent = 392, method = 133},
        #bt_attr{hp_lim = 11895, mp_lim = 3972, inner_att = 282, outer_att = 545, inner_def = 952, outer_def = 1177, hit = 1023, dodge = 201, crit_hurt = 136, crit_def = 136, move_speed = 240}
    };
get_attr(2, 131) ->
    {
        #base_attr{power = 67, anima = 398, energy = 331, concent = 395, method = 134},
        #bt_attr{hp_lim = 11985, mp_lim = 4002, inner_att = 284, outer_att = 549, inner_def = 959, outer_def = 1186, hit = 1031, dodge = 203, crit_hurt = 137, crit_def = 137, move_speed = 240}
    };
get_attr(2, 132) ->
    {
        #base_attr{power = 67, anima = 401, energy = 333, concent = 398, method = 135},
        #bt_attr{hp_lim = 12075, mp_lim = 4032, inner_att = 286, outer_att = 553, inner_def = 966, outer_def = 1194, hit = 1038, dodge = 204, crit_hurt = 138, crit_def = 138, move_speed = 240}
    };
get_attr(2, 133) ->
    {
        #base_attr{power = 68, anima = 404, energy = 336, concent = 401, method = 136},
        #bt_attr{hp_lim = 12165, mp_lim = 4062, inner_att = 288, outer_att = 557, inner_def = 973, outer_def = 1203, hit = 1046, dodge = 206, crit_hurt = 139, crit_def = 139, move_speed = 240}
    };
get_attr(2, 134) ->
    {
        #base_attr{power = 68, anima = 407, energy = 338, concent = 404, method = 137},
        #bt_attr{hp_lim = 12255, mp_lim = 4092, inner_att = 290, outer_att = 561, inner_def = 980, outer_def = 1211, hit = 1053, dodge = 207, crit_hurt = 140, crit_def = 140, move_speed = 240}
    };
get_attr(2, 135) ->
    {
        #base_attr{power = 69, anima = 410, energy = 341, concent = 407, method = 138},
        #bt_attr{hp_lim = 12345, mp_lim = 4122, inner_att = 292, outer_att = 565, inner_def = 987, outer_def = 1220, hit = 1061, dodge = 209, crit_hurt = 141, crit_def = 141, move_speed = 240}
    };
get_attr(2, 136) ->
    {
        #base_attr{power = 69, anima = 413, energy = 343, concent = 410, method = 139},
        #bt_attr{hp_lim = 12435, mp_lim = 4152, inner_att = 294, outer_att = 569, inner_def = 994, outer_def = 1228, hit = 1068, dodge = 210, crit_hurt = 142, crit_def = 142, move_speed = 240}
    };
get_attr(2, 137) ->
    {
        #base_attr{power = 70, anima = 416, energy = 346, concent = 413, method = 140},
        #bt_attr{hp_lim = 12525, mp_lim = 4182, inner_att = 296, outer_att = 573, inner_def = 1001, outer_def = 1237, hit = 1076, dodge = 212, crit_hurt = 143, crit_def = 143, move_speed = 240}
    };
get_attr(2, 138) ->
    {
        #base_attr{power = 70, anima = 419, energy = 348, concent = 416, method = 141},
        #bt_attr{hp_lim = 12615, mp_lim = 4212, inner_att = 298, outer_att = 577, inner_def = 1008, outer_def = 1245, hit = 1083, dodge = 213, crit_hurt = 144, crit_def = 144, move_speed = 240}
    };
get_attr(2, 139) ->
    {
        #base_attr{power = 71, anima = 422, energy = 351, concent = 419, method = 142},
        #bt_attr{hp_lim = 12705, mp_lim = 4242, inner_att = 300, outer_att = 581, inner_def = 1015, outer_def = 1254, hit = 1091, dodge = 215, crit_hurt = 145, crit_def = 145, move_speed = 240}
    };
get_attr(2, 140) ->
    {
        #base_attr{power = 71, anima = 425, energy = 353, concent = 422, method = 143},
        #bt_attr{hp_lim = 12795, mp_lim = 4272, inner_att = 302, outer_att = 585, inner_def = 1022, outer_def = 1262, hit = 1098, dodge = 216, crit_hurt = 146, crit_def = 146, move_speed = 240}
    };
get_attr(2, 141) ->
    {
        #base_attr{power = 72, anima = 428, energy = 356, concent = 425, method = 144},
        #bt_attr{hp_lim = 12885, mp_lim = 4302, inner_att = 304, outer_att = 589, inner_def = 1029, outer_def = 1271, hit = 1106, dodge = 218, crit_hurt = 147, crit_def = 147, move_speed = 240}
    };
get_attr(2, 142) ->
    {
        #base_attr{power = 72, anima = 431, energy = 358, concent = 428, method = 145},
        #bt_attr{hp_lim = 12975, mp_lim = 4332, inner_att = 306, outer_att = 593, inner_def = 1036, outer_def = 1279, hit = 1113, dodge = 219, crit_hurt = 148, crit_def = 148, move_speed = 240}
    };
get_attr(2, 143) ->
    {
        #base_attr{power = 73, anima = 434, energy = 361, concent = 431, method = 146},
        #bt_attr{hp_lim = 13065, mp_lim = 4362, inner_att = 308, outer_att = 597, inner_def = 1043, outer_def = 1288, hit = 1121, dodge = 221, crit_hurt = 149, crit_def = 149, move_speed = 240}
    };
get_attr(2, 144) ->
    {
        #base_attr{power = 73, anima = 437, energy = 363, concent = 434, method = 147},
        #bt_attr{hp_lim = 13155, mp_lim = 4392, inner_att = 310, outer_att = 601, inner_def = 1050, outer_def = 1296, hit = 1128, dodge = 222, crit_hurt = 150, crit_def = 150, move_speed = 240}
    };
get_attr(2, 145) ->
    {
        #base_attr{power = 74, anima = 440, energy = 366, concent = 437, method = 148},
        #bt_attr{hp_lim = 13245, mp_lim = 4422, inner_att = 312, outer_att = 605, inner_def = 1057, outer_def = 1305, hit = 1136, dodge = 224, crit_hurt = 151, crit_def = 151, move_speed = 240}
    };
get_attr(2, 146) ->
    {
        #base_attr{power = 74, anima = 443, energy = 368, concent = 440, method = 149},
        #bt_attr{hp_lim = 13335, mp_lim = 4452, inner_att = 314, outer_att = 609, inner_def = 1064, outer_def = 1313, hit = 1143, dodge = 225, crit_hurt = 152, crit_def = 152, move_speed = 240}
    };
get_attr(2, 147) ->
    {
        #base_attr{power = 75, anima = 446, energy = 371, concent = 443, method = 150},
        #bt_attr{hp_lim = 13425, mp_lim = 4482, inner_att = 316, outer_att = 613, inner_def = 1071, outer_def = 1322, hit = 1151, dodge = 227, crit_hurt = 153, crit_def = 153, move_speed = 240}
    };
get_attr(2, 148) ->
    {
        #base_attr{power = 75, anima = 449, energy = 373, concent = 446, method = 151},
        #bt_attr{hp_lim = 13515, mp_lim = 4512, inner_att = 318, outer_att = 617, inner_def = 1078, outer_def = 1330, hit = 1158, dodge = 228, crit_hurt = 154, crit_def = 154, move_speed = 240}
    };
get_attr(2, 149) ->
    {
        #base_attr{power = 76, anima = 452, energy = 376, concent = 449, method = 152},
        #bt_attr{hp_lim = 13605, mp_lim = 4542, inner_att = 320, outer_att = 621, inner_def = 1085, outer_def = 1339, hit = 1166, dodge = 230, crit_hurt = 155, crit_def = 155, move_speed = 240}
    };
get_attr(2, 150) ->
    {
        #base_attr{power = 76, anima = 455, energy = 378, concent = 452, method = 153},
        #bt_attr{hp_lim = 13695, mp_lim = 4572, inner_att = 322, outer_att = 625, inner_def = 1092, outer_def = 1347, hit = 1173, dodge = 231, crit_hurt = 156, crit_def = 156, move_speed = 240}
    };
get_attr(3, 1) ->
    {
        #base_attr{power = 1, anima = 8, energy = 5, concent = 6, method = 2},
        #bt_attr{hp_lim = 285, mp_lim = 119, inner_att = 23, outer_att = 24, inner_def = 52, outer_def = 82, hit = 53, dodge = 8, crit_hurt = 8, crit_def = 8, move_speed = 240}
    };
get_attr(3, 2) ->
    {
        #base_attr{power = 1, anima = 11, energy = 7, concent = 9, method = 3},
        #bt_attr{hp_lim = 370, mp_lim = 155, inner_att = 26, outer_att = 27, inner_def = 59, outer_def = 91, hit = 61, dodge = 9, crit_hurt = 9, crit_def = 9, move_speed = 240}
    };
get_attr(3, 3) ->
    {
        #base_attr{power = 2, anima = 14, energy = 9, concent = 12, method = 4},
        #bt_attr{hp_lim = 455, mp_lim = 191, inner_att = 29, outer_att = 30, inner_def = 67, outer_def = 100, hit = 69, dodge = 11, crit_hurt = 10, crit_def = 10, move_speed = 240}
    };
get_attr(3, 4) ->
    {
        #base_attr{power = 2, anima = 17, energy = 11, concent = 15, method = 5},
        #bt_attr{hp_lim = 540, mp_lim = 227, inner_att = 32, outer_att = 33, inner_def = 74, outer_def = 109, hit = 77, dodge = 12, crit_hurt = 11, crit_def = 11, move_speed = 240}
    };
get_attr(3, 5) ->
    {
        #base_attr{power = 3, anima = 20, energy = 13, concent = 18, method = 6},
        #bt_attr{hp_lim = 625, mp_lim = 263, inner_att = 35, outer_att = 36, inner_def = 82, outer_def = 118, hit = 85, dodge = 14, crit_hurt = 12, crit_def = 12, move_speed = 240}
    };
get_attr(3, 6) ->
    {
        #base_attr{power = 3, anima = 23, energy = 15, concent = 21, method = 7},
        #bt_attr{hp_lim = 710, mp_lim = 299, inner_att = 38, outer_att = 39, inner_def = 89, outer_def = 127, hit = 93, dodge = 15, crit_hurt = 13, crit_def = 13, move_speed = 240}
    };
get_attr(3, 7) ->
    {
        #base_attr{power = 4, anima = 26, energy = 17, concent = 24, method = 8},
        #bt_attr{hp_lim = 795, mp_lim = 335, inner_att = 41, outer_att = 42, inner_def = 97, outer_def = 136, hit = 101, dodge = 17, crit_hurt = 14, crit_def = 14, move_speed = 240}
    };
get_attr(3, 8) ->
    {
        #base_attr{power = 4, anima = 29, energy = 19, concent = 27, method = 9},
        #bt_attr{hp_lim = 880, mp_lim = 371, inner_att = 44, outer_att = 45, inner_def = 104, outer_def = 145, hit = 109, dodge = 18, crit_hurt = 15, crit_def = 15, move_speed = 240}
    };
get_attr(3, 9) ->
    {
        #base_attr{power = 5, anima = 32, energy = 21, concent = 30, method = 10},
        #bt_attr{hp_lim = 965, mp_lim = 407, inner_att = 47, outer_att = 48, inner_def = 112, outer_def = 154, hit = 117, dodge = 20, crit_hurt = 16, crit_def = 16, move_speed = 240}
    };
get_attr(3, 10) ->
    {
        #base_attr{power = 5, anima = 35, energy = 23, concent = 33, method = 11},
        #bt_attr{hp_lim = 1050, mp_lim = 443, inner_att = 50, outer_att = 51, inner_def = 119, outer_def = 163, hit = 125, dodge = 21, crit_hurt = 17, crit_def = 17, move_speed = 240}
    };
get_attr(3, 11) ->
    {
        #base_attr{power = 6, anima = 38, energy = 25, concent = 36, method = 12},
        #bt_attr{hp_lim = 1135, mp_lim = 479, inner_att = 53, outer_att = 54, inner_def = 127, outer_def = 172, hit = 133, dodge = 23, crit_hurt = 18, crit_def = 18, move_speed = 240}
    };
get_attr(3, 12) ->
    {
        #base_attr{power = 6, anima = 41, energy = 27, concent = 39, method = 13},
        #bt_attr{hp_lim = 1220, mp_lim = 515, inner_att = 56, outer_att = 57, inner_def = 134, outer_def = 181, hit = 141, dodge = 24, crit_hurt = 19, crit_def = 19, move_speed = 240}
    };
get_attr(3, 13) ->
    {
        #base_attr{power = 7, anima = 44, energy = 29, concent = 42, method = 14},
        #bt_attr{hp_lim = 1305, mp_lim = 551, inner_att = 59, outer_att = 60, inner_def = 142, outer_def = 190, hit = 149, dodge = 26, crit_hurt = 20, crit_def = 20, move_speed = 240}
    };
get_attr(3, 14) ->
    {
        #base_attr{power = 7, anima = 47, energy = 31, concent = 45, method = 15},
        #bt_attr{hp_lim = 1390, mp_lim = 587, inner_att = 62, outer_att = 63, inner_def = 149, outer_def = 199, hit = 157, dodge = 27, crit_hurt = 21, crit_def = 21, move_speed = 240}
    };
get_attr(3, 15) ->
    {
        #base_attr{power = 8, anima = 50, energy = 33, concent = 48, method = 16},
        #bt_attr{hp_lim = 1475, mp_lim = 623, inner_att = 65, outer_att = 66, inner_def = 157, outer_def = 208, hit = 165, dodge = 29, crit_hurt = 22, crit_def = 22, move_speed = 240}
    };
get_attr(3, 16) ->
    {
        #base_attr{power = 8, anima = 53, energy = 35, concent = 51, method = 17},
        #bt_attr{hp_lim = 1560, mp_lim = 659, inner_att = 68, outer_att = 69, inner_def = 164, outer_def = 217, hit = 173, dodge = 30, crit_hurt = 23, crit_def = 23, move_speed = 240}
    };
get_attr(3, 17) ->
    {
        #base_attr{power = 9, anima = 56, energy = 37, concent = 54, method = 18},
        #bt_attr{hp_lim = 1645, mp_lim = 695, inner_att = 71, outer_att = 72, inner_def = 172, outer_def = 226, hit = 181, dodge = 32, crit_hurt = 24, crit_def = 24, move_speed = 240}
    };
get_attr(3, 18) ->
    {
        #base_attr{power = 9, anima = 59, energy = 39, concent = 57, method = 19},
        #bt_attr{hp_lim = 1730, mp_lim = 731, inner_att = 74, outer_att = 75, inner_def = 179, outer_def = 235, hit = 189, dodge = 33, crit_hurt = 25, crit_def = 25, move_speed = 240}
    };
get_attr(3, 19) ->
    {
        #base_attr{power = 10, anima = 62, energy = 41, concent = 60, method = 20},
        #bt_attr{hp_lim = 1815, mp_lim = 767, inner_att = 77, outer_att = 78, inner_def = 187, outer_def = 244, hit = 197, dodge = 35, crit_hurt = 26, crit_def = 26, move_speed = 240}
    };
get_attr(3, 20) ->
    {
        #base_attr{power = 10, anima = 65, energy = 43, concent = 63, method = 21},
        #bt_attr{hp_lim = 1900, mp_lim = 803, inner_att = 80, outer_att = 81, inner_def = 194, outer_def = 253, hit = 205, dodge = 36, crit_hurt = 27, crit_def = 27, move_speed = 240}
    };
get_attr(3, 21) ->
    {
        #base_attr{power = 11, anima = 68, energy = 45, concent = 66, method = 22},
        #bt_attr{hp_lim = 1985, mp_lim = 839, inner_att = 83, outer_att = 84, inner_def = 202, outer_def = 262, hit = 213, dodge = 38, crit_hurt = 28, crit_def = 28, move_speed = 240}
    };
get_attr(3, 22) ->
    {
        #base_attr{power = 11, anima = 71, energy = 47, concent = 69, method = 23},
        #bt_attr{hp_lim = 2070, mp_lim = 875, inner_att = 86, outer_att = 87, inner_def = 209, outer_def = 271, hit = 221, dodge = 39, crit_hurt = 29, crit_def = 29, move_speed = 240}
    };
get_attr(3, 23) ->
    {
        #base_attr{power = 12, anima = 74, energy = 49, concent = 72, method = 24},
        #bt_attr{hp_lim = 2155, mp_lim = 911, inner_att = 89, outer_att = 90, inner_def = 217, outer_def = 280, hit = 229, dodge = 41, crit_hurt = 30, crit_def = 30, move_speed = 240}
    };
get_attr(3, 24) ->
    {
        #base_attr{power = 12, anima = 77, energy = 51, concent = 75, method = 25},
        #bt_attr{hp_lim = 2240, mp_lim = 947, inner_att = 92, outer_att = 93, inner_def = 224, outer_def = 289, hit = 237, dodge = 42, crit_hurt = 31, crit_def = 31, move_speed = 240}
    };
get_attr(3, 25) ->
    {
        #base_attr{power = 13, anima = 80, energy = 53, concent = 78, method = 26},
        #bt_attr{hp_lim = 2325, mp_lim = 983, inner_att = 95, outer_att = 96, inner_def = 232, outer_def = 298, hit = 245, dodge = 44, crit_hurt = 32, crit_def = 32, move_speed = 240}
    };
get_attr(3, 26) ->
    {
        #base_attr{power = 13, anima = 83, energy = 55, concent = 81, method = 27},
        #bt_attr{hp_lim = 2410, mp_lim = 1019, inner_att = 98, outer_att = 99, inner_def = 239, outer_def = 307, hit = 253, dodge = 45, crit_hurt = 33, crit_def = 33, move_speed = 240}
    };
get_attr(3, 27) ->
    {
        #base_attr{power = 14, anima = 86, energy = 57, concent = 84, method = 28},
        #bt_attr{hp_lim = 2495, mp_lim = 1055, inner_att = 101, outer_att = 102, inner_def = 247, outer_def = 316, hit = 261, dodge = 47, crit_hurt = 34, crit_def = 34, move_speed = 240}
    };
get_attr(3, 28) ->
    {
        #base_attr{power = 14, anima = 89, energy = 59, concent = 87, method = 29},
        #bt_attr{hp_lim = 2580, mp_lim = 1091, inner_att = 104, outer_att = 105, inner_def = 254, outer_def = 325, hit = 269, dodge = 48, crit_hurt = 35, crit_def = 35, move_speed = 240}
    };
get_attr(3, 29) ->
    {
        #base_attr{power = 15, anima = 92, energy = 61, concent = 90, method = 30},
        #bt_attr{hp_lim = 2665, mp_lim = 1127, inner_att = 107, outer_att = 108, inner_def = 262, outer_def = 334, hit = 277, dodge = 50, crit_hurt = 36, crit_def = 36, move_speed = 240}
    };
get_attr(3, 30) ->
    {
        #base_attr{power = 15, anima = 95, energy = 63, concent = 93, method = 31},
        #bt_attr{hp_lim = 2750, mp_lim = 1163, inner_att = 110, outer_att = 111, inner_def = 269, outer_def = 343, hit = 285, dodge = 51, crit_hurt = 37, crit_def = 37, move_speed = 240}
    };
get_attr(3, 31) ->
    {
        #base_attr{power = 16, anima = 98, energy = 65, concent = 96, method = 32},
        #bt_attr{hp_lim = 2835, mp_lim = 1199, inner_att = 113, outer_att = 114, inner_def = 277, outer_def = 352, hit = 293, dodge = 53, crit_hurt = 38, crit_def = 38, move_speed = 240}
    };
get_attr(3, 32) ->
    {
        #base_attr{power = 16, anima = 101, energy = 67, concent = 99, method = 33},
        #bt_attr{hp_lim = 2920, mp_lim = 1235, inner_att = 116, outer_att = 117, inner_def = 284, outer_def = 361, hit = 301, dodge = 54, crit_hurt = 39, crit_def = 39, move_speed = 240}
    };
get_attr(3, 33) ->
    {
        #base_attr{power = 17, anima = 104, energy = 69, concent = 102, method = 34},
        #bt_attr{hp_lim = 3005, mp_lim = 1271, inner_att = 119, outer_att = 120, inner_def = 292, outer_def = 370, hit = 309, dodge = 56, crit_hurt = 40, crit_def = 40, move_speed = 240}
    };
get_attr(3, 34) ->
    {
        #base_attr{power = 17, anima = 107, energy = 71, concent = 105, method = 35},
        #bt_attr{hp_lim = 3090, mp_lim = 1307, inner_att = 122, outer_att = 123, inner_def = 299, outer_def = 379, hit = 317, dodge = 57, crit_hurt = 41, crit_def = 41, move_speed = 240}
    };
get_attr(3, 35) ->
    {
        #base_attr{power = 18, anima = 110, energy = 73, concent = 108, method = 36},
        #bt_attr{hp_lim = 3175, mp_lim = 1343, inner_att = 125, outer_att = 126, inner_def = 307, outer_def = 388, hit = 325, dodge = 59, crit_hurt = 42, crit_def = 42, move_speed = 240}
    };
get_attr(3, 36) ->
    {
        #base_attr{power = 18, anima = 113, energy = 75, concent = 111, method = 37},
        #bt_attr{hp_lim = 3260, mp_lim = 1379, inner_att = 128, outer_att = 129, inner_def = 314, outer_def = 397, hit = 333, dodge = 60, crit_hurt = 43, crit_def = 43, move_speed = 240}
    };
get_attr(3, 37) ->
    {
        #base_attr{power = 19, anima = 116, energy = 77, concent = 114, method = 38},
        #bt_attr{hp_lim = 3345, mp_lim = 1415, inner_att = 131, outer_att = 132, inner_def = 322, outer_def = 406, hit = 341, dodge = 62, crit_hurt = 44, crit_def = 44, move_speed = 240}
    };
get_attr(3, 38) ->
    {
        #base_attr{power = 19, anima = 119, energy = 79, concent = 117, method = 39},
        #bt_attr{hp_lim = 3430, mp_lim = 1451, inner_att = 134, outer_att = 135, inner_def = 329, outer_def = 415, hit = 349, dodge = 63, crit_hurt = 45, crit_def = 45, move_speed = 240}
    };
get_attr(3, 39) ->
    {
        #base_attr{power = 20, anima = 122, energy = 81, concent = 120, method = 40},
        #bt_attr{hp_lim = 3515, mp_lim = 1487, inner_att = 137, outer_att = 138, inner_def = 337, outer_def = 424, hit = 357, dodge = 65, crit_hurt = 46, crit_def = 46, move_speed = 240}
    };
get_attr(3, 40) ->
    {
        #base_attr{power = 20, anima = 125, energy = 83, concent = 123, method = 41},
        #bt_attr{hp_lim = 3600, mp_lim = 1523, inner_att = 140, outer_att = 141, inner_def = 344, outer_def = 433, hit = 365, dodge = 66, crit_hurt = 47, crit_def = 47, move_speed = 240}
    };
get_attr(3, 41) ->
    {
        #base_attr{power = 21, anima = 128, energy = 85, concent = 126, method = 42},
        #bt_attr{hp_lim = 3685, mp_lim = 1559, inner_att = 143, outer_att = 144, inner_def = 352, outer_def = 442, hit = 373, dodge = 68, crit_hurt = 48, crit_def = 48, move_speed = 240}
    };
get_attr(3, 42) ->
    {
        #base_attr{power = 21, anima = 131, energy = 87, concent = 129, method = 43},
        #bt_attr{hp_lim = 3770, mp_lim = 1595, inner_att = 146, outer_att = 147, inner_def = 359, outer_def = 451, hit = 381, dodge = 69, crit_hurt = 49, crit_def = 49, move_speed = 240}
    };
get_attr(3, 43) ->
    {
        #base_attr{power = 22, anima = 134, energy = 89, concent = 132, method = 44},
        #bt_attr{hp_lim = 3855, mp_lim = 1631, inner_att = 149, outer_att = 150, inner_def = 367, outer_def = 460, hit = 389, dodge = 71, crit_hurt = 50, crit_def = 50, move_speed = 240}
    };
get_attr(3, 44) ->
    {
        #base_attr{power = 22, anima = 137, energy = 91, concent = 135, method = 45},
        #bt_attr{hp_lim = 3940, mp_lim = 1667, inner_att = 152, outer_att = 153, inner_def = 374, outer_def = 469, hit = 397, dodge = 72, crit_hurt = 51, crit_def = 51, move_speed = 240}
    };
get_attr(3, 45) ->
    {
        #base_attr{power = 23, anima = 140, energy = 93, concent = 138, method = 46},
        #bt_attr{hp_lim = 4025, mp_lim = 1703, inner_att = 155, outer_att = 156, inner_def = 382, outer_def = 478, hit = 405, dodge = 74, crit_hurt = 52, crit_def = 52, move_speed = 240}
    };
get_attr(3, 46) ->
    {
        #base_attr{power = 23, anima = 143, energy = 95, concent = 141, method = 47},
        #bt_attr{hp_lim = 4110, mp_lim = 1739, inner_att = 158, outer_att = 159, inner_def = 389, outer_def = 487, hit = 413, dodge = 75, crit_hurt = 53, crit_def = 53, move_speed = 240}
    };
get_attr(3, 47) ->
    {
        #base_attr{power = 24, anima = 146, energy = 97, concent = 144, method = 48},
        #bt_attr{hp_lim = 4195, mp_lim = 1775, inner_att = 161, outer_att = 162, inner_def = 397, outer_def = 496, hit = 421, dodge = 77, crit_hurt = 54, crit_def = 54, move_speed = 240}
    };
get_attr(3, 48) ->
    {
        #base_attr{power = 24, anima = 149, energy = 99, concent = 147, method = 49},
        #bt_attr{hp_lim = 4280, mp_lim = 1811, inner_att = 164, outer_att = 165, inner_def = 404, outer_def = 505, hit = 429, dodge = 78, crit_hurt = 55, crit_def = 55, move_speed = 240}
    };
get_attr(3, 49) ->
    {
        #base_attr{power = 25, anima = 152, energy = 101, concent = 150, method = 50},
        #bt_attr{hp_lim = 4365, mp_lim = 1847, inner_att = 167, outer_att = 168, inner_def = 412, outer_def = 514, hit = 437, dodge = 80, crit_hurt = 56, crit_def = 56, move_speed = 240}
    };
get_attr(3, 50) ->
    {
        #base_attr{power = 25, anima = 155, energy = 103, concent = 153, method = 51},
        #bt_attr{hp_lim = 4450, mp_lim = 1883, inner_att = 170, outer_att = 171, inner_def = 419, outer_def = 523, hit = 445, dodge = 81, crit_hurt = 57, crit_def = 57, move_speed = 240}
    };
get_attr(3, 51) ->
    {
        #base_attr{power = 26, anima = 158, energy = 105, concent = 156, method = 52},
        #bt_attr{hp_lim = 4535, mp_lim = 1919, inner_att = 173, outer_att = 174, inner_def = 427, outer_def = 532, hit = 453, dodge = 83, crit_hurt = 58, crit_def = 58, move_speed = 240}
    };
get_attr(3, 52) ->
    {
        #base_attr{power = 26, anima = 161, energy = 107, concent = 159, method = 53},
        #bt_attr{hp_lim = 4620, mp_lim = 1955, inner_att = 176, outer_att = 177, inner_def = 434, outer_def = 541, hit = 461, dodge = 84, crit_hurt = 59, crit_def = 59, move_speed = 240}
    };
get_attr(3, 53) ->
    {
        #base_attr{power = 27, anima = 164, energy = 109, concent = 162, method = 54},
        #bt_attr{hp_lim = 4705, mp_lim = 1991, inner_att = 179, outer_att = 180, inner_def = 442, outer_def = 550, hit = 469, dodge = 86, crit_hurt = 60, crit_def = 60, move_speed = 240}
    };
get_attr(3, 54) ->
    {
        #base_attr{power = 27, anima = 167, energy = 111, concent = 165, method = 55},
        #bt_attr{hp_lim = 4790, mp_lim = 2027, inner_att = 182, outer_att = 183, inner_def = 449, outer_def = 559, hit = 477, dodge = 87, crit_hurt = 61, crit_def = 61, move_speed = 240}
    };
get_attr(3, 55) ->
    {
        #base_attr{power = 28, anima = 170, energy = 113, concent = 168, method = 56},
        #bt_attr{hp_lim = 4875, mp_lim = 2063, inner_att = 185, outer_att = 186, inner_def = 457, outer_def = 568, hit = 485, dodge = 89, crit_hurt = 62, crit_def = 62, move_speed = 240}
    };
get_attr(3, 56) ->
    {
        #base_attr{power = 28, anima = 173, energy = 115, concent = 171, method = 57},
        #bt_attr{hp_lim = 4960, mp_lim = 2099, inner_att = 188, outer_att = 189, inner_def = 464, outer_def = 577, hit = 493, dodge = 90, crit_hurt = 63, crit_def = 63, move_speed = 240}
    };
get_attr(3, 57) ->
    {
        #base_attr{power = 29, anima = 176, energy = 117, concent = 174, method = 58},
        #bt_attr{hp_lim = 5045, mp_lim = 2135, inner_att = 191, outer_att = 192, inner_def = 472, outer_def = 586, hit = 501, dodge = 92, crit_hurt = 64, crit_def = 64, move_speed = 240}
    };
get_attr(3, 58) ->
    {
        #base_attr{power = 29, anima = 179, energy = 119, concent = 177, method = 59},
        #bt_attr{hp_lim = 5130, mp_lim = 2171, inner_att = 194, outer_att = 195, inner_def = 479, outer_def = 595, hit = 509, dodge = 93, crit_hurt = 65, crit_def = 65, move_speed = 240}
    };
get_attr(3, 59) ->
    {
        #base_attr{power = 30, anima = 182, energy = 121, concent = 180, method = 60},
        #bt_attr{hp_lim = 5215, mp_lim = 2207, inner_att = 197, outer_att = 198, inner_def = 487, outer_def = 604, hit = 517, dodge = 95, crit_hurt = 66, crit_def = 66, move_speed = 240}
    };
get_attr(3, 60) ->
    {
        #base_attr{power = 30, anima = 185, energy = 123, concent = 183, method = 61},
        #bt_attr{hp_lim = 5300, mp_lim = 2243, inner_att = 200, outer_att = 201, inner_def = 494, outer_def = 613, hit = 525, dodge = 96, crit_hurt = 67, crit_def = 67, move_speed = 240}
    };
get_attr(3, 61) ->
    {
        #base_attr{power = 31, anima = 188, energy = 125, concent = 186, method = 62},
        #bt_attr{hp_lim = 5385, mp_lim = 2279, inner_att = 203, outer_att = 204, inner_def = 502, outer_def = 622, hit = 533, dodge = 98, crit_hurt = 68, crit_def = 68, move_speed = 240}
    };
get_attr(3, 62) ->
    {
        #base_attr{power = 31, anima = 191, energy = 127, concent = 189, method = 63},
        #bt_attr{hp_lim = 5470, mp_lim = 2315, inner_att = 206, outer_att = 207, inner_def = 509, outer_def = 631, hit = 541, dodge = 99, crit_hurt = 69, crit_def = 69, move_speed = 240}
    };
get_attr(3, 63) ->
    {
        #base_attr{power = 32, anima = 194, energy = 129, concent = 192, method = 64},
        #bt_attr{hp_lim = 5555, mp_lim = 2351, inner_att = 209, outer_att = 210, inner_def = 517, outer_def = 640, hit = 549, dodge = 101, crit_hurt = 70, crit_def = 70, move_speed = 240}
    };
get_attr(3, 64) ->
    {
        #base_attr{power = 32, anima = 197, energy = 131, concent = 195, method = 65},
        #bt_attr{hp_lim = 5640, mp_lim = 2387, inner_att = 212, outer_att = 213, inner_def = 524, outer_def = 649, hit = 557, dodge = 102, crit_hurt = 71, crit_def = 71, move_speed = 240}
    };
get_attr(3, 65) ->
    {
        #base_attr{power = 33, anima = 200, energy = 133, concent = 198, method = 66},
        #bt_attr{hp_lim = 5725, mp_lim = 2423, inner_att = 215, outer_att = 216, inner_def = 532, outer_def = 658, hit = 565, dodge = 104, crit_hurt = 72, crit_def = 72, move_speed = 240}
    };
get_attr(3, 66) ->
    {
        #base_attr{power = 33, anima = 203, energy = 135, concent = 201, method = 67},
        #bt_attr{hp_lim = 5810, mp_lim = 2459, inner_att = 218, outer_att = 219, inner_def = 539, outer_def = 667, hit = 573, dodge = 105, crit_hurt = 73, crit_def = 73, move_speed = 240}
    };
get_attr(3, 67) ->
    {
        #base_attr{power = 34, anima = 206, energy = 137, concent = 204, method = 68},
        #bt_attr{hp_lim = 5895, mp_lim = 2495, inner_att = 221, outer_att = 222, inner_def = 547, outer_def = 676, hit = 581, dodge = 107, crit_hurt = 74, crit_def = 74, move_speed = 240}
    };
get_attr(3, 68) ->
    {
        #base_attr{power = 34, anima = 209, energy = 139, concent = 207, method = 69},
        #bt_attr{hp_lim = 5980, mp_lim = 2531, inner_att = 224, outer_att = 225, inner_def = 554, outer_def = 685, hit = 589, dodge = 108, crit_hurt = 75, crit_def = 75, move_speed = 240}
    };
get_attr(3, 69) ->
    {
        #base_attr{power = 35, anima = 212, energy = 141, concent = 210, method = 70},
        #bt_attr{hp_lim = 6065, mp_lim = 2567, inner_att = 227, outer_att = 228, inner_def = 562, outer_def = 694, hit = 597, dodge = 110, crit_hurt = 76, crit_def = 76, move_speed = 240}
    };
get_attr(3, 70) ->
    {
        #base_attr{power = 35, anima = 215, energy = 143, concent = 213, method = 71},
        #bt_attr{hp_lim = 6150, mp_lim = 2603, inner_att = 230, outer_att = 231, inner_def = 569, outer_def = 703, hit = 605, dodge = 111, crit_hurt = 77, crit_def = 77, move_speed = 240}
    };
get_attr(3, 71) ->
    {
        #base_attr{power = 36, anima = 218, energy = 145, concent = 216, method = 72},
        #bt_attr{hp_lim = 6235, mp_lim = 2639, inner_att = 233, outer_att = 234, inner_def = 577, outer_def = 712, hit = 613, dodge = 113, crit_hurt = 78, crit_def = 78, move_speed = 240}
    };
get_attr(3, 72) ->
    {
        #base_attr{power = 36, anima = 221, energy = 147, concent = 219, method = 73},
        #bt_attr{hp_lim = 6320, mp_lim = 2675, inner_att = 236, outer_att = 237, inner_def = 584, outer_def = 721, hit = 621, dodge = 114, crit_hurt = 79, crit_def = 79, move_speed = 240}
    };
get_attr(3, 73) ->
    {
        #base_attr{power = 37, anima = 224, energy = 149, concent = 222, method = 74},
        #bt_attr{hp_lim = 6405, mp_lim = 2711, inner_att = 239, outer_att = 240, inner_def = 592, outer_def = 730, hit = 629, dodge = 116, crit_hurt = 80, crit_def = 80, move_speed = 240}
    };
get_attr(3, 74) ->
    {
        #base_attr{power = 37, anima = 227, energy = 151, concent = 225, method = 75},
        #bt_attr{hp_lim = 6490, mp_lim = 2747, inner_att = 242, outer_att = 243, inner_def = 599, outer_def = 739, hit = 637, dodge = 117, crit_hurt = 81, crit_def = 81, move_speed = 240}
    };
get_attr(3, 75) ->
    {
        #base_attr{power = 38, anima = 230, energy = 153, concent = 228, method = 76},
        #bt_attr{hp_lim = 6575, mp_lim = 2783, inner_att = 245, outer_att = 246, inner_def = 607, outer_def = 748, hit = 645, dodge = 119, crit_hurt = 82, crit_def = 82, move_speed = 240}
    };
get_attr(3, 76) ->
    {
        #base_attr{power = 38, anima = 233, energy = 155, concent = 231, method = 77},
        #bt_attr{hp_lim = 6660, mp_lim = 2819, inner_att = 248, outer_att = 249, inner_def = 614, outer_def = 757, hit = 653, dodge = 120, crit_hurt = 83, crit_def = 83, move_speed = 240}
    };
get_attr(3, 77) ->
    {
        #base_attr{power = 39, anima = 236, energy = 157, concent = 234, method = 78},
        #bt_attr{hp_lim = 6745, mp_lim = 2855, inner_att = 251, outer_att = 252, inner_def = 622, outer_def = 766, hit = 661, dodge = 122, crit_hurt = 84, crit_def = 84, move_speed = 240}
    };
get_attr(3, 78) ->
    {
        #base_attr{power = 39, anima = 239, energy = 159, concent = 237, method = 79},
        #bt_attr{hp_lim = 6830, mp_lim = 2891, inner_att = 254, outer_att = 255, inner_def = 629, outer_def = 775, hit = 669, dodge = 123, crit_hurt = 85, crit_def = 85, move_speed = 240}
    };
get_attr(3, 79) ->
    {
        #base_attr{power = 40, anima = 242, energy = 161, concent = 240, method = 80},
        #bt_attr{hp_lim = 6915, mp_lim = 2927, inner_att = 257, outer_att = 258, inner_def = 637, outer_def = 784, hit = 677, dodge = 125, crit_hurt = 86, crit_def = 86, move_speed = 240}
    };
get_attr(3, 80) ->
    {
        #base_attr{power = 40, anima = 245, energy = 163, concent = 243, method = 81},
        #bt_attr{hp_lim = 7000, mp_lim = 2963, inner_att = 260, outer_att = 261, inner_def = 644, outer_def = 793, hit = 685, dodge = 126, crit_hurt = 87, crit_def = 87, move_speed = 240}
    };
get_attr(3, 81) ->
    {
        #base_attr{power = 41, anima = 248, energy = 165, concent = 246, method = 82},
        #bt_attr{hp_lim = 7085, mp_lim = 2999, inner_att = 263, outer_att = 264, inner_def = 652, outer_def = 802, hit = 693, dodge = 128, crit_hurt = 88, crit_def = 88, move_speed = 240}
    };
get_attr(3, 82) ->
    {
        #base_attr{power = 41, anima = 251, energy = 167, concent = 249, method = 83},
        #bt_attr{hp_lim = 7170, mp_lim = 3035, inner_att = 266, outer_att = 267, inner_def = 659, outer_def = 811, hit = 701, dodge = 129, crit_hurt = 89, crit_def = 89, move_speed = 240}
    };
get_attr(3, 83) ->
    {
        #base_attr{power = 42, anima = 254, energy = 169, concent = 252, method = 84},
        #bt_attr{hp_lim = 7255, mp_lim = 3071, inner_att = 269, outer_att = 270, inner_def = 667, outer_def = 820, hit = 709, dodge = 131, crit_hurt = 90, crit_def = 90, move_speed = 240}
    };
get_attr(3, 84) ->
    {
        #base_attr{power = 42, anima = 257, energy = 171, concent = 255, method = 85},
        #bt_attr{hp_lim = 7340, mp_lim = 3107, inner_att = 272, outer_att = 273, inner_def = 674, outer_def = 829, hit = 717, dodge = 132, crit_hurt = 91, crit_def = 91, move_speed = 240}
    };
get_attr(3, 85) ->
    {
        #base_attr{power = 43, anima = 260, energy = 173, concent = 258, method = 86},
        #bt_attr{hp_lim = 7425, mp_lim = 3143, inner_att = 275, outer_att = 276, inner_def = 682, outer_def = 838, hit = 725, dodge = 134, crit_hurt = 92, crit_def = 92, move_speed = 240}
    };
get_attr(3, 86) ->
    {
        #base_attr{power = 43, anima = 263, energy = 175, concent = 261, method = 87},
        #bt_attr{hp_lim = 7510, mp_lim = 3179, inner_att = 278, outer_att = 279, inner_def = 689, outer_def = 847, hit = 733, dodge = 135, crit_hurt = 93, crit_def = 93, move_speed = 240}
    };
get_attr(3, 87) ->
    {
        #base_attr{power = 44, anima = 266, energy = 177, concent = 264, method = 88},
        #bt_attr{hp_lim = 7595, mp_lim = 3215, inner_att = 281, outer_att = 282, inner_def = 697, outer_def = 856, hit = 741, dodge = 137, crit_hurt = 94, crit_def = 94, move_speed = 240}
    };
get_attr(3, 88) ->
    {
        #base_attr{power = 44, anima = 269, energy = 179, concent = 267, method = 89},
        #bt_attr{hp_lim = 7680, mp_lim = 3251, inner_att = 284, outer_att = 285, inner_def = 704, outer_def = 865, hit = 749, dodge = 138, crit_hurt = 95, crit_def = 95, move_speed = 240}
    };
get_attr(3, 89) ->
    {
        #base_attr{power = 45, anima = 272, energy = 181, concent = 270, method = 90},
        #bt_attr{hp_lim = 7765, mp_lim = 3287, inner_att = 287, outer_att = 288, inner_def = 712, outer_def = 874, hit = 757, dodge = 140, crit_hurt = 96, crit_def = 96, move_speed = 240}
    };
get_attr(3, 90) ->
    {
        #base_attr{power = 45, anima = 275, energy = 183, concent = 273, method = 91},
        #bt_attr{hp_lim = 7850, mp_lim = 3323, inner_att = 290, outer_att = 291, inner_def = 719, outer_def = 883, hit = 765, dodge = 141, crit_hurt = 97, crit_def = 97, move_speed = 240}
    };
get_attr(3, 91) ->
    {
        #base_attr{power = 46, anima = 278, energy = 185, concent = 276, method = 92},
        #bt_attr{hp_lim = 7935, mp_lim = 3359, inner_att = 293, outer_att = 294, inner_def = 727, outer_def = 892, hit = 773, dodge = 143, crit_hurt = 98, crit_def = 98, move_speed = 240}
    };
get_attr(3, 92) ->
    {
        #base_attr{power = 46, anima = 281, energy = 187, concent = 279, method = 93},
        #bt_attr{hp_lim = 8020, mp_lim = 3395, inner_att = 296, outer_att = 297, inner_def = 734, outer_def = 901, hit = 781, dodge = 144, crit_hurt = 99, crit_def = 99, move_speed = 240}
    };
get_attr(3, 93) ->
    {
        #base_attr{power = 47, anima = 284, energy = 189, concent = 282, method = 94},
        #bt_attr{hp_lim = 8105, mp_lim = 3431, inner_att = 299, outer_att = 300, inner_def = 742, outer_def = 910, hit = 789, dodge = 146, crit_hurt = 100, crit_def = 100, move_speed = 240}
    };
get_attr(3, 94) ->
    {
        #base_attr{power = 47, anima = 287, energy = 191, concent = 285, method = 95},
        #bt_attr{hp_lim = 8190, mp_lim = 3467, inner_att = 302, outer_att = 303, inner_def = 749, outer_def = 919, hit = 797, dodge = 147, crit_hurt = 101, crit_def = 101, move_speed = 240}
    };
get_attr(3, 95) ->
    {
        #base_attr{power = 48, anima = 290, energy = 193, concent = 288, method = 96},
        #bt_attr{hp_lim = 8275, mp_lim = 3503, inner_att = 305, outer_att = 306, inner_def = 757, outer_def = 928, hit = 805, dodge = 149, crit_hurt = 102, crit_def = 102, move_speed = 240}
    };
get_attr(3, 96) ->
    {
        #base_attr{power = 48, anima = 293, energy = 195, concent = 291, method = 97},
        #bt_attr{hp_lim = 8360, mp_lim = 3539, inner_att = 308, outer_att = 309, inner_def = 764, outer_def = 937, hit = 813, dodge = 150, crit_hurt = 103, crit_def = 103, move_speed = 240}
    };
get_attr(3, 97) ->
    {
        #base_attr{power = 49, anima = 296, energy = 197, concent = 294, method = 98},
        #bt_attr{hp_lim = 8445, mp_lim = 3575, inner_att = 311, outer_att = 312, inner_def = 772, outer_def = 946, hit = 821, dodge = 152, crit_hurt = 104, crit_def = 104, move_speed = 240}
    };
get_attr(3, 98) ->
    {
        #base_attr{power = 49, anima = 299, energy = 199, concent = 297, method = 99},
        #bt_attr{hp_lim = 8530, mp_lim = 3611, inner_att = 314, outer_att = 315, inner_def = 779, outer_def = 955, hit = 829, dodge = 153, crit_hurt = 105, crit_def = 105, move_speed = 240}
    };
get_attr(3, 99) ->
    {
        #base_attr{power = 50, anima = 302, energy = 201, concent = 300, method = 100},
        #bt_attr{hp_lim = 8615, mp_lim = 3647, inner_att = 317, outer_att = 318, inner_def = 787, outer_def = 964, hit = 837, dodge = 155, crit_hurt = 106, crit_def = 106, move_speed = 240}
    };
get_attr(3, 100) ->
    {
        #base_attr{power = 50, anima = 305, energy = 203, concent = 303, method = 101},
        #bt_attr{hp_lim = 8700, mp_lim = 3683, inner_att = 320, outer_att = 321, inner_def = 794, outer_def = 973, hit = 845, dodge = 156, crit_hurt = 107, crit_def = 107, move_speed = 240}
    };
get_attr(3, 101) ->
    {
        #base_attr{power = 51, anima = 308, energy = 205, concent = 306, method = 102},
        #bt_attr{hp_lim = 8785, mp_lim = 3719, inner_att = 323, outer_att = 324, inner_def = 802, outer_def = 982, hit = 853, dodge = 158, crit_hurt = 108, crit_def = 108, move_speed = 240}
    };
get_attr(3, 102) ->
    {
        #base_attr{power = 51, anima = 311, energy = 207, concent = 309, method = 103},
        #bt_attr{hp_lim = 8870, mp_lim = 3755, inner_att = 326, outer_att = 327, inner_def = 809, outer_def = 991, hit = 861, dodge = 159, crit_hurt = 109, crit_def = 109, move_speed = 240}
    };
get_attr(3, 103) ->
    {
        #base_attr{power = 52, anima = 314, energy = 209, concent = 312, method = 104},
        #bt_attr{hp_lim = 8955, mp_lim = 3791, inner_att = 329, outer_att = 330, inner_def = 817, outer_def = 1000, hit = 869, dodge = 161, crit_hurt = 110, crit_def = 110, move_speed = 240}
    };
get_attr(3, 104) ->
    {
        #base_attr{power = 52, anima = 317, energy = 211, concent = 315, method = 105},
        #bt_attr{hp_lim = 9040, mp_lim = 3827, inner_att = 332, outer_att = 333, inner_def = 824, outer_def = 1009, hit = 877, dodge = 162, crit_hurt = 111, crit_def = 111, move_speed = 240}
    };
get_attr(3, 105) ->
    {
        #base_attr{power = 53, anima = 320, energy = 213, concent = 318, method = 106},
        #bt_attr{hp_lim = 9125, mp_lim = 3863, inner_att = 335, outer_att = 336, inner_def = 832, outer_def = 1018, hit = 885, dodge = 164, crit_hurt = 112, crit_def = 112, move_speed = 240}
    };
get_attr(3, 106) ->
    {
        #base_attr{power = 53, anima = 323, energy = 215, concent = 321, method = 107},
        #bt_attr{hp_lim = 9210, mp_lim = 3899, inner_att = 338, outer_att = 339, inner_def = 839, outer_def = 1027, hit = 893, dodge = 165, crit_hurt = 113, crit_def = 113, move_speed = 240}
    };
get_attr(3, 107) ->
    {
        #base_attr{power = 54, anima = 326, energy = 217, concent = 324, method = 108},
        #bt_attr{hp_lim = 9295, mp_lim = 3935, inner_att = 341, outer_att = 342, inner_def = 847, outer_def = 1036, hit = 901, dodge = 167, crit_hurt = 114, crit_def = 114, move_speed = 240}
    };
get_attr(3, 108) ->
    {
        #base_attr{power = 54, anima = 329, energy = 219, concent = 327, method = 109},
        #bt_attr{hp_lim = 9380, mp_lim = 3971, inner_att = 344, outer_att = 345, inner_def = 854, outer_def = 1045, hit = 909, dodge = 168, crit_hurt = 115, crit_def = 115, move_speed = 240}
    };
get_attr(3, 109) ->
    {
        #base_attr{power = 55, anima = 332, energy = 221, concent = 330, method = 110},
        #bt_attr{hp_lim = 9465, mp_lim = 4007, inner_att = 347, outer_att = 348, inner_def = 862, outer_def = 1054, hit = 917, dodge = 170, crit_hurt = 116, crit_def = 116, move_speed = 240}
    };
get_attr(3, 110) ->
    {
        #base_attr{power = 55, anima = 335, energy = 223, concent = 333, method = 111},
        #bt_attr{hp_lim = 9550, mp_lim = 4043, inner_att = 350, outer_att = 351, inner_def = 869, outer_def = 1063, hit = 925, dodge = 171, crit_hurt = 117, crit_def = 117, move_speed = 240}
    };
get_attr(3, 111) ->
    {
        #base_attr{power = 56, anima = 338, energy = 225, concent = 336, method = 112},
        #bt_attr{hp_lim = 9635, mp_lim = 4079, inner_att = 353, outer_att = 354, inner_def = 877, outer_def = 1072, hit = 933, dodge = 173, crit_hurt = 118, crit_def = 118, move_speed = 240}
    };
get_attr(3, 112) ->
    {
        #base_attr{power = 56, anima = 341, energy = 227, concent = 339, method = 113},
        #bt_attr{hp_lim = 9720, mp_lim = 4115, inner_att = 356, outer_att = 357, inner_def = 884, outer_def = 1081, hit = 941, dodge = 174, crit_hurt = 119, crit_def = 119, move_speed = 240}
    };
get_attr(3, 113) ->
    {
        #base_attr{power = 57, anima = 344, energy = 229, concent = 342, method = 114},
        #bt_attr{hp_lim = 9805, mp_lim = 4151, inner_att = 359, outer_att = 360, inner_def = 892, outer_def = 1090, hit = 949, dodge = 176, crit_hurt = 120, crit_def = 120, move_speed = 240}
    };
get_attr(3, 114) ->
    {
        #base_attr{power = 57, anima = 347, energy = 231, concent = 345, method = 115},
        #bt_attr{hp_lim = 9890, mp_lim = 4187, inner_att = 362, outer_att = 363, inner_def = 899, outer_def = 1099, hit = 957, dodge = 177, crit_hurt = 121, crit_def = 121, move_speed = 240}
    };
get_attr(3, 115) ->
    {
        #base_attr{power = 58, anima = 350, energy = 233, concent = 348, method = 116},
        #bt_attr{hp_lim = 9975, mp_lim = 4223, inner_att = 365, outer_att = 366, inner_def = 907, outer_def = 1108, hit = 965, dodge = 179, crit_hurt = 122, crit_def = 122, move_speed = 240}
    };
get_attr(3, 116) ->
    {
        #base_attr{power = 58, anima = 353, energy = 235, concent = 351, method = 117},
        #bt_attr{hp_lim = 10060, mp_lim = 4259, inner_att = 368, outer_att = 369, inner_def = 914, outer_def = 1117, hit = 973, dodge = 180, crit_hurt = 123, crit_def = 123, move_speed = 240}
    };
get_attr(3, 117) ->
    {
        #base_attr{power = 59, anima = 356, energy = 237, concent = 354, method = 118},
        #bt_attr{hp_lim = 10145, mp_lim = 4295, inner_att = 371, outer_att = 372, inner_def = 922, outer_def = 1126, hit = 981, dodge = 182, crit_hurt = 124, crit_def = 124, move_speed = 240}
    };
get_attr(3, 118) ->
    {
        #base_attr{power = 59, anima = 359, energy = 239, concent = 357, method = 119},
        #bt_attr{hp_lim = 10230, mp_lim = 4331, inner_att = 374, outer_att = 375, inner_def = 929, outer_def = 1135, hit = 989, dodge = 183, crit_hurt = 125, crit_def = 125, move_speed = 240}
    };
get_attr(3, 119) ->
    {
        #base_attr{power = 60, anima = 362, energy = 241, concent = 360, method = 120},
        #bt_attr{hp_lim = 10315, mp_lim = 4367, inner_att = 377, outer_att = 378, inner_def = 937, outer_def = 1144, hit = 997, dodge = 185, crit_hurt = 126, crit_def = 126, move_speed = 240}
    };
get_attr(3, 120) ->
    {
        #base_attr{power = 60, anima = 365, energy = 243, concent = 363, method = 121},
        #bt_attr{hp_lim = 10400, mp_lim = 4403, inner_att = 380, outer_att = 381, inner_def = 944, outer_def = 1153, hit = 1005, dodge = 186, crit_hurt = 127, crit_def = 127, move_speed = 240}
    };
get_attr(3, 121) ->
    {
        #base_attr{power = 61, anima = 368, energy = 245, concent = 366, method = 122},
        #bt_attr{hp_lim = 10485, mp_lim = 4439, inner_att = 383, outer_att = 384, inner_def = 952, outer_def = 1162, hit = 1013, dodge = 188, crit_hurt = 128, crit_def = 128, move_speed = 240}
    };
get_attr(3, 122) ->
    {
        #base_attr{power = 61, anima = 371, energy = 247, concent = 369, method = 123},
        #bt_attr{hp_lim = 10570, mp_lim = 4475, inner_att = 386, outer_att = 387, inner_def = 959, outer_def = 1171, hit = 1021, dodge = 189, crit_hurt = 129, crit_def = 129, move_speed = 240}
    };
get_attr(3, 123) ->
    {
        #base_attr{power = 62, anima = 374, energy = 249, concent = 372, method = 124},
        #bt_attr{hp_lim = 10655, mp_lim = 4511, inner_att = 389, outer_att = 390, inner_def = 967, outer_def = 1180, hit = 1029, dodge = 191, crit_hurt = 130, crit_def = 130, move_speed = 240}
    };
get_attr(3, 124) ->
    {
        #base_attr{power = 62, anima = 377, energy = 251, concent = 375, method = 125},
        #bt_attr{hp_lim = 10740, mp_lim = 4547, inner_att = 392, outer_att = 393, inner_def = 974, outer_def = 1189, hit = 1037, dodge = 192, crit_hurt = 131, crit_def = 131, move_speed = 240}
    };
get_attr(3, 125) ->
    {
        #base_attr{power = 63, anima = 380, energy = 253, concent = 378, method = 126},
        #bt_attr{hp_lim = 10825, mp_lim = 4583, inner_att = 395, outer_att = 396, inner_def = 982, outer_def = 1198, hit = 1045, dodge = 194, crit_hurt = 132, crit_def = 132, move_speed = 240}
    };
get_attr(3, 126) ->
    {
        #base_attr{power = 63, anima = 383, energy = 255, concent = 381, method = 127},
        #bt_attr{hp_lim = 10910, mp_lim = 4619, inner_att = 398, outer_att = 399, inner_def = 989, outer_def = 1207, hit = 1053, dodge = 195, crit_hurt = 133, crit_def = 133, move_speed = 240}
    };
get_attr(3, 127) ->
    {
        #base_attr{power = 64, anima = 386, energy = 257, concent = 384, method = 128},
        #bt_attr{hp_lim = 10995, mp_lim = 4655, inner_att = 401, outer_att = 402, inner_def = 997, outer_def = 1216, hit = 1061, dodge = 197, crit_hurt = 134, crit_def = 134, move_speed = 240}
    };
get_attr(3, 128) ->
    {
        #base_attr{power = 64, anima = 389, energy = 259, concent = 387, method = 129},
        #bt_attr{hp_lim = 11080, mp_lim = 4691, inner_att = 404, outer_att = 405, inner_def = 1004, outer_def = 1225, hit = 1069, dodge = 198, crit_hurt = 135, crit_def = 135, move_speed = 240}
    };
get_attr(3, 129) ->
    {
        #base_attr{power = 65, anima = 392, energy = 261, concent = 390, method = 130},
        #bt_attr{hp_lim = 11165, mp_lim = 4727, inner_att = 407, outer_att = 408, inner_def = 1012, outer_def = 1234, hit = 1077, dodge = 200, crit_hurt = 136, crit_def = 136, move_speed = 240}
    };
get_attr(3, 130) ->
    {
        #base_attr{power = 65, anima = 395, energy = 263, concent = 393, method = 131},
        #bt_attr{hp_lim = 11250, mp_lim = 4763, inner_att = 410, outer_att = 411, inner_def = 1019, outer_def = 1243, hit = 1085, dodge = 201, crit_hurt = 137, crit_def = 137, move_speed = 240}
    };
get_attr(3, 131) ->
    {
        #base_attr{power = 66, anima = 398, energy = 265, concent = 396, method = 132},
        #bt_attr{hp_lim = 11335, mp_lim = 4799, inner_att = 413, outer_att = 414, inner_def = 1027, outer_def = 1252, hit = 1093, dodge = 203, crit_hurt = 138, crit_def = 138, move_speed = 240}
    };
get_attr(3, 132) ->
    {
        #base_attr{power = 66, anima = 401, energy = 267, concent = 399, method = 133},
        #bt_attr{hp_lim = 11420, mp_lim = 4835, inner_att = 416, outer_att = 417, inner_def = 1034, outer_def = 1261, hit = 1101, dodge = 204, crit_hurt = 139, crit_def = 139, move_speed = 240}
    };
get_attr(3, 133) ->
    {
        #base_attr{power = 67, anima = 404, energy = 269, concent = 402, method = 134},
        #bt_attr{hp_lim = 11505, mp_lim = 4871, inner_att = 419, outer_att = 420, inner_def = 1042, outer_def = 1270, hit = 1109, dodge = 206, crit_hurt = 140, crit_def = 140, move_speed = 240}
    };
get_attr(3, 134) ->
    {
        #base_attr{power = 67, anima = 407, energy = 271, concent = 405, method = 135},
        #bt_attr{hp_lim = 11590, mp_lim = 4907, inner_att = 422, outer_att = 423, inner_def = 1049, outer_def = 1279, hit = 1117, dodge = 207, crit_hurt = 141, crit_def = 141, move_speed = 240}
    };
get_attr(3, 135) ->
    {
        #base_attr{power = 68, anima = 410, energy = 273, concent = 408, method = 136},
        #bt_attr{hp_lim = 11675, mp_lim = 4943, inner_att = 425, outer_att = 426, inner_def = 1057, outer_def = 1288, hit = 1125, dodge = 209, crit_hurt = 142, crit_def = 142, move_speed = 240}
    };
get_attr(3, 136) ->
    {
        #base_attr{power = 68, anima = 413, energy = 275, concent = 411, method = 137},
        #bt_attr{hp_lim = 11760, mp_lim = 4979, inner_att = 428, outer_att = 429, inner_def = 1064, outer_def = 1297, hit = 1133, dodge = 210, crit_hurt = 143, crit_def = 143, move_speed = 240}
    };
get_attr(3, 137) ->
    {
        #base_attr{power = 69, anima = 416, energy = 277, concent = 414, method = 138},
        #bt_attr{hp_lim = 11845, mp_lim = 5015, inner_att = 431, outer_att = 432, inner_def = 1072, outer_def = 1306, hit = 1141, dodge = 212, crit_hurt = 144, crit_def = 144, move_speed = 240}
    };
get_attr(3, 138) ->
    {
        #base_attr{power = 69, anima = 419, energy = 279, concent = 417, method = 139},
        #bt_attr{hp_lim = 11930, mp_lim = 5051, inner_att = 434, outer_att = 435, inner_def = 1079, outer_def = 1315, hit = 1149, dodge = 213, crit_hurt = 145, crit_def = 145, move_speed = 240}
    };
get_attr(3, 139) ->
    {
        #base_attr{power = 70, anima = 422, energy = 281, concent = 420, method = 140},
        #bt_attr{hp_lim = 12015, mp_lim = 5087, inner_att = 437, outer_att = 438, inner_def = 1087, outer_def = 1324, hit = 1157, dodge = 215, crit_hurt = 146, crit_def = 146, move_speed = 240}
    };
get_attr(3, 140) ->
    {
        #base_attr{power = 70, anima = 425, energy = 283, concent = 423, method = 141},
        #bt_attr{hp_lim = 12100, mp_lim = 5123, inner_att = 440, outer_att = 441, inner_def = 1094, outer_def = 1333, hit = 1165, dodge = 216, crit_hurt = 147, crit_def = 147, move_speed = 240}
    };
get_attr(3, 141) ->
    {
        #base_attr{power = 71, anima = 428, energy = 285, concent = 426, method = 142},
        #bt_attr{hp_lim = 12185, mp_lim = 5159, inner_att = 443, outer_att = 444, inner_def = 1102, outer_def = 1342, hit = 1173, dodge = 218, crit_hurt = 148, crit_def = 148, move_speed = 240}
    };
get_attr(3, 142) ->
    {
        #base_attr{power = 71, anima = 431, energy = 287, concent = 429, method = 143},
        #bt_attr{hp_lim = 12270, mp_lim = 5195, inner_att = 446, outer_att = 447, inner_def = 1109, outer_def = 1351, hit = 1181, dodge = 219, crit_hurt = 149, crit_def = 149, move_speed = 240}
    };
get_attr(3, 143) ->
    {
        #base_attr{power = 72, anima = 434, energy = 289, concent = 432, method = 144},
        #bt_attr{hp_lim = 12355, mp_lim = 5231, inner_att = 449, outer_att = 450, inner_def = 1117, outer_def = 1360, hit = 1189, dodge = 221, crit_hurt = 150, crit_def = 150, move_speed = 240}
    };
get_attr(3, 144) ->
    {
        #base_attr{power = 72, anima = 437, energy = 291, concent = 435, method = 145},
        #bt_attr{hp_lim = 12440, mp_lim = 5267, inner_att = 452, outer_att = 453, inner_def = 1124, outer_def = 1369, hit = 1197, dodge = 222, crit_hurt = 151, crit_def = 151, move_speed = 240}
    };
get_attr(3, 145) ->
    {
        #base_attr{power = 73, anima = 440, energy = 293, concent = 438, method = 146},
        #bt_attr{hp_lim = 12525, mp_lim = 5303, inner_att = 455, outer_att = 456, inner_def = 1132, outer_def = 1378, hit = 1205, dodge = 224, crit_hurt = 152, crit_def = 152, move_speed = 240}
    };
get_attr(3, 146) ->
    {
        #base_attr{power = 73, anima = 443, energy = 295, concent = 441, method = 147},
        #bt_attr{hp_lim = 12610, mp_lim = 5339, inner_att = 458, outer_att = 459, inner_def = 1139, outer_def = 1387, hit = 1213, dodge = 225, crit_hurt = 153, crit_def = 153, move_speed = 240}
    };
get_attr(3, 147) ->
    {
        #base_attr{power = 74, anima = 446, energy = 297, concent = 444, method = 148},
        #bt_attr{hp_lim = 12695, mp_lim = 5375, inner_att = 461, outer_att = 462, inner_def = 1147, outer_def = 1396, hit = 1221, dodge = 227, crit_hurt = 154, crit_def = 154, move_speed = 240}
    };
get_attr(3, 148) ->
    {
        #base_attr{power = 74, anima = 449, energy = 299, concent = 447, method = 149},
        #bt_attr{hp_lim = 12780, mp_lim = 5411, inner_att = 464, outer_att = 465, inner_def = 1154, outer_def = 1405, hit = 1229, dodge = 228, crit_hurt = 155, crit_def = 155, move_speed = 240}
    };
get_attr(3, 149) ->
    {
        #base_attr{power = 75, anima = 452, energy = 301, concent = 450, method = 150},
        #bt_attr{hp_lim = 12865, mp_lim = 5447, inner_att = 467, outer_att = 468, inner_def = 1162, outer_def = 1414, hit = 1237, dodge = 230, crit_hurt = 156, crit_def = 156, move_speed = 240}
    };
get_attr(3, 150) ->
    {
        #base_attr{power = 75, anima = 455, energy = 303, concent = 453, method = 151},
        #bt_attr{hp_lim = 12950, mp_lim = 5483, inner_att = 470, outer_att = 471, inner_def = 1169, outer_def = 1423, hit = 1245, dodge = 231, crit_hurt = 157, crit_def = 157, move_speed = 240}
    };
get_attr(4, 1) ->
    {
        #base_attr{power = 9, anima = 3, energy = 6, concent = 4, method = 4},
        #bt_attr{hp_lim = 310, mp_lim = 87, inner_att = 49, outer_att = 86, inner_def = 22, outer_def = 38, hit = 61, dodge = 8, crit_hurt = 7, crit_def = 7, move_speed = 240}
    };
get_attr(4, 2) ->
    {
        #base_attr{power = 12, anima = 3, energy = 8, concent = 6, method = 5},
        #bt_attr{hp_lim = 401, mp_lim = 108, inner_att = 55, outer_att = 94, inner_def = 25, outer_def = 42, hit = 69, dodge = 10, crit_hurt = 8, crit_def = 8, move_speed = 240}
    };
get_attr(4, 3) ->
    {
        #base_attr{power = 15, anima = 4, energy = 11, concent = 8, method = 6},
        #bt_attr{hp_lim = 492, mp_lim = 129, inner_att = 62, outer_att = 103, inner_def = 28, outer_def = 46, hit = 77, dodge = 12, crit_hurt = 10, crit_def = 10, move_speed = 240}
    };
get_attr(4, 4) ->
    {
        #base_attr{power = 18, anima = 4, energy = 13, concent = 10, method = 7},
        #bt_attr{hp_lim = 583, mp_lim = 150, inner_att = 68, outer_att = 111, inner_def = 31, outer_def = 50, hit = 85, dodge = 14, crit_hurt = 11, crit_def = 11, move_speed = 240}
    };
get_attr(4, 5) ->
    {
        #base_attr{power = 21, anima = 5, energy = 16, concent = 12, method = 8},
        #bt_attr{hp_lim = 674, mp_lim = 171, inner_att = 75, outer_att = 120, inner_def = 34, outer_def = 54, hit = 93, dodge = 16, crit_hurt = 13, crit_def = 13, move_speed = 240}
    };
get_attr(4, 6) ->
    {
        #base_attr{power = 24, anima = 5, energy = 18, concent = 14, method = 9},
        #bt_attr{hp_lim = 765, mp_lim = 192, inner_att = 81, outer_att = 128, inner_def = 37, outer_def = 58, hit = 101, dodge = 18, crit_hurt = 14, crit_def = 14, move_speed = 240}
    };
get_attr(4, 7) ->
    {
        #base_attr{power = 27, anima = 6, energy = 21, concent = 16, method = 10},
        #bt_attr{hp_lim = 856, mp_lim = 213, inner_att = 88, outer_att = 137, inner_def = 40, outer_def = 62, hit = 109, dodge = 20, crit_hurt = 16, crit_def = 16, move_speed = 240}
    };
get_attr(4, 8) ->
    {
        #base_attr{power = 30, anima = 6, energy = 23, concent = 18, method = 11},
        #bt_attr{hp_lim = 947, mp_lim = 234, inner_att = 94, outer_att = 145, inner_def = 43, outer_def = 66, hit = 117, dodge = 22, crit_hurt = 17, crit_def = 17, move_speed = 240}
    };
get_attr(4, 9) ->
    {
        #base_attr{power = 33, anima = 7, energy = 26, concent = 20, method = 12},
        #bt_attr{hp_lim = 1038, mp_lim = 255, inner_att = 101, outer_att = 154, inner_def = 46, outer_def = 70, hit = 125, dodge = 24, crit_hurt = 19, crit_def = 19, move_speed = 240}
    };
get_attr(4, 10) ->
    {
        #base_attr{power = 36, anima = 7, energy = 28, concent = 22, method = 13},
        #bt_attr{hp_lim = 1129, mp_lim = 276, inner_att = 107, outer_att = 162, inner_def = 49, outer_def = 74, hit = 133, dodge = 26, crit_hurt = 20, crit_def = 20, move_speed = 240}
    };
get_attr(4, 11) ->
    {
        #base_attr{power = 39, anima = 8, energy = 31, concent = 24, method = 14},
        #bt_attr{hp_lim = 1220, mp_lim = 297, inner_att = 114, outer_att = 171, inner_def = 52, outer_def = 78, hit = 141, dodge = 28, crit_hurt = 22, crit_def = 22, move_speed = 240}
    };
get_attr(4, 12) ->
    {
        #base_attr{power = 42, anima = 8, energy = 33, concent = 26, method = 15},
        #bt_attr{hp_lim = 1311, mp_lim = 318, inner_att = 120, outer_att = 179, inner_def = 55, outer_def = 82, hit = 149, dodge = 30, crit_hurt = 23, crit_def = 23, move_speed = 240}
    };
get_attr(4, 13) ->
    {
        #base_attr{power = 45, anima = 9, energy = 36, concent = 28, method = 16},
        #bt_attr{hp_lim = 1402, mp_lim = 339, inner_att = 127, outer_att = 188, inner_def = 58, outer_def = 86, hit = 157, dodge = 32, crit_hurt = 25, crit_def = 25, move_speed = 240}
    };
get_attr(4, 14) ->
    {
        #base_attr{power = 48, anima = 9, energy = 38, concent = 30, method = 17},
        #bt_attr{hp_lim = 1493, mp_lim = 360, inner_att = 133, outer_att = 196, inner_def = 61, outer_def = 90, hit = 165, dodge = 34, crit_hurt = 26, crit_def = 26, move_speed = 240}
    };
get_attr(4, 15) ->
    {
        #base_attr{power = 51, anima = 10, energy = 41, concent = 32, method = 18},
        #bt_attr{hp_lim = 1584, mp_lim = 381, inner_att = 140, outer_att = 205, inner_def = 64, outer_def = 94, hit = 173, dodge = 36, crit_hurt = 28, crit_def = 28, move_speed = 240}
    };
get_attr(4, 16) ->
    {
        #base_attr{power = 54, anima = 10, energy = 43, concent = 34, method = 19},
        #bt_attr{hp_lim = 1675, mp_lim = 402, inner_att = 146, outer_att = 213, inner_def = 67, outer_def = 98, hit = 181, dodge = 38, crit_hurt = 29, crit_def = 29, move_speed = 240}
    };
get_attr(4, 17) ->
    {
        #base_attr{power = 57, anima = 11, energy = 46, concent = 36, method = 20},
        #bt_attr{hp_lim = 1766, mp_lim = 423, inner_att = 153, outer_att = 222, inner_def = 70, outer_def = 102, hit = 189, dodge = 40, crit_hurt = 31, crit_def = 31, move_speed = 240}
    };
get_attr(4, 18) ->
    {
        #base_attr{power = 60, anima = 11, energy = 48, concent = 38, method = 21},
        #bt_attr{hp_lim = 1857, mp_lim = 444, inner_att = 159, outer_att = 230, inner_def = 73, outer_def = 106, hit = 197, dodge = 42, crit_hurt = 32, crit_def = 32, move_speed = 240}
    };
get_attr(4, 19) ->
    {
        #base_attr{power = 63, anima = 12, energy = 51, concent = 40, method = 22},
        #bt_attr{hp_lim = 1948, mp_lim = 465, inner_att = 166, outer_att = 239, inner_def = 76, outer_def = 110, hit = 205, dodge = 44, crit_hurt = 34, crit_def = 34, move_speed = 240}
    };
get_attr(4, 20) ->
    {
        #base_attr{power = 66, anima = 12, energy = 53, concent = 42, method = 23},
        #bt_attr{hp_lim = 2039, mp_lim = 486, inner_att = 172, outer_att = 247, inner_def = 79, outer_def = 114, hit = 213, dodge = 46, crit_hurt = 35, crit_def = 35, move_speed = 240}
    };
get_attr(4, 21) ->
    {
        #base_attr{power = 69, anima = 13, energy = 56, concent = 44, method = 24},
        #bt_attr{hp_lim = 2130, mp_lim = 507, inner_att = 179, outer_att = 256, inner_def = 82, outer_def = 118, hit = 221, dodge = 48, crit_hurt = 37, crit_def = 37, move_speed = 240}
    };
get_attr(4, 22) ->
    {
        #base_attr{power = 72, anima = 13, energy = 58, concent = 46, method = 25},
        #bt_attr{hp_lim = 2221, mp_lim = 528, inner_att = 185, outer_att = 264, inner_def = 85, outer_def = 122, hit = 229, dodge = 50, crit_hurt = 38, crit_def = 38, move_speed = 240}
    };
get_attr(4, 23) ->
    {
        #base_attr{power = 75, anima = 14, energy = 61, concent = 48, method = 26},
        #bt_attr{hp_lim = 2312, mp_lim = 549, inner_att = 192, outer_att = 273, inner_def = 88, outer_def = 126, hit = 237, dodge = 52, crit_hurt = 40, crit_def = 40, move_speed = 240}
    };
get_attr(4, 24) ->
    {
        #base_attr{power = 78, anima = 14, energy = 63, concent = 50, method = 27},
        #bt_attr{hp_lim = 2403, mp_lim = 570, inner_att = 198, outer_att = 281, inner_def = 91, outer_def = 130, hit = 245, dodge = 54, crit_hurt = 41, crit_def = 41, move_speed = 240}
    };
get_attr(4, 25) ->
    {
        #base_attr{power = 81, anima = 15, energy = 66, concent = 52, method = 28},
        #bt_attr{hp_lim = 2494, mp_lim = 591, inner_att = 205, outer_att = 290, inner_def = 94, outer_def = 134, hit = 253, dodge = 56, crit_hurt = 43, crit_def = 43, move_speed = 240}
    };
get_attr(4, 26) ->
    {
        #base_attr{power = 84, anima = 15, energy = 68, concent = 54, method = 29},
        #bt_attr{hp_lim = 2585, mp_lim = 612, inner_att = 211, outer_att = 298, inner_def = 97, outer_def = 138, hit = 261, dodge = 58, crit_hurt = 44, crit_def = 44, move_speed = 240}
    };
get_attr(4, 27) ->
    {
        #base_attr{power = 87, anima = 16, energy = 71, concent = 56, method = 30},
        #bt_attr{hp_lim = 2676, mp_lim = 633, inner_att = 218, outer_att = 307, inner_def = 100, outer_def = 142, hit = 269, dodge = 60, crit_hurt = 46, crit_def = 46, move_speed = 240}
    };
get_attr(4, 28) ->
    {
        #base_attr{power = 90, anima = 16, energy = 73, concent = 58, method = 31},
        #bt_attr{hp_lim = 2767, mp_lim = 654, inner_att = 224, outer_att = 315, inner_def = 103, outer_def = 146, hit = 277, dodge = 62, crit_hurt = 47, crit_def = 47, move_speed = 240}
    };
get_attr(4, 29) ->
    {
        #base_attr{power = 93, anima = 17, energy = 76, concent = 60, method = 32},
        #bt_attr{hp_lim = 2858, mp_lim = 675, inner_att = 231, outer_att = 324, inner_def = 106, outer_def = 150, hit = 285, dodge = 64, crit_hurt = 49, crit_def = 49, move_speed = 240}
    };
get_attr(4, 30) ->
    {
        #base_attr{power = 96, anima = 17, energy = 78, concent = 62, method = 33},
        #bt_attr{hp_lim = 2949, mp_lim = 696, inner_att = 237, outer_att = 332, inner_def = 109, outer_def = 154, hit = 293, dodge = 66, crit_hurt = 50, crit_def = 50, move_speed = 240}
    };
get_attr(4, 31) ->
    {
        #base_attr{power = 99, anima = 18, energy = 81, concent = 64, method = 34},
        #bt_attr{hp_lim = 3040, mp_lim = 717, inner_att = 244, outer_att = 341, inner_def = 112, outer_def = 158, hit = 301, dodge = 68, crit_hurt = 52, crit_def = 52, move_speed = 240}
    };
get_attr(4, 32) ->
    {
        #base_attr{power = 102, anima = 18, energy = 83, concent = 66, method = 35},
        #bt_attr{hp_lim = 3131, mp_lim = 738, inner_att = 250, outer_att = 349, inner_def = 115, outer_def = 162, hit = 309, dodge = 70, crit_hurt = 53, crit_def = 53, move_speed = 240}
    };
get_attr(4, 33) ->
    {
        #base_attr{power = 105, anima = 19, energy = 86, concent = 68, method = 36},
        #bt_attr{hp_lim = 3222, mp_lim = 759, inner_att = 257, outer_att = 358, inner_def = 118, outer_def = 166, hit = 317, dodge = 72, crit_hurt = 55, crit_def = 55, move_speed = 240}
    };
get_attr(4, 34) ->
    {
        #base_attr{power = 108, anima = 19, energy = 88, concent = 70, method = 37},
        #bt_attr{hp_lim = 3313, mp_lim = 780, inner_att = 263, outer_att = 366, inner_def = 121, outer_def = 170, hit = 325, dodge = 74, crit_hurt = 56, crit_def = 56, move_speed = 240}
    };
get_attr(4, 35) ->
    {
        #base_attr{power = 111, anima = 20, energy = 91, concent = 72, method = 38},
        #bt_attr{hp_lim = 3404, mp_lim = 801, inner_att = 270, outer_att = 375, inner_def = 124, outer_def = 174, hit = 333, dodge = 76, crit_hurt = 58, crit_def = 58, move_speed = 240}
    };
get_attr(4, 36) ->
    {
        #base_attr{power = 114, anima = 20, energy = 93, concent = 74, method = 39},
        #bt_attr{hp_lim = 3495, mp_lim = 822, inner_att = 276, outer_att = 383, inner_def = 127, outer_def = 178, hit = 341, dodge = 78, crit_hurt = 59, crit_def = 59, move_speed = 240}
    };
get_attr(4, 37) ->
    {
        #base_attr{power = 117, anima = 21, energy = 96, concent = 76, method = 40},
        #bt_attr{hp_lim = 3586, mp_lim = 843, inner_att = 283, outer_att = 392, inner_def = 130, outer_def = 182, hit = 349, dodge = 80, crit_hurt = 61, crit_def = 61, move_speed = 240}
    };
get_attr(4, 38) ->
    {
        #base_attr{power = 120, anima = 21, energy = 98, concent = 78, method = 41},
        #bt_attr{hp_lim = 3677, mp_lim = 864, inner_att = 289, outer_att = 400, inner_def = 133, outer_def = 186, hit = 357, dodge = 82, crit_hurt = 62, crit_def = 62, move_speed = 240}
    };
get_attr(4, 39) ->
    {
        #base_attr{power = 123, anima = 22, energy = 101, concent = 80, method = 42},
        #bt_attr{hp_lim = 3768, mp_lim = 885, inner_att = 296, outer_att = 409, inner_def = 136, outer_def = 190, hit = 365, dodge = 84, crit_hurt = 64, crit_def = 64, move_speed = 240}
    };
get_attr(4, 40) ->
    {
        #base_attr{power = 126, anima = 22, energy = 103, concent = 82, method = 43},
        #bt_attr{hp_lim = 3859, mp_lim = 906, inner_att = 302, outer_att = 417, inner_def = 139, outer_def = 194, hit = 373, dodge = 86, crit_hurt = 65, crit_def = 65, move_speed = 240}
    };
get_attr(4, 41) ->
    {
        #base_attr{power = 129, anima = 23, energy = 106, concent = 84, method = 44},
        #bt_attr{hp_lim = 3950, mp_lim = 927, inner_att = 309, outer_att = 426, inner_def = 142, outer_def = 198, hit = 381, dodge = 88, crit_hurt = 67, crit_def = 67, move_speed = 240}
    };
get_attr(4, 42) ->
    {
        #base_attr{power = 132, anima = 23, energy = 108, concent = 86, method = 45},
        #bt_attr{hp_lim = 4041, mp_lim = 948, inner_att = 315, outer_att = 434, inner_def = 145, outer_def = 202, hit = 389, dodge = 90, crit_hurt = 68, crit_def = 68, move_speed = 240}
    };
get_attr(4, 43) ->
    {
        #base_attr{power = 135, anima = 24, energy = 111, concent = 88, method = 46},
        #bt_attr{hp_lim = 4132, mp_lim = 969, inner_att = 322, outer_att = 443, inner_def = 148, outer_def = 206, hit = 397, dodge = 92, crit_hurt = 70, crit_def = 70, move_speed = 240}
    };
get_attr(4, 44) ->
    {
        #base_attr{power = 138, anima = 24, energy = 113, concent = 90, method = 47},
        #bt_attr{hp_lim = 4223, mp_lim = 990, inner_att = 328, outer_att = 451, inner_def = 151, outer_def = 210, hit = 405, dodge = 94, crit_hurt = 71, crit_def = 71, move_speed = 240}
    };
get_attr(4, 45) ->
    {
        #base_attr{power = 141, anima = 25, energy = 116, concent = 92, method = 48},
        #bt_attr{hp_lim = 4314, mp_lim = 1011, inner_att = 335, outer_att = 460, inner_def = 154, outer_def = 214, hit = 413, dodge = 96, crit_hurt = 73, crit_def = 73, move_speed = 240}
    };
get_attr(4, 46) ->
    {
        #base_attr{power = 144, anima = 25, energy = 118, concent = 94, method = 49},
        #bt_attr{hp_lim = 4405, mp_lim = 1032, inner_att = 341, outer_att = 468, inner_def = 157, outer_def = 218, hit = 421, dodge = 98, crit_hurt = 74, crit_def = 74, move_speed = 240}
    };
get_attr(4, 47) ->
    {
        #base_attr{power = 147, anima = 26, energy = 121, concent = 96, method = 50},
        #bt_attr{hp_lim = 4496, mp_lim = 1053, inner_att = 348, outer_att = 477, inner_def = 160, outer_def = 222, hit = 429, dodge = 100, crit_hurt = 76, crit_def = 76, move_speed = 240}
    };
get_attr(4, 48) ->
    {
        #base_attr{power = 150, anima = 26, energy = 123, concent = 98, method = 51},
        #bt_attr{hp_lim = 4587, mp_lim = 1074, inner_att = 354, outer_att = 485, inner_def = 163, outer_def = 226, hit = 437, dodge = 102, crit_hurt = 77, crit_def = 77, move_speed = 240}
    };
get_attr(4, 49) ->
    {
        #base_attr{power = 153, anima = 27, energy = 126, concent = 100, method = 52},
        #bt_attr{hp_lim = 4678, mp_lim = 1095, inner_att = 361, outer_att = 494, inner_def = 166, outer_def = 230, hit = 445, dodge = 104, crit_hurt = 79, crit_def = 79, move_speed = 240}
    };
get_attr(4, 50) ->
    {
        #base_attr{power = 156, anima = 27, energy = 128, concent = 102, method = 53},
        #bt_attr{hp_lim = 4769, mp_lim = 1116, inner_att = 367, outer_att = 502, inner_def = 169, outer_def = 234, hit = 453, dodge = 106, crit_hurt = 80, crit_def = 80, move_speed = 240}
    };
get_attr(4, 51) ->
    {
        #base_attr{power = 159, anima = 28, energy = 131, concent = 104, method = 54},
        #bt_attr{hp_lim = 4860, mp_lim = 1137, inner_att = 374, outer_att = 511, inner_def = 172, outer_def = 238, hit = 461, dodge = 108, crit_hurt = 82, crit_def = 82, move_speed = 240}
    };
get_attr(4, 52) ->
    {
        #base_attr{power = 162, anima = 28, energy = 133, concent = 106, method = 55},
        #bt_attr{hp_lim = 4951, mp_lim = 1158, inner_att = 380, outer_att = 519, inner_def = 175, outer_def = 242, hit = 469, dodge = 110, crit_hurt = 83, crit_def = 83, move_speed = 240}
    };
get_attr(4, 53) ->
    {
        #base_attr{power = 165, anima = 29, energy = 136, concent = 108, method = 56},
        #bt_attr{hp_lim = 5042, mp_lim = 1179, inner_att = 387, outer_att = 528, inner_def = 178, outer_def = 246, hit = 477, dodge = 112, crit_hurt = 85, crit_def = 85, move_speed = 240}
    };
get_attr(4, 54) ->
    {
        #base_attr{power = 168, anima = 29, energy = 138, concent = 110, method = 57},
        #bt_attr{hp_lim = 5133, mp_lim = 1200, inner_att = 393, outer_att = 536, inner_def = 181, outer_def = 250, hit = 485, dodge = 114, crit_hurt = 86, crit_def = 86, move_speed = 240}
    };
get_attr(4, 55) ->
    {
        #base_attr{power = 171, anima = 30, energy = 141, concent = 112, method = 58},
        #bt_attr{hp_lim = 5224, mp_lim = 1221, inner_att = 400, outer_att = 545, inner_def = 184, outer_def = 254, hit = 493, dodge = 116, crit_hurt = 88, crit_def = 88, move_speed = 240}
    };
get_attr(4, 56) ->
    {
        #base_attr{power = 174, anima = 30, energy = 143, concent = 114, method = 59},
        #bt_attr{hp_lim = 5315, mp_lim = 1242, inner_att = 406, outer_att = 553, inner_def = 187, outer_def = 258, hit = 501, dodge = 118, crit_hurt = 89, crit_def = 89, move_speed = 240}
    };
get_attr(4, 57) ->
    {
        #base_attr{power = 177, anima = 31, energy = 146, concent = 116, method = 60},
        #bt_attr{hp_lim = 5406, mp_lim = 1263, inner_att = 413, outer_att = 562, inner_def = 190, outer_def = 262, hit = 509, dodge = 120, crit_hurt = 91, crit_def = 91, move_speed = 240}
    };
get_attr(4, 58) ->
    {
        #base_attr{power = 180, anima = 31, energy = 148, concent = 118, method = 61},
        #bt_attr{hp_lim = 5497, mp_lim = 1284, inner_att = 419, outer_att = 570, inner_def = 193, outer_def = 266, hit = 517, dodge = 122, crit_hurt = 92, crit_def = 92, move_speed = 240}
    };
get_attr(4, 59) ->
    {
        #base_attr{power = 183, anima = 32, energy = 151, concent = 120, method = 62},
        #bt_attr{hp_lim = 5588, mp_lim = 1305, inner_att = 426, outer_att = 579, inner_def = 196, outer_def = 270, hit = 525, dodge = 124, crit_hurt = 94, crit_def = 94, move_speed = 240}
    };
get_attr(4, 60) ->
    {
        #base_attr{power = 186, anima = 32, energy = 153, concent = 122, method = 63},
        #bt_attr{hp_lim = 5679, mp_lim = 1326, inner_att = 432, outer_att = 587, inner_def = 199, outer_def = 274, hit = 533, dodge = 126, crit_hurt = 95, crit_def = 95, move_speed = 240}
    };
get_attr(4, 61) ->
    {
        #base_attr{power = 189, anima = 33, energy = 156, concent = 124, method = 64},
        #bt_attr{hp_lim = 5770, mp_lim = 1347, inner_att = 439, outer_att = 596, inner_def = 202, outer_def = 278, hit = 541, dodge = 128, crit_hurt = 97, crit_def = 97, move_speed = 240}
    };
get_attr(4, 62) ->
    {
        #base_attr{power = 192, anima = 33, energy = 158, concent = 126, method = 65},
        #bt_attr{hp_lim = 5861, mp_lim = 1368, inner_att = 445, outer_att = 604, inner_def = 205, outer_def = 282, hit = 549, dodge = 130, crit_hurt = 98, crit_def = 98, move_speed = 240}
    };
get_attr(4, 63) ->
    {
        #base_attr{power = 195, anima = 34, energy = 161, concent = 128, method = 66},
        #bt_attr{hp_lim = 5952, mp_lim = 1389, inner_att = 452, outer_att = 613, inner_def = 208, outer_def = 286, hit = 557, dodge = 132, crit_hurt = 100, crit_def = 100, move_speed = 240}
    };
get_attr(4, 64) ->
    {
        #base_attr{power = 198, anima = 34, energy = 163, concent = 130, method = 67},
        #bt_attr{hp_lim = 6043, mp_lim = 1410, inner_att = 458, outer_att = 621, inner_def = 211, outer_def = 290, hit = 565, dodge = 134, crit_hurt = 101, crit_def = 101, move_speed = 240}
    };
get_attr(4, 65) ->
    {
        #base_attr{power = 201, anima = 35, energy = 166, concent = 132, method = 68},
        #bt_attr{hp_lim = 6134, mp_lim = 1431, inner_att = 465, outer_att = 630, inner_def = 214, outer_def = 294, hit = 573, dodge = 136, crit_hurt = 103, crit_def = 103, move_speed = 240}
    };
get_attr(4, 66) ->
    {
        #base_attr{power = 204, anima = 35, energy = 168, concent = 134, method = 69},
        #bt_attr{hp_lim = 6225, mp_lim = 1452, inner_att = 471, outer_att = 638, inner_def = 217, outer_def = 298, hit = 581, dodge = 138, crit_hurt = 104, crit_def = 104, move_speed = 240}
    };
get_attr(4, 67) ->
    {
        #base_attr{power = 207, anima = 36, energy = 171, concent = 136, method = 70},
        #bt_attr{hp_lim = 6316, mp_lim = 1473, inner_att = 478, outer_att = 647, inner_def = 220, outer_def = 302, hit = 589, dodge = 140, crit_hurt = 106, crit_def = 106, move_speed = 240}
    };
get_attr(4, 68) ->
    {
        #base_attr{power = 210, anima = 36, energy = 173, concent = 138, method = 71},
        #bt_attr{hp_lim = 6407, mp_lim = 1494, inner_att = 484, outer_att = 655, inner_def = 223, outer_def = 306, hit = 597, dodge = 142, crit_hurt = 107, crit_def = 107, move_speed = 240}
    };
get_attr(4, 69) ->
    {
        #base_attr{power = 213, anima = 37, energy = 176, concent = 140, method = 72},
        #bt_attr{hp_lim = 6498, mp_lim = 1515, inner_att = 491, outer_att = 664, inner_def = 226, outer_def = 310, hit = 605, dodge = 144, crit_hurt = 109, crit_def = 109, move_speed = 240}
    };
get_attr(4, 70) ->
    {
        #base_attr{power = 216, anima = 37, energy = 178, concent = 142, method = 73},
        #bt_attr{hp_lim = 6589, mp_lim = 1536, inner_att = 497, outer_att = 672, inner_def = 229, outer_def = 314, hit = 613, dodge = 146, crit_hurt = 110, crit_def = 110, move_speed = 240}
    };
get_attr(4, 71) ->
    {
        #base_attr{power = 219, anima = 38, energy = 181, concent = 144, method = 74},
        #bt_attr{hp_lim = 6680, mp_lim = 1557, inner_att = 504, outer_att = 681, inner_def = 232, outer_def = 318, hit = 621, dodge = 148, crit_hurt = 112, crit_def = 112, move_speed = 240}
    };
get_attr(4, 72) ->
    {
        #base_attr{power = 222, anima = 38, energy = 183, concent = 146, method = 75},
        #bt_attr{hp_lim = 6771, mp_lim = 1578, inner_att = 510, outer_att = 689, inner_def = 235, outer_def = 322, hit = 629, dodge = 150, crit_hurt = 113, crit_def = 113, move_speed = 240}
    };
get_attr(4, 73) ->
    {
        #base_attr{power = 225, anima = 39, energy = 186, concent = 148, method = 76},
        #bt_attr{hp_lim = 6862, mp_lim = 1599, inner_att = 517, outer_att = 698, inner_def = 238, outer_def = 326, hit = 637, dodge = 152, crit_hurt = 115, crit_def = 115, move_speed = 240}
    };
get_attr(4, 74) ->
    {
        #base_attr{power = 228, anima = 39, energy = 188, concent = 150, method = 77},
        #bt_attr{hp_lim = 6953, mp_lim = 1620, inner_att = 523, outer_att = 706, inner_def = 241, outer_def = 330, hit = 645, dodge = 154, crit_hurt = 116, crit_def = 116, move_speed = 240}
    };
get_attr(4, 75) ->
    {
        #base_attr{power = 231, anima = 40, energy = 191, concent = 152, method = 78},
        #bt_attr{hp_lim = 7044, mp_lim = 1641, inner_att = 530, outer_att = 715, inner_def = 244, outer_def = 334, hit = 653, dodge = 156, crit_hurt = 118, crit_def = 118, move_speed = 240}
    };
get_attr(4, 76) ->
    {
        #base_attr{power = 234, anima = 40, energy = 193, concent = 154, method = 79},
        #bt_attr{hp_lim = 7135, mp_lim = 1662, inner_att = 536, outer_att = 723, inner_def = 247, outer_def = 338, hit = 661, dodge = 158, crit_hurt = 119, crit_def = 119, move_speed = 240}
    };
get_attr(4, 77) ->
    {
        #base_attr{power = 237, anima = 41, energy = 196, concent = 156, method = 80},
        #bt_attr{hp_lim = 7226, mp_lim = 1683, inner_att = 543, outer_att = 732, inner_def = 250, outer_def = 342, hit = 669, dodge = 160, crit_hurt = 121, crit_def = 121, move_speed = 240}
    };
get_attr(4, 78) ->
    {
        #base_attr{power = 240, anima = 41, energy = 198, concent = 158, method = 81},
        #bt_attr{hp_lim = 7317, mp_lim = 1704, inner_att = 549, outer_att = 740, inner_def = 253, outer_def = 346, hit = 677, dodge = 162, crit_hurt = 122, crit_def = 122, move_speed = 240}
    };
get_attr(4, 79) ->
    {
        #base_attr{power = 243, anima = 42, energy = 201, concent = 160, method = 82},
        #bt_attr{hp_lim = 7408, mp_lim = 1725, inner_att = 556, outer_att = 749, inner_def = 256, outer_def = 350, hit = 685, dodge = 164, crit_hurt = 124, crit_def = 124, move_speed = 240}
    };
get_attr(4, 80) ->
    {
        #base_attr{power = 246, anima = 42, energy = 203, concent = 162, method = 83},
        #bt_attr{hp_lim = 7499, mp_lim = 1746, inner_att = 562, outer_att = 757, inner_def = 259, outer_def = 354, hit = 693, dodge = 166, crit_hurt = 125, crit_def = 125, move_speed = 240}
    };
get_attr(4, 81) ->
    {
        #base_attr{power = 249, anima = 43, energy = 206, concent = 164, method = 84},
        #bt_attr{hp_lim = 7590, mp_lim = 1767, inner_att = 569, outer_att = 766, inner_def = 262, outer_def = 358, hit = 701, dodge = 168, crit_hurt = 127, crit_def = 127, move_speed = 240}
    };
get_attr(4, 82) ->
    {
        #base_attr{power = 252, anima = 43, energy = 208, concent = 166, method = 85},
        #bt_attr{hp_lim = 7681, mp_lim = 1788, inner_att = 575, outer_att = 774, inner_def = 265, outer_def = 362, hit = 709, dodge = 170, crit_hurt = 128, crit_def = 128, move_speed = 240}
    };
get_attr(4, 83) ->
    {
        #base_attr{power = 255, anima = 44, energy = 211, concent = 168, method = 86},
        #bt_attr{hp_lim = 7772, mp_lim = 1809, inner_att = 582, outer_att = 783, inner_def = 268, outer_def = 366, hit = 717, dodge = 172, crit_hurt = 130, crit_def = 130, move_speed = 240}
    };
get_attr(4, 84) ->
    {
        #base_attr{power = 258, anima = 44, energy = 213, concent = 170, method = 87},
        #bt_attr{hp_lim = 7863, mp_lim = 1830, inner_att = 588, outer_att = 791, inner_def = 271, outer_def = 370, hit = 725, dodge = 174, crit_hurt = 131, crit_def = 131, move_speed = 240}
    };
get_attr(4, 85) ->
    {
        #base_attr{power = 261, anima = 45, energy = 216, concent = 172, method = 88},
        #bt_attr{hp_lim = 7954, mp_lim = 1851, inner_att = 595, outer_att = 800, inner_def = 274, outer_def = 374, hit = 733, dodge = 176, crit_hurt = 133, crit_def = 133, move_speed = 240}
    };
get_attr(4, 86) ->
    {
        #base_attr{power = 264, anima = 45, energy = 218, concent = 174, method = 89},
        #bt_attr{hp_lim = 8045, mp_lim = 1872, inner_att = 601, outer_att = 808, inner_def = 277, outer_def = 378, hit = 741, dodge = 178, crit_hurt = 134, crit_def = 134, move_speed = 240}
    };
get_attr(4, 87) ->
    {
        #base_attr{power = 267, anima = 46, energy = 221, concent = 176, method = 90},
        #bt_attr{hp_lim = 8136, mp_lim = 1893, inner_att = 608, outer_att = 817, inner_def = 280, outer_def = 382, hit = 749, dodge = 180, crit_hurt = 136, crit_def = 136, move_speed = 240}
    };
get_attr(4, 88) ->
    {
        #base_attr{power = 270, anima = 46, energy = 223, concent = 178, method = 91},
        #bt_attr{hp_lim = 8227, mp_lim = 1914, inner_att = 614, outer_att = 825, inner_def = 283, outer_def = 386, hit = 757, dodge = 182, crit_hurt = 137, crit_def = 137, move_speed = 240}
    };
get_attr(4, 89) ->
    {
        #base_attr{power = 273, anima = 47, energy = 226, concent = 180, method = 92},
        #bt_attr{hp_lim = 8318, mp_lim = 1935, inner_att = 621, outer_att = 834, inner_def = 286, outer_def = 390, hit = 765, dodge = 184, crit_hurt = 139, crit_def = 139, move_speed = 240}
    };
get_attr(4, 90) ->
    {
        #base_attr{power = 276, anima = 47, energy = 228, concent = 182, method = 93},
        #bt_attr{hp_lim = 8409, mp_lim = 1956, inner_att = 627, outer_att = 842, inner_def = 289, outer_def = 394, hit = 773, dodge = 186, crit_hurt = 140, crit_def = 140, move_speed = 240}
    };
get_attr(4, 91) ->
    {
        #base_attr{power = 279, anima = 48, energy = 231, concent = 184, method = 94},
        #bt_attr{hp_lim = 8500, mp_lim = 1977, inner_att = 634, outer_att = 851, inner_def = 292, outer_def = 398, hit = 781, dodge = 188, crit_hurt = 142, crit_def = 142, move_speed = 240}
    };
get_attr(4, 92) ->
    {
        #base_attr{power = 282, anima = 48, energy = 233, concent = 186, method = 95},
        #bt_attr{hp_lim = 8591, mp_lim = 1998, inner_att = 640, outer_att = 859, inner_def = 295, outer_def = 402, hit = 789, dodge = 190, crit_hurt = 143, crit_def = 143, move_speed = 240}
    };
get_attr(4, 93) ->
    {
        #base_attr{power = 285, anima = 49, energy = 236, concent = 188, method = 96},
        #bt_attr{hp_lim = 8682, mp_lim = 2019, inner_att = 647, outer_att = 868, inner_def = 298, outer_def = 406, hit = 797, dodge = 192, crit_hurt = 145, crit_def = 145, move_speed = 240}
    };
get_attr(4, 94) ->
    {
        #base_attr{power = 288, anima = 49, energy = 238, concent = 190, method = 97},
        #bt_attr{hp_lim = 8773, mp_lim = 2040, inner_att = 653, outer_att = 876, inner_def = 301, outer_def = 410, hit = 805, dodge = 194, crit_hurt = 146, crit_def = 146, move_speed = 240}
    };
get_attr(4, 95) ->
    {
        #base_attr{power = 291, anima = 50, energy = 241, concent = 192, method = 98},
        #bt_attr{hp_lim = 8864, mp_lim = 2061, inner_att = 660, outer_att = 885, inner_def = 304, outer_def = 414, hit = 813, dodge = 196, crit_hurt = 148, crit_def = 148, move_speed = 240}
    };
get_attr(4, 96) ->
    {
        #base_attr{power = 294, anima = 50, energy = 243, concent = 194, method = 99},
        #bt_attr{hp_lim = 8955, mp_lim = 2082, inner_att = 666, outer_att = 893, inner_def = 307, outer_def = 418, hit = 821, dodge = 198, crit_hurt = 149, crit_def = 149, move_speed = 240}
    };
get_attr(4, 97) ->
    {
        #base_attr{power = 297, anima = 51, energy = 246, concent = 196, method = 100},
        #bt_attr{hp_lim = 9046, mp_lim = 2103, inner_att = 673, outer_att = 902, inner_def = 310, outer_def = 422, hit = 829, dodge = 200, crit_hurt = 151, crit_def = 151, move_speed = 240}
    };
get_attr(4, 98) ->
    {
        #base_attr{power = 300, anima = 51, energy = 248, concent = 198, method = 101},
        #bt_attr{hp_lim = 9137, mp_lim = 2124, inner_att = 679, outer_att = 910, inner_def = 313, outer_def = 426, hit = 837, dodge = 202, crit_hurt = 152, crit_def = 152, move_speed = 240}
    };
get_attr(4, 99) ->
    {
        #base_attr{power = 303, anima = 52, energy = 251, concent = 200, method = 102},
        #bt_attr{hp_lim = 9228, mp_lim = 2145, inner_att = 686, outer_att = 919, inner_def = 316, outer_def = 430, hit = 845, dodge = 204, crit_hurt = 154, crit_def = 154, move_speed = 240}
    };
get_attr(4, 100) ->
    {
        #base_attr{power = 306, anima = 52, energy = 253, concent = 202, method = 103},
        #bt_attr{hp_lim = 9319, mp_lim = 2166, inner_att = 692, outer_att = 927, inner_def = 319, outer_def = 434, hit = 853, dodge = 206, crit_hurt = 155, crit_def = 155, move_speed = 240}
    };
get_attr(4, 101) ->
    {
        #base_attr{power = 309, anima = 53, energy = 256, concent = 204, method = 104},
        #bt_attr{hp_lim = 9410, mp_lim = 2187, inner_att = 699, outer_att = 936, inner_def = 322, outer_def = 438, hit = 861, dodge = 208, crit_hurt = 157, crit_def = 157, move_speed = 240}
    };
get_attr(4, 102) ->
    {
        #base_attr{power = 312, anima = 53, energy = 258, concent = 206, method = 105},
        #bt_attr{hp_lim = 9501, mp_lim = 2208, inner_att = 705, outer_att = 944, inner_def = 325, outer_def = 442, hit = 869, dodge = 210, crit_hurt = 158, crit_def = 158, move_speed = 240}
    };
get_attr(4, 103) ->
    {
        #base_attr{power = 315, anima = 54, energy = 261, concent = 208, method = 106},
        #bt_attr{hp_lim = 9592, mp_lim = 2229, inner_att = 712, outer_att = 953, inner_def = 328, outer_def = 446, hit = 877, dodge = 212, crit_hurt = 160, crit_def = 160, move_speed = 240}
    };
get_attr(4, 104) ->
    {
        #base_attr{power = 318, anima = 54, energy = 263, concent = 210, method = 107},
        #bt_attr{hp_lim = 9683, mp_lim = 2250, inner_att = 718, outer_att = 961, inner_def = 331, outer_def = 450, hit = 885, dodge = 214, crit_hurt = 161, crit_def = 161, move_speed = 240}
    };
get_attr(4, 105) ->
    {
        #base_attr{power = 321, anima = 55, energy = 266, concent = 212, method = 108},
        #bt_attr{hp_lim = 9774, mp_lim = 2271, inner_att = 725, outer_att = 970, inner_def = 334, outer_def = 454, hit = 893, dodge = 216, crit_hurt = 163, crit_def = 163, move_speed = 240}
    };
get_attr(4, 106) ->
    {
        #base_attr{power = 324, anima = 55, energy = 268, concent = 214, method = 109},
        #bt_attr{hp_lim = 9865, mp_lim = 2292, inner_att = 731, outer_att = 978, inner_def = 337, outer_def = 458, hit = 901, dodge = 218, crit_hurt = 164, crit_def = 164, move_speed = 240}
    };
get_attr(4, 107) ->
    {
        #base_attr{power = 327, anima = 56, energy = 271, concent = 216, method = 110},
        #bt_attr{hp_lim = 9956, mp_lim = 2313, inner_att = 738, outer_att = 987, inner_def = 340, outer_def = 462, hit = 909, dodge = 220, crit_hurt = 166, crit_def = 166, move_speed = 240}
    };
get_attr(4, 108) ->
    {
        #base_attr{power = 330, anima = 56, energy = 273, concent = 218, method = 111},
        #bt_attr{hp_lim = 10047, mp_lim = 2334, inner_att = 744, outer_att = 995, inner_def = 343, outer_def = 466, hit = 917, dodge = 222, crit_hurt = 167, crit_def = 167, move_speed = 240}
    };
get_attr(4, 109) ->
    {
        #base_attr{power = 333, anima = 57, energy = 276, concent = 220, method = 112},
        #bt_attr{hp_lim = 10138, mp_lim = 2355, inner_att = 751, outer_att = 1004, inner_def = 346, outer_def = 470, hit = 925, dodge = 224, crit_hurt = 169, crit_def = 169, move_speed = 240}
    };
get_attr(4, 110) ->
    {
        #base_attr{power = 336, anima = 57, energy = 278, concent = 222, method = 113},
        #bt_attr{hp_lim = 10229, mp_lim = 2376, inner_att = 757, outer_att = 1012, inner_def = 349, outer_def = 474, hit = 933, dodge = 226, crit_hurt = 170, crit_def = 170, move_speed = 240}
    };
get_attr(4, 111) ->
    {
        #base_attr{power = 339, anima = 58, energy = 281, concent = 224, method = 114},
        #bt_attr{hp_lim = 10320, mp_lim = 2397, inner_att = 764, outer_att = 1021, inner_def = 352, outer_def = 478, hit = 941, dodge = 228, crit_hurt = 172, crit_def = 172, move_speed = 240}
    };
get_attr(4, 112) ->
    {
        #base_attr{power = 342, anima = 58, energy = 283, concent = 226, method = 115},
        #bt_attr{hp_lim = 10411, mp_lim = 2418, inner_att = 770, outer_att = 1029, inner_def = 355, outer_def = 482, hit = 949, dodge = 230, crit_hurt = 173, crit_def = 173, move_speed = 240}
    };
get_attr(4, 113) ->
    {
        #base_attr{power = 345, anima = 59, energy = 286, concent = 228, method = 116},
        #bt_attr{hp_lim = 10502, mp_lim = 2439, inner_att = 777, outer_att = 1038, inner_def = 358, outer_def = 486, hit = 957, dodge = 232, crit_hurt = 175, crit_def = 175, move_speed = 240}
    };
get_attr(4, 114) ->
    {
        #base_attr{power = 348, anima = 59, energy = 288, concent = 230, method = 117},
        #bt_attr{hp_lim = 10593, mp_lim = 2460, inner_att = 783, outer_att = 1046, inner_def = 361, outer_def = 490, hit = 965, dodge = 234, crit_hurt = 176, crit_def = 176, move_speed = 240}
    };
get_attr(4, 115) ->
    {
        #base_attr{power = 351, anima = 60, energy = 291, concent = 232, method = 118},
        #bt_attr{hp_lim = 10684, mp_lim = 2481, inner_att = 790, outer_att = 1055, inner_def = 364, outer_def = 494, hit = 973, dodge = 236, crit_hurt = 178, crit_def = 178, move_speed = 240}
    };
get_attr(4, 116) ->
    {
        #base_attr{power = 354, anima = 60, energy = 293, concent = 234, method = 119},
        #bt_attr{hp_lim = 10775, mp_lim = 2502, inner_att = 796, outer_att = 1063, inner_def = 367, outer_def = 498, hit = 981, dodge = 238, crit_hurt = 179, crit_def = 179, move_speed = 240}
    };
get_attr(4, 117) ->
    {
        #base_attr{power = 357, anima = 61, energy = 296, concent = 236, method = 120},
        #bt_attr{hp_lim = 10866, mp_lim = 2523, inner_att = 803, outer_att = 1072, inner_def = 370, outer_def = 502, hit = 989, dodge = 240, crit_hurt = 181, crit_def = 181, move_speed = 240}
    };
get_attr(4, 118) ->
    {
        #base_attr{power = 360, anima = 61, energy = 298, concent = 238, method = 121},
        #bt_attr{hp_lim = 10957, mp_lim = 2544, inner_att = 809, outer_att = 1080, inner_def = 373, outer_def = 506, hit = 997, dodge = 242, crit_hurt = 182, crit_def = 182, move_speed = 240}
    };
get_attr(4, 119) ->
    {
        #base_attr{power = 363, anima = 62, energy = 301, concent = 240, method = 122},
        #bt_attr{hp_lim = 11048, mp_lim = 2565, inner_att = 816, outer_att = 1089, inner_def = 376, outer_def = 510, hit = 1005, dodge = 244, crit_hurt = 184, crit_def = 184, move_speed = 240}
    };
get_attr(4, 120) ->
    {
        #base_attr{power = 366, anima = 62, energy = 303, concent = 242, method = 123},
        #bt_attr{hp_lim = 11139, mp_lim = 2586, inner_att = 822, outer_att = 1097, inner_def = 379, outer_def = 514, hit = 1013, dodge = 246, crit_hurt = 185, crit_def = 185, move_speed = 240}
    };
get_attr(4, 121) ->
    {
        #base_attr{power = 369, anima = 63, energy = 306, concent = 244, method = 124},
        #bt_attr{hp_lim = 11230, mp_lim = 2607, inner_att = 829, outer_att = 1106, inner_def = 382, outer_def = 518, hit = 1021, dodge = 248, crit_hurt = 187, crit_def = 187, move_speed = 240}
    };
get_attr(4, 122) ->
    {
        #base_attr{power = 372, anima = 63, energy = 308, concent = 246, method = 125},
        #bt_attr{hp_lim = 11321, mp_lim = 2628, inner_att = 835, outer_att = 1114, inner_def = 385, outer_def = 522, hit = 1029, dodge = 250, crit_hurt = 188, crit_def = 188, move_speed = 240}
    };
get_attr(4, 123) ->
    {
        #base_attr{power = 375, anima = 64, energy = 311, concent = 248, method = 126},
        #bt_attr{hp_lim = 11412, mp_lim = 2649, inner_att = 842, outer_att = 1123, inner_def = 388, outer_def = 526, hit = 1037, dodge = 252, crit_hurt = 190, crit_def = 190, move_speed = 240}
    };
get_attr(4, 124) ->
    {
        #base_attr{power = 378, anima = 64, energy = 313, concent = 250, method = 127},
        #bt_attr{hp_lim = 11503, mp_lim = 2670, inner_att = 848, outer_att = 1131, inner_def = 391, outer_def = 530, hit = 1045, dodge = 254, crit_hurt = 191, crit_def = 191, move_speed = 240}
    };
get_attr(4, 125) ->
    {
        #base_attr{power = 381, anima = 65, energy = 316, concent = 252, method = 128},
        #bt_attr{hp_lim = 11594, mp_lim = 2691, inner_att = 855, outer_att = 1140, inner_def = 394, outer_def = 534, hit = 1053, dodge = 256, crit_hurt = 193, crit_def = 193, move_speed = 240}
    };
get_attr(4, 126) ->
    {
        #base_attr{power = 384, anima = 65, energy = 318, concent = 254, method = 129},
        #bt_attr{hp_lim = 11685, mp_lim = 2712, inner_att = 861, outer_att = 1148, inner_def = 397, outer_def = 538, hit = 1061, dodge = 258, crit_hurt = 194, crit_def = 194, move_speed = 240}
    };
get_attr(4, 127) ->
    {
        #base_attr{power = 387, anima = 66, energy = 321, concent = 256, method = 130},
        #bt_attr{hp_lim = 11776, mp_lim = 2733, inner_att = 868, outer_att = 1157, inner_def = 400, outer_def = 542, hit = 1069, dodge = 260, crit_hurt = 196, crit_def = 196, move_speed = 240}
    };
get_attr(4, 128) ->
    {
        #base_attr{power = 390, anima = 66, energy = 323, concent = 258, method = 131},
        #bt_attr{hp_lim = 11867, mp_lim = 2754, inner_att = 874, outer_att = 1165, inner_def = 403, outer_def = 546, hit = 1077, dodge = 262, crit_hurt = 197, crit_def = 197, move_speed = 240}
    };
get_attr(4, 129) ->
    {
        #base_attr{power = 393, anima = 67, energy = 326, concent = 260, method = 132},
        #bt_attr{hp_lim = 11958, mp_lim = 2775, inner_att = 881, outer_att = 1174, inner_def = 406, outer_def = 550, hit = 1085, dodge = 264, crit_hurt = 199, crit_def = 199, move_speed = 240}
    };
get_attr(4, 130) ->
    {
        #base_attr{power = 396, anima = 67, energy = 328, concent = 262, method = 133},
        #bt_attr{hp_lim = 12049, mp_lim = 2796, inner_att = 887, outer_att = 1182, inner_def = 409, outer_def = 554, hit = 1093, dodge = 266, crit_hurt = 200, crit_def = 200, move_speed = 240}
    };
get_attr(4, 131) ->
    {
        #base_attr{power = 399, anima = 68, energy = 331, concent = 264, method = 134},
        #bt_attr{hp_lim = 12140, mp_lim = 2817, inner_att = 894, outer_att = 1191, inner_def = 412, outer_def = 558, hit = 1101, dodge = 268, crit_hurt = 202, crit_def = 202, move_speed = 240}
    };
get_attr(4, 132) ->
    {
        #base_attr{power = 402, anima = 68, energy = 333, concent = 266, method = 135},
        #bt_attr{hp_lim = 12231, mp_lim = 2838, inner_att = 900, outer_att = 1199, inner_def = 415, outer_def = 562, hit = 1109, dodge = 270, crit_hurt = 203, crit_def = 203, move_speed = 240}
    };
get_attr(4, 133) ->
    {
        #base_attr{power = 405, anima = 69, energy = 336, concent = 268, method = 136},
        #bt_attr{hp_lim = 12322, mp_lim = 2859, inner_att = 907, outer_att = 1208, inner_def = 418, outer_def = 566, hit = 1117, dodge = 272, crit_hurt = 205, crit_def = 205, move_speed = 240}
    };
get_attr(4, 134) ->
    {
        #base_attr{power = 408, anima = 69, energy = 338, concent = 270, method = 137},
        #bt_attr{hp_lim = 12413, mp_lim = 2880, inner_att = 913, outer_att = 1216, inner_def = 421, outer_def = 570, hit = 1125, dodge = 274, crit_hurt = 206, crit_def = 206, move_speed = 240}
    };
get_attr(4, 135) ->
    {
        #base_attr{power = 411, anima = 70, energy = 341, concent = 272, method = 138},
        #bt_attr{hp_lim = 12504, mp_lim = 2901, inner_att = 920, outer_att = 1225, inner_def = 424, outer_def = 574, hit = 1133, dodge = 276, crit_hurt = 208, crit_def = 208, move_speed = 240}
    };
get_attr(4, 136) ->
    {
        #base_attr{power = 414, anima = 70, energy = 343, concent = 274, method = 139},
        #bt_attr{hp_lim = 12595, mp_lim = 2922, inner_att = 926, outer_att = 1233, inner_def = 427, outer_def = 578, hit = 1141, dodge = 278, crit_hurt = 209, crit_def = 209, move_speed = 240}
    };
get_attr(4, 137) ->
    {
        #base_attr{power = 417, anima = 71, energy = 346, concent = 276, method = 140},
        #bt_attr{hp_lim = 12686, mp_lim = 2943, inner_att = 933, outer_att = 1242, inner_def = 430, outer_def = 582, hit = 1149, dodge = 280, crit_hurt = 211, crit_def = 211, move_speed = 240}
    };
get_attr(4, 138) ->
    {
        #base_attr{power = 420, anima = 71, energy = 348, concent = 278, method = 141},
        #bt_attr{hp_lim = 12777, mp_lim = 2964, inner_att = 939, outer_att = 1250, inner_def = 433, outer_def = 586, hit = 1157, dodge = 282, crit_hurt = 212, crit_def = 212, move_speed = 240}
    };
get_attr(4, 139) ->
    {
        #base_attr{power = 423, anima = 72, energy = 351, concent = 280, method = 142},
        #bt_attr{hp_lim = 12868, mp_lim = 2985, inner_att = 946, outer_att = 1259, inner_def = 436, outer_def = 590, hit = 1165, dodge = 284, crit_hurt = 214, crit_def = 214, move_speed = 240}
    };
get_attr(4, 140) ->
    {
        #base_attr{power = 426, anima = 72, energy = 353, concent = 282, method = 143},
        #bt_attr{hp_lim = 12959, mp_lim = 3006, inner_att = 952, outer_att = 1267, inner_def = 439, outer_def = 594, hit = 1173, dodge = 286, crit_hurt = 215, crit_def = 215, move_speed = 240}
    };
get_attr(4, 141) ->
    {
        #base_attr{power = 429, anima = 73, energy = 356, concent = 284, method = 144},
        #bt_attr{hp_lim = 13050, mp_lim = 3027, inner_att = 959, outer_att = 1276, inner_def = 442, outer_def = 598, hit = 1181, dodge = 288, crit_hurt = 217, crit_def = 217, move_speed = 240}
    };
get_attr(4, 142) ->
    {
        #base_attr{power = 432, anima = 73, energy = 358, concent = 286, method = 145},
        #bt_attr{hp_lim = 13141, mp_lim = 3048, inner_att = 965, outer_att = 1284, inner_def = 445, outer_def = 602, hit = 1189, dodge = 290, crit_hurt = 218, crit_def = 218, move_speed = 240}
    };
get_attr(4, 143) ->
    {
        #base_attr{power = 435, anima = 74, energy = 361, concent = 288, method = 146},
        #bt_attr{hp_lim = 13232, mp_lim = 3069, inner_att = 972, outer_att = 1293, inner_def = 448, outer_def = 606, hit = 1197, dodge = 292, crit_hurt = 220, crit_def = 220, move_speed = 240}
    };
get_attr(4, 144) ->
    {
        #base_attr{power = 438, anima = 74, energy = 363, concent = 290, method = 147},
        #bt_attr{hp_lim = 13323, mp_lim = 3090, inner_att = 978, outer_att = 1301, inner_def = 451, outer_def = 610, hit = 1205, dodge = 294, crit_hurt = 221, crit_def = 221, move_speed = 240}
    };
get_attr(4, 145) ->
    {
        #base_attr{power = 441, anima = 75, energy = 366, concent = 292, method = 148},
        #bt_attr{hp_lim = 13414, mp_lim = 3111, inner_att = 985, outer_att = 1310, inner_def = 454, outer_def = 614, hit = 1213, dodge = 296, crit_hurt = 223, crit_def = 223, move_speed = 240}
    };
get_attr(4, 146) ->
    {
        #base_attr{power = 444, anima = 75, energy = 368, concent = 294, method = 149},
        #bt_attr{hp_lim = 13505, mp_lim = 3132, inner_att = 991, outer_att = 1318, inner_def = 457, outer_def = 618, hit = 1221, dodge = 298, crit_hurt = 224, crit_def = 224, move_speed = 240}
    };
get_attr(4, 147) ->
    {
        #base_attr{power = 447, anima = 76, energy = 371, concent = 296, method = 150},
        #bt_attr{hp_lim = 13596, mp_lim = 3153, inner_att = 998, outer_att = 1327, inner_def = 460, outer_def = 622, hit = 1229, dodge = 300, crit_hurt = 226, crit_def = 226, move_speed = 240}
    };
get_attr(4, 148) ->
    {
        #base_attr{power = 450, anima = 76, energy = 373, concent = 298, method = 151},
        #bt_attr{hp_lim = 13687, mp_lim = 3174, inner_att = 1004, outer_att = 1335, inner_def = 463, outer_def = 626, hit = 1237, dodge = 302, crit_hurt = 227, crit_def = 227, move_speed = 240}
    };
get_attr(4, 149) ->
    {
        #base_attr{power = 453, anima = 77, energy = 376, concent = 300, method = 152},
        #bt_attr{hp_lim = 13778, mp_lim = 3195, inner_att = 1011, outer_att = 1344, inner_def = 466, outer_def = 630, hit = 1245, dodge = 304, crit_hurt = 229, crit_def = 229, move_speed = 240}
    };
get_attr(4, 150) ->
    {
        #base_attr{power = 456, anima = 77, energy = 378, concent = 302, method = 153},
        #bt_attr{hp_lim = 13869, mp_lim = 3216, inner_att = 1017, outer_att = 1352, inner_def = 469, outer_def = 634, hit = 1253, dodge = 306, crit_hurt = 230, crit_def = 230, move_speed = 240}
    };
get_attr(5, 1) ->
    {
        #base_attr{power = 2, anima = 9, energy = 5, concent = 3, method = 5},
        #bt_attr{hp_lim = 300, mp_lim = 84, inner_att = 22, outer_att = 31, inner_def = 48, outer_def = 84, hit = 58, dodge = 10, crit_hurt = 9, crit_def = 7, move_speed = 240}
    };
get_attr(5, 2) ->
    {
        #base_attr{power = 2, anima = 12, energy = 7, concent = 5, method = 6},
        #bt_attr{hp_lim = 390, mp_lim = 108, inner_att = 25, outer_att = 34, inner_def = 55, outer_def = 93, hit = 65, dodge = 11, crit_hurt = 10, crit_def = 7, move_speed = 240}
    };
get_attr(5, 3) ->
    {
        #base_attr{power = 3, anima = 15, energy = 10, concent = 8, method = 7},
        #bt_attr{hp_lim = 480, mp_lim = 132, inner_att = 28, outer_att = 38, inner_def = 63, outer_def = 102, hit = 73, dodge = 13, crit_hurt = 11, crit_def = 8, move_speed = 240}
    };
get_attr(5, 4) ->
    {
        #base_attr{power = 3, anima = 18, energy = 12, concent = 10, method = 8},
        #bt_attr{hp_lim = 570, mp_lim = 156, inner_att = 31, outer_att = 41, inner_def = 70, outer_def = 111, hit = 80, dodge = 14, crit_hurt = 12, crit_def = 8, move_speed = 240}
    };
get_attr(5, 5) ->
    {
        #base_attr{power = 4, anima = 21, energy = 15, concent = 13, method = 9},
        #bt_attr{hp_lim = 660, mp_lim = 180, inner_att = 34, outer_att = 45, inner_def = 78, outer_def = 120, hit = 88, dodge = 16, crit_hurt = 13, crit_def = 9, move_speed = 240}
    };
get_attr(5, 6) ->
    {
        #base_attr{power = 4, anima = 24, energy = 17, concent = 15, method = 10},
        #bt_attr{hp_lim = 750, mp_lim = 204, inner_att = 37, outer_att = 48, inner_def = 85, outer_def = 129, hit = 95, dodge = 17, crit_hurt = 14, crit_def = 9, move_speed = 240}
    };
get_attr(5, 7) ->
    {
        #base_attr{power = 5, anima = 27, energy = 20, concent = 18, method = 11},
        #bt_attr{hp_lim = 840, mp_lim = 228, inner_att = 40, outer_att = 52, inner_def = 93, outer_def = 138, hit = 103, dodge = 19, crit_hurt = 15, crit_def = 10, move_speed = 240}
    };
get_attr(5, 8) ->
    {
        #base_attr{power = 5, anima = 30, energy = 22, concent = 20, method = 12},
        #bt_attr{hp_lim = 930, mp_lim = 252, inner_att = 43, outer_att = 55, inner_def = 100, outer_def = 147, hit = 110, dodge = 20, crit_hurt = 16, crit_def = 10, move_speed = 240}
    };
get_attr(5, 9) ->
    {
        #base_attr{power = 6, anima = 33, energy = 25, concent = 23, method = 13},
        #bt_attr{hp_lim = 1020, mp_lim = 276, inner_att = 46, outer_att = 59, inner_def = 108, outer_def = 156, hit = 118, dodge = 22, crit_hurt = 17, crit_def = 11, move_speed = 240}
    };
get_attr(5, 10) ->
    {
        #base_attr{power = 6, anima = 36, energy = 27, concent = 25, method = 14},
        #bt_attr{hp_lim = 1110, mp_lim = 300, inner_att = 49, outer_att = 62, inner_def = 115, outer_def = 165, hit = 125, dodge = 23, crit_hurt = 18, crit_def = 11, move_speed = 240}
    };
get_attr(5, 11) ->
    {
        #base_attr{power = 7, anima = 39, energy = 30, concent = 28, method = 15},
        #bt_attr{hp_lim = 1200, mp_lim = 324, inner_att = 52, outer_att = 66, inner_def = 123, outer_def = 174, hit = 133, dodge = 25, crit_hurt = 19, crit_def = 12, move_speed = 240}
    };
get_attr(5, 12) ->
    {
        #base_attr{power = 7, anima = 42, energy = 32, concent = 30, method = 16},
        #bt_attr{hp_lim = 1290, mp_lim = 348, inner_att = 55, outer_att = 69, inner_def = 130, outer_def = 183, hit = 140, dodge = 26, crit_hurt = 20, crit_def = 12, move_speed = 240}
    };
get_attr(5, 13) ->
    {
        #base_attr{power = 8, anima = 45, energy = 35, concent = 33, method = 17},
        #bt_attr{hp_lim = 1380, mp_lim = 372, inner_att = 58, outer_att = 73, inner_def = 138, outer_def = 192, hit = 148, dodge = 28, crit_hurt = 21, crit_def = 13, move_speed = 240}
    };
get_attr(5, 14) ->
    {
        #base_attr{power = 8, anima = 48, energy = 37, concent = 35, method = 18},
        #bt_attr{hp_lim = 1470, mp_lim = 396, inner_att = 61, outer_att = 76, inner_def = 145, outer_def = 201, hit = 155, dodge = 29, crit_hurt = 22, crit_def = 13, move_speed = 240}
    };
get_attr(5, 15) ->
    {
        #base_attr{power = 9, anima = 51, energy = 40, concent = 38, method = 19},
        #bt_attr{hp_lim = 1560, mp_lim = 420, inner_att = 64, outer_att = 80, inner_def = 153, outer_def = 210, hit = 163, dodge = 31, crit_hurt = 23, crit_def = 14, move_speed = 240}
    };
get_attr(5, 16) ->
    {
        #base_attr{power = 9, anima = 54, energy = 42, concent = 40, method = 20},
        #bt_attr{hp_lim = 1650, mp_lim = 444, inner_att = 67, outer_att = 83, inner_def = 160, outer_def = 219, hit = 170, dodge = 32, crit_hurt = 24, crit_def = 14, move_speed = 240}
    };
get_attr(5, 17) ->
    {
        #base_attr{power = 10, anima = 57, energy = 45, concent = 43, method = 21},
        #bt_attr{hp_lim = 1740, mp_lim = 468, inner_att = 70, outer_att = 87, inner_def = 168, outer_def = 228, hit = 178, dodge = 34, crit_hurt = 25, crit_def = 15, move_speed = 240}
    };
get_attr(5, 18) ->
    {
        #base_attr{power = 10, anima = 60, energy = 47, concent = 45, method = 22},
        #bt_attr{hp_lim = 1830, mp_lim = 492, inner_att = 73, outer_att = 90, inner_def = 175, outer_def = 237, hit = 185, dodge = 35, crit_hurt = 26, crit_def = 15, move_speed = 240}
    };
get_attr(5, 19) ->
    {
        #base_attr{power = 11, anima = 63, energy = 50, concent = 48, method = 23},
        #bt_attr{hp_lim = 1920, mp_lim = 516, inner_att = 76, outer_att = 94, inner_def = 183, outer_def = 246, hit = 193, dodge = 37, crit_hurt = 27, crit_def = 16, move_speed = 240}
    };
get_attr(5, 20) ->
    {
        #base_attr{power = 11, anima = 66, energy = 52, concent = 50, method = 24},
        #bt_attr{hp_lim = 2010, mp_lim = 540, inner_att = 79, outer_att = 97, inner_def = 190, outer_def = 255, hit = 200, dodge = 38, crit_hurt = 28, crit_def = 16, move_speed = 240}
    };
get_attr(5, 21) ->
    {
        #base_attr{power = 12, anima = 69, energy = 55, concent = 53, method = 25},
        #bt_attr{hp_lim = 2100, mp_lim = 564, inner_att = 82, outer_att = 101, inner_def = 198, outer_def = 264, hit = 208, dodge = 40, crit_hurt = 29, crit_def = 17, move_speed = 240}
    };
get_attr(5, 22) ->
    {
        #base_attr{power = 12, anima = 72, energy = 57, concent = 55, method = 26},
        #bt_attr{hp_lim = 2190, mp_lim = 588, inner_att = 85, outer_att = 104, inner_def = 205, outer_def = 273, hit = 215, dodge = 41, crit_hurt = 30, crit_def = 17, move_speed = 240}
    };
get_attr(5, 23) ->
    {
        #base_attr{power = 13, anima = 75, energy = 60, concent = 58, method = 27},
        #bt_attr{hp_lim = 2280, mp_lim = 612, inner_att = 88, outer_att = 108, inner_def = 213, outer_def = 282, hit = 223, dodge = 43, crit_hurt = 31, crit_def = 18, move_speed = 240}
    };
get_attr(5, 24) ->
    {
        #base_attr{power = 13, anima = 78, energy = 62, concent = 60, method = 28},
        #bt_attr{hp_lim = 2370, mp_lim = 636, inner_att = 91, outer_att = 111, inner_def = 220, outer_def = 291, hit = 230, dodge = 44, crit_hurt = 32, crit_def = 18, move_speed = 240}
    };
get_attr(5, 25) ->
    {
        #base_attr{power = 14, anima = 81, energy = 65, concent = 63, method = 29},
        #bt_attr{hp_lim = 2460, mp_lim = 660, inner_att = 94, outer_att = 115, inner_def = 228, outer_def = 300, hit = 238, dodge = 46, crit_hurt = 33, crit_def = 19, move_speed = 240}
    };
get_attr(5, 26) ->
    {
        #base_attr{power = 14, anima = 84, energy = 67, concent = 65, method = 30},
        #bt_attr{hp_lim = 2550, mp_lim = 684, inner_att = 97, outer_att = 118, inner_def = 235, outer_def = 309, hit = 245, dodge = 47, crit_hurt = 34, crit_def = 19, move_speed = 240}
    };
get_attr(5, 27) ->
    {
        #base_attr{power = 15, anima = 87, energy = 70, concent = 68, method = 31},
        #bt_attr{hp_lim = 2640, mp_lim = 708, inner_att = 100, outer_att = 122, inner_def = 243, outer_def = 318, hit = 253, dodge = 49, crit_hurt = 35, crit_def = 20, move_speed = 240}
    };
get_attr(5, 28) ->
    {
        #base_attr{power = 15, anima = 90, energy = 72, concent = 70, method = 32},
        #bt_attr{hp_lim = 2730, mp_lim = 732, inner_att = 103, outer_att = 125, inner_def = 250, outer_def = 327, hit = 260, dodge = 50, crit_hurt = 36, crit_def = 20, move_speed = 240}
    };
get_attr(5, 29) ->
    {
        #base_attr{power = 16, anima = 93, energy = 75, concent = 73, method = 33},
        #bt_attr{hp_lim = 2820, mp_lim = 756, inner_att = 106, outer_att = 129, inner_def = 258, outer_def = 336, hit = 268, dodge = 52, crit_hurt = 37, crit_def = 21, move_speed = 240}
    };
get_attr(5, 30) ->
    {
        #base_attr{power = 16, anima = 96, energy = 77, concent = 75, method = 34},
        #bt_attr{hp_lim = 2910, mp_lim = 780, inner_att = 109, outer_att = 132, inner_def = 265, outer_def = 345, hit = 275, dodge = 53, crit_hurt = 38, crit_def = 21, move_speed = 240}
    };
get_attr(5, 31) ->
    {
        #base_attr{power = 17, anima = 99, energy = 80, concent = 78, method = 35},
        #bt_attr{hp_lim = 3000, mp_lim = 804, inner_att = 112, outer_att = 136, inner_def = 273, outer_def = 354, hit = 283, dodge = 55, crit_hurt = 39, crit_def = 22, move_speed = 240}
    };
get_attr(5, 32) ->
    {
        #base_attr{power = 17, anima = 102, energy = 82, concent = 80, method = 36},
        #bt_attr{hp_lim = 3090, mp_lim = 828, inner_att = 115, outer_att = 139, inner_def = 280, outer_def = 363, hit = 290, dodge = 56, crit_hurt = 40, crit_def = 22, move_speed = 240}
    };
get_attr(5, 33) ->
    {
        #base_attr{power = 18, anima = 105, energy = 85, concent = 83, method = 37},
        #bt_attr{hp_lim = 3180, mp_lim = 852, inner_att = 118, outer_att = 143, inner_def = 288, outer_def = 372, hit = 298, dodge = 58, crit_hurt = 41, crit_def = 23, move_speed = 240}
    };
get_attr(5, 34) ->
    {
        #base_attr{power = 18, anima = 108, energy = 87, concent = 85, method = 38},
        #bt_attr{hp_lim = 3270, mp_lim = 876, inner_att = 121, outer_att = 146, inner_def = 295, outer_def = 381, hit = 305, dodge = 59, crit_hurt = 42, crit_def = 23, move_speed = 240}
    };
get_attr(5, 35) ->
    {
        #base_attr{power = 19, anima = 111, energy = 90, concent = 88, method = 39},
        #bt_attr{hp_lim = 3360, mp_lim = 900, inner_att = 124, outer_att = 150, inner_def = 303, outer_def = 390, hit = 313, dodge = 61, crit_hurt = 43, crit_def = 24, move_speed = 240}
    };
get_attr(5, 36) ->
    {
        #base_attr{power = 19, anima = 114, energy = 92, concent = 90, method = 40},
        #bt_attr{hp_lim = 3450, mp_lim = 924, inner_att = 127, outer_att = 153, inner_def = 310, outer_def = 399, hit = 320, dodge = 62, crit_hurt = 44, crit_def = 24, move_speed = 240}
    };
get_attr(5, 37) ->
    {
        #base_attr{power = 20, anima = 117, energy = 95, concent = 93, method = 41},
        #bt_attr{hp_lim = 3540, mp_lim = 948, inner_att = 130, outer_att = 157, inner_def = 318, outer_def = 408, hit = 328, dodge = 64, crit_hurt = 45, crit_def = 25, move_speed = 240}
    };
get_attr(5, 38) ->
    {
        #base_attr{power = 20, anima = 120, energy = 97, concent = 95, method = 42},
        #bt_attr{hp_lim = 3630, mp_lim = 972, inner_att = 133, outer_att = 160, inner_def = 325, outer_def = 417, hit = 335, dodge = 65, crit_hurt = 46, crit_def = 25, move_speed = 240}
    };
get_attr(5, 39) ->
    {
        #base_attr{power = 21, anima = 123, energy = 100, concent = 98, method = 43},
        #bt_attr{hp_lim = 3720, mp_lim = 996, inner_att = 136, outer_att = 164, inner_def = 333, outer_def = 426, hit = 343, dodge = 67, crit_hurt = 47, crit_def = 26, move_speed = 240}
    };
get_attr(5, 40) ->
    {
        #base_attr{power = 21, anima = 126, energy = 102, concent = 100, method = 44},
        #bt_attr{hp_lim = 3810, mp_lim = 1020, inner_att = 139, outer_att = 167, inner_def = 340, outer_def = 435, hit = 350, dodge = 68, crit_hurt = 48, crit_def = 26, move_speed = 240}
    };
get_attr(5, 41) ->
    {
        #base_attr{power = 22, anima = 129, energy = 105, concent = 103, method = 45},
        #bt_attr{hp_lim = 3900, mp_lim = 1044, inner_att = 142, outer_att = 171, inner_def = 348, outer_def = 444, hit = 358, dodge = 70, crit_hurt = 49, crit_def = 27, move_speed = 240}
    };
get_attr(5, 42) ->
    {
        #base_attr{power = 22, anima = 132, energy = 107, concent = 105, method = 46},
        #bt_attr{hp_lim = 3990, mp_lim = 1068, inner_att = 145, outer_att = 174, inner_def = 355, outer_def = 453, hit = 365, dodge = 71, crit_hurt = 50, crit_def = 27, move_speed = 240}
    };
get_attr(5, 43) ->
    {
        #base_attr{power = 23, anima = 135, energy = 110, concent = 108, method = 47},
        #bt_attr{hp_lim = 4080, mp_lim = 1092, inner_att = 148, outer_att = 178, inner_def = 363, outer_def = 462, hit = 373, dodge = 73, crit_hurt = 51, crit_def = 28, move_speed = 240}
    };
get_attr(5, 44) ->
    {
        #base_attr{power = 23, anima = 138, energy = 112, concent = 110, method = 48},
        #bt_attr{hp_lim = 4170, mp_lim = 1116, inner_att = 151, outer_att = 181, inner_def = 370, outer_def = 471, hit = 380, dodge = 74, crit_hurt = 52, crit_def = 28, move_speed = 240}
    };
get_attr(5, 45) ->
    {
        #base_attr{power = 24, anima = 141, energy = 115, concent = 113, method = 49},
        #bt_attr{hp_lim = 4260, mp_lim = 1140, inner_att = 154, outer_att = 185, inner_def = 378, outer_def = 480, hit = 388, dodge = 76, crit_hurt = 53, crit_def = 29, move_speed = 240}
    };
get_attr(5, 46) ->
    {
        #base_attr{power = 24, anima = 144, energy = 117, concent = 115, method = 50},
        #bt_attr{hp_lim = 4350, mp_lim = 1164, inner_att = 157, outer_att = 188, inner_def = 385, outer_def = 489, hit = 395, dodge = 77, crit_hurt = 54, crit_def = 29, move_speed = 240}
    };
get_attr(5, 47) ->
    {
        #base_attr{power = 25, anima = 147, energy = 120, concent = 118, method = 51},
        #bt_attr{hp_lim = 4440, mp_lim = 1188, inner_att = 160, outer_att = 192, inner_def = 393, outer_def = 498, hit = 403, dodge = 79, crit_hurt = 55, crit_def = 30, move_speed = 240}
    };
get_attr(5, 48) ->
    {
        #base_attr{power = 25, anima = 150, energy = 122, concent = 120, method = 52},
        #bt_attr{hp_lim = 4530, mp_lim = 1212, inner_att = 163, outer_att = 195, inner_def = 400, outer_def = 507, hit = 410, dodge = 80, crit_hurt = 56, crit_def = 30, move_speed = 240}
    };
get_attr(5, 49) ->
    {
        #base_attr{power = 26, anima = 153, energy = 125, concent = 123, method = 53},
        #bt_attr{hp_lim = 4620, mp_lim = 1236, inner_att = 166, outer_att = 199, inner_def = 408, outer_def = 516, hit = 418, dodge = 82, crit_hurt = 57, crit_def = 31, move_speed = 240}
    };
get_attr(5, 50) ->
    {
        #base_attr{power = 26, anima = 156, energy = 127, concent = 125, method = 54},
        #bt_attr{hp_lim = 4710, mp_lim = 1260, inner_att = 169, outer_att = 202, inner_def = 415, outer_def = 525, hit = 425, dodge = 83, crit_hurt = 58, crit_def = 31, move_speed = 240}
    };
get_attr(5, 51) ->
    {
        #base_attr{power = 27, anima = 159, energy = 130, concent = 128, method = 55},
        #bt_attr{hp_lim = 4800, mp_lim = 1284, inner_att = 172, outer_att = 206, inner_def = 423, outer_def = 534, hit = 433, dodge = 85, crit_hurt = 59, crit_def = 32, move_speed = 240}
    };
get_attr(5, 52) ->
    {
        #base_attr{power = 27, anima = 162, energy = 132, concent = 130, method = 56},
        #bt_attr{hp_lim = 4890, mp_lim = 1308, inner_att = 175, outer_att = 209, inner_def = 430, outer_def = 543, hit = 440, dodge = 86, crit_hurt = 60, crit_def = 32, move_speed = 240}
    };
get_attr(5, 53) ->
    {
        #base_attr{power = 28, anima = 165, energy = 135, concent = 133, method = 57},
        #bt_attr{hp_lim = 4980, mp_lim = 1332, inner_att = 178, outer_att = 213, inner_def = 438, outer_def = 552, hit = 448, dodge = 88, crit_hurt = 61, crit_def = 33, move_speed = 240}
    };
get_attr(5, 54) ->
    {
        #base_attr{power = 28, anima = 168, energy = 137, concent = 135, method = 58},
        #bt_attr{hp_lim = 5070, mp_lim = 1356, inner_att = 181, outer_att = 216, inner_def = 445, outer_def = 561, hit = 455, dodge = 89, crit_hurt = 62, crit_def = 33, move_speed = 240}
    };
get_attr(5, 55) ->
    {
        #base_attr{power = 29, anima = 171, energy = 140, concent = 138, method = 59},
        #bt_attr{hp_lim = 5160, mp_lim = 1380, inner_att = 184, outer_att = 220, inner_def = 453, outer_def = 570, hit = 463, dodge = 91, crit_hurt = 63, crit_def = 34, move_speed = 240}
    };
get_attr(5, 56) ->
    {
        #base_attr{power = 29, anima = 174, energy = 142, concent = 140, method = 60},
        #bt_attr{hp_lim = 5250, mp_lim = 1404, inner_att = 187, outer_att = 223, inner_def = 460, outer_def = 579, hit = 470, dodge = 92, crit_hurt = 64, crit_def = 34, move_speed = 240}
    };
get_attr(5, 57) ->
    {
        #base_attr{power = 30, anima = 177, energy = 145, concent = 143, method = 61},
        #bt_attr{hp_lim = 5340, mp_lim = 1428, inner_att = 190, outer_att = 227, inner_def = 468, outer_def = 588, hit = 478, dodge = 94, crit_hurt = 65, crit_def = 35, move_speed = 240}
    };
get_attr(5, 58) ->
    {
        #base_attr{power = 30, anima = 180, energy = 147, concent = 145, method = 62},
        #bt_attr{hp_lim = 5430, mp_lim = 1452, inner_att = 193, outer_att = 230, inner_def = 475, outer_def = 597, hit = 485, dodge = 95, crit_hurt = 66, crit_def = 35, move_speed = 240}
    };
get_attr(5, 59) ->
    {
        #base_attr{power = 31, anima = 183, energy = 150, concent = 148, method = 63},
        #bt_attr{hp_lim = 5520, mp_lim = 1476, inner_att = 196, outer_att = 234, inner_def = 483, outer_def = 606, hit = 493, dodge = 97, crit_hurt = 67, crit_def = 36, move_speed = 240}
    };
get_attr(5, 60) ->
    {
        #base_attr{power = 31, anima = 186, energy = 152, concent = 150, method = 64},
        #bt_attr{hp_lim = 5610, mp_lim = 1500, inner_att = 199, outer_att = 237, inner_def = 490, outer_def = 615, hit = 500, dodge = 98, crit_hurt = 68, crit_def = 36, move_speed = 240}
    };
get_attr(5, 61) ->
    {
        #base_attr{power = 32, anima = 189, energy = 155, concent = 153, method = 65},
        #bt_attr{hp_lim = 5700, mp_lim = 1524, inner_att = 202, outer_att = 241, inner_def = 498, outer_def = 624, hit = 508, dodge = 100, crit_hurt = 69, crit_def = 37, move_speed = 240}
    };
get_attr(5, 62) ->
    {
        #base_attr{power = 32, anima = 192, energy = 157, concent = 155, method = 66},
        #bt_attr{hp_lim = 5790, mp_lim = 1548, inner_att = 205, outer_att = 244, inner_def = 505, outer_def = 633, hit = 515, dodge = 101, crit_hurt = 70, crit_def = 37, move_speed = 240}
    };
get_attr(5, 63) ->
    {
        #base_attr{power = 33, anima = 195, energy = 160, concent = 158, method = 67},
        #bt_attr{hp_lim = 5880, mp_lim = 1572, inner_att = 208, outer_att = 248, inner_def = 513, outer_def = 642, hit = 523, dodge = 103, crit_hurt = 71, crit_def = 38, move_speed = 240}
    };
get_attr(5, 64) ->
    {
        #base_attr{power = 33, anima = 198, energy = 162, concent = 160, method = 68},
        #bt_attr{hp_lim = 5970, mp_lim = 1596, inner_att = 211, outer_att = 251, inner_def = 520, outer_def = 651, hit = 530, dodge = 104, crit_hurt = 72, crit_def = 38, move_speed = 240}
    };
get_attr(5, 65) ->
    {
        #base_attr{power = 34, anima = 201, energy = 165, concent = 163, method = 69},
        #bt_attr{hp_lim = 6060, mp_lim = 1620, inner_att = 214, outer_att = 255, inner_def = 528, outer_def = 660, hit = 538, dodge = 106, crit_hurt = 73, crit_def = 39, move_speed = 240}
    };
get_attr(5, 66) ->
    {
        #base_attr{power = 34, anima = 204, energy = 167, concent = 165, method = 70},
        #bt_attr{hp_lim = 6150, mp_lim = 1644, inner_att = 217, outer_att = 258, inner_def = 535, outer_def = 669, hit = 545, dodge = 107, crit_hurt = 74, crit_def = 39, move_speed = 240}
    };
get_attr(5, 67) ->
    {
        #base_attr{power = 35, anima = 207, energy = 170, concent = 168, method = 71},
        #bt_attr{hp_lim = 6240, mp_lim = 1668, inner_att = 220, outer_att = 262, inner_def = 543, outer_def = 678, hit = 553, dodge = 109, crit_hurt = 75, crit_def = 40, move_speed = 240}
    };
get_attr(5, 68) ->
    {
        #base_attr{power = 35, anima = 210, energy = 172, concent = 170, method = 72},
        #bt_attr{hp_lim = 6330, mp_lim = 1692, inner_att = 223, outer_att = 265, inner_def = 550, outer_def = 687, hit = 560, dodge = 110, crit_hurt = 76, crit_def = 40, move_speed = 240}
    };
get_attr(5, 69) ->
    {
        #base_attr{power = 36, anima = 213, energy = 175, concent = 173, method = 73},
        #bt_attr{hp_lim = 6420, mp_lim = 1716, inner_att = 226, outer_att = 269, inner_def = 558, outer_def = 696, hit = 568, dodge = 112, crit_hurt = 77, crit_def = 41, move_speed = 240}
    };
get_attr(5, 70) ->
    {
        #base_attr{power = 36, anima = 216, energy = 177, concent = 175, method = 74},
        #bt_attr{hp_lim = 6510, mp_lim = 1740, inner_att = 229, outer_att = 272, inner_def = 565, outer_def = 705, hit = 575, dodge = 113, crit_hurt = 78, crit_def = 41, move_speed = 240}
    };
get_attr(5, 71) ->
    {
        #base_attr{power = 37, anima = 219, energy = 180, concent = 178, method = 75},
        #bt_attr{hp_lim = 6600, mp_lim = 1764, inner_att = 232, outer_att = 276, inner_def = 573, outer_def = 714, hit = 583, dodge = 115, crit_hurt = 79, crit_def = 42, move_speed = 240}
    };
get_attr(5, 72) ->
    {
        #base_attr{power = 37, anima = 222, energy = 182, concent = 180, method = 76},
        #bt_attr{hp_lim = 6690, mp_lim = 1788, inner_att = 235, outer_att = 279, inner_def = 580, outer_def = 723, hit = 590, dodge = 116, crit_hurt = 80, crit_def = 42, move_speed = 240}
    };
get_attr(5, 73) ->
    {
        #base_attr{power = 38, anima = 225, energy = 185, concent = 183, method = 77},
        #bt_attr{hp_lim = 6780, mp_lim = 1812, inner_att = 238, outer_att = 283, inner_def = 588, outer_def = 732, hit = 598, dodge = 118, crit_hurt = 81, crit_def = 43, move_speed = 240}
    };
get_attr(5, 74) ->
    {
        #base_attr{power = 38, anima = 228, energy = 187, concent = 185, method = 78},
        #bt_attr{hp_lim = 6870, mp_lim = 1836, inner_att = 241, outer_att = 286, inner_def = 595, outer_def = 741, hit = 605, dodge = 119, crit_hurt = 82, crit_def = 43, move_speed = 240}
    };
get_attr(5, 75) ->
    {
        #base_attr{power = 39, anima = 231, energy = 190, concent = 188, method = 79},
        #bt_attr{hp_lim = 6960, mp_lim = 1860, inner_att = 244, outer_att = 290, inner_def = 603, outer_def = 750, hit = 613, dodge = 121, crit_hurt = 83, crit_def = 44, move_speed = 240}
    };
get_attr(5, 76) ->
    {
        #base_attr{power = 39, anima = 234, energy = 192, concent = 190, method = 80},
        #bt_attr{hp_lim = 7050, mp_lim = 1884, inner_att = 247, outer_att = 293, inner_def = 610, outer_def = 759, hit = 620, dodge = 122, crit_hurt = 84, crit_def = 44, move_speed = 240}
    };
get_attr(5, 77) ->
    {
        #base_attr{power = 40, anima = 237, energy = 195, concent = 193, method = 81},
        #bt_attr{hp_lim = 7140, mp_lim = 1908, inner_att = 250, outer_att = 297, inner_def = 618, outer_def = 768, hit = 628, dodge = 124, crit_hurt = 85, crit_def = 45, move_speed = 240}
    };
get_attr(5, 78) ->
    {
        #base_attr{power = 40, anima = 240, energy = 197, concent = 195, method = 82},
        #bt_attr{hp_lim = 7230, mp_lim = 1932, inner_att = 253, outer_att = 300, inner_def = 625, outer_def = 777, hit = 635, dodge = 125, crit_hurt = 86, crit_def = 45, move_speed = 240}
    };
get_attr(5, 79) ->
    {
        #base_attr{power = 41, anima = 243, energy = 200, concent = 198, method = 83},
        #bt_attr{hp_lim = 7320, mp_lim = 1956, inner_att = 256, outer_att = 304, inner_def = 633, outer_def = 786, hit = 643, dodge = 127, crit_hurt = 87, crit_def = 46, move_speed = 240}
    };
get_attr(5, 80) ->
    {
        #base_attr{power = 41, anima = 246, energy = 202, concent = 200, method = 84},
        #bt_attr{hp_lim = 7410, mp_lim = 1980, inner_att = 259, outer_att = 307, inner_def = 640, outer_def = 795, hit = 650, dodge = 128, crit_hurt = 88, crit_def = 46, move_speed = 240}
    };
get_attr(5, 81) ->
    {
        #base_attr{power = 42, anima = 249, energy = 205, concent = 203, method = 85},
        #bt_attr{hp_lim = 7500, mp_lim = 2004, inner_att = 262, outer_att = 311, inner_def = 648, outer_def = 804, hit = 658, dodge = 130, crit_hurt = 89, crit_def = 47, move_speed = 240}
    };
get_attr(5, 82) ->
    {
        #base_attr{power = 42, anima = 252, energy = 207, concent = 205, method = 86},
        #bt_attr{hp_lim = 7590, mp_lim = 2028, inner_att = 265, outer_att = 314, inner_def = 655, outer_def = 813, hit = 665, dodge = 131, crit_hurt = 90, crit_def = 47, move_speed = 240}
    };
get_attr(5, 83) ->
    {
        #base_attr{power = 43, anima = 255, energy = 210, concent = 208, method = 87},
        #bt_attr{hp_lim = 7680, mp_lim = 2052, inner_att = 268, outer_att = 318, inner_def = 663, outer_def = 822, hit = 673, dodge = 133, crit_hurt = 91, crit_def = 48, move_speed = 240}
    };
get_attr(5, 84) ->
    {
        #base_attr{power = 43, anima = 258, energy = 212, concent = 210, method = 88},
        #bt_attr{hp_lim = 7770, mp_lim = 2076, inner_att = 271, outer_att = 321, inner_def = 670, outer_def = 831, hit = 680, dodge = 134, crit_hurt = 92, crit_def = 48, move_speed = 240}
    };
get_attr(5, 85) ->
    {
        #base_attr{power = 44, anima = 261, energy = 215, concent = 213, method = 89},
        #bt_attr{hp_lim = 7860, mp_lim = 2100, inner_att = 274, outer_att = 325, inner_def = 678, outer_def = 840, hit = 688, dodge = 136, crit_hurt = 93, crit_def = 49, move_speed = 240}
    };
get_attr(5, 86) ->
    {
        #base_attr{power = 44, anima = 264, energy = 217, concent = 215, method = 90},
        #bt_attr{hp_lim = 7950, mp_lim = 2124, inner_att = 277, outer_att = 328, inner_def = 685, outer_def = 849, hit = 695, dodge = 137, crit_hurt = 94, crit_def = 49, move_speed = 240}
    };
get_attr(5, 87) ->
    {
        #base_attr{power = 45, anima = 267, energy = 220, concent = 218, method = 91},
        #bt_attr{hp_lim = 8040, mp_lim = 2148, inner_att = 280, outer_att = 332, inner_def = 693, outer_def = 858, hit = 703, dodge = 139, crit_hurt = 95, crit_def = 50, move_speed = 240}
    };
get_attr(5, 88) ->
    {
        #base_attr{power = 45, anima = 270, energy = 222, concent = 220, method = 92},
        #bt_attr{hp_lim = 8130, mp_lim = 2172, inner_att = 283, outer_att = 335, inner_def = 700, outer_def = 867, hit = 710, dodge = 140, crit_hurt = 96, crit_def = 50, move_speed = 240}
    };
get_attr(5, 89) ->
    {
        #base_attr{power = 46, anima = 273, energy = 225, concent = 223, method = 93},
        #bt_attr{hp_lim = 8220, mp_lim = 2196, inner_att = 286, outer_att = 339, inner_def = 708, outer_def = 876, hit = 718, dodge = 142, crit_hurt = 97, crit_def = 51, move_speed = 240}
    };
get_attr(5, 90) ->
    {
        #base_attr{power = 46, anima = 276, energy = 227, concent = 225, method = 94},
        #bt_attr{hp_lim = 8310, mp_lim = 2220, inner_att = 289, outer_att = 342, inner_def = 715, outer_def = 885, hit = 725, dodge = 143, crit_hurt = 98, crit_def = 51, move_speed = 240}
    };
get_attr(5, 91) ->
    {
        #base_attr{power = 47, anima = 279, energy = 230, concent = 228, method = 95},
        #bt_attr{hp_lim = 8400, mp_lim = 2244, inner_att = 292, outer_att = 346, inner_def = 723, outer_def = 894, hit = 733, dodge = 145, crit_hurt = 99, crit_def = 52, move_speed = 240}
    };
get_attr(5, 92) ->
    {
        #base_attr{power = 47, anima = 282, energy = 232, concent = 230, method = 96},
        #bt_attr{hp_lim = 8490, mp_lim = 2268, inner_att = 295, outer_att = 349, inner_def = 730, outer_def = 903, hit = 740, dodge = 146, crit_hurt = 100, crit_def = 52, move_speed = 240}
    };
get_attr(5, 93) ->
    {
        #base_attr{power = 48, anima = 285, energy = 235, concent = 233, method = 97},
        #bt_attr{hp_lim = 8580, mp_lim = 2292, inner_att = 298, outer_att = 353, inner_def = 738, outer_def = 912, hit = 748, dodge = 148, crit_hurt = 101, crit_def = 53, move_speed = 240}
    };
get_attr(5, 94) ->
    {
        #base_attr{power = 48, anima = 288, energy = 237, concent = 235, method = 98},
        #bt_attr{hp_lim = 8670, mp_lim = 2316, inner_att = 301, outer_att = 356, inner_def = 745, outer_def = 921, hit = 755, dodge = 149, crit_hurt = 102, crit_def = 53, move_speed = 240}
    };
get_attr(5, 95) ->
    {
        #base_attr{power = 49, anima = 291, energy = 240, concent = 238, method = 99},
        #bt_attr{hp_lim = 8760, mp_lim = 2340, inner_att = 304, outer_att = 360, inner_def = 753, outer_def = 930, hit = 763, dodge = 151, crit_hurt = 103, crit_def = 54, move_speed = 240}
    };
get_attr(5, 96) ->
    {
        #base_attr{power = 49, anima = 294, energy = 242, concent = 240, method = 100},
        #bt_attr{hp_lim = 8850, mp_lim = 2364, inner_att = 307, outer_att = 363, inner_def = 760, outer_def = 939, hit = 770, dodge = 152, crit_hurt = 104, crit_def = 54, move_speed = 240}
    };
get_attr(5, 97) ->
    {
        #base_attr{power = 50, anima = 297, energy = 245, concent = 243, method = 101},
        #bt_attr{hp_lim = 8940, mp_lim = 2388, inner_att = 310, outer_att = 367, inner_def = 768, outer_def = 948, hit = 778, dodge = 154, crit_hurt = 105, crit_def = 55, move_speed = 240}
    };
get_attr(5, 98) ->
    {
        #base_attr{power = 50, anima = 300, energy = 247, concent = 245, method = 102},
        #bt_attr{hp_lim = 9030, mp_lim = 2412, inner_att = 313, outer_att = 370, inner_def = 775, outer_def = 957, hit = 785, dodge = 155, crit_hurt = 106, crit_def = 55, move_speed = 240}
    };
get_attr(5, 99) ->
    {
        #base_attr{power = 51, anima = 303, energy = 250, concent = 248, method = 103},
        #bt_attr{hp_lim = 9120, mp_lim = 2436, inner_att = 316, outer_att = 374, inner_def = 783, outer_def = 966, hit = 793, dodge = 157, crit_hurt = 107, crit_def = 56, move_speed = 240}
    };
get_attr(5, 100) ->
    {
        #base_attr{power = 51, anima = 306, energy = 252, concent = 250, method = 104},
        #bt_attr{hp_lim = 9210, mp_lim = 2460, inner_att = 319, outer_att = 377, inner_def = 790, outer_def = 975, hit = 800, dodge = 158, crit_hurt = 108, crit_def = 56, move_speed = 240}
    };
get_attr(5, 101) ->
    {
        #base_attr{power = 52, anima = 309, energy = 255, concent = 253, method = 105},
        #bt_attr{hp_lim = 9300, mp_lim = 2484, inner_att = 322, outer_att = 381, inner_def = 798, outer_def = 984, hit = 808, dodge = 160, crit_hurt = 109, crit_def = 57, move_speed = 240}
    };
get_attr(5, 102) ->
    {
        #base_attr{power = 52, anima = 312, energy = 257, concent = 255, method = 106},
        #bt_attr{hp_lim = 9390, mp_lim = 2508, inner_att = 325, outer_att = 384, inner_def = 805, outer_def = 993, hit = 815, dodge = 161, crit_hurt = 110, crit_def = 57, move_speed = 240}
    };
get_attr(5, 103) ->
    {
        #base_attr{power = 53, anima = 315, energy = 260, concent = 258, method = 107},
        #bt_attr{hp_lim = 9480, mp_lim = 2532, inner_att = 328, outer_att = 388, inner_def = 813, outer_def = 1002, hit = 823, dodge = 163, crit_hurt = 111, crit_def = 58, move_speed = 240}
    };
get_attr(5, 104) ->
    {
        #base_attr{power = 53, anima = 318, energy = 262, concent = 260, method = 108},
        #bt_attr{hp_lim = 9570, mp_lim = 2556, inner_att = 331, outer_att = 391, inner_def = 820, outer_def = 1011, hit = 830, dodge = 164, crit_hurt = 112, crit_def = 58, move_speed = 240}
    };
get_attr(5, 105) ->
    {
        #base_attr{power = 54, anima = 321, energy = 265, concent = 263, method = 109},
        #bt_attr{hp_lim = 9660, mp_lim = 2580, inner_att = 334, outer_att = 395, inner_def = 828, outer_def = 1020, hit = 838, dodge = 166, crit_hurt = 113, crit_def = 59, move_speed = 240}
    };
get_attr(5, 106) ->
    {
        #base_attr{power = 54, anima = 324, energy = 267, concent = 265, method = 110},
        #bt_attr{hp_lim = 9750, mp_lim = 2604, inner_att = 337, outer_att = 398, inner_def = 835, outer_def = 1029, hit = 845, dodge = 167, crit_hurt = 114, crit_def = 59, move_speed = 240}
    };
get_attr(5, 107) ->
    {
        #base_attr{power = 55, anima = 327, energy = 270, concent = 268, method = 111},
        #bt_attr{hp_lim = 9840, mp_lim = 2628, inner_att = 340, outer_att = 402, inner_def = 843, outer_def = 1038, hit = 853, dodge = 169, crit_hurt = 115, crit_def = 60, move_speed = 240}
    };
get_attr(5, 108) ->
    {
        #base_attr{power = 55, anima = 330, energy = 272, concent = 270, method = 112},
        #bt_attr{hp_lim = 9930, mp_lim = 2652, inner_att = 343, outer_att = 405, inner_def = 850, outer_def = 1047, hit = 860, dodge = 170, crit_hurt = 116, crit_def = 60, move_speed = 240}
    };
get_attr(5, 109) ->
    {
        #base_attr{power = 56, anima = 333, energy = 275, concent = 273, method = 113},
        #bt_attr{hp_lim = 10020, mp_lim = 2676, inner_att = 346, outer_att = 409, inner_def = 858, outer_def = 1056, hit = 868, dodge = 172, crit_hurt = 117, crit_def = 61, move_speed = 240}
    };
get_attr(5, 110) ->
    {
        #base_attr{power = 56, anima = 336, energy = 277, concent = 275, method = 114},
        #bt_attr{hp_lim = 10110, mp_lim = 2700, inner_att = 349, outer_att = 412, inner_def = 865, outer_def = 1065, hit = 875, dodge = 173, crit_hurt = 118, crit_def = 61, move_speed = 240}
    };
get_attr(5, 111) ->
    {
        #base_attr{power = 57, anima = 339, energy = 280, concent = 278, method = 115},
        #bt_attr{hp_lim = 10200, mp_lim = 2724, inner_att = 352, outer_att = 416, inner_def = 873, outer_def = 1074, hit = 883, dodge = 175, crit_hurt = 119, crit_def = 62, move_speed = 240}
    };
get_attr(5, 112) ->
    {
        #base_attr{power = 57, anima = 342, energy = 282, concent = 280, method = 116},
        #bt_attr{hp_lim = 10290, mp_lim = 2748, inner_att = 355, outer_att = 419, inner_def = 880, outer_def = 1083, hit = 890, dodge = 176, crit_hurt = 120, crit_def = 62, move_speed = 240}
    };
get_attr(5, 113) ->
    {
        #base_attr{power = 58, anima = 345, energy = 285, concent = 283, method = 117},
        #bt_attr{hp_lim = 10380, mp_lim = 2772, inner_att = 358, outer_att = 423, inner_def = 888, outer_def = 1092, hit = 898, dodge = 178, crit_hurt = 121, crit_def = 63, move_speed = 240}
    };
get_attr(5, 114) ->
    {
        #base_attr{power = 58, anima = 348, energy = 287, concent = 285, method = 118},
        #bt_attr{hp_lim = 10470, mp_lim = 2796, inner_att = 361, outer_att = 426, inner_def = 895, outer_def = 1101, hit = 905, dodge = 179, crit_hurt = 122, crit_def = 63, move_speed = 240}
    };
get_attr(5, 115) ->
    {
        #base_attr{power = 59, anima = 351, energy = 290, concent = 288, method = 119},
        #bt_attr{hp_lim = 10560, mp_lim = 2820, inner_att = 364, outer_att = 430, inner_def = 903, outer_def = 1110, hit = 913, dodge = 181, crit_hurt = 123, crit_def = 64, move_speed = 240}
    };
get_attr(5, 116) ->
    {
        #base_attr{power = 59, anima = 354, energy = 292, concent = 290, method = 120},
        #bt_attr{hp_lim = 10650, mp_lim = 2844, inner_att = 367, outer_att = 433, inner_def = 910, outer_def = 1119, hit = 920, dodge = 182, crit_hurt = 124, crit_def = 64, move_speed = 240}
    };
get_attr(5, 117) ->
    {
        #base_attr{power = 60, anima = 357, energy = 295, concent = 293, method = 121},
        #bt_attr{hp_lim = 10740, mp_lim = 2868, inner_att = 370, outer_att = 437, inner_def = 918, outer_def = 1128, hit = 928, dodge = 184, crit_hurt = 125, crit_def = 65, move_speed = 240}
    };
get_attr(5, 118) ->
    {
        #base_attr{power = 60, anima = 360, energy = 297, concent = 295, method = 122},
        #bt_attr{hp_lim = 10830, mp_lim = 2892, inner_att = 373, outer_att = 440, inner_def = 925, outer_def = 1137, hit = 935, dodge = 185, crit_hurt = 126, crit_def = 65, move_speed = 240}
    };
get_attr(5, 119) ->
    {
        #base_attr{power = 61, anima = 363, energy = 300, concent = 298, method = 123},
        #bt_attr{hp_lim = 10920, mp_lim = 2916, inner_att = 376, outer_att = 444, inner_def = 933, outer_def = 1146, hit = 943, dodge = 187, crit_hurt = 127, crit_def = 66, move_speed = 240}
    };
get_attr(5, 120) ->
    {
        #base_attr{power = 61, anima = 366, energy = 302, concent = 300, method = 124},
        #bt_attr{hp_lim = 11010, mp_lim = 2940, inner_att = 379, outer_att = 447, inner_def = 940, outer_def = 1155, hit = 950, dodge = 188, crit_hurt = 128, crit_def = 66, move_speed = 240}
    };
get_attr(5, 121) ->
    {
        #base_attr{power = 62, anima = 369, energy = 305, concent = 303, method = 125},
        #bt_attr{hp_lim = 11100, mp_lim = 2964, inner_att = 382, outer_att = 451, inner_def = 948, outer_def = 1164, hit = 958, dodge = 190, crit_hurt = 129, crit_def = 67, move_speed = 240}
    };
get_attr(5, 122) ->
    {
        #base_attr{power = 62, anima = 372, energy = 307, concent = 305, method = 126},
        #bt_attr{hp_lim = 11190, mp_lim = 2988, inner_att = 385, outer_att = 454, inner_def = 955, outer_def = 1173, hit = 965, dodge = 191, crit_hurt = 130, crit_def = 67, move_speed = 240}
    };
get_attr(5, 123) ->
    {
        #base_attr{power = 63, anima = 375, energy = 310, concent = 308, method = 127},
        #bt_attr{hp_lim = 11280, mp_lim = 3012, inner_att = 388, outer_att = 458, inner_def = 963, outer_def = 1182, hit = 973, dodge = 193, crit_hurt = 131, crit_def = 68, move_speed = 240}
    };
get_attr(5, 124) ->
    {
        #base_attr{power = 63, anima = 378, energy = 312, concent = 310, method = 128},
        #bt_attr{hp_lim = 11370, mp_lim = 3036, inner_att = 391, outer_att = 461, inner_def = 970, outer_def = 1191, hit = 980, dodge = 194, crit_hurt = 132, crit_def = 68, move_speed = 240}
    };
get_attr(5, 125) ->
    {
        #base_attr{power = 64, anima = 381, energy = 315, concent = 313, method = 129},
        #bt_attr{hp_lim = 11460, mp_lim = 3060, inner_att = 394, outer_att = 465, inner_def = 978, outer_def = 1200, hit = 988, dodge = 196, crit_hurt = 133, crit_def = 69, move_speed = 240}
    };
get_attr(5, 126) ->
    {
        #base_attr{power = 64, anima = 384, energy = 317, concent = 315, method = 130},
        #bt_attr{hp_lim = 11550, mp_lim = 3084, inner_att = 397, outer_att = 468, inner_def = 985, outer_def = 1209, hit = 995, dodge = 197, crit_hurt = 134, crit_def = 69, move_speed = 240}
    };
get_attr(5, 127) ->
    {
        #base_attr{power = 65, anima = 387, energy = 320, concent = 318, method = 131},
        #bt_attr{hp_lim = 11640, mp_lim = 3108, inner_att = 400, outer_att = 472, inner_def = 993, outer_def = 1218, hit = 1003, dodge = 199, crit_hurt = 135, crit_def = 70, move_speed = 240}
    };
get_attr(5, 128) ->
    {
        #base_attr{power = 65, anima = 390, energy = 322, concent = 320, method = 132},
        #bt_attr{hp_lim = 11730, mp_lim = 3132, inner_att = 403, outer_att = 475, inner_def = 1000, outer_def = 1227, hit = 1010, dodge = 200, crit_hurt = 136, crit_def = 70, move_speed = 240}
    };
get_attr(5, 129) ->
    {
        #base_attr{power = 66, anima = 393, energy = 325, concent = 323, method = 133},
        #bt_attr{hp_lim = 11820, mp_lim = 3156, inner_att = 406, outer_att = 479, inner_def = 1008, outer_def = 1236, hit = 1018, dodge = 202, crit_hurt = 137, crit_def = 71, move_speed = 240}
    };
get_attr(5, 130) ->
    {
        #base_attr{power = 66, anima = 396, energy = 327, concent = 325, method = 134},
        #bt_attr{hp_lim = 11910, mp_lim = 3180, inner_att = 409, outer_att = 482, inner_def = 1015, outer_def = 1245, hit = 1025, dodge = 203, crit_hurt = 138, crit_def = 71, move_speed = 240}
    };
get_attr(5, 131) ->
    {
        #base_attr{power = 67, anima = 399, energy = 330, concent = 328, method = 135},
        #bt_attr{hp_lim = 12000, mp_lim = 3204, inner_att = 412, outer_att = 486, inner_def = 1023, outer_def = 1254, hit = 1033, dodge = 205, crit_hurt = 139, crit_def = 72, move_speed = 240}
    };
get_attr(5, 132) ->
    {
        #base_attr{power = 67, anima = 402, energy = 332, concent = 330, method = 136},
        #bt_attr{hp_lim = 12090, mp_lim = 3228, inner_att = 415, outer_att = 489, inner_def = 1030, outer_def = 1263, hit = 1040, dodge = 206, crit_hurt = 140, crit_def = 72, move_speed = 240}
    };
get_attr(5, 133) ->
    {
        #base_attr{power = 68, anima = 405, energy = 335, concent = 333, method = 137},
        #bt_attr{hp_lim = 12180, mp_lim = 3252, inner_att = 418, outer_att = 493, inner_def = 1038, outer_def = 1272, hit = 1048, dodge = 208, crit_hurt = 141, crit_def = 73, move_speed = 240}
    };
get_attr(5, 134) ->
    {
        #base_attr{power = 68, anima = 408, energy = 337, concent = 335, method = 138},
        #bt_attr{hp_lim = 12270, mp_lim = 3276, inner_att = 421, outer_att = 496, inner_def = 1045, outer_def = 1281, hit = 1055, dodge = 209, crit_hurt = 142, crit_def = 73, move_speed = 240}
    };
get_attr(5, 135) ->
    {
        #base_attr{power = 69, anima = 411, energy = 340, concent = 338, method = 139},
        #bt_attr{hp_lim = 12360, mp_lim = 3300, inner_att = 424, outer_att = 500, inner_def = 1053, outer_def = 1290, hit = 1063, dodge = 211, crit_hurt = 143, crit_def = 74, move_speed = 240}
    };
get_attr(5, 136) ->
    {
        #base_attr{power = 69, anima = 414, energy = 342, concent = 340, method = 140},
        #bt_attr{hp_lim = 12450, mp_lim = 3324, inner_att = 427, outer_att = 503, inner_def = 1060, outer_def = 1299, hit = 1070, dodge = 212, crit_hurt = 144, crit_def = 74, move_speed = 240}
    };
get_attr(5, 137) ->
    {
        #base_attr{power = 70, anima = 417, energy = 345, concent = 343, method = 141},
        #bt_attr{hp_lim = 12540, mp_lim = 3348, inner_att = 430, outer_att = 507, inner_def = 1068, outer_def = 1308, hit = 1078, dodge = 214, crit_hurt = 145, crit_def = 75, move_speed = 240}
    };
get_attr(5, 138) ->
    {
        #base_attr{power = 70, anima = 420, energy = 347, concent = 345, method = 142},
        #bt_attr{hp_lim = 12630, mp_lim = 3372, inner_att = 433, outer_att = 510, inner_def = 1075, outer_def = 1317, hit = 1085, dodge = 215, crit_hurt = 146, crit_def = 75, move_speed = 240}
    };
get_attr(5, 139) ->
    {
        #base_attr{power = 71, anima = 423, energy = 350, concent = 348, method = 143},
        #bt_attr{hp_lim = 12720, mp_lim = 3396, inner_att = 436, outer_att = 514, inner_def = 1083, outer_def = 1326, hit = 1093, dodge = 217, crit_hurt = 147, crit_def = 76, move_speed = 240}
    };
get_attr(5, 140) ->
    {
        #base_attr{power = 71, anima = 426, energy = 352, concent = 350, method = 144},
        #bt_attr{hp_lim = 12810, mp_lim = 3420, inner_att = 439, outer_att = 517, inner_def = 1090, outer_def = 1335, hit = 1100, dodge = 218, crit_hurt = 148, crit_def = 76, move_speed = 240}
    };
get_attr(5, 141) ->
    {
        #base_attr{power = 72, anima = 429, energy = 355, concent = 353, method = 145},
        #bt_attr{hp_lim = 12900, mp_lim = 3444, inner_att = 442, outer_att = 521, inner_def = 1098, outer_def = 1344, hit = 1108, dodge = 220, crit_hurt = 149, crit_def = 77, move_speed = 240}
    };
get_attr(5, 142) ->
    {
        #base_attr{power = 72, anima = 432, energy = 357, concent = 355, method = 146},
        #bt_attr{hp_lim = 12990, mp_lim = 3468, inner_att = 445, outer_att = 524, inner_def = 1105, outer_def = 1353, hit = 1115, dodge = 221, crit_hurt = 150, crit_def = 77, move_speed = 240}
    };
get_attr(5, 143) ->
    {
        #base_attr{power = 73, anima = 435, energy = 360, concent = 358, method = 147},
        #bt_attr{hp_lim = 13080, mp_lim = 3492, inner_att = 448, outer_att = 528, inner_def = 1113, outer_def = 1362, hit = 1123, dodge = 223, crit_hurt = 151, crit_def = 78, move_speed = 240}
    };
get_attr(5, 144) ->
    {
        #base_attr{power = 73, anima = 438, energy = 362, concent = 360, method = 148},
        #bt_attr{hp_lim = 13170, mp_lim = 3516, inner_att = 451, outer_att = 531, inner_def = 1120, outer_def = 1371, hit = 1130, dodge = 224, crit_hurt = 152, crit_def = 78, move_speed = 240}
    };
get_attr(5, 145) ->
    {
        #base_attr{power = 74, anima = 441, energy = 365, concent = 363, method = 149},
        #bt_attr{hp_lim = 13260, mp_lim = 3540, inner_att = 454, outer_att = 535, inner_def = 1128, outer_def = 1380, hit = 1138, dodge = 226, crit_hurt = 153, crit_def = 79, move_speed = 240}
    };
get_attr(5, 146) ->
    {
        #base_attr{power = 74, anima = 444, energy = 367, concent = 365, method = 150},
        #bt_attr{hp_lim = 13350, mp_lim = 3564, inner_att = 457, outer_att = 538, inner_def = 1135, outer_def = 1389, hit = 1145, dodge = 227, crit_hurt = 154, crit_def = 79, move_speed = 240}
    };
get_attr(5, 147) ->
    {
        #base_attr{power = 75, anima = 447, energy = 370, concent = 368, method = 151},
        #bt_attr{hp_lim = 13440, mp_lim = 3588, inner_att = 460, outer_att = 542, inner_def = 1143, outer_def = 1398, hit = 1153, dodge = 229, crit_hurt = 155, crit_def = 80, move_speed = 240}
    };
get_attr(5, 148) ->
    {
        #base_attr{power = 75, anima = 450, energy = 372, concent = 370, method = 152},
        #bt_attr{hp_lim = 13530, mp_lim = 3612, inner_att = 463, outer_att = 545, inner_def = 1150, outer_def = 1407, hit = 1160, dodge = 230, crit_hurt = 156, crit_def = 80, move_speed = 240}
    };
get_attr(5, 149) ->
    {
        #base_attr{power = 76, anima = 453, energy = 375, concent = 373, method = 153},
        #bt_attr{hp_lim = 13620, mp_lim = 3636, inner_att = 466, outer_att = 549, inner_def = 1158, outer_def = 1416, hit = 1168, dodge = 232, crit_hurt = 157, crit_def = 81, move_speed = 240}
    };
get_attr(5, 150) ->
    {
        #base_attr{power = 76, anima = 456, energy = 377, concent = 375, method = 154},
        #bt_attr{hp_lim = 13710, mp_lim = 3660, inner_att = 469, outer_att = 552, inner_def = 1165, outer_def = 1425, hit = 1175, dodge = 233, crit_hurt = 158, crit_def = 81, move_speed = 240}
    };
get_attr(_Career, _Level) ->
    ?ERROR("get_attr(~p, ~p) error !", [_Career, _Level]),
    {#base_attr{}, #bt_attr{}}.


%% @doc 获取职业最大等级
%% @spec get_max_lv(Career) -> MaxLv.
%% Career = MaxLevel    :: integer()
get_max_lv(1) -> 150;
get_max_lv(2) -> 150;
get_max_lv(3) -> 150;
get_max_lv(4) -> 150;
get_max_lv(5) -> 150;
get_max_lv(_Career) -> 0.
