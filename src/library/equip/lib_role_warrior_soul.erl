%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     武魂系统
%%% @end
%%% Created : 23. 一月 2019 17:38
%%%-------------------------------------------------------------------
-module(lib_role_warrior_soul).
-author("Tom").
-include("op_type.hrl").
-include("skill.hrl").
-include("role.hrl").
-include("func.hrl").
-include("equip.hrl").
-include("ret_code.hrl").
-include("proto/prot_539.hrl").


-export([
	init/1,
	save/1,
	event/2,
	role_login/1
]).

-export([
	info/1,
	refine/1,
	star_up/1,
	get_attr/1,
	get_fight/1,
	conden_soul/3,
	save_conden/3,
	change_attr/4,
	change_avatar/2,
	get_role_data/1,
	activate_avatar/3,
	get_avatar_fight/1,
	init_role_db_data/1,
	convert_soul_info/1,
	get_soul_view_info/1,
	set_warrior_soul_attr/1,
	check_warrior_soul_open/1,
	refresh_warrior_soul_attr/2,
	refresh_warrior_soul_attr/3,
	get_Warrior_soul_cur_avatar/1
]).


%% 功能开启
event(PS, {func_open, ?FUNC_WARRIOR_SOUL}) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	check_active(PS, RoleData, true);
%% 定时检测精魄幻化是否超时
event(PS, {'timer', 'one_hour'}) ->
	#role_state{id = RoleID} = PS,
	RoleData = get_role_data(RoleID),
	{PSN, _} = check_avatar_expired(PS, RoleData, true),
	PSN;
event(_PS, _) ->
	ignore.


%%-------------------------lib_role回调----------------------------------
%% 初始化
init(PS) ->
%%    io:format("~p init.~n", [?MODULE]),
	#role_state{id = RoleID} = PS,
	RoleData = init_role_db_data(RoleID),
	set_role_data(RoleID, RoleData).

%% 下线保存
save(PS) ->
%%    io:format("~p save.~n", [?MODULE]),
	RoleData = get_role_data(PS#role_state.id),
	#role_warrior_soul{updated = Updated} = RoleData,
	?iif(Updated, save_role_db_data(PS#role_state.id, RoleData), skip).

%% 登录逻辑
role_login(PS) ->
	RoleData = get_role_data(PS#role_state.id),
	{PSN, RoleDataNew} = check_avatar_expired(PS, RoleData),
	check_active(PSN, RoleDataNew).

%%------------------------------------------------------------------------

%% 获取武魂信息
info(PS) ->
	#role_state{id = RoleID, sid = Sid} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{
		lv = Lv,
		star_lv = StarLv,
		skills = Skills,
		stren = Stren,
		stones = Stones,
		cur_avatar = CurAvatar,
		avatars = Avatars,
		add_succ_rate = AddSuccRate,
		conden_num = CondenNum,
		soul_parts = SoulParts,
		fight = Fight,
		avatar_fight = AvatarFight
	} = RoleWarriorSoul,
	
	if
		Lv =:= 0 -> skip;
		true ->
			MsgRecord = #sc_warrior_soul_info{
				id = Lv,
				star_lv = StarLv,
				skills = Skills,
				stren = Stren,
				stones = Stones,
				cur_avatar = CurAvatar,
				avatars = Avatars,
				combat_power = Fight,
				a_combat_power = AvatarFight,
				add_succ_rate = AddSuccRate,
				conden_num = CondenNum,
				soul_parts = SoulParts
			},
			{ok, Bin} = prot_msg:encode_msg(53902, MsgRecord),
			lib_role_send:send_to_sid(Sid, Bin)
	end,
	ok.

%% 进行精铸
refine(PS) ->
	#role_state{id = RoleID, sid = Sid} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	case catch check_refine(PS, RoleWarriorSoul) of
		{ok, RoleWarriorSoulN, RefineLvN, NewSkill, AddSuccRateN, Costs, Result} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_WARRIORSOUL_REFINE),
			update_role_data(RoleID, RoleWarriorSoulN),
			TupleRet = case Result of
				           true ->
					           PSV = refresh_warrior_soul_attr(PSN, RoleWarriorSoulN),
					           {ok, PSV};
				           false -> {error, PSN, ?RC_WARRIORSOUL_FAIL_REFINE}
			           end,
			MsgRecord = #sc_warrior_soul_refine{
				lv = RefineLvN,
				skill = NewSkill,
				combat_power = get_fight(RoleID),
				add_succ_rate = AddSuccRateN
			},
			{ok, Bin} = prot_msg:encode_msg(53904, MsgRecord),
			lib_role_send:send_to_sid(Sid, Bin),
			TupleRet;
		{error, RetCode} -> {error, PS, RetCode}
	end.

