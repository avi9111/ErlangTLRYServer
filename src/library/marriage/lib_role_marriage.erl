%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     結婚
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_marriage).
-author("Ryuu").

-include("role.hrl").
-include("skill.hrl").
-include("scene.hrl").
-include("assets.hrl").
-include("op_type.hrl").
-include("marriage.hrl").
-include("ret_code.hrl").
-include("proto/prot_416.hrl").
-include("proto/prot_903.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    get_attr/1,
    get_fight/1,
    send_info/1,
    view_info/1,
    get_skills/1,
    role_login/1,
    gm_add_love/2,
    handle_info/2,
    get_his_love/1,
    get_mate_id/1,
    get_marry_id/1,
    get_role_data/1,
    part_team_act/3,
    upgrade_skill/2,
    load_view_info/1,
    use_marry_skill/2,
    ack_passive_transfer/2,
    send_marry_skill_cd/1
]).

handle_info({'married', MarryID, MateID}, PS) ->
    married(PS, MarryID, MateID);
handle_info('divorce', PS) ->
    divorce(PS);
handle_info({'divorced', _TargetID}, PS) ->
    divorced(PS);
handle_info({'query_mate_posi', MateID, Action}, PS) ->
    #role_scene{scene_id = SceneID, line_id = LineID, x = X, y = Y} = PS#role_state.role_scene,
    case lib_scene_api:is_normal_scene(SceneID) of
        true -> lib_role:mod_info(MateID, ?MODULE, {'do_transfer', Action, SceneID, LineID, X, Y});
        false -> skip
    end;
handle_info({'passive_transfer_apply', MateID, ToSceneID}, PS) ->
    case lib_scene_api:is_normal_scene(PS#role_state.role_scene) of
        true ->
            NotifyMsg = #notify_passive_transfer{scene_id = ToSceneID},
            {ok, Bin} = prot_msg:encode_msg(90331, NotifyMsg),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin);
        false ->
            ?ERROR_TOC(MateID, ?RC_SKILL_SCENE_LMT_P)
    end;
handle_info({'ack_passive_transfer', MateID, AckSceneID}, PS) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, x = X, y = Y} = RoleScene,
    SceneID =:= AckSceneID orelse erlang:throw({error, ?RC_SKILL_MATE_LEAVE_SCENE}),
    case lib_scene_api:is_normal_scene(SceneID) of
        true ->
            SkillID = conf_marry_skill:get_skill_by_action(2),
            set_last_skill_time(RoleID, SkillID),
            lib_role:mod_info(MateID, ?MODULE, {'do_transfer', none, SceneID, LineID, X, Y});
        false ->
            ?ERROR_TOC(MateID, ?RC_SKILL_SCENE_LMT_P)
    end;
handle_info({'do_transfer', Action, ToSceneID, ToLineID, X, Y}, PS) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, line_pid = LinePid} = RoleScene,
    {ToX, ToY} = lib_scene_sign:rand_pos(ToSceneID, X, Y, 4),
    if
        SceneID =/= ToSceneID orelse LineID =/= ToLineID ->
            lib_scene_api:change_scene_async(RoleID, ToSceneID, ToLineID, ToX, ToY);
        true ->
            TransferArgs = [RoleID, {ToX, ToY}],
            svr_scene_agent:apply_cast(LinePid, lib_obj_role, same_scene_transfer, TransferArgs)
    end,
    SkillID = conf_marry_skill:get_skill_by_action(Action),
    set_last_skill_time(RoleID, SkillID),
    ok;
handle_info({mate_rename, RoleID, Name}, PS) ->
    mate_rename(PS, RoleID, Name);
handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save(PS);
event(PS, rename) ->
    rename(PS);
event(_PS, _Event) ->
    ignore.

do(41601, PS, _Req) ->
    send_info(PS);
