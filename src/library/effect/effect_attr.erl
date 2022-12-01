%%-------------------------------------------------------
%% @File     : effect_attr
%% @Brief    : 属性效果
%% @Author   : cablsbs
%% @Date     : 2018-7-31
%%-------------------------------------------------------

-module(effect_attr).

-include("battle.hrl").
-include("effect.hrl").
-include("scene_objs.hrl").

-export([
    on_add/2,
    on_del/2
]).


%% Apis ------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtStateN = recalc_attr(BtState),
    BtStateN.

% @spec on_del(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtStateN = recalc_attr(BtState),
    BtStateN.


%% Privates ---------------------------------------------
recalc_attr(BtState) ->
    #bt_state{
        type = ObjType, id = ObjId, hp = ObjHp, mp = ObjMp,
        x = X, y = Y, attr = BtAttrO, effect_list = EffectList
    } = BtState,
    ObjInfo = lib_battle_aid:get_scene_obj_info({ObjType, ObjId}),
    BtAttrN = case ObjInfo of
        #scene_role{gm_rate = GmRate, attr = BtAttr, pet_addon = PetAddon, peffect_attr = PEffectAttr} ->
            MoveSpeed = (ObjInfo#scene_role.bt_attr)#bt_attr.move_speed,
            BtAttrT0 = lib_effect_util:parse_effect_attr(PEffectAttr, EffectList, BtAttr),
            BtAttrT1 = lib_role_attr:mul_attr(BtAttrT0, GmRate),
            BtAttrT2 = lib_role_attr:add_attr(BtAttrT1, PetAddon),
            HpLim = max(1, BtAttrT2#bt_attr.hp_lim),

            BtAttrT3 = BtAttrT2#bt_attr{
                hp_lim = HpLim,
                mp_lim = BtAttrT0#bt_attr.mp_lim,
                att_speed = BtAttrT0#bt_attr.att_speed,
                move_speed = BtAttrT0#bt_attr.move_speed
            },
            BtAttrT = lib_role_attr:alter_attrs(BtAttrT3, ObjInfo#scene_role.gm_attrs),
            ObjInfoT = ObjInfo#scene_role{bt_attr = BtAttrT},
            MoveSpeedN = lib_obj_role:recalc_move_speed(ObjInfoT, MoveSpeed),
            BtAttrT#bt_attr{move_speed = MoveSpeedN};
        #pet{attr = Attr, peffect_attr = PEffectAttr} ->
            MoveSpeed = (ObjInfo#pet.bt_attr)#bt_attr.move_speed,
            BtAttrT = lib_effect_util:parse_effect_attr(PEffectAttr, EffectList, Attr),
            HpLim = max(1, BtAttrT#bt_attr.hp_lim),
            BtAttrT#bt_attr{hp_lim = HpLim, move_speed = MoveSpeed};
        #mon{attr = BaseAttr, bt_attr = BtAttr} = Mon ->
            BtAttrT = lib_effect_util:parse_effect_attr(#{}, EffectList, BaseAttr),
            HpLim = max(1, BtAttrT#bt_attr.hp_lim),
            BtAttrT#bt_attr.move_speed =/= BtAttr#bt_attr.move_speed andalso
                lib_obj_util:bcast_speed_change(Mon, BtAttrT#bt_attr.move_speed),
            BtAttrT#bt_attr{hp_lim = HpLim}
    end,
    HpN = min(ObjHp, BtAttrN#bt_attr.hp_lim),
    BtAttrO#bt_attr.hp_lim =/= BtAttrN#bt_attr.hp_lim andalso
        lib_obj_util:bcast_hp_change(X, Y, ObjType, ObjId, HpN, BtAttrN#bt_attr.hp_lim),
    MpN = min(ObjMp, BtAttrN#bt_attr.mp_lim),
    ObjType =:= ?BATTLE_ROLE andalso BtAttrO#bt_attr.mp_lim =/= BtAttrN#bt_attr.mp_lim andalso
        lib_obj_role:bcast_mp_change(ObjInfo#scene_role{bt_attr = BtAttrN}, MpN),
    BtState#bt_state{hp = HpN, mp = MpN, attr = BtAttrN}.


