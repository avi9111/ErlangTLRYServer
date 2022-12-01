%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : sys_config
%% @Brief  : 通用配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_sys_config).

-export([
    get/1
]).

get(bag_init_cell_num) ->
    #{
        key => bag_init_cell_num,
        value => 20        
    };
get(bag_max_cell_num) ->
    #{
        key => bag_max_cell_num,
        value => 300        
    };
get(bag_room_not_enough_mail) ->
    #{
        key => bag_room_not_enough_mail,
        value => 301        
    };
get(god_equip_refine_material_type) ->
    #{
        key => god_equip_refine_material_type,
        value => [{16100101,3}]        
    };
get(god_equip_refine_material_ratio) ->
    #{
        key => god_equip_refine_material_ratio,
        value => [{16100201,3}]        
    };
get(god_equip_refine_weight_type) ->
    #{
        key => god_equip_refine_weight_type,
        value => [{1,1000},{5,1000},{6,1000},{9,1000},{10,1000},{11,1000},{12,1000},{13,1000},{14,1000}]        
    };
get(god_equip_refine_weight_ratio) ->
    #{
        key => god_equip_refine_weight_ratio,
        value => [{100,200,5000},{201,300,10000},{301,400,5000},{401,500,1000}]        
    };
get(max_accumulate_offline_time) ->
    #{
        key => max_accumulate_offline_time,
        value => 43200        
    };
get(mail_valid_period) ->
    #{
        key => mail_valid_period,
        value => 2592000        
    };
get(mail_max_num) ->
    #{
        key => mail_max_num,
        value => 100        
    };
get(chat_content_len) ->
    #{
        key => chat_content_len,
        value => 50        
    };
get(chat_ban_times) ->
    #{
        key => chat_ban_times,
        value => {60,3}        
    };
get(chat_same_times) ->
    #{
        key => chat_same_times,
        value => {60,5}        
    };
get(chat_ban_span) ->
    #{
        key => chat_ban_span,
        value => [{1,1,1800},{2,2,10800},{3,3,21600},{4,-1,15552000}]        
    };
get(chat_ban_mail) ->
    #{
        key => chat_ban_mail,
        value => 3        
    };
get(rumor_max_len) ->
    #{
        key => rumor_max_len,
        value => 30        
    };
get(pet_lock_skill_cost) ->
    #{
        key => pet_lock_skill_cost,
        value => [{1,10},{2,20},{3,30},{4,40},{5,50}]        
    };
get(pet_lv_up_add_exp) ->
    #{
        key => pet_lv_up_add_exp,
        value => 10        
    };
get(pet_advance_add_exp) ->
    #{
        key => pet_advance_add_exp,
        value => 1        
    };
get(friend_num_limit) ->
    #{
        key => friend_num_limit,
        value => 100        
    };
get(friend_ban_num_limit) ->
    #{
        key => friend_ban_num_limit,
        value => 20        
    };
get(friend_enemy_num_limit) ->
    #{
        key => friend_enemy_num_limit,
        value => 20        
    };
get(friend_block_num_limit) ->
    #{
        key => friend_block_num_limit,
        value => 3        
    };
get(friend_create_group_num) ->
    #{
        key => friend_create_group_num,
        value => 3        
    };
get(friend_user_group_num_limit) ->
    #{
        key => friend_user_group_num_limit,
        value => 20        
    };
get(friend_sys_group_num_limit) ->
    #{
        key => friend_sys_group_num_limit,
        value => 5        
    };
get(equip_goods_type) ->
    #{
        key => equip_goods_type,
        value => {10,17,18,19,20,21,22,23,24,25,26,27}        
    };
get(equip_stone_adv_rune) ->
    #{
        key => equip_stone_adv_rune,
        value => 16260001        
    };
get(equip_stone_adv_rumor) ->
    #{
        key => equip_stone_adv_rumor,
        value => 21501        
    };
get(equip_paris_shoulder_compose_rumor) ->
    #{
        key => equip_paris_shoulder_compose_rumor,
        value => 21502        
    };
get(equip_paris_shoulder_stren_rumor) ->
    #{
        key => equip_paris_shoulder_stren_rumor,
        value => 21503        
    };