%% 升星
star_up(PS) ->
	#role_state{id = RoleID} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	case catch check_star_up(PS, RoleWarriorSoul) of
		{ok, RoleWarriorSoulN, StarLvNew, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_WARRIORSOUL_STAR_UP),
			PSV = refresh_warrior_soul_attr(PSN, RoleWarriorSoulN),
			MsgRecord = #sc_warrior_soul_star_up{
				star_lv = StarLvNew,
				combat_power = get_fight(RoleID)
			},
			{ok, PSV, MsgRecord};
		{error, RetCode} -> {error, RetCode}
	end.

%% 凝魂
conden_soul(PS, Type, Batch) ->
	#role_state{id = RoleID} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	case catch check_conden_soul(PS, RoleWarriorSoul, Type, Batch) of
		{ok, RoleWarriorSoulN, CondenNumNew, SingleRet, BatchRet, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_WARRIORSOUL_CONDEN_SOUL),
			update_role_data(RoleID, RoleWarriorSoulN),
			MsgRecord = #sc_warrior_soul_conden{
				type = Type,
				conden_num = CondenNumNew,
				single_ret = SingleRet,
				batch_ret = BatchRet
			},
			{ok, PSN, MsgRecord};
		{error, RetCode} -> {error, RetCode}
	end.

