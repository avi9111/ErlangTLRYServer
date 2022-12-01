%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     暗器
%%% @end
%%% Created : 29. 十一月 2018 11:27
%%%-------------------------------------------------------------------
-module(lib_role_anqi).
-author("Tom").
-include("op_type.hrl").
-include("role.hrl").
-include("skill.hrl").
-include("func.hrl").
-include("equip.hrl").
-include("ret_code.hrl").
-include("proto/prot_526.hrl").


-export([
	init/1,
	save/1,
	event/2,
	role_login/1
]).

-export([
	info/1,
	forge/1,
	lv_up/1,
	get_qlv/1,
	practice/1,
	get_attr/1,
	get_fight/1,
	get_skills/1,
	unlock_plan/2,
	change_plan/2,
	get_prac_lv/1,
	refresh_plan/1,
	replace_plan/2,
	get_add_attr/1,
	set_anqi_attr/1,
	create_poison/2,
	get_role_data/1,
	get_anqi_stones/1,
	check_anqi_open/1,
	get_origin_attr/1,
	open_poison_slot/2,
	convert_anqi_info/1,
	get_anqi_stren_lv/1,
	refresh_anqi_attr/2,
	refresh_anqi_attr/3,
	get_anqi_view_info/1,
	replace_poison_attr/2
]).


%% 功能开启
event(PS, {func_open, ?FUNC_ANQI}) ->
%%    io:format("func_open: anqi.~n"),
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	check_active(PS, RoleData, true);
event(_PS, _) ->
	ignore.


%%-------------------------lib_role回调----------------------------------
%% 初始化
init(PS) ->
	#role_state{id = RoleID} = PS,
	RoleData = init_role_db_data(RoleID),
	set_role_data(RoleID, RoleData).

%% 下线保存
save(PS) ->
	RoleData = get_role_data(PS#role_state.id),
	#role_anqi{updated = Updated} = RoleData,
	?iif(Updated, save_role_db_data(PS#role_state.id, RoleData), skip).

%% 登录相关逻辑
role_login(PS) ->
	RoleData = get_role_data(PS#role_state.id),
	check_active(PS, RoleData).

%%----------------------------------接口逻辑----------------------------
info(PS) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	#{switch_cd := CD} = conf_anqi_base:get(),
	#role_anqi{
		id = Id,
		q_level = QLevel,
		stren = Stren,
		stones = Stones,
		practice_lv = PracticeLv,
		practice_exp = PracticeExp,
		cur_plan = CurPlan,
		last_set_plan_time = LastSetPlanTime,
		skill_plans = SkillPlans,
		poison_slots = PoisonSlots,
		fight = Fight,
		origin_attr = OriginAttr,
		add_attr = AddAttr
	} = RoleData,
	case Id of
		0 -> skip;
		_ ->
			MsgRecord = #sc_anqi_get_info{
				id = Id,
				q_level = QLevel,
				combat_power = Fight,
				stren = Stren,
				stones = Stones,
				practice_lv = PracticeLv,
				practice_exp = PracticeExp,
				cur_plan = CurPlan,
				end_plan_cd_time = LastSetPlanTime + CD * 60,
				skill_plans = SkillPlans,
				origin_attr = OriginAttr,
				add_attr = AddAttr,
				poison_slots = PoisonSlots
			},
			{ok, MsgRecord}
	end.

%% 修炼
practice(PS) ->
	#role_state{id = RoleID, sid = Sid} = PS,
	RoleData = get_role_data(RoleID),
	case catch check_practice(PS, RoleData) of
		{ok, RoleDataN, LvN, ExpN, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ANQI_PRACTICE),
			PSV = refresh_anqi_attr(PSN, RoleDataN),
			MsgRecord = #sc_anqi_practice{
				combat_power = get_fight(RoleID),
				practice_lv = LvN,
				practice_exp = ExpN,
				origin_attr = get_origin_attr(RoleID),
				add_attr = get_add_attr(RoleID)
			},
			{ok, Bin} = prot_msg:encode_msg(52604, MsgRecord),
			lib_role_send:send_to_sid(Sid, Bin),
			%% 开启暗器技能
			check_unlock_skill(PSV),
			?TASK_EVENT(PS, {'anqi_practice', LvN}),
			{ok, PSV};
		{error, RetCode} -> {error, RetCode}
	end.

%% 打造
forge(PS) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	case catch check_forge(PS, RoleData) of
		{ok, RoleDataN, IdNew, Costs} ->
			#{name := Name} = conf_anqi_model:get(IdNew),
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ANQI_FORGE),
			PSV = refresh_anqi_attr(PSN, RoleDataN),
			MsgRecord = #sc_anqi_forge{
				id = IdNew,
				combat_power = get_fight(RoleID),
				origin_attr = get_origin_attr(RoleID),
				add_attr = get_add_attr(RoleID)
			},
			svr_rumor:publish(world, ?ANQI_FORGE_RUMOR, [PS#role_state.name, Name]),
			{ok, PSV, MsgRecord};
		{error, RetCode} -> {error, RetCode}
	end.

%% 升品阶
lv_up(PS) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	case catch check_lv_up(PS, RoleData) of
		{ok, RoleDataN, QLevelNew, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ANQI_LV_UP),
			PSV = refresh_anqi_attr(PSN, RoleDataN),
			MsgRecord = #sc_anqi_lv_up{
				q_level = QLevelNew,
				combat_power = get_fight(RoleID),
				add_attr = get_add_attr(RoleID)
			},
			?TASK_EVENT(PS, {'anqi_qlv', QLevelNew}),
			{ok, PSV, MsgRecord};
		{error, RetCode} -> {error, RetCode}
	end.

%% 切换技能方案
change_plan(PS, Plan) ->
	CurTime = time:unixtime(),
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	#role_anqi{id = Id, cur_plan = CurPlan, skill_plans = SkillPlans, last_set_plan_time = LastTime} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	CurPlan =/= Plan orelse erlang:throw({error, ?RC_ANQI_SAME_SKILL_PLAN}),
	FilterList = lists:filter(fun(SkillPlan) -> SkillPlan#anqi_skill_plan.index =:= Plan end, SkillPlans),
	length(FilterList) =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_OWN_SUCH_SKILL_PLAN}),
	#{switch_cd := CD} = conf_anqi_base:get(),
	CurTime - LastTime > CD * 60 orelse erlang:throw({error, ?RC_ANQI_SWITCH_CD_NOT_END}),
	
	RoleAnqi = RoleData#role_anqi{cur_plan = Plan, last_set_plan_time = CurTime},
	update_role_data(RoleID, RoleAnqi),
	refresh_anqi_attr(PS, RoleAnqi),
	lib_scene_api:update('mod_pskills', PS),
	MsgRecord = #sc_anqi_change_plan{
		plan = Plan,
		end_plan_cd_time = CurTime + CD * 60
	},
	{ok, MsgRecord}.

%% 解锁技能方案
unlock_plan(PS, Plan) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	case catch check_unlock_plan(PS, RoleData, Plan) of
		{ok, RoleDataN, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ANQI_UNLOCK_SKILL_PLAN),
			update_role_data(RoleID, RoleDataN),
			MsgRecord = #sc_anqi_unlock_plan{
				plan = Plan
			},
			{ok, PSN, MsgRecord};
		{error, RetCode} -> {error, RetCode}
	end.

%% 重洗技能方案
refresh_plan(PS) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	case catch check_refresh_plan(PS, RoleData) of
		{ok, RoleDataN, SkillPlanNew, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ANQI_REFRESH_SKILL_PLAN),
			update_role_data(RoleID, RoleDataN),
			MsgRecord = #sc_anqi_refresh_plan{
				skill_plan = SkillPlanNew
			},
			{ok, PSN, MsgRecord};
		{error, RetCode} -> {error, RetCode}
	end.

%% 替换技能方案
replace_plan(PS, Plan) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	#role_anqi{id = Id, cur_plan = CurPlan, skill_plans = SkillPlans} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	{RefreshList, DesList, LeftList} = lists:foldl(fun(SkillPlan, {R_List, D_List, L_List}) ->
		case SkillPlan#anqi_skill_plan.index of
			0 -> {[SkillPlan | R_List], D_List, L_List};
			Plan -> {R_List, [SkillPlan | D_List], L_List};
			_ -> {R_List, D_List, [SkillPlan | L_List]}
		end
	                                               end, {[], [], []}, SkillPlans),
	length(RefreshList) =/= 0 orelse erlang:throw({error, ?RC_ANQI_NO_REFRESH_SKILL_PLAN}),
	length(DesList) =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_OWN_SUCH_SKILL_PLAN}),
	
	RefreshPlan = lists:nth(1, RefreshList),
	SkillPlanNew = RefreshPlan#anqi_skill_plan{index = Plan},
	RoleAnqi = RoleData#role_anqi{skill_plans = [SkillPlanNew | LeftList]},
	update_role_data(RoleID, RoleAnqi),
	CurPlan =:= Plan andalso begin
		                         refresh_anqi_attr(PS, RoleAnqi),
		                         lib_scene_api:update('mod_pskills', PS)
	                         end,
	MsgRecord = #sc_anqi_replace_plan{
		skill_plan = SkillPlanNew
	},
	{ok, MsgRecord}.

%% 开启淬毒孔
open_poison_slot(PS, Index) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	case catch check_open_poison_slot(PS, RoleData, Index) of
		{ok, RoleDataN, PoisonSlotNew, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ANQI_UNLOCK_POISON_SLOT),
			PSV = refresh_anqi_attr(PSN, RoleDataN),
			router_526:send_poison_slot_update(PSV, PoisonSlotNew),
			{ok, PSV};
		{error, RetCode} -> {error, RetCode}
	end.

%% 炼毒
create_poison(PS, Index) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	case catch check_create_poison(PS, RoleData, Index) of
		{ok, RoleDataN, PoisonSlotNew, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ANQI_CREATE_POISON),
			update_role_data(RoleID, RoleDataN),
			router_526:send_poison_slot_update(PSN, PoisonSlotNew),
			{ok, PSN};
		{error, RetCode} -> {error, RetCode}
	end.

%% 替换炼毒属性
replace_poison_attr(PS, Index) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	#role_anqi{id = Id, poison_slots = PoisonSlots} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	{CurList, LeftList} = lists:foldl(fun(PoisonSlot, {CurList_ACC, LeftList_ACC}) ->
		#anqi_poison_slot{index = CurIndex} = PoisonSlot,
		case CurIndex of
			Index -> {[PoisonSlot | CurList_ACC], LeftList_ACC};
			_ -> {CurList_ACC, [PoisonSlot | LeftList_ACC]}
		end
	                                  end, {[], []}, PoisonSlots),
	length(CurList) =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_OWN_POISON_SLOT}),
	CurSlot = lists:nth(1, CurList),
	#anqi_poison_slot{sub_attr = SubAttr} = CurSlot,
	NewPoisonSlot = CurSlot#anqi_poison_slot{attr = SubAttr, sub_attr = []},
	PSV = refresh_anqi_attr(PS, RoleData#role_anqi{poison_slots = [NewPoisonSlot | LeftList]}),
	router_526:send_poison_slot_update(PSV, NewPoisonSlot),
	{ok, PSV}.

%%-------------------------External-------------------------------------
%% @doc 检查暗器是否已经开启
check_anqi_open(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{id = Id} = RoleAnqi,
	Id =/= 0.

%% @doc 获取神器的查看信息
get_anqi_view_info(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	convert_anqi_info(RoleAnqi).

%% @doc 暗器数据转换
convert_anqi_info(RoleAnqi) when is_record(RoleAnqi, role_anqi) ->
	#role_anqi{
		id = Id,
		q_level = QLevel,
		stren = Stren,
		stones = Stones,
		practice_lv = PracticeLv,
		poison_slots = PoisonSlots,
		fight = Fight,
		origin_attr = OriginAttr,
		add_attr = AddAttr
	} = RoleAnqi,
	#clt_anqi{
		id = Id,
		q_level = QLevel,
		combat_power = Fight,
		stren = Stren,
		stones = Stones,
		practice_lv = PracticeLv,
		origin_attr = OriginAttr,
		add_attr = AddAttr,
		poison_slots = PoisonSlots
	};
convert_anqi_info(_) ->
	#clt_anqi{}.


%% @doc 获取暗器的强化等级
get_anqi_stren_lv(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{stren = Stren} = RoleAnqi,
	Stren.

get_prac_lv(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{practice_lv = PracLv} = RoleAnqi,
	PracLv.

get_qlv(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{q_level = QLv} = RoleAnqi,
	QLv.

%% @doc 获取暗器宝石列表
get_anqi_stones(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{stones = Stones} = RoleAnqi,
	Stones.

%% @doc 获取被动辅助技能
get_skills(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{cur_plan = CurPlan, skill_plans = SkillPlans} = RoleAnqi,
	get_skills(CurPlan, SkillPlans).

get_skills(CurPlan, SkillPlans) ->
	OwnList = lists:filter(fun(SkillPlan) -> SkillPlan#anqi_skill_plan.index =:= CurPlan end, SkillPlans),
	case OwnList of
		[] -> [];
		_ ->
			SkillPlan = lists:nth(1, OwnList),
			#anqi_skill_plan{skill1 = Skill1, skill2 = Skill2, skill3 = Skill3} = SkillPlan,
			SkillList1 = ?iif(Skill1 =/= 0, [Skill1], []),
			SkillList2 = ?iif(Skill2 =/= 0, [Skill2 | SkillList1], SkillList1),
			SkillList3 = ?iif(Skill3 =/= 0, [Skill3 | SkillList2], SkillList2),
			lib_skill_util:make_skills(SkillList3)
	end.

%% @doc 获取暗器总评分
get_fight(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{fight = Fight} = RoleAnqi,
	Fight.

%% @doc 获取暗器总属性
get_attr(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{attr = Attr} = RoleAnqi,
	Attr.

%% @doc 获取暗器原始属性
get_origin_attr(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{origin_attr = Attr} = RoleAnqi,
	Attr.

%% @doc 获取暗器加成属性
get_add_attr(RoleID) ->
	RoleAnqi = get_role_data(RoleID),
	#role_anqi{add_attr = Attr} = RoleAnqi,
	Attr.


%% 刷新暗器属性
refresh_anqi_attr(PS, RoleAnqi) ->
	refresh_anqi_attr(PS, RoleAnqi, false).

refresh_anqi_attr(PS, RoleAnqi, NoRefreshPower) ->
	#role_state{id = RoleID} = PS,
	RoleAnqiN = set_anqi_attr(RoleAnqi),
	update_role_data(RoleID, RoleAnqiN),
	case NoRefreshPower of
		false -> lib_role_attr:refresh_combat_power(PS);
		true -> PS
	end.

set_anqi_attr(RoleAnqi) when is_record(RoleAnqi, role_anqi) ->
	#role_anqi{
		id = Id,
		q_level = QLevel,
		stren = Stren,
		stones = Stones,
		practice_lv = PracticeLv,
		poison_slots = PoisonSlots,
		cur_plan = CurPlan,
		skill_plans = SkillPlans
	} = RoleAnqi,
	case Id of
		0 -> RoleAnqi;
		_ ->
			%% 基础属性
			#{attr := BaseAttr, forge_attr := ForgeAttr} = conf_anqi_model:get(Id),
			%% 强化属性
			#{attr := StrenAttr} = conf_equip_stren:get({?EQUIP_POS_ANQI, Stren}),
			%% 宝石属性
			StonesAttr = calc_stones_attr(Stones, []),
			%% 暗器加成属性
			#{attr := PracticeAttr} = ?iif(PracticeLv =/= 0, conf_anqi_practice:get(PracticeLv), #{attr => []}),
			OriginAttr = lib_role_attr:merge_attr([ForgeAttr, PracticeAttr]),
			Conf = conf_anqi_param:get(QLevel),
			LevelRate = case Conf of
				            undefined -> 0;
				            #{
					            level := Level,
					            param1 := Param1,
					            param2 := Param2
				            } -> (Param1 + Param2 * (QLevel - Level)) / 1000000
			            end,
			AddAttr = [{AttrId, erlang:floor(Value * (1 + LevelRate))} || {AttrId, Value} <- OriginAttr],
			%% 淬毒属性
			P_AttrList = [Slot#anqi_poison_slot.attr || Slot <- PoisonSlots],
			PoisonAttr = lib_role_attr:merge_attr(P_AttrList),
			%% 被动技能属性、战力
			Func = fun(#skill{id = SkillId, level = Lv}, {AttrsAcc, FightAcc}) ->
				SkillConf = conf_skill:get_base(SkillId, Lv),
				#base_skill{attr = SkillAttr, power = Power} = ?iif(SkillConf =/= undefined, SkillConf, #base_skill{attr = [], power = 0}),
				{[SkillAttr | AttrsAcc], FightAcc + Power}
			       end,
			{SkillAttrList, SkillPower} = lists:foldl(Func, {[], 0}, get_skills(CurPlan, SkillPlans)),
			SkillAttrs = lib_role_attr:merge_attr(SkillAttrList),
			
			%% 总属性
			Attr = lib_role_attr:merge_attr([PoisonAttr, AddAttr, StonesAttr, StrenAttr, BaseAttr, SkillAttrs]),
			Fight = lib_role_attr:calc_combat_power(Attr) + SkillPower,
			RoleAnqi#role_anqi{attr = Attr, fight = Fight, origin_attr = OriginAttr, add_attr = AddAttr}
	end.

%%----------------------------Internal----------------------------------------------
check_practice(PS, RoleData) ->
	#role_anqi{id = Id, practice_lv = PracticeLv, practice_exp = PracticeExp} = RoleData,
	#{practice_cost := Cost, practice_get := ExpGet} = conf_anqi_base:get(),
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	NewLv = PracticeLv + 1,
	Conf = conf_anqi_practice:get(NewLv),
	Conf =:= undefined andalso erlang:throw({error, ?RC_ANQI_REACH_MAX_PRACTICE_LV}),
	Costs = [{?AST_ITEM, Cost}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	#{progress := Progress} = Conf,
	{LvN, ExpN} = case PracticeExp + ExpGet >= Progress of
		              true -> {NewLv, PracticeExp + ExpGet - Progress};
		              false -> {PracticeLv, PracticeExp + ExpGet}
	              end,
	RoleDataN = RoleData#role_anqi{practice_lv = LvN, practice_exp = ExpN},
	{ok, RoleDataN, LvN, ExpN, Costs}.

check_forge(PS, RoleData) ->
	#role_anqi{id = Id} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	IdNew = Id + 1,
	Conf = conf_anqi_model:get(IdNew),
	Conf =:= undefined andalso erlang:throw({error, ?RC_ANQI_REACH_MAX_FORGE_LV}),
	#{lv := NeedLv, forge_source := Cost} = Conf,
	PS#role_state.level >= NeedLv orelse erlang:throw({error, ?RC_ANQI_FORGE_LACK_OF_LV}),
	Costs = [{?AST_ITEM, Cost}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	RoleDataN = RoleData#role_anqi{id = IdNew},
	{ok, RoleDataN, IdNew, Costs}.

check_lv_up(PS, RoleData) ->
	#role_anqi{id = Id, q_level = QLevel} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	#{up_level_cost := Cost, level_get := LvGet} = conf_anqi_base:get(),
	#{level_max := LvMax} = conf_anqi_model:get(Id),
	QLevel < LvMax orelse erlang:throw({error, ?RC_ANQI_REACH_MAX_Q_LV}),
	Costs = [{?AST_ITEM, Cost}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	{RandQLevel, _} = util:rand_by_weight(LvGet, 2),
	QLevelNew = QLevel + RandQLevel,
	QLevelNew1 = ?iif(QLevelNew > LvMax, LvMax, QLevelNew),
	RoleDataN = RoleData#role_anqi{q_level = QLevelNew1},
	{ok, RoleDataN, QLevelNew1, Costs}.

check_unlock_plan(PS, RoleData, Plan) ->
	#role_anqi{id = Id, skill_plans = SkillPlans} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	OwnList = lists:filter(fun(SkillPlan) -> SkillPlan#anqi_skill_plan.index =:= 1 end, SkillPlans),
	length(OwnList) =/= 0 orelse erlang:throw({error, ?RC_ANQI_NO_SKILL_PLAN_UNLOCKED}),
	Func = fun(#anqi_skill_plan{index = Index}, CurPlan) ->
		Plan =:= Index andalso erlang:throw({error, ?RC_ANQI_OWN_SAME_PLAN}),
		?iif(Index > CurPlan, Index, CurPlan)
	       end,
	MaxPlan = lists:foldl(Func, 0, SkillPlans),
	#{skill_set_open := SkillSetOpen} = conf_anqi_base:get(),
	{Plan_Index, {CostType, CostValue}} = util:list_find(Plan, 1, SkillSetOpen, {0, {0, 0}}),
	Plan =:= MaxPlan + 1 andalso Plan_Index =/= 0 andalso CostType =/= 0 andalso CostValue =/= 0 orelse erlang:throw({error, ?RC_ANQI_INVALID_PLAN_INDEX}),
	Costs = [{CostType, CostValue}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	SkillPlansN = [#anqi_skill_plan{index = Plan} | SkillPlans],
	RoleDataN = RoleData#role_anqi{skill_plans = SkillPlansN},
	{ok, RoleDataN, Costs}.

check_refresh_plan(PS, RoleData) ->
	#role_anqi{id = Id, skill_plans = SkillPlans} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	OwnList = lists:filter(fun(SkillPlan) -> SkillPlan#anqi_skill_plan.index =:= 1 end, SkillPlans),
	length(OwnList) =/= 0 orelse erlang:throw({error, ?RC_ANQI_NO_SKILL_PLAN_UNLOCKED}),
	#{refresh_skill_cost := Cost} = conf_anqi_base:get(),
	Costs = [{?AST_ITEM, Cost}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	FirstPlan = lists:nth(1, OwnList),
	SkillPlanNew = #anqi_skill_plan{
		skill1 = ?iif(FirstPlan#anqi_skill_plan.skill1 =/= 0, get_rand_skill(1), 0),
		skill2 = ?iif(FirstPlan#anqi_skill_plan.skill2 =/= 0, get_rand_skill(2), 0),
		skill3 = ?iif(FirstPlan#anqi_skill_plan.skill3 =/= 0, get_rand_skill(3), 0)
	},
	#anqi_skill_plan{skill1 = Skill1, skill2 = Skill2, skill3 = Skill3} = SkillPlanNew,
	case conf_anqi_skill:get(Skill1) of
		#{name := Name1, quality := Quality1} when Quality1 =:= 5 ->
			svr_rumor:publish(world, ?ANQI_REFRESH_SKILL_RUMOR, [PS#role_state.name, Name1]);
		_ -> skip
	end,
	case conf_anqi_skill:get(Skill2) of
		#{name := Name2, quality := Quality2} when Quality2 =:= 5 ->
			svr_rumor:publish(world, ?ANQI_REFRESH_SKILL_RUMOR, [PS#role_state.name, Name2]);
		_ -> skip
	end, case conf_anqi_skill:get(Skill3) of
		     #{name := Name3, quality := Quality3} when Quality3 =:= 5 ->
			     svr_rumor:publish(world, ?ANQI_REFRESH_SKILL_RUMOR, [PS#role_state.name, Name3]);
		     _ -> skip
	     end,
	
	FilterList = lists:filter(fun(SkillPlan) -> SkillPlan#anqi_skill_plan.index =/= 0 end, SkillPlans),
	SkillPlansN = [SkillPlanNew | FilterList],
	RoleDataN = RoleData#role_anqi{skill_plans = SkillPlansN},
	{ok, RoleDataN, SkillPlanNew, Costs}.

check_open_poison_slot(PS, RoleData, Index) ->
	#role_state{career = Career} = PS,
	#role_anqi{id = Id, practice_lv = PracticeLv, poison_slots = PoisonSlots} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	#{poison_open_lv := OpenLv, unlock_poison_cost := Cost} = conf_anqi_base:get(),
	PracticeLv >= OpenLv orelse erlang:throw({error, ?RC_ANQI_LACK_OF_PRACTICE_LV}),
	Conf = conf_anqi_poison:get(Index),
	Conf =/= undefined orelse erlang:throw({error, ?RC_ANQI_POISON_SLOT_INDEX_INVALID}),
	[Index =:= HasIndex andalso erlang:throw({error, ?RC_ANQI_OWN_SUCH_POISON_SLOT}) || #anqi_poison_slot{index = HasIndex} <- PoisonSlots],
	Costs = [{?AST_ITEM, Cost}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	PoisonSlotNew = #anqi_poison_slot{
		index = Index,
		lv = 1,
		attr = get_rand_poison_attr(Index, Career, 1)
	},
	RoleDataN = RoleData#role_anqi{poison_slots = [PoisonSlotNew | PoisonSlots]},
	{ok, RoleDataN, PoisonSlotNew, Costs}.

check_create_poison(PS, RoleData, Index) ->
	#role_state{career = Career} = PS,
	#role_anqi{id = Id, poison_slots = PoisonSlots} = RoleData,
	Id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
	{CurList, LeftList} = lists:foldl(fun(PoisonSlot, {CurList_ACC, LeftList_ACC}) ->
		#anqi_poison_slot{index = CurIndex} = PoisonSlot,
		case CurIndex of
			Index -> {[PoisonSlot | CurList_ACC], LeftList_ACC};
			_ -> {CurList_ACC, [PoisonSlot | LeftList_ACC]}
		end
	                                  end, {[], []}, PoisonSlots),
	length(CurList) =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_OWN_POISON_SLOT}),
	#{execute_poison_cost := Cost, poison_exp_get := ExpGet} = conf_anqi_base:get(),
	Costs = [{?AST_ITEM, Cost}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	CurSlot = lists:nth(1, CurList),
	#anqi_poison_slot{lv = Lv, exp = Exp} = CurSlot,
	NewLv = Lv + 1,
	Conf = conf_anqi_poison_by_lv:get(NewLv),
	{LvN, ExpN} = case Conf of
		              undefined -> {Lv, Exp};
		              _ ->
			              #{exp := ExpNeed} = Conf,
			              ?iif(Exp + ExpGet >= ExpNeed, {NewLv, Exp + ExpGet - ExpNeed}, {Lv, Exp + ExpGet})
	              end,
	PoisonSlotNew = CurSlot#anqi_poison_slot{lv = LvN, exp = ExpN, sub_attr = get_rand_poison_attr(Index, Career, Lv)},
	RoleDataN = RoleData#role_anqi{poison_slots = [PoisonSlotNew | LeftList]},
	{ok, RoleDataN, PoisonSlotNew, Costs}.



calc_stones_attr([], Acc) ->
	Acc;
calc_stones_attr([{_, ID} | T], Acc) ->
	Conf = conf_equip_stone:get(ID),
	#{attr := Attr} = Conf,
	calc_stones_attr(T, Attr ++ Acc).

%% 检查能否激活暗器功能
check_active(PS, RoleData) ->
	check_active(PS, RoleData, false).

check_active(PS, RoleData, Notify) when is_record(RoleData, role_anqi) ->
	#role_state{id = RoleID, level = Lv} = PS,
	#role_anqi{id = AnqiId} = RoleData,
	ConfId = 1,
	#{open_lv := OpenLv, init_level := InitLevel} = conf_anqi_base:get(),
	RoleData1 = ?iif(AnqiId =:= 0 andalso Lv >= OpenLv, begin
		                                                    RoleData#role_anqi{id = ConfId, q_level = InitLevel, practice_lv = 1, updated = true}
	                                                    end, RoleData),
	RoleDataN = set_anqi_attr(RoleData1),
	set_role_data(RoleID, RoleDataN),
	case Notify of
		true ->
			router_526:do(52601, PS, #cs_anqi_get_info{}),
			lib_role_attr:refresh_combat_power(PS);
		false -> PS
	end.

%% 检查开启暗器技能
check_unlock_skill(PS) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	#role_anqi{cur_plan = CurPlan, practice_lv = PracticeLv, skill_plans = SkillPlans} = RoleData,
	#{unlock_skill := UnlockSkill} = conf_anqi_base:get(),
	SkillIndex = lists:foldl(fun({Index, LvLimit}, CurIndex) ->
		case PracticeLv >= LvLimit of
			true -> Index;
			false -> CurIndex
		end
	                         end, 0, UnlockSkill),
	SkillIndex =/= 0 andalso begin
		                         FirstPlan = case SkillPlans of
			                                     [] -> #anqi_skill_plan{index = 1};
			                                     _ ->
				                                     FirstList = lists:filter(fun(SkillPlan) ->
					                                     SkillPlan#anqi_skill_plan.index =:= 1 end, SkillPlans),
				                                     lists:nth(1, FirstList)
		                                     end,
		                         #anqi_skill_plan{skill1 = Skill1, skill2 = Skill2, skill3 = Skill3} = FirstPlan,
		                         if
			                         Skill1 =/= 0 andalso Skill2 =/= 0 andalso Skill3 =/= 0 -> skip;
			                         true ->
				                         {Skill1_New, Skill2_New, Skill3_New} = get_new_skills(SkillIndex, Skill1, Skill2, Skill3),
				                         Skill1_New =:= Skill1 andalso Skill2_New =:= Skill2 andalso Skill3_New =:= Skill3 orelse
					                         begin
						                         FirstPlan_New = FirstPlan#anqi_skill_plan{skill1 = Skill1_New, skill2 = Skill2_New, skill3 = Skill3_New},
						                         {SkillPlans_N, CurPlan_N} = case lists:member(FirstPlan, SkillPlans) of
							                                                     true ->
								                                                     List = lists:delete(FirstPlan, SkillPlans),
								                                                     {[FirstPlan_New | List], CurPlan};
							                                                     false ->
								                                                     {[FirstPlan_New | SkillPlans], 1}
						                                                     end,
						                         RoleAnqi = RoleData#role_anqi{skill_plans = SkillPlans_N, cur_plan = CurPlan_N},
						                         update_role_data(RoleID, RoleAnqi),
						                         CurPlan_N =:= 1 andalso begin
							                                                 refresh_anqi_attr(PS, RoleAnqi),
							                                                 lib_scene_api:update('mod_pskills', PS)
						                                                 end,
						                         %% 下发更新
						                         router_526:send_new_plan_update(PS, FirstPlan_New, CurPlan_N)
					                         end
		                         end
	                         end.

%% 获得新的三个暗器技能，已有的不获得
get_new_skills(SkillIndex, Skill1, Skill2, Skill3) ->
	#{skill_num := SkillNum} = conf_anqi_base:get(),
	{Skill1_New, Skill2_New, Skill3_New} = lists:foldl(fun(Num, {Skill1_T, Skill2_T, Skill3_T}) ->
		if
			SkillIndex >= Num ->
				case Num of
					1 when Skill1_T =:= 0 -> {get_rand_skill(1), Skill2_T, Skill3_T};
					2 when Skill2_T =:= 0 -> {Skill1_T, get_rand_skill(2), Skill3_T};
					3 when Skill3_T =:= 0 -> {Skill1_T, Skill2_T, get_rand_skill(3)};
					_ -> {Skill1_T, Skill2_T, Skill3_T}
				end;
			true -> {Skill1_T, Skill2_T, Skill3_T}
		end
	                                                   end, {Skill1, Skill2, Skill3}, lists:seq(1, SkillNum)),
	{Skill1_New, Skill2_New, Skill3_New}.

%% 根据技能位生成随机技能
get_rand_skill(Pos) ->
	SkillIdList = conf_anqi_skill:get_id_by_pos(Pos),
	case SkillIdList of
		[] -> 0;
		_ ->
			SkillIdListN = lists:map(fun(SkillId) ->
				#{weight := Weight} = conf_anqi_skill:get(SkillId),
				{SkillId, Weight}
			                         end, SkillIdList),
			{SkillId_R, _} = util:rand_by_weight(SkillIdListN, 2),
			SkillId_R
	end.

%% 根据淬毒孔编号、职业和炼毒等级获得随机炼毒属性
get_rand_poison_attr(Index, Career, Lv) ->
	Conf = conf_anqi_poison:get(Index),
	AttrList = case Career of
		           1 -> #{attr1 := Attr} = Conf, Attr;
		           2 -> #{attr2 := Attr} = Conf, Attr;
		           3 -> #{attr3 := Attr} = Conf, Attr;
		           4 -> #{attr4 := Attr} = Conf, Attr
	           end,
	ConfLv = conf_anqi_poison_by_lv:get(Lv),
	PoisonAttr = case ConfLv of
		             undefined -> [];
		             _ ->
			             #{attr_range := RangeList} = ConfLv,
			             [begin
				              {_, BeginV, EndV} = util:list_find(AttrId, 1, RangeList, {AttrId, 0, 0}),
				              {AttrId, util:rand(BeginV, EndV)}
			              end || AttrId <- AttrList]
	             end,
	PoisonAttr.

%%--------------------------数据库操作--------------------------------------
-define(SQL_GET_ROLE_DATA, <<"select id, q_level, stren, stones, practice_lv, practice_exp, cur_plan, skill_plans, poison_slots from role_anqi where role_id = ~w">>).
init_role_db_data(RoleID) ->
	SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
	case ?DB:get_row(SQL) of
		[Id, QLevel, Stren, DBStones, PracticeLv, PracticeExp, CurPlan, DBSkillPlans, DBPoisonSlots] ->
			#role_anqi{
				id = Id,
				q_level = QLevel,
				stren = Stren,
				stones = type:bitstring_to_term(DBStones),
				practice_lv = PracticeLv,
				practice_exp = PracticeExp,
				cur_plan = CurPlan,
				skill_plans = type:bitstring_to_term(DBSkillPlans),
				poison_slots = type:bitstring_to_term(DBPoisonSlots)
			};
		[] ->
			#role_anqi{}
	end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_anqi(role_id, id, q_level, stren, stones, practice_lv, practice_exp, cur_plan, skill_plans, poison_slots) values(~w, ~w, ~w, ~w, '~s', ~w, ~w, ~w, '~s', '~s')">>).
save_role_db_data(RoleID, RoleData) ->
	#role_anqi{
		id = Id,
		q_level = QLevel,
		stren = Stren,
		stones = Stones,
		practice_lv = PracticeLv,
		practice_exp = PracticeExp,
		cur_plan = CurPlan,
		skill_plans = SkillPlans,
		poison_slots = PoisonSlots
	} = RoleData,
	SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, Id, QLevel, Stren, type:term_to_bitstring(Stones), PracticeLv, PracticeExp, CurPlan, type:term_to_bitstring(SkillPlans), type:term_to_bitstring(PoisonSlots)]),
	?DB:execute(SQL),
	set_role_data(RoleID, RoleData#role_anqi{updated = false}).

update_role_data(RoleID, Data) ->
	set_role_data(RoleID, Data#role_anqi{updated = true}).

set_role_data(_RoleID, Data) ->
	erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
	erlang:get({?MODULE, role_data}).