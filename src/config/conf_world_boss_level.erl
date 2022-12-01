%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      世界boss等级配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_world_boss_level).

-include("log.hrl").
-include("proto/prot_ud.hrl").

-export([
    get_boss_attr/2,
    get_harm_rate/2,
    get_dice_drop/2,
    get_kill_drop/2,
    get_auction_conf_belonger/2,
    get_auction_conf_dead/2,
    get_auction_conf_alive/2
]).


%% Apis ------------------------------------------------
%% @doc 获取世界boss属性配置
%% @spec get_boss_attr(BossId, WorldLv) -> AttrList.
%% WorldLv  :: integer()
%% AttrList :: [{Field :: atom(), Val :: integer()}]
get_boss_attr(160101, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160102, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160103, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160201, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160202, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160203, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160301, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160302, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160303, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160401, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160402, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160403, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160501, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160502, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160503, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160601, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160602, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160603, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160701, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160702, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160703, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160801, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160802, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160803, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160901, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160902, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(160903, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(161001, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(161002, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(161003, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(161101, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(161102, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(161103, WorldLv) ->
    if
        WorldLv =< 40 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        WorldLv =< 80 ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000};
        true ->
            #bt_attr{hp_lim = 120000000, hit = 1000, crit_hurt = 1500, crit_def = 1000, att_speed = 6, move_speed = 1000}
    end;
get_boss_attr(_BossId, _WorldLv) ->
    undefined.


%% @doc 获取世界boss伤害系数
%% @spec get_harm_rate(BossId, WorldLv) -> HarmRate.
%% BossId = WorldLv :: integer()
%% HarmRate         :: float()
get_harm_rate(160101, WorldLv) ->
    if
        WorldLv =< 40 -> 1;
        WorldLv =< 80 -> 4.3;
        true -> 4.3
    end;
get_harm_rate(160102, WorldLv) ->
    if
        WorldLv =< 40 -> 1.1;
        WorldLv =< 80 -> 4.4;
        true -> 4.4
    end;
get_harm_rate(160103, WorldLv) ->
    if
        WorldLv =< 40 -> 1.2;
        WorldLv =< 80 -> 4.5;
        true -> 4.5
    end;
get_harm_rate(160201, WorldLv) ->
    if
        WorldLv =< 40 -> 1.3;
        WorldLv =< 80 -> 4.6;
        true -> 4.6
    end;
get_harm_rate(160202, WorldLv) ->
    if
        WorldLv =< 40 -> 1.4;
        WorldLv =< 80 -> 4.7;
        true -> 4.7
    end;
get_harm_rate(160203, WorldLv) ->
    if
        WorldLv =< 40 -> 1.5;
        WorldLv =< 80 -> 4.8;
        true -> 4.8
    end;
get_harm_rate(160301, WorldLv) ->
    if
        WorldLv =< 40 -> 1.6;
        WorldLv =< 80 -> 4.9;
        true -> 4.9
    end;
get_harm_rate(160302, WorldLv) ->
    if
        WorldLv =< 40 -> 1.7;
        WorldLv =< 80 -> 5;
        true -> 5
    end;
get_harm_rate(160303, WorldLv) ->
    if
        WorldLv =< 40 -> 1.8;
        WorldLv =< 80 -> 5.1;
        true -> 5.1
    end;
get_harm_rate(160401, WorldLv) ->
    if
        WorldLv =< 40 -> 1.9;
        WorldLv =< 80 -> 5.2;
        true -> 5.2
    end;
get_harm_rate(160402, WorldLv) ->
    if
        WorldLv =< 40 -> 2;
        WorldLv =< 80 -> 5.3;
        true -> 5.3
    end;
get_harm_rate(160403, WorldLv) ->
    if
        WorldLv =< 40 -> 2.1;
        WorldLv =< 80 -> 5.4;
        true -> 5.4
    end;
get_harm_rate(160501, WorldLv) ->
    if
        WorldLv =< 40 -> 2.2;
        WorldLv =< 80 -> 5.5;
        true -> 5.5
    end;
get_harm_rate(160502, WorldLv) ->
    if
        WorldLv =< 40 -> 2.3;
        WorldLv =< 80 -> 5.6;
        true -> 5.6
    end;
get_harm_rate(160503, WorldLv) ->
    if
        WorldLv =< 40 -> 2.4;
        WorldLv =< 80 -> 5.7;
        true -> 5.7
    end;
get_harm_rate(160601, WorldLv) ->
    if
        WorldLv =< 40 -> 2.5;
        WorldLv =< 80 -> 5.8;
        true -> 5.8
    end;
get_harm_rate(160602, WorldLv) ->
    if
        WorldLv =< 40 -> 2.6;
        WorldLv =< 80 -> 5.9;
        true -> 5.9
    end;
get_harm_rate(160603, WorldLv) ->
    if
        WorldLv =< 40 -> 2.7;
        WorldLv =< 80 -> 6;
        true -> 6
    end;
get_harm_rate(160701, WorldLv) ->
    if
        WorldLv =< 40 -> 2.8;
        WorldLv =< 80 -> 6.1;
        true -> 6.1
    end;
get_harm_rate(160702, WorldLv) ->
    if
        WorldLv =< 40 -> 2.9;
        WorldLv =< 80 -> 6.2;
        true -> 6.2
    end;
get_harm_rate(160703, WorldLv) ->
    if
        WorldLv =< 40 -> 3;
        WorldLv =< 80 -> 6.3;
        true -> 6.3
    end;
get_harm_rate(160801, WorldLv) ->
    if
        WorldLv =< 40 -> 3.1;
        WorldLv =< 80 -> 6.4;
        true -> 6.4
    end;
get_harm_rate(160802, WorldLv) ->
    if
        WorldLv =< 40 -> 3.2;
        WorldLv =< 80 -> 6.5;
        true -> 6.5
    end;
get_harm_rate(160803, WorldLv) ->
    if
        WorldLv =< 40 -> 3.3;
        WorldLv =< 80 -> 6.6;
        true -> 6.6
    end;
get_harm_rate(160901, WorldLv) ->
    if
        WorldLv =< 40 -> 3.4;
        WorldLv =< 80 -> 6.7;
        true -> 6.7
    end;
get_harm_rate(160902, WorldLv) ->
    if
        WorldLv =< 40 -> 3.5;
        WorldLv =< 80 -> 6.8;
        true -> 6.8
    end;
get_harm_rate(160903, WorldLv) ->
    if
        WorldLv =< 40 -> 3.6;
        WorldLv =< 80 -> 6.9;
        true -> 6.9
    end;
get_harm_rate(161001, WorldLv) ->
    if
        WorldLv =< 40 -> 3.7;
        WorldLv =< 80 -> 7;
        true -> 7
    end;
get_harm_rate(161002, WorldLv) ->
    if
        WorldLv =< 40 -> 3.8;
        WorldLv =< 80 -> 7.1;
        true -> 7.1
    end;
get_harm_rate(161003, WorldLv) ->
    if
        WorldLv =< 40 -> 3.9;
        WorldLv =< 80 -> 7.2;
        true -> 7.2
    end;
get_harm_rate(161101, WorldLv) ->
    if
        WorldLv =< 40 -> 4;
        WorldLv =< 80 -> 7.3;
        true -> 7.3
    end;
get_harm_rate(161102, WorldLv) ->
    if
        WorldLv =< 40 -> 4.1;
        WorldLv =< 80 -> 7.4;
        true -> 7.4
    end;
get_harm_rate(161103, WorldLv) ->
    if
        WorldLv =< 40 -> 4.2;
        WorldLv =< 80 -> 7.5;
        true -> 7.5
    end;
get_harm_rate(_BossId, _WorldLv) ->
    1.


%% @doc 获取世界boss骰子掉落
%% @spec get_dice_drop(BossId, WorldLv) -> DropId.
%% BossId = WorldLv :: integer()
%% DropId           :: integer()
get_dice_drop(160101, WorldLv) ->
    if
        WorldLv =< 40 -> 110001;
        WorldLv =< 80 -> 100103;
        true -> 100103
    end;
get_dice_drop(160102, WorldLv) ->
    if
        WorldLv =< 40 -> 110002;
        WorldLv =< 80 -> 100104;
        true -> 100104
    end;
get_dice_drop(160103, WorldLv) ->
    if
        WorldLv =< 40 -> 110003;
        WorldLv =< 80 -> 100104;
        true -> 100104
    end;
get_dice_drop(160201, WorldLv) ->
    if
        WorldLv =< 40 -> 110004;
        WorldLv =< 80 -> 100203;
        true -> 100203
    end;
get_dice_drop(160202, WorldLv) ->
    if
        WorldLv =< 40 -> 110005;
        WorldLv =< 80 -> 100204;
        true -> 100204
    end;
get_dice_drop(160203, WorldLv) ->
    if
        WorldLv =< 40 -> 110006;
        WorldLv =< 80 -> 100204;
        true -> 100204
    end;
get_dice_drop(160301, WorldLv) ->
    if
        WorldLv =< 40 -> 110007;
        WorldLv =< 80 -> 100303;
        true -> 100303
    end;
get_dice_drop(160302, WorldLv) ->
    if
        WorldLv =< 40 -> 110008;
        WorldLv =< 80 -> 100304;
        true -> 100304
    end;
get_dice_drop(160303, WorldLv) ->
    if
        WorldLv =< 40 -> 110009;
        WorldLv =< 80 -> 100304;
        true -> 100304
    end;
get_dice_drop(160401, WorldLv) ->
    if
        WorldLv =< 40 -> 110010;
        WorldLv =< 80 -> 100403;
        true -> 100403
    end;
get_dice_drop(160402, WorldLv) ->
    if
        WorldLv =< 40 -> 110011;
        WorldLv =< 80 -> 100404;
        true -> 100404
    end;
get_dice_drop(160403, WorldLv) ->
    if
        WorldLv =< 40 -> 110012;
        WorldLv =< 80 -> 100404;
        true -> 100404
    end;
get_dice_drop(160501, WorldLv) ->
    if
        WorldLv =< 40 -> 110013;
        WorldLv =< 80 -> 100503;
        true -> 100503
    end;
get_dice_drop(160502, WorldLv) ->
    if
        WorldLv =< 40 -> 110014;
        WorldLv =< 80 -> 100504;
        true -> 100504
    end;
get_dice_drop(160503, WorldLv) ->
    if
        WorldLv =< 40 -> 110015;
        WorldLv =< 80 -> 100504;
        true -> 100504
    end;
get_dice_drop(160601, WorldLv) ->
    if
        WorldLv =< 40 -> 111001;
        WorldLv =< 80 -> 100603;
        true -> 100603
    end;
get_dice_drop(160602, WorldLv) ->
    if
        WorldLv =< 40 -> 111002;
        WorldLv =< 80 -> 100604;
        true -> 100604
    end;
get_dice_drop(160603, WorldLv) ->
    if
        WorldLv =< 40 -> 111003;
        WorldLv =< 80 -> 100604;
        true -> 100604
    end;
get_dice_drop(160701, WorldLv) ->
    if
        WorldLv =< 40 -> 111004;
        WorldLv =< 80 -> 100703;
        true -> 100703
    end;
get_dice_drop(160702, WorldLv) ->
    if
        WorldLv =< 40 -> 111005;
        WorldLv =< 80 -> 100704;
        true -> 100704
    end;
get_dice_drop(160703, WorldLv) ->
    if
        WorldLv =< 40 -> 111006;
        WorldLv =< 80 -> 100704;
        true -> 100704
    end;
get_dice_drop(160801, WorldLv) ->
    if
        WorldLv =< 40 -> 111007;
        WorldLv =< 80 -> 100803;
        true -> 100803
    end;
get_dice_drop(160802, WorldLv) ->
    if
        WorldLv =< 40 -> 111008;
        WorldLv =< 80 -> 100804;
        true -> 100804
    end;
get_dice_drop(160803, WorldLv) ->
    if
        WorldLv =< 40 -> 111009;
        WorldLv =< 80 -> 100804;
        true -> 100804
    end;
get_dice_drop(160901, WorldLv) ->
    if
        WorldLv =< 40 -> 111010;
        WorldLv =< 80 -> 100903;
        true -> 100903
    end;
get_dice_drop(160902, WorldLv) ->
    if
        WorldLv =< 40 -> 111011;
        WorldLv =< 80 -> 100904;
        true -> 100904
    end;
get_dice_drop(160903, WorldLv) ->
    if
        WorldLv =< 40 -> 111012;
        WorldLv =< 80 -> 100904;
        true -> 100904
    end;
get_dice_drop(161001, WorldLv) ->
    if
        WorldLv =< 40 -> 111013;
        WorldLv =< 80 -> 101003;
        true -> 101003
    end;
get_dice_drop(161002, WorldLv) ->
    if
        WorldLv =< 40 -> 111014;
        WorldLv =< 80 -> 101004;
        true -> 101004
    end;
get_dice_drop(161003, WorldLv) ->
    if
        WorldLv =< 40 -> 111015;
        WorldLv =< 80 -> 101004;
        true -> 101004
    end;
get_dice_drop(161101, WorldLv) ->
    if
        WorldLv =< 40 -> 101101;
        WorldLv =< 80 -> 101103;
        true -> 101103
    end;
get_dice_drop(161102, WorldLv) ->
    if
        WorldLv =< 40 -> 101102;
        WorldLv =< 80 -> 101104;
        true -> 101104
    end;
get_dice_drop(161103, WorldLv) ->
    if
        WorldLv =< 40 -> 101102;
        WorldLv =< 80 -> 101104;
        true -> 101104
    end;
get_dice_drop(_BossId, _WorldLv) ->
    undefined.


%% @doc 获取世界boss奖励配置
%% @spec get_kill_drop(BossId, WorldLv) -> DropId.
%% BossId = WorldLv :: integer()
%% DropId           :: integer()
get_kill_drop(160101, WorldLv) ->
    if
        WorldLv =< 40 -> 110001;
        WorldLv =< 80 -> 100103;
        true -> 100103
    end;
get_kill_drop(160102, WorldLv) ->
    if
        WorldLv =< 40 -> 110002;
        WorldLv =< 80 -> 100104;
        true -> 100104
    end;
get_kill_drop(160103, WorldLv) ->
    if
        WorldLv =< 40 -> 110003;
        WorldLv =< 80 -> 100104;
        true -> 100104
    end;
get_kill_drop(160201, WorldLv) ->
    if
        WorldLv =< 40 -> 110004;
        WorldLv =< 80 -> 100203;
        true -> 100203
    end;
get_kill_drop(160202, WorldLv) ->
    if
        WorldLv =< 40 -> 110005;
        WorldLv =< 80 -> 100204;
        true -> 100204
    end;
get_kill_drop(160203, WorldLv) ->
    if
        WorldLv =< 40 -> 110006;
        WorldLv =< 80 -> 100204;
        true -> 100204
    end;
get_kill_drop(160301, WorldLv) ->
    if
        WorldLv =< 40 -> 110007;
        WorldLv =< 80 -> 100303;
        true -> 100303
    end;
get_kill_drop(160302, WorldLv) ->
    if
        WorldLv =< 40 -> 110008;
        WorldLv =< 80 -> 100304;
        true -> 100304
    end;
get_kill_drop(160303, WorldLv) ->
    if
        WorldLv =< 40 -> 110009;
        WorldLv =< 80 -> 100304;
        true -> 100304
    end;
get_kill_drop(160401, WorldLv) ->
    if
        WorldLv =< 40 -> 110010;
        WorldLv =< 80 -> 100403;
        true -> 100403
    end;
get_kill_drop(160402, WorldLv) ->
    if
        WorldLv =< 40 -> 110011;
        WorldLv =< 80 -> 100404;
        true -> 100404
    end;
get_kill_drop(160403, WorldLv) ->
    if
        WorldLv =< 40 -> 110012;
        WorldLv =< 80 -> 100404;
        true -> 100404
    end;
get_kill_drop(160501, WorldLv) ->
    if
        WorldLv =< 40 -> 110013;
        WorldLv =< 80 -> 100503;
        true -> 100503
    end;
get_kill_drop(160502, WorldLv) ->
    if
        WorldLv =< 40 -> 110014;
        WorldLv =< 80 -> 100504;
        true -> 100504
    end;
get_kill_drop(160503, WorldLv) ->
    if
        WorldLv =< 40 -> 110015;
        WorldLv =< 80 -> 100504;
        true -> 100504
    end;
get_kill_drop(160601, WorldLv) ->
    if
        WorldLv =< 40 -> 111001;
        WorldLv =< 80 -> 100603;
        true -> 100603
    end;
get_kill_drop(160602, WorldLv) ->
    if
        WorldLv =< 40 -> 111002;
        WorldLv =< 80 -> 100604;
        true -> 100604
    end;
get_kill_drop(160603, WorldLv) ->
    if
        WorldLv =< 40 -> 111003;
        WorldLv =< 80 -> 100604;
        true -> 100604
    end;
get_kill_drop(160701, WorldLv) ->
    if
        WorldLv =< 40 -> 111004;
        WorldLv =< 80 -> 100703;
        true -> 100703
    end;
get_kill_drop(160702, WorldLv) ->
    if
        WorldLv =< 40 -> 111005;
        WorldLv =< 80 -> 100704;
        true -> 100704
    end;
get_kill_drop(160703, WorldLv) ->
    if
        WorldLv =< 40 -> 111006;
        WorldLv =< 80 -> 100704;
        true -> 100704
    end;
get_kill_drop(160801, WorldLv) ->
    if
        WorldLv =< 40 -> 111007;
        WorldLv =< 80 -> 100803;
        true -> 100803
    end;
get_kill_drop(160802, WorldLv) ->
    if
        WorldLv =< 40 -> 111008;
        WorldLv =< 80 -> 100804;
        true -> 100804
    end;
get_kill_drop(160803, WorldLv) ->
    if
        WorldLv =< 40 -> 111009;
        WorldLv =< 80 -> 100804;
        true -> 100804
    end;
get_kill_drop(160901, WorldLv) ->
    if
        WorldLv =< 40 -> 111010;
        WorldLv =< 80 -> 100903;
        true -> 100903
    end;
get_kill_drop(160902, WorldLv) ->
    if
        WorldLv =< 40 -> 111011;
        WorldLv =< 80 -> 100904;
        true -> 100904
    end;
get_kill_drop(160903, WorldLv) ->
    if
        WorldLv =< 40 -> 111012;
        WorldLv =< 80 -> 100904;
        true -> 100904
    end;
get_kill_drop(161001, WorldLv) ->
    if
        WorldLv =< 40 -> 111013;
        WorldLv =< 80 -> 101003;
        true -> 101003
    end;
get_kill_drop(161002, WorldLv) ->
    if
        WorldLv =< 40 -> 111014;
        WorldLv =< 80 -> 101004;
        true -> 101004
    end;
get_kill_drop(161003, WorldLv) ->
    if
        WorldLv =< 40 -> 111015;
        WorldLv =< 80 -> 101004;
        true -> 101004
    end;
get_kill_drop(161101, WorldLv) ->
    if
        WorldLv =< 40 -> 101101;
        WorldLv =< 80 -> 101103;
        true -> 101103
    end;
get_kill_drop(161102, WorldLv) ->
    if
        WorldLv =< 40 -> 101102;
        WorldLv =< 80 -> 101104;
        true -> 101104
    end;
get_kill_drop(161103, WorldLv) ->
    if
        WorldLv =< 40 -> 101102;
        WorldLv =< 80 -> 101104;
        true -> 101104
    end;
get_kill_drop(_BossId, _WorldLv) ->
    undefined.


%% @doc 获取世界boss归属者拍卖行奖励配置
%% @spec get_auction_conf_belonger(BossId, WorldLv) -> {ShopItemRatio, ItemNumRatio}.
%% WorldLv      :: integer()
%% RewardList   :: []
get_auction_conf_belonger(160101, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160102, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160103, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160201, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160202, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160203, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160301, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160302, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160303, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160401, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160402, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160403, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160501, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160502, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160503, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160601, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160602, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160603, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160701, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160702, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160703, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160801, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160802, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160803, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160901, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160902, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(160903, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(161001, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(161002, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(161003, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(161101, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(161102, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(161103, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        WorldLv =< 80 ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}};
        true ->
            {[{11,100},{12,200},{13,100},{14,50},{15,50}], {1,2}}
    end;
get_auction_conf_belonger(_BossId, _WorldLv) ->
    undefined.


%% @doc 获取世界boss拍卖行奖励配置(击杀boss)
%% @spec get_auction_conf_dead(BossId, WorldLv) -> {ShopItemRatio, ItemNumRatio}.
%% WorldLv      :: integer()
%% RewardList   :: []
get_auction_conf_dead(160101, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,5}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,38}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,38}]}
    end;
get_auction_conf_dead(160102, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,6}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,39}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,39}]}
    end;
get_auction_conf_dead(160103, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,7}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,40}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,40}]}
    end;
