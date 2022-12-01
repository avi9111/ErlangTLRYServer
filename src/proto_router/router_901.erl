%%-------------------------------------------------------
%% @File     : router_901
%% @Brief    : 角色场景协议组
%% @Author   : cablsbs
%% @Date     : 2018-6-11
%%-------------------------------------------------------

-module(router_901).

-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_901.hrl").

-export([
    do/3,
    response/3,
    send_battle_log_new/2,
    send_enter_scene_info/1,
    send_base_attr_update/2
]).


%% Apis -------------------------------------------------
% @doc 角色场景信息请求
% MsgRecord = #role_enter_scene_info_req{}
do(90100, State, #role_enter_scene_info_req{}) ->
    send_enter_scene_info(State),
    ok;

% @doc 角色切换场景模式请求
% MsgRecord = #change_scene_mode_req{}
do(90112, State, #change_scene_mode_req{scene_mode = Mode}) ->
    RoleId = State#role_state.id,
    case lib_role_battle:change_scene_mode(State, Mode) of
        skip ->
            ok;
        {ok, RoleSceneN} ->
            StateN = State#role_state{role_scene = RoleSceneN},
            {reply, {0, 0}, StateN};
        {colling, Cd} ->
            CdStr = ?i2l(Cd),
            ?ERROR_TOC(RoleId, ?RC_BATTLE_CHANGE_MODE_COLLING_DOWN, [CdStr]),
            {reply, {Mode, Cd}};
        {error, RetCode} ->
            ?ERROR_TOC(RoleId, RetCode),
            {reply, {0, 0}}
    end;

% @doc 角色宣战请求
do(90114, State, #declare_war_req{rival_id = RivalId}) ->
    case catch lib_role_battle:declare_war(State, RivalId) of
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode);
        _ -> skip
    end,
    ok;

%% 获取对战信息
do(90122, State, #cs_battle_log_info{}) ->
    case lib_role_battle:battle_log_info(State) of
        {ok, BattleLogs} when is_list(BattleLogs) ->
            {ok, Bin} = prot_msg:encode_msg(90123, #sc_battle_log_info{logs = BattleLogs}),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        _ -> skip
    end;

%% 删除某条对战信息
do(90124, State, #cs_battle_log_delete{id = Id}) ->
    case catch lib_role_battle:battle_log_delete(State, Id) of
        ok ->
            {ok, Bin} = prot_msg:encode_msg(90125, #sc_battle_log_delete{id = Id}),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

%% 处理未定义协议
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

%% 角色切换场景模式返回
response(90112, #role_state{sid = RoleSid, role_scene = RoleScene}, {NextMode, NextModeCd}) ->
    Mode = RoleScene#role_scene.mode,
    MsgRecord = #change_scene_mode_resp{scene_mode = Mode, next_mode = NextMode, next_mode_cd = NextModeCd},
    {ok, Bin} = prot_msg:encode_msg(90113, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok;

%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).

send_enter_scene_info(State) ->
    #role_state{
        id = RoleId, server_num = ServerNum, name = Name, gender = Gender,
        career = Career, level = Level, exp = Exp, hp = Hp, mp = Mp,
        base_attr = BaseAttr, bt_data = BtData, role_scene = RoleScene,
        personal = Personal, skill_list = SkillList, guild_id = GuildId,
        guild_name = GuildName, combat_power = CombatPower, murderous = Murderous,
        tran_stat = TranStat, stat = Stat, stat_params = StatParams,
        mate_id = MateID, mate_name = MateName
    } = State,
    ServerTime = time:unixtime_ms(),
    Anger = maps:get(anger, BtData, 0),
    TeamId = lib_team:get_role_team_id(RoleId),
    #{bt_attr := BtAttr, skill_cd := SkillCd, horse_stat := HorseStat} = BtData,
    SkillListTuples = data_transfer:sc_skill_list(SkillList),
    #role_scene{scene_id = SceneId, x = X, y = Y, reset_index = ResetIndex} = RoleScene,
    #{icon := Icon, hair := Hair, title := Title, fashion := Fashion, title_honor := TitleHonor,
        frame := Frame, bubble := Bubble} = Personal,
    Exteriors = lib_role_exterior:scene_exteriors(RoleId, HorseStat),
    LineId = get_clt_line_id(RoleScene),
    {SwornTitle, Quality} = lib_role_sworn:get_sworn_name(RoleId, Title),
    Info = #role_enter_scene_info_resp{
        role_id = RoleId, server_num = ServerNum, server_time = ServerTime,
        name = Name, career = Career, gender = Gender, guild = GuildId,
        guild_name = GuildName, team = TeamId, level = Level, exp = Exp,
        scene_id = SceneId, line_id = LineId, x = X, y = Y, reset_index = ResetIndex,
        hp = Hp, mp = Mp, anger = Anger, combat_power = CombatPower,
        murderous = Murderous, base_attr = BaseAttr, attr = BtAttr,
        skill_list = SkillListTuples, skill_cd = maps:to_list(SkillCd),
        icon = Icon, hair = Hair, title = Title, title_extra = SwornTitle,
        title_quality = Quality, fashion = Fashion, exteriors = Exteriors,
        title_honor = TitleHonor, artifact = lib_role_artifact:get_artifact_cur_avatar(RoleId),
        warrior_soul = lib_role_warrior_soul:get_Warrior_soul_cur_avatar(RoleId),
        frame = Frame, bubble = Bubble, tran_stat = TranStat, state = Stat,
        state_params = StatParams, mate_id = MateID, mate_name = MateName
    },
    {ok, Bin} = prot_msg:encode_msg(90101, Info),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发玩家基础属性变化
send_base_attr_update(State, BaseAttr) ->
    BaseAttrChangeMsg = #notify_base_attr_change{base_attr = BaseAttr},
    {ok, BtAttrChangeBin} = prot_msg:encode_msg(90121, BaseAttrChangeMsg),
    lib_role_send:send_to_sid(State#role_state.sid, BtAttrChangeBin).

%% @doc 下发对战信息记录更新
send_battle_log_new(State, NewLog) when is_record(NewLog, battle_lose_log) ->
    MsgData = #sc_battle_log_new{new_log = NewLog},
    {ok, Bin} = prot_msg:encode_msg(90126, MsgData),
    lib_role_send:send_to_sid(State#role_state.sid, Bin);
send_battle_log_new(_, _) ->
    skip.


%% Privates ----------------------------------------------
get_clt_line_id(#role_scene{scene_id = SceneId, line_id = LineId}) ->
    case lib_scene_api:is_normal_scene(SceneId) of
        true -> LineId;
        _ -> 0
    end.
