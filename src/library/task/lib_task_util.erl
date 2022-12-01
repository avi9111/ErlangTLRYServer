%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     任务
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_task_util).
-author("Ryuu").

-include("role.hrl").
-include("task.hrl").
-include("keyvalue.hrl").

%% API
-export([
    action/2,
    init_task/2,
    init_task/3,
    mask_done/1,
    finish_masks/1,
    task_actions/3
]).

-export([
    task_cate/1,
    task_name/1,
    task_type/1
]).

-define(MODULES, [lib_role_task, lib_role_society, lib_role_achieve, lib_role_mentor]).

action(PS, Action) ->
    action(?MODULES, Action, PS).

action([], _Action, PS) ->
    PS;
action([Mod | T], Action, PS) ->
    case Mod:action(PS, Action) of
        NewPS when is_record(NewPS, role_state) ->
            action(T, Action, NewPS);
        _ ->
            action(T, Action, PS)
    end.

init_task(PS, ConfTask) ->
    init_task(PS, ConfTask, ?TASK_STAT_UNDEFINED).

init_task(PS, ConfTask, Stat0) ->
    NowTime = time:unixtime(),
    #{id := TaskID, finish_cond := FinishCond} = ConfTask,
    Masks = init_masks(FinishCond, PS, []),
    Stat = if
        Stat0 > ?TASK_STAT_UNDEFINED -> Stat0;
        true -> ?iif(mask_done(Masks), ?TASK_STAT_FINISHED, ?TASK_STAT_ACCEPTED)
    end,
    ?task#{
        id => TaskID, stat => Stat, accept_time => NowTime, last_update => NowTime,
        masks => Masks
    }.

init_masks([], _PS, Acc) ->
    lists:reverse(Acc);
init_masks([{Type, Total, Param} | T], PS, Acc) ->
    Pgs = init_mask(Type, Param, PS),
    Mask = #{type => Type, current => Pgs, total => Total, param => Param},
    init_masks(T, PS, [Mask | Acc]).

init_mask(?MASK_ROLE_LEVEL, _, PS) ->
    PS#role_state.level;
init_mask(?MASK_JOIN_GUILD, _, PS) ->
    ?iif(PS#role_state.guild_id > 0, 1, 0);
init_mask(?MASK_FRIEND_NUM, _, PS) ->
    lib_friend:get_friend_num(PS#role_state.id);
init_mask(?MASK_STREN_LV, _, PS) ->
    lib_role_equip:get_total_stren_lv(PS#role_state.id);
init_mask(?MASK_STREN_NUM, [Lv], PS) ->
    lib_role_equip:get_lv_stren_num(PS#role_state.id, Lv);
init_mask(?MASK_STONE_LV, _, PS) ->
    lib_role_equip:get_total_stone_lv(PS#role_state.id);
init_mask(?MASK_STONE_NUM, [Lv], PS) ->
    lib_role_equip:get_lv_stone_num(PS#role_state.id, Lv);
init_mask(?MASK_PET_STAR, [Lv], _PS) ->
    lib_role_pet:get_lv_pet_num(Lv);
init_mask(?MASK_PET_SAVVY, [Lv], _PS) ->
    lib_role_pet:get_lv_savvy_num(Lv);
init_mask(?MASK_PASS_DUNG, [DungID, Lv | _], PS) ->
    ?iif(lib_role_dungeon:is_passed(PS#role_state.id, DungID, Lv), 1, 0);
init_mask(?MASK_LIVELY, _, PS) ->
    lib_role_daily_lively:calc_lively(PS#role_state.id);
init_mask(?MASK_FIGHT, [Fight], PS) ->
    ?iif(PS#role_state.combat_power >= Fight, 1, 0);
init_mask(?MASK_ACTIVE_HERO, _, PS) ->
    lib_role_hero:active_num(PS#role_state.id);
init_mask(?MASK_SKILL_LEVEL, [Lv], PS) ->
    lib_role_skill:get_skill_num(PS, Lv);
init_mask(?MASK_ARTIFACT_LV, _, PS) ->
    lib_role_artifact:get_level(PS#role_state.id);
init_mask(?MASK_PET_SKILL, _, _PS) ->
    lib_role_pet:get_lv_skill_num(1);
init_mask(?MASK_NEW_STEP, [ID], PS) ->
    ?iif(lib_role_func:is_step_active(PS#role_state.id, ID), 1, 0);
init_mask(?MASK_ACTIVE_HERO2, [ID], PS) ->
    ?iif(lib_role_hero:is_active(PS#role_state.id, ID), 1, 0);
init_mask(?MASK_DAILY_TASK, _, PS) ->
    lib_role_kv:get_counter(PS#role_state.id, ?KEY_DAILY_TASK_TIMES);
init_mask(?MASK_ACTIVE_ARTIFACT, _, PS) ->
    ?iif(lib_role_artifact:check_artifact_open(PS#role_state.id), 1, 0);
init_mask(?MASK_UPGRADE_HONOR, _, PS) ->
    ?iif(lib_role_title_honor:has_title(PS), 1, 0);
init_mask(?MASK_DUNG_FIRST, [DungID], PS) ->
    lib_role_dungeon:got_first_reward_num(PS#role_state.id, DungID);
init_mask(?MASK_DUNG_CHAP_FIRST, [DungID, Chapter], PS) ->
    ?iif(lib_role_dungeon:chapter_first_got(PS#role_state.id, DungID, Chapter), 1, 0);
init_mask(?MASK_ANQI_PRACTICE, _, PS) ->
    lib_role_anqi:get_prac_lv(PS#role_state.id);
init_mask(?MASK_ANQI_LV, _, PS) ->
    lib_role_anqi:get_qlv(PS#role_state.id);
init_mask(?MASK_FORGE_ARTIFACT_F, _, PS) ->
    lib_role_artifact:get_full_forge_num(PS#role_state.id);
init_mask(?MASK_SUIT_STONE_LV, _, PS) ->
    lib_role_equip:get_suit_stone_lv(PS#role_state.id);
init_mask(?MASK_ADD_SWORN, _, PS) ->
    ?iif(lib_role_sworn:is_sworn(PS#role_state.id), 1, 0);
init_mask(?MASK_OPEN_HALL, _, PS) ->
    lib_role_kv:get_kv(PS#role_state.id, ?KEY_MARRY_OPEN_HELL, 0);
init_mask(?MASK_CRUISE, _, PS) ->
    lib_role_kv:get_kv(PS#role_state.id, ?KEY_MARRY_START_PARADE, 0);
init_mask(?MASK_TREASURE_TASK, _, PS) ->
    lib_role_treasure_map:get_daily_times(PS#role_state.id);
init_mask(?MASK_PART_THIEF, _, _PS) ->
    lib_role_daily_thief:get_daily_times();
init_mask(?MASK_PART_EXAMINE, _, PS) ->
    lib_role_examine:get_answer_num(PS#role_state.id);
init_mask(?MASK_PART_ROBBER, _, PS) ->
    lib_role_daily_robber:get_daily_times(PS#role_state.id);
init_mask(?MASK_GUILD_TASK, _, PS) ->
    lib_role_guild_task:get_daily_times(PS#role_state.id);
init_mask(_, _, _PS) ->
    0.

task_actions(Tasks, PS, Action) ->
    task_actions(Tasks, PS, Action, [], []).

task_actions([], _PS, _Action, Acc, UAcc) ->
    {lists:reverse(Acc), UAcc};
task_actions([#{stat := ?TASK_STAT_ACCEPTED} = Task | T], PS, Action, Acc, UAcc) ->
    #{masks := Masks} = Task,
    NewMasks = mask_actions(Masks, PS, Action, []),
    case mask_done(NewMasks) of
        true ->
            NewTask = Task#{masks => NewMasks, stat => ?TASK_STAT_FINISHED};
        _ ->
            NewTask = Task#{masks => NewMasks}
    end,
    NewUAcc = ?iif(NewMasks =/= Masks, [NewTask | UAcc], UAcc),
    task_actions(T, PS, Action, [NewTask | Acc], NewUAcc);
task_actions([Task | T], PS, Action, Acc, UAcc) ->
    task_actions(T, PS, Action, [Task | Acc], UAcc).

mask_actions([], _PS, _Action, Acc) ->
    lists:reverse(Acc);
mask_actions([Mask | T], PS, Action, Acc) ->
    #{type := Type} = Mask,
    NewMask = mask_action(Type, PS, Mask, Action),
    mask_actions(T, PS, Action, [NewMask | Acc]).

mask_action(_, _, #{current := Pgs, total := Total} = Mask, _Action) when Pgs >= Total ->
    Mask;
mask_action(?MASK_ROLE_LEVEL, PS, Mask, upgrade) ->
    Mask#{current => PS#role_state.level};
mask_action(?MASK_JOIN_GUILD, _, Mask, join_guild) ->
    Mask#{current => 1};
mask_action(?MASK_FRIEND_NUM, _, Mask, {friend, Num}) ->
    Mask#{current => Num};
mask_action(?MASK_STREN_LV, PS, Mask, stren_equip) ->
    Mask#{current => lib_role_equip:get_total_stren_lv(PS#role_state.id)};
mask_action(?MASK_STREN_NUM, PS, #{param := [Lv]} = Mask, stren_equip) ->
    Mask#{current => lib_role_equip:get_lv_stren_num(PS#role_state.id, Lv)};
mask_action(?MASK_STONE_LV, PS, Mask, inlay_stone) ->
    Mask#{current => lib_role_equip:get_total_stone_lv(PS#role_state.id)};
mask_action(?MASK_STONE_NUM, PS, #{param := [Lv]} = Mask, inlay_stone) ->
    Mask#{current => lib_role_equip:get_lv_stone_num(PS#role_state.id, Lv)};
mask_action(?MASK_PET_STAR, _, #{param := [Lv]} = Mask, upgrade_pet) ->
    Mask#{current => lib_role_pet:get_lv_pet_num(Lv)};
mask_action(?MASK_PET_SAVVY, _, #{param := [Lv]} = Mask, 'upgrade_pet') ->
    Mask#{current => lib_role_pet:get_lv_savvy_num(Lv)};
mask_action(?MASK_PET_SAVVY, _, #{param := [Lv]} = Mask, {'upgrade_savvy', _}) ->
    Mask#{current => lib_role_pet:get_lv_savvy_num(Lv)};
mask_action(?MASK_KILL_MON, _, #{param := [SceneID, MonID]} = Mask, {kill_mon, TSceneID, TMonID})
    when (SceneID =:= 0 orelse SceneID =:= TSceneID), (MonID =:= 0 orelse TMonID =:= MonID) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_PASS_DUNG, PS, #{param := [DungID, Lv | _]} = Mask, {pass_dung, DungID, _}) ->
    Mask#{current => ?iif(lib_role_dungeon:is_passed(PS#role_state.id, DungID, Lv), 1, 0)};
mask_action(?MASK_CHAL_DUNG, _PS, #{param := [DungID, Lv | _]} = Mask, {pass_dung, DungID, Lv}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_CHAL_DUNG_TIMES, _PS, #{param := [DungID]} = Mask, {pass_dung, DungID, _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_COLL, _, #{param := [SceneID, CollID]} = Mask, {collect, SceneID, CollID}) -> %% p
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_DAILY_TASK, _, Mask, fin_daily_task) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_LIVELY, PS, Mask, daily_lively) ->
    Mask#{current => lib_role_daily_lively:calc_lively(PS#role_state.id)};
mask_action(?MASK_BUY_ITEM, _, #{param := [ShopID, ItemID]} = Mask, {buy_item, ShopID, ItemID, Num}) ->
    Mask#{current => maps:get(current, Mask) + Num};
mask_action(?MASK_ADV_STONE, _, #{param := [Lv]} = Mask, {adv_stone, TLv}) when TLv >= Lv ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_HATCH_PET, _, #{param := [Star]} = Mask, {hatch_pet, TStar}) when TStar >= Star ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_PET_SKILL, _PS, Mask, learn_pet_skill) ->
    Mask#{current => lib_role_pet:get_lv_skill_num(1)};
mask_action(?MASK_GUILD_CONT, _PS, Mask, {add_guild_cont, Cont}) ->
    Mask#{current => maps:get(current, Mask) + Cont};
mask_action(?MASK_ACTIVE_HERO, PS, Mask, {active_hero, _}) ->
    Mask#{current => lib_role_hero:active_num(PS#role_state.id)};
mask_action(?MASK_HATCH_PET_TIMES, _, Mask, {'hatch_pet', _Star}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_PART_THIEF, _PS, Mask, {'part_thief', _, _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_PART_EXAMINE, _PS, Mask, {'part_examine', _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_PART_ROBBER, _PS, Mask, part_robber) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_TREASURE_MAP, _PS, #{param := [ID]} = Mask, {'use_treasure_map', ID}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_TREASURE_MAP, _PS, #{param := []} = Mask, {'use_treasure_map', _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_GUILD_TASK, _PS, Mask, fin_guild_task) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_SKILL_LEVEL, PS, #{param := [Lv]} = Mask, upgrade_skill) ->
    Mask#{current => lib_role_skill:get_skill_num(PS, Lv)};
mask_action(?MASK_MONTH_CARD, _PS, Mask, buy_month_card) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_GUILD_PRACTICE, _PS, Mask, part_guild_practice) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_DYNASTY_WAR, _PS, Mask, {'part_dynasty_war', _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_ARTIFACT_LV, PS, Mask, upgrade_artifact) ->
    Mask#{current => lib_role_artifact:get_level(PS#role_state.id)};
mask_action(?MASK_PET_GROW, _PS, #{param := [Lv]} = Mask, {pet_grow, Lv}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_GUILD_CARRY, _PS, Mask, part_guild_carry) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_DAILY_GIFT, _PS, #{param := [Grade]} = Mask, {daily_gift, Grade}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_FIGHT, PS, #{param := [Fight]} = Mask, fight_up) ->
    Mask#{current => ?iif(PS#role_state.combat_power >= Fight, 1, 0)};
mask_action(?MASK_CATCH_PET, _, #{param := [SceneID, _, CollID]} = Mask, {collect, SceneID, CollID}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_NO_REPEAT_COLL, _, #{param := [SceneID, CollID]} = Mask, {collect, SceneID, CollID}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_NO_REPEAT_COLL, _, #{param := [SceneID, CollID, _]} = Mask, {collect, SceneID, CollID}) ->  %% 需要加一个参数跑回NPC处
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_FORGE_ARTIFACT, _, Mask, forge_artifact) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_SMELT_EQUIP, _, Mask, {smelt_equip, N}) ->
    Mask#{current => maps:get(current, Mask) + N};
mask_action(?MASK_PET_GROW_TIMES, _PS, Mask, {pet_grow, _Lv}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_HERO_CULT, _, Mask, {cult_hero, N}) ->
    Mask#{current => maps:get(current, Mask) + N};
mask_action(?MASK_NEW_STEP, _, #{param := [ID]} = Mask, {new_step, ID}) ->
    Mask#{current => 1};
mask_action(?MASK_GUILD_METALL, _, Mask, guild_metall) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_TREASURE_TASK, _, Mask, treasure_task) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_ACTIVE_HERO2, _, #{param := [ID]} = Mask, {active_hero, ID}) ->
    Mask#{current => 1};
mask_action(?MASK_ACTIVE_ARTIFACT, _, Mask, active_artifact) ->
    Mask#{current => 1};
mask_action(?MASK_UPGRADE_HONOR, _, Mask, upgrade_honor) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_CHAT, _, #{param := [ChannelID]} = Mask, {'chat', ChannelID, _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_VOICE_CHAT, _, #{param := [ChannelID]} = Mask, {'chat', ChannelID, true}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_DUNG_FIRST, _, #{param := [DungID]} = Mask, {'dung_first_reward', DungID}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_DUNG_CHAP_FIRST, PS, #{param := [DungID, Chapter]} = Mask, {'dung_first_reward', DungID}) ->
    Mask#{current => ?iif(lib_role_dungeon:chapter_first_got(PS#role_state.id, DungID, Chapter), 1, 0)};
mask_action(?MASK_GUILD_WINE, _, Mask, 'part_guild_wine') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_GUILD_DEFEND, _, Mask, {'guild_defend', TWave}) ->
    Mask#{current => erlang:max(maps:get(current, Mask), TWave)};
mask_action(?MASK_GIVE_LUCKY_MONEY, _, Mask, 'give_lucky_money') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_GET_LUCKY_MONEY, _, Mask, 'get_lucky_money') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_FORGE_EQUIP, _, #{param := [Star]} = Mask, {'forge_equip', TStar}) when TStar >= Star ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_FORGE_ARTIFACT_F, PS, Mask, 'forge_artifact') ->
    Mask#{current => lib_role_artifact:get_full_forge_num(PS#role_state.id)};
mask_action(?MASK_ANQI_PRACTICE, PS, Mask, {'anqi_practice', _Lv}) ->
    Mask#{current => lib_role_anqi:get_prac_lv(PS#role_state.id)};
mask_action(?MASK_ANQI_LV, PS, Mask, {'anqi_qlv', _Lv}) ->
    Mask#{current => lib_role_anqi:get_qlv(PS#role_state.id)};
mask_action(?MASK_CATCH_LV_PET_NUM, _, #{param := [Lv]} = Mask, {'catch_pet', CLv}) when CLv >= Lv ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_UP_PET_SAVVY, _, Mask, {'upgrade_savvy', true}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_CAREER_BAT_WIN, _, Mask, {'career_battle_win', _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_CAREER_BAT_WIN_C, _, Mask, {'career_battle_win', ContWin}) ->
    Mask#{current => erlang:max(maps:get(current, Mask), ContWin)};
mask_action(?MASK_CAREER_BAT_TOP, _PS, #{param := [R]} = Mask, {'career_battle_top', Rank}) when Rank =< R, Rank > 0 ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_LEAD_THIEF, _PS, Mask, {'part_thief', true, true}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_EXAMINE_RIGHT, _PS, Mask, {'part_examine', true}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_GOLD_CHESS, _PS, Mask, 'kill_gold_chess') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_WIN_DYNASTY_WAR, _PS, Mask, {'part_dynasty_war', true}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_CATCH_PET_NUM, _, Mask, {'catch_pet', _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_HATCH_PET_TIMES2, _, Mask, 'start_hatch') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_THIEF_ROUND, _PS, Mask, {'part_thief', true, _}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_EXAMINE_ROUND, _PS, Mask, 'exam_all_right') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_SUIT_STONE_LV, PS, Mask, 'inlay_stone') ->
    Mask#{current => lib_role_equip:get_suit_stone_lv(PS#role_state.id)};
mask_action(?MASK_CRUISE, _PS, Mask, 'cruise') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_OPEN_HALL, _PS, Mask, 'open_hall') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_KOWTOW, _PS, Mask, 'kowtow') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_ENTER_CHAMBER, _PS, Mask, 'enter_chamber') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_USE_FIREWORK, _PS, Mask, 'use_firework') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_THANKS_GUEST, _PS, Mask, 'thanks_guest') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_ADD_SWORN, _PS, Mask, 'add_sworn') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_MENTOR_KILL_MON, _, Mask, 'mentor_kill_mon') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_MENTOR_THIEF, _, Mask, 'mentor_thief') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_MENTOR_DUNGEON, _PS, #{param := [DungID]} = Mask, {'mentor_dungeon', DungID}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_MENTOR_PRACTICE, _, Mask, 'mentor_practice') ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(?MASK_ENTER_DUNGEON, _, #{param := [DungID | _]} = Mask, {'enter_dung', DungID}) ->
    Mask#{current => maps:get(current, Mask) + 1};
mask_action(_Type, _, Mask, _) ->
    Mask.

mask_done(Masks) ->
    Fun = fun(#{current := Pgs, total := Total}) -> Pgs >= Total end,
    lists:all(Fun, Masks).

finish_masks(Masks) ->
    [Mask#{current => Total} || #{total := Total} = Mask <- Masks].

%% -----------------------------------------------------------------------------

task_name(TaskID) ->
    case conf_task:get({TaskID, 1}) of
        #{name := Name} ->
            Name;
        _ ->
            <<"">>
    end.

task_type(#{type := Type}) ->
    Type;
task_type(#{id := TaskID}) ->
    task_type(TaskID);
task_type(TaskID) ->
    Conf = conf_task:get({TaskID, 1}),
    case Conf of
        #{type := TType} ->
            TType;
        _ ->
            0
    end.

task_cate(#{id := TaskID}) ->
    task_cate(TaskID);
task_cate(TaskID) ->
    Conf = conf_task:get({TaskID, 1}),
    case Conf of
        #{cate := TCate} ->
            TCate;
        _ ->
            0
    end.