get(equip_forge_rumor) ->
    #{
        key => equip_forge_rumor,
        value => 21506        
    };
get(smelt_soul_star) ->
    #{
        key => smelt_soul_star,
        value => 6        
    };
get(smelt_soul_rate) ->
    #{
        key => smelt_soul_rate,
        value => 500        
    };
get(arena_reward_mail) ->
    #{
        key => arena_reward_mail,
        value => 12        
    };
get(arena_robot_num) ->
    #{
        key => arena_robot_num,
        value => 5000        
    };
get(arena_reward_times_cd) ->
    #{
        key => arena_reward_times_cd,
        value => 7200        
    };
get(arena_max_store_times) ->
    #{
        key => arena_max_store_times,
        value => 5        
    };
get(arena_buy_add_times) ->
    #{
        key => arena_buy_add_times,
        value => 5        
    };
get(arena_round_time) ->
    #{
        key => arena_round_time,
        value => 60        
    };
get(arena_scene) ->
    #{
        key => arena_scene,
        value => 20001        
    };
get(arena_rival_pos) ->
    #{
        key => arena_rival_pos,
        value => {70,110}        
    };
get(arena_victory_reward) ->
    #{
        key => arena_victory_reward,
        value => 4101        
    };
get(arena_failure_reward) ->
    #{
        key => arena_failure_reward,
        value => 4102        
    };
get(daily_kill_mons_finish) ->
    #{
        key => daily_kill_mons_finish,
        value => {100,200,300}        
    };
get(guild_seat_scene) ->
    #{
        key => guild_seat_scene,
        value => 40001        
    };
get(guild_desolation_span) ->
    #{
        key => guild_desolation_span,
        value => 7        
    };
get(guild_desolation_mail) ->
    #{
        key => guild_desolation_mail,
        value => 103        
    };
get(guild_auto_impeach_day) ->
    #{
        key => guild_auto_impeach_day,
        value => 3        
    };
get(guild_auto_impeach_active) ->
    #{
        key => guild_auto_impeach_active,
        value => 7        
    };
get(guild_join_mail_temp_id) ->
    #{
        key => guild_join_mail_temp_id,
        value => 101        
    };
get(guild_join_rumor) ->
    #{
        key => guild_join_rumor,
        value => 10001        
    };
get(guild_leave_rumor) ->
    #{
        key => guild_leave_rumor,
        value => 10002        
    };
get(guild_become_chief_rumor) ->
    #{
        key => guild_become_chief_rumor,
        value => 10003        
    };
get(guild_pos_change_rumor) ->
    #{
        key => guild_pos_change_rumor,
        value => 10005        
    };
get(guild_upgrade_rumor) ->
    #{
        key => guild_upgrade_rumor,
        value => 10004        
    };
get(guild_rename_mail) ->
    #{
        key => guild_rename_mail,
        value => 105        
    };
get(guild_rename_item) ->
    #{
        key => guild_rename_item,
        value => 16180002        
    };
get(guild_chief_abdicate_mail) ->
    #{
        key => guild_chief_abdicate_mail,
        value => 104        
    };
get(guild_kick_mail) ->
    #{
        key => guild_kick_mail,
        value => 102        
    };
get(guild_recruit_rumor) ->
    #{
        key => guild_recruit_rumor,
        value => 10006        
    };
get(guild_recruit_cd) ->
    #{
        key => guild_recruit_cd,
        value => 600        
    };
get(guild_ex_refresh_gold) ->
    #{
        key => guild_ex_refresh_gold,
        value => 100        
    };
get(guild_ex_refresh_times) ->
    #{
        key => guild_ex_refresh_times,
        value => 10        
    };
get(guild_announce_length) ->
    #{
        key => guild_announce_length,
        value => {1,80}        
    };
get(create_guild_init_funds) ->
    #{
        key => create_guild_init_funds,
        value => 100000        
    };
get(guild_down_mail) ->
    #{
        key => guild_down_mail,
        value => 106        
    };
get(guild_practice_open_lv) ->
    #{
        key => guild_practice_open_lv,
        value => 44        
    };
get(guild_metall_open_lv) ->
    #{
        key => guild_metall_open_lv,
        value => 26        
    };
get(guild_rename_item_id) ->
    #{
        key => guild_rename_item_id,
        value => 16180002        
    };
get(guild_forbid_join_activity_ids) ->
    #{
        key => guild_forbid_join_activity_ids,
        value => [1001,1004,1009,1005]        
    };
get(marry_rumor) ->
    #{
        key => marry_rumor,
        value => 27001        
    };
get(marry_cost) ->
    #{
        key => marry_cost,
        value => 201314        
    };
get(marry_npc) ->
    #{
        key => marry_npc,
        value => 1        
    };
get(marry_invite_cd) ->
    #{
        key => marry_invite_cd,
        value => 30        
    };
get(marry_divorce_npc) ->
    #{
        key => marry_divorce_npc,
        value => 46        
    };
get(marry_divorce_cost) ->
    #{
        key => marry_divorce_cost,
        value => 500000        
    };
get(marry_divorce_mail) ->
    #{
        key => marry_divorce_mail,
        value => {2601,2602}        
    };
get(novice_xiake_shop) ->
    #{
        key => novice_xiake_shop,
        value => 40        
    };
get(novice_czx_shop) ->
    #{
        key => novice_czx_shop,
        value => 40        
    };
get(novice_zs_shop) ->
    #{
        key => novice_zs_shop,
        value => 40        
    };
get(novice_zigq_task) ->
    #{
        key => novice_zigq_task,
        value => 1019        
    };
get(recharge_mail) ->
    #{
        key => recharge_mail,
        value => 31        
    };
get(recharge_mail_rebate) ->
    #{
        key => recharge_mail_rebate,
        value => 32        
    };
get(recharge_ticked_id) ->
    #{
        key => recharge_ticked_id,
        value => 16440001        
    };
get(welfare_level_diff) ->
    #{
        key => welfare_level_diff,
        value => 3        
    };
get(hero_active_legend) ->
    #{
        key => hero_active_legend,
        value => [{16230001,1},{16230002,1},{16230003,1}]        
    };
get(hero_active_legend_lv) ->
    #{
        key => hero_active_legend_lv,
        value => {90,36}        
    };
get(hero_active_lv) ->
    #{
        key => hero_active_lv,
        value => {44,21}        
    };
get(dynasty_war_prepare_scene) ->
    #{
        key => dynasty_war_prepare_scene,
        value => [20026,20027,20028,20029]        
    };
get(dynasty_war_battle_scene) ->
    #{
        key => dynasty_war_battle_scene,
        value => 20030        
    };
get(dynasty_war_settle_mail) ->
    #{
        key => dynasty_war_settle_mail,
        value => 401        
    };
get(dynasty_war_score_win) ->
    #{
        key => dynasty_war_score_win,
        value => 400        
    };
get(dynasty_war_score_lose) ->
    #{
        key => dynasty_war_score_lose,
        value => 200        
    };
get(dynasty_war_score_draw) ->
    #{
        key => dynasty_war_score_draw,
        value => 300        
    };
get(dynasty_war_born_pos_song) ->
    #{
        key => dynasty_war_born_pos_song,
        value => {244,432}        
    };
get(dynasty_war_born_pos_liao) ->
    #{
        key => dynasty_war_born_pos_liao,
        value => {244,250}        
    };
get(dynasty_war_match_time) ->
    #{
        key => dynasty_war_match_time,
        value => 600        
    };
get(dynasty_war_match_num) ->
    #{
        key => dynasty_war_match_num,
        value => 40        
    };
get(dynasty_war_pos_yunzhong) ->
    #{
        key => dynasty_war_pos_yunzhong,
        value => {87,162}        
    };
get(dynasty_war_pos_daijun) ->
    #{
        key => dynasty_war_pos_daijun,
        value => {156,182}        
    };
get(dynasty_war_pos_yanmen) ->
    #{
        key => dynasty_war_pos_yanmen,
        value => {122,167}        
    };
get(dynasty_war_show_reward) ->
    #{
        key => dynasty_war_show_reward,
        value => 1005        
    };
