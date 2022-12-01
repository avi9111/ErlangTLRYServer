%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     英雄谱
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_hero).
-author("Ryuu").

-include("hero.hrl").
-include("role.hrl").
-include("goods.hrl").
-include("skill.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_418.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    get_attr/1,
    get_fight/1,
    is_active/2,
    load_hero/1,
    send_info/1,
    active_num/1,
    handle_info/2,
    get_role_data/1,
    gm_active_all/1
]).

-export([
    get_hero/2,
    active_by_item/2,
    check_get_hero/2
]).

handle_info(_Info, _PS) ->
    ignore.

do(41801, PS, _Req) ->
    send_info(PS);
do(41805, PS, #cs_hero_cultivate{id = ID, item = ItemID, num = Num}) ->
    cultivate(PS, ID, ItemID, Num);
do(41807, PS, _Req) ->
    one_key_cult(PS);
do(41811, PS, #cs_hero_legend{id = ID}) ->
    active_legend(PS, ID);
do(41813, PS, #cs_hero_guide{id = ID, skill = SkillID, legend = Legend}) ->
    set_guide(PS, ID, SkillID, Legend);
do(41815, PS, #cs_hero_modify_guide{guide = Guide}) ->
    modify_guide(PS, Guide);
do(41817, PS, #cs_hero_use_guide{id = ID}) ->
    use_guide(PS, ID);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取信息
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{heroes := Heroes, guides := Guides} = RoleData,
    Rec = #sc_hero_info{
        heroes = convert_heroes(util:dict_values(Heroes)),
        guides = convert_guides(Guides, [])
    },
    {ok, Bin} = prot_msg:encode_msg(41802, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_heroes(Heroes) ->
    convert_heroes(Heroes, []).

convert_heroes([], Acc) ->
    Acc;
convert_heroes([Hero | T], Acc) ->
    #{id := ID, level := Level, exp := Exp, legend := Legend} = Hero,
    CltHero = #clt_hero{id = ID, level = Level, exp = Exp, legend = Legend},
    convert_heroes(T, [CltHero | Acc]).

convert_guides([], Acc) ->
    Acc;
convert_guides([Guide | T], Acc) ->
    #{id := ID, name := Name, desc := Desc, plan := Plan} = Guide,
    CltGuide = #clt_hero_guide{
        id = ID, name = Name, desc = Desc, plan = Plan
    },
    convert_guides(T, [CltGuide | Acc]).

%% @doc 道具激活
active_by_item(PS, ID) ->
    case catch check_active_by_item(PS, ID) of
        {ok, RoleID, RoleData} ->
            update_role_data(RoleID, RoleData),
            Rec = #sc_hero_active{id = ID},
            {ok, Bin} = prot_msg:encode_msg(41804, Rec),
            lib_role_send:send_to_role(PS, Bin),
            ?TASK_EVENT(RoleID, {active_hero, ID}),
            refresh_attr(PS);
        {ok, Rewards} ->
            PS1 = lib_role_assets:add_items_notify(PS, Rewards, ?OPT_HERO_ACTIVE),
            PS1;
        {error, Code} ->
            {error, Code}
    end.

check_active_by_item(PS, ID) ->
    Conf = conf_hero:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_HERO_NOT_EXISTS}),
    #{color := Color} = Conf,
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{heroes := Heroes} = RoleData,
    case util:dict_find(ID, Heroes) of
        undefined ->
            Hero = ?hero#{id => ID, level => 1},
            NewData = set_hero(ID, Hero, RoleData),
            {ok, RoleID, NewData};
        _ ->
            Rewards = reactive_reward(Color),
            {ok, Rewards}
    end.

reactive_reward(Color) ->
    case conf_hero_color:get(Color) of
        #{item_id := ItemID, item_num := ItemNum} ->
            [{?AST_ITEM, [{ItemID, ItemNum}]}];
        _ ->
            []
    end.

%% @doc 培养
cultivate(PS, ID, ItemID, Num) ->
    case catch check_cultivate(PS, ID, ItemID, Num) of
        {ok, RoleID, RoleData, Costs, Level, Exp, TExp} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_HERO_CULT),
            update_role_data(RoleID, RoleData),
            Rec = #sc_hero_cultivate{id = ID, level = Level, exp = Exp},
            {ok, Bin} = prot_msg:encode_msg(41806, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_role_channel:recalc_attr(PS1),
            ?TASK_EVENT(RoleID, {cult_hero, TExp}),
            refresh_attr(PS1);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_cultivate(PS, ID, ItemID, Num) ->
    #role_state{id = RoleID} = PS,
    {ok, RoleData, Hero} = check_get_hero(RoleID, ID),
    #{level := CLv, exp := CExp} = Hero,
    case conf_hero_item:cult_exp(ItemID) of
        ItemExp when ItemExp > 0 ->
            Exp = ItemExp;
        _ ->
            Exp = conf_hero:cult_exp(ItemID)
    end,
    Exp > 0 orelse erlang:throw({error, ?RC_HERO_NOT_CULT_ITEM}),
    Costs0 = [{?AST_ITEM, [{ItemID, Num}]}],
    lib_role_assets:check_items_enough(PS, Costs0),
    {NewLv, NewExp, CNum, TExp} = add_exp(ID, CLv, CExp, Exp, Num),
    Costs1 = [{?AST_ITEM, [{ItemID, CNum}]}],
    NewHero = Hero#{level => NewLv, exp => NewExp},
    NewData = set_hero(ID, NewHero, RoleData),
    {ok, RoleID, NewData, Costs1, NewLv, NewExp, TExp}.

%% @doc 碎片一键培养
one_key_cult(PS) ->
    case catch check_one_key_cult(PS) of
        {ok, RoleID, RoleData, Costs, CList, TExp} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_HERO_CULT),
            update_role_data(RoleID, RoleData),
            Rec = #sc_hero_one_key_cult{heroes = convert_heroes(CList)},
            {ok, Bin} = prot_msg:encode_msg(41808, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_role_channel:recalc_attr(PS1),
            ?TASK_EVENT(RoleID, {cult_hero, TExp}),
            refresh_attr(PS1);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_one_key_cult(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{heroes := Heroes} = RoleData,
    Statics = lib_role_goods:bag_statics(RoleID, ?BAG_ID_ITEM),
    {Items, NewHeroes, CList, TExp} = cult_hero(util:dict_values(Heroes), Statics, [], Heroes, [], 0),
    Costs = [{?AST_ITEM, Items}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewData = set_heroes_attr(RoleData#{heroes => NewHeroes}),
    {ok, RoleID, NewData, Costs, CList, TExp}.

cult_hero([], _Statics, Costs, HeroAcc, ChangeAcc, EAcc) ->
    {Costs, HeroAcc, ChangeAcc, EAcc};
cult_hero([Hero | T], Statics, Costs, HeroAcc, ChangeAcc, EAcc) ->
    #{id := ID, level := Level, exp := Exp} = Hero,
    Conf = conf_hero:get(ID),
    #{fragment := ItemID, cult_exp := CultExp} = Conf,
    MaxLv = conf_hero_level:max_lv(ID),
    case Level < MaxLv andalso util:dict_find(ItemID, Statics) of
        #{num := Num} ->
            {NewLv, NewExp, CNum, TExp} = add_exp(ID, Level, Exp, CultExp, Num),
            NewHero = set_hero_attr(Hero#{level => NewLv, exp => NewExp}),
            NewCosts = [{ItemID, CNum}] ++ Costs,
            NewHeroes = dict:store(ID, NewHero, HeroAcc),
            NewChangeAcc = [NewHero | ChangeAcc],
            cult_hero(T, Statics, NewCosts, NewHeroes, NewChangeAcc, EAcc + TExp);
        _ ->
            cult_hero(T, Statics, Costs, HeroAcc, ChangeAcc, EAcc)
    end.

add_exp(ID, Lv, CExp, PExp, Num) ->
    MaxLv = conf_hero_level:max_lv(ID),
    {NLv, NExp, LNum, TExp} = add_exp2(ID, Lv, MaxLv, CExp, PExp, Num, 0),
    {NLv, NExp, Num - LNum, TExp}.

add_exp2(ID, Lv, MaxLv, CExp, PExp, Num, EAcc) ->
    case conf_hero_level:get({ID, Lv}) of
        #{exp := NeedExp} when NeedExp > 0, Lv < MaxLv ->
            if
                CExp >= NeedExp ->
                    add_exp2(ID, Lv + 1, MaxLv, CExp - NeedExp, PExp, Num, EAcc);
                Num > 0 ->
                    CNum = erlang:min(erlang:ceil((NeedExp - CExp) / PExp), Num),
                    add_exp2(ID, Lv, MaxLv, CExp + CNum * PExp, PExp, Num - CNum, EAcc + CNum * PExp);
                true ->
                    {Lv, CExp, Num, EAcc}
            end;
        _ ->
            {Lv, CExp, Num, EAcc}
    end.

%% @doc 激活真武指点
active_legend(PS, ID) ->
    case catch check_active_legend(PS, ID) of
        {ok, PS1, RoleID, RoleData, Costs} ->
            PS2 = lib_role_assets:cost_items_notify(PS1, Costs, ?OPT_HERO_LEGEND),
            update_role_data(RoleID, RoleData),
            Rec = #sc_hero_legend{id = ID},
            {ok, Bin} = prot_msg:encode_msg(41812, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_active_legend(PS, ID) ->
    #role_state{id = RoleID, level = RoleLv, skill_list = SkillList} = PS,
    {ok, RoleData, Hero} = check_get_hero(RoleID, ID),
    Conf = conf_hero:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_HERO_NOT_EXISTS}),
    #{legend := Enable} = Conf,
    Enable =:= 1 orelse erlang:throw({error, ?RC_HERO_LEGEND_NOT_ENABLE}),
    #{legend := State, level := HeroLv} = Hero,
    State =:= 0 orelse erlang:throw({error, ?RC_HERO_LEGEND_ALREADY_ACTIVE}),
    {NRoleLv, NHeroLv} = config:get_sys_config(hero_active_legend_lv),
    RoleLv >= NRoleLv orelse erlang:throw({error, ?RC_HERO_LEGEND_ROLE_LV_LIMIT}),
    HeroLv >= NHeroLv orelse erlang:throw({error, ?RC_HERO_LEGEND_HERO_LV_LIMIT}),
    {ItemID, Num} = config:get_sys_config(hero_active_legend),
    Costs = [{?AST_ITEM, [{ItemID, Num}]}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewHero = Hero#{legend => ?HERO_LEGEND_ACTIVE},
    NewData = set_hero(ID, NewHero, RoleData),
    case lists:keyfind(ID, #skill.hero, SkillList) of
        #skill{id = SkillID} = Skill ->
            NewSkill = Skill#skill{legend = ?HERO_LEGEND_ACTIVE},
            NewList = lists:keystore(SkillID, #skill.id, SkillList, NewSkill);
        _ ->
            NewList = SkillList
    end,
    PS1 = PS#role_state{skill_list = NewList},
    {ok, PS1, RoleID, NewData, Costs}.

%% @doc 指定技能
set_guide(PS, ID, SkillID, UseLegend) ->
    case catch check_set_guide(PS, ID, SkillID, UseLegend) of
        {ok, PS1} ->
%%            update_role_data(RoleID, RoleData),
            Rec = #sc_hero_guide{id = ID, skill = SkillID, legend = UseLegend},
            {ok, Bin} = prot_msg:encode_msg(41814, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_set_guide(PS, HeroID, SkillID, UseLegend) ->
    #role_state{id = RoleID, level = RoleLv, career = Career, skill_list = SkillList} = PS,
    Skill = lists:keyfind(SkillID, #skill.id, SkillList),
    Skill =/= false orelse erlang:throw({error, ?RC_SKILL_NOT_FOUND}),
    lists:member(UseLegend, [0, 1]) orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    case HeroID > 0 of
        true ->
            {ok, _RoleData, Hero} = check_get_hero(RoleID, HeroID),
            #{level := HeroLv, legend := Legend} = Hero,
            {NRoleLv, NHeroLv} = config:get_sys_config(hero_active_lv),
            RoleLv >= NRoleLv orelse erlang:throw({error, ?RC_HERO_GUIDE_ROLE_LV_LIMIT}),
            HeroLv >= NHeroLv orelse erlang:throw({error, ?RC_HERO_GUIDE_HERO_LV_LIMIT}),
            check_can_guide(HeroID, SkillID, Career),
            UseLegend =:= 0 orelse Legend =:= UseLegend orelse erlang:throw({error, ?RC_HERO_LEGEND_NOT_ENABLE}),
            NewSkill = Skill#skill{hero = HeroID, legend = UseLegend};
        _ ->
            NewSkill = Skill#skill{hero = 0, legend = 0}
    end,
    NewList = lists:keystore(SkillID, #skill.id, SkillList, NewSkill),
    PS1 = PS#role_state{skill_list = NewList},
    {ok, PS1}.

%% @doc 修改方案
modify_guide(PS, Guide) ->
    case catch check_modify_guide(PS, Guide) of
        {ok, RoleID, RoleData, NewGuide} ->
            update_role_data(RoleID, RoleData),
            Rec = #sc_hero_modify_guide{guide = NewGuide},
            {ok, Bin} = prot_msg:encode_msg(41816, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_modify_guide(PS, CltGuide) ->
    #role_state{id = RoleID, career = Career} = PS,
    #clt_hero_guide{id = ID, name = Name0, desc = Desc0, plan = Plan} = CltGuide,
    Conf = conf_hero_guide:get({Career, ID}),
    Conf =/= undefined orelse erlang:throw({error, ?RC_HERO_NO_SUCH_GUIDE}),
    Name = util:escape_varchar(Name0),
    Desc = util:escape_varchar(Desc0),
    util:check_name(Name),%% andalso erlang:throw({error, ?RC_HERO_NAME_CONTAIN_FILTER}),
    util:check_filter(Desc) andalso erlang:throw({error, ?RC_HERO_DESC_CONTAIN_FILTER}),
    check_skill(Plan, Career, sets:new()),
    Guide = ?hero_guide#{id => ID, name => Name, desc => Desc, plan => Plan},
    RoleData = get_role_data(RoleID),
    #{guides := Guides} = RoleData,
    NewGuides = map:keystore(ID, id, Guides, Guide),
    NewData = RoleData#{guides => NewGuides},
    NewCltGuide = CltGuide#clt_hero_guide{name = Name, desc = Desc},
    {ok, RoleID, NewData, NewCltGuide}.

check_skill([], Career, Acc) ->
    Size = sets:size(Acc),
    MaxNum = lib_skill_util:career_skill_num(Career),
    Size =< MaxNum orelse erlang:throw({error, ?RC_HERO_SKILL_NUM_EXCEED}),
    ok;
check_skill([{HeroID, SkillID} | T], Career, Acc) ->
    IsCareerActive = lib_skill_util:is_career_active(SkillID, Career),
    IsCareerActive orelse erlang:throw({error, ?RC_SKILL_NOT_CAREER_SKILL}),
    HeroID > 0 andalso check_can_guide(HeroID, SkillID, Career),
    sets:is_element(HeroID, Acc) andalso erlang:throw({error, ?RC_HERO_GUIDE_DUP_HERO}),
    check_skill(T, Career, sets:add_element(HeroID, Acc)).

check_can_guide(HeroID, SkillID, Career) ->
    Conf = conf_hero:get(HeroID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_HERO_NOT_EXISTS}),
    #{skills := CSkills} = Conf,
    IsCareerActive = lib_skill_util:is_career_active(SkillID, Career),
    IsCareerActive orelse erlang:throw({error, ?RC_SKILL_NOT_CAREER_SKILL}),
    CanGuide = lists:member(SkillID, CSkills),
    CanGuide orelse erlang:throw({error, ?RC_HERO_NOT_TARGET_SKILL}),
    ok.

%% @doc 使用方案
use_guide(PS, ID) ->
    case catch check_use_guide(PS, ID) of
        {ok, PS1, SkillList} ->
            Skills = [Skill || #skill{hero = Hid} = Skill <- SkillList, Hid > 0],
            Rec = #sc_hero_use_guide{
                id = ID, skills = data_transfer:sc_skill_list(Skills)
            },
            {ok, Bin} = prot_msg:encode_msg(41818, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_use_guide(PS, ID) ->
    #role_state{id = RoleID, level = RoleLv, career = Career, skill_list = SkillList} = PS,
    RoleData = get_role_data(RoleID),
    #{guides := Guides, heroes := Heroes0} = RoleData,
    Guide = map:keyfind(ID, id, Guides, conf_hero_guide:get({Career, ID})),
    is_map(Guide) orelse erlang:throw({error, ?RC_HERO_NO_SUCH_GUIDE}),
    %% 替换能指导的，然后尝试自动替换不符合的
    #{plan := Plan} = Guide,
    IDList = lib_skill_util:get_career_active(Career),
    {NRoleLv, NHeroLv} = config:get_sys_config(hero_active_lv),
    RoleLv >= NRoleLv orelse erlang:throw({error, ?RC_HERO_GUIDE_ROLE_LV_LIMIT}),
    F = fun(_, #{level := HeroLv}) -> HeroLv >= NHeroLv end,
    Heroes = dict:filter(F, Heroes0),
    {NewList1, FailList, UsedSet} = apply_plan(IDList, SkillList, Plan, Heroes, [], sets:new()),
    NewList2 = fix_plan(FailList, NewList1, Heroes, UsedSet),
    PS1 = PS#role_state{skill_list = NewList2},
    {ok, PS1, NewList2}.

apply_plan([], SkillList, _Plan, _Heroes, FailAcc, UseAcc) ->
    {SkillList, FailAcc, UseAcc};
apply_plan([SkillID | T], SkillList, Plan, Heroes, FailAcc, UseAcc) ->
    {HeroID, _} = util:list_find(SkillID, 2, Plan, {0, 0}),
    case lists:keyfind(SkillID, #skill.id, SkillList) of
        #skill{} = Skill ->
            Hero = util:dict_find(HeroID, Heroes),
            case Hero of
                #{legend := Legend0} -> NewID = HeroID, Legend = Legend0;
                _ -> NewID = 0, Legend = 0
            end,
            NewSkill = Skill#skill{hero = NewID, legend = Legend},
            NewList = lists:keystore(SkillID, #skill.id, SkillList, NewSkill),
            NewUseAcc = ?iif(NewID > 0, sets:add_element(NewID, UseAcc), UseAcc),
            NewFailAcc = ?iif(NewID =/= HeroID, [NewSkill | FailAcc], FailAcc),
            apply_plan(T, NewList, Plan, Heroes, NewFailAcc, NewUseAcc);
        _ ->
            apply_plan(T, SkillList, Plan, Heroes, FailAcc, UseAcc)
    end.

fix_plan([], SkillList, _Heroes, _UsedAcc) ->
    SkillList;
fix_plan([Skill | T], SkillList, Heroes, UsedAcc) ->
    #skill{id = SkillID} = Skill,
    HeroList = conf_hero:skill_hero(SkillID),
    case filter_hero(HeroList, Heroes, UsedAcc) of
        #{id := HeroID, legend := Legend} ->
            NewSkill = Skill#skill{hero = HeroID, legend = Legend},
            NewList = lists:keystore(SkillID, #skill.id, SkillList, NewSkill),
            NewUsedAcc = sets:add_element(HeroID, UsedAcc),
            fix_plan(T, NewList, Heroes, NewUsedAcc);
        _ ->
            fix_plan(T, SkillList, Heroes, UsedAcc)
    end.

filter_hero([], _Heroes, _UsedAcc) ->
    undefined;
filter_hero([ID | T], Heroes, UsedAcc) ->
    case not sets:is_element(ID, UsedAcc) andalso
        util:dict_find(ID, Heroes) of
        #{} = Hero ->
            Hero;
        _ ->
            filter_hero(T, Heroes, UsedAcc)
    end.

%% -----------------------------------------------------------------------------

get_hero(RoleID, HeroID) ->
    RoleData = get_role_data(RoleID),
    #{heroes := Heroes} = RoleData,
    util:dict_find(HeroID, Heroes).

check_get_hero(RoleID, ID) ->
    RoleData = get_role_data(RoleID),
    #{heroes := Heroes} = RoleData,
    Hero = util:dict_find(ID, Heroes),
    Hero =/= undefined orelse erlang:throw({error, ?RC_HERO_NOT_ACTIVE}),
    {ok, RoleData, Hero}.

set_hero(ID, Hero, RoleData) ->
    #{heroes := Heroes} = RoleData,
    NewHero = set_hero_attr(Hero),
    NewHeroes = dict:store(ID, NewHero, Heroes),
    set_heroes_attr(RoleData#{heroes => NewHeroes}).

active_num(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{heroes := Heroes} = RoleData,
    dict:size(Heroes).

is_active(RoleID, HeroID) ->
    get_hero(RoleID, HeroID) =/= undefined.

%% -----------------------------------------------------------------------------
%% 属性
%% -----------------------------------------------------------------------------

%% @doc 获取属性
get_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

%% @doc 刷新属性
refresh_attr(PS) ->
    lib_scene_api:update('skill_list', PS),
    lib_role_attr:refresh_combat_power(PS).

set_heroes_attr(RoleData) ->
    #{heroes := Heroes} = RoleData,
    HeroAttrs = sum_heroes_attr(util:dict_values(Heroes), []),
    Fight = lib_role_attr:calc_combat_power(HeroAttrs),
    RoleData#{attr => HeroAttrs, fight => Fight}.

sum_heroes_attr([], Acc) ->
    Acc;
sum_heroes_attr([Hero | T], Acc) ->
    #{attr := Attr} = Hero,
    sum_heroes_attr(T, Attr ++ Acc).

set_hero_attr(Hero) ->
    Hero#{attr => calc_hero_attr(Hero)}.

calc_hero_attr(Hero) ->
    #{id := ID, level := Level} = Hero,
    ConfAttr = conf_hero_level:get({ID, Level}),
    #{attr := LvAttr} = ConfAttr,
    lib_role_attr:merge_attr([LvAttr]).

%% -----------------------------------------------------------------------------
%% GM
%% -----------------------------------------------------------------------------

gm_active_all(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{heroes := Heroes} = RoleData,
    IDList = conf_hero:get_ids(),
    NewHeroes = active_all(IDList, Heroes),
    NewData = set_heroes_attr(RoleData#{heroes => NewHeroes}),
    update_role_data(RoleID, NewData),
    send_info(PS),
    refresh_attr(PS).

active_all([], Heroes) ->
    Heroes;
active_all([ID | T], Heroes) ->
    case util:dict_find(ID, Heroes) of
        #{} ->
            active_all(T, Heroes);
        _ ->
            Hero = set_hero_attr(?hero#{id => ID, level => 1}),
            active_all(T, dict:store(ID, Hero, Heroes))
    end.


%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc
init(PS) ->
    #role_state{id = RoleID} = PS,
    Heroes = load_hero(RoleID),
    Guides = load_guide(RoleID),
    RoleData = set_heroes_attr(?role_hero#{
        role_id => RoleID, heroes => Heroes, guides => Guides
    }),
    set_role_data(RoleID, RoleData),
    ok.

load_hero(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_HERO, [RoleID]),
    List = db:get_all(SQL),
    init_hero(List, dict:new()).

init_hero([], Acc) ->
    Acc;
init_hero([[ID, Level, Exp, Skill, Legend] | T], Acc) ->
    Hero = set_hero_attr(?hero#{
        id => ID, level => Level, exp => Exp, skill => Skill, legend => Legend
    }),
    init_hero(T, dict:store(ID, Hero, Acc)).

load_guide(RoleID) ->
    SQL = io_lib:format(?SQL_GET_HERO_GUIDE, [RoleID]),
    List = db:get_all(SQL),
    init_guide(List, []).

init_guide([], Acc) ->
    Acc;
init_guide([[ID, Name, Desc, DbPlan] | T], Acc) ->
    Plan = type:convert_db_field(list, DbPlan, []),
    Guide = ?hero_guide#{id => ID, name => Name, desc => Desc, plan => Plan},
    init_guide(T, [Guide | Acc]).

%% @doc
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
    #{heroes := Heroes, guides := Guides} = RoleData,
    Fun1 = fun(#{id := ID, level := Level, exp := Exp, skill := Skill, legend := Legend}) ->
        [RoleID, ID, Level, Exp, Skill, Legend]
    end,
    db:insert_values(?SQL_SET_ROLE_HERO2, ?SQL_SET_ROLE_HERO3, Fun1, util:dict_values(Heroes)),
    Fun2 = fun(#{id := ID, name := Name, desc := Desc, plan := Plan}) ->
        DbPlan = type:term_to_bitstring(Plan),
        [RoleID, ID, Name, Desc, DbPlan]
    end,
    db:insert_values(?SQL_SET_HERO_GUIDE2, ?SQL_SET_HERO_GUIDE3, Fun2, Guides),
    set_role_data(RoleID, RoleData#{updated => false}).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_hero#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData),
    RoleData.