get_auction_conf_dead(160201, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,8}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,41}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,41}]}
    end;
get_auction_conf_dead(160202, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,9}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,42}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,42}]}
    end;
get_auction_conf_dead(160203, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,10}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,43}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,43}]}
    end;
get_auction_conf_dead(160301, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,11}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,44}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,44}]}
    end;
get_auction_conf_dead(160302, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,12}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,45}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,45}]}
    end;
get_auction_conf_dead(160303, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,13}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,46}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,46}]}
    end;
get_auction_conf_dead(160401, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,14}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,47}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,47}]}
    end;
get_auction_conf_dead(160402, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,15}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,48}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,48}]}
    end;
get_auction_conf_dead(160403, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,16}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,49}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,49}]}
    end;
get_auction_conf_dead(160501, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,17}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,50}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,50}]}
    end;
get_auction_conf_dead(160502, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,18}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,51}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,51}]}
    end;
get_auction_conf_dead(160503, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,19}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,52}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,52}]}
    end;
get_auction_conf_dead(160601, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,20}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,53}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,53}]}
    end;
get_auction_conf_dead(160602, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,21}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,54}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,54}]}
    end;
get_auction_conf_dead(160603, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,22}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,55}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,55}]}
    end;
get_auction_conf_dead(160701, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,23}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,56}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,56}]}
    end;
get_auction_conf_dead(160702, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,24}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,57}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,57}]}
    end;
get_auction_conf_dead(160703, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,25}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,58}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,58}]}
    end;
get_auction_conf_dead(160801, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,26}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,59}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,59}]}
    end;
get_auction_conf_dead(160802, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,27}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,60}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,60}]}
    end;
get_auction_conf_dead(160803, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,28}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,61}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,61}]}
    end;
get_auction_conf_dead(160901, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,29}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,62}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,62}]}
    end;
get_auction_conf_dead(160902, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,30}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,63}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,63}]}
    end;
get_auction_conf_dead(160903, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,31}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,64}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,64}]}
    end;
get_auction_conf_dead(161001, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,32}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,65}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,65}]}
    end;
get_auction_conf_dead(161002, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,33}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,66}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,66}]}
    end;
get_auction_conf_dead(161003, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,34}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,67}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,67}]}
    end;
get_auction_conf_dead(161101, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,35}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,68}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,68}]}
    end;
get_auction_conf_dead(161102, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,36}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,69}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,69}]}
    end;
get_auction_conf_dead(161103, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,37}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,70}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,2},{20,40,2,3},{40,70,3,4}, {70,100,4,70}]}
    end;
get_auction_conf_dead(_BossId, _WorldLv) ->
    undefined.


%% @doc 获取世界boss拍卖行奖励配置(未击杀boss)
%% @spec get_auction_conf_alive(BossId, WorldLv) -> {ShopItemRatio, ItemNumRatio}.
%% WorldLv      :: integer()
%% RewardList   :: []
get_auction_conf_alive(160101, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160102, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160103, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160201, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160202, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160203, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160301, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160302, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160303, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160401, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160402, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160403, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160501, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160502, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160503, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160601, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160602, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160603, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160701, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160702, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160703, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160801, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160802, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160803, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160901, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160902, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(160903, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(161001, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(161002, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(161003, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(161101, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(161102, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(161103, WorldLv) ->
    if
        WorldLv =< 40 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        WorldLv =< 80 ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]};
        true ->
            {[{1,100},{2,200},{3,100},{4,200},{5,100},{6,100},{7,100},{8,100}], [{0,20,1,1},{20,40,1,2},{40,70,1,3}, {70,100,2,3}]}
    end;
get_auction_conf_alive(_BossId, _WorldLv) ->
    undefined.
