%%-------------------------------------------------------
%% @File     : statem_pet_die.erl
%% @Brief    : 宠物死亡状态
%% @Author   : cablsbs
%% @Date     : 2018-7-19
%%-------------------------------------------------------

-module(statem_pet_die).

-include("scene.hrl").
-include("battle.hrl").
-include("proto/prot_901.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).

% 默认复活时间
-define(PET_REVIVE_TIME, 30000).

%% Callbacks --------------------------------------------
% stop move, set pos to invisble notify, leave area
state_enter([_BtRetAtter, _NowTimeMS], State) ->
    lib_scene_arena:obj_die_check(?SCENE_TYPE, ?BATTLE_PET, State#pet.id),
    lib_obj_util:bcast_die(?BATTLE_PET, State#pet.id, State#pet.x, State#pet.y),
    lib_scene_cmd:scene_cmd('effect_dead_clear', {?BATTLE_PET, State#pet.id}),
    StateT = State#pet{hp = 0, shield = undefined},
    StateN = lib_obj_pet:hide_pet(StateT),
    StateN.

% 30S to revive
state_update(_NowTime, _ElapseTime, #pet{statem = Statem} = State) when Statem#statem.state_time < ?PET_REVIVE_TIME ->
    State;
state_update(_NowTime, _ElapseTime, State) ->
    StateN = lib_statem:change_state(?STATE_IDLE, [], #pet.statem, State),
    StateN.

% set hp full, set pos to role nearby, bcast enter area
state_quit(State) ->
    #pet{
        id = PetId, bt_attr = #bt_attr{hp_lim = PetHpLim},
        owner = #{id := OwnerId, sid := OwnerSid}
    } = State,
    PetHpLim = (State#pet.bt_attr)#bt_attr.hp_lim,
    #scene_role{hp = OwnerHp, x = OwnerX, y = OwnerY} = lib_scene_agent:get_roler(OwnerId),
    StateN = case OwnerHp > 0 of
        true -> lib_obj_pet:show_pet(OwnerX, OwnerY, State#pet{hp = PetHpLim});
        false -> State#pet{hp = PetHpLim}
    end,

    % 通知珍兽复活
    PetReviveMsg = #notify_pet_revive{id = PetId, hp = PetHpLim, hp_lim = PetHpLim},
    {ok, PetReviveBin} = prot_msg:encode_msg(90108, PetReviveMsg),
    lib_role_send:send_to_sid(OwnerSid, PetReviveBin),
    StateN.


%% Privates ---------------------------------------------
