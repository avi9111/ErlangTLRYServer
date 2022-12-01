%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     缓存
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_cache).
-author("Ryuu").

-include("role.hrl").
-include("cache.hrl").
-include("common.hrl").

%% API
-export([
    init/1,
    save/1,
    event/2,
    handle_info/2
]).

handle_info(init_refresh, PS) ->
    update_base_info(PS, false);
handle_info(_, _) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    update(PS, false);
event(PS, level_up) ->
    update(PS, false);
event(PS, 'scene_changed') ->
    update(PS, false);
event(PS, 'team_changed') ->
    update(PS, false);
event(_PS, _Event) ->
    ignore.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc init
init(_PS) ->
    lib_role:mod_after(0, ?MODULE, init_refresh).

%% @doc save
save(PS) ->
    update(PS, true).

%% @doc
update(PS, Offline) ->
    update_base_info(PS, Offline),
    ok.

%% @doc 更新#role_base{}
update_base_info(PS, Logout) ->
    #role_state{
        id = RoleID, name = RoleName, level = RoleLv, gender = RoleSex,
        role_vip = VipLv, role_scene = RoleScene, career = Career,
        combat_power = Fight, team_id = TeamId, guild_id = GuildId,
        personal = Personal
    } = PS,
    #{level := V_lv} = VipLv,
    #role_scene{scene_id = SceneId} = RoleScene,
    Offline = ?iif(Logout, time:unixtime(), 0),
    RoleBase = ?role_base#{
        id => RoleID, name => RoleName, level => RoleLv, gender => RoleSex,
        vip_lv => V_lv, team_id => TeamId, guild => GuildId, scene => SceneId,
        career => Career, fight => Fight, offline => Offline, personal => Personal
    },
    svr_cache:insert(?CACHE_TYPE_BASE_INFO, RoleID, RoleBase, ?CACHE_TIME_ROLE_BASE).
