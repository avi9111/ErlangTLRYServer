%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     装备采集 [非场景采集]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_gather).
-author("Ryuu").

-include("role.hrl").
-include("goods.hrl").
-include("gather.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("guild.hrl").
-include("proto/prot_208.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    handle_info/2,
    get_role_data/1
]).

handle_info(reward_time, PS) ->
    reward_time(PS);
handle_info(coll_gather, PS) ->
    coll_gather(PS, 0, 0);
handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(PS, {'coll_collect', #{id := CollID, quick := Quick}}) ->
    is_gather(CollID) andalso coll_gather(PS, CollID, Quick);
event(PS, 'guild_changed') ->
    guild_change(PS);
event(_PS, _Event) ->
    ignore.

do(20801, PS, _Req) ->
    send_info(PS);
do(20803, PS, #cs_gather_upgrade{id = ID, num = Num}) ->
    level_up(PS, ID, Num);
do(20805, PS, #cs_gather_coll{id = UID, coll = CollID, quick = Quick}) ->
    gather(PS, UID, CollID, Quick);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{vitality := Vitality, skills := Skills} = RoleData,
    Rec = #sc_gather_info{
        vitality = Vitality, skills = convert_skills(Skills, [])
    },
    {ok, Bin} = prot_msg:encode_msg(20802, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_skills([], Acc) ->
    Acc;
convert_skills([Skill | T], Acc) ->
    #{id := ID, level := Level, exp := Exp} = Skill,
    convert_skills(T, [{ID, Level, Exp} | Acc]).

%% @doc 采集
gather(PS, UID, CollID, Quick) ->
    case catch check_gather(PS, CollID) of
        {ok, _, _} ->
            #role_state{id = RoleID, role_scene = #role_scene{line_pid = LinePid}} = PS,
            svr_scene_agent:push_cmd(LinePid, {'collect', {RoleID, UID, #{quick => Quick =:= 1}}});
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_gather(PS, CollID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    CollSkill = conf_gather_skill:get_coll_skill(CollID),
    ConfSkill = conf_gather_skill:get(CollSkill),
    ConfSkill =/= undefined orelse erlang:throw({error, ?RC_GATHER_NOT_COLL}),
    {SkillID, NeedLv} = CollSkill,
    #{skills := Skills} = RoleData,
    Skill = map:keyfind(SkillID, id, Skills),
    Skill =/= undefined orelse erlang:throw({error, ?RC_GATHER_NO_SKILL}),
    #{level := SkillLv} = Skill,
    SkillLv >= NeedLv orelse erlang:throw({error, ?RC_GATHER_SKILL_LV_LIMIT}),
    #{vitality := Vitality} = RoleData,
    Vitality > 0 orelse erlang:throw({error, ?RC_GATHER_NO_VITALITY}),
    {ok, RoleData, ConfSkill}.

coll_gather(PS, CollID, Quick) ->
    case catch check_coll_gather(PS, CollID, Quick) of
        {ok, RoleID, RoleData, Reward, Vitality} ->
            case Reward of
                0 -> ?ERROR_TOC(PS, ?RC_GATHER_NO_REWARD);
                _ -> lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_GATHER_COLL)
            end,
            update_role_data(RoleID, start_timer(RoleData, PS#role_state.guild_id)),
            Rec = #sc_gather_coll{vitality = Vitality},
            {ok, Bin} = prot_msg:encode_msg(20806, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_coll_gather(PS, CollID, Quick) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    {ok, RoleData, ConfSkill} = check_gather(PS, CollID),
    #{vitality := Vitality} = RoleData,
    #{ratio := Ratio, reward := DropID, reward_quick := QDropID} = ConfSkill,
    case util:is_bingo(Ratio) of
        true -> Reward = ?iif(Quick, QDropID, DropID);
        _ -> Reward = 0
    end,
    NewVitality = Vitality - 1,
    NewData = RoleData#{vitality => NewVitality},
    {ok, RoleID, NewData, Reward, NewVitality}.

%% @doc 升级采集技能
level_up(PS, ID, Num) ->
    case catch check_level_up(PS, ID, Num) of
        {ok, RoleID, RoleData, Costs, NewLv, NewExp} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_GATHER_UPGRADE),
            update_role_data(RoleID, RoleData),
            Rec = #sc_gather_upgrade{id = ID, level = NewLv, exp = NewExp},
            {ok, Bin} = prot_msg:encode_msg(20804, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_level_up(PS, SkillID, Num) ->
    Num > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{skills := Skills} = RoleData,
    Skill = map:keyfind(SkillID, id, Skills),
    Skill =/= undefined orelse erlang:throw({error, ?RC_GATHER_NO_SKILL}),
    #{level := SkillLv, exp := Exp} = Skill,
    NextLv = SkillLv + 1,
    Conf = conf_gather_skill:get({SkillID, SkillLv}),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GATHER_NO_LV_CONF}),
    ConfNext = conf_gather_skill:get({SkillID, NextLv}),
    ConfNext =/= undefined orelse erlang:throw({error, ?RC_GATHER_MAX_LV}),
    #{item := ItemID, proficiency := Prof, progress := AddPgs} = Conf,
    MaxNum = erlang:ceil((Prof - Exp) / AddPgs),
    CostNum = erlang:min(Num, MaxNum),
    Costs = [{?AST_ITEM, [{ItemID, CostNum}]}],
    lib_role_assets:check_items_enough(PS, Costs),
    TempExp = Exp + AddPgs * CostNum,
    {NewLv, NewExp} = ?iif(TempExp >= Prof, {NextLv, 0}, {SkillLv, TempExp}),
    NewSKill = Skill#{level => NewLv, exp => NewExp},
    NewSkills = map:keystore(SkillID, id, Skills, NewSKill),
    NewData = RoleData#{skills => NewSkills},
    {ok, RoleID, NewData, Costs, NewLv, NewExp}.

is_gather(CollID) ->
    conf_gather_skill:get_coll_skill(CollID) =/= undefined.

%% -----------------------------------------------------------------------------
%% TODO 重构
%% -----------------------------------------------------------------------------

%% @doc 次数奖励
reward_time(PS) ->
    Now = time:unixtime(),
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    RoleData = get_role_data(RoleID),
    #{vitality := LeftTimes, reward_time := LastReward} = RoleData,
    CD = config:get_sys_config(gather_reward_vitality_cd),
    MaxTimes = get_max_times(GuildID),
    AddTimes = erlang:max(1, erlang:min(erlang:floor((Now - LastReward) / CD), MaxTimes - LeftTimes)),
    NewLeftTimes = LeftTimes + AddTimes,
    NewRewardTime = ?iif(NewLeftTimes >= MaxTimes, 0, LastReward + AddTimes * CD),
    NewData = RoleData#{vitality => NewLeftTimes, reward_time => NewRewardTime, timer_r => 0},
    update_role_data(RoleID, start_timer(NewData, PS#role_state.guild_id)),
    send_info(PS).

start_timer(RoleData, GuildID) ->
    Now = time:unixtime(),
    #{vitality := LeftTimes, reward_time := LastReward, timer_r := TRef} = RoleData,
    CD = config:get_sys_config(gather_reward_vitality_cd),
    MaxTimes = get_max_times(GuildID),
    if
        LastReward > 0 andalso TRef =:= 0 ->
            Span = erlang:max(LastReward + CD - Now, 0),
            NewRef = lib_role:mod_after(Span * 1000, ?MODULE, reward_time),
            RewardTime = LastReward;
        TRef =/= 0 ->
            NewRef = TRef,
            RewardTime = LastReward;
        LeftTimes < MaxTimes ->
            NewRef = lib_role:mod_after(CD * 1000, ?MODULE, reward_time),
            RewardTime = Now;
        true ->
            NewRef = 0,
            RewardTime = 0
    end,
    RoleData#{timer_r => NewRef, reward_time => RewardTime}.

get_max_times(GuildID) ->
    MaxTimes = config:get_sys_config(gather_max_store_vitality),
    lib_guild:guild_study_effect(GuildID, ?GUILD_STUDY_8, MaxTimes).

guild_change(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    RoleData = get_role_data(RoleID),
    #{vitality := LeftTimes} = RoleData,
    MaxTimes = get_max_times(GuildID),
    NewLeftTimes = ?iif(LeftTimes > MaxTimes, MaxTimes, LeftTimes),
    NewRoleData = RoleData#{vitality => NewLeftTimes},
    update_role_data(RoleID, NewRoleData),
    send_info(PS).
%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_GATHER, [RoleID]),
    case db:get_row(SQL) of
        [Vitality, DbSkills, RewardTime, Time] ->
            Skills = init_skills(type:convert_db_field(list, DbSkills, [])),
            RoleData = start_timer(?role_gather#{
                role_id => RoleID, vitality => Vitality, skills => Skills,
                reward_time => RewardTime, time => Time
            }, PS#role_state.guild_id);
        _ ->
            Skills = init_skills([]),
            Vitality = config:get_sys_config(gather_max_store_vitality),
            RoleData = ?role_gather#{
                role_id => RoleID, time => time:unixtime(), vitality => Vitality,
                updated => true, skills => Skills
            }
    end,
    set_role_data(RoleID, RoleData).

init_skills(List) ->
    IDList = conf_gather_skill:get_skills(),
    init_skills(List, sets:from_list(IDList), []).

init_skills([], Set, Acc) ->
    init_skills2(sets:to_list(Set), Acc);
init_skills([#{id := ID} = Skill | T], Set, Acc) ->
    init_skills(T, sets:del_element(ID, Set), [Skill | Acc]).

init_skills2([], Acc) ->
    Acc;
init_skills2([ID | T], Acc) ->
    Skill = ?role_gather_skill#{id => ID, level => 1},
    init_skills2(T, [Skill | Acc]).

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
    #{vitality := Vitality, skills := Skills, reward_time := RewardTime, time := Time} = RoleData,
    DbSkills = type:term_to_bitstring(Skills),
    SQL = io_lib:format(?SQL_SET_ROLE_GATHER, [
        RoleID, Vitality, DbSkills, RewardTime, Time
    ]),
    db:execute(SQL).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_gather#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
