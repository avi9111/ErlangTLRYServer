%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     排行榜
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_rank).
-author("Ryuu").

-include("rank.hrl").
-include("role.hrl").
-include("common.hrl").
-include("dungeon.hrl").
-include("proto/prot_405.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    handle_info/2
]).

-export([
    update_dung_rank/2,
    update_fight_rank/1,
    update_level_rank/1,
    update_guild_lively_rank/3,
    update_equip_rank/5,
    update_career_rank/1,
    update_pet_rank/4
]).

handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    refresh_rank(PS);
event(PS, level_up) ->
    update_level_rank(PS);
event(_, _PS) ->
    ignore.

do(40501, PS, #cs_rank_get_info{type = RankID, page = Page}) ->
    get_rank_info(PS, RankID, Page);
do(40503, PS, #cs_rank_get_target_rank{type = RankID}) ->
    get_target_rank(PS, RankID);
do(_Cmd, _PS, _Req) ->
    ignore.

get_rank_info(PS, RankID, Page) ->
    #role_state{id = RoleID} = PS,
    svr_rank:get_rank(RoleID, RankID, Page, rank_key(PS, RankID)).

get_target_rank(PS, RankID) ->
    #role_state{id = RoleID} = PS,
    svr_rank:get_target_rank(RoleID, RankID, rank_key(PS, RankID)).

rank_key(PS, Type) when Type >= ?RANK_GUILD_FIGHT andalso Type =< ?RANK_MASTER_GUILD ->
    PS#role_state.guild_id;
rank_key(PS, ?RANK_LOVE_VALUE) ->
    lib_role_marriage:get_marry_id(PS#role_state.id);
rank_key(PS, _) ->
    PS#role_state.id.

%% @doc 更新战力排行榜
update_fight_rank(PS) ->
    #role_state{id = RoleID, combat_power = Fight, level = Level,
        career = Career, guild_name = GuildName} = PS,
    RankItem = ?rank_role_fight#{
        key := RoleID, career => Career, fight := Fight, level := Level,
        guild_name => GuildName, time := time:unixtime()
    },
    svr_rank:update_rank(?RANK_ROLE_FIGHT, RoleID, RankItem).

%% @doc 更新等级排行榜
update_level_rank(PS) ->
    #role_state{id = RoleID, level = Level, exp = Exp, combat_power = Fight,
        career = Career, guild_name = GuildName} = PS,
    RankItem = ?rank_role_level#{
        key := RoleID, career => Career, level := Level, exp := Exp, fight := Fight,
        guild_name => GuildName, time := time:unixtime()
    },
    svr_rank:update_rank(?RANK_ROLE_LEVEL, RoleID, RankItem).

%% @doc 珍兽战力排行榜
update_pet_rank(RoleID, Career, PetFight, PetName) ->
    RankItem = ?rank_role_pet#{
        key := RoleID, career => Career, fight => PetFight, pet_name => PetName,
        time => time:unixtime()
    },
    svr_rank:update_rank(?RANK_PET_FIGHT, RoleID, RankItem).

%% @doc 更新门派排行榜
update_career_rank(PS) ->
    #role_state{id = RoleID, career = Career, guild_name = GuildName,
        combat_power = Fight} = PS,
    RankID = Career + ?CAREER_DEVIATE_VALUE,
    RankItem = ?rank_role_career#{
        key => RoleID, fight => Fight, guild_name => GuildName, career => Career,
        time => time:unixtime()
    },
    svr_rank:update_rank(RankID, RoleID, RankItem).

%% @doc 更新副本排行榜
update_dung_rank(PS, DungInfo) ->
    #role_state{id = RoleID, combat_power = Fight, career = Career,
        guild_name = GuildName} = PS,
    #{id := DungID, max_lv := MaxLv, max_wave := MaxWave} = DungInfo,
    RankID = dung_rank(DungID),
    RankID > 0 andalso
        begin
            RankItem = ?rank_dung#{
                key := RoleID, dung_id := DungID, level := MaxLv, wave := MaxWave,
                fight := Fight, time := time:unixtime(), career => Career,
                guild_name => GuildName
            },
            svr_rank:update_rank(RankID, RoleID, RankItem)
        end.

%% @doc 更新帮派活跃度排行榜
update_guild_lively_rank(GuildID, LiveExp, GuildName) ->
    RankItem = ?rank_guild_live#{
        key := GuildID, guild_id => GuildID, live => LiveExp, guild_name => GuildName,
        time := time:unixtime()
    },
    svr_rank:update_rank(?RANK_GUILD_LIVE, GuildID, RankItem).

%% 更新装备排行榜
update_equip_rank(EquipPos, RoleID, Career, EquipFight, GoodsName) ->
    RankID = EquipPos + ?EQUIP_DEVIATE_VALUE,
    RankItem = ?rank_role_equip#{
        key => RoleID, career => Career, fight => EquipFight, name => GoodsName,
        time => time:unixtime()
    },
    svr_rank:update_rank(RankID, RoleID, RankItem).

dung_rank(?DUNG_ID_SAVIOR) ->
    ?RANK_SAVIOR;
dung_rank(_) ->
    0.

%% -----------------------------------------------------------------------------

%% @doc
init(_PS) ->
    ok.

%% @doc
save(PS) ->
    refresh_rank(PS).

refresh_rank(PS) ->
    lib_role_rank:update_level_rank(PS),
    lib_role_rank:update_fight_rank(PS),
    lib_role_rank:update_career_rank(PS),
    ok.
