%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     技能
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_skill_util).
-author("Ryuu").

-include("skill.hrl").
-include("effect.hrl").

%% API
-export([
    skill_kv/1,
    is_passive/1,
    make_skill/1,
    skill_type/1,
    make_skills/1,
    convert_skills/1,
    get_guild_skill/0,
    career_skill_num/1,
    is_career_active/1,
    is_career_active/2,
    get_career_active/1,
    gen_passive_effects/1
]).


%% @doc 转换技能结构 [#skill{}]
make_skills(SkillList) ->
    make_skills(SkillList, []).

make_skills([], Acc) ->
    Acc;
make_skills([S | T], Acc) ->
    case make_skill(S) of
        #skill{} = Skill ->
            make_skills(T, [Skill | Acc]);
        _ ->
            make_skills(T, Acc)
    end.

make_skill(SkillID) when is_integer(SkillID) ->
    MinLv = conf_skill:get_min_lv(SkillID),
    #skill{id = SkillID, level = MinLv};
make_skill({SkillID, SkillLv}) ->
    #skill{id = SkillID, level = SkillLv};
make_skill({SkillID, SkillLv, Hero, Legend}) ->
    #skill{id = SkillID, level = SkillLv, hero = Hero, legend = Legend};
make_skill(#{id := SkillID, level := SkillLv, hero := Hero, legend := Legend}) ->
    #skill{id = SkillID, level = SkillLv, hero = Hero, legend = Legend};
make_skill(#{id := SkillID, level := SkillLv}) ->
    #skill{id = SkillID, level = SkillLv};
make_skill(Skill) when is_record(Skill, skill) ->
    Skill;
make_skill(_Skill) ->
    undefined.

%% @doc 转换前端技能
convert_skills(Skills) ->
    convert_skills(Skills, []).

convert_skills([], Acc) ->
    Acc;
convert_skills([{ID, Lv} | T], Acc) ->
    convert_skills(T, [{ID, Lv} | Acc]);
convert_skills([#{id := ID, level := Lv} | T], Acc) ->
    convert_skills(T, [{ID, Lv} | Acc]);
convert_skills([#skill{id = ID, level = Lv} | T], Acc) ->
    convert_skills(T, [{ID, Lv} | Acc]).

%% @doc 技能Kv
skill_kv(SkillList) ->
    skill_kv(SkillList, []).

skill_kv([], Acc) ->
    Acc;
skill_kv([Skill | T], Acc) ->
    #skill{id = SkillID, level = SkillLv} = Skill,
    skill_kv(T, [{SkillID, SkillLv} | Acc]).

%% @doc 帮派技能列表
get_guild_skill() ->
    conf_skill:get_by_cate(?SKILL_CATEGORY_GUILD).

%% @doc 判断是否玩家技能
is_career_active(SkillID) ->
    conf_skill_career:is_skill(SkillID).

is_career_active(SkillID, Career) ->
    conf_skill_career:is_skill(SkillID, Career).

%% @doc 获取某个职业所有的职业技能
get_career_active(Career) ->
    conf_skill_career:get_all(Career).

%% @doc 职业技能数量
career_skill_num(_Career) ->
    8.

% @doc 获取被动技能效果
% @spec gen_passive_effects(SkillList) -> EffectMap.
% SkillList     :: [ #skill{} ]
% EffectMap     :: #{ Mod => Effects }
% Effects       :: [#effect{}]
gen_passive_effects(SkillList) ->
    GetFun = fun(#skill{id = SkillId, level = SkillLv}, Acc) ->
        case conf_skill:get_base(SkillId, SkillLv) of
            #base_skill{type = ?SKILL_TYPE_PASSIVE, self_buff = EffectL} ->
                update_effect_dict(EffectL, Acc);
            _ ->
                Acc
        end
    end,
    EffectDict = lists:foldl(GetFun, dict:new(), SkillList),
    gen_effects_map(EffectDict).

skill_type(SkillID) ->
    case conf_skill:get({SkillID, 1}) of
        #{type := Type} -> Type;
        _ -> 0
    end.

is_passive(SkillID) ->
    skill_type(SkillID) =:= ?SKILL_TYPE_PASSIVE.

%% Privates ----------------------------------------------
update_effect_dict([{EffectId, EffectLv} | Rest], EffectDict) ->
    case dict:find(EffectId, EffectDict) of
        {EffectId, OriLv} when OriLv >= EffectLv ->
            update_effect_dict(Rest, EffectDict);
        _ ->
            EffectDictN = dict:store(EffectId, EffectLv, EffectDict),
            update_effect_dict(Rest, EffectDictN)
    end;

update_effect_dict([], EffectDict) ->
    EffectDict.

gen_effects_map(EffectDict) ->
    NowTimeMS = time:unixtime_ms(),
    GenFun = fun(EffectId, EffectLv, AccMap) ->
        case conf_effect:get(EffectId, EffectLv) of
            #conf_effect{} = ConfEffect ->
                Effect = lib_effect_util:gen_new_effect(NowTimeMS, {0, 0}, ConfEffect, #{}),
                ModEffectList = maps:get(Effect#effect.module, AccMap, []),
                ModEffectListN = [Effect | ModEffectList],
                maps:put(Effect#effect.module, ModEffectListN, AccMap);
            _ ->
                AccMap
        end
    end,
    dict:fold(GenFun, #{}, EffectDict).
