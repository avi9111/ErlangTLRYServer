%%-------------------------------------------------------
%% @File     : lib_role_skill
%% @Brief    : 角色技能相关处理
%% @Author   : cablsbs
%% @Date     : 2018-6-21
%%-------------------------------------------------------
-module(lib_role_skill).

-include("role.hrl").
-include("skill.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_408.hrl").

-export([
    do/3,
    init/1,
    event/2,
    add_skills/2,
    del_skills/2,
    skill_conf/1,
    create_init/2,
    handle_info/2,
    scene_skills/1,
    get_skill_num/2,
    parse_skill_list/1,
    get_mod_pskills/1
]).

handle_info(init_refresh, PS) ->
    init_refresh(PS);
handle_info(_Info, _PS) ->
    ignore.

do(40801, PS, _Req) ->
    get_info(PS);
do(40803, PS, #cs_skill_active{id = ItemID}) ->
    active(PS, ItemID);
do(40805, PS, #cs_skill_upgrade{id = SkillID}) ->
    upgrade(PS, SkillID);
do(40807, PS, #cs_skill_one_key_up{}) ->
    one_key_upgrade(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

event(PS, level_up) ->
    upgrade_unlock(PS);
event(_PS, _Event) ->
    ok.

%% @doc 获取信息
get_info(PS) ->
    PS.

%% @doc 激活技能
active(PS, ItemID) ->
    case catch check_active(PS, ItemID) of
        {ok, Costs, Skill} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_SKILL_ACTIVE),
            PS2 = add_skills(PS1, [Skill]),
            #skill{id = SkillID, level = SkillLv} = Skill,
            Rec = #sc_skill_active{id = SkillID, lv = SkillLv},
            {ok, Bin} = prot_msg:encode_msg(40804, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_role_attr:refresh_combat_power(PS2);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_active(PS, ItemID) ->
    #role_state{skill_list = Skills} = PS,
    Costs = [{?AST_ITEM, [{ItemID, 1}]}],
    lib_role_assets:check_items_enough(PS, Costs),
    SkillID = conf_goods_effect:get(ItemID),
    SkillLv = conf_skill:get_min_lv(SkillID),
    ConfSkill = conf_skill:get({SkillID, SkillLv}),
    ConfSkill =/= undefined orelse erlang:throw({error, ?RC_SKILL_CONF_NOT_FOUND}),
    NotActive = lists:keyfind(SkillID, #skill.id, Skills) =:= false,
    NotActive orelse erlang:throw({error, ?RC_SKILL_ALREADY_ACTIVATED}),
    Skill = #skill{id = SkillID, level = SkillLv},
    {ok, Costs, Skill}.

%% @doc 升级解锁技能
upgrade_unlock(PS) ->
    init_refresh(PS).

%% @doc 登录刷新技能
init_refresh(PS) ->
    #role_state{career = Career, level = RoleLv} = PS,
    CSkills = conf_skill_career:get_skills({Career, RoleLv}),
    lib_role_skill:add_skills(PS, CSkills).

%% @doc 升级技能
upgrade(PS, SkillID) ->
    case catch check_upgrade(PS, SkillID) of
        {ok, PS1, Costs, SkillLv} ->
            PS2 = lib_role_assets:cost_items_notify(PS1, Costs, ?OPT_SKILL_UPGRADE),
            Rec = #sc_skill_upgrade{id = SkillID, lv = SkillLv},
            {ok, Bin} = prot_msg:encode_msg(40806, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_scene_api:update(skill_list, PS2),
            ?EVENT(PS#role_state.id, {'upgrade_skill', 1}),
            ?TASK_EVENT(PS#role_state.id, 'upgrade_skill'),
            lib_role_attr:refresh_combat_power(PS2);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_upgrade(PS, SkillID) ->
    #role_state{skill_list = Skills, level = RoleLv} = PS,
    Skill = lists:keyfind(SkillID, #skill.id, Skills),
    Skill =/= false orelse erlang:throw({error, ?RC_SKILL_NOT_FOUND}),
    #skill{level = SkillLv} = Skill,
    SkillLv < RoleLv orelse erlang:throw({error, ?RC_SKILL_ROLE_LV_LIMIT}),
    ConfSkill = conf_skill:get({SkillID, SkillLv}),
    lib_skill_util:is_career_active(SkillID) orelse erlang:throw({error, ?RC_SKILL_NOT_CAREER_SKILL}),
    NewSkillLv = SkillLv + 1,
    ConfSkillNext = conf_skill:get({SkillID, NewSkillLv}),
    ConfSkillNext =/= undefined orelse erlang:throw({error, ?RC_SKILL_MAX_LV}),
    #{cost := Coin} = ConfSkill,
    Costs = [{?AST_COIN, Coin}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewSkill = Skill#skill{level = NewSkillLv},
    NewSkills = lists:keystore(SkillID, #skill.id, Skills, NewSkill),
    PS1 = PS#role_state{skill_list = NewSkills},
    {ok, PS1, Costs, NewSkillLv}.

%% @doc 一键升级
one_key_upgrade(PS) ->
    #role_state{skill_list = SkillList, level = RoleLv} = PS,
    TotalGold = lib_role_money:get_money(PS, ?AST_COIN),
    CSkills = filter_skills(SkillList),
    {NewSkillList, Coin, Times, ChangeList} = upgrade_skills(CSkills, TotalGold, RoleLv, SkillList, 0, 0, []),
    Costs = [{?AST_COIN, Coin}],
    PS1 = PS#role_state{skill_list = NewSkillList},
    PS2 = lib_role_assets:cost_items_notify(PS1, Costs, ?OPT_SKILL_UPGRADE),
    Rec = #sc_skill_one_key_up{skills = ChangeList},
    {ok, Bin} = prot_msg:encode_msg(40808, Rec),
    lib_role_send:send_to_role(PS, Bin),
    ?EVENT(PS#role_state.id, {'upgrade_skill', Times}),
    ?TASK_EVENT(PS#role_state.id, upgrade_skill),
    lib_scene_api:update(skill_list, PS2),
    lib_role_attr:refresh_combat_power(PS2).

filter_skills(SkillLists) ->
    Fun = fun(#skill{id = SkillID}) -> lib_skill_util:is_career_active(SkillID) end,
    lists:sort(lists:filter(Fun, SkillLists)).

upgrade_skills([], _TotalGold, _RoleLv, SkillAcc, CoinAcc, TimesAcc, ChangeAcc) ->
    {SkillAcc, CoinAcc, TimesAcc, ChangeAcc};
upgrade_skills([Skill | T], TotalGold, RoleLv, SkillAcc, CoinAcc, TimesAcc, ChangeAcc) ->
    #skill{id = SkillID, level = SkillLv} = Skill,
    {NewSkill, NewCoinAcc, NewTimesAcc} = upgrade_skill(Skill, TotalGold, RoleLv, CoinAcc, TimesAcc),
    #skill{id = SkillID, level = NewSkillLv} = NewSkill,
    NewSkillAcc = lists:keystore(SkillID, #skill.id, SkillAcc, NewSkill),
    NewChangeAcc = ?iif(NewSkillLv =/= SkillLv, [{SkillID, NewSkillLv} | ChangeAcc], ChangeAcc),
    upgrade_skills(T, TotalGold, RoleLv, NewSkillAcc, NewCoinAcc, NewTimesAcc, NewChangeAcc).

upgrade_skill(Skill, TotalCoin, RoleLv, CoinAcc, TimesAcc) ->
    case catch upgrade_skill2(Skill, TotalCoin, RoleLv, CoinAcc) of
        {ok, NewSkill, NewCoinAcc} ->
            upgrade_skill(NewSkill, TotalCoin, RoleLv, NewCoinAcc, TimesAcc + 1);
        _ ->
            {Skill, CoinAcc, TimesAcc}
    end.

upgrade_skill2(Skill, TotalCoin, RoleLv, CoinAcc) ->
    #skill{id = SkillID, level = SkillLv} = Skill,
    lib_skill_util:is_career_active(SkillID) orelse erlang:throw({error, not_career_skill}),
    SkillLv < RoleLv orelse erlang:throw({error, role_lv_limit}),
    ConfSkill = conf_skill:get({SkillID, SkillLv}),
    ConfSkill =/= undefined orelse erlang:throw({error, invalid}),
    #{cost := NeedCoin} = ConfSkill,
    NeedCoin > 0 orelse erlang:throw({error, invalid_cost}),
    NewCoinAcc = CoinAcc + NeedCoin,
    NewCoinAcc =< TotalCoin orelse erlang:throw({error, not_enough_money}),
    NewLv = SkillLv + 1,
    ConfSkillNext = conf_skill:get({SkillID, NewLv}),
    ConfSkillNext =/= undefined orelse erlang:throw({error, max_skill_lv}),
    NewSkill = Skill#skill{level = NewLv},
    {ok, NewSkill, NewCoinAcc}.

%% -----------------------------------------------------------------------------

%% @doc 增加技能
add_skills(PS, SkillList) ->
    #role_state{skill_list = CurList, id = RoleID} = PS,
    {NewSkills, AddSkills} = add_skills_helper(SkillList, CurList, []),
    PS1 = PS#role_state{skill_list = NewSkills},
    AddSkills =/= [] andalso begin
        lib_scene_api:update(skill_list, PS1),
        Rec = #sc_skill_new{skills = lib_skill_util:convert_skills(AddSkills)},
        {ok, Bin} = prot_msg:encode_msg(40809, Rec),
        lib_role_send:send_to_role(PS, Bin)
    end,
    ?EVENT(RoleID, 'add_skills'),
    lib_role_attr:refresh_combat_power(PS1).

add_skills_helper([], FinAcc, AddAcc) ->
    {FinAcc, AddAcc};
add_skills_helper([Skill | T], FinAcc, AddAcc) ->
    {NewFinAcc, NewAddAcc} = add_skill_helper(lib_skill_util:make_skill(Skill), FinAcc, AddAcc),
    add_skills_helper(T, NewFinAcc, NewAddAcc).

add_skill_helper(Skill, FinAcc, AddAcc) when is_record(Skill, skill) ->
    #skill{id = SkillID, level = NewLv} = Skill,
    case lists:keyfind(SkillID, #skill.id, FinAcc) of
        #skill{level = CurLv} when CurLv >= NewLv ->
            {FinAcc, AddAcc};
        _ ->
            {lists:keystore(SkillID, #skill.id, FinAcc, Skill), [Skill | AddAcc]}
    end;
add_skill_helper(_Skill, FinAcc, AddAcc) ->
    {FinAcc, AddAcc}.

%% @doc
del_skills(PS, _SkillList) ->
    PS.

%% -----------------------------------------------------------------------------

%% @doc 转换玩家技能到场景技能
scene_skills(SkillList) ->
    scene_skills(SkillList, []).

scene_skills([], Acc) ->
    lists:reverse(Acc);
scene_skills([Skill | T], Acc) ->
    BoostSkill = skill_conf(Skill),
    scene_skills(T, [BoostSkill | Acc]).

boost(ConfSkill, #{effect := List}) when List =/= [] ->
    lists:foldl(fun({ID, Val}, Acc) ->
        erlang:setelement(ID, Acc, Val)
    end, ConfSkill, List);
boost(ConfSkill, _) ->
    ConfSkill.

%% @doc 获取技能配置 [特殊效果]
skill_conf(#skill{id = ID, level = Lv, hero = Hero, legend = Legend}) ->
    SkillConf = conf_skill:get_base(ID, Lv),
    BoostConf = conf_hero_effect:get({ID, Lv, Hero, Legend}),
    boost(SkillConf, BoostConf).

get_skill_num(PS, Lv) ->
    #role_state{career = Career, skill_list = Skills} = PS,
    CList = conf_skill_career:get_all(Career),
    length([1 || #skill{id = ID, level = Level} <- Skills, Level >= Lv, lists:member(ID, CList)]).

%% -----------------------------------------------------------------------------

create_init(Career, Gender) ->
    {_Icon, _FashionL, SkillL} = conf_career_init:get_conf(Career, Gender),
    SkillList = [#skill{id = Id, level = Level} || {Id, Level} <- SkillL],
    SkillList.

parse_skill_list(SkillList) ->
    [do_parse_skill(Skill) || Skill <- SkillList].

do_parse_skill({skill, 1, SkillID, SkillLv}) ->
    #skill{id = SkillID, level = SkillLv};
do_parse_skill({skill, 2, SkillID, SkillLv, Hero}) ->
    #skill{id = SkillID, level = SkillLv, hero = Hero};
do_parse_skill(#skill{ver = ?SKILL_VER} = S) ->
    S.

%% @doc 模块辅助被动技能列表
%% @spec get_mod_pskills(RoleId) -> [#skill{}].
get_mod_pskills(RoleID) ->
    PetPSkills = lib_role_pet:pet_assist_skills(),              % 珍兽辅助被动技能
    EquipPSkills = lib_role_equip:get_skills(RoleID),           % 装备辅助被动技能
    ArtifactPSkills = lib_role_artifact:get_skills(RoleID),     % 神器辅助被动技能
    AnqiPSkills = lib_role_anqi:get_skills(RoleID),             % 暗器辅助被动技能
    DragonSkills = lib_role_dragon:get_skills(RoleID),          % 龙纹
    MarrySkills = lib_role_marriage:get_skills(RoleID),         % 结婚
    lists:concat([PetPSkills, EquipPSkills, ArtifactPSkills, AnqiPSkills, DragonSkills, MarrySkills]).

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 初始化
init(PS) ->
    #role_state{skill_list = SkillList} = PS,
    lib_role:mod_info(PS, ?MODULE, init_refresh),
    PS#role_state{skill_list = init_skills(SkillList, [])}.

init_skills([], Acc) ->
    Acc;
init_skills([Skill | T], Acc) ->
    case skill_conf(Skill) of
        #base_skill{} ->
            init_skills(T, [Skill | Acc]);
        _ ->
            init_skills(T, Acc)
    end.
