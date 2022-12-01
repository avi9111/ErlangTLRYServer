%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     熔炼
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_smelt).
-author("Ryuu").

-include("role.hrl").
-include("goods.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_422.hrl").

%% API
-export([
    do/3,
    get_attr/1,
    get_fight/1,
    send_info/1,
    get_role_data/1
]).

-define(VERSION, 1).

-define(role_smelt, #{
    version => ?VERSION,
    role_id => 0,
    level => 0,
    exp => 0,
    attr => [],
    fight => 0,
    soul => []
}).

do(42201, PS, #cs_smelt_info{}) ->
    send_info(PS);
do(42203, PS, #cs_smelt_do{poses = Poses}) ->
    smelt_goods(PS, Poses);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{level := Level, exp := Exp, soul := Soul} = RoleData,
    Rec = #sc_smelt_info{level = Level, exp = Exp, soul = Soul},
    {ok, Bin} = prot_msg:encode_msg(42202, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 熔炼装备
smelt_goods(PS, Poses) ->
    case catch check_smelt_goods(PS, Poses) of
        {ok, RoleID, RoleData, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_BAG_SMELT),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_BAG_SMELT),
            update_role_data(RoleID, RoleData),
            ?TASK_EVENT(RoleID, {smelt_equip, length(Poses)}),
            #{level := Level, exp := Exp, soul := Soul} = RoleData,
            Rec = #sc_smelt_do{level = Level, exp = Exp, soul = Soul},
            {ok, Bin} = prot_msg:encode_msg(42204, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_role_attr:refresh_combat_power(PS2);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_smelt_goods(PS, Poses) ->
    #role_state{id = RoleID, career = Career} = PS,
    RoleData = get_role_data(RoleID),
    util:is_list_uniq(Poses) orelse erlang:throw({error, ?RC_GOODS_SMELT_DUP_GOODS}),
    Poses =/= [] orelse erlang:throw({error, ?RC_GOODS_SMELT_POSES_EMPTY}),
    GoodsList = lib_role_goods:get_cell_items(RoleID, ?BAG_ID_ITEM, Poses),
    Now = time:unixtime(),
    SoulRate = config:get_sys_config(smelt_soul_rate),
    SoulStar = config:get_sys_config(smelt_soul_star),
    {Rewards, Anima, Costs, STimes} = collect_smelt_goods(GoodsList, [SoulRate, SoulStar, Now], [], 0, [], 0),
    lib_role_assets:check_items_enough(PS, Costs),
    lib_role_assets:check_can_add_items(PS, Rewards),
    #{level := Level, exp := Exp, soul := Soul} = RoleData,
    {NewLevel, NewExp} = add_smelt_exp(Level, Anima + Exp),
    NewSoul = add_smelt_soul(STimes, Soul),
    NewData = set_smelt_attr(RoleData#{level => NewLevel, exp => NewExp, soul => NewSoul}, Career),
    {ok, RoleID, NewData, Costs, Rewards}.

collect_smelt_goods([], _Now, CoinAcc, AnimaAcc, CostAcc, SoulAcc) ->
    {lib_role_assets:merge_add_items(CoinAcc), AnimaAcc, [{?AST_ITEM_C, CostAcc}], SoulAcc};
collect_smelt_goods([undefined | _T], _Now, _GainAcc, _AnimaAcc, _CostAcc, _SoulAcc) ->
    erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND});
collect_smelt_goods([Goods | T], Arg, CoinAcc, AnimaAcc, CostAcc, SoulAcc) ->
    [SoulRate, SoulStar, Now] = Arg,
    #{id := Gid, num := Num, pos := Pos, expire := Expire} = Goods,
    Expire =:= 0 orelse Expire > Now orelse erlang:throw({error, ?RC_GOODS_TIME_EXPIRED}),
    ConfGoods = conf_goods:get(Gid),
    #{sell := Coin, smelt := Anima, star := Star} = ConfGoods,
    Anima > 0 orelse erlang:throw({error, ?RC_GOODS_CAN_NOT_SMELT}),
    lib_goods_util:is_forge_equip(Gid),
    NewCostAcc = [{Pos, Num} | CostAcc],
    NewSoulAcc = ?iif(Star >= SoulStar andalso util:is_bingo(SoulRate), SoulAcc + 1, SoulAcc),
    collect_smelt_goods(T, Arg, Coin ++ CoinAcc, Anima + AnimaAcc, NewCostAcc, NewSoulAcc).

add_smelt_exp(Level, Exp) ->
    case conf_smelt:get(Level) of
        #{cost := Cost} when Exp >= Cost ->
            add_smelt_exp(Level + 1, Exp - Cost);
        #{cost := 0} ->
            {Level, 0};
        _ ->
            {Level, Exp}
    end.

add_smelt_soul(Times, Soul) ->
    IDList = conf_smelt_soul:get_ids(),
    add_smelt_soul(Times, IDList, Soul).

add_smelt_soul(0, _, Acc) ->
    Acc;
add_smelt_soul(_, [], Acc) ->
    Acc;
add_smelt_soul(N, L, Acc) ->
    ID = util:list_rand(L),
    MaxLv = conf_smelt_soul_lv:max_lv(ID),
    case util:prop_get_value(ID, Acc, 0) of
        Lv when Lv < MaxLv ->
            add_smelt_soul(N - 1, L, util:prop_store(ID, Lv + 1, Acc));
        true ->
            add_smelt_soul(N, lists:delete(ID, L), Acc)
    end.

%% -----------------------------------------------------------------------------
%% 属性
%% -----------------------------------------------------------------------------

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

get_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

set_smelt_attr(RoleData, Career) ->
    #{level := Level, soul := Soul} = RoleData,
    Conf = conf_smelt:get(Level),
    #{attr := SmeltAttr} = Conf,
    SoulAttr = calc_soul_attr(Soul, Career, []),
    Attr = lib_role_attr:merge_attr([SmeltAttr, SoulAttr]),
    Fight = lib_role_attr:calc_combat_power(Attr),
    RoleData#{attr => Attr, fight => Fight}.

calc_soul_attr([], _Career, Acc) ->
    Acc;
calc_soul_attr([{ID, Lv} | T], Career, Acc) ->
    case conf_smelt_soul_lv:get({ID, Lv}) of
        #{attr := Attr} ->
            NewAcc = util:prop_get_value(Career, Attr, []) ++ Acc,
            calc_soul_attr(T, Career, NewAcc);
        _ ->
            calc_soul_attr(T, Career, Acc)
    end.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

get_role_data(RoleID) ->
    case lib_role_data:get_value(RoleID, ?KEY_SMELT) of
        #{version := ?VERSION} = RoleData ->
            RoleData;
        #{} = RoleData ->
            RoleData#{soul => [], version => ?VERSION};
        _ ->
            ?role_smelt#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData).

set_role_data(RoleID, RoleData) ->
    lib_role_data:put_value(RoleID, ?KEY_SMELT, RoleData).
