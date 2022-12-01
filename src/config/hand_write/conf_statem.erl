%%-------------------------------------------------------
%% @File     : conf_statem.erl
%% @Brief    : 状态机配置(状态机暂不支持动态添加状态)
%% @Author   : cablsbs
%% @Date     : 2018-6-28
%%-------------------------------------------------------

-module(conf_statem).

-include("log.hrl").
-include("statem.hrl").


-export([
    get_state_mod/2,
    get_state_map/1
]).

get_state_mod(StmType, StId) ->
    StateMap = get_state_map(StmType),
    maps:get(StId, StateMap, statem_default).


get_state_map(?STM_MON) ->
    #{
        ?STATE_IDLE => statem_mon_idle,
        ?STATE_MOVE => statem_mon_move,
        ?STATE_ATTACK => statem_mon_attack,
        ?STATE_DIE => statem_mon_die,
        ?STATE_STAY => statem_mon_stay,
        ?STATE_STOCKPILE => statem_mon_stockpile
    };
get_state_map(?STM_ROLE) ->
    #{
        ?STATE_IDLE => statem_role_idle,
        ?STATE_MOVE => statem_role_move,
        ?STATE_ATTACK => statem_role_attack,
        ?STATE_DIE => statem_role_die,
        ?STATE_SIT => statem_role_sit
    };
get_state_map(?STM_PET) ->
    #{
        ?STATE_IDLE => statem_pet_idle,
        ?STATE_MOVE => statem_pet_move,
        ?STATE_ATTACK => statem_pet_attack,
        ?STATE_DIE => statem_pet_die
    };
get_state_map(?STM_COLL) ->
    #{
        ?STATE_IDLE => statem_coll_idle,
        ?STATE_BECOLLECT => statem_coll_becollect,
        ?STATE_BEOCCUPY => statem_coll_beoccupy
    };
get_state_map(?STM_CARRY) ->
    #{
        ?STATE_IDLE => statem_carry_idle,
        ?STATE_MOVE => statem_carry_move,
        ?STATE_DIE => statem_carry_die
    };
get_state_map(?STM_FLYITEM) ->
    #{
        ?STATE_IDLE => statem_flyitem_idle,
        ?STATE_MOVE => statem_flyitem_move,
        ?STATE_DIE => statem_flyitem_die
    }.

