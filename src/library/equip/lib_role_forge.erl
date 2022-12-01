%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     锻造系统
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_forge).
-author("Ryuu").

-include("role.hrl").
-include("equip.hrl").
-include("goods.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_207.hrl").

%% API
-export([
    do/3
]).

do(20701, PS, #cs_refine_compose{bag_id = BagID, poses = Poses, type = Type}) ->
    compose(PS, BagID, Poses, Type);
do(20703, PS, #cs_refine_forge{id = ID, type = Type, opt = Opt}) ->
    forge(PS, ID, Type, Opt);
do(20711, PS, _) ->
    lib_role_forge_wheel:forge_wheel(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 道具合成
compose(PS, BagID, Poses, Type) ->
    case catch check_compose(PS, BagID, Poses, Type) of
        {ok, Costs, Rewards, ItemID} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_ITEM_COMPOSE),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_ITEM_COMPOSE),
            Rec = #sc_refine_compose{type = Type},
            {ok, Bin} = prot_msg:encode_msg(20702, Rec),
            lib_role_send:send_to_role(PS, Bin),
            compose_handler(PS, ItemID),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

compose_handler(PS, ItemID) ->
    #role_state{name = Name} = PS,
    case conf_equip_stone:get(ItemID) of
        #{level := Level} ->
            ?TASK_EVENT(PS, {adv_stone, Level});
        _ ->
            ignore
    end,
    case conf_paris_shoulder:get(ItemID) of
        #{} ->
            ParisRumor = config:get_sys_config(equip_paris_shoulder_compose_rumor),
            svr_rumor:publish(world, ParisRumor, [Name]);
        _ ->
            ignore
    end.

check_compose(PS, BagID, Poses, Type) ->
    length(Poses) =< 2 orelse erlang:throw({error, ?RC_FORGE_COMPOSE_TOO_MANY_CELL}),
    Poses =/= [] orelse erlang:throw({error, ?RC_FORGE_COMPOSE_NO_CELL}),
    #role_state{id = RoleID} = PS,
    {ItemID, BNum, BAcc, NNum, NAcc} = collect_compose_goods(Poses, RoleID, BagID),
    ConfCompose = conf_compose:get(ItemID),
    ConfCompose =/= undefined orelse erlang:throw({error, ?RC_FORGE_ITEM_CAN_NOT_COMPOSE}),
    #{num := NeedNum, target := TItemID} = ConfCompose,
    {CItems, RItems} = compose_cost_reward(Type, NeedNum, BNum, BAcc, NNum, NAcc),
    Costs = [{?AST_ITEM_C, CItems}],
    lib_role_assets:check_items_enough(PS, Costs),
    ItemList = [?bag_goods#{id => TItemID, num => Num, bind => Bind} || {Bind, Num} <- RItems, Num > 0],
    Rewards = [{?AST_ITEM, ItemList}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    {ok, Costs, Rewards, TItemID}.

collect_compose_goods(Poses, RoleID, BagID) ->
    collect_compose_goods(Poses, RoleID, BagID, 0, 0, [], 0, []).

collect_compose_goods([], _RoleID, _BagID, ItemID, BNum, BAcc, NNum, NAcc) ->
    {ItemID, BNum, BAcc, NNum, NAcc};
collect_compose_goods([Pos | T], RoleID, BagID, ItemID, BNum, BAcc, NNum, NAcc) ->
    Item = lib_role_goods:get_cell_item(RoleID, BagID, Pos),
    Item =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
    #{id := Gid, bind := Bind, num := Num} = Item,
    ItemID > 0 andalso Gid =/= ItemID andalso erlang:throw({error, ?RC_FORGE_COMPOSE_NOT_SAME_ITEM}),
    case Bind of
        ?GOODS_BIND ->
            collect_compose_goods(T, RoleID, BagID, Gid, BNum + Num, [Item | BAcc], NNum, NAcc);
        _ ->
            collect_compose_goods(T, RoleID, BagID, Gid, BNum, BAcc, NNum + Num, [Item | NAcc])
    end.

compose_cost_reward(Type, PerNum, BNum, BAcc, NNum, NAcc) ->
    MaxNum = erlang:floor((BNum + NNum) / PerNum),
    MaxNum > 0 orelse erlang:throw({error, ?RC_FORGE_COMPOSE_NOT_ENOUGH_ITEM}),
    {OBNum, ONNum} = if
        Type =:= 1 andalso BNum > PerNum -> {1, 0};
        Type =:= 1 andalso NNum > PerNum -> {0, 1};
        Type =:= 1 -> {1, 0};
        true -> {MaxNum - erlang:floor(NNum / PerNum), erlang:floor(NNum / PerNum)}
    end,
    NBNum = erlang:min(OBNum * PerNum, BNum),
    NNNum = ONNum * PerNum + erlang:max(OBNum * PerNum - BNum, 0),
    OItems = [{?GOODS_BIND, OBNum}, {?GOODS_UNBIND, ONNum}],
    {
        compose_cost(NBNum, BAcc, compose_cost(NNNum, NAcc, [])),
        [Item || {_Bind, Num} = Item <- OItems, Num > 0]
    }.

compose_cost(0, _Items, Acc) ->
    Acc;
compose_cost(N, [Item | T], Acc) ->
    #{pos := Pos, num := Num} = Item,
    case Num >= N of
        true ->
            [{Pos, N} | Acc];
        _ ->
            compose_cost(N - Num, T, [{Pos, Num} | Acc])
    end.

%% @doc 打造装备
forge(PS, ID, Type, Opt) ->
    case catch check_forge(PS, ID, Type, Opt) of
        {ok, Costs0, Costs1, Rewards, Opts, GoodsInfo, Star} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs0, ?OPT_FORGE_EQUIP),
            PS2 = lib_role_assets:cost_items_notify(PS1, Costs1, ?OPT_FORGE_EQUIP, Opts),
            PS3 = lib_role_assets:add_items_notify(PS2, Rewards, ?OPT_FORGE_EQUIP),
            Rec = #sc_refine_forge{id = ID, type = Type, item = GoodsInfo},
            {ok, Bin} = prot_msg:encode_msg(20704, Rec),
            lib_role_send:send_to_role(PS, Bin),
            forge_handler(PS, GoodsInfo, Star),
            PS3;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

forge_handler(PS, GoodsInfo, Star) ->
    ?TASK_EVENT(PS, {'forge_equip', Star}),
    Star > 7 andalso begin
        #role_state{name = Name} = PS,
        #goods_info{id = GoodsID} = GoodsInfo,
        Rumor = config:get_sys_config(equip_forge_rumor),
        svr_rumor:publish(world, Rumor, [Name, ?STR(Star), lib_goods_util:get_name(GoodsID)])
    end.

check_forge(PS, ID, Type, Opt) ->
    #role_state{id = RoleID, name = Name} = PS,
    Conf = conf_equip_forge:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_FORGE_CONF_NOT_FOUND}),
    #{materials := Materials, scores := Scores, items := Items} = Conf,
    ConfRatios = conf_equip_forge_ratio:get(Type),
    #{ratios := Ratios} = ConfRatios,
    {NewStar, _} = util:rand_by_weight(Ratios, 2),
    ItemID = util:prop_get_value(NewStar, Items),
    ItemID =/= undefined orelse erlang:throw({error, ?RC_FORGE_NO_STAR_CONF}),
    {Material0, Material1} = util:prop_get_value(Type, Materials, {[], []}),
    Score = util:prop_get_value(Type, Scores, 0),
    if
        Type =:= 1 ->
            Opts = [],
            Bind = 0;
        Opt =:= 1 ->
            Opts = [{goods_opt, ?GOODS_OPT_N bor ?GOODS_OPT_T}],
            Bind = 0;
        true ->
            Opts = [],
            Bind = ?iif(lib_goods_util:has_bind_item(RoleID, Material1), 1, 0)
    end,
    Costs0 = [{?AST_ITEM, Material0}],
    Costs1 = [{?AST_ITEM, Material1}],
    lib_role_assets:check_items_enough(PS, Costs0),
    lib_role_assets:check_items_enough(PS, Costs1, Opts),
    FItem = lib_goods_util:gen_attr(?goods_basic#{id => ItemID, num => 1, bind => Bind, extra => [Name]}),
    GoodsInfo = lib_goods_util:convert_goods_info(maps:merge(?bag_goods, FItem)),
    Rewards = [{?AST_ITEM, [FItem]}, {?AST_FORGE_S, Score}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    {ok, Costs0, Costs1, Rewards, Opts, GoodsInfo, NewStar}.
