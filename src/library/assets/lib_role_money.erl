%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     玩家元宝 [不直接调用, 上层接口见 lib_role_assets]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_money).
-author("Ryuu").

-include("role.hrl").
-include("money.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").

%% API
-export([
    init/1,
    save/1,
    event/2,
    field_id/1,
    ret_code/1,
    add_money/4,
    get_money/2,
    cost_money/4,
    log_money_op/2,
    get_his_money/2,
    is_enough_money/3
]).

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save(PS);
event(_, _) ->
    ignore.

%% @doc 获取金钱
get_money(PS, Type) when is_record(PS, role_state) ->
    get_money(PS#role_state.assets, Type);
get_money(Assets, Type) ->
    Field = asset_field(Type),
    maps:get(Field, Assets).

get_his_money(PS, Type) when is_record(PS, role_state) ->
    get_money(PS#role_state.assets_his, Type).

%% @doc 判断余额够不够
is_enough_money(PS, ?AST_BGOLD_F, Cost) ->
    BindGold = get_money(PS, ?AST_BGOLD),
    SGold = get_money(PS, ?AST_SGOLD),
    Gold = get_money(PS, ?AST_GOLD),
    BindGold + SGold + Gold >= Cost;
is_enough_money(PS, ?AST_SGOLD_F, Cost) ->
    SGold = get_money(PS, ?AST_SGOLD),
    Gold = get_money(PS, ?AST_GOLD),
    SGold + Gold >= Cost;
is_enough_money(PS, Type, Cost) ->
    get_money(PS, Type) >= Cost.

%% @doc 扣除角色货币
cost_money(PS, _Type, 0, _OpType) ->
    PS;
cost_money(PS, ?AST_BGOLD_F, Amount, OpType) ->
    BindGold = get_money(PS, ?AST_BGOLD),
    SGold = get_money(PS, ?AST_SGOLD),
    {NeedBind, NeedSGold, NeedGold} = ?iif(BindGold >= Amount, {Amount, 0, 0}, ?iif(SGold >= Amount - BindGold, {BindGold, Amount - BindGold, 0}, {BindGold, SGold, Amount - BindGold - SGold})),
    cost_money(cost_money(cost_money(PS, ?AST_BGOLD, NeedBind, OpType), ?AST_SGOLD, NeedSGold, OpType), ?AST_GOLD, NeedGold, OpType);
cost_money(PS, ?AST_SGOLD_F, Amount, OpType) ->
    SGold = get_money(PS, ?AST_SGOLD),
    {NeedSGold, NeedGold} = ?iif(SGold >= Amount, {Amount, 0}, {SGold, Amount - SGold}),
    cost_money(cost_money(PS, ?AST_SGOLD, NeedSGold, OpType), ?AST_GOLD, NeedGold, OpType);
cost_money(PS, Type, Amount, OpType) ->
    Amount > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    CurMoney = get_money(PS, Type),
    CurMoney >= Amount orelse erlang:throw({error, ret_code(Type)}),
    NewMoney = erlang:floor(CurMoney - Amount),
    fire_event(cost, PS, Type, OpType, Amount),
    Log = ?money_op#{
        op => ?MONEY_OP_COST, opt => OpType, time => time:unixtime(),
        type => Type, amount => Amount, old => CurMoney, new => NewMoney
    },
    update_money(PS, Type, NewMoney, Log).

%% @doc 游戏内增加金钱统一接口
add_money(PS, _Type, 0, _OpType) ->
    PS;
add_money(PS, Type, Amount, OpType) ->
    Amount > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #role_state{assets_his = HisAssets} = PS,
    CurMoney = get_money(PS, Type),
    NewMoney = erlang:floor(CurMoney + Amount),
    NewHisAssets = add_money(HisAssets, Type, Amount),
    Log = ?money_op#{
        op => ?MONEY_OP_GAIN, opt => OpType, time => time:unixtime(),
        type => Type, amount => Amount, old => CurMoney, new => NewMoney
    },
    fire_event(add, PS, Type, OpType, Amount),
    update_money(PS#role_state{assets_his = NewHisAssets}, Type, NewMoney, Log).

add_money(Assets, Type, Amount) ->
    Field = asset_field(Type),
    CurMoney = get_money(Assets, Type),
    NewMoney = erlang:floor(CurMoney + Amount),
    maps:put(Field, NewMoney, Assets).

fire_event(add, PS, Type, _OpType, Amount) ->
    if
        Type =:= ?AST_CONT ->
            ?EVENT(PS, {'add_money', Type, Amount}),
            ?TASK_EVENT(PS, {add_guild_cont, Amount});
        true ->
            ignore
    end;
fire_event(cost, PS, Type, OpType, Amount) ->
    IgnoreOps = [?OPT_MARKET_BUY],
    if
        Type =:= ?AST_GOLD ->
            not lists:member(OpType, IgnoreOps) andalso ?EVENT(PS, {'consume', Amount});
        true ->
            ignore
    end.

%% @doc log
update_money(PS, Type, Money, Log) ->
    Field = asset_field(Type),
    #role_state{id = RoleID, assets_his = AssetHis} = PS,
    NewAssets = maps:put(Field, Money, PS#role_state.assets),
    PS1 = PS#role_state{assets = NewAssets},
    log_money_op(RoleID, Log),
    DbHis = type:term_to_bitstring(AssetHis),
    SQL = io_lib:format(?SQL_UPD_ROLE_MONEY, [Field, Money, DbHis, RoleID]),
    db:execute(SQL),
    PS1.

log_money_op(RoleID, Log) ->
    #{op := Op, opt := OpType, time := Time,
        type := Type, amount := Amount, old := Old, new := New} = Log,
    ?LOG(io_lib:format(?SQL_LOG_ROLE_MONEY, [RoleID, Type, Op, OpType, Old, New, Amount, Time])).

%% -----------------------------------------------------------------------------

asset_field(MoneyType) ->
    conf_money:asset_field(MoneyType).

ret_code(MoneyType) ->
    conf_money:ret_code(MoneyType).

field_id(Field) ->
    conf_money:field_id(Field).

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 登录初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    {Assets, HisAssets} = load_role_money(RoleID),
    PS#role_state{assets = Assets, assets_his = HisAssets}.

load_role_money(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_MONEY, [RoleID]),
    case db:get_row(SQL) of
        [Gold, BGold, Coin, FCoin, Cont, Credit, Currency, ForgeS, Essence, Emprise,
            Silver, Sgold, Wfruit, Tball, JiFen, PeachValue, LoveValue, FateToken,
            SongLiao, Serum, DbHis] ->
            AssetsHis = type:convert_db_field(map, DbHis, ?role_assets),
            {?role_assets#{
                gold => Gold, bgold => BGold, coin => Coin, fcoin => FCoin,
                cont => Cont, credit => Credit, currency => Currency,
                forge_score => ForgeS, essence => Essence, emprise => Emprise,
                silver => Silver, sgold => Sgold, wfruit => Wfruit, tball => Tball,
                jifen => JiFen, peach_value => PeachValue, love_value => LoveValue,
                fate_token => FateToken, song_liao => SongLiao, serum => Serum
            }, maps:merge(?role_assets, AssetsHis)};
        _ ->
            {?role_assets, ?role_assets}
    end.

%% @doc 下线持久化
save(PS) ->
    #role_state{id = RoleID, assets = Assets, assets_his = HisAssets} = PS,
    save_role_money(RoleID, Assets, HisAssets).

save_role_money(RoleID, Assets, HisAssets) ->
    #{gold := Gold, bgold := BGold, coin := Coin, fcoin := FCoin, cont := Cont,
        credit := Credit, currency := Currency, forge_score := ForgeScore,
        essence := Essence, emprise := Emprise, silver := Silver, sgold := Sgold,
        wfruit := Wfruit, tball := Tball, jifen := JiFen, peach_value := PeachValue,
        love_value := LoveValue, fate_token := FateToken, song_liao := SongLiao,
        serum := Serum} = Assets,
    DbHis = type:term_to_bitstring(HisAssets),
    SQL = io_lib:format(?SQL_SET_ROLE_MONEY, [
        RoleID, Gold, BGold, Coin, FCoin, Cont, Credit, Currency, ForgeScore,
        Essence, Emprise, Silver, Sgold, Wfruit, Tball, JiFen, PeachValue,
        LoveValue, FateToken, SongLiao, Serum, DbHis
    ]),
    db:execute(SQL).
