%%-------------------------------------------------------
%% @File     : svr_world_boss_layer.erl
%% @Brief    : 世界boss领地进程(每层领地一个进程)
%% @Author   : cablsbs
%% @Date     : 2018-10-12
%%-------------------------------------------------------
-module(svr_world_boss_layer).

-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("world_boss.hrl").
-include("scene_objs.hrl").
-include("proto/prot_309.hrl").

-behaviour(gen_server).

-export([
    start_link/1,
    enter_field/4,
    leave_field/3,
    update_harm/5,
    update_cure/4,
    mon_die_check/4,
    get_boss_seq/4
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).


-record(world_boss_layer, {
    layer = #{},                    % #{} read from conf_world_boss_field
    world_lv = 0,                   % 世界等级
    role_names = #{},               % #{ RoleId => Name }
    role_guilds = #{},              % #{ RoleId => GuildId }
    guild_names = #{},              % #{ GuildId => GuildName }
    extra_scene_seq = [],           % [SceneId :: integer()] 增开分线顺序
    boss_fields = [],               % [#boss_field{}]
    is_full = false,                % 所有分线满员
    stat = 0,                       % 状态 1:准备  2:进行中  3:结算  4:结束
    rank_ref = undefined            % 排行定时器
}).


%% Apis -------------------------------------------------
start_link(Layer) ->
    RegName = reg_name(Layer),
    gen_server:start_link({local, RegName}, ?MODULE, [Layer], []).

enter_field(RoleData, Layer, FieldId, LineId) ->
    cast(Layer, {'enter_field', RoleData, FieldId, LineId}).

leave_field(SceneId, LineId, RoleId) ->
    case conf_world_boss_field:get_layer_field(SceneId) of
        {Layer, FieldId} ->
            cast(Layer, {'role_leave', FieldId, LineId, RoleId});
        _ ->
            skip
    end.

update_harm(RoleId, SceneId, LineId, BossId, HarmHp) ->
    case conf_world_boss_field:get_layer_field(SceneId) of
        {Layer, FieldId} ->
            cast(Layer, {'update_harm', RoleId, FieldId, LineId, {BossId, HarmHp}});
        _ ->
            skip
    end.

update_cure(RoleId, SceneId, LineId, CureHp) ->
    case conf_world_boss_field:get_layer_field(SceneId) of
        {Layer, FieldId} ->
            cast(Layer, {'update_cure', RoleId, FieldId, LineId, CureHp});
        _ ->
            skip
    end.

mon_die_check(RoleId, SceneId, LineId, BossId) ->
    case conf_world_boss_field:get_layer_field(SceneId) of
        {Layer, FieldId} ->
            cast(Layer, {'boss_die', RoleId, FieldId, LineId, BossId});
        _ ->
            skip
    end.

get_boss_seq(RoleSid, Layer, FieldId, LineId) ->
    cast(Layer, {'get_boss_seq', RoleSid, FieldId, LineId}).


%% Callbacks --------------------------------------------
init([Layer]) ->
    State = init_layer(Layer),
    {ok, State}.

% 默认匹配
handle_call(Req, _From, State) ->
    ?ERROR("Recv unexpected call request: ~p", [Req]),
    {reply, undefined, State}.

handle_cast({'update_harm', RoleId, FieldId, LineId, {BossId, Add}}, #world_boss_layer{stat = ?WORLD_BOSS_ONGOING} = State) ->
    BossFields = State#world_boss_layer.boss_fields,
    BossField = lists:keyfind(FieldId, #boss_field.field_id, BossFields),
    #boss_field{lines = Lines, harm = Harm} = BossField,
    {LineId, BossHarms} = lists:keyfind(LineId, 1, Harm),
    BossHarm = lists:keyfind(BossId, #boss_harm.boss_id, BossHarms),
    #boss_harm{
        acc_harm = AccHarm, harm_map = HarmMap,
        dice_harm1 = DHarm1, dice_harm2 = DHarm2
    } = BossHarm,
    AccHarmN = AccHarm + Add,
    % 掷骰子判断
    WorldLv = State#world_boss_layer.world_lv,
    LinePid = element(2, lists:keyfind(LineId, 1, Lines)),
    AccHarm < DHarm1 andalso AccHarmN >= DHarm1 andalso
        lib_world_boss:send_dice_reward(LinePid, BossId, WorldLv),
    AccHarm < DHarm2 andalso AccHarmN >= DHarm2 andalso
        lib_world_boss:send_dice_reward(LinePid, BossId, WorldLv),

    % 更新Boss伤害
    HarmMapN = maps:put(RoleId, maps:get(RoleId, HarmMap, 0) + Add, HarmMap),
    BossHarmN = BossHarm#boss_harm{acc_harm = AccHarmN, harm_map = HarmMapN},
    BossHarmsN = lists:keystore(BossId, #boss_harm.boss_id, BossHarms, BossHarmN),
    HarmN = lists:keystore(LineId, 1, BossField#boss_field.harm, {LineId, BossHarmsN}),
    BossFieldN = BossField#boss_field{harm = HarmN},
    BossFieldsN = lists:keystore(FieldId, #boss_field.field_id, BossFields, BossFieldN),
    {noreply, State#world_boss_layer{boss_fields = BossFieldsN}};
handle_cast({'update_harm', _RoleId, _FieldId, _LineId, _Harm}, State) ->
    {noreply, State};

% TODO ignore when all boss dead
handle_cast({'update_cure', RoleId, FieldId, LineId, Add}, #world_boss_layer{stat = ?WORLD_BOSS_ONGOING} = State) ->
    BossFields = State#world_boss_layer.boss_fields,
    BossField = lists:keyfind(FieldId, #boss_field.field_id, BossFields),
    {LineId, CureMap} = lists:keyfind(LineId, 1, BossField#boss_field.recover),
    CureMapN = maps:put(RoleId, maps:get(RoleId, CureMap, 0) + Add, CureMap),
    CureN = lists:keystore(LineId, 1, BossField#boss_field.recover, {1, CureMapN}),
    BossFieldN = BossField#boss_field{recover = CureN},
    BossFieldsN = lists:keystore(FieldId, #boss_field.field_id, BossFields, BossFieldN),
    {noreply, State#world_boss_layer{boss_fields = BossFieldsN}};
handle_cast({'update_cure', _RoleId, _FieldId, _LineId, _Cure}, State) ->
    {noreply, State};

handle_cast({'enter_field', RoleData, FieldId, ReqLine}, #world_boss_layer{is_full = false} = State) ->
    BossFields = State#world_boss_layer.boss_fields,
    BossField = lists:keyfind(FieldId, #boss_field.field_id, BossFields),
    case lib_world_boss:get_line(BossField, ReqLine) of
        {LineId, BossFieldN} when LineId > 0 ->
            #{id := RoleId, name := RoleName, guild_id := GuildId, guild_name := GuildName} = RoleData,
            #boss_field{scene_id = SceneId, born_xy = {X, Y}} = BossFieldN,
            lib_scene_api:change_scene_async(RoleId, SceneId, LineId, X, Y),
            BossFieldsN = lists:keystore(FieldId, #boss_field.field_id, BossFields, BossFieldN),

            #world_boss_layer{role_names = RoleNames, role_guilds = RoleGuilds, guild_names = GuildNames} = State,
            RoleNamesN = maps:put(RoleId, RoleName, RoleNames),
            RoleGuildsN = maps:put(RoleId, GuildId, RoleGuilds),
            GuildNamesN = case maps:is_key(GuildId, GuildNames) of
                true -> GuildNames;
                false -> GuildNames#{GuildId => GuildName}
            end,
            StateN = State#world_boss_layer{
                boss_fields = BossFieldsN,
                role_names = RoleNamesN,
                role_guilds = RoleGuildsN,
                guild_names = GuildNamesN
            },
            {noreply, StateN};
        {_LineId, BossFieldN} ->
            RoleId = maps:get(id, RoleData),
            BossFieldsT = lists:keystore(FieldId, #boss_field.field_id, BossFields, BossFieldN),
            FieldsFull = lists:all(fun(#boss_field{is_full = IsFull}) -> IsFull end, BossFieldsT),
            case FieldsFull of
                true when State#world_boss_layer.extra_scene_seq =/= [] ->
                    ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_CUR_FIELD_FULL),
                    StateT = State#world_boss_layer{boss_fields = BossFieldsT},
                    StateN = check_create_new_line(StateT),
                    {noreply, StateN};
                true ->
                    ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_ALL_LINE_FULL),
                    StateN = State#world_boss_layer{boss_fields = BossFieldsT, is_full = true},
                    {noreply, StateN};
                false ->
                    ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_CUR_LINE_FULL),
                    StateN = State#world_boss_layer{boss_fields = BossFieldsT, is_full = false},
                    {noreply, StateN}
            end;
        _ ->
            RoleId = maps:get(id, RoleData),
            ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_CUR_FIELD_FULL),
            {noreply, State}
    end;
handle_cast({'enter_field', RoleId, _FieldId, _ReqLine}, State) ->
    ?ERROR_TOC(RoleId, ?RC_WORLD_BOSS_ALL_LINE_FULL),
    {noreply, State};

handle_cast({'role_leave', FieldId, LineId, RoleId}, State) ->
    #world_boss_layer{role_names = RoleNames, boss_fields = BossFields} = State,
    case lists:keyfind(FieldId, #boss_field.field_id, BossFields) of
        #boss_field{lines = Lines} = BossField ->
            case lists:keytake(LineId, 1, Lines) of
                {value, {LineId, LinePid, RoleNum, BossList}, Rest} ->
                    RoleNamesN = maps:remove(RoleId, RoleNames),
                    LinesN = [{LineId, LinePid, max(0, RoleNum - 1), BossList} | Rest],
                    BossFieldN = BossField#boss_field{lines = LinesN, is_full = false},
                    BossFieldsN = lists:keystore(FieldId, #boss_field.field_id, BossFields, BossFieldN),
                    StateN = State#world_boss_layer{
                        role_names = RoleNamesN,
                        boss_fields = BossFieldsN,
                        is_full = false
                    },
                    {noreply, StateN};
                _ ->
                    {noreply, State}
            end;
        _ ->
            {noreply, State}
    end;

% BOSS 死亡
handle_cast({'boss_die', RoleId, FieldId, LineId, BossId}, State) ->
    % 发送击杀掉落
    #world_boss_layer{world_lv = WorldLv, role_names = RoleNames} = State,
    DropId = conf_world_boss_level:get_kill_drop(BossId, WorldLv),
    #mon{name = BossName} = conf_mon:get(BossId),
    Fun = fun(Title, Content) -> {Title, io_lib:format(Content, [BossName])} end,
    RewardGoods = lib_drop_base:get_drop_goods(DropId),
    svr_mail:sys2p(RoleId, ?WORLD_BOSS_KILL_MAIL, Fun, RewardGoods, ?OPT_WORLD_BOSS),
    RoleName = maps:get(RoleId, RoleNames, <<"无名氏"/utf8>>),
    GoodsName = lib_role_assets:format_items(RewardGoods),
    svr_rumor:publish(world, ?RUMOR_WORLD_BOSS_KILL_DROP, [RoleName, BossName, BossName, GoodsName]),

    % 取出boss排行数据
    BossFields = State#world_boss_layer.boss_fields,
    {value, BossField, RestFields} = lists:keytake(FieldId, #boss_field.field_id, BossFields),
    #boss_field{lines = Lines, harm = Harm} = BossField,
    {LineId, BossHarms} = lists:keyfind(LineId, 1, Harm),
    BossHarm = lists:keyfind(BossId, #boss_harm.boss_id, BossHarms),
    {value, Line, RestLines} = lists:keytake(LineId, 1, Lines),
    {value, Boss, RestBoss} = lists:keytake(BossId, 1, element(4, Line)),

    % 更新Boss数据
    #world_boss_layer{role_guilds = RoleGuilds, guild_names = GuildNames} = State,
    BossN = lib_world_boss:update_boss_rank(Boss, RoleGuilds, GuildNames, BossHarm),
    SortFun = fun({_GId1, _GName1, GHarm1}, {_GId2, _GName2, GHarm2}) -> GHarm1 >= GHarm2 end,
    #mon{name = BossName} = conf_mon:get(BossId),
    [{_OwnerGuildId, OwnerGuildName, _} | _] = lists:sort(SortFun, element(5, BossN)),
    svr_rumor:publish(world, ?RUMOR_WORLD_BOSS_KILL_OWNER, [OwnerGuildName, BossName]),
    BossListN = [setelement(2, BossN, true) | RestBoss],
    LinesN = [setelement(4, Line, BossListN) | RestLines],
    BossFieldsN = [BossField#boss_field{lines = LinesN} | RestFields],
    StateN = State#world_boss_layer{boss_fields = BossFieldsN},
    {noreply, StateN};

handle_cast({'get_boss_seq', RoleSid, FieldId, LineId}, State) ->
    case lists:keyfind(FieldId, #boss_field.field_id, State#world_boss_layer.boss_fields) of
        #boss_field{boss_seq = BossSeqList} ->
            case lists:keyfind(LineId, 1, BossSeqList) of
                {LineId, BossIds} ->
                    Msg = #get_world_boss_seq_resp{boss_ids = BossIds},
                    {ok, Bin} = prot_msg:encode_msg(30910, Msg),
                    lib_role_send:send_to_sid(RoleSid, Bin);
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    {noreply, State};

% 默认匹配
handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

handle_info('wb_ranking', State) when State#world_boss_layer.rank_ref =/= undefined ->
    #world_boss_layer{
        boss_fields = BossFields,
        role_guilds = RoleGuilds,
        guild_names = GuildNames
    } = State,
    BossFieldsN = lib_world_boss:ranking(BossFields, RoleGuilds, GuildNames),
    RankRef = erlang:send_after(?WB_RANKING_INTERVAL, self(), 'wb_ranking'),
    StateN = State#world_boss_layer{boss_fields = BossFieldsN, rank_ref = RankRef},
    {noreply, StateN};
handle_info('wb_ranking', State) ->
    {noreply, State};

handle_info({'summon_boss', WorldLv}, State) ->
    #world_boss_layer{boss_fields = BossFields} = State,
    BossFieldsN = [lib_world_boss:summon_boss_on_field(BossField, WorldLv) || BossField <- BossFields],
    RankRef = erlang:send_after(1000, self(), 'wb_ranking'),
    StateN = State#world_boss_layer{
        world_lv = WorldLv,
        boss_fields = BossFieldsN,
        stat = ?WORLD_BOSS_ONGOING,
        rank_ref = RankRef
    },
    {noreply, StateN};

% 清理并结算
handle_info('clear_boss_and_settle', #world_boss_layer{stat = ?WORLD_BOSS_ONGOING} = State) ->
    util:cancel_timer(State#world_boss_layer.rank_ref),
    #world_boss_layer{
        layer = #{layer := Layer}, world_lv = WorldLv,
        boss_fields = BossFields, role_guilds = RoleGuilds, guild_names = GuildNames
    } = State,
    [clear_boss_on_field(BossField) || BossField <- BossFields],
    {SettledBossList, RoleContribListByGuild} = lib_world_boss:settle_up(BossFields, RoleGuilds, GuildNames, WorldLv),
    svr_world_boss_mgr:submit_battle_result(Layer, SettledBossList, RoleContribListByGuild),
    StateN = clear_state(State),
    {noreply, StateN};
handle_info('clear_boss_and_settle', State) ->
    {noreply, State};

% 清理不结算
handle_info('clear_boss_without_settle', #world_boss_layer{stat = ?WORLD_BOSS_ONGOING} = State) ->
    util:cancel_timer(State#world_boss_layer.rank_ref),
    BossFields = State#world_boss_layer.boss_fields,
    [clear_boss_on_field(BossField) || BossField <- BossFields],
    StateN = clear_state(State),
    {noreply, StateN};
handle_info('clear_boss_without_settle', State) ->
    {noreply, State};

handle_info('kick_all_role', State) ->
    [do_kick_roles(BossField) || BossField <- State#world_boss_layer.boss_fields],
    {noreply, State};

% 清理当前layer的boss领地
handle_info('clear_layer', #world_boss_layer{stat = ?WORLD_BOSS_CLOSED} = State) ->
    [
        svr_scene_mgr:close_scene(Field#boss_field.scene_id)
        || Field <- State#world_boss_layer.boss_fields
    ],
    #{layer := Layer} = State#world_boss_layer.layer,
    StateN = init_layer(Layer),
    {noreply, StateN};
handle_info('clear_layer', State) ->
    ?ERROR("handle_info('clear_layer' State) ignored !"),
    {noreply, State};

% 默认匹配
handle_info(Info, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Info]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
reg_name(Layer) ->
    dist:get_local_name([?MODULE, "_", Layer]).

cast(Layer, Msg) ->
    Pid = dist:whereis_name(local, reg_name(Layer)),
    is_pid(Pid) andalso gen_server:cast(Pid, Msg).

init_layer(Layer) ->
    LayerConf = #{fields := FieldIds} = conf_world_boss_field:get_layer(Layer),
    {BossFields, SceneSeq} = lib_world_boss:init_boss_fields(FieldIds),
    #world_boss_layer{
        stat = ?WORLD_BOSS_PREPARING,
        layer = LayerConf,
        extra_scene_seq = SceneSeq,
        boss_fields = BossFields
    }.

clear_boss_on_field(BossField) ->
    Lines = BossField#boss_field.lines,
    [lib_scene_api:clear_scene_mon(element(2, Line), true) || Line <- Lines].

do_kick_roles(#boss_field{scene_id = SceneId, lines = Lines}) ->
    [svr_scene_mgr:kick_all_role(SceneId, element(1, Line)) || Line <- Lines].

clear_state(State) ->
    BossFieldsN = [
        begin
            #boss_field{lines = Lines} = Field,
            LinesN = [setelement(4, Line, []) || Line <- Lines],
            Field#boss_field{boss_seq = [], lines = LinesN, harm = [], recover = []}
        end || Field <- State#world_boss_layer.boss_fields
    ],
    State#world_boss_layer{
        boss_fields = BossFieldsN,
        stat = ?WORLD_BOSS_CLOSED,
        rank_ref = undefined
    }.

check_create_new_line(State) ->
    #world_boss_layer{
        extra_scene_seq = [SceneId | ExtraSceneSeqN],
        boss_fields = BossFields
    } = State,
    BossFieldAdded = lists:keyfind(SceneId, #boss_field.scene_id, BossFields),
    case catch lib_world_boss:create_boss_line(BossFieldAdded) of
        {LineAdded, BossFieldAddedT} ->
            #boss_field{
                field_id = FieldIdAdded, lines = Lines,
                harm = Harm, recover = Recover
            } = BossFieldAddedT,
            FieldIdAdded = BossFieldAddedT#boss_field.field_id,
            #{
                boss_list := OrderBossIds,
                born_pos := BornPosList
            } = conf_world_boss_field:get_field(FieldIdAdded),
            BossIds = util:list_disorder(OrderBossIds),
            WorldLv = State#world_boss_layer.world_lv,
            {BossList, BossHarms} = lib_world_boss:do_summon_boss(LineAdded, WorldLv, BossIds, BornPosList),

            NewLineId = element(1, LineAdded),
            LineAddedN = setelement(4, LineAdded, BossList),
            LinesN = lists:keystore(NewLineId, 1, Lines, LineAddedN),
            BossFieldAddedN = BossFieldAddedT#boss_field{
                lines = LinesN,
                harm = [{NewLineId, BossHarms} | Harm],
                recover = [{NewLineId, #{}} | Recover]
            },
            BossFieldsN = lists:keystore(FieldIdAdded, #boss_field.field_id, BossFields, BossFieldAddedN),
            State#world_boss_layer{extra_scene_seq = ExtraSceneSeqN, boss_fields = BossFieldsN, is_full = false};
        _ ->
            ?ERROR("Bad Scene: ~p in WorldBoss Field: ~p", [SceneId, BossFieldAdded#boss_field.field_id]),
            State#world_boss_layer{is_full = true}
    end.
