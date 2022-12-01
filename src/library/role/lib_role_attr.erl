%%-------------------------------------------------------
%% @File     : lib_role_attr
%% @Brief    : 角色属性相关处理
%% @Author   : cablsbs
%% @Date     : 2018-6-19
%%-------------------------------------------------------

-module(lib_role_attr).

-include("attr.hrl").
-include("role.hrl").
-include("skill.hrl").

-export([
    calc_combat_power/1,
    calc_combat_power/2,
    calc_combat_power/3,
    calc_battle_power/3,
    get_bt_attr_power/2,
    get_base_attr_power/2,
    refresh_combat_power/1
]).

-export([
    add_attr/2,
    mul_attr/2,
    merge_attr/1,
    split_attr/1,
    attr_to_list/1,
    attr_to_record/2,
    base_to_bt_attr/2
]).

% 修改属性值(gm辅助)
-export([
    alter_attrs/2
]).

%%% -----------------------------------------------------
%%% 注意： 每个模块自己计算并存储属性及战力, 此模块的refresh_combat_power 只做加法
%%%     模块数据变化后：
%%%       1).调用此模块的属性工具函数计算属性
%%%       2).调用此模块的 calc_combat_power 计算战力
%%%       3).将各自属性及战力保留在模块内部(可以不用持久化到db，登陆后重算)
%%%       4).调用此模块refresh_combat_power刷新战力,并同步给客户端
%%%
%%%     每个带属性计算的模块，提供以下两个接口:
%%%       1).get_attr(RoleId) -> AttrL.
%%%          AttrL      :: [{AttrIndex, BtAttrV}]
%%%          AttrIndex  :: BaseAttrIndex | BtAttrIndex + 100
%%%       2).get_fight(RoleId) -> ModuleFight.
%%% -----------------------------------------------------

%% Apis -------------------------------------------------
%% @doc 计算战斗力
%% @spec calc_combat_power(AttrL) -> CombatPower.
%% AttrL        :: [{AttrIndex, BtAttrV}]
%% AttrIndex    :: BaseAttrIndex | BtAttrIndex + 100
%% CombatPower  :: integer()
calc_combat_power(AttrList) ->
    calc_combat_power(AttrList, []).

%% @doc 计算战斗力
%% @spec calc_combat_power(AttrL, Skills) -> CombatPower.
%% AttrL        :: [{AttrIndex, BtAttrV}]
%% Skills       :: [#skill{}]
%% AttrIndex    :: BaseAttrIndex | BtAttrIndex + 100
%% CombatPower  :: integer()
calc_combat_power(AttrList, Skills) when is_list(AttrList) ->
    {BaseAttr, BtAttr} = split_attr(AttrList),
    calc_combat_power(BaseAttr, BtAttr, Skills).

%% @doc 计算战斗力
%% @spec calc_combat_power(BaseAttr, BtAttr, Skills) -> CombatPower.
%% BaseAttr     :: #base_attr{} | [{K :: integer(), V :: integer()}]
%% BtAttr       :: #bt_attr{} | [{K :: integer(), V :: integer()}]
%% Skills       :: [#skill{}]
%% CombatPower  :: integer()
calc_combat_power(BaseAttr, BtAttr, SkillList) ->
    SumFun = fun(Skill, {AccPower, AccBaseAttr, AccBtAttr}) ->
        AddonSkill = lib_role_skill:skill_conf(Skill),
        #base_skill{hero = HeroId, legend = Legend} = AddonSkill,
        GuidePower = conf_hero:guide_fight(HeroId, Legend),
        case AddonSkill of
            #base_skill{power = SkPower} when SkPower > 0 ->
                AccPowerN = AccPower + SkPower + GuidePower,
                {AccPowerN, AccBaseAttr, AccBtAttr};
            #base_skill{attr = AttrL} ->
                AccPowerN = AccPower + GuidePower,
                {BaseAttrL, BtAttrL} = split_attr(AttrL),
                AccBaseAttrN = add_attr(AccBaseAttr, BaseAttrL),
                AccBtAttrN = add_attr(AccBtAttr, BtAttrL),
                {AccPowerN, AccBaseAttrN, AccBtAttrN}
        end
    end,
    {AddonPower, BaseAttrT, BtAttrT} = lists:foldl(SumFun, {0, BaseAttr, BtAttr}, SkillList),
    BaseAttrN = merge_attr(BaseAttrT),
    BasePower = get_base_attr_power(BaseAttrN),
    BtAttrN = merge_attr(BtAttrT),
    BtPower = get_bt_attr_power(BtAttrN),
    AddonPower + BasePower + BtPower.

% 不同系数的战斗属性战力计算(珍兽、珍兽附体)
calc_battle_power(Fun, BtAttr, SkillList) ->
    SumFun = fun(Skill, {AccPower, AccBtAttr}) ->
        #skill{id = SkillId, level = SkillLv} = Skill,
        case conf_skill:get_base(SkillId, SkillLv) of
            #base_skill{power = SkPower} when SkPower > 0 ->
                {AccPower + SkPower, AccBtAttr};
            #base_skill{attr = AttrL} ->
                {_BaseAttrL, BtAttrL} = split_attr(AttrL),
                AccBtAttrN = add_attr(AccBtAttr, BtAttrL),
                {AccPower, AccBtAttrN};
            _ ->
                ?ERROR("No such SkillId: ~p, SkillLv: ~p", [SkillId, SkillLv]),
                {AccPower, AccBtAttr}
        end
    end,
    {AddonPower, BtAttrT} = lists:foldl(SumFun, {0, BtAttr}, SkillList),
    BtAttrN = merge_attr(BtAttrT),
    BtPower = get_bt_attr_power(Fun, BtAttrN),
    AddonPower + BtPower.

%% @doc 计算总战力
% 注意：统一命名 Module:get_fight
refresh_combat_power(RoleState) ->
    %% 属性计算
    RoleStateT = calc_scene_attr(RoleState),
    #role_state{
        id = RoleId, career = Career, level = Level,
        combat_power = OldCombatPower, skill_list = SkillList
    } = RoleStateT,

    %% 战力计算
    % 计算角色战力
    {BaseAttr, BtAttr} = conf_career_attr:get_attr(Career, Level),
    BasicCombatPower = calc_combat_power(BaseAttr, BtAttr, SkillList),

    % 模块战力
    TitleCombatPower = lib_role_title:get_fight(RoleId),
    FashionCombatPower = lib_role_fashion:get_fight(RoleId),
    SurfaceCombatPower = lib_role_surface:get_fight(RoleId),
    HeroCombatPower = lib_role_hero:get_fight(RoleId),
    PracticeCombatPower = lib_role_guild:get_fight(RoleId),
    MarryFight = lib_role_marriage:get_fight(RoleId),
    PetFight = lib_role_pet:get_fight(RoleId),
    EquipFight = lib_role_equip:get_fight(RoleId),
    ChannelFight = lib_role_channel:get_fight(RoleId),
    SmeltFight = lib_role_smelt:get_fight(RoleId),
    DragonFight = lib_role_dragon:get_fight(RoleId),
    ArtifactFight = lib_role_artifact:get_fight(RoleId),
    AnqiFight = lib_role_anqi:get_fight(RoleId),
    WarriorSoulFight = lib_role_warrior_soul:get_fight(RoleId),
    TitleHonorFight = lib_role_title_honor:get_fight(RoleId),

    NewCombatPower = lists:sum([
        BasicCombatPower, TitleCombatPower, FashionCombatPower, DragonFight,
        SurfaceCombatPower, HeroCombatPower, PracticeCombatPower,
        MarryFight, PetFight, EquipFight, ChannelFight, SmeltFight,
        ArtifactFight, AnqiFight, WarriorSoulFight, TitleHonorFight
    ]),
    RoleStateN = RoleStateT#role_state{combat_power = NewCombatPower},

    % 同步更新
    OldCombatPower =/= NewCombatPower andalso begin
        ?EVENT(RoleId, 'bt_attr_update'),                                   % 战斗属性更新事件
        lib_scene_api:update('scene_bt_attr', RoleStateN)                   % 场景属性更新
    end,
    NewCombatPower >= OldCombatPower andalso ?TASK_EVENT(RoleId, 'fight_up'),
    RoleStateN.

% @doc 两个attr相加， 注意，两个列表，返回的也是列表。 其他返回bt_attr
add_attr(Attr1, Attr2) when is_record(Attr1, bt_attr), is_record(Attr2, bt_attr) ->
    Size = erlang:tuple_size(Attr1),
    add_attr_by_index(Attr1, Attr2, 2, Size);
add_attr(Attr1, Attr2) when is_record(Attr1, base_attr), is_record(Attr2, base_attr) ->
    Size = erlang:tuple_size(Attr1),
    add_attr_by_index(Attr1, Attr2, 2, Size);
add_attr(Attr1, Attr2) when is_list(Attr1) andalso is_list(Attr2) ->
    merge_attr(Attr1 ++ Attr2);
add_attr(Attr1, Attr2) when (is_record(Attr1, bt_attr) orelse is_record(Attr1, base_attr)) andalso is_list(Attr2) ->
    AddAttrFun = fun({AttrType, AttrVal}, TmpAttr) when is_number(AttrVal) ->
        AttrIndex = AttrType + 1,
        NewAttrVal = element(AttrIndex, TmpAttr) + AttrVal,
        setelement(AttrIndex, TmpAttr, NewAttrVal)
    end,
    lists:foldl(AddAttrFun, Attr1, Attr2).

% @doc 计算attr乘以某个系数
% @spec mul_attr(Attr, Factor) -> AttrN.
% Attr = AttrN  :: #base_attr{} | #bt_attr{} | [{K,V}]
% Factor        :: number()
mul_attr(Attr, Factor) when is_list(Attr) andalso is_number(Factor) ->
    [{Type, trunc(Value * Factor)} || {Type, Value} <- Attr];
mul_attr(Attr, Factor) when (is_record(Attr, bt_attr) orelse is_record(Attr, base_attr)) andalso is_number(Factor) ->
    Size = erlang:tuple_size(Attr),
    mul_attr_by_index(Attr, Factor, 2, Size).

% @doc 属性结构转换(转Record)
% Record    :: #bt_attr{} | #base_attr{}
attr_to_record(bt_attr, Attr) when is_list(Attr) ->
    do_expand_attr(#bt_attr{}, Attr);
attr_to_record(bt_attr, #bt_attr{} = Attr) ->
    Attr;
attr_to_record(base_attr, Attr) when is_list(Attr) ->
    do_expand_attr(#base_attr{}, Attr);
attr_to_record(base_attr, #base_attr{} = BaseAttr) ->
    BaseAttr.

% @doc 基础属性转战斗属性
% @spec base_to_bt_attr(Career, BaseAttr) -> BtAttr.
% Career    :: integer()
% BaseAttrL -> BtAttrL  :: [{K, V}]
% BaseAttr -> BtAttr    :: #base_attr{} -> #bt_attr{}
base_to_bt_attr(Career, BaseAttrL) when is_list(BaseAttrL) ->
    ConvertConf = conf_attr_convert:get_convert(Career),
    ConvertFun = fun({BIndex, BValue}, AccBtAttr) ->
        BtAttrConf = element(BIndex, ConvertConf),
        BtAttrL = mul_attr(BtAttrConf, BValue),
        BtAttrL ++ AccBtAttr
    end,
    lists:foldl(ConvertFun, [], BaseAttrL);
base_to_bt_attr(Career, #base_attr{} = BaseAttr) ->
    BaseAttrL = attr_to_list(BaseAttr),
    BtAttrL = base_to_bt_attr(Career, BaseAttrL),
    attr_to_record(bt_attr, BtAttrL).


% @doc 修改属性
% @spec alter_attrs(BtAttr, Attrs) -> BtAttrN.
% BtAttr = BtAttrN      :: #bt_attr{}
% Attrs                 :: [{K :: integer(), V :: integer()}]
alter_attrs(BtAttr, Attrs) ->
    AlterFun = fun({K, V}, AccBtAttr) -> setelement(K, AccBtAttr, V) end,
    lists:foldl(AlterFun, BtAttr, Attrs).


% @doc 属性结构转换(转[{K,V}])
% K = V     :: integer()
attr_to_list(Attr) when is_record(Attr, bt_attr) orelse is_record(Attr, base_attr) ->
    [
        {Index - 1, element(Index, Attr)}
        || Index <- lists:seq(2, size(Attr))
    ];
attr_to_list(List) when is_list(List) ->
    lists:map(fun attr_to_list/1, List);
attr_to_list({_, _} = V) ->
    V.

% @doc 同类属性列表合并
merge_attr(AttrLists) when AttrLists =/= [] ->
    ConvertList = attr_to_list(AttrLists),
    FlattenList = lists:flatten(ConvertList),
    % 合并键值对
    AList = lists:foldl(fun({Type, Val}, Acc) ->
        case lists:keytake(Type, 1, Acc) of
            {value, {Type, Value}, Rest} -> [{Type, Value + Val} | Rest];
            false -> [{Type, Val} | Acc]
        end
    end, [], FlattenList),
    [{T, V} || {T, V} <- AList, V =/= 0];
merge_attr([]) ->
    [].


%% Privates -------------------------------------
get_bt_attr_power(AttrList) ->
    Power = lists:foldl(fun({Type, V}, PowerAcc) ->
        Arg = conf_combat_power_battle:get(Type),
        PowerAcc + V * Arg
    end, 0, AttrList),
    trunc(Power).

% 指定系数
get_bt_attr_power(Fun, AttrList) ->
    Power = lists:foldl(fun({Type, V}, PowerAcc) ->
        Arg = apply(conf_combat_power_battle, Fun, [Type]),
        PowerAcc + V * Arg
    end, 0, AttrList),
    trunc(Power).

get_base_attr_power(AttrList) ->
    Power = lists:foldl(fun({Type, V}, PowerAcc) ->
        Arg = conf_combat_power_base:get(Type),
        PowerAcc + V * Arg
    end, 0, AttrList),
    trunc(Power).

get_base_attr_power(Fun, AttrList) ->
    Power = lists:foldl(fun({Type, V}, PowerAcc) ->
        Arg = apply(conf_combat_power_base, Fun, [Type]),
        PowerAcc + V * Arg
    end, 0, AttrList),
    trunc(Power).

add_attr_by_index(Attr1, Attr2, Size, Size) ->
    NewValue = element(Size, Attr1) + element(Size, Attr2),
    setelement(Size, Attr1, NewValue);
add_attr_by_index(Attr1, Attr2, Index, Size) ->
    NewValue = element(Index, Attr1) + element(Index, Attr2),
    AttrNew = setelement(Index, Attr1, NewValue),
    add_attr_by_index(AttrNew, Attr2, Index + 1, Size).

mul_attr_by_index(Attr, Factor, Index, Size) when Index < Size ->
    NewValue = trunc(element(Index, Attr) * Factor),
    AttrNew = setelement(Index, Attr, NewValue),
    mul_attr_by_index(AttrNew, Factor, Index + 1, Size);
mul_attr_by_index(Attr, Factor, Size, Size) ->
    NewValue = trunc(element(Size, Attr) * Factor),
    setelement(Size, Attr, NewValue).

do_expand_attr(AttrRecAcc, [{AttrIndex, Value} | Attr]) ->
    do_expand_attr(setelement(AttrIndex + 1, AttrRecAcc, Value), Attr);
do_expand_attr(AttrRecAcc, []) ->
    AttrRecAcc.

% @doc 角色场景属性计算
% 注意：统一命名 Module:get_attr
calc_scene_attr(RoleState) ->
    % 依赖于基础属性的属性计算
    #role_state{career = Career, level = Level, base_attr = OriBaseAttr} = RoleState,
    {BaseAttr, BtAttr} = conf_career_attr:get_attr(Career, Level),

    % 其他不依赖于基础属性的属性计算
    #role_state{id = RoleID, career = Career, bt_data = BtData} = RoleState,
    {TitleBaseAttr, TitleBtAttr} = split_attr(lib_role_title:get_attr(RoleID)),
    {FashionBaseAttr, FashionBtAttr} = split_attr(lib_role_fashion:get_attr(RoleID)),
    {SurfaceBaseAttr, SurfaceBtAttr} = split_attr(lib_role_surface:get_attr(RoleID)),
    {HeroBaseAttr, HeroBtAttr} = split_attr(lib_role_hero:get_attr(RoleID)),
    {PracticeBaseAttr, PracticeBtAttr} = split_attr(lib_role_guild:get_practice_skills_attr(RoleID)),
    {MarryBaseAttr, MarryBtAttr} = split_attr(lib_role_marriage:get_attr(RoleID)),
    {PetBaseAttr, PetBtAttr} = split_attr(lib_role_pet:get_attr(RoleID)),
    {EquipBaseAttr, EquipBtAttr} = split_attr(lib_role_equip:get_attr(RoleID)),
    {ChannelBaseAttr, ChannelBtAttr} = split_attr(lib_role_channel:get_attr(RoleID)),
    {SmeltBaseAttr, SmeltBtAttr} = split_attr(lib_role_smelt:get_attr(RoleID)),
    {DragonBaseAttr, DragonBtAttr} = split_attr(lib_role_dragon:get_attr(RoleID)),
    {ArtifactAttr, ArtifactBtAttr} = split_attr(lib_role_artifact:get_attr(RoleID)),
    {AnqiAttr, AnqiBtAttr} = split_attr(lib_role_anqi:get_attr(RoleID)),
    {WarriorSoulAttr, WarriorSoulBtAttr} = split_attr(lib_role_warrior_soul:get_attr(RoleID)),
    {TitleHonorBaseAttr, TitleHonorBtAttr} = split_attr(lib_role_title_honor:get_attr(RoleID)),

    % 总基础属性
    ModuleBaseAttrL = [
        TitleBaseAttr, FashionBaseAttr, SurfaceBaseAttr, HeroBaseAttr,
        PracticeBaseAttr, PetBaseAttr, DragonBaseAttr, MarryBaseAttr,
        EquipBaseAttr, ChannelBaseAttr, SmeltBaseAttr, ArtifactAttr,
        AnqiAttr, WarriorSoulAttr, TitleHonorBaseAttr
    ],
    TotalBaseAttr = merge_attr([BaseAttr | ModuleBaseAttrL]),

    % 总战斗属性
    ModuleBtAttrL = [
        TitleBtAttr, FashionBtAttr, SurfaceBtAttr, HeroBtAttr, PracticeBtAttr,
        PetBtAttr, EquipBtAttr, ChannelBtAttr, DragonBtAttr, MarryBtAttr,
        SmeltBtAttr, ArtifactBtAttr, AnqiBtAttr, WarriorSoulBtAttr, TitleHonorBtAttr
    ],
    TotalBtAttr = merge_attr([BtAttr | ModuleBtAttrL]),

    % 总场景战斗属性
    TotalBaseConverted = base_to_bt_attr(Career, TotalBaseAttr),
    TotalSceneBtAttr = add_attr(TotalBtAttr, TotalBaseConverted),
    BtDataN = BtData#{bt_attr => attr_to_record(bt_attr, TotalSceneBtAttr)},
    NewBaseAttr = attr_to_record(base_attr, TotalBaseAttr),
    NewBtAttr = attr_to_record(bt_attr, TotalSceneBtAttr),
    OriBaseAttr =/= NewBaseAttr andalso router_901:send_base_attr_update(RoleState, NewBaseAttr),
    RoleState#role_state{base_attr = NewBaseAttr, bt_attr = NewBtAttr, bt_data = BtDataN}.

split_attr(AttrList) ->
    {BaseAttr, BtAttr} = lists:partition(fun({K, _V}) -> K > 100 end, AttrList),
    {[{K - 100, V} || {K, V} <- BaseAttr], BtAttr}.
