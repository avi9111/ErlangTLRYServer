%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     秘籍
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_cheat).
-author("Ryuu").

-include("role.hrl").
-include("goods.hrl").
-include("scene.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("recharge.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_106.hrl").
-define(NO_USE_MIJI, ["full_hp", "full_mp"]).   %不需要开启秘籍的gm
%% API
-export([
    do/3,
    handle_info/2,
    do_reset_all_activity_enter_times/1
]).

-define(ABUSE_USE_MIN, 2).
-define(ABUSE_USE_MAX, 5).

handle_info({'cheat', Data}, PS) when is_list(Data) ->
    gm(string:tokens(Data, "_"), PS);
handle_info(_, _) ->
    ignore.

%% 调试秘籍
do(10601, PS, #cs_cheat_use{content = Data}) ->
    try
        use_gm(PS, Data)
    catch
        _:R ->
            notify_abuse_gm(PS),
            #role_state{id = RoleID} = PS,
            ?ERROR("error occur when role ~w use gm ~s. error: ~w", [RoleID, Data, R]),
            ok
    end;
do(_Cmd, _PS, _Data) ->
    ignore.

%% @doc 使用GM
use_gm(PS, Data) ->
%%    io:format("gm:  ~s~n", [Data]),
    CanMiJi = config:can_miji(),
    CheckIp = true,
    CanGM = CanMiJi =:= true andalso CheckIp =:= true orelse lists:member(Data, ?NO_USE_MIJI),
    CanGM andalso gm(string:tokens(Data, "_"), PS).

gm(["add", "exp", _Exp], PS) ->
    Exp0 = erlang:list_to_integer(_Exp),
    Exp = erlang:min(Exp0, ?INT32_MAX),
    lib_role_assets:add_items_notify(PS, [{?AST_EXP, Exp}], ?OPT_GM);
gm(["add", "gold", _Gold], PS) ->
    Gold = erlang:list_to_integer(_Gold),
    lib_role_assets:add_items_notify(PS, [{?AST_GOLD, Gold}], ?OPT_GM);
gm(["reset", "gold"], PS) ->
    #role_state{assets = #{gold := Gold}} = PS,
    lib_role_assets:cost_items_notify(PS, [{?AST_GOLD, Gold}], ?OPT_GM);
gm(["add", "money", _Type, _Gold], PS) ->
    Type = erlang:list_to_integer(_Type),
    ?AST_IS_MONEY(Type) andalso begin
        Gold = erlang:list_to_integer(_Gold),
        lib_role_assets:add_items_notify(PS, [{Type, Gold}], ?OPT_GM)
    end;
gm(["reset", "money", _Type], PS) ->
    Type = erlang:list_to_integer(_Type),
    ?AST_IS_MONEY(Type) andalso begin
        lib_role_assets:cost_items_notify(PS, [{Type, lib_role_money:get_money(PS, Type)}], ?OPT_GM)
    end;
gm(["add", "bgold", _Gold], PS) ->
    Gold = erlang:list_to_integer(_Gold),
    lib_role_assets:add_items_notify(PS, [{?AST_BGOLD, Gold}], ?OPT_GM);
gm(["reset", "bgold"], PS) ->
    #role_state{assets = #{bgold := Gold}} = PS,
    lib_role_assets:cost_items_notify(PS, [{?AST_BGOLD, Gold}], ?OPT_GM);
gm(["add", "coin", _Coin], PS) ->
    Coin = erlang:list_to_integer(_Coin),
    lib_role_assets:add_items_notify(PS, [{?AST_COIN, Coin}], ?OPT_GM);
gm(["reset", "coin"], PS) ->
    #role_state{assets = #{coin := Coin}} = PS,
    lib_role_assets:cost_items_notify(PS, [{?AST_COIN, Coin}], ?OPT_GM);
gm(["add", "item", _TypeID, _Num], PS) ->
    TypeID = erlang:list_to_integer(_TypeID),
    Num = erlang:list_to_integer(_Num),
    lib_goods_util:exists(TypeID) andalso Num > 0 andalso begin
        lib_role_assets:add_items_notify(PS, [{?AST_ITEM, [{TypeID, Num}]}], ?OPT_GM)
    end;
gm(["add", "limit", "item", _TypeID, _Num], PS) ->
    TypeID = erlang:list_to_integer(_TypeID),
    Num = erlang:list_to_integer(_Num),
    lib_goods_util:exists(TypeID) andalso Num > 0 andalso begin
        Now = time:unixtime(),
        Goods = ?goods_basic#{id => TypeID, num => Num, expire => Now + ?ONE_HOUR},
        lib_role_assets:add_items_notify(PS, [{?AST_ITEM, [Goods]}], ?OPT_GM)
    end;
gm(["add", "bind", "item", _TypeID, _Num], PS) ->
    TypeID = erlang:list_to_integer(_TypeID),
    Num = erlang:list_to_integer(_Num),
    Goods = ?goods_basic#{id => TypeID, num => Num, bind => ?GOODS_BIND},
    lib_role_assets:add_items_notify(PS, [{?AST_ITEM, [Goods]}], ?OPT_GM);
gm(["clear", "bag", _BagID], PS) ->
    BagID = erlang:list_to_integer(_BagID),
    lib_role_goods:clear_bag(PS, BagID);
gm(["empty", "bag", _BagID], PS) ->
    BagID = erlang:list_to_integer(_BagID),
    lib_role_goods:empty_bag(PS, BagID);
gm(["give", "drop", _DropID], PS) ->
    DropID = erlang:list_to_integer(_DropID),
    lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_GM);
gm(["active", "func", _ID], PS) ->
    ID = erlang:list_to_integer(_ID),
    lib_role_func:active(PS, ID);
gm(["active", "all", "func"], PS) ->
    lib_role_func:active_all(PS);
gm(["reset", "dung", _ID], PS) ->
    ID = erlang:list_to_integer(_ID),
    lib_role_dungeon:gm_reset_dungeon(PS, ID);
gm(["reset", "all", "dung"], PS) ->
    lib_role_dungeon:gm_reset_all(PS);
gm(["grant", "title", _ID], PS) ->
    TitleID = type:string_to_integer(_ID),
    svr_title:grant(PS#role_state.id, TitleID);
gm(["deprive", "title", _ID], PS) ->
    TitleID = type:string_to_integer(_ID),
    svr_title:deprive(PS#role_state.id, TitleID);
gm(["mail"], PS) ->
    Title = io_lib:format(<<"Welcome ~w">>, [time:unixtime()]),
    svr_mail:sys2p(PS#role_state.id, Title, <<"Welcome to New York">>, [], ?OPT_GM);
gm(["attach", "mail"], PS) ->
    Title = io_lib:format(<<"Welcome ~w">>, [time:unixtime()]),
    Items = [{?AST_GOLD, 10}, {?AST_BGOLD, 10}, {?AST_COIN, 10}, {?AST_EXP, 10}, {?AST_ITEM, [{16010001, 1}, {16020001, 1}, {16030001, 1}]}],
    svr_mail:sys2p(PS#role_state.id, Title, <<"拝啓"/utf8>>, Items, ?OPT_GM);
gm(["publish", "rumor"], _PS) ->
    svr_rumor:publish(world, 0);
gm(["refresh", "rank", _RankID], _PS) ->
    RankID = type:string_to_integer(_RankID),
    svr_rank:refresh_rank(RankID);
gm(["clear", "rank", _RankID], _PS) ->
    RankID = type:string_to_integer(_RankID),
    svr_rank:clear_rank(RankID);
gm(["set", "vip", "lv", _Lv], PS) ->
    Level = type:string_to_integer(_Lv),
    lib_role_vip:gm_set_vip_lv(PS#role_state.sid, Level);
gm(["active", "all", "heros"], PS) ->
    lib_role_hero:gm_active_all(PS);
gm(["reset", "territory"], _PS) ->
    svr_territory:reset_round();
gm(["clear", "task"], PS) ->
    lib_role_task:gm_clear_task(PS);
gm(["finish", "till", _TaskID], PS) ->
    lib_role_task:gm_finish_till(PS, type:string_to_integer(_TaskID));
gm(["accept", "task", _TaskID], PS) ->
    lib_role_task:gm_accept_task(PS, type:string_to_integer(_TaskID));
gm(["reset", "circle"], PS) ->
    lib_role_circle:gm_reset(PS);
gm(["accept", "circle", _TaskID], PS) ->
    lib_role_circle:gm_accept(PS, type:string_to_integer(_TaskID));
gm(["finish", "achieve", _TaskID], PS) ->
    lib_role_achieve:finish(PS#role_state.id, type:string_to_integer(_TaskID));
gm(["finish", "all", "achieve"], PS) ->
    lib_role_achieve:finish_all(PS#role_state.id);
gm(["finish", "achieve", "type", _Type], PS) ->
    lib_role_achieve:finish(PS#role_state.id, type:string_to_integer(_Type));
gm(["add", "love", _Gold], PS) ->
    Gold = erlang:list_to_integer(_Gold),
    lib_role_marriage:gm_add_love(PS, Gold);
gm(["trans", _Gold], PS) ->
    Gold = erlang:list_to_integer(_Gold),
    lib_role_trans:trans(PS, Gold);
gm(["clear", "dynasty", "war"], PS) ->
    lib_role_dynasty_war:gm_clear(PS#role_state.id);
gm(["full", "hp"], PS) ->
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'full_hp', PS#role_state.id});
gm(["full", "mp"], PS) ->
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'full_mp', PS#role_state.id});
gm(["empty", "hp"], PS) ->
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'empty_hp', PS#role_state.id});
gm(["empty", "mp"], PS) ->
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'empty_mp', PS#role_state.id});
gm(["powerful"], PS) ->
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'powerful', PS#role_state.id});
gm(["oripower"], PS) ->
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'oripower', PS#role_state.id});
gm(["weakness"], PS) ->
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'weakness', PS#role_state.id});
gm(["alter", "attr", AttrIndexStr, AttrValStr], PS) ->
    AttrIndex = ?l2i(AttrIndexStr),
    AttrVal = ?l2i(AttrValStr),
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'alter_attr', {PS#role_state.id, AttrIndex, AttrVal}});
gm(["summon", MonIdStr, XYStr], PS) ->
    XY = ?l2i(XYStr),
    Args = {?l2i(MonIdStr), [{xy, {XY div 1000, XY rem 1000}}]},
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'summon', Args});
gm(["add", "effect", EffectIdStr, EffectLvStr], #role_state{id = RoleId, role_scene = RoleScene}) ->
    EffectId = ?l2i(EffectIdStr),
    EffectLv = ?l2i(EffectLvStr),
    svr_scene_agent:cast_scene(RoleScene, {'gm', 'add_effect', {RoleId, EffectId, EffectLv}});
gm(["add", "peffect", EffectIdStr, EffectLvStr], #role_state{id = RoleId, role_scene = RoleScene}) ->
    EffectId = ?l2i(EffectIdStr),
    EffectLv = ?l2i(EffectLvStr),
    svr_scene_agent:cast_scene(RoleScene, {'gm', 'add_peffect', {RoleId, EffectId, EffectLv}});
gm(["del", "effect", EffectIdStr], #role_state{id = RoleId, role_scene = RoleScene}) ->
    EffectId = ?l2i(EffectIdStr),
    svr_scene_agent:cast_scene(RoleScene, {'gm', 'del_effect', {RoleId, EffectId}});
gm(["del", "peffect", EffectIdStr], #role_state{id = RoleId, role_scene = RoleScene}) ->
    EffectId = ?l2i(EffectIdStr),
    svr_scene_agent:cast_scene(RoleScene, {'gm', 'del_peffect', {RoleId, EffectId}});
gm(["reload", "mons"], #role_state{role_scene = RoleScene}) ->
    svr_scene_agent:cast_scene(RoleScene, {'gm', 'reload_mons', 'ignore'});
gm(["presure", "test", NumStr], #role_state{role_scene = RoleScene}) ->
    #role_scene{line_pid = LinePid, x = X, y = Y} = RoleScene,
    svr_scene_agent:cast_scene(LinePid, {'gm', 'presure_test', {{X, Y}, ?l2i(NumStr)}});
gm(["create", "coll", CollIdStr, XYStr], PS) ->
    XYInt = ?l2i(XYStr),
    XY = {XYInt div 1000, XYInt rem 1000},
    CollId = ?l2i(CollIdStr),
    svr_scene_agent:cast_scene(PS#role_state.role_scene, {'gm', 'create_coll', {CollId, XY}});
gm(["recharge", ProductIdStr], #role_state{id = RoleId}) ->
    ProductId = ?l2i(ProductIdStr),
    lib_role:apply_cast2(RoleId, {svr_recharge, gm_recharge, [ProductId]});
gm(["weekly", "card"], #role_state{id = RoleId}) ->
    lib_role:apply_cast2(RoleId, {svr_recharge, gm_buy_card, [?CHARGE_TYPE_WEEKLY_CARD]});
gm(["month", "card"], #role_state{id = RoleId}) ->
    lib_role:apply_cast2(RoleId, {svr_recharge, gm_buy_card, [?CHARGE_TYPE_MONTH_CARD]});
gm(["buy", _Type], #role_state{id = RoleId}) ->
    Type = ?l2i(_Type),
    lib_role:apply_cast2(RoleId, {svr_recharge, gm_buy, [Type]});
gm(["start", "activity", ActIDStr], _PS) ->
    ActID = ?l2i(ActIDStr),
    lib_gm:start_activity(ActID);
gm(["stop", "activity", ActIDStr], _PS) ->
    ActID = ?l2i(ActIDStr),
    lib_gm:stop_activity(ActID);
gm(["optime", _Day], _PS) ->
    Time = type:string_to_integer(_Day),
    Day2 = case Time > 0 of
        true -> Time - 1;
        false -> Time
    end,
    OpenTime = time:unixdate() - 86400 * Day2,
    util_svr:c_open_time(OpenTime),
    svr_activity_mgr:stop_specify_type(?ACT_TYPE_OPEN),
    ok;
gm(["optime2", _Day], _PS) -> %% 设置开服时间
    Time = type:string_to_integer(_Day),
    Day2 = case Time > 0 of
        true -> Time - 1;
        false -> Time
    end,
    OpenTime = time:unixdate() - 86400 * Day2,
    util_svr:c_open_time_gm(OpenTime),
    svr_activity_mgr:stop_specify_type(?ACT_TYPE_OPEN),
    ok;
gm(["mgtime", _Count, _Day], _PS) -> %% 设置合服时间
    Day = type:string_to_integer(_Day),
    Count = type:string_to_integer(_Count),
    Day2 = ?iif(Day > 0, Day - 1, 0),
    Count2 = ?iif(Count > 0, Count, 1),
    MergeTime = time:unixdate() - 86400 * Day2,
    util_svr:c_merge_time(MergeTime, Count2, true),
    svr_activity_mgr:stop_specify_type(?ACT_TYPE_MERGE),
    ok;
gm(["auction"], PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    Items = util:list_rand_n(conf_auction_item:get_ids(), 10),
    GuildID > 0 andalso lib_auction_util:boss_auction([{GuildID, Items, [{RoleID, 1.2}]}]);
gm(["jousts", _Stage], _PS) ->
    Stage = ?l2i(_Stage),
    svr_jousts_hall_lounge:gm_change_stage(Stage);
gm(["add", "guild", "funds", FundsStr], #role_state{id = RoleId}) ->
    Funds = ?l2i(FundsStr),
    lib_role:mod_info(RoleId, lib_role_guild, {add_guild_funds, Funds, 0});
gm(["reduce", "guild", "funds", FundsStr], #role_state{id = RoleId}) ->
    Funds = ?l2i(FundsStr),
    lib_role:mod_info(RoleId, lib_role_guild, {gm_reduce_funds, Funds, 0});
gm(["max", "pra"], PS) ->
    #role_state{id = RoleID} = PS,
    lib_role:mod_info(RoleID, lib_role_guild, gm_set_max_lv);
gm(["lively", _ID, _Times], PS) ->
    ID = ?l2i(_ID),
    Times = ?l2i(_Times),
    lib_role_daily_lively:trigger_event(PS#role_state.id, ID, Times);
gm(["grow", "fund", _Grade], PS) ->
    Grade = ?l2i(_Grade),
    lib_role_grow_fund:buy(PS, Grade);
gm(["daily", "gift", _Grade], PS) ->
    Grade = ?l2i(_Grade),
    lib_role_daily_gift:buy(PS, Grade);
gm(["sign", _AddTimes], PS) ->
    AddTimes = ?l2i(_AddTimes),
    lib_role_sign:gm_add_times(PS#role_state.id, AddTimes);
gm(["role", "logout"], PS) ->
    lib_login:stop_role(PS#role_state.id);
gm(["set", "lv", _Lv], PS) ->
    Lv = ?l2i(_Lv),
    lib_role_level:gm_set_level(PS, Lv);
gm(["daily", "task", _TaskID], PS) ->
    TaskID = ?l2i(_TaskID),
    lib_role_daily_task:get_task(PS, TaskID);
gm(["seven"], PS) ->
    lib_role_seven_login:gm_add_login_day(PS#role_state.id);
gm(["guild", "denf"], _PS) ->
    svr_guild_mgr:gm_denf_cost();
gm(["close", "guild", "activity"], _PS) ->
    [
        begin
            case lib_activity:is_ongoing(ActivityID) of
                true -> lib_gm:stop_activity(ActivityID);
                _ -> skip
            end
        end || ActivityID <- ?GUILD_ACTIVITY
    ];
gm(["active", "artifact"], PS) ->
    lib_role_artifact:gm_activate(PS);
gm(["add", "lively", _Exp], PS) ->
    Exp = ?l2i(_Exp),
    lib_role_guild:add_live_exp(PS, Exp);
gm(["add", "sworn", "value", _AddValue], PS) ->
    AddValue = erlang:list_to_integer(_AddValue),
    lib_role_sworn:add_sworn_value(PS, AddValue);
gm(["vow", "all"], PS) ->
    lib_role_vow:gm_fin_all(PS#role_state.id);
gm(["enter", "tdung", _DungID], PS) ->
    DungID = ?l2i(_DungID),
    lib_role_team_dungeon:enter(PS, DungID);
gm(["vow", "day", _Day], PS) ->
    Day = ?l2i(_Day),
    lib_role_vow:gm_change_day(PS#role_state.id, Day);
gm(["reset", "activity", "enter", "times", _Arg], PS) ->
    Arg = ?l2i(_Arg),
    IsCanReset = lists:member(Arg, [
        ?KEY_DAILY_DYNASTY_ENTER_TIMES,
        ?KEY_DAILY_JOUSTS_HALL_ENTER_TIMES,
        ?KEY_DAILY_GUILD_DEFEND_ENTER_TIMES,
        ?KEY_DAILY_CAREER_BATTLE_ENTER_TIMES
    ]),
    IsCanReset andalso lib_role_kv:set_kv(PS#role_state.id, Arg, 0);
gm(_, _PS) ->
    ignore.

%% @doc 滥用封禁
notify_abuse_gm(#role_state{id = RoleID}) ->
    notify_abuse_gm(RoleID);
notify_abuse_gm(RoleID) ->
    _Count = erlang:get(abuse_use_gm),
    CurCount = ?iif(is_integer(_Count), _Count, 0),
    NewCount = CurCount + 1,
    erlang:put(abuse_use_gm, NewCount),
    if
        NewCount >= ?ABUSE_USE_MAX ->
            svr_ban:ban_role(RoleID),
            ok;
        NewCount >= ?ABUSE_USE_MIN ->
            svr_rumor:publish({role, RoleID}, type:unicode_binary("检测到当前账号滥用GM，请联系客服，否则将封禁该账号")),
            ok;
        true ->
            ignore
    end.

do_reset_all_activity_enter_times(RoleID) ->
    KeyList = [
        ?KEY_DAILY_DYNASTY_ENTER_TIMES,
        ?KEY_DAILY_JOUSTS_HALL_ENTER_TIMES,
        ?KEY_DAILY_GUILD_DEFEND_ENTER_TIMES,
        ?KEY_DAILY_CAREER_BATTLE_ENTER_TIMES
    ],
    [lib_role_kv:set_kv(RoleID, Key, 0) || Key <- KeyList].