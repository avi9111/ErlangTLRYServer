%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     功能开放、新手步骤
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_func_util).
-author("Ryuu").

-include("func.hrl").
-include("role.hrl").

%% API
-export([
    refresh/1,
    open_list/5,
    get_open_lv/1,
    get_marry_open_lv/0
]).

-define(MODULES, [lib_role_func, lib_role_scenario]).

refresh(PS) ->
    refresh(?MODULES, PS).

refresh([], PS) ->
    PS;
refresh([Mod | T], PS) ->
    case Mod:refresh(PS) of
        NewPS when is_record(NewPS, role_state) ->
            refresh(T, NewPS);
        _ ->
            refresh(T, PS)
    end.

open_list([], _PS, _Opened, _CFunc, Acc) ->
    Acc;
open_list([ID | T], PS, Opened, CFunc, Acc) ->
    Conf = CFunc:get(ID),
    #{open_cond := OpenCond, quick_cond := QuickCond} = Conf,
    case (not sets:is_element(ID, Opened)) andalso
        ((QuickCond =/= [] andalso judge_conditions(QuickCond, PS))
            orelse judge_conditions(OpenCond, PS)) of
        true ->
            open_list(T, PS, Opened, CFunc, [ID | Acc]);
        _ ->
            open_list(T, PS, Opened, CFunc, Acc)
    end.

judge_conditions([], _PS) ->
    true;
judge_conditions([Cond | T], PS) ->
    case judge_condition(Cond, PS) of
        false -> false;
        _ -> judge_conditions(T, PS)
    end.

judge_condition({?FUNC_COND_LV, Lv}, PS) ->
    PS#role_state.level >= Lv;
judge_condition({?FUNC_COND_OPEN_DAYS, Days}, _PS) ->
    util:get_open_days() >= Days;
%%judge_condition({?FUNC_COND_VIP_LV, Lv}, PS) ->
%%    PS#role_state.level >= Lv;
judge_condition({?FUNC_COND_TASK, TaskID}, PS) ->
    lib_role_task:is_finished(PS#role_state.id, TaskID);
judge_condition(_Cond, _PS) ->
    false.

%% -----------------------------------------------------------------------------

get_marry_open_lv() ->
    get_open_lv(?FUNC_MARRY).

%% @doc 获取开放等级
get_open_lv(FuncID) ->
    case conf_func:get(FuncID) of
        #{open_cond := Cond} ->
            util:prop_get_value(?FUNC_COND_LV, Cond, 0);
        _ ->
            0
    end.
