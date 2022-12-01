%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     玩家经脉
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_channel).
-author("Ryuu").

-include("role.hrl").
-include("equip.hrl").
-include("goods.hrl").
-include("channel.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_419.hrl").

-export([
    do/3,
    init/1,
    save/1,
    event/2,
    get_attr/1,
    get_fight/1,
    send_info/1,
    recalc_attr/1,
    handle_info/2,
    get_role_data/1,
    init_channels/3,
    convert_channels/1
]).

handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(PS, _) ->
    PS.

do(41901, PS, _) ->
    send_info(PS);
do(41903, PS, #cs_channel_active{id = ID, hero = HeroID}) ->
    active(PS, ID, HeroID);
do(41905, PS, #cs_channel_cult{id = ID, type = Type}) ->
    cult_potential(PS, ID, Type);
do(41907, PS, #cs_channel_change{id = ID, type = Type, attr = TAttrType}) ->
    change_potential(PS, ID, Type, TAttrType);
do(41909, PS, #cs_channel_wear{id = ID, pos = CPos}) ->
    wear_equip(PS, ID, CPos);
do(41911, PS, #cs_channel_take_off{id = ID, pos = EPos}) ->
    take_off(PS, ID, EPos);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{channels := Channels} = RoleData,
    Rec = #sc_channel_info{
        channels = convert_channels(Channels)
    },
    {ok, Bin} = prot_msg:encode_msg(41902, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_channels(Channels) when is_list(Channels) ->
    convert_channels(Channels, []);
convert_channels(Channels) ->
    convert_channels(util:dict_values(Channels), []).

convert_channels([], Acc) ->
    Acc;
convert_channels([Channel | T], Acc) ->
    CltChannel = convert_channel(Channel),
    convert_channels(T, [CltChannel | Acc]).

convert_channel(Channel) ->
    #{id := ID, hero := HeroID, lv := Lv, equips := Equips, potentials := Potentials} = Channel,
    #clt_channel{
        id = ID, hero = HeroID, level = Lv, equips = Equips, potentials = Potentials
    }.

active(PS, ID, HeroID) ->
    case catch check_active(PS, ID, HeroID) of
        {ok, RoleID, RoleData} ->
            update_role_data(RoleID, RoleData),
            #{channels := Channels} = RoleData,
            Rec = #sc_channel_active{channels = convert_channels(Channels)},
            {ok, Bin} = prot_msg:encode_msg(41904, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_active(PS, ID, HeroID) ->
    #role_state{id = RoleID, level = RoleLv, career = Career} = PS,
    RoleData = get_role_data(RoleID),
    #{channels := Channels} = RoleData,
    Conf = conf_channel:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_CHANNEL_NO_CONF}),
    #{level := NeedRoleLv, init := InitPotentials} = Conf,
    RoleLv >= NeedRoleLv orelse erlang:throw({error, ?RC_CHANNEL_ROLE_LV_LIMIT}),
    Hero = lib_role_hero:get_hero(RoleID, HeroID),
    Hero =/= undefined orelse erlang:throw({error, ?RC_HERO_NOT_ACTIVE}),
    #{level := HeroLv} = Hero,
    NeedHeroLv = config:get_sys_config(channel_active_hero_lv),
    HeroLv >= NeedHeroLv orelse erlang:throw({error, ?RC_CHANNEL_HERO_LV_LIMIT}),
    Channel = util:dict_find(ID, Channels, ?channel#{id => ID, potentials => InitPotentials}),
    #{hero := CurID} = Channel,
    CurID =/= HeroID orelse erlang:throw({error, ?RC_CHANNEL_SAME_HERO}),
    Channels1 = resolve_conflict(Channels, HeroID, Career),
    NewChannel = Channel#{hero => HeroID},
    NewData = set_channel(RoleData#{channels => Channels1}, ID, NewChannel, Career),
    {ok, RoleID, NewData}.

resolve_conflict(Channels, HeroID, Career) ->
    dict:fold(fun(ID, #{hero := HID} = C, Acc) ->
        case HeroID =:= HID of
            true -> dict:store(ID, set_channel_attr(C#{hero => 0}, Career), Acc);
            _ -> Acc
        end
    end, Channels, Channels).

cult_potential(PS, ID, Type) ->
    case catch check_cult_potential(PS, ID, Type) of
        {ok, RoleID, RoleData, Costs, Val} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_CHANNEL_CULT),
            update_role_data(RoleID, RoleData),
            Rec = #sc_channel_cult{id = ID, type = Type, val = Val},
            {ok, Bin} = prot_msg:encode_msg(41906, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_cult_potential(PS, ID, Type) ->
    lists:member(Type, ?POTENTIAL_TYPES) orelse erlang:throw({error, ?RC_CHANNEL_INVALID_TYPE}),
    #role_state{id = RoleID, career = Career} = PS,
    {ok, RoleData, Channel} = check_get_channel(RoleID, ID),
    #{potentials := Potentials} = Channel,
    Potential = lists:keyfind(Type, 1, Potentials),
    Potential =/= false orelse erlang:throw({error, ?RC_CHANNEL_POTENTIAL_NOT_FOUND}),
    {_Type, AttrType, Pert} = Potential,
    Material = conf_channel_cult:get_cost(Pert),
    Costs = [{?AST_ITEM, Material}],
    lib_role_assets:check_items_enough(PS, Costs),
    Pert < 10000 orelse erlang:throw({error, ?RC_CHANNEL_MAX_POTENTIAL}),
    Weight = config:get_sys_config(channel_cult_weight),
    {AddPert, _} = util:rand_by_weight(Weight, 2),
    NewVal = erlang:min(Pert + AddPert, 10000),
    NewPotentials = lists:keystore(Type, 1, Potentials, {Type, AttrType, NewVal}),
    NewChannel = Channel#{potentials => NewPotentials},
    NewData = set_channel(RoleData, ID, NewChannel, Career),
    {ok, RoleID, NewData, Costs, NewVal}.

change_potential(PS, ID, Type, TAttrType) ->
    case catch check_change_potential(PS, ID, Type, TAttrType) of
        {ok, RoleID, RoleData, Costs, NewVal} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_CHANNEL_CHANGE),
            update_role_data(RoleID, RoleData),
            Rec = #sc_channel_change{
                id = ID, type = Type, attr = TAttrType, val = NewVal
            },
            {ok, Bin} = prot_msg:encode_msg(41908, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_change_potential(PS, ID, Type, TAttrType) ->
    lists:member(Type, ?POTENTIAL_TYPES) orelse erlang:throw({error, ?RC_CHANNEL_INVALID_TYPE}),
    #role_state{id = RoleID, career = Career} = PS,
    {ok, RoleData, Channel} = check_get_channel(RoleID, ID),
    #{potentials := Potentials} = Channel,
    Potential = lists:keyfind(Type, 1, Potentials),
    Potential =/= false orelse erlang:throw({error, ?RC_CHANNEL_POTENTIAL_NOT_FOUND}),
    {_Type, AttrType, Pert} = Potential,
    AttrType =/= TAttrType orelse erlang:throw({error, ?RC_CHANNEL_SAME_POTENTIAL}),
    TConf = conf_channel_potential:get(TAttrType),
    TConf =/= undefined orelse erlang:throw({error, ?RC_CHANNEL_NO_POTENTIAL_CONF}),
    #{type := TPType} = TConf,
    TPType =:= Type orelse erlang:throw({error, ?RC_CHANNEL_DIFF_POTENTIAL_TYPE}),
    Material = config:get_sys_config(channel_change_potential_cost),
    Costs = [{?AST_ITEM, Material}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewPotentials = lists:keystore(Type, 1, Potentials, {Type, TAttrType, Pert}),
    NewChannel = Channel#{potentials => NewPotentials},
    NewData = set_channel(RoleData, ID, NewChannel, Career),
    {ok, RoleID, NewData, Costs, Pert}.

wear_equip(PS, ID, CPos) ->
    case catch check_wear_equip(PS, ID, CPos) of
        {ok, RoleID, RoleData, Costs, Rewards, Equips} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_CHANNEL_WEAR),
            PS2 = lib_role_assets:cost_items_notify(PS1, Rewards, ?OPT_CHANNEL_WEAR),
            update_role_data(RoleID, RoleData),
            Rec = #sc_channel_wear{id = ID, equips = Equips},
            {ok, Bin} = prot_msg:encode_msg(41910, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS2);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_wear_equip(PS, ID, CPos) ->
    #role_state{id = RoleID, career = Career} = PS,
    {ok, RoleData, Channel} = check_get_channel(RoleID, ID),
    #{equips := Equips} = Channel,
    Item = lib_role_goods:get_cell_item(RoleID, ?BAG_ID_ITEM, CPos),
    Item =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
    #{id := Gid} = Item,
    lib_goods_util:is_channel_equip(Gid) orelse erlang:throw({error, ?RC_GOODS_NOT_CHANNEL_EQUIP}),
    ConfGoods = conf_goods:get(Gid),
    #{pos := EPos, color := EColor} = ConfGoods,
    check_equip_pos(EPos),
    PType = conf_channel_equip_pos:get_by_pos(EPos),
    #{potentials := Potentials} = Channel,
    Potential = lists:keyfind(PType, 1, Potentials),
    Potential =/= false orelse erlang:throw({error, ?RC_CHANNEL_POTENTIAL_NOT_FOUND}),
    {_Type, _AttrType, Pert} = Potential,
    CColor = conf_channel_cult:get_color(Pert),
    CColor >= EColor orelse erlang:throw({error, ?RC_CHANNEL_EQUIP_COLOR_LIMIT}),
    {NewEquips, Items} = switch_equip(Equips, EPos, Gid),
    Costs = [{?AST_ITEM_C, [{CPos, 1}]}],
    lib_role_assets:check_items_enough(PS, Costs),
    Rewards = [{?AST_ITEM, Items}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewChannel = Channel#{equips => NewEquips},
    NewData = set_channel(RoleData, ID, NewChannel, Career),
    {ok, RoleID, NewData, Costs, Rewards, NewEquips}.

take_off(PS, ID, EPos) ->
    case catch check_take_off(PS, ID, EPos) of
        {ok, RoleID, RoleData, Rewards, NewEquips} ->
            PS1 = lib_role_assets:add_items_notify(PS, Rewards, ?OPT_CHANNEL_TAKE_OFF),
            update_role_data(RoleID, RoleData),
            Rec = #sc_channel_take_off{id = ID, equips = NewEquips},
            {ok, Bin} = prot_msg:encode_msg(41912, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_take_off(PS, ID, EPos) ->
    check_equip_pos(EPos),
    #role_state{id = RoleID, career = Career} = PS,
    {ok, RoleData, Channel} = check_get_channel(RoleID, ID),
    #{equips := Equips} = Channel,
    {NewEquips, Items} = switch_equip(Equips, EPos, 0),
    Rewards = [{?AST_ITEM, Items}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewChannel = Channel#{equips => NewEquips},
    NewData = set_channel(RoleData, ID, NewChannel, Career),
    {ok, RoleID, NewData, Rewards, NewEquips}.

check_equip_pos(EPos) ->
    lists:member(EPos, ?EQUIP_POS_CHANNEL) orelse erlang:throw({error, ?RC_CHANNEL_INVALID_EQUIP_POS}).

check_get_channel(RoleID, ID) ->
    RoleData = get_role_data(RoleID),
    #{channels := Channels} = RoleData,
    Channel = util:dict_find(ID, Channels),
    Channel =/= undefined orelse erlang:throw({error, ?RC_CHANNEL_NOT_ACTIVATED}),
    #{hero := HeroID} = Channel,
    HeroID > 0 orelse erlang:throw({error, ?RC_CHANNEL_NOT_ACTIVATED}),
    {ok, RoleData, Channel}.

set_channel(RoleData, ID, Channel, Career) ->
    #{channels := Channels} = RoleData,
    NewChannel = set_channel_attr(Channel, Career),
    NewChannels = dict:store(ID, NewChannel, Channels),
    set_channels_attr(RoleData#{channels => NewChannels}).

switch_equip(Equips, Pos, Gid) ->
    Oid = util:prop_get_value(Pos, Equips, 0),
    if
        Oid =:= 0 andalso Gid =:= 0 ->
            erlang:throw({error, ?RC_CHANNEL_NOT_WEAR_EQUIP});
        Oid =:= 0 ->
            {util:prop_store(Pos, Gid, Equips), []};
        Gid =:= 0 ->
            {util:prop_delete(Pos, Equips), [?goods_basic#{id => Oid, num => 1, bind => 1}]};
        true ->
            {util:prop_store(Pos, Gid, Equips), [?goods_basic#{id => Oid, num => 1, bind => 1}]}
    end.

refresh_attr(PS) ->
    lib_role_attr:refresh_combat_power(PS).

recalc_attr(PS) ->
    #role_state{id = RoleID, career = Career} = PS,
    RoleData = get_role_data(RoleID),
    #{channels := Channels} = RoleData,
    NewChannels = recalc_attr(util:dict_values(Channels), Career, dict:new()),
    NewData = RoleData#{channels => NewChannels},
    set_channels_attr(NewData).

recalc_attr([], _Career, Acc) ->
    Acc;
recalc_attr([Channel | T], Career, Acc) ->
    #{id := ID} = Channel,
    NewChannel = set_channel_attr(Channel, Career),
    recalc_attr(T, Career, dict:store(ID, NewChannel, Acc)).

get_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

set_channels_attr(RoleData) ->
    #{channels := Channels} = RoleData,
    Attr = sum_channels_attr(util:dict_values(Channels), []),
    Fight = lib_role_attr:calc_combat_power(Attr),
    RoleData#{attr => Attr, fight => Fight}.

sum_channels_attr([], Acc) ->
    Acc;
sum_channels_attr([Channel | T], Acc) ->
    #{attr := Attr} = Channel,
    sum_channels_attr(T, Attr ++ Acc).

set_channel_attr(Channel, Career) ->
    #{hero := HeroID, equips := Equips, potentials := Potentials} = Channel,
    Hero = lib_role_hero:get_hero(?ROLE_ID, HeroID),
    HeroAttr = calc_hero_attr(Hero, Career),
    PotentialAttr = calc_potential_attr(Potentials, HeroID, Equips, []),
    Attr = lib_role_attr:merge_attr([
        HeroAttr, PotentialAttr
    ]),
    Channel#{attr => Attr}.

calc_hero_attr(#{id := HeroID, level := HeroLv}, Career) ->
    Conf = conf_hero_level:get({HeroID, HeroLv}),
    #{attr_ch := AttrChs} = Conf,
    util:prop_get_value(Career, AttrChs, []);
calc_hero_attr(_, _) ->
    [].

calc_potential_attr([], _Hero, _Equips, Acc) ->
    Acc;
calc_potential_attr([{PType, AType, Pert} | T], HeroID, Equips, Acc) ->
    EPos = conf_channel_equip_pos:get_by_type(PType),
    Conf = conf_channel_potential:get(AType),
    #{limit := Limit} = Conf,
    Eid = util:prop_get_value(EPos, Equips, 0),
    EVal = calc_equip_attr(Eid, AType, HeroID),
    NewAcc = [{AType, EVal + erlang:floor(Pert * Limit / 10000)} | Acc],
    calc_potential_attr(T, HeroID, Equips, NewAcc).

calc_equip_attr(0, _AType, _HeroID) ->
    0;
calc_equip_attr(Eid, AType, HeroID) ->
    Conf = conf_channel_equip:get(Eid),
    #{heros := Heroes, attr := Attrs, attr_excl := AttrExcls} = Conf,
    case lists:member(HeroID, Heroes) of
        true -> util:prop_get_value(AType, AttrExcls, 0);
        _ -> util:prop_get_value(AType, Attrs, 0)
    end.

%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID, career = Career} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_CHANNEL, [RoleID]),
    List = db:get_all(SQL),
    Channels = init_channels(List, Career, dict:new()),
    RoleData = ?role_channel#{role_id => RoleID, channels => Channels},
    set_role_data(RoleID, RoleData).

init_channels([], _Career, Acc) ->
    Acc;
init_channels([[ID, HeroID, DbEquips, DbPotentials] | T], Career, Acc) ->
    Equips = type:convert_db_field(list, DbEquips, []),
    Potentials = type:convert_db_field(list, DbPotentials, []),
    Channel = set_channel_attr(?channel#{
        id => ID, hero => HeroID, equips => Equips, potentials => Potentials
    }, Career),
    init_channels(T, Career, dict:store(ID, Channel, Acc)).

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
    #{channels := Channels} = RoleData,
    Fun = fun(Channel) ->
        #{id := ID, hero := HeroID, equips := Equips, potentials := Potentials} = Channel,
        DbEquips = type:term_to_bitstring(Equips),
        DbPotentials = type:term_to_bitstring(Potentials),
        [RoleID, ID, HeroID, DbEquips, DbPotentials]
    end,
    db:insert_values(?SQL_SET_ROLE_CHANNEL2, ?SQL_SET_ROLE_CHANNEL3, Fun, util:dict_values(Channels)),
    NewData = RoleData#{updated => false},
    set_role_data(RoleID, NewData).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_channel#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