do(41603, PS, #cs_marry_invite{id = TargetID, opt = 1}) ->
    invite(PS, TargetID);
do(41603, PS, #cs_marry_invite{id = TargetID, opt = 2}) ->
    marry(PS, TargetID);
do(41605, PS, #cs_marry_response{id = TargetID, opt = Opt}) ->
    response(PS, TargetID, Opt);
do(41611, PS, #cs_marry_divorce{type = Type}) ->
    request(PS, Type);
do(41613, PS, #cs_marry_confirm{opt = Opt}) ->
    confirm(PS, Opt);
do(41619, PS, #cs_marry_adv_bless{}) ->
    adv_bless(PS);
do(41623, PS, #cs_query_mate_scene{}) ->
    query_mate_scene(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{bless := Bless} = RoleData,
    MarryRole = lib_marriage:get_role_data(RoleID),
    #{mate_id := MateID, marry_id := MarryID} = MarryRole,
    case lib_marriage:get_marry_info(MarryID) of
        #{marry_time := MarryTime, love_value := LoveValue} ->
            MateBase = lib_cache:get_role_base(MateID),
            #{name := MateName, career := MateCareer, personal := Personal} = MateBase,
            #{frame := MateFrame, icon := MateIcon} = Personal,
            Rec = #sc_marry_info{
                mate_id = MateID, mate_name = MateName, marry_time = MarryTime,
                bless = Bless, love_value = LoveValue, mate_career = MateCareer,
                mate_frame = MateFrame, mate_icon = MateIcon
            };
        _ ->
            Rec = #sc_marry_info{bless = Bless}
    end,
    {ok, Bin} = prot_msg:encode_msg(41602, Rec),
    lib_role_send:send_to_role(PS, Bin).

invite(PS, TargetID) ->
    case catch check_invite(PS, TargetID) of
        {ok, RoleID} ->
            svr_marriage:invite(RoleID, TargetID);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_invite(PS, TargetID) ->
    #role_state{id = RoleID} = PS,
    Costs = marry_cost(),
    lib_role_assets:check_items_enough(PS, Costs),
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_MARRY_TARGET_NOT_ONLINE}),
    {ok, RoleID}.

response(PS, TargetID, Opt) ->
    #role_state{id = RoleID} = PS,
    svr_marriage:response(RoleID, TargetID, Opt).

marry(PS, TargetID) ->
    case catch check_marry(PS, TargetID) of
        {ok, RoleID, RoleData, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARRY),
            update_role_data(RoleID, RoleData),
            PS2 = PS1#role_state{mate_id = TargetID},
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_marry(PS, TargetID) ->
    #role_state{id = RoleID} = PS,
    Costs = marry_cost(),
    lib_role_assets:check_items_enough(PS, Costs),
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_MARRY_TARGET_NOT_ONLINE}),
    NpcID = config:get_sys_config(marry_npc),
    check_in_team(PS, TargetID, NpcID),
    ?MAKE_SURE(svr_marriage:marry(RoleID, TargetID)),
    RoleData = get_role_data(RoleID),
    NewData = RoleData#{mate_id => TargetID},
    {ok, RoleID, NewData, Costs}.

married(PS, MarryID, MateID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{skills := Skills} = RoleData,
    NewSkills = init_skills(Skills),
    MateName = mate_name(MateID),
    NewData = RoleData#{
        marry_id => MarryID, mate_id => MateID, skills => NewSkills,
        mate_name => MateName
    },
    update_role_data(RoleID, NewData),
    save_role_data(RoleID, NewData),
    PS1 = PS#role_state{mate_id = MateID, mate_name = MateName},
    lib_role_task:cls_tasks(PS1, ?MARRY_TASKS),
    refresh_scene(PS1),
    PS2 = refresh_attr(PS1, true),
    lib_scene_api:update('mod_pskills', PS2),
    PS2.

request(PS, Type) ->
    case catch check_divorce(PS, Type) of
        consult ->
            svr_marriage:request(PS#role_state.id);
        {force, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARRY_DIVORCE),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_divorce(PS, Type) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{mate_id := MateID} = RoleData,
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    case Type of
        ?MARRY_DIVORCE_CONSULT ->
            NpcID = config:get_sys_config(marry_divorce_npc),
            check_in_team(PS, MateID, NpcID),
            consult;
        _ ->
            Coin = config:get_sys_config(marry_divorce_cost),
            Costs = [{?AST_COIN, Coin}],
            lib_role_assets:check_items_enough(PS, Costs),
            ok = ?MAKE_SURE(svr_marriage:divorce(RoleID)),
            {force, Costs}
    end.

confirm(PS, Opt) ->
    svr_marriage:confirm(PS#role_state.id, Opt).

divorce(PS) ->
    svr_marriage:divorce(PS#role_state.id).

divorced(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewData = RoleData#{marry_id => 0, mate_id => 0, mate_name => <<"">>},
    update_role_data(RoleID, NewData),
    PS1 = PS#role_state{mate_id = 0, mate_name = <<"">>},
    lib_role_task:cls_tasks(PS1, ?MARRY_TASKS),
    IDList = conf_marry_skill:get_ids(),
    refresh_scene(PS1),
    PS2 = lib_role_skill:del_skills(PS1, IDList),
    PS3 = correct_love(PS2),
    PS4 = refresh_attr(PS3, true),
    lib_scene_api:update('mod_pskills', PS4),
    PS4.

adv_bless(PS) ->
    case catch check_adv_bless(PS) of
        {ok, RoleID, RoleData, Costs, Bless} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARRY_ADV_RING),
            update_role_data(RoleID, RoleData),
            Rec = #sc_marry_adv_bless{bless = Bless},
            {ok, Bin} = prot_msg:encode_msg(41620, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1, false);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

query_mate_scene(PS) ->
    RoleData = get_role_data(PS#role_state.id),
    MateID = maps:get(mate_id, RoleData, 0),
    if
        MateID > 0 ->
            MateScene = lib_role_agent:get_scene(MateID),
            Msg = #sc_query_mate_scene{scene_id = MateScene},
            {ok, Bin} = prot_msg:encode_msg(41624, Msg),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin);
        true ->
            ?ERROR_TOC(PS#role_state.id, ?RC_MARRY_HAS_NO_MATE)
    end,
    ok.

check_adv_bless(PS) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    RoleData = get_role_data(RoleID),
    #{mate_id := MateID, bless := BlessLv} = RoleData,
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    ConfRing = conf_marry_bless:get(BlessLv),
    ConfRing =/= undefined orelse erlang:throw({error, ?RC_MARRY_NO_RING_CONF}),
    NextLv = BlessLv + 1,
    ConfRingNext = conf_marry_bless:get(NextLv),
    ConfRingNext =/= undefined orelse erlang:throw({error, ?RC_MARRY_MAX_RING_LV}),
    #{love := Love, role_lv := NeedLv} = ConfRing,
    RoleLv >= NeedLv orelse erlang:throw({error, ?RC_MARRY_LEVEL_LIMIT}),
    Costs = [{?AST_LOVE_VALUE, Love}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewData = RoleData#{bless => NextLv},
    {ok, RoleID, NewData, Costs, NextLv}.

upgrade_skill(PS, SkillID) ->
    case catch check_upgrade_skill(PS, SkillID) of
        {ok, RoleID, RoleData, NewLv} ->
            update_role_data(RoleID, RoleData),
            Rec = #sc_marry_lv_up_skill{id = SkillID, level = NewLv},
            {ok, Bin} = prot_msg:encode_msg(41622, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1 = refresh_attr(PS, true),
            lib_scene_api:update('mod_pskills', PS1),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_upgrade_skill(PS, SkillID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{marry_id := MarryID, skills := Skills} = RoleData,
    CurLv = util:prop_get_value(SkillID, Skills),
    CurLv =/= undefined orelse erlang:throw({error, ?RC_MARRY_SKILL_NOT_FOUND}),
    Conf = conf_skill:get({SkillID, CurLv}),
    #{love := NeedVal} = Conf,
    NextLv = CurLv + 1,
    ConfNext = conf_skill:get({SkillID, NextLv}),
    ConfNext =/= undefined orelse erlang:throw({error, ?RC_MARRY_MAX_SKILL_LV}),
    LoveVal = lib_marriage:get_love_value(MarryID),
    LoveVal >= NeedVal orelse erlang:throw({error, ?RC_MARRY_LOVE_NOT_ENOUGH}),
    NewSkills = util:prop_store(SkillID, NextLv, Skills),
    NewData = RoleData#{skills => NewSkills},
    {ok, RoleID, NewData, NextLv}.

rename(PS) ->
    #role_state{id = RoleID, name = Name, mate_id = MateID} = PS,
    MateID > 0 andalso lib_role:mod_info(MateID, lib_role_marriage, {mate_rename, RoleID, Name}),
    ok.

mate_rename(#role_state{mate_id = MateID} = PS, MateID, MateName) ->
    PS1 = PS#role_state{mate_name = MateName},
    refresh_scene(PS1),
    PS1;
mate_rename(_, _, _) ->
    ignore.

%% -----------------------------------------------------------------------------

refresh_scene(PS) ->
    #role_state{id = RoleID, mate_id = MateID, mate_name = MateName} = PS,
    lib_scene_api:update(marry, PS),
    Rec = #sc_marry_notify{role_id = RoleID, mate_id = MateID, mate_name = MateName},
    {ok, Bin} = prot_msg:encode_msg(41610, Rec),
    lib_role_send:send_to_area_scene(PS, Bin).

check_in_team(PS, TargetID, NpcID) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{line_id = LineID} = RoleScene,
    {SceneID, X, Y} = lib_scene_api:get_npc_pos(NpcID),
    TeamInfo = lib_team:get_role_team(RoleID),
    is_map(TeamInfo) orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{members := Members, leader := Leader} = TeamInfo,
    RoleID =:= Leader orelse erlang:throw({error, ?RC_MARRY_NOT_LEADER}),
    lists:member(TargetID, Members) orelse erlang:throw({error, ?RC_MARRY_NOT_IN_TEAM}),
    Near = lib_scene_api:is_team_near(Members, SceneID, LineID, X, Y),
    Near orelse erlang:throw({error, ?RC_MARRY_NOT_NEAR_NPC}),
    ok.

marry_cost() ->
    Coin = config:get_sys_config(marry_cost),
    [{?AST_COIN, Coin}].

get_his_love(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{marry_id := MarryID} = RoleData,
    lib_marriage:get_love_value(MarryID).

get_mate_id(RoleID) ->
    RoleData = get_role_data(RoleID),
    maps:get(mate_id, RoleData, 0).

get_marry_id(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{marry_id := MarryID} = RoleData,
    MarryID.

mate_name(0) ->
    <<"">>;
mate_name(MateID) ->
    lib_cache:get_role_name(MateID).

part_team_act(RoleID, ID, OpType) ->
    case catch check_part_team_act(RoleID, ID) of
        {ok, MarryID, Love} ->
            svr_marriage:add_love(MarryID, Love, OpType);
        {error, Code} ->
            Code
    end.

check_part_team_act(RoleID, ID) ->
    TeamInfo = lib_team:get_role_team(RoleID),
    is_map(TeamInfo) orelse erlang:throw({error, 0}),
    #{leader := Leader, members := Members} = TeamInfo,
    length(Members) =:= 2 orelse erlang:throw({error, 0}),
    RoleID =:= Leader orelse erlang:throw({error, 0}),
    RoleData = lib_marriage:get_role_data(Leader),
    #{mate_id := MateID, marry_id := MarryID} = RoleData,
    lists:member(MateID, Members) orelse erlang:throw({error, 0}),
    Conf = conf_marry_love:get(ID),
    Conf =/= undefined orelse erlang:throw({error, 0}),
    #{love := Love} = Conf,
    {ok, MarryID, Love}.

%% -----------------------------------------------------------------------------

gm_add_love(PS, Love) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{marry_id := MarryID} = RoleData,
    MarryID > 0 andalso svr_marriage:add_love(MarryID, Love, ?OPT_GM).

%% -----------------------------------------------------------------------------

get_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

get_skills(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := MateID, skills_p := SkillsP} = RoleData,
    case MateID > 0 of
        true -> SkillsP;
        false -> []
    end.

refresh_attr(PS, _) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    NewData = set_attr(RoleData),
    update_role_data(RoleID, NewData),
    lib_role_attr:refresh_combat_power(PS).

set_attr(RoleData) ->
    Attr = calc_attr(RoleData),
    Skills = maps:get(skills, RoleData, []),
    PSkills = [
        #skill{id = SkillID, level = SkillLv}
        || {SkillID, SkillLv} <- Skills,
        not conf_marry_skill:is_active(SkillID)
    ],
    Fight = lib_role_attr:calc_combat_power(Attr, PSkills),
    RoleData#{attr => Attr, fight => Fight, skills_p => PSkills}.

calc_attr(RoleData) ->
    #{mate_id := MateID, bless := Bless} = RoleData,
    case MateID > 0 of
        true ->
            BlessAttr = bless_attr(Bless);
        _ ->
            BlessAttr = []
    end,
    lib_role_attr:merge_attr([BlessAttr]).

bless_attr(Bless) ->
    case conf_marry_bless:get(Bless) of
        #{attr := Attr} -> Attr;
        _ -> []
    end.

init_skills(Skills) ->
    IDList = conf_marry_skill:get_ids(),
    init_skills(IDList, Skills).

init_skills([], Skills) ->
    Skills;
init_skills([ID | T], Skills) ->
    case util:prop_get_value(ID, Skills, 0) >= 1 of
        true -> init_skills(T, Skills);
        _ -> init_skills(T, util:prop_store(ID, 1, Skills))
    end.

view_info(RoleID) when is_integer(RoleID) ->
    RoleData = get_role_data(RoleID),
    view_info(RoleData);
view_info(RoleData) ->
    #{mate_id := MateID, bless := Bless} = RoleData,
    MateName = lib_cache:get_role_name(MateID),
    #marry_view{
        mate_id = MateID, mate_name = MateName, bless = Bless
    }.

load_view_info(RoleID) ->
    RoleData = load_role_data(RoleID),
    view_info(RoleData).

use_marry_skill(PS, SkillID) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #{skills := MarrySkills, mate_id := MateID} = get_role_data(RoleID),
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    lib_role:is_online(MateID) orelse erlang:throw({error, ?RC_MARRY_TARGET_NOT_ONLINE}),
    conf_marry_skill:is_active(SkillID) orelse erlang:throw({error, ?RC_SKILL_NOT_ACTIVE_SKILL}),
    case lists:keyfind(SkillID, 1, MarrySkills) of
        {SkillID, SkillLv} ->
            check_skill_cd(SkillID, SkillLv),
            case conf_marry_skill:get_action(SkillID, SkillLv) of
                [Act] ->
                    #{mate_id := MateID} = get_role_data(RoleID),
                    check_in_normal_scene(RoleScene) orelse erlang:throw({error, ?RC_SKILL_SCENE_LMT}),
                    Act =:= 1 andalso lib_role:mod_info(MateID, ?MODULE, {'query_mate_posi', RoleID, Act}),
                    Act =:= 2 andalso begin
                        PassTransferModInfo = {'passive_transfer_apply', RoleID, RoleScene#role_scene.scene_id},
                        lib_role:mod_info(MateID, ?MODULE, PassTransferModInfo)
                    end;
                [3, Perc] ->
                    ReviveType = element(3, conf_scene:get_extra_conf(RoleScene#role_scene.scene_id)),
                    bit_map:is_set(?REVIVE_BIT_BY_MATE, ReviveType) orelse
                        erlang:throw({error, ?RC_MARRY_SCENE_CANNOT_REVIVE_MATE}),
                    set_last_skill_time(RoleID, SkillID),
                    svr_scene_agent:cast_scene(RoleScene, {'revive_mate', RoleID, MateID, Perc})
            end,
            ok;
        _ ->
            {error, ?RC_SKILL_NOT_FOUND}
    end.

ack_passive_transfer(PS, AckSceneID) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #{mate_id := MateID} = get_role_data(RoleID),
    check_in_normal_scene(RoleScene) orelse erlang:throw({error, ?RC_SKILL_SCENE_LMT}),
    lib_role:is_online(MateID) orelse erlang:throw({error, ?RC_MARRY_TARGET_NOT_ONLINE}),
    lib_role:mod_info(MateID, ?MODULE, {'ack_passive_transfer', RoleID, AckSceneID}),
    ok.

send_marry_skill_cd(RoleID) ->
    SkillCdMap = get_skill_cd(),
    SkillCdList = maps:to_list(SkillCdMap),
    Msg = #get_marry_skill_cd_resp{cd_list = SkillCdList},
    {ok, Bin} = prot_msg:encode_msg(90334, Msg),
    lib_role_send:send_to_role(RoleID, Bin).

check_skill_cd(SkillId, SkillLv) ->
    Cd = conf_marry_skill:get_cd(SkillId, SkillLv),
    LastSkillTime = get_last_skill_time(SkillId),
    LastSkillTime + Cd =< time:unixtime() orelse erlang:throw({error, ?RC_SKILL_COOLINGDOWN}).

get_last_skill_time(SkillID) ->
    SkillCdMap = get_skill_cd(),
    maps:get(SkillID, SkillCdMap, 0).

set_last_skill_time(RoleID, SkillID) when SkillID > 0 ->
    NowTime = time:unixtime(),
    SkillCdMap = get_skill_cd(),
    SkillCdMapN = maps:put(SkillID, NowTime, SkillCdMap),
    put({?MODULE, skill_cd}, SkillCdMapN),
    NotifyMsg = #notify_update_marry_skill_cd{skill_id = SkillID},
    {ok, Bin} = prot_msg:encode_msg(90335, NotifyMsg),
    lib_role_send:send_to_role(RoleID, Bin);
set_last_skill_time(_RoleID, _SkillID) ->
    ok.

get_skill_cd() ->
    case get({?MODULE, skill_cd}) of
        undefined -> #{};
        SkillCdMap -> SkillCdMap
    end.

check_in_normal_scene(#role_scene{scene_id = SceneID}) ->
    lib_scene_api:is_normal_scene(SceneID) orelse erlang:throw({error, ?RC_SKILL_COOLINGDOWN}).

%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = set_attr(load_role_data(RoleID)),
    #{mate_id := MateID} = RoleData,
    set_role_data(RoleID, RoleData),
    PS#role_state{mate_id = MateID, mate_name = mate_name(MateID)}.

role_login(PS) ->
    correct_love(PS).

correct_love(PS) when PS#role_state.mate_id =:= 0 ->
    LoveValue = lib_role_money:get_money(PS, ?AST_LOVE_VALUE),
    Costs = [{?AST_LOVE_VALUE, LoveValue}],
    lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARRY_DIVORCE);
correct_love(PS) ->
    PS.

load_role_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_MARRIAGE, [RoleID]),
    MarryRole = lib_marriage:get_role_data(RoleID),
    #{mate_id := MateID, marry_id := MarryID} = MarryRole,
    MateName = mate_name(MateID),
    case db:get_row(SQL) of
        [Bless, DbSkills, Time] ->
            Skills = type:convert_db_field(list, DbSkills, []),
            ?role_marriage#{
                role_id => RoleID, marry_id => MarryID, mate_id => MateID,
                bless => Bless, skills => Skills, time => Time, mate_name => MateName
            };
        _ ->
            ?role_marriage#{
                role_id => RoleID, marry_id => MarryID, mate_id => MateID,
                time => time:unixtime(), mate_name => MateName
            }
    end.

save(PS) ->
    save_(PS).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            save_role_data(RoleID, RoleData);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleData) ->
    #{bless := Bless, skills := Skills, time := Time} = RoleData,
    DbSkills = type:term_to_bitstring(Skills),
    SQL = io_lib:format(?SQL_SET_ROLE_MARRIAGE, [
        RoleID, Bless, DbSkills, Time
    ]),
    db:execute(SQL),
    set_role_data(RoleID, RoleData#{updated => false}).

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_marriage#{
                role_id => RoleID, time => time:unixtime()
            }
    end.
