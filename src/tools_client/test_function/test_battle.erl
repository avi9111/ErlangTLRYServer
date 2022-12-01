%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 九月 2019 23:17
%%%-------------------------------------------------------------------
-module(test_battle).
-author("Administrator").
-include("svr_client.hrl").
-define(NO_CD_SKILL, [
    {1, [10010001, 10010002, 10010003, 10010011]},
    {2, [10020001, 10020002, 10020003, 10020011]}],
    {3, [10030001, 10030002, 10030003, 10030011]}],
    {4, [10040001, 10040002, 10040003, 10040011]}]
).
%% API
-compile(export_all).

test_attack(CliId) ->
    attack(CliId, ?DEFAULT_POS, ?DEFAULT_POS, ?DEFAULT_POS).

auto_attack(CliId) ->
    Ets = ?to_ets(CliId),
    Monsters = test_req:cs_monster(CliId),
    {MonId, MonX, MonY} = util:list_rand(Monsters),
    {_SceneId, _LineId, X, Y, _} = util:get_ets(Ets, 'scene'),
    case dist(X, Y, MonX, MonY) =< 50 of
        true ->
            test_battle:attack(CliId, MonId, MonX, MonY);
        _ ->
            test_req:auto_walk(CliId, ?ATTACK_TYPE, MonId, MonX, MonY)
    end.

attack(CliId, MId, MonX, MonY) ->
    Ets = ?to_ets(CliId),
    {MonId, X, Y} = case MId =:= ?DEFAULT_POS orelse MonX =:= ?DEFAULT_POS orelse MonY =:= ?DEFAULT_POS of
        true ->
            Monsters = test_req:cs_monster(CliId),
            util:list_rand(Monsters);
        _ ->
            {MId, MonX, MonY}
    end,
    RoleId = util:get_ets(Ets, 'role_id'),
    Type = ?BATTLE_MON,
    SkillId = random_skill(Ets),
    Bin = <<
        RoleId:64,
        Type:8,
        MonId:64,
        SkillId:32,
        X:16,
        Y:16
    >>,
    recv_loop:do_send_req(util:get_ets(Ets, 'socket'), 90300, Bin).

random_skill(Ets) ->
    Skills = util:get_ets(Ets, 'skill'),
    Now = time:unixtime_ms(),
    #{career := Career, anger := Anger} = util:get_ets(Ets, 'battle'),
    case util:get_ets(Ets, 'skill_cd') of
        'undefined' ->
            #skill{id = SkillId, level = Lv} = util:list_rand(Skills),
            Cds = [];
        Cds1 ->
            Cds = [{Id, Time} || {Id, Time} <- Cds1, Time > Now],
            Rest1 = [Skill || Skill <- Skills, begin Id = Skill#skill.id, not lists:keymember(Id, 1, Cds) end],
            case Rest1 of
                [] ->
                    SkillId = random_no_cd_skill(Career),
                    #skill{level = Lv} = lists:keyfind(SkillId, 1, Skills);
                _ ->
                    #skill{id = SkillId, level = Lv} = util:list_rand(Rest1)
            end
    end,
    #base_skill{anger = CostAnger, cd = Cd} = conf_skill:get_base(SkillId, Lv),
    case CostAnger =:= 0 orelse (CostAnger > 0 andalso Anger >= CostAnger) of
        true ->
            SkId = SkillId, CD = Cd;
        _ ->
            #skill{id = SkId, level = Lv1} = util:list_rand(lists:keydelete(SkillId, #skill.id, Skills)),
            #base_skill{cd = CD} = conf_skill:get_base(SkId, Lv1)
    end,
    EndTime = Now + CD,
    CdNs = update_skill_cd(Career, Cds, SkId, EndTime),
    recv_loop:update_ets(Ets, {'skill_cd', CdNs}),
    SkId.

update_skill_cd(Career, List, SkillId, EndTime) ->
    NoCd = no_cd_skill(Career),
    ?iif(lists:member(SkillId, NoCd), List, [{SkillId, EndTime} | List]).

random_no_cd_skill(Career) ->
    util:list_rand(no_cd_skill(Career)).

no_cd_skill(1) ->
    [10010001, 10010002, 10010003, 10010011];
no_cd_skill(2) ->
    [10020001, 10020002, 10020003, 10020011];
no_cd_skill(3) ->
    [10030001, 10030002, 10030003, 10030011];
no_cd_skill(4) ->
    [10040001, 10040002, 10040003, 10040011].


dist(X, Y, ToX, ToY) ->
    lib_battle_aid:square(ToX - X) + lib_battle_aid:square(ToY - Y).
