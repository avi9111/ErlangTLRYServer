%%-------------------------------------------------------
%% @File     : effect_shield
%% @Brief    : 护盾效果
%% @Author   : cablsbs
%% @Date     : 2018-8-2
%%-------------------------------------------------------

-module(effect_shield).

-include("battle.hrl").
-include("effect.hrl").

-export([
    on_add/2,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(#effect{id = ShieldId, param = Param, caster = CasterKey}, BtState) ->
    Shield = case lib_battle_aid:get_scene_obj_info(CasterKey) of
        SceneObjInfo when is_tuple(SceneObjInfo) ->
            [ShieldConst, ShieldRatio, CureRatio] = Param,
            CasterBtState = data_transfer:to_bt_state(SceneObjInfo),
            Att = lib_battle_aid:get_att(CasterBtState),
            ShieldLim = ShieldConst + (Att * ShieldRatio) div 10000,
            {ShieldId, ShieldLim, CureRatio};
        _ ->
            undefined
    end,
    BtState#bt_state{shield = Shield}.

% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState#bt_state{shield = undefined}.


%% Privates ---------------------------------------------
