%%-------------------------------------------------------
%% @File     : lib_scene_arena
%% @Brief    : 竞技场场景逻辑
%% @Author   : cablsbs
%% @Date     : 2018-8-23
%%-------------------------------------------------------
-module(lib_scene_arena).

-include("log.hrl").
-include("scene.hrl").
-include("skill.hrl").
-include("battle.hrl").
-include("proto/prot_901.hrl").

-export([
    role_enter/3,
    role_leave/2,
    obj_die_check/3,
    arena_round_end/3,
    init_arena_rival/2
]).

-define(RIVAL_ROLE_ID, 1).

%% Apis -------------------------------------------------

%% @doc 竞技场回合开始
init_arena_rival(RivalRole, _RivalPets) ->
    put_rival_id(RivalRole#scene_role.id),
    PEffectMap = lib_skill_util:gen_passive_effects(RivalRole#scene_role.skill_list),
    PEffectAttr = lib_effect_util:calc_passive_effect_attr(PEffectMap),
    BtAttr = lib_effect_util:parse_effect_attr(PEffectAttr, [], RivalRole#scene_role.attr),
    {BornX, BornY} = config:get_sys_config(arena_rival_pos),
    RolerFight = RivalRole#scene_role{
        id = ?RIVAL_ROLE_ID, hp = BtAttr#bt_attr.hp_lim, x = BornX, y = BornY,
        bt_attr = BtAttr, peffect_attr = PEffectAttr, peffect_map = PEffectMap
    },
    lib_scene_agent:put_roler(RolerFight#scene_role{statem = #statem{}, sid = undefined}),
    AliveRivals = [{?BATTLE_ROLE, ?RIVAL_ROLE_ID}],
    put_alive_objs(rival, AliveRivals),
    ok.

role_enter(?SCENE_ARENA, RoleId, RoleSid) ->
    arena_round_beg(RoleId),
    PetIds = lib_pet_agent:get_ids(),
    lib_obj_role:send_pet_skills(RoleSid, PetIds),
    RivalRole = lib_scene_agent:get_roler(?RIVAL_ROLE_ID),
    RivalSkillL = [{S#skill.id, S#skill.level} || S <- RivalRole#scene_role.skill_list],
    RivalSkill = #obj_skill{type = ?BATTLE_ROLE, id = ?RIVAL_ROLE_ID, skill_list = RivalSkillL},
    ObjSkillMsg = #notify_obj_skills{obj_skills = [RivalSkill]},
    {ok, ObjSkillBin} = prot_msg:encode_msg(90111, ObjSkillMsg),
    lib_role_send:send_to_sid(RoleSid, ObjSkillBin),
    Owner = #{id => RoleId, sid => RoleSid},
    RivalRoleN = RivalRole#scene_role{owner = Owner},
    lib_scene_agent:put_roler(RivalRoleN);
role_enter(_, _, _RoleSid) ->
    skip.

%% @doc 角色退出场景
role_leave(?SCENE_ARENA, RoleId) ->
    case get_challenger() of
        RoleId when is_integer(RoleId) ->
            arena_round_end(?SCENE_ARENA, RoleId, failed);
        undefined ->
            skip
    end;
role_leave(_SceneType, _RoleId) ->
    skip.

%% @doc 对象死亡检测
obj_die_check(?SCENE_ARENA, ObjType, ObjId) ->
    ObjKey = {ObjType, ObjId},
    NotSettled = not_settled(),
    if
        NotSettled ->
            RoleId = get_challenger(),
            Rivals = get_alive_objs(rival),
            RivalsN = lists:delete(ObjKey, Rivals),
            put_alive_objs(rival, RivalsN),
            Selfs = get_alive_objs(self),
            SelfsN = lists:delete(ObjKey, Selfs),
            put_alive_objs(self, SelfsN),
            if
                RivalsN =:= [] ->
                    arena_round_end(?SCENE_ARENA, RoleId, succeed);
                SelfsN =:= [] ->
                    arena_round_end(?SCENE_ARENA, RoleId, failed);
                true ->
                    skip
            end;
        true ->
            skip
    end;
obj_die_check(_, _ObjType, _ObjId) ->
    ignore.

%% @doc 竞技场回合开始
arena_round_beg(RoleId) ->
    put_challenger(RoleId),
    RoundTime = config:get_sys_config(arena_round_time) * 1000,
    Timer = erlang:send_after(RoundTime, self(), {'end_arena_round', RoleId}),
    put_round_timer(RoleId, Timer),
    AliveSelfs = [
        {?BATTLE_ROLE, RoleId} |
        [{?BATTLE_PET, PetId} || PetId <- lib_scene_agent:get_role_pet_ids(RoleId)]
    ],
    put_alive_objs(self, AliveSelfs),
    ok.

%% @doc 竞技场回合结束
arena_round_end(?SCENE_ARENA, RoleId, Result) ->
    case erase_rival_id() of
        RivalRoleId when is_integer(RivalRoleId) ->
            clear_arena(),
            case erase_round_timer() of
                {RoleId, Timer} ->
                    util:cancel_timer(Timer),
                    submit_result(?SCENE_ID, RoleId, RivalRoleId, Result);
                {_RoleId, Timer} ->
                    util:cancel_timer(Timer);
                _ ->
                    skip
            end,
            svr_scene_mgr:close_line_later(?SCENE_ID, ?LINE_ID, 2500);
        _ ->
            skip
    end;
arena_round_end(_SceneType, _RoleId, _Result) ->
    skip.

%% Privates ---------------------------------------------

put_rival_id(RivalRoleId) ->
    put(arena_rival_id, RivalRoleId).

erase_rival_id() ->
    erase(arena_rival_id).

put_challenger(RoleId) ->
    put(arena_challenger, RoleId).

get_challenger() ->
    get(arena_challenger).

erase_challenger() ->
    erase(arena_challenger).

put_round_timer(RoleId, TimerRef) ->
    put('arena_round_timer', {RoleId, TimerRef}).

erase_round_timer() ->
    erase('arena_round_timer').

% 更新阵营存活
put_alive_objs(Realm, ObjKeys) ->
    put({arena_survivers, Realm}, ObjKeys).

% 获取阵营存活
get_alive_objs(Realm) ->
    get({arena_survivers, Realm}).

% 是否已结算
not_settled() ->
    Challenger = get_challenger(),
    is_integer(Challenger).

clear_arena() ->
    erase_challenger(),
    lib_obj_role:del_role_pets(?RIVAL_ROLE_ID),
    lib_scene_agent:del_roler(?RIVAL_ROLE_ID).

submit_result(?SCENE_ID_MASTER_ROB, RoleID, TargetID, Result) ->
    svr_master:rob_result(RoleID, TargetID, Result =:= succeed);
submit_result(_SceneID, _RoleID, _TargetID, _Result) ->
    ignore.