get(dynamic_war_cont_kill_cd) ->
    #{
        key => dynamic_war_cont_kill_cd,
        value => 60        
    };
get(dynamic_war_enter_level) ->
    #{
        key => dynamic_war_enter_level,
        value => 35        
    };
get(auction_bonus_mail) ->
    #{
        key => auction_bonus_mail,
        value => 501        
    };
get(auction_reward_mail_bid) ->
    #{
        key => auction_reward_mail_bid,
        value => 502        
    };
get(auction_return_mail) ->
    #{
        key => auction_return_mail,
        value => 503        
    };
get(auction_reward_mail_now) ->
    #{
        key => auction_reward_mail_now,
        value => 504        
    };
get(auction_bonus_min_num) ->
    #{
        key => auction_bonus_min_num,
        value => 10        
    };
get(auction_bonus_max_bonus) ->
    #{
        key => auction_bonus_max_bonus,
        value => 500        
    };
get(auction_bonus_abort_ratio) ->
    #{
        key => auction_bonus_abort_ratio,
        value => 0.25        
    };
get(auction_bonus_now_ratio) ->
    #{
        key => auction_bonus_now_ratio,
        value => 1.5        
    };
get(auction_boss_max_item) ->
    #{
        key => auction_boss_max_item,
        value => 50        
    };
get(master_rob_cd) ->
    #{
        key => master_rob_cd,
        value => 180        
    };
get(master_rob_time) ->
    #{
        key => master_rob_time,
        value => 60        
    };
get(master_rob_scene) ->
    #{
        key => master_rob_scene,
        value => 40004        
    };
get(master_rob_pert) ->
    #{
        key => master_rob_pert,
        value => 0.3        
    };
get(master_rob_protect) ->
    #{
        key => master_rob_protect,
        value => 180        
    };
get(master_chap_cd) ->
    #{
        key => master_chap_cd,
        value => 180        
    };
get(master_chap_time) ->
    #{
        key => master_chap_time,
        value => 60        
    };
get(master_chap_scene) ->
    #{
        key => master_chap_scene,
        value => 40003        
    };
get(master_chap_hp_ratio) ->
    #{
        key => master_chap_hp_ratio,
        value => [{0,30,3},{31,60,2},{61,100,1}]        
    };
get(master_chap_fix_ratio) ->
    #{
        key => master_chap_fix_ratio,
        value => 0.3        
    };
get(master_settle_mail_role) ->
    #{
        key => master_settle_mail_role,
        value => 402        
    };
get(master_settle_mail_guild) ->
    #{
        key => master_settle_mail_guild,
        value => 403        
    };
get(master_boss_born_pos) ->
    #{
        key => master_boss_born_pos,
        value => {70,110}        
    };
get(master_start_rumor) ->
    #{
        key => master_start_rumor,
        value => 20401        
    };
get(master_stop_rumor) ->
    #{
        key => master_stop_rumor,
        value => 20402        
    };
get(master_rob_fight_limit) ->
    #{
        key => master_rob_fight_limit,
        value => 3.5        
    };
get(lucky_roraty_rumor) ->
    #{
        key => lucky_roraty_rumor,
        value => 20001        
    };
get(daily_thief_id_list) ->
    #{
        key => daily_thief_id_list,
        value => [170001,170002,170003,170004,170005,170006,170007,170008,170009,170010,170011,170012,170013,170014,170015,170016,170017,170018,170019,170020,170021,170022,170023,170024,170025,170026,170027,170028,170029,170030,170031,170032,170033,170034,170035,170036,170037,170038,170039,170040,170041,170042,170043,170044,170045,170046,170047,170048,170049,170050,170051,170052,170053,170054,170055,170056,170057,170058,170059,170060,170061,170062,170063,170064,170065,170066,170067,170068,170069,170070,170071,170072,170073,170074,170075,170076,170077,170078,170079,170080,170081,170082,170083,170084,170085,170086,170087,170088,170089,170090]        
    };
