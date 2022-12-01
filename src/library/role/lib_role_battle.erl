%%-------------------------------------------------------
%% @File     : lib_role_battle
%% @Brief    : 角色战斗逻辑(杀气，宣战等)
%% @Author   : cablsbs
%% @Date     : 2018-12-04
%%-------------------------------------------------------
-module(lib_role_battle).

-include("role.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_ud.hrl").
-include("proto/prot_901.hrl").


%% 辅助api
-export([
    init/1,
    event/2,
    is_in_jail/1,
    murderous_punish/1,
    update_murderous/2
]).

%% 处理请求api
-export([
    declare_war/2,
    battle_log_info/1,
    battle_log_delete/2,
    change_scene_mode/2,
    battle_log_record/5
]).

-define(BATTLE_LOG_MAX_NUM, 20).            % 对战信息记录上限
-define(AUTO_CLEAR_MURDEROUS, 3600).        % 自动清除杀气cd


%% Apis -------------------------------------------------
% @doc 登陆初始化
init(#role_state{stat = Stat, role_scene = RoleScene} = RoleState) ->
    case RoleScene#role_scene.scene_id =:= ?SCENE_ID_JAIL of
        true ->
            StatN = bit_map:set(?SPEC_STAT_BIT_JAIL, Stat),
            RoleState#role_state{stat = StatN};
        false ->
            RoleState
    end.

% @doc 处理事件
event(#role_state{murderous = Murderous} = RoleState, {'timer', 'half_minute'}) when Murderous > 0 ->
    #role_state{
        id = RoleId, clr_mur_counter = ClrMurCounter,
        role_scene = #role_scene{scene_id = SceneId}
    } = RoleState,
    case lib_scene_api:is_clear_murderous(SceneId) of
        true ->
            ClrMurCounterN = (ClrMurCounter + 30) rem ?AUTO_CLEAR_MURDEROUS,
            RoleStateT = case ClrMurCounterN > ClrMurCounter of
                true ->
                    RoleState;
                false ->
                    ?ERROR_TOC(RoleId, ?RC_BATTLE_AUTO_CLR_MURDEROUS),
                    update_murderous(RoleState, {del, 1})
            end,
            RoleStateN = RoleStateT#role_state{clr_mur_counter=ClrMurCounterN},
            {ok, RoleStateN};
        false ->
            skip
    end;
event(_RoleState, _Event) ->
    skip.

% 是否被监禁
is_in_jail(Stat) ->
    bit_map:is_set(?SPEC_STAT_BIT_JAIL, Stat).

% @doc 杀气惩罚(死亡后执行)
murderous_punish(RoleState) ->
    #role_state{exp = Exp, murderous = Murderous} = RoleState,
    MurderousAffecttedExp = conf_murderous_punish:exp_punish(Exp, Murderous),
    case Exp - MurderousAffecttedExp of
        CostExp when CostExp > 0 ->
            Cost = [{?AST_EXP, CostExp}],
            lib_role_assets:cost_items_notify(RoleState, Cost, ?OPT_MURDEROUS_PUNISH);
        _CostExp ->
            RoleState
    end.

% @doc 加杀气
update_murderous(RoleState, {add, N}) ->
    #role_state{
        id = RoleId, murderous = Murderous,
        role_scene = #role_scene{line_pid = LinePid}
    } = RoleState,
    MurderousFix = max(0, Murderous),
    JailMurderous = conf_battle_common:get(jail_murderous),
    MurderousN = min(MurderousFix + N, JailMurderous),
    sync_murderous(LinePid, RoleId, MurderousN),
    if
        MurderousN =:= JailMurderous ->
            arrest_to_jail(RoleState#role_state{murderous = MurderousN});
        true ->
            RoleState#role_state{murderous = MurderousN}
    end;
% @doc 减杀气
update_murderous(RoleState, {del, N}) ->
    #role_state{
        id = RoleId, murderous = Murderous, stat = Stat,
        role_scene = #role_scene{line_pid = LinePid}
    } = RoleState,
    MurderousN = max(-3, Murderous - N),
    sync_murderous(LinePid, RoleId, MurderousN),
    FreeMurderous = conf_battle_common:get(free_murderous),
    if
        MurderousN =< FreeMurderous ->
            case is_in_jail(Stat) of
                true ->
                    RoleStateT = release_from_jail(RoleState),
                    RoleStateT#role_state{murderous = MurderousN};
                false ->
                    RoleState#role_state{murderous = MurderousN}
            end;
        true ->
            RoleState#role_state{murderous = MurderousN}
    end.


%% Apis for request -------------------------------------
% @doc 宣战
declare_war(RoleState, RivalId) ->
    #role_state{id = RoleId, role_scene = RoleScene, guild_id = GuildId} = RoleState,
    #role_scene{scene_id = SceneId, line_pid = LinePid, mode = SceneMode} = RoleScene,
    IsCanDeclare = lib_scene_api:is_can_declare(SceneId),
    IsCanDeclare orelse throw({error, ?RC_BATTLE_DECLARE_FORBIDDEN_SCENE}),
    if
        SceneMode =:= ?MODE_TEAM ->
            case lib_team:get_role_team(RoleId) of
                #{members := Members} ->
                    lists:member(RivalId, Members) andalso throw({error, ?RC_BATTLE_DECLARE_TEAM_MATE});
                _ ->
                    skip
            end;
        SceneMode =:= ?MODE_GUILD ->
            RivalGuild = lib_guild:get_role_guild_id(RivalId),
            GuildId =/= RivalGuild orelse GuildId =:= 0 orelse
                throw({error, ?RC_BATTLE_DECLARE_GUILD_MATE});
        true ->
            true
    end,
    svr_scene_agent:cast_scene(LinePid, {'declare_war', RoleId, RivalId}).

% @doc 切换场景模式
change_scene_mode(RoleState, Mode) ->
    #role_state{id = RoleId, guild_id = GuildId, role_scene = RoleScene, bt_data = BtData} = RoleState,
    DeclareMap = maps:get(declare_map, BtData, #{}),
    #role_scene{mode = CurMode, unlock_change_mode = UnlockChangeMode} = RoleScene,
    ChangeModeCd = if
        CurMode =:= ?MODE_PEACE -> 0;
        Mode =/= ?MODE_PEACE andalso Mode =/= ?MODE_JUSTICE -> 0;
        true -> change_mode_cd(UnlockChangeMode, DeclareMap)
    end,

    if
        CurMode =:= Mode ->
            skip;
        ChangeModeCd > 0 ->
            {colling, ChangeModeCd};
        true ->
            #role_scene{line_pid = LinePid, scene_id = SceneId} = RoleScene,
            case lib_scene_check:check_change_mode(SceneId, Mode, GuildId) of
                ?RC_SUCCEED ->
                    Cmd = {'change_scene_mode', {RoleId, Mode}},
                    svr_scene_agent:push_cmd(LinePid, Cmd),
                    UnlockChangeModeN = time:unixtime_ms() + 180000,
                    {ok, RoleScene#role_scene{mode = Mode, unlock_change_mode = UnlockChangeModeN}};
                RetCode ->
                    {error, RetCode}
            end
    end.

%% @doc 获取对战信息记录
battle_log_info(RoleState) ->
    #role_state{id = RoleID} = RoleState,
    DataList = lib_role_kv:get_kv(RoleID, ?KEY_BATTLE_LOG_INFO, []),
    lib_role_kv:set_kv(RoleID, ?KEY_BATTLE_LOG_INFO, DataList),

    BattleLogs = [
        begin
            WinnerName = lib_cache:get_role_name(WinnerId),
            BattleLog#battle_lose_log{winner_name = WinnerName}
        end || {_, #battle_lose_log{winner_id = WinnerId} = BattleLog} <- DataList
    ],
    {ok, BattleLogs}.

%% @doc 删除某条对战信息
battle_log_delete(RoleState, Id) ->
    #role_state{id = RoleID} = RoleState,
    DataList = lib_role_kv:get_kv(RoleID, ?KEY_BATTLE_LOG_INFO, []),
    DataListN = case lists:keyfind(Id, 1, DataList) of
         false -> throw({error, ?RC_BATTLE_LOG_INFO_NOT_EXIST}), DataList;
         _ -> lists:keydelete(Id, 1, DataList)
    end,
    lib_role_kv:set_kv(RoleID, ?KEY_BATTLE_LOG_INFO, DataListN),
    ok.

%% @doc 对战信息记录
battle_log_record(PS, SceneId, KillerId, KillerType, AtterOwnerId) ->
    #role_state{id = RoleID} = PS,
    TargetId = case KillerType of
        ?BATTLE_ROLE when KillerId =/= RoleID -> KillerId;
        ?BATTLE_PET -> AtterOwnerId;
        _ -> undefined
    end,
    TargetId =/= undefined andalso begin
        IdIndex = lib_role_kv:get_kv(RoleID, ?KEY_BATTLE_LOG_INDEX, 0),
        Id = ?iif(IdIndex + 1 > 100, 0, IdIndex + 1),
        lib_role_kv:set_kv(RoleID, ?KEY_BATTLE_LOG_INDEX, Id),
        DataList = lib_role_kv:get_kv(RoleID, ?KEY_BATTLE_LOG_INFO, []),
        BattleLog = #battle_lose_log{
            id = Id,
            time = time:unixtime(),
            scene = SceneId,
            winner_id = TargetId
        },
        DataListN = lists:sublist([{Id, BattleLog} | DataList], ?BATTLE_LOG_MAX_NUM),
        lib_role_kv:set_kv(RoleID, ?KEY_BATTLE_LOG_INFO, DataListN),
        WinnerName = lib_cache:get_role_name(TargetId),
        router_901:send_battle_log_new(PS, BattleLog#battle_lose_log{winner_name = WinnerName})
    end.

%% Privates ---------------------------------------------
% 抓捕入狱
arrest_to_jail(#role_state{stat = Stat} = RoleState) ->
    case is_in_jail(Stat) of
        false ->
            StatN = bit_map:set(?SPEC_STAT_BIT_JAIL, Stat),
            {ok, RoleStateT} = lib_scene_api:change_scene(RoleState, ?SCENE_ID_JAIL, ?DYN_LINE_ID),
            RoleStateT#role_state{stat = StatN};
        true ->
            RoleState
    end.

% 刑满释放
release_from_jail(#role_state{level = Level, stat = Stat} = RoleState) ->
    case is_in_jail(Stat) of
        true ->
            StatN = bit_map:unset(?SPEC_STAT_BIT_JAIL, Stat),
            RoleStateT = RoleState#role_state{stat = StatN},
            {SceneId, X, Y} = conf_scene:get_correct_scene(Level),
            {ok, RoleStateN} = lib_scene_api:change_scene(RoleStateT, SceneId, ?DYN_LINE_ID, X, Y),
            RoleStateN;
        false ->
            RoleState
    end.

sync_murderous(LinePid, RoleId, Murderous) ->
    lib_scene_api:scene_update(LinePid, {'murderous', RoleId, Murderous}).

change_mode_cd(UnlockChangeMode, DeclareMap) ->
    Fun = fun(_Id, Expired, Acc) ->
        case Expired > Acc of
            true -> Expired;
            false -> Acc
        end
    end,
    ValidTimeMS = maps:fold(Fun, UnlockChangeMode, DeclareMap),
    (ValidTimeMS div 1000) - time:unixtime().
