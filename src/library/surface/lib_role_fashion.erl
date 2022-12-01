%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     时装
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_fashion).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("fashion.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_407.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    activate/3,
    get_attr/1,
    get_fight/1,
    create_init/2,
    handle_info/2,
    get_role_data/1,
    is_fashion_active/2
]).

handle_info(expire_check, PS) ->
    expire_check(PS);
handle_info({wear, ID}, PS) ->
    wear(PS, ID);
handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_PS, _) ->
    ignore.

do(40701, PS, _Req) ->
    get_info(PS);
%%do(40703, PS, #cs_fashion_activate{id = Gid}) ->
%%    activate(PS, Gid);
do(40705, PS, #cs_fashion_wear{id = Gid}) ->
    wear(PS, Gid);
do(40707, PS, #cs_fashion_dyeing{id = Gid}) ->
    dyeing(PS, Gid);
do(40711, PS, #cs_hair_switch{id = ID}) ->
    change_hair(PS, ID);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取信息
get_info(PS) ->
    #role_state{id = RoleID, personal = Personal} = PS,
    #{fashion := CurFashion} = Personal,
    RoleData = get_role_data(RoleID),
    #{fashions := Fashions} = RoleData,
    Rec = #sc_fashion_get_info{
        current = CurFashion,
        fashions = convert_fashions(Fashions, [])
    },
    {ok, Bin} = prot_msg:encode_msg(40702, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_fashions([], Acc) ->
    Acc;
convert_fashions([Fashion | T], Acc) ->
    #{id := FashionID, dyeing := Dyeing, exp_time := ExpTime} = Fashion,
    convert_fashions(T, [{FashionID, Dyeing, ExpTime} | Acc]).

%% @doc 激活时装
activate(PS, FashionID, EffTime0) ->
    case catch check_activate(PS, FashionID, EffTime0) of
        {ok, RoleID, RoleFashion, Fashion} ->
            update_role_data(RoleID, start_expire_timer(RoleID, RoleFashion)),
            #{id := FashionID, dyeing := Dyeing, exp_time := ExpTime} = Fashion,
            ?EVENT(RoleID, {'active_fashion', FashionID}),
            Rec = #sc_fashion_activate{id = FashionID, colors = Dyeing, exp_time = ExpTime},
            {ok, Bin} = prot_msg:encode_msg(40704, Rec),
            lib_role_send:send_to_role(PS, Bin),
            lib_role:mod_after(0, ?MODULE, {wear, FashionID bsl 16 + 1}),
            lib_role_attr:refresh_combat_power(PS);
        {error, Code} ->
            {error, Code}
    end.

check_activate(PS, FashionID, EffTime0) ->
    #role_state{id = RoleID} = PS,
    ConfFashion = conf_fashion:get(FashionID),
    ConfFashion =/= undefined orelse erlang:throw({error, ?RC_FASHION_CONF_NOT_FOUND}),
    #{default := DefColor} = ConfFashion,
    RoleFashion = get_role_data(RoleID),
    #{fashions := Fashions} = RoleFashion,
    Fashion = map:keyfind(FashionID, id, Fashions),
    Now = time:unixtime(),
    EffTime = ?iif(EffTime0 =:= 0, 0, Now + EffTime0),
    NewFashion = case Fashion of
        #{exp_time := 0} ->
            erlang:throw({error, ?RC_FASHION_ALREADY_ACTIVATED});
        #{} ->
            Fashion#{exp_time => EffTime, valid => ?FASHION_VALID};
        _ ->
            ?fashion#{
                id => FashionID, exp_time => EffTime, valid => ?FASHION_VALID,
                dyeing => bit_map:set(DefColor, 0)
            }
    end,
    NewFashions = map:keystore(FashionID, id, Fashions, NewFashion),
    NewRoleFashion = set_attr(RoleFashion#{fashions => NewFashions}),
    {ok, RoleID, NewRoleFashion, NewFashion}.

%% @doc 穿戴
wear(PS, ID) ->
    case catch check_wear(PS, ID) of
        {ok, RoleID, NewRoleFashion} ->
            #role_state{personal = Personal} = PS,
            PS1 = PS#role_state{personal = Personal#{fashion => ID}},
            set_role_data(RoleID, NewRoleFashion),
            Rec1 = #sc_fashion_wear{id = ID},
            {ok, Bin1} = prot_msg:encode_msg(40706, Rec1),
            lib_role_send:send_to_role(PS, Bin1),
            %% 场景更新 & 通知
            lib_scene_api:update(fashion, PS1),
            Rec2 = #sc_fashion_change{role_id = RoleID, id = ID},
            {ok, Bin2} = prot_msg:encode_msg(40710, Rec2),
            lib_scene_api:send_to_role_area_scene(PS, Bin2),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_wear(PS, ID) ->
    <<FashionID:16, Color0:16>> = <<ID:32>>,
    #role_state{id = RoleID} = PS,
    Color0 =/= 0 orelse erlang:throw({error, ?RC_FASHION_NO_COLOR}),
    Color = erlang:ceil(math:log2(Color0)) + 1,
    RoleFashion = get_role_data(RoleID),
    #{fashions := Fashions} = RoleFashion,
    Fashion = map:keyfind(FashionID, id, Fashions),
    Fashion =/= false orelse erlang:throw({error, ?RC_FASHION_NOT_FOUND}),
    #{dyeing := Dyeing, exp_time := ExpTime} = Fashion,
    Now = time:unixtime(),
    ExpTime =:= 0 orelse ExpTime > Now orelse erlang:throw({error, ?RC_FASHION_ALREADY_EXPIRED}),
    bit_map:is_set(Color, Dyeing) orelse erlang:throw({error, ?RC_FASHION_DYEING_NOT_ACTIVE}),
    NewRoleFashion = RoleFashion#{current => ID},
    {ok, RoleID, NewRoleFashion}.

%% @doc 染色
dyeing(PS, ID) ->
    case catch check_dyeing(PS, ID) of
        {true, RoleID, RoleFashion, Dyeing, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_FASHION_DYEING),
            update_role_data(RoleID, RoleFashion),
            Rec = #sc_fashion_dyeing{id = ID, dyeing = Dyeing},
            {ok, Bin} = prot_msg:encode_msg(40708, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {false, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_FASHION_DYEING),
            ?ERROR_TOC(PS, ?RC_FASHION_COLOR_ALREADY_ACTIVE),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_dyeing(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleFashion = get_role_data(RoleID),
    #{fashions := Fashions} = RoleFashion,
    Fashion = map:keyfind(ID, id, Fashions),
    Fashion =/= false orelse erlang:throw({error, ?RC_FASHION_NOT_FOUND}),
    ConfFashion = conf_fashion:get(ID),
    ConfFashion =/= undefined orelse erlang:throw({error, ?RC_FASHION_CONF_NOT_FOUND}),
    #{dyeing := Rates, cost := Materials, unlock := UnlockColors,
        active := ActiveC} = ConfFashion,
    #{dyeing := Dyeing, exp_time := ExpireTime} = Fashion,
    Now = time:unixtime(),
    ExpireTime > 0 andalso ExpireTime < Now andalso erlang:throw({error, ?RC_FASHION_ALREADY_EXPIRED}),
    Costs = [{?AST_ITEM, Materials}],
    lib_role_assets:check_items_enough(PS, Costs),
    bit_map:is_set(UnlockColors, Dyeing) andalso erlang:throw({error, ?RC_FASHION_NO_MORE_DYEING_COLOR}),
    Rates =/= [] orelse erlang:throw({error, ?RC_FASHION_NO_MORE_DYEING_COLOR}),
    {Color, _} = util:rand_by_weight(Rates, 2),
    case bit_map:is_set(Color, Dyeing) of
        true ->
            bit_map:is_set(Color, Dyeing) andalso erlang:throw({error, ?RC_FASHION_COLOR_ALREADY_ACTIVE}),
            {false, Costs};
        _ ->
            NewDyeing0 = bit_map:set(Color, Dyeing),
            AllUnlocked = bit_map:is_set(UnlockColors, NewDyeing0),
            NewDyeing1 = ?iif(AllUnlocked andalso ActiveC > 0, bit_map:set(ActiveC, NewDyeing0), NewDyeing0),
            NewFashion = Fashion#{dyeing => NewDyeing1},
            NewFashions = map:keystore(ID, id, Fashions, NewFashion),
            NewRoleFashion = RoleFashion#{fashions => NewFashions},
            {true, RoleID, NewRoleFashion, NewDyeing1, Costs}
    end.

%% @doc 改变发型
change_hair(PS, Arg) ->
    case catch check_change_hair(PS, Arg) of
        {ok, Costs} ->
            #role_state{id = RoleID, personal = Personal} = PS,
            PS1 = PS#role_state{personal = Personal#{hair => Arg}},
            PS2 = lib_role_assets:cost_items_notify(PS1, Costs, ?OPT_HAIR_SWITCH),
            Rec = #sc_hair_switch{id = Arg},
            {ok, Bin} = prot_msg:encode_msg(40712, Rec),
            lib_role_send:send_to_role(PS, Bin),
            %% 场景更新 & 通知
            Rec2 = #sc_hair_change{role_id = RoleID, id = Arg},
            {ok, Bin2} = prot_msg:encode_msg(40713, Rec2),
            lib_scene_api:send_to_role_area_scene(PS, Bin2),
            lib_scene_api:update(hair, PS2),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_change_hair(PS, Arg) ->
    #role_state{gender = Gender} = PS,
    <<ID:8, _:24>> = <<Arg:32>>,
    Conf = conf_hair_style:get({ID, Gender}),
    Conf =/= undefined orelse erlang:throw({error, ?RC_HAIR_CONF_NOT_FOUND}),
    #{cost := Material} = Conf,
    Costs = [{?AST_ITEM, Material}],
    lib_role_assets:check_items_enough(PS, Costs),
    {ok, Costs}.

%% -----------------------------------------------------------------------------
%% 过期检查Timer
%% -----------------------------------------------------------------------------

start_expire_timer(RoleID, RoleFashion) ->
    #{fashions := Fashions, timer_e := TimerExp} = RoleFashion,
    ExpTime = exp_time(Fashions, infinite),
    Now = time:unixtime(),
    case is_integer(ExpTime) of
        true ->
            util:cancel_timer(TimerExp),
            Time = erlang:max(ExpTime - Now, 0),
            NewRef = lib_role:mod_after(Time * 1000, ?MODULE, expire_check),
            NewRoleFashion = RoleFashion#{timer_e => NewRef},
            set_role_data(RoleID, NewRoleFashion),
            NewRoleFashion;
        _ ->
            RoleFashion
    end.

exp_time([], Time) ->
    Time;
exp_time([Fashion | T], Time) ->
    case Fashion of
        #{exp_time := ExpTime, valid := ?FASHION_VALID} when ExpTime =/= 0 ->
            exp_time(T, min(ExpTime, Time));
        _ ->
            exp_time(T, Time)
    end.

%% @doc 过期检查
expire_check(PS) ->
    #role_state{id = RoleID} = PS,
    RoleFashion = get_role_data(RoleID),
    #{fashions := Fashions} = RoleFashion,
    Now = time:unixtime(),
    {NewFashions, ExpList} = exp_check(Fashions, Now, [], []),
    case ExpList =/= [] of
        true ->
            NewRoleFashion = set_attr(RoleFashion#{fashions => NewFashions}),
            update_role_data(RoleID, start_expire_timer(RoleID, NewRoleFashion)),
            handle_fashion_expire(PS, ExpList),
            lib_role_attr:refresh_combat_power(PS);
        _ ->
%%            set_role_data(RoleID, start_expire_timer(RoleID, RoleFashion)),
            ignore
    end.

exp_check([], _Now, FashionAcc, ExpAcc) ->
    {FashionAcc, ExpAcc};
exp_check([Fashion | T], Now, FashionAcc, ExpAcc) ->
    case Fashion of
        #{id := ID, exp_time := ExpTime, valid := ?FASHION_VALID}
            when ExpTime =/= 0, ExpTime =< Now ->
            NewFashion = Fashion#{exp_time => Now, valid => ?FASHION_INVALID},
            exp_check(T, Now, [NewFashion | FashionAcc], [ID | ExpAcc]);
        _ ->
            exp_check(T, Now, [Fashion | FashionAcc], ExpAcc)
    end.

handle_fashion_expire(PS, ExpList) ->
    Rec = #sc_fashion_expire{expires = ExpList},
    {ok, Bin} = prot_msg:encode_msg(40709, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 计算属性
set_attr(RoleData) ->
    #{fashions := Fashions} = RoleData,
    Attr = calc_attr(Fashions),
    Fight = lib_role_attr:calc_combat_power(Attr),
    RoleData#{attr => Attr, fight => Fight}.

calc_attr(Fashions) ->
    calc_attr(Fashions, []).

calc_attr([], Acc) ->
    Acc;
calc_attr([Fashion | T], Acc) ->
    case Fashion of
        #{id := ID, valid := ?FASHION_VALID} ->
            Conf = conf_fashion:get(ID),
            #{attr := Attr} = Conf,
            calc_attr(T, Attr ++ Acc);
        _ ->
            calc_attr(T, Acc)
    end.

%% @doc 时装属性
get_attr(RoleID) ->
    RoleFashion = get_role_data(RoleID),
    #{attr := Attr} = RoleFashion,
    Attr.

get_fight(RoleID) ->
    RoleFashion = get_role_data(RoleID),
    #{fight := Fight} = RoleFashion,
    Fight.

%% -----------------------------------------------------------------------------
%% 通用
%% -----------------------------------------------------------------------------

%% @doc 时装是否已经激活
is_fashion_active(RoleID, ID) ->
    RoleFashion = get_role_data(RoleID),
    #{fashions := Fashions} = RoleFashion,
    Fashion = map:keyfind(ID, id, Fashions),
    Fashion =/= false.

%% =============================================================================
%% 玩家数据
%% =============================================================================

create_init(_RoleID, []) ->
    0;
create_init(RoleID, IDList) ->
    Fun = fun(ID, {Acc, Current}) ->
        Conf = conf_fashion:get(ID),
        #{default := Default} = Conf,
        Dyeing = bit_map:set(Default, 0),
        {[[RoleID, ID, Dyeing, 0, ?FASHION_VALID] | Acc],
            ?iif(Current =:= 0, ID bsl 16 + Default, Current)}
    end,
    {List, Fashion} = lists:foldl(Fun, {[], 0}, IDList),
    db:insert_values(?SQL_SET_ROLE_FASHION2, ?SQL_SET_ROLE_FASHION3, List),
    Fashion.

%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID, personal = Personal} = PS,
    #{fashion := CurFashion0} = Personal,
    SQL = io_lib:format(?SQL_GET_ROLE_FASHION, [RoleID]),
    List = db:get_all(SQL),
    Fun = fun([ID, Dyeing, ExpTime, Valid]) ->
        ?fashion#{id => ID, dyeing => Dyeing, exp_time => ExpTime, valid => Valid}
    end,
    Fashions = lists:map(Fun, List),
    CurFashion = init_current_fashion(CurFashion0, Fashions),
    RoleData = set_attr(?role_fashion#{current => CurFashion, fashions => Fashions}),
    set_role_data(RoleID, RoleData),
    start_expire_timer(RoleID, RoleData).

init_current_fashion(0, _Fashions) ->
    0;
init_current_fashion(ID, Fashions) ->
    <<FashionID:16, _Color0:16>> = <<ID:32>>,
    case map:keyfind(FashionID, id, Fashions) of
        #{} ->
            ID;
        _ when length(Fashions) > 1 ->
            Fashion = hd(Fashions),
            #{id := ID1} = Fashion,
            Conf = conf_fashion:get(ID1),
            #{default := Def} = Conf,
            Color = bit_map:set(Def, 0),
            <<ID1:16, Color:16>>;
        _ ->
            0
    end.

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
    #{fashions := Fashions} = RoleData,
    Fun = fun(Fashion) ->
        #{id := ID, dyeing := Dyeing, exp_time := ExpTime, valid := Valid} = Fashion,
        [RoleID, ID, Dyeing, ExpTime, Valid]
    end,
    db:insert_values(?SQL_SET_ROLE_FASHION2, ?SQL_SET_ROLE_FASHION3, Fun, Fashions),
    NewData = RoleData#{updated => false},
    set_role_data(RoleID, NewData).

update_role_data(RoleID, RoleFashion) ->
    NewRoleFashion = RoleFashion#{updated => true},
    set_role_data(RoleID, NewRoleFashion).

set_role_data(_RoleID, RoleFashion) ->
    erlang:put({?MODULE, role_data}, RoleFashion),
    RoleFashion.

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        M when is_map(M) ->
            M;
        _ ->
            ?role_fashion#{role_id => RoleID}
    end.
