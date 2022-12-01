%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     神器
%%% @end
%%% Created : 24. 十一月 2018 10:14
%%%-------------------------------------------------------------------
-module(lib_role_artifact).
-author("Tom").
-include("op_type.hrl").
-include("skill.hrl").
-include("role.hrl").
-include("func.hrl").
-include("equip.hrl").
-include("ret_code.hrl").
-include("proto/prot_522.hrl").


-export([
	init/1,
	save/1,
	event/2
]).

-export([
	info/2,
	lv_up/1,
	get_attr/1,
	get_fight/1,
	get_level/1,
	get_skills/1,
	take_award/2,
	gm_activate/1,
	activate_func/1,
	get_role_data/1,
	change_avatar/2,
	add_extra_attr/2,
	activate_avatar/2,
	set_artifact_attr/1,
	get_full_forge_num/1,
	get_artifact_stones/1,
	check_artifact_open/1,
	convert_artifact_info/1,
	get_artifact_stren_lv/1,
	refresh_artifact_attr/2,
	refresh_artifact_attr/3,
	get_artifact_view_info/1,
	get_artifact_cur_avatar/1
]).

%% 事件回调
event(PS, {'finish_task', TaskID}) ->
	ChipLv = conf_godweapon_collect:get_lv_by_cond({?ARTIFACT_CHIPS_COND_TASK, TaskID}),
	ChipLv =/= 0 andalso add_new_chip(PS, ChipLv);
event(PS, level_up) ->
	#role_state{level = Level} = PS,
	ChipLv = conf_godweapon_collect:get_lv_by_cond({?ARTIFACT_CHIPS_COND_LV, Level}),
	ChipLv =/= 0 andalso add_new_chip(PS, ChipLv);
event(_PS, _) ->
	ignore.

%%-------------------------lib_role回调----------------------------------
%% 初始化
init(PS) ->
%%    io:format("~p init.~n", [?MODULE]),
	#role_state{id = RoleID} = PS,
	RoleData = init_role_db_data(RoleID),
	RoleDataN = set_artifact_attr(RoleData),
	set_role_data(RoleID, RoleDataN).

%% 下线保存
save(PS) ->
%%    io:format("~p save.~n", [?MODULE]),
	RoleData = get_role_data(PS#role_state.id),
	#role_artifact{updated = Updated} = RoleData,
	?iif(Updated, save_role_db_data(PS#role_state.id, RoleData), skip).

%%------------------------------------------------------------------------

%% 获取神器信息
info(PS, OpenUI) ->
	#role_state{id = RoleID, sid = Sid} = PS,
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{
		id = Id,
		cur_avatar = CurAvatar,
		avatars = Avatars,
		stren = Stren,
		stones = Stones,
		old_attr = OldAttr,
		cur_attr = CurAttr,
		chips = Chips
	} = RoleArtifact,

%%    if
%%        Id =:= 0 -> skip;
%%        true ->
	MsgRecord = #sc_artifact_get_info{
		id = Id,
		cur_avatar = CurAvatar,
		avatars = Avatars,
		combat_power = get_avatar_exp_fight(RoleID),
		a_combat_power = get_avatar_fight(RoleID),
		stren = Stren,
		stones = Stones,
		extra_attr = get_extra_attr(OldAttr, CurAttr),
		pos_attr = CurAttr,
		chips = Chips,
		open_ui = ?iif(OpenUI, 1, 0)
	},
	{ok, Bin} = prot_msg:encode_msg(52202, MsgRecord),
	lib_role_send:send_to_sid(Sid, Bin),
%%    end,
	ok.

%% 神铸
add_extra_attr(PS, Pos) ->
	#role_state{id = RoleID} = PS,
	RoleArtifact = get_role_data(RoleID),
	case catch check_add_extra_attr(PS, Pos, RoleArtifact) of
		{ok, RoleArtifactN, SlotValueNew, Costs, Result} ->
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ARTIFACT_ADD_EXTRA_ATTR),
			case Result of
				true ->
					PSV = refresh_artifact_attr(PSN, RoleArtifactN),
					#role_artifact{old_attr = OldAttr, cur_attr = CurAttr} = RoleArtifactN,
					MsgRecord = #sc_artifact_add_extra_attr{
						pos = Pos,
						value = SlotValueNew,
						combat_power = get_avatar_exp_fight(RoleID),
						extra_attr = get_extra_attr(OldAttr, CurAttr)
					},
					?TASK_EVENT(RoleID, 'forge_artifact'),
					{ok, PSV, MsgRecord};
				false ->
					{error, PSN, ?RC_ARTIFACT_FAIL_ADD_EXTRA_ATTR}
			end;
		{error, RetCode} -> {error, PS, RetCode}
	end.

%% 升阶
lv_up(PS) ->
	#role_state{id = RoleID} = PS,
	RoleArtifact = get_role_data(RoleID),
	case catch check_lv_up(PS, RoleArtifact) of
		{ok, RoleArtifactN, IdNew, Costs} ->
			#{name := Name} = conf_artifact_base:get(IdNew),
			PSN = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ARTIFACT_LV_UP),
			PSV = refresh_artifact_attr(PSN, RoleArtifactN),
			lib_scene_api:update('mod_pskills', PSV),
			MsgRecord = #sc_artifact_lv_up{
				id = IdNew,
				combat_power = get_avatar_exp_fight(RoleID)
			},
			%% 广播给场景
			svr_scene_agent:cast_scene(PS#role_state.role_scene, {'artifact_change', RoleID, IdNew}),
			?TASK_EVENT(RoleID, upgrade_artifact),
			svr_rumor:publish(world, ?ARTIFACT_LV_UP_RUMOR, [PS#role_state.name, Name]),
			{ok, PSV, MsgRecord};
		{error, RetCode} -> {error, RetCode}
	end.

%% 切换幻化
change_avatar(PS, AvatarId) ->
	#role_state{id = RoleID} = PS,
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{id = Id, cur_avatar = CurAvatar, avatars = Avatars} = RoleArtifact,
	Id =/= 0 orelse erlang:throw({error, ?RC_ARTIFACT_NOT_OPEN}),
	lists:member(AvatarId, Avatars) orelse erlang:throw({error, ?RC_ARTIFACT_NOT_OWN}),
	AvatarId =/= CurAvatar orelse erlang:throw({error, ?RC_ARTIFACT_SAME_AVATAR}),
	update_role_data(RoleID, RoleArtifact#role_artifact{cur_avatar = AvatarId}),
	%% 广播给场景
	svr_scene_agent:cast_scene(PS#role_state.role_scene, {'artifact_change', RoleID, AvatarId}),
	MsgRecord = #sc_artifact_change_avatar{
		avatar_id = AvatarId
	},
	{ok, MsgRecord}.

%% 领取碎片奖励
take_award(PS, Lv) ->
	#role_state{id = RoleID} = PS,
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{chips = Chips} = RoleArtifact,
	case lists:keyfind(Lv, 1, Chips) of
		false -> erlang:throw({error, ?RC_ARTIFACT_NO_AWARD_TO_TAKE});
		{_, Take} ->
			Take =/= ?ARTIFACT_AWARD_TAKEN orelse erlang:throw({error, ?RC_ARTIFACT_AWARD_TAKEN}),
			ChipsN = lists:keystore(Lv, 1, Chips, {Lv, ?ARTIFACT_AWARD_TAKEN}),
			update_role_data(RoleID, RoleArtifact#role_artifact{chips = ChipsN}),
			
			%% 给奖励
			#{award_drop := AwardDrop} = conf_godweapon_collect:get(Lv),
			lib_drop_api:give_drop_asyn(RoleID, [AwardDrop], ?OPT_ARTIFACT_TAKE_AWARD),
			router_522:send_new_chip_update(PS, Lv, ?ARTIFACT_AWARD_TAKEN)
	end,
	ok.

%% 激活神器功能
activate_func(PS) ->
	#role_state{id = RoleID} = PS,
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{id = Id, chips = Chips} = RoleArtifact,
	Id =:= 0 orelse erlang:throw({error, ?RC_ARTIFACT_ALREADY_ACTIVE}),
	length(Chips) =:= conf_godweapon_collect:get_lv_num() orelse erlang:throw({error, ?RC_ARTIFACT_NEED_MORE_CHIPS}),
	CheckFunc = fun({_, Take}) -> Take =:= ?ARTIFACT_AWARD_TAKEN end,
	TakenList = lists:filter(CheckFunc, Chips),
	length(TakenList) =:= length(Chips) orelse erlang:throw({error, ?RC_ARTIFACT_NEED_TAKE_ALL_AWARD}),
	PSN = check_active(PS, RoleArtifact),
	{ok, PSN}.

%%-------------------------External-------------------------------------
%% @doc gm主动开启神器功能
gm_activate(PS) ->
	#role_state{id = RoleID} = PS,
	RoleArtifact = get_role_data(RoleID),
	Chips = [{ChipLv, 1} || ChipLv <- lists:seq(1, 5)],
	update_role_data(RoleID, RoleArtifact#role_artifact{chips = Chips}),
	activate_func(PS).

%% @doc 检查神器是否已经开启
check_artifact_open(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{id = Id} = RoleArtifact,
	Id =/= 0.

%% @doc 获取神器当前幻化
get_artifact_cur_avatar(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{cur_avatar = CurAvatar} = RoleArtifact,
	CurAvatar.

%% @doc 获取神器查看信息
get_artifact_view_info(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	convert_artifact_info(RoleArtifact).

%% @doc 神器数据转换
convert_artifact_info(RoleArtifact) when is_record(RoleArtifact, role_artifact) ->
	#role_artifact{
		id = Id,
		cur_avatar = CurAvatar,
		avatars = Avatars,
		stren = Stren,
		stones = Stones,
		old_attr = OldAttr,
		cur_attr = CurAttr,
		fight = Fight
	} = RoleArtifact,
	#clt_artifact{
		id = Id,
		cur_avatar = CurAvatar,
		avatars = Avatars,
		combat_power = Fight,
		stren = Stren,
		stones = Stones,
		extra_attr = get_extra_attr(OldAttr, CurAttr)
	};
convert_artifact_info(_) ->
	#clt_artifact{}.

%% @doc 获取神器的强化等级
get_artifact_stren_lv(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{stren = Stren} = RoleArtifact,
	Stren.

%% @doc 获取神器宝石列表
get_artifact_stones(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{stones = Stones} = RoleArtifact,
	Stones.

%% @doc 获取被动辅助技能
get_skills(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{id = Id} = RoleArtifact,
	Conf = conf_artifact_base:get(Id),
	case Conf of
		undefined -> [];
		_ ->
			#{skill := Skills} = Conf,
			lib_skill_util:make_skills(Skills)
	end.

%% @doc 获取神器总评分，计算人物总战力用到
get_fight(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{fight = Fight} = RoleArtifact,
	Fight.

%% @doc 获取神器总属性
get_attr(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{attr = Attr} = RoleArtifact,
%%    io:format("artifact get_attr:~p~n", [Attr]),
	Attr.

%% @doc 激活幻化
activate_avatar(PS, AvatarId) ->
	#role_state{id = RoleID, career = Career} = PS,
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{id = Id, avatars = Avatars} = RoleArtifact,
	Id =/= 0 orelse erlang:throw({error, ?RC_ARTIFACT_NOT_OPEN}),
	Conf = conf_artifact_avatar:get(AvatarId),
	Conf =/= undefined orelse erlang:throw({error, ?RC_ARTIFACT_AVATAR_NOT_EXIST}),
	#{career_id := NeedCareer} = Conf,
	Career =:= NeedCareer orelse NeedCareer =:= 0 orelse erlang:throw({error, ?RC_ARTIFACT_CAREER_INVALID}),
	not lists:member(AvatarId, Avatars) orelse erlang:throw({error, ?RC_ARTIFACT_ALREADY_OWN}),
	AvatarsN = [AvatarId | Avatars],
	PSV = refresh_artifact_attr(PS, RoleArtifact#role_artifact{cur_avatar = AvatarId, avatars = AvatarsN}),
	router_522:send_refresh_avatars(PSV, AvatarId, AvatarsN, get_avatar_fight(RoleID)),
	%% 广播给场景
	svr_scene_agent:cast_scene(PS#role_state.role_scene, {'artifact_change', RoleID, AvatarId}),
	PSV.

%% 获取神器除开幻化评分
get_avatar_exp_fight(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{avatar_exp_fight = Fight} = RoleArtifact,
	Fight.

%% 获取神器幻化评分
get_avatar_fight(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{avatar_fight = Fight} = RoleArtifact,
	Fight.

%% 刷新神器属性
refresh_artifact_attr(PS, RoleArtifact) ->
	refresh_artifact_attr(PS, RoleArtifact, false).

refresh_artifact_attr(PS, RoleArtifact, NoRefreshPower) ->
	#role_state{id = RoleID} = PS,
	RoleArtifactN = set_artifact_attr(RoleArtifact),
	update_role_data(RoleID, RoleArtifactN),
	case NoRefreshPower of
		false -> lib_role_attr:refresh_combat_power(PS);
		true -> PS
	end.

%%-------------------------Internal--------------------------------------
%% 检查能否进行神铸
check_add_extra_attr(PS, Pos, RoleArtifact) ->
	#role_artifact{id = Id, cur_attr = CurAttr} = RoleArtifact,
	Id =/= 0 orelse erlang:throw({error, ?RC_ARTIFACT_NOT_OPEN}),
	Conf = conf_artifact_base:get(Id),
	Conf =/= undefined orelse erlang:throw({error, ?RC_ARTIFACT_CONF_NOT_EXIST}),
	#{part_source := CostList, suc_rate := SuccRate} = Conf,
	{UpperKey, AddKey} = case Pos of
		                     ?ARTIFACT_SLOT_GOLD -> {part1_upper, part1_once_add};
		                     ?ARTIFACT_SLOT_WOOD -> {part2_upper, part2_once_add};
		                     ?ARTIFACT_SLOT_WATER -> {part3_upper, part3_once_add};
		                     ?ARTIFACT_SLOT_FIRE -> {part4_upper, part4_once_add};
		                     ?ARTIFACT_SLOT_EARTH -> {part5_upper, part5_once_add};
		                     _ -> erlang:throw({error, ?RC_ARTIFACT_SLOT_POS_INVALID})
	                     end,
	{UpperId, UpperValue} = maps:get(UpperKey, Conf, {0, 0}),
	{AddId, AddValue} = maps:get(AddKey, Conf, {0, 0}),
	UpperId =/= 0 andalso AddId =/= 0 andalso UpperId =:= AddId orelse erlang:throw({error, ?RC_ARTIFACT_CONF_NOT_EXIST}),
	{_, _, SlotValue} = util:list_find(Pos, 1, CurAttr, {Pos, AddId, 0}),
	SlotValueNew = SlotValue + AddValue,
	SlotValueNew =< UpperValue orelse erlang:throw({error, ?RC_ARTIFACT_SLOT_VALUE_MAX}),
	Costs = [{?AST_ITEM, CostList}],
	lib_role_assets:check_items_enough(PS, Costs),
	Rand = util:rand(1, 100),
	Result = ?iif(Rand =< SuccRate, true, false),
	CurAttrN = lists:keystore(Pos, 1, CurAttr, {Pos, AddId, SlotValueNew}),
	RoleArtifactN = RoleArtifact#role_artifact{cur_attr = CurAttrN},
	{ok, RoleArtifactN, SlotValueNew, Costs, Result}.

%% 检查能否升阶
check_lv_up(PS, RoleArtifact) ->
	#role_state{level = Lv, career = Career} = PS,
	#role_artifact{id = Id, old_attr = OldAttr, cur_attr = CurAttr, cur_avatar = CurAvatar, avatars = AvatarList} = RoleArtifact,
	Id =/= 0 orelse erlang:throw({error, ?RC_ARTIFACT_NOT_OPEN}),
	IdNew = Id + 1,
	Conf = conf_artifact_base:get(Id),
	ConfNew = conf_artifact_base:get(IdNew),
	ConfNew =/= undefined andalso Conf =/= undefined orelse erlang:throw({error, ?RC_ARTIFACT_REACH_MAX_LV}),
	#{lv := NeedLv, upgrade_source := UpgradeSrc} = ConfNew,
	Lv >= NeedLv orelse erlang:throw({error, ?RC_ARTIFACT_LACK_OF_LV}),
	Costs = [{?AST_ITEM, UpgradeSrc}],
	lib_role_assets:check_items_enough(PS, Costs),
	util:for(?ARTIFACT_SLOT_GOLD, ?ARTIFACT_SLOT_EARTH,
		fun(SlotPos) ->
			UpperKey = case SlotPos of
				           ?ARTIFACT_SLOT_GOLD -> part1_upper;
				           ?ARTIFACT_SLOT_WOOD -> part2_upper;
				           ?ARTIFACT_SLOT_WATER -> part3_upper;
				           ?ARTIFACT_SLOT_FIRE -> part4_upper;
				           ?ARTIFACT_SLOT_EARTH -> part5_upper;
				           _ -> erlang:throw({error, ?RC_ARTIFACT_SLOT_POS_INVALID})
			           end,
			{_, UpperValue} = maps:get(UpperKey, Conf, {0, 0}),
			{_, _, SlotValue} = util:list_find(SlotPos, 1, CurAttr, {SlotPos, 0, 0}),
%%        io:format("Id=~w, SlotPos=~w, SlotValue=~w, UpperValue=~w~n", [Id, SlotPos, SlotValue, UpperValue]),
			SlotValue >= UpperValue orelse erlang:throw({error, ?RC_ARTIFACT_SLOT_NOT_FULL})
		end),
	OldAttrNew = get_extra_attr(OldAttr, CurAttr),
	ConfN = conf_artifact_base:get(CurAvatar),
	DefaultId = ?DEFAULT_AVATAR_ID(Career),
	CurAvatarN = ?iif(ConfN =/= undefined orelse CurAvatar =:= DefaultId, IdNew, CurAvatar),
	List = lists:delete(Id, lists:delete(DefaultId, AvatarList)),
	AvatarListN = [IdNew | List],
	RoleArtifactN = RoleArtifact#role_artifact{id = IdNew, old_attr = OldAttrNew, cur_attr = [], cur_avatar = CurAvatarN, avatars = AvatarListN},
	{ok, RoleArtifactN, IdNew, Costs}.


%% 获取神铸属性列表
get_extra_attr(OldAttr, CurAttr) ->
	CurAttrN = [{Attr, Value} || {_, Attr, Value} <- CurAttr],
	lib_role_attr:merge_attr([OldAttr, CurAttrN]).


set_artifact_attr(RoleArtifact) when is_record(RoleArtifact, role_artifact) ->
	#role_artifact{
		id = Id,
		avatars = Avatars,
		stren = Stren,
		stones = Stones,
		old_attr = OldAttr,
		cur_attr = CurAttr
	} = RoleArtifact,
	case Id of
		0 -> RoleArtifact;
		_ ->
			%% 基础属性
			#{attr := BaseAttr, skill := Skills} = conf_artifact_base:get(Id),
			%% 幻化属性
			AvatarAttr_List = [begin
				                   AvatarConf = conf_artifact_avatar:get(AvatarId),
				                   #{attr := AvatarAttr} = ?iif(AvatarConf =/= undefined, AvatarConf, #{attr => []}),
				                   AvatarAttr
			                   end || AvatarId <- Avatars],
			%% 强化属性
			#{attr := StrenAttr} = conf_equip_stren:get({?EQUIP_POS_ARTIFACT, Stren}),
			%% 宝石属性
			StonesAttr = calc_stones_attr(Stones, []),
			%% 神铸属性
			CurAttrN = [{Attr, Value} || {_, Attr, Value} <- CurAttr],
			%% 被动技能属性、战力
			Func = fun(SkillId, {AttrsAcc, FightAcc}) ->
						SkillConf = conf_skill:get_base(SkillId, 1),
						#base_skill{attr = SkillAttr, power = Power} = ?iif(SkillConf =/= undefined, SkillConf, #base_skill{attr = [], power = 0}),
						{[SkillAttr | AttrsAcc], FightAcc + Power}
			       end,
			{SkillAttrList, SkillPower} = lists:foldl(Func, {[], 0}, Skills),
			SkillAttrs = lib_role_attr:merge_attr(SkillAttrList),
			
			%% 总属性
			Attr = lib_role_attr:merge_attr([OldAttr, CurAttrN, StonesAttr, StrenAttr, BaseAttr, SkillAttrs]),
			Fight = lib_role_attr:calc_combat_power(Attr) + SkillPower,
			AvatarAttrs = lib_role_attr:merge_attr(AvatarAttr_List),
			AvatarFight = lib_role_attr:calc_combat_power(AvatarAttrs),
			RoleArtifact#role_artifact{attr = lib_role_attr:merge_attr([Attr, AvatarAttrs]), fight = Fight + AvatarFight, avatar_exp_fight = Fight, avatar_fight = AvatarFight}
	end.

calc_stones_attr([], Acc) ->
	Acc;
calc_stones_attr([{_, ID} | T], Acc) ->
	Conf = conf_equip_stone:get(ID),
	#{attr := Attr} = Conf,
	calc_stones_attr(T, Attr ++ Acc).

%% 检查能否激活神器功能
check_active(PS, RoleData) when is_record(RoleData, role_artifact) ->
	#role_state{id = RoleID, level = Lv, career = Career} = PS,
	ConfId = Career * 100 + 1,
	#{lv := OpenLv} = conf_artifact_base:get(ConfId),
	Lv >= OpenLv orelse erlang:throw({error, ?RC_ARTIFACT_LACK_OF_LV_ACTIVATE}),
	AvatarId = ?DEFAULT_AVATAR_ID(Career),
	RoleData1 = RoleData#role_artifact{id = ConfId, cur_avatar = AvatarId, avatars = [AvatarId], updated = true},
	RoleDataN = set_artifact_attr(RoleData1),
	set_role_data(RoleID, RoleDataN),
	?TASK_EVENT(PS, 'active_artifact'),
	lib_role_func:active(PS, ?FUNC_ARTIFACT),
	info(PS, true),
	lib_role_attr:refresh_combat_power(PS);
check_active(PS, _) ->
	PS.

%% @doc 获取等级
get_level(RoleID) ->
	RoleData = get_role_data(RoleID),
	#role_artifact{id = ID} = RoleData,
	%% 策划
	ID rem 100.

get_full_forge_num(RoleID) ->
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{id = Id, cur_attr = CurAttr} = RoleArtifact,
	Conf = conf_artifact_base:get(Id),
	case Conf of
		undefined ->
			0;
		_ ->
			Fun = fun(SlotPos, Acc) ->
				UpperKey = case SlotPos of
					           ?ARTIFACT_SLOT_GOLD -> part1_upper;
					           ?ARTIFACT_SLOT_WOOD -> part2_upper;
					           ?ARTIFACT_SLOT_WATER -> part3_upper;
					           ?ARTIFACT_SLOT_FIRE -> part4_upper;
					           ?ARTIFACT_SLOT_EARTH -> part5_upper
				           end,
				{_, UpperValue} = maps:get(UpperKey, Conf, {0, 0}),
				{_, _, SlotValue} = util:list_find(SlotPos, 1, CurAttr, {SlotPos, 0, 0}),
				?iif(SlotValue >= UpperValue, Acc + 1, Acc)
			      end,
			lists:foldl(Fun, 0, lists:seq(?ARTIFACT_SLOT_GOLD, ?ARTIFACT_SLOT_EARTH))
	end.

add_new_chip(PS, ChipLv) ->
	#role_state{id = RoleID} = PS,
	RoleArtifact = get_role_data(RoleID),
	#role_artifact{id = ArtifactId, chips = Chips} = RoleArtifact,
	Exist = lists:keymember(ChipLv, 1, Chips),
	ArtifactId =:= 0 andalso not Exist andalso
		begin
			Conf = conf_godweapon_collect:get(ChipLv),
			case Conf of
				#{} ->
					update_role_data(RoleID, RoleArtifact#role_artifact{chips = [{ChipLv, 0} | Chips]}),
					router_522:send_new_chip_update(PS, ChipLv, 0);
				_ -> skip
			end
		end.

%%--------------------------数据库操作--------------------------------------
-define(SQL_GET_ROLE_DATA, <<"select id, cur_avatar, avatars, stren, stones, old_attr, cur_attr, chips from role_artifact where role_id = ~w">>).
init_role_db_data(RoleID) ->
	SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
	case ?DB:get_row(SQL) of
		[Id, CurAvatar, DBAvatars, Stren, DBStones, DBOldAttr, DBCurAttr, DBChips] ->
			#role_artifact{
				id = Id,
				cur_avatar = CurAvatar,
				avatars = type:bitstring_to_term(DBAvatars),
				stren = Stren,
				stones = type:bitstring_to_term(DBStones),
				old_attr = type:bitstring_to_term(DBOldAttr),
				cur_attr = type:bitstring_to_term(DBCurAttr),
				chips = type:bitstring_to_term(DBChips)
			};
		[] ->
			#role_artifact{}
	end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_artifact(role_id, id, cur_avatar, avatars, stren, stones, old_attr, cur_attr, chips) values(~w, ~w, ~w, '~s', ~w, '~s', '~s', '~s', '~s')">>).
save_role_db_data(RoleID, RoleData) ->
	#role_artifact{
		id = Id,
		cur_avatar = CurAvatar,
		avatars = Avatars,
		stren = Stren,
		stones = Stones,
		old_attr = OldAttr,
		cur_attr = CurAttr,
		chips = Chips
	} = RoleData,
	SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, Id, CurAvatar, type:term_to_bitstring(Avatars), Stren, type:term_to_bitstring(Stones), type:term_to_bitstring(OldAttr), type:term_to_bitstring(CurAttr), type:term_to_bitstring(Chips)]),
	?DB:execute(SQL),
	set_role_data(RoleID, RoleData#role_artifact{updated = false}).

update_role_data(RoleID, Data) ->
	set_role_data(RoleID, Data#role_artifact{updated = true}).

set_role_data(_RoleID, Data) ->
	erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
	erlang:get({?MODULE, role_data}).