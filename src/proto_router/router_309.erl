%%-------------------------------------------------------
%% @File     : router_309
%% @Brief    : 世界boss协议组
%% @Author   : cablsbs
%% @Date     : 2018-10-17
%%-------------------------------------------------------

-module(router_309).

-include("role.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("proto/prot_309.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
do(30902, State, #exit_world_boss_field_req{}) ->
    #role_state{id = RoleId, role_scene = RoleScene} = State,
    #role_scene{scene_id = SceneId} = RoleScene,
    case conf_world_boss_field:get_layer_field(SceneId) of
        Conf when is_tuple(Conf) ->
            lib_scene_api:return_scene(State);
        _ ->
            ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_NOT_IN_FIELD),
            ok
    end;

do(30903, State, #enter_world_boss_field_req{layer = Layer, field_id = FieldId, line_id = LineId}) ->
    % TODO check guild lv
    #role_state{id = RoleId, name = RoleName, guild_id = GuildId, guild_name = GuildName} = State,
    LayerConf = conf_world_boss_field:get_layer(Layer),
    FieldConf = conf_world_boss_field:get_field(FieldId),
    if
        LayerConf =:= undefined ->
            ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_BAD_LAYER);
        FieldConf =:= undefined ->
            ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_BAD_FIELD);
        GuildId =:= 0 ->
            ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_NOT_IN_GUILD);
        true ->
            #{fields := Fields} = LayerConf,
            WorldLv = util_svr:get_world_lv(),
            #{world_lv := WorldLvLmt} = FieldConf,
            case lists:member(FieldId, Fields) of
                true when WorldLvLmt =< WorldLv ->
                    RoleData = #{
                        id => RoleId, name => RoleName,
                        guild_id => GuildId, guild_name => GuildName
                    },
                    svr_world_boss_layer:enter_field(RoleData, Layer, FieldId, LineId),
                    ?iif(
                        lib_activity:is_ongoing(?ACT_ID_WORLD_BOSS),
                        lib_role_daily_lively:trigger_event(RoleId, 1, 1),
                        skip
                        );
                true ->
                    ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_WORLD_LV_LMT);
                false ->
                    ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_BAD_FIELD)
            end
    end,
    ok;

do(30909, State, #get_world_boss_seq_req{}) ->
    #role_state{id = RoleId, sid = RoleSid, role_scene = RoleScene} = State,
    #role_scene{scene_id = SceneId, line_id = LineId} = RoleScene,
    case conf_world_boss_field:get_layer_field(SceneId) of
        {Layer, FieldId} ->
            svr_world_boss_layer:get_boss_seq(RoleSid, Layer, FieldId, LineId);
        _ ->
            ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_NOT_IN_FIELD),
            ok
    end;

%% 处理未定义协议
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).


%% Privates ---------------------------------------------