get(daily_thief_adventure_list) ->
    #{
        key => daily_thief_adventure_list,
        value => [170101,170102,170103,170104,170105,170106,170107,170108,170109,170110,170111,170112,170113,170114,170115,170116,170117,170118,170119,170120,170121,170122,170123,170124,170125,170126,170127,170128,170129,170130,170131,170132,170133,170134,170135,170136,170137,170138,170139,170140,170141,170142,170143,170144,170145,170146,170147,170148,170149,170150,170151,170152,170153,170154,170155,170156,170157,170158,170159,170160,170161,170162,170163,170164,170165,170166,170167,170168,170169,170170,170171,170172,170173,170174,170175,170176,170177,170178,170179,170180,170181,170182,170183,170184,170185,170186,170187,170188,170189,170190]        
    };
get(daily_thief_exp_max_times) ->
    #{
        key => daily_thief_exp_max_times,
        value => 2        
    };
get(daily_thief_roraty_max_times) ->
    #{
        key => daily_thief_roraty_max_times,
        value => 2        
    };
get(guild_defend_bonus_ratio) ->
    #{
        key => guild_defend_bonus_ratio,
        value => [{1,1,1.5},{2,4,1.2},{5,10,0.9},{11,999,0.5}]        
    };
get(gather_reward_vitality_cd) ->
    #{
        key => gather_reward_vitality_cd,
        value => 60        
    };
get(gather_max_store_vitality) ->
    #{
        key => gather_max_store_vitality,
        value => 360        
    };
get(career_battle_born_pos_red) ->
    #{
        key => career_battle_born_pos_red,
        value => {78,98}        
    };
get(career_battle_born_pos_blue) ->
    #{
        key => career_battle_born_pos_blue,
        value => {57,102}        
    };
get(career_battle_forbid_time) ->
    #{
        key => career_battle_forbid_time,
        value => 5        
    };
get(team_max_member_num) ->
    #{
        key => team_max_member_num,
        value => 5        
    };
get(team_offline_timeout) ->
    #{
        key => team_offline_timeout,
        value => 300        
    };
get(team_member_join_rumor) ->
    #{
        key => team_member_join_rumor,
        value => 20501        
    };
get(team_member_leave_rumor) ->
    #{
        key => team_member_leave_rumor,
        value => 20502        
    };
get(team_kick_member_rumor) ->
    #{
        key => team_kick_member_rumor,
        value => 20503        
    };
get(team_leader_change_rumor) ->
    #{
        key => team_leader_change_rumor,
        value => 20504        
    };
get(team_target_change_rumor) ->
    #{
        key => team_target_change_rumor,
        value => 20505        
    };
get(team_start_match_rumor) ->
    #{
        key => team_start_match_rumor,
        value => 20506        
    };
get(team_stop_match_rumor) ->
    #{
        key => team_stop_match_rumor,
        value => 20507        
    };
get(team_recruit_rumor) ->
    #{
        key => team_recruit_rumor,
        value => 20508        
    };
get(team_approve_promote_rumor) ->
    #{
        key => team_approve_promote_rumor,
        value => 20509        
    };
get(team_reject_promote_rumor) ->
    #{
        key => team_reject_promote_rumor,
        value => 20510        
    };
get(team_mon_drop_dist) ->
    #{
        key => team_mon_drop_dist,
        value => 30        
    };
get(team_near_by_distance) ->
    #{
        key => team_near_by_distance,
        value => 25        
    };
get(team_match_robot_wait) ->
    #{
        key => team_match_robot_wait,
        value => 60
    };
get(channel_change_potential_cost) ->
    #{
        key => channel_change_potential_cost,
        value => [{16290002,1}]        
    };
get(channel_active_hero_lv) ->
    #{
        key => channel_active_hero_lv,
        value => 30        
    };
get(channel_cult_weight) ->
    #{
        key => channel_cult_weight,
        value => [{100,5500},{200,2500},{300,1200},{400,600},{500,200}]        
    };
get(channel_draw_item) ->
    #{
        key => channel_draw_item,
        value => 16290003        
    };
get(channel_draw_rumor) ->
    #{
        key => channel_draw_rumor,
        value => 20002        
    };
get(dung_far_from_npc_rumor) ->
    #{
        key => dung_far_from_npc_rumor,
        value => 20511        
    };
get(dung_level_limit_rumor) ->
    #{
        key => dung_level_limit_rumor,
        value => 20512        
    };
get(dung_mem_offline_rumor) ->
    #{
        key => dung_mem_offline_rumor,
        value => 20513        
    };
get(dung_assist_emprise) ->
    #{
        key => dung_assist_emprise,
        value => 340002        
    };
get(dung_assist_reward_times) ->
    #{
        key => dung_assist_reward_times,
        value => 3        
    };
get(dung_special_mon_rumor) ->
    #{
        key => dung_special_mon_rumor,
        value => 20516        
    };
get(dung_allow_robot) ->
    #{
        key => dung_allow_robot,
        value => [700,800,900,1000,1200,1800,1900,2000,2100]        
    };
get(sh_dung_chapter_max_progress) ->
    #{
        key => sh_dung_chapter_max_progress,
        value => 40        
    };
get(sh_dung_weekly_reward_times) ->
    #{
        key => sh_dung_weekly_reward_times,
        value => 5        
    };
get(sh_dung_assist_times) ->
    #{
        key => sh_dung_assist_times,
        value => 3        
    };
get(sh_dung_show_reward) ->
    #{
        key => sh_dung_show_reward,
        value => 308201        
    };
get(territory_flag) ->
    #{
        key => territory_flag,
        value => 1005        
    };
get(territory_prepare_scene) ->
    #{
        key => territory_prepare_scene,
        value => 40009        
    };
get(territory_battle_scene) ->
    #{
        key => territory_battle_scene,
        value => 40010        
    };
get(territory_born_pos_red) ->
    #{
        key => territory_born_pos_red,
        value => {322,256}        
    };
get(territory_born_pos_blue) ->
    #{
        key => territory_born_pos_blue,
        value => {124,256}        
    };
get(territory_prepare_rumor) ->
    #{
        key => territory_prepare_rumor,
        value => 20701        
    };
get(territory_room_win_rumor) ->
    #{
        key => territory_room_win_rumor,
        value => 20702        
    };
get(territory_room_lose_rumor) ->
    #{
        key => territory_room_lose_rumor,
        value => 20703        
    };
get(territory_group_win_rumor) ->
    #{
        key => territory_group_win_rumor,
        value => 20704        
    };
get(territory_group_lose_rumor) ->
    #{
        key => territory_group_lose_rumor,
        value => 20705        
    };
get(territory_win_mail) ->
    #{
        key => territory_win_mail,
        value => 1601        
    };
get(territory_lose_mail) ->
    #{
        key => territory_lose_mail,
        value => 1602        
    };
get(hero_boss_buff) ->
    #{
        key => hero_boss_buff,
        value => [{0,4800,20001},{4801,-1,20002}]        
    };
get(hero_trial_npc) ->
    #{
        key => hero_trial_npc,
        value => 14        
    };
get(catch_pet_cost_item) ->
    #{
        key => catch_pet_cost_item,
        value => 16330001        
    };
get(scene_pet_catch_show) ->
    #{
        key => scene_pet_catch_show,
        value => 40011        
    };
get(weapon_ui_show) ->
    #{
        key => weapon_ui_show,
        value => {{1001,1001,1001,1001,1001,1001,1001},{2001,2001,2001,2001,2001,2001,2001},{3001,3001,3001,3001,3001,3001,3001},{4001,4002,4003,4004,4005,4006,4007}}        
    };
get(market_rare_item_sold_mail) ->
    #{
        key => market_rare_item_sold_mail,
        value => 1701        
    };
get(market_item_sold_mail) ->
    #{
        key => market_item_sold_mail,
        value => 1702        
    };
get(market_item_expire_mail) ->
    #{
        key => market_item_expire_mail,
        value => 1703        
    };
get(market_item_remove_mail) ->
    #{
        key => market_item_remove_mail,
        value => 1704        
    };
get(market_max_follow) ->
    #{
        key => market_max_follow,
        value => 20        
    };
get(market_min_fee) ->
    #{
        key => market_min_fee,
        value => 1000        
    };
get(market_expire_time) ->
    #{
        key => market_expire_time,
        value => 168        
    };
get(first_charge_reward) ->
    #{
        key => first_charge_reward,
        value => 240001        
    };
get(retrieve_item_id) ->
    #{
        key => retrieve_item_id,
        value => 16440002        
    };
get(coloration_npc_id) ->
    #{
        key => coloration_npc_id,
        value => 37        
    };
get(pioneer_level_rank) ->
    #{
        key => pioneer_level_rank,
        value => 100        
    };
get(pioneer_level_default) ->
    #{
        key => pioneer_level_default,
        value => 20        
    };
get(prize_task_max_times) ->
    #{
        key => prize_task_max_times,
        value => 5        
    };
get(prize_task_level_limit) ->
    #{
        key => prize_task_level_limit,
        value => 50        
    };
get(daily_task_max_times) ->
    #{
        key => daily_task_max_times,
        value => 10        
    };
get(daily_task_box) ->
    #{
        key => daily_task_box,
        value => 115001        
    };
get(auto_use_item) ->
    #{
        key => auto_use_item,
        value => [{11010001,30,20},{11020001,30,20},{11030001,30,20}]        
    };
get(sign_max_bq_times) ->
    #{
        key => sign_max_bq_times,
        value => 2        
    };
get(all_sign_reward) ->
    #{
        key => all_sign_reward,
        value => 31306        
    };
get(title_expire_mail) ->
    #{
        key => title_expire_mail,
        value => 2201        
    };
get(society_show_pet) ->
    #{
        key => society_show_pet,
        value => 2001        
    };
get(examine_guide_reward) ->
    #{
        key => examine_guide_reward,
        value => 180000        
    };
get(retrieve_item_value_gold) ->
    #{
        key => retrieve_item_value_gold,
        value => 5        
    };
get(dividend_open_lv) ->
    #{
        key => dividend_open_lv,
        value => 10        
    };
get(rename_item_id) ->
    #{
        key => rename_item_id,
        value => 16180001
    };
get(role_rename_mail) ->
    #{
        key => role_rename_mail,
        value => 108
    };
get(dragon_refine_week_times) ->
    #{
        key => dragon_refine_week_times,
        value => 150        
    };
get(dragon_condense_cost) ->
    #{
        key => dragon_condense_cost,
        value => {5,20000}        
    };
get(single_action_cd) ->
    #{
        key => single_action_cd,
        value => 5        
    };
get(coupe_action_cd) ->
    #{
        key => coupe_action_cd,
        value => 15        
    };
get(coupe_action_dist) ->
    #{
        key => coupe_action_dist,
        value => 10        
    };
get(init_action_id_list) ->
    #{
        key => init_action_id_list,
        value => [101,201,202]        
    };
get(circle_quick_item) ->
    #{
        key => circle_quick_item,
        value => [35001001,35001002,35001003,35001004,35001005,35001006,35001007,35001008,35001009,35001010,35001011,35001012,35001013,35001014,35001015,35001016,35001018,35001019,35001020,35001021,35001022,35001023,35001024]        
    };
get(circle_wilful_times) ->
    #{
        key => circle_wilful_times,
        value => [{17,0,10000},{12,10,500}]        
    };
get(circle_help_rumor) ->
    #{
        key => circle_help_rumor,
        value => 26001        
    };
get(circle_helpd_rumor) ->
    #{
        key => circle_helpd_rumor,
        value => 26002        
    };
get(circle_help_times) ->
    #{
        key => circle_help_times,
        value => 300        
    };
get(circle_round_task) ->
    #{
        key => circle_round_task,
        value => 45001        
    };
get(circle_helpd_times) ->
    #{
        key => circle_helpd_times,
        value => 10        
    };
get(rob_times_effect) ->
    #{
        key => rob_times_effect,
        value => [{0,100,100},{101,200,90},{201,300,80},{301,400,70},{401,500,60},{501,-1,50}]        
    };
get(puzzle_game_time) ->
    #{
        key => puzzle_game_time,
        value => 30        
    };
get(chess_npc_id) ->
    #{
        key => chess_npc_id,
        value => 13        
    };
get(chess_team_need_num) ->
    #{
        key => chess_team_need_num,
        value => 3        
    };
get(_) ->
    undefined.
