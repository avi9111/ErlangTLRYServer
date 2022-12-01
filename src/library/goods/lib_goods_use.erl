%%-------------------------------------------------------
%% @File     : lib_goods_use.erl
%% @Brief    : 使用物品逻辑
%% @Author   : cablsbs
%% @Date     : 2018-11-12
%%-------------------------------------------------------
-module(lib_goods_use).

-include("pet.hrl").
-include("role.hrl").
-include("goods.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").

-export([
    use_goods/4
]).


-define(ONCE_TYPE, [?GEFFECT_GAIN_GOODS, ?GEFFECT_WITH_CAREER, ?GEFFECT_GIVE_GOODS]).

%% Apis -------------------------------------------------

%% 使用物品逻辑
use_goods(#role_state{id = RoleId, stat = Stat} = PS, Pos, UseNum, Arg) ->
    lib_role_battle:is_in_jail(Stat) andalso throw({error, ?RC_GOODS_IN_SPECIAL_STAT}),
    UseNum > 0 orelse throw({error, ?RC_GOODS_ILLEGAL_NUM}),
    Goods = lib_role_goods:get_cell_item(RoleId, ?BAG_ID_ITEM, Pos),
    Goods =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
    #{id := GoodsId, num := Num, expire := Expire} = Goods,
    Num >= UseNum orelse throw({error, ?RC_GOODS_ITEM_NOT_ENOUGH}),
    Expire =:= 0 orelse Expire > time:unixtime() orelse throw({error, ?RC_GOODS_TIME_EXPIRED}),
    {EffectTypeFixed, UseEffect, UseLmt, OnceType} = do_get_goods_effect(GoodsId, Arg, UseNum, false),
    check_use_lmt(PS, UseLmt),
    OnceNum = ?iif(OnceType, 1, UseNum),
    use_once(PS, EffectTypeFixed, Goods, UseNum, OnceNum, UseEffect, 0).

use_once(PS, _EffectTypeFixed, #{pos := Pos}, TotalNum, OnceNum, _UseEffect, Acc) when TotalNum < OnceNum ->
    use_goods(PS, [{?AST_ITEM_C, [{Pos, Acc}]}]);
use_once(PS, EffectTypeFixed, #{pos := Pos} = Goods, TotalNum, OnceNum, UseEffect, Acc) ->
    case catch do_use_goods(PS, EffectTypeFixed, Goods, OnceNum, UseEffect) of
        ok ->
            use_once(PS, EffectTypeFixed, Goods, TotalNum - OnceNum, OnceNum, UseEffect, Acc + OnceNum);
        NewPS when is_record(NewPS, role_state) ->
            use_once(NewPS, EffectTypeFixed, Goods, TotalNum - OnceNum, OnceNum, UseEffect, Acc + OnceNum);
        {ok, NewPS} when is_record(NewPS, role_state) ->
            use_once(NewPS, EffectTypeFixed, Goods, TotalNum - OnceNum, OnceNum, UseEffect, Acc + OnceNum);
        {error, Code} when Acc > 0 ->
            ?ERROR_TOC(PS, Code),
            use_goods(PS, [{?AST_ITEM_C, [{Pos, Acc}]}]);
        {error, Code} ->
            {error, Code}
    end.

use_goods(PS, Costs) ->
    PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_USE_GOODS),
    {ok, PS1}.

%% Privates ---------------------------------------------

do_get_goods_effect(GoodsId, Arg, UseNum, Acc) ->
    GoodsEffect = conf_goods_effect:conf(GoodsId),
    GoodsEffect =/= undefined orelse throw({error, ?RC_GOODS_CAN_NOT_USE}),
    #{effect_type := EffectType, use_lmt := UseLmt, max_use_num := MaxUseNum, effect := GEffect} = GoodsEffect,
    UseNum =< MaxUseNum orelse throw({error, ?RC_GOODS_ILLEGAL_NUM}),
    Once = Acc orelse lists:member(EffectType, ?ONCE_TYPE),
    case EffectType of
        ?GEFFECT_WITH_ARG when Arg > 0 andalso Arg =< size(GEffect) ->
            ChooseGoodsId = element(Arg, GEffect),
            case conf_goods_effect:conf(ChooseGoodsId) of
                undefined ->
                    {?GEFFECT_GIVE_GOODS, ChooseGoodsId, UseLmt, Once};
                _ ->
                    do_get_goods_effect(ChooseGoodsId, 0, UseNum, Once)
            end;
        ?GEFFECT_WITH_ARG ->
            throw({error, ?RC_GOODS_ILLEGAL_ARG});
        _ ->
            {EffectType, GEffect, UseLmt, Once}
    end.

check_use_lmt(#role_state{level = Level}, [{?GUSE_LEVEL_LMT, LvLmt} | _]) when Level < LvLmt ->
    throw({error, ?RC_GOODS_LEVEL_LMT});
check_use_lmt(#role_state{career = Career}, [{?GUSE_CAREER_LMT, CareerLmt} | _]) when Career =/= CareerLmt ->
    throw({error, ?RC_GOODS_CAREER_LMT});
check_use_lmt(#role_state{role_scene = RoleScene} = RoleState, [{?GUSE_SCENE_TYPE, SceneType} | Rest]) ->
    #role_scene{scene_id = SceneId} = RoleScene,
    lib_scene_api:is_scene_of_type(SceneId, SceneType) orelse throw({error, ?RC_GOODS_SCENE_LMT}),
    check_use_lmt(RoleState, Rest);
check_use_lmt(PS, [_ | Rest]) ->
    check_use_lmt(PS, Rest);
check_use_lmt(_PS, []) ->
    ok.

% @doc 具体使用物品逻辑(按效果)
% @spec do_use_goods(PS, EffectType, UseNum, UseEffect) -> ok | {ok, NewPS} | {error, RetCode}
% PS = NewPS                        :: integer()
% EffectType = UseNum = RetCode     :: integer()
% UseEffect                         :: term()
do_use_goods(PS, ?GEFFECT_GAIN_GOODS, _, UseNum, DropId) ->
    Rewards = lib_drop_base:get_drop_goods([{DropId, UseNum}]),
    lib_role_assets:check_can_add_items(PS, Rewards),
    lib_role_assets:add_items_notify(PS, Rewards, ?OPT_USE_GOODS_GAIN);
do_use_goods(PS, ?GEFFECT_GAIN_PET, _, _UseNum, UseEffect) ->
    lib_role_pet:active_pet_with_effect(PS, UseEffect, false),
    ok;
do_use_goods(PS, ?GEFFECT_WITH_CAREER, _, UseNum, UseEffect) ->
    case lists:keyfind(PS#role_state.career, 1, UseEffect) of
        {_Career, DropId} ->
            Rewards = lib_drop_base:get_drop_goods([{DropId, UseNum}]),
            lib_role_assets:check_can_add_items(PS, Rewards),
            lib_role_assets:add_items_notify(PS, Rewards, ?OPT_USE_GOODS_GAIN);
        _ ->
            {error, ?RC_GOODS_USE_EFFECT_ERROR}
    end;
do_use_goods(PS, ?GEFFECT_ARTIFACT_AVATAR, _, _UseNum, UseEffect) ->
    case lists:keyfind(PS#role_state.career, 1, UseEffect) of
        {_Career, AvatarId} ->
            NewPS = lib_role_artifact:activate_avatar(PS, AvatarId),
            {ok, NewPS};
        _ ->
            {error, ?RC_GOODS_USE_EFFECT_ERROR}
    end;
do_use_goods(PS, ?GEFFECT_SOUL_AVATAR, _, _UseNum, {AvatarId, ValidTime}) ->
    NewPS = lib_role_warrior_soul:activate_avatar(PS, AvatarId, ValidTime),
    {ok, NewPS};
do_use_goods(PS, ?GEFFECT_GAIN_HORSE, _, _UseNum, UseEffect) ->
    lib_role_exterior:active_horse_with_effect(PS, UseEffect),
    ok;
do_use_goods(PS, ?GEFFECT_CLR_MURDEROUS, _, _UseNum, UseEffect) ->
    case PS#role_state.murderous > 0 of
        true ->
            ?ERROR_TOC(PS#role_state.id, ?RC_BATTLE_PILL_CLR_MURDEROUS),
            NewPS = lib_role_battle:update_murderous(PS, {del, UseEffect}),
            {ok, NewPS};
        _ ->
            {error, ?RC_BATTLE_NO_MURDEROUS_TO_CLR}
    end;
do_use_goods(PS, ?GEFFECT_ACTIVE_FASHION, _, _UseNum, {FashionID, Time}) ->
    lib_role_fashion:activate(PS, FashionID, Time);
do_use_goods(PS, ?GEFFECT_ADD_ROLE_HP, #{id := ItemID}, _UseNum, {Basic, Mul}) ->
    #role_state{level = Level} = PS,
    add_unit_hp_mp(PS, ItemID, Basic + Level * Mul, 0, 0);
do_use_goods(PS, ?GEFFECT_ADD_ROLE_MP, #{id := ItemID}, _UseNum, {Basic, Mul}) ->
    #role_state{level = Level} = PS,
    add_unit_hp_mp(PS, ItemID, 0, Basic + Level * Mul, 0);
do_use_goods(PS, ?GEFFECT_ADD_PET_HP, #{id := ItemID}, _UseNum, {Basic, Mul}) ->
    case lib_role_pet:get_pet(1) of
        #{stat := ?PET_STAT_FIGHT, level := Level} ->
            add_unit_hp_mp(PS, ItemID, 0, 0, Basic + Level * Mul);
        _ ->
            erlang:throw({error, ?RC_PET_NO_FIGHT_PET})
    end;
do_use_goods(PS, ?GEFFECT_ACTIVE_TITLE, _, _UseNum, TitleID) ->
    lib_role_title:activate(PS, TitleID);
do_use_goods(PS, ?GEFFECT_PET_EXP_PILL, #{effect := IPillExp}, UseNum, EPillExp) ->
    PillExp = ?iif(IPillExp > 0, IPillExp, EPillExp),
    lib_role_pet:use_pill(PS, PillExp * UseNum);
do_use_goods(PS, ?GEFFECT_GUILD_LUCKY_MONEY, _, _, ID) ->
    lib_role_guild:lucky_money(PS, ID);
do_use_goods(PS, ?GEFFECT_ACTIVE_HERO, _, _, ID) ->
    lib_role_hero:active_by_item(PS, ID);
do_use_goods(PS, ?GEFFECT_GIVE_GOODS, _, UseNum, ID) ->
    Rewards = [{?AST_ITEM, [{ID, UseNum}]}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    lib_role_assets:add_items_notify(PS, Rewards, ?OPT_USE_GOODS_GAIN);
do_use_goods(PS, ?GEFFECT_GOODS_CHARGE, _, _, ProductId) ->
    lib_recharge:pay_by_goods(PS, ProductId);
do_use_goods(PS, ?GEFFECT_TL_DAN, _, UseNum, _) ->
    lib_role_kill_mon_exp:use_tl(PS, UseNum);
do_use_goods(PS, ?GEFFECT_DL_DAN, _, UseNum, _) ->
    lib_role_kill_mon_exp:use_dl(PS, UseNum);
do_use_goods(PS, ?GEFFECT_GAIN_BUBBLE, _, _UseNum, UseEffect) ->
    lib_role_exterior:active_bubble_with_effect(PS, UseEffect),
    ok;
do_use_goods(PS, ?GEFFECT_GAIN_FRAME, _, _UseNum, UseEffect) ->
    lib_role_exterior:active_frame_with_effect(PS, UseEffect),
    ok;
do_use_goods(PS, ?GEFFECT_GAIN_ACTION, _, _UseNum, UseEffect) ->
    lib_role_exterior:active_action_with_effect(PS, UseEffect),
    ok;
do_use_goods(PS, ?GEFFECT_TRANS, _, _UseNum, {ID, Time}) ->
    lib_role_trans:trans(PS, ID, Time);
do_use_goods(_PS, EffectType, _, _UseNum, _UseEffect) ->
    ?ERROR("Use unknown EffectType: ~p good !", [EffectType]),
    {error, ?RC_GOODS_UNKNOWN_GEFFECT_TYPE}.

add_unit_hp_mp(PS, ID, HVal, MVal, MHVal) ->
    check_auto_use_cd(ID),
    #role_state{id = RoleID, role_scene = #role_scene{line_pid = LinePid}} = PS,
    svr_scene_agent:push_cmd(LinePid, {'add_unit_hp_mp', {RoleID, HVal, MVal, MHVal}}),
    ok.

check_auto_use_cd(ID) ->
    List = config:get_sys_config(auto_use_item),
    case util:prop_get_value(ID, List) of
        Span when is_integer(Span) ->
            util:check_action_limit({auto_use_item, ID}, Span);
        _ ->
            ok
    end.