%% 保存凝魂结果
save_conden(PS, Type, IndexList) ->
	#role_state{id = RoleID} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{lv = RefineLv, star_lv = StarLv, soul_parts = SoulParts, batch_ret = BatchRet} = RoleWarriorSoul,
	length(IndexList) =/= 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
	RefineLv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
	CurType = ?iif(Type > ?SOUL_PART_TAIYANG, ?SOUL_PART_TAIYANG, ?iif(Type < ?SOUL_PART_TAIBAI, ?SOUL_PART_TAIBAI, Type)),
	CurSoulPart = util:list_find(CurType, #soul_part_info.type, SoulParts, #soul_part_info{type = CurType}),
	#soul_part_info{attr = Attr, conden_ret = CondenRet} = CurSoulPart,
	#{attr_limit := AttrLimit} = conf_warrior_soul_star_up:get(StarLv),
	FolderFun = fun(Index, AttrAcc) ->
		CurCondenRet = case Index of
			               0 -> CondenRet;
			               _ ->
				               util:list_find(Index, #conden_soul_result.index, BatchRet, #conden_soul_result{index = Index})
		               end,
		#conden_soul_result{alters = Alters} = CurCondenRet,
		[begin
			 {_, Limit} = util:list_find(AttrId, 1, AttrLimit, {AttrId, 0}),
			 {_, Alter} = util:list_find(AttrId, 1, Alters, {AttrId, 0}),
			 NewValue = Value + Alter,
			 NewValueN = ?iif(NewValue > Limit, Limit, ?iif(NewValue < 0, 0, NewValue)),
			 {AttrId, NewValueN}
		 end || {AttrId, Value} <- AttrAcc]
	            end,
	AttrN = lists:foldl(FolderFun, Attr, IndexList),
	CurSoulPartN = #soul_part_info{type = CurType, attr = AttrN},
	SoulPartsN = lists:keystore(CurType, #soul_part_info.type, SoulParts, CurSoulPartN),
	RoleWarriorSoulN = RoleWarriorSoul#role_warrior_soul{soul_parts = SoulPartsN, batch_ret = []},
	PSV = refresh_warrior_soul_attr(PS, RoleWarriorSoulN),
	router_539:send_soul_part_update(PSV, get_fight(RoleID), CurSoulPartN),
	{ok, PSV}.

%% 切换凝魂部位属性类型
change_attr(PS, Type, CurAttrId, TargetAttrId) ->
	#role_state{id = RoleID} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	case catch check_change_attr(PS, RoleWarriorSoul, Type, CurAttrId, TargetAttrId) of
		{ok, RoleWarriorSoulN, NewSoulPart, Costs} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_WARRIORSOUL_CHANGE_ATTR),
			PSV = refresh_warrior_soul_attr(PSN, RoleWarriorSoulN),
			router_539:send_soul_part_update(PSV, get_fight(RoleID), NewSoulPart),
			{ok, PSV};
		{error, RetCode} -> {error, RetCode}
	end.

%% 切换精魄幻化
change_avatar(PS, AvatarId) ->
	#role_state{id = RoleID} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{lv = RefineLv, cur_avatar = CurAvatar, avatars = Avatars} = RoleWarriorSoul,
	RefineLv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
	AvatarId =:= 0 orelse lists:keymember(AvatarId, 1, Avatars) orelse erlang:throw({error, ?RC_WARRIOR_SOUL_AVATAR_NOT_OWN}),
	AvatarId =/= CurAvatar orelse erlang:throw({error, ?RC_WARRIOR_SOUL_SAME_AVATAR}),
	update_role_data(RoleID, RoleWarriorSoul#role_warrior_soul{cur_avatar = AvatarId}),
	%% 广播给场景
	svr_scene_agent:cast_scene(PS#role_state.role_scene, {'warrior_soul_change', RoleID, AvatarId}),
	ok.


%%-------------------------External-------------------------------------
%% @doc 获取当前武魂的幻化精魄
get_Warrior_soul_cur_avatar(RoleID) ->
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{cur_avatar = CurAvatar} = RoleWarriorSoul,
	CurAvatar.

%% @doc 检查武魂是否开启
check_warrior_soul_open(RoleID) ->
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{lv = RefineLv} = RoleWarriorSoul,
	RefineLv =/= 0.

%% @doc 获取武魂总评分，计算人物总战力用到
get_fight(RoleID) ->
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{fight = Fight} = RoleWarriorSoul,
	Fight.

%% @doc 获取武魂总属性
get_attr(RoleID) ->
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{attr = Attr} = RoleWarriorSoul,
	Attr.

%% @doc 获取武魂幻化评分
get_avatar_fight(RoleID) ->
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{avatar_fight = Fight} = RoleWarriorSoul,
	Fight.

%% @doc 刷新武魂属性
refresh_warrior_soul_attr(PS, RoleWarriorSoul) ->
	refresh_warrior_soul_attr(PS, RoleWarriorSoul, false).

refresh_warrior_soul_attr(PS, RoleWarriorSoul, NoRefreshPower) ->
	#role_state{id = RoleID} = PS,
	RoleWarriorSoulN = set_warrior_soul_attr(RoleWarriorSoul),
	update_role_data(RoleID, RoleWarriorSoulN),
	case NoRefreshPower of
		false -> lib_role_attr:refresh_combat_power(PS);
		true -> PS
	end.

%% @doc 激活精魄
activate_avatar(PS, AvatarId, ValidTime) ->
	CurTime = time:unixtime(),
	#role_state{id = RoleID} = PS,
	RoleWarriorSoul = get_role_data(RoleID),
	#role_warrior_soul{lv = RefineLv, cur_avatar = CurAvatar, avatars = Avatars} = RoleWarriorSoul,
	RefineLv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
	Conf = conf_warrior_soul_avatar:get(AvatarId),
	Conf =/= undefined orelse erlang:throw({error, ?RC_WARRIOR_SOUL_AVATAR_NOT_EXIST}),
	not lists:keymember(AvatarId, 1, Avatars) orelse erlang:throw({error, ?RC_WARRIOR_SOUL_AVATAR_ALREADY_OWN}),
	AvatarsN = [{AvatarId, ?iif(ValidTime =:= 0, 0, CurTime + ValidTime)} | Avatars],
	CurAvatarN = ?iif(CurAvatar =:= 0, AvatarId, CurAvatar),
	PSV = refresh_warrior_soul_attr(PS, RoleWarriorSoul#role_warrior_soul{cur_avatar = CurAvatarN, avatars = AvatarsN}),
	router_539:send_refresh_avatars(PSV, CurAvatarN, AvatarsN, get_fight(RoleID), get_avatar_fight(RoleID)),
	%% 同步幻化更新到场景
	CurAvatarN =/= CurAvatar andalso svr_scene_agent:cast_scene(PS#role_state.role_scene, {'warrior_soul_change', RoleID, CurAvatarN}),
	PSV.

%% @doc 获取武魂查看信息
get_soul_view_info(RoleID) ->
	RoleWarriorSoul = get_role_data(RoleID),
	convert_soul_info(RoleWarriorSoul).

%% @doc 武魂数据转换
convert_soul_info(RoleWarriorSoul) when is_record(RoleWarriorSoul, role_warrior_soul) ->
	#role_warrior_soul{
		lv = Lv,
		star_lv = StarLv,
		stren = Stren,
		stones = Stones,
		soul_parts = SoulParts,
		fight = Fight,
		skills = Skills,
		cur_avatar = CurAvatar
	} = RoleWarriorSoul,
	#warrior_soul_view{
		lv = Lv,
		star_lv = StarLv,
		stren = Stren,
		stones = Stones,
		combat_power = Fight,
		soul_parts = SoulParts,
		skills = Skills,
		cur_avatar = CurAvatar
	};
convert_soul_info(_) ->
	#warrior_soul_view{}.

%%-------------------------Internal--------------------------------------
%% 检查精铸是否成功
check_refine(PS, RoleWarriorSoul) ->
	#role_state{level = PlayerLv} = PS,
	#role_warrior_soul{lv = RefineLv, skills = Skills, add_succ_rate = AddSuccRate} = RoleWarriorSoul,
	RefineLv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
	RefineLvNext = RefineLv + 1,
	RefineLvNext =< PlayerLv orelse erlang:throw({error, ?RC_WARRIOR_SOUL_REFINE_LV_OVER_PLAYER_LV}),
	Conf = conf_warrior_soul_refine:get(RefineLvNext),
	Conf =/= undefined orelse erlang:throw({error, ?RC_WARRIOR_SOUL_REACH_TOP_REFINE_LV}),
	#{skill := NewSkills, coin_cost := CoinCost, item_cost := ItemCost, succ_rate := SuccRate, fail_add := FailAdd} = Conf,
	NewSkill = ?iif(NewSkills =/= [], lists:nth(1, NewSkills), 0),
	Costs = [{?AST_COIN, CoinCost}, {?AST_ITEM, ItemCost}],
	lib_role_assets:check_items_enough(PS, Costs),
	TempRate = SuccRate + AddSuccRate,
	SuccRateN = ?iif(TempRate > 10000, 10000, TempRate),
	{RefineLvN, NewSkillN, SkillsN, AddSuccRateN, Result} = case util:is_bingo(SuccRateN) of
		                                                        true ->
			                                                        {RefineLvNext, NewSkill, ?iif(NewSkill =/= 0, [NewSkill | Skills], Skills), 0, true};
		                                                        false ->
			                                                        {RefineLv, 0, Skills, AddSuccRate + FailAdd, false}
	                                                        end,
	RoleWarriorSoulN = RoleWarriorSoul#role_warrior_soul{lv = RefineLvN, skills = SkillsN, add_succ_rate = AddSuccRateN},
	{ok, RoleWarriorSoulN, RefineLvN, NewSkillN, AddSuccRateN, Costs, Result}.

%% 检查升星是否成功
check_star_up(PS, RoleWarriorSoul) ->
	#role_warrior_soul{lv = RefineLv, star_lv = StarLv} = RoleWarriorSoul,
	RefineLv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
	StarLvNext = StarLv + 1,
	Conf = conf_warrior_soul_star_up:get(StarLvNext),
	Conf =/= undefined orelse erlang:throw({error, ?RC_WARRIOR_SOUL_REACH_TOP_STAR_LV}),
	#{refine_lv := RefineLvNeed, upgrade_cost := ItemCost} = Conf,
	RefineLv >= RefineLvNeed orelse erlang:throw({error, ?RC_WARRIOR_SOUL_LACK_OF_REFINE_LV}),
	Costs = [{?AST_ITEM, ItemCost}],
	lib_role_assets:check_items_enough(PS, Costs),
	RoleWarriorSoulN = RoleWarriorSoul#role_warrior_soul{star_lv = StarLvNext},
	{ok, RoleWarriorSoulN, StarLvNext, Costs}.

%% 检查凝魂是否成功
check_conden_soul(PS, RoleWarriorSoul, Type, Batch) ->
	#role_state{id = RoleID} = PS,
	CurType = ?iif(Type > ?SOUL_PART_TAIYANG, ?SOUL_PART_TAIYANG, ?iif(Type < ?SOUL_PART_TAIBAI, ?SOUL_PART_TAIBAI, Type)),
	CurNum = ?iif(Batch =:= 0, 1, 10),
	#role_warrior_soul{lv = RefineLv, star_lv = StarLv, conden_num = CondenNum, soul_parts = SoulParts} = RoleWarriorSoul,
	RefineLv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
	#{attr_limit := AttrLimit} = conf_warrior_soul_star_up:get(StarLv),
	CurSoulPart = util:list_find(CurType, #soul_part_info.type, SoulParts, #soul_part_info{type = CurType}),
	#soul_part_info{attr = CurAttr} = CurSoulPart,
	FolderFun = fun({AttrId, Value}, Acc) ->
		{_, Limit} = util:list_find(AttrId, 1, AttrLimit, {AttrId, 0}),
		if
			Value >= Limit -> Acc + 1;
			true -> Acc
		end
	            end,
	FullNum = lists:foldl(FolderFun, 0, CurAttr),
	FullNum < length(CurAttr) orelse erlang:throw({error, ?RC_WARRIOR_SOUL_PART_FULL_ATTR}),
	#{conden_soul_coin := CoinCost, conden_soul_items := [{ItemID, ItemNum}]} = conf_warrior_soul_base:get(),
	Costs = [{?AST_COIN, CoinCost * CurNum}, {?AST_ITEM, [{ItemID, ItemNum * CurNum}]}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	CurPower = lib_role_attr:calc_combat_power(CurAttr),
	ConRet = conden_soul_attr(CurNum, CurAttr, AttrLimit, [], CurPower, 1),
	FirstRet = lists:nth(1, ConRet),
	{SingleRet, BatchRet} = ?iif(length(ConRet) > 1, {#conden_soul_result{}, ConRet}, {FirstRet#conden_soul_result{index = 0}, []}),
	CondenNumNew = CondenNum + CurNum,
	SoulPartsN = lists:keystore(CurType, #soul_part_info.type, SoulParts, CurSoulPart#soul_part_info{conden_ret = SingleRet}),
	RoleWarriorSoulN = RoleWarriorSoul#role_warrior_soul{conden_num = CondenNumNew, soul_parts = SoulPartsN, batch_ret = BatchRet},
	
	%% 检查凝魂次数能否激活精魄
	ActAvatarIds = conf_warrior_soul_avatar:get_ids_by_type(?SOUL_AVATAR_TYPE_CONDEN),
	[begin
		 #{conden_soul_unlock := [{CondenNumNeed, ActItemID}]} = conf_warrior_soul_avatar:get(AvatarId),
		 Reward = [{?AST_ITEM, [{ActItemID, 1}]}],
		 CondenNumNew >= CondenNumNeed andalso CondenNum < CondenNumNeed andalso svr_mail:sys2p(RoleID, ?WARRIOR_SOUL_AWARD_MAIL, [CondenNumNew], Reward, ?OPT_WARRIORSOUL_CONDEN_SOUL)
	 end || AvatarId <- ActAvatarIds],
	{ok, RoleWarriorSoulN, CondenNumNew, SingleRet, BatchRet, Costs}.

%% 检查切换凝魂部位属性是否成功
check_change_attr(PS, RoleWarriorSoul, Type, CurAttrId, TargetAttrId) ->
	CurType = ?iif(Type > ?SOUL_PART_TAIYANG, ?SOUL_PART_TAIYANG, ?iif(Type < ?SOUL_PART_TAIBAI, ?SOUL_PART_TAIBAI, Type)),
	#role_warrior_soul{lv = RefineLv, star_lv = StarLv, soul_parts = SoulParts} = RoleWarriorSoul,
	RefineLv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
	CurSoulPart = util:list_find(CurType, #soul_part_info.type, SoulParts, #soul_part_info{type = CurType}),
	#soul_part_info{attr = CurAttr, conden_ret = CondenRet} = CurSoulPart,
	lists:keymember(CurAttrId, 1, CurAttr) orelse erlang:throw({error, ?RC_WARRIOR_SOUL_PART_NO_SUCH_ATTR}),
	CurAttrId =/= TargetAttrId orelse erlang:throw({error, ?RC_WARRIOR_SOUL_SAME_ATTR_CANT_CHANGE}),
	Conf = conf_warrior_soul_base:get(),
	FolderFun = fun(Index, {AttrId1, AttrId2, CurIndex, TargetIndex}) ->
		MapKey = list_to_atom("attr" ++ type:term_to_string(Index)),
		AttrList = maps:get(MapKey, Conf, []),
		CurIndexN = ?iif(lists:member(AttrId1, AttrList), Index, CurIndex),
		TargetIndexN = ?iif(lists:member(AttrId2, AttrList), Index, TargetIndex),
		{AttrId1, AttrId2, CurIndexN, TargetIndexN}
	            end,
	{_, _, CurIndex1, TargetIndex1} = lists:foldl(FolderFun, {CurAttrId, TargetAttrId, 0, 0}, lists:seq(1, 4)),
	CurIndex1 =:= TargetIndex1 andalso CurIndex1 =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_TARGET_ATTR_INVALID}),
	#{change_attr_items := ItemCost} = Conf,
	Costs = [{?AST_ITEM, ItemCost}],
	lib_role_assets:check_items_enough(PS, Costs),
	
	#conden_soul_result{alters = Alters} = CondenRet,
	AltersN = case lists:keymember(CurAttrId, 1, Alters) of
		          true -> lists:keydelete(CurAttrId, 1, Alters);
		          _ -> Alters
	          end,
	#{attr_limit := AttrLimit} = conf_warrior_soul_star_up:get(StarLv),
	{_, CurValue} = util:list_find(CurAttrId, 1, CurAttr, {CurAttrId, 0}),
	{_, CurLimit} = util:list_find(CurAttrId, 1, AttrLimit, {CurAttrId, 0}),
	{_, TargetLimit} = util:list_find(TargetAttrId, 1, AttrLimit, {TargetAttrId, 0}),
	Percent = ?iif(CurValue >= CurLimit, 1, CurValue / CurLimit),
	TargetValue = floor(TargetLimit * Percent),
	CurAttrN = lists:keystore(TargetAttrId, 1, lists:keydelete(CurAttrId, 1, CurAttr), {TargetAttrId, TargetValue}),
	SortFun = fun({AttrId1, _}, {AttrId2, _}) ->
		{_, _, Index1, Index2} = lists:foldl(FolderFun, {AttrId1, AttrId2, 0, 0}, lists:seq(1, 4)),
		Index1 < Index2
	          end,
	CurAttrM = lists:sort(SortFun, CurAttrN),
	CondenRetN = CondenRet#conden_soul_result{alters = AltersN},
	CurSoulPartN = CurSoulPart#soul_part_info{attr = CurAttrM, conden_ret = CondenRetN},
	SoulPartsN = lists:keystore(CurType, #soul_part_info.type, SoulParts, CurSoulPartN),
	RoleWarriorSoulN = RoleWarriorSoul#role_warrior_soul{soul_parts = SoulPartsN},
	{ok, RoleWarriorSoulN, CurSoulPartN, Costs}.


%% 检查精魄幻化是否过期
check_avatar_expired(PS, RoleData) ->
	check_avatar_expired(PS, RoleData, false).

check_avatar_expired(PS, RoleData, Notify) when is_record(RoleData, role_warrior_soul) ->
	CurTime = time:unixtime(),
	#role_state{id = RoleID} = PS,
	#role_warrior_soul{cur_avatar = CurAvatar, avatars = Avatars} = RoleData,
	FilterFun = fun({_, ExpireTime}) ->
		if
			ExpireTime =:= 0 orelse ExpireTime > CurTime -> true;
			true -> false
		end
	            end,
	AvatarsN = lists:filter(FilterFun, Avatars),
	CurAvatarN = case CurAvatar of
		             0 -> CurAvatar;
		             _ -> ?iif(lists:keymember(CurAvatar, 1, AvatarsN), CurAvatar, 0)
	             end,
	RoleDataN = RoleData#role_warrior_soul{cur_avatar = CurAvatarN, avatars = AvatarsN},
	case length(Avatars) =/= length(AvatarsN) of
		true ->
			case Notify of
				true ->
					RoleDataNew = set_warrior_soul_attr(RoleDataN),
					set_role_data(RoleID, RoleDataNew),
					
					router_539:send_refresh_avatars(PS, CurAvatarN, AvatarsN, get_fight(RoleID), get_avatar_fight(RoleID)),
					%% 同步幻化更新到场景
					CurAvatarN =/= CurAvatar andalso svr_scene_agent:cast_scene(PS#role_state.role_scene, {'warrior_soul_change', RoleID, CurAvatarN}),
					
					PSN = lib_role_attr:refresh_combat_power(PS),
					{PSN, RoleDataNew};
				false -> {PS, RoleDataN}
			end;
		false -> {PS, RoleDataN}
	end;
check_avatar_expired(PS, RoleData, _) ->
	{PS, RoleData}.

%% 检查能否激活武魂功能
check_active(PS, RoleData) ->
	check_active(PS, RoleData, false).

check_active(PS, RoleData, Notify) when is_record(RoleData, role_warrior_soul) ->
	#role_state{id = RoleID, level = Lv} = PS,
	#role_warrior_soul{lv = RefineLv} = RoleData,
	#{open_lv := OpenLv} = conf_warrior_soul_base:get(),
	RoleData1 = if
		            RefineLv =:= 0 andalso Lv >= OpenLv ->
			            SoulParts = [begin
				                         ConfMap = conf_warrior_soul_base:get(),
				                         Attr = maps:get(?SOUL_PART_KEY(PartType), ConfMap, []),
				                         #soul_part_info{type = PartType, attr = Attr}
			                         end || PartType <- lists:seq(?SOUL_PART_TAIBAI, ?SOUL_PART_TAIYANG)],
			            RoleData#role_warrior_soul{lv = 1, soul_parts = SoulParts, updated = true};
		            true ->
			            RoleData
	            end,
	RoleDataN = set_warrior_soul_attr(RoleData1),
	set_role_data(RoleID, RoleDataN),
	case Notify of
		true ->
			info(PS),
			lib_role_attr:refresh_combat_power(PS);
		false -> PS
	end;
check_active(PS, _, _) ->
	PS.

set_warrior_soul_attr(RoleWarriorSoul) when is_record(RoleWarriorSoul, role_warrior_soul) ->
	#role_warrior_soul{
		lv = Lv,
		star_lv = StarLv,
		skills = Skills,
		stren = Stren,
		stones = Stones,
		avatars = Avatars,
		soul_parts = SoulParts
	} = RoleWarriorSoul,
	case Lv of
		0 -> RoleWarriorSoul;
		_ ->
			%% 基础属性
			#{basic_attr := BaseAttr} = conf_warrior_soul_base:get(),
			%% 精魄属性
			AvatarAttrList = [begin
				                  AvatarConf = conf_warrior_soul_avatar:get(AvatarId),
				                  #{attr := AvatarAttr} = ?iif(AvatarConf =/= undefined, AvatarConf, #{attr => []}),
				                  AvatarAttr
			                  end || {AvatarId, _} <- Avatars],
			%% 强化属性
			StrenConf = conf_equip_stren:get({?EQUIP_POS_WARRIOR_SOUL, Stren}),
			#{attr := StrenAttr} = ?iif(StrenConf =/= undefined, StrenConf, #{attr => []}),
			%% 宝石属性
			StonesAttr = calc_stones_attr(Stones, []),
			%% 精铸属性
			#{attr := RefineAttr} = conf_warrior_soul_refine:get(Lv),
			%% 凝魂属性
			CondenSoulAttrList = [CondenAttr || #soul_part_info{attr = CondenAttr} <- SoulParts],
			%% 被动技能属性
			Func = fun(SkillId, {AttrsAcc, FightAcc}) ->
						SkillConf = conf_skill:get_base(SkillId, StarLv + 1),
						#base_skill{attr = SkillAttr, power = Power} = ?iif(SkillConf =/= undefined, SkillConf, #base_skill{attr = [], power = 0}),
						{[SkillAttr | AttrsAcc], FightAcc + Power}
			       end,
			{SkillAttrList, SkillPower} = lists:foldl(Func, {[], 0}, Skills),
			Attr = lib_role_attr:merge_attr([StonesAttr, StrenAttr, BaseAttr, RefineAttr]),
			{BaseAttr1, BtAttr1} = lib_role_attr:split_attr(Attr),
			FightBase = lib_role_attr:get_base_attr_power(soul, BaseAttr1),
			FightBt = lib_role_attr:get_bt_attr_power(soul, BtAttr1),
			Fight = FightBase + FightBt,
			AvatarAttrs = lib_role_attr:merge_attr(AvatarAttrList),
			{BaseAvatarAttr, BtAvatarAttr} = lib_role_attr:split_attr(AvatarAttrs),
			AvatarFightBase = lib_role_attr:get_base_attr_power(soul, BaseAvatarAttr),
			AvatarFightBt = lib_role_attr:get_bt_attr_power(soul, BtAvatarAttr),
			AvatarFight = AvatarFightBase + AvatarFightBt,
			SkillAttrs = lib_role_attr:merge_attr(SkillAttrList),
			{BaseSkillAttr, BtSkillAttr} = lib_role_attr:split_attr(SkillAttrs),
			SkillFightBase = lib_role_attr:get_base_attr_power(soul, BaseSkillAttr),
			SkillFightBt = lib_role_attr:get_bt_attr_power(soul, BtSkillAttr),
			SkillFight = SkillFightBase + SkillFightBt + SkillPower,
			CondenAttrs = lib_role_attr:merge_attr(CondenSoulAttrList),
			{BaseCondenAttr, BtCondenAttr} = lib_role_attr:split_attr(CondenAttrs),
			CondenFightBase = lib_role_attr:get_base_attr_power(soul, BaseCondenAttr),
			CondenFightBt = lib_role_attr:get_bt_attr_power(soul, BtCondenAttr),
			CondenFight = CondenFightBase + CondenFightBt,
			
			RoleWarriorSoul#role_warrior_soul{attr = lib_role_attr:merge_attr([Attr, AvatarAttrs, SkillAttrs, CondenAttrs]), fight = Fight + AvatarFight + SkillFight + CondenFight, avatar_fight = AvatarFight}
	end;
set_warrior_soul_attr(Data) ->
	Data.

calc_stones_attr([], Acc) ->
	Acc;
calc_stones_attr([{_, ID} | T], Acc) ->
	Conf = conf_equip_stone:get(ID),
	#{attr := Attr} = Conf,
	calc_stones_attr(T, Attr ++ Acc).

conden_soul_attr(0, _Attr, _AttrLimit, Acc, _Power, _Index) ->
	Acc;
conden_soul_attr(_Num, [], _AttrLimit, Acc, _Power, _Index) ->
	Acc;
conden_soul_attr(Num, Attr, AttrLimit, Acc, Power, Index) ->
	Alters = [begin
		          {_, Limit} = util:list_find(AttrId, 1, AttrLimit, {AttrId, 0}),
		          Percent = ?iif(Value >= Limit, 100, floor(Value / Limit * 100)),
		          #{index_start := Start, index_end := End} = conf_warrior_soul_index_range:get(Percent),
		          RandIndex = util:rand(Start, End),
		          AlterList = conf_warrior_soul_attr_alter:get_alter_list(RandIndex),
		          {_, AValue} = util:list_find(AttrId, 1, AlterList, {AttrId, 0}),
		          AValueN = ?iif(AValue + Value > Limit, Limit - Value, ?iif(AValue + Value < 0, -Value, AValue)),
		          {AttrId, AValueN}
	          end || {AttrId, Value} <- Attr],
	NewAttr = lib_role_attr:merge_attr([Attr, Alters]),
	NewPower = lib_role_attr:calc_combat_power(NewAttr),
	ConRet = #conden_soul_result{index = Index, recommend = ?iif(NewPower > Power, 1, 0), alters = Alters},
	conden_soul_attr(Num - 1, Attr, AttrLimit, [ConRet | Acc], Power, Index + 1).

%%--------------------------数据库操作--------------------------------------
-define(SQL_GET_ROLE_DATA, <<"select lv, star_lv, skills, stren, stones, cur_avatar, avatars, add_succ_rate, conden_num, soul_parts from role_warrior_soul where role_id = ~w">>).
init_role_db_data(RoleID) ->
	SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
	case ?DB:get_row(SQL) of
		[Lv, StarLv, DBSkills, Stren, DBStones, CurAvatar, DBAvatars, AddSuccRate, CondenNum, DBSoulParts] ->
			#role_warrior_soul{
				lv = Lv,
				star_lv = StarLv,
				skills = type:bitstring_to_term(DBSkills),
				stren = Stren,
				stones = type:bitstring_to_term(DBStones),
				cur_avatar = CurAvatar,
				avatars = type:bitstring_to_term(DBAvatars),
				add_succ_rate = AddSuccRate,
				conden_num = CondenNum,
				soul_parts = type:bitstring_to_term(DBSoulParts)
			};
		[] ->
			#role_warrior_soul{}
	end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_warrior_soul(role_id, lv, star_lv, skills, stren, stones, cur_avatar, avatars, add_succ_rate, conden_num, soul_parts) values(~w, ~w, ~w, '~s', ~w, '~s', ~w, '~s', ~w, ~w, '~s')">>).
save_role_db_data(RoleID, RoleData) ->
	#role_warrior_soul{
		lv = Lv,
		star_lv = StarLv,
		skills = Skills,
		stren = Stren,
		stones = Stones,
		cur_avatar = CurAvatar,
		avatars = Avatars,
		add_succ_rate = AddSuccRate,
		conden_num = CondenNum,
		soul_parts = SoulParts
	} = RoleData,
	SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, Lv, StarLv, type:term_to_bitstring(Skills), Stren, type:term_to_bitstring(Stones), CurAvatar, type:term_to_bitstring(Avatars), AddSuccRate, CondenNum, type:term_to_bitstring(SoulParts)]),
	?DB:execute(SQL),
	set_role_data(RoleID, RoleData#role_warrior_soul{updated = false}).


update_role_data(RoleID, Data) ->
	set_role_data(RoleID, Data#role_warrior_soul{updated = true}).

set_role_data(_RoleID, Data) ->
	erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
	erlang:get({?MODULE, role_data}).