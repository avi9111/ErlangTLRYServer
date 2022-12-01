%%-------------------------------------------------------
%% @File     : router_903
%% @Brief    : 战斗协议组
%% @Author   : cablsbs
%% @Date     : 2018-7-5
%%-------------------------------------------------------

-module(router_903).

-include("role.hrl").
-include("scene.hrl").
-include("skill.hrl").
-include("battle.hrl").
-include("ret_code.hrl").
-include("guild.hrl").
-include("op_type.hrl").
-include("proto/prot_903.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
% 玩家自己放技能
do(90300, #role_state{id = RoleId} = State, #attack_req{role_id = RoleId, skill_id = SkillId} = MsgRecord) ->
    case check_use_skill(State, SkillId) of
        {ok, Skill} ->
            #role_scene{line_pid = LinePid} = State#role_state.role_scene,
            push_skill_cmd(RoleId, LinePid, MsgRecord, Skill);
        {error, Code} ->
            ?INFO("RoleId: ~p use skill: ~p error !~nReason: ~p", [RoleId, SkillId, {Code, SkillId}]),
            ?ERROR_TOC(RoleId, Code)
    end,
    ok;
% 机器人放技能 TODO 限定场景
do(90300, State, #attack_req{role_id = RoleId, skill_id = SkillId} = MsgRecord) ->
    #role_scene{line_pid = LinePid} = State#role_state.role_scene,
    push_skill_cmd(RoleId, LinePid, MsgRecord, SkillId),
    ok;

% 玩家自己放蓄力技能
do(90303, #role_state{id = RoleId} = State, #pre_skill_req{role_id = RoleId, skill_id = SkillId} = Req) ->
    case check_use_skill(State, SkillId) of
        {ok, Skill} ->
            #role_scene{line_pid = LinePid} = State#role_state.role_scene,
            push_pre_skill(RoleId, LinePid, Req, Skill);
        {error, Code} ->
            ?ERROR("RoleId: ~p pre_skill: ~p error !~nReason: ~p", [RoleId, SkillId, {Code, SkillId}]),
            ?ERROR_TOC(RoleId, Code)
    end,
    ok;

% 机器人放蓄力技能 TODO 限定场景
do(90303, State, #pre_skill_req{role_id = RoleId, skill_id = SkillId} = Req) ->
    #role_scene{line_pid = LinePid} = State#role_state.role_scene,
    push_pre_skill(RoleId, LinePid, Req, SkillId);

% 自己宠物释放技能
do(90305, #role_state{id = RoleId} = State, #pet_attack_req{owner_id = RoleId} = Req) ->
    #pet_attack_req{skill_id = SkillId} = Req,
    case check_pet_use_skill(SkillId) of
        {ok, Skill} ->
            #role_scene{line_pid = LinePid} = State#role_state.role_scene,
            push_pet_skill_cmd(LinePid, Req, Skill);
        {error, Code} ->
            ?INFO("RoleId: ~p use pet skill error! pet not own Skill: ~p !", [RoleId, SkillId]),
            ?ERROR_TOC(RoleId, Code)
    end;

% 机器人宠物释放技能 TODO 限定场景
do(90305, State, #pet_attack_req{} = Req) ->
    #pet_attack_req{skill_id = SkillId, skill_lv = SkillLv} = Req,
    #role_scene{line_pid = LinePid} = State#role_state.role_scene,
    Skill = #skill{id = SkillId, level = SkillLv},
    push_pet_skill_cmd(LinePid, Req, Skill);

% 自己宠物释放蓄力技能
do(90306, #role_state{id = RoleId} = State, #pet_pre_skill_req{owner_id = RoleId} = Req) ->
    #pet_pre_skill_req{skill_id = SkillId} = Req,
    case check_pet_use_skill(SkillId) of
        {ok, Skill} ->
            #role_scene{line_pid = LinePid} = State#role_state.role_scene,
            push_pet_pre_skill_cmd(LinePid, Req, Skill);
        {error, Code} ->
            ?INFO("RoleId: ~p use pet skill error! Pet: ~p not own Skill: ~p !", [RoleId, SkillId]),
            ?ERROR_TOC(RoleId, Code)
    end,
    ok;
% 机器人宠物释放蓄力技能 TODO 限定场景
do(90306, State, #pet_pre_skill_req{} = Req) ->
    #pet_pre_skill_req{skill_id = SkillId, skill_lv = SkillLv} = Req,
    #role_scene{line_pid = LinePid} = State#role_state.role_scene,
    Skill = #skill{id = SkillId, level = SkillLv},
    push_pet_pre_skill_cmd(LinePid, Req, Skill),
    ok;

% 玩家请求主动复活
do(90307, State, #revive_req{type = ReviveType}) ->
    case catch check_can_revive(State, ReviveType) of
        ok -> ok;
        {ok, Costs} ->
            PSN = lib_role_assets:cost_items_notify(State, Costs, ?OPT_REVIVE_MANUAL),
            {ok, PSN};
        {error, Code} ->
            ?ERROR_TOC(State#role_state.id, Code),
            err
    end;

% 玩家采集请求
do(90320, State, #collect_req{coll_id = CollId, coll_type_id = CollTypeID}) ->
    #role_state{id = RoleId, role_scene = #role_scene{scene_id = SceneID, line_pid = LinePid}} = State,
    case check_can_coll(SceneID, State, CollTypeID) of
        true -> svr_scene_agent:push_cmd(LinePid, {'collect', {RoleId, CollId, #{}}});
        {true, Value} -> svr_scene_agent:push_cmd(LinePid, {'collect', {RoleId, CollId, #{cut_perc => Value / 100}}});
        {error, Code} -> ?ERROR_TOC(State, Code)
    end;

% 玩家特殊技能请求(葫芦技能等)
do(90322, State, #use_special_skill_req{}) ->
    #role_state{id = RoleId, role_scene = #role_scene{scene_id = SceneId, line_pid = LinePid}} = State,
    % 葫芦技能
    lists:member(SceneId, ?GOURD_SCENE_IDS) andalso
        svr_scene_agent:push_cmd(LinePid, {'del_effect_id', {?BATTLE_ROLE, RoleId}, 30036}),
    ok;

% 玩家使用婚姻技能请求
do(90330, State, #use_marry_skill_req{skill_id = SkillId}) ->
    case catch lib_role_marriage:use_marry_skill(State, SkillId) of
        ok -> ok;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end;

% 玩家被动传送应答
do(90332, State, #ack_passive_transfer{reply = 1, scene_id = ToSceneId}) ->
    case catch lib_role_marriage:ack_passive_transfer(State, ToSceneId) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end;
do(90332, State, #ack_passive_transfer{reply = Reply}) ->
    Reply =:= 2 andalso begin
        MateId = lib_role_marriage:get_mate_id(State#role_state.id),
        ?ERROR_TOC(MateId, ?RC_MARRY_MATE_IN_FIGHT)
    end,
    ok;

% 玩家使用婚姻技能应答
do(90333, State, #get_marry_skill_cd_req{}) ->
    lib_role_marriage:send_marry_skill_cd(State#role_state.id),
    ok;

%% 处理未定义协议
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).


%% Priates ----------------------------------------------
%% 检查能否复活
check_can_revive(PS, ReviveTypeSrc) ->
    #role_state{id = RoleId, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneId} = RoleScene,
    {_, _, ReviveType, ReviveParam, _} = conf_scene:get_extra_conf(SceneId),
    ExReviveTypeTuple = util:list_find(?REVIVE_PARAM_EXTRA_WAY, 1, ReviveParam, undefined),
    ExReviveType = case ExReviveTypeTuple of
        {?REVIVE_PARAM_EXTRA_WAY, Param} -> Param;
        undefined -> undefined
    end,
    IsForbidden = bit_map:is_set(?REVIVE_BIT_FORBIDDEN, ReviveType),
    IsForbidden =:= false orelse throw({error, ?RC_REVIVE_FORBIDDEN}),
    IsSet = case ReviveTypeSrc of
        0 when ExReviveType =:= undefined -> false;
        0 -> true;
        _ -> bit_map:is_set(ReviveTypeSrc, ReviveType)
    end,
    case ReviveType of
        ?REVIVE_DEFAULT when ReviveTypeSrc =:= ?REVIVE_DEFAULT -> skip;
        ?REVIVE_DEFAULT when ReviveTypeSrc =/= ?REVIVE_DEFAULT -> throw({error, ?RC_REVIVE_INVALID_TYPE});
        _ when not IsSet -> throw({error, ?RC_REVIVE_INVALID_TYPE});
        _ -> skip
    end,
    {_, CanManual} = util:list_find(?REVIVE_PARAM_MANUAL, 1, ReviveParam, {?REVIVE_PARAM_MANUAL, 0}),
    CanManual =:= ?REVIVE_CAN_MANUAL orelse throw({error, ?RC_REVIVE_CANT_MANUAL}),
    %% 道具消耗判断
    SuccResp = if
        ReviveTypeSrc =:= ?REVIVE_BIT_RIGHT_HERE ->
            case lists:keyfind(?REVIVE_PARAM_ITEM, 1, ReviveParam) of
                false ->
                    ok;
                {_, ItemId, Num} ->
                    Costs = [{?AST_ITEM, [{ItemId, Num}]}],
                    lib_role_assets:check_items_enough(PS, Costs),
                    {ok, Costs}
            end;
        true -> ok
    end,
    ReviveTypeN = ?iif(ReviveTypeSrc =/= ?REVIVE_DEFAULT, bit_map:set(ReviveTypeSrc, 0), ReviveTypeSrc),
    Resp = svr_scene_agent:call_scene(RoleScene, {'role_revive', RoleId, ReviveTypeN}),
    case Resp of
        ok -> SuccResp;
        _ -> Resp
    end.


%% 检测释放技能条件
check_use_skill(#role_state{stat = ?SPEC_STAT_DEFAULT} = RoleState, SkillID) ->
    case lists:keyfind(SkillID, #skill.id, RoleState#role_state.skill_list) of
        #skill{} = Skill -> {ok, Skill};
        false -> {error, ?RC_SKILL_NOT_FOUND}
    end;
check_use_skill(_RoleState, _SkillID) ->
    {error, ?RC_SKILL_IN_SPECIAL_STAT}.

%% 检测宠物释放技能条件
check_pet_use_skill(SkillId) ->
    case lib_role_pet:pet_skill_lv(SkillId) of
        Level when Level > 0 -> {ok, #skill{id = SkillId, level = Level}};
        _ -> {error, ?RC_SKILL_NOT_FOUND}
    end.

%% 压入技能命令
push_skill_cmd(RoleId, LinePid, Data, Skill) ->
    #attack_req{defer_type = DefType, defer_id = DefId, assist_x = AssistX, assist_y = AssistY} = Data,
    BattleArgs = {{?BATTLE_ROLE, RoleId}, {DefType, DefId}, Skill, AssistX, AssistY},
    svr_scene_agent:push_cmd(LinePid, {'battle', BattleArgs}).

%% 压入蓄力技能命令
push_pre_skill(RoleId, LinePid, Req, Skill) ->
    #pre_skill_req{
        defer_type = DeferType, defer_id = DeferId,
        assist_x = AssistX, assist_y = AssistY, op = Op
    } = Req,
    PreSkillArgs = {DeferType, DeferId, AssistX, AssistY, Op},
    CmdArgs = {{?BATTLE_ROLE, RoleId}, PreSkillArgs, Op, Skill, time:unixtime_ms()},
    svr_scene_agent:push_cmd(LinePid, {'pre_skill', CmdArgs}).

%% 压入宠物技能命令
push_pet_skill_cmd(LinePid, Req, Skill) ->
    #pet_attack_req{
        id = PetId, owner_id = OwnerId,
        defer_type = DefType, defer_id = DefId,
        assist_x = AssistX, assist_y = AssistY
    } = Req,
    BattleArgs = {{?BATTLE_PET, PetId}, {DefType, DefId}, Skill, AssistX, AssistY, OwnerId},
    svr_scene_agent:push_cmd(LinePid, {'pet_battle', BattleArgs}).

%% 压入宠物蓄力技能命令
push_pet_pre_skill_cmd(LinePid, Req, Skill) ->
    #pet_pre_skill_req{
        id = PetId, owner_id = OwnerId,
        defer_type = DeferType, defer_id = DeferId,
        assist_x = AssistX, assist_y = AssistY, op = Op
    } = Req,
    PreSkillArgs = {DeferType, DeferId, AssistX, AssistY, Op},
    CmdArgs = {{?BATTLE_PET, PetId}, PreSkillArgs, Op, Skill, time:unixtime_ms(), OwnerId},
    svr_scene_agent:push_cmd(LinePid, {'pet_pre_skill', CmdArgs}).

%% 玄武岛捉宠物
check_can_coll(40011, PS, CollID) ->
    CollIDs = conf_catch_pet:get_coll_ids(),
    case lists:member(CollID, CollIDs) of
        true ->
            case lib_role_pet:is_bag_full() of
                false ->
                    ItemID = config:get_sys_config(catch_pet_cost_item),
                    ?iif(lib_role_assets:is_items_enough(PS, [{?AST_ITEM, [{ItemID, 1}]}]), true, {error, ?RC_GOODS_ITEM_NOT_ENOUGH});
                _ ->
                    {error, ?RC_PET_BAG_IS_FULL}
            end;
        _ ->
            true
    end;
check_can_coll(SceneID, PS, _CollID) ->
    IsTerrScene = lib_territory_mgr:is_battle_scene(SceneID),
    if
        IsTerrScene ->
            Value = lib_guild:get_study_value(PS#role_state.guild_id, ?GUILD_STUDY_106),
            ?iif(Value > 0, {true, Value}, true);
        true ->
            true
    end.
