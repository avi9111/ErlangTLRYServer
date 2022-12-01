%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_territory_mgr).
-author("Ryuu").

-include("common.hrl").
-include("op_type.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("territory.hrl").
-include("proto/prot_311.hrl").

%% API
-export([
    init/0,
    enter/2,
    leave/2,
    clean_up/0,
    role_enter/1,
    switch_room/3,
    get_progress/2,
    start_battle/1,
    wait_results/2,
    stop_activity/2,
    handle_result/2,
    start_activity/2,
    remove_activity/2
]).

-export([
    born_pos/1,
    oppo_camp/1,
    is_ongoing/0,
    battle_scene/0,
    prepare_scene/0,
    is_battle_scene/1,
    is_prepare_scene/1,
    is_relative_scene/1
]).

%% private
-export([
    get_room_info/1,
    set_room_info/2,
    get_role_data/1,
    set_role_data/2,
    get_camp_info/1,
    set_camp_info/2
]).

init() ->
    ?territory_battle#{}.

clean_up() ->
    sup_territory_battle:stop_all(),
    util:cls_ets(?ETS_TERRITORY_BATTLE),
    ok.

start_activity(State, Activity) ->
    #{id := ActID} = Activity,
    TerritoryInfo = lib_territory:get_territory_info(),
    #{round := Round, matches := Matches, territories := Territories,
        version := Version} = TerritoryInfo,
    (Round >= 0 andalso Round =< ?TERRITORY_ROUND_3) orelse erlang:throw({error, need_reset}),
    GroupNum = length(Matches),
    init_group(Matches, Territories),
    erlang:send_after(?PREPARE_TIME * 1000, self(), start_battle),
    State#{
        act_id => ActID, stage => ?TERRITORY_STAGE_PREPARE, round => Round,
        group_num => GroupNum, version => Version
    }.

init_group([], _Territories) ->
    ok;
init_group([{GroupID, Quality, RedRef, BlueRef} | T], Territories) ->
    Red = init_guild(RedRef, GroupID, ?TERRITORY_CAMP_RED, Territories),
    Blue = init_guild(BlueRef, GroupID, ?TERRITORY_CAMP_BLUE, Territories),
    CampGuilds = [{?TERRITORY_CAMP_RED, Red}, {?TERRITORY_CAMP_BLUE, Blue}],
    Refs = [{?TERRITORY_CAMP_RED, RedRef}, {?TERRITORY_CAMP_BLUE, BlueRef}],
    GroupInfo = ?territory_group#{
        id => GroupID, guilds => CampGuilds, quality => Quality, refs => Refs
    },
    [svr_scene_mgr:add_scene_line_asyn(prepare_scene(), GID) || {_, GID} <- CampGuilds, GID =/= 0],
    set_group_info(GroupID, GroupInfo),
    init_group(T, Territories).

init_guild(Ref, GroupID, CampID, Territories) ->
    Territory = map:keyfind(Ref, ref, Territories),
    #{guild := GuildID} = Territory,
    Name = lib_guild:get_guild_name(GuildID),
    Guild = ?territory_guild#{
        id => GuildID, name => Name, ref => Ref, group_id => GroupID, camp_id => CampID
    },
    set_guild_data(GuildID, Guild),
%%    util:put_ets(?ETS_TERRITORY_BATTLE, ?REF_GUILD(Ref), 0),
%%    GuildID > 0 andalso util:put_ets(?ETS_TERRITORY_BATTLE, ?GUILD_REF(GuildID), Ref),
    GuildID.

start_battle(State) ->
    #{group_num := GroupNum} = State,
    Rooms = start_battle_group(GroupNum, []),
    State#{stage => ?TERRITORY_STAGE_BATTLE, rooms => Rooms, waits => Rooms}.

start_battle_group(0, RoomAcc) ->
    RoomAcc;
start_battle_group(GroupID, RoomAcc) ->
    GroupInfo = get_group_info(GroupID),
    #{guilds := CampGuilds} = GroupInfo,
    GroupRoles = get_group_roles(CampGuilds, []),
    Lines = start_battle_room(1, ?ROOM_NUM, [GroupID, ?ROOM_ROLE, CampGuilds], GroupRoles, []),
    NewGroupInfo = GroupInfo#{rooms => Lines},
    set_group_info(GroupID, NewGroupInfo),
    start_battle_group(GroupID - 1, Lines ++ RoomAcc).

get_group_roles([], Acc) ->
    Acc;
get_group_roles([{CampID, GuildID} | T], Acc) ->
    Guild = get_guild_data(GuildID),
    #{roles := RoleSet, select := Selection} = Guild,
    Fun = fun({_, Set}, Acc1) -> sets:subtract(Acc1, Set) end,
    NoSet = lists:foldl(Fun, RoleSet, Selection),
    get_group_roles(T, [{CampID, GuildID, Selection, sets:to_list(NoSet)} | Acc]).

start_battle_room(RoomID, Num, _Params, _Roles, LineAcc) when RoomID > Num ->
    LineAcc;
start_battle_room(RoomID, Num, Params, Roles, LineAcc) ->
    [GroupID, Limit, CampGuilds] = Params,
    LineID = GroupID * 10 + RoomID,
    {NewRoles, RoomCamps, RoomRoles} = distribute_camp(Roles, [LineID, RoomID, Limit], [], [], []),
    RoomInfo = ?territory_room#{
        key => LineID, id => RoomID, line_id => LineID, group_id => GroupID,
        guilds => CampGuilds, roles => RoomRoles, camps => RoomCamps
    },
    set_room_info(LineID, RoomInfo),
    sup_territory_battle:start_child([LineID]),
    start_battle_room(RoomID + 1, Num, Params, NewRoles, [LineID | LineAcc]).

distribute_camp([], _Params, Acc, CampAcc, RoleAcc) ->
    {Acc, CampAcc, RoleAcc};
distribute_camp([{CampID, GuildID, Selection, RoleList} | T], Params, Acc, CampAcc, RoleAcc) ->
    [LineID, RoomID, LimitNum] = Params,
    RoleSet = util:prop_get_value(RoomID, Selection, sets:new()),
    Num = sets:size(RoleSet),
    List1 = sets:to_list(RoleSet),
    {List2, Rest} = util:split_list(erlang:max(LimitNum - Num, 0), RoleList),
    List = List1 ++ List2,
    CampKey = {LineID, CampID},
    distribute_role(List, [RoomID, CampID, CampKey, LineID]),
    CampInfo = ?territory_camp#{
        key => CampKey, id => CampID, roles => List, guild_id => GuildID,
        line_id => LineID
    },
    set_camp_info(CampKey, CampInfo),
    NewAcc = [{CampID, GuildID, Selection, Rest} | Acc],
    NewCampAcc = [CampKey | CampAcc],
    NewRoleAcc = List ++ RoleAcc,
    distribute_camp(T, Params, NewAcc, NewCampAcc, NewRoleAcc).

distribute_role([], _Params) ->
    ok;
distribute_role([RoleID | T], Params) ->
    [RoomID, CampID, CampKey, LineID] = Params,
    RoleData = get_role_data(RoleID),
    NewData = RoleData#{
        line_id => LineID, room_id => RoomID, camp_id => CampID,
        room_key => LineID, camp_key => CampKey
    },
    set_role_data(RoleID, NewData),
    distribute_role(T, Params).

stop_activity(State, _Activity) ->
    svr_timer:unregister(),
    sup_territory_battle:info_all(settle_up),
    wait_results(State#{stage => ?TERRITORY_STAGE_SETTLING}, 11).

wait_results(#{waits := []} = State, _) ->
    settle_up(State);
wait_results(State, 0) ->
    settle_up(State);
wait_results(State, Num) ->
    erlang:send_after(1 * 1000, self(), {wait_results, Num - 1}),
    State.

handle_result(State, LineID) ->
    #{waits := Waits} = State,
    State#{waits => lists:delete(LineID, Waits)}.

settle_up(State) ->
    svr_timer:unregister(),
    #{group_num := GroupNum, version := Version} = State,
    {Winners, GuildList} = settle_up_group(GroupNum, [], []),
    svr_territory:update(Version, Winners, GuildList),
    State#{stage => ?TERRITORY_STAGE_SETTLED, act_id => 0, round => 0}.

settle_up_group(0, WinAcc, GuildAcc) ->
    {WinAcc, GuildAcc};
settle_up_group(GroupID, WinAcc, GuildAcc) ->
    GroupInfo = get_group_info(GroupID),
    #{guilds := CampGuilds, rooms := Lines, refs := CampRefs, quality := Quality} = GroupInfo,
    {WinCamp, Scores} = settle_up_rooms(Lines, CampGuilds, []),
    NewGuildAcc = settle_up_guilds(CampGuilds, WinCamp, Quality, CampRefs, GuildAcc),
    WinRef = util:prop_get_value(WinCamp, CampRefs, 0),
    NewGroupInfo = GroupInfo#{winner => WinCamp, finish => true},
    group_settle_rumor(?TERRITORY_CAMPS, CampGuilds, WinCamp, Scores),
    set_group_info(GroupID, NewGroupInfo),
    settle_up_group(GroupID - 1, [WinRef | WinAcc], NewGuildAcc).

settle_up_rooms([], CampGuilds, Acc) ->
    RedWin = util:prop_get_value(?TERRITORY_CAMP_RED, Acc, 0),
    BlueWin = util:prop_get_value(?TERRITORY_CAMP_BLUE, Acc, 0),
    if
        RedWin > BlueWin ->
            WinCamp = ?TERRITORY_CAMP_RED;
        BlueWin > RedWin ->
            WinCamp = ?TERRITORY_CAMP_BLUE;
        true ->
            WinCamp = decide_win_guild(CampGuilds)
    end,
    {WinCamp, Acc};
settle_up_rooms([LineID | T], CampGuilds, Acc) ->
    RoomInfo = get_room_info(LineID),
    #{winner := WinCamp} = RoomInfo,
    NewAcc = ?iif(WinCamp > 0, util:prop_increase(WinCamp, Acc), Acc),
    settle_up_rooms(T, CampGuilds, NewAcc).

decide_win_guild(CampGuilds) ->
    RedID = util:prop_get_value(?TERRITORY_CAMP_RED, CampGuilds, 0),
    BlueID = util:prop_get_value(?TERRITORY_CAMP_BLUE, CampGuilds, 0),
    if
        RedID > 0 andalso BlueID > 0 ->
            case guild_stren(RedID) > guild_stren(BlueID) of
                true -> ?TERRITORY_CAMP_RED;
                _ -> ?TERRITORY_CAMP_BLUE
            end;
        RedID > 0 ->
            ?TERRITORY_CAMP_RED;
        BlueID > 0 ->
            ?TERRITORY_CAMP_BLUE;
        true ->
            util:list_rand(?TERRITORY_CAMPS)
    end.

guild_stren(GuildID) ->
    Guild = get_guild_data(GuildID),
    #{roles := RoleSet} = Guild,
    Fight = calc_role_fight(sets:to_list(RoleSet), 0),
    {sets:size(RoleSet), Fight, -GuildID}.

calc_role_fight([], Acc) ->
    Acc;
calc_role_fight([RoleID | T], Acc) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    calc_role_fight(T, Fight + Acc).

settle_up_guilds([], _WinCamp, _Quality, _CampRefs, GuildAcc) ->
    GuildAcc;
settle_up_guilds([{CampID, 0} | T], WinCamp, Quality, CampRefs, GuildAcc) ->
    Ref = util:prop_get_value(CampID, CampRefs),
    settle_up_guilds(T, WinCamp, Quality, CampRefs, [{Ref, []} | GuildAcc]);
settle_up_guilds([{CampID, GuildID} | T], WinCamp, Quality, CampRefs, GuildAcc) ->
    Win = CampID =:= WinCamp,
    {ChiefReward, MemberReward} = conf_territory:get_reward(Win, Quality),
    Guild = get_guild_data(GuildID),
    #{roles := RoleSet} = Guild,
    ChiefID = lib_guild:get_chief_id(GuildID),
    Members = sets:to_list(sets:del_element(ChiefID, RoleSet)),
    svr_scene_mgr:close_line(prepare_scene(), GuildID),
    MailID = settle_up_mail(Win),
    ChiefIn = sets:is_element(ChiefID, RoleSet),
    ChiefIn andalso svr_mail:sys2p(ChiefID, MailID, ChiefReward, ?OPT_TERRITORY_SETTLE),
    svr_mail:sys2select(Members, MailID, MemberReward, ?OPT_TERRITORY_SETTLE),
    Ratios = lib_territory:auction_bonus(collect_role_scores(sets:to_list(RoleSet), [])),
    Ref = util:prop_get_value(CampID, CampRefs),
    settle_up_guilds(T, WinCamp, Quality, CampRefs, [{Ref, Ratios} | GuildAcc]).

collect_role_scores([], Acc) ->
    Acc;
collect_role_scores([RoleID | T], Acc) ->
    RoleData = get_role_data(RoleID),
    #{score := Score} = RoleData,
    collect_role_scores(T, [{RoleID, Score} | Acc]).

group_settle_rumor(_, CampGuilds, _Winner, _Scores) when length(CampGuilds) < 2 ->
    ok;
group_settle_rumor(_, _CampGuilds, _Winner, []) ->
    ok;
group_settle_rumor([], _CampGuilds, _Winner, _Scores) ->
    ok;
group_settle_rumor([CampID | T], CampGuilds, Winner, Scores) ->
    OppoCamp = oppo_camp(CampID),
    GuildID = util:prop_get_value(CampID, CampGuilds, 0),
    Score = util:prop_get_value(CampID, Scores, 0),
    OppoGuild = util:prop_get_value(OppoCamp, CampGuilds, 0),
    OppoName = lib_guild:get_guild_name(OppoGuild),
    OppoScore = util:prop_get_value(OppoCamp, Scores, 0),
    case CampID =:= Winner of
        true ->
            Rumor = config:get_sys_config(territory_group_win_rumor);
        _ ->
            Rumor = config:get_sys_config(territory_group_lose_rumor)
    end,
    svr_rumor:publish({guild, GuildID}, Rumor, [OppoName, Score, OppoScore]),
    group_settle_rumor(T, CampGuilds, Winner, Scores).

remove_activity(State, _Activity) ->
    #{stage := Stage} = State,
    if
        Stage =:= ?TERRITORY_STAGE_SETTLING orelse Stage =:= ?TERRITORY_STAGE_BATTLE ->
            NewState = settle_up(State);
        true ->
            NewState = State
    end,
    lib_territory_mgr:clean_up(),
    NewState.

enter(State, EnterInfo) ->
    case catch check_enter(State, EnterInfo) of
        {ok, RoleID, RoleData, GuildID, Guild} ->
            set_role_data(RoleID, RoleData),
            set_guild_data(GuildID, Guild),
            SceneID = prepare_scene(),
            {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
            lib_scene_api:change_scene_async(RoleID, SceneID, GuildID, X, Y),
            Rec = #sc_territory_enter{},
            {ok, Bin} = prot_msg:encode_msg(31112, Rec),
            lib_role_send:send_to_role(RoleID, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(EnterInfo, Code)
    end.

check_enter(State, EnterInfo) ->
    #{id := RoleID, guild_id := GuildID} = EnterInfo,
    GuildID > 0 orelse erlang:throw({error, ?RC_GUILD_HAVE_NO_GUILD}),
    Guild = get_guild_data(GuildID),
    Guild =/= undefined orelse erlang:throw({error, ?RC_TERRITORY_NOT_QUALIFIED}),
    #{roles := Roles, group_id := GroupID} = Guild,
    JoinTime = lib_guild:get_join_time(RoleID),
    JoinTime =:= 0 orelse JoinTime =< join_time() orelse erlang:throw({error, ?RC_TERRITORY_JOIN_TIME_LIMIT}),
    #{stage := Stage} = State,
    Stage =:= ?TERRITORY_STAGE_PREPARE orelse erlang:throw({error, ?RC_TERRITORY_PREPARE_PASS}),
    RoleData = get_role_data(RoleID),
    NewData = maps:merge(RoleData, EnterInfo#{group_id => GroupID}),
    NewGuild = Guild#{roles => sets:add_element(RoleID, Roles)},
    {ok, RoleID, NewData, GuildID, NewGuild}.

role_enter(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{select := Sel, guild_id := GuildID} = RoleData,
    Guild = get_guild_data(GuildID),
    #{select := Selection} = Guild,
    Rec = #sc_territory_scene_prepare{
        select = Sel, selection = convert_selection(Selection, [])
    },
    {ok, Bin} = prot_msg:encode_msg(31131, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

convert_selection([], Acc) ->
    Acc;
convert_selection([{Room, Roles} | T], Acc) ->
    convert_selection(T, [{Room, sets:size(Roles)} | Acc]).

leave(#{stage := ?TERRITORY_STAGE_PREPARE}, RoleID) ->
    RoleData = get_role_data(RoleID),
    #{guild_id := GuildID, select := Sel} = RoleData,
    NewRoleData = RoleData#{select => 0},
    set_role_data(RoleID, NewRoleData),
    Guild = get_guild_data(GuildID),
    #{roles := Roles, select := Selection} = Guild,
    NewGuild = Guild#{
        roles => sets:del_element(RoleID, Roles),
        select => switch_select(RoleID, Sel, 0, Selection)
    },
    set_guild_data(GuildID, NewGuild),
    notify_selection(GuildID, NewGuild);
leave(_, _) ->
    ignore.

switch_room(State, RoleID, RoomID) ->
    case catch check_switch_room(State, RoleID, RoomID) of
        {ok, RoleID, RoleData, GuildID, Guild} ->
            set_role_data(RoleID, RoleData),
            set_guild_data(GuildID, Guild),
            notify_selection(GuildID, Guild),
            Rec = #sc_territory_switch{room = RoomID},
            {ok, Bin} = prot_msg:encode_msg(31116, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_switch_room(State, RoleID, NewSel) ->
    #{stage := Stage} = State,
    Prepare = Stage =:= ?TERRITORY_STAGE_PREPARE,
    Prepare orelse erlang:throw({error, ?RC_TERRITORY_PREPARE_PASS}),
    RoleData = get_role_data(RoleID),
    #{id := RoleID, guild_id := GuildID, select := OldSel} = RoleData,
    OldSel =/= NewSel orelse erlang:throw({error, ?RC_TERRITORY_SELECT_SAME_ROOM}),
    Valid = (NewSel > 0 andalso NewSel =< ?ROOM_NUM),
    Valid orelse erlang:throw({error, ?RC_TERRITORY_ROOM_NOT_FOUND}),
    Guild = get_guild_data(GuildID),
    #{select := Selection} = Guild,
    NewSelection = switch_select(RoleID, OldSel, NewSel, Selection),
    NewData = RoleData#{select => NewSel},
    NewGuild = Guild#{select => NewSelection},
    {ok, RoleID, NewData, GuildID, NewGuild}.

switch_select(RoleID, OldSel, NewSel, Select) ->
    add_select(RoleID, NewSel, del_select(RoleID, OldSel, Select)).

add_select(_RoleID, 0, Select) ->
    Select;
add_select(RoleID, Sel, Select) ->
    util:prop_store(Sel, sets:add_element(RoleID, get_select(Sel, Select)), Select).

del_select(_RoleID, 0, Select) ->
    Select;
del_select(RoleID, Sel, Select) ->
    util:prop_store(Sel, sets:del_element(RoleID, get_select(Sel, Select)), Select).

get_select(Sel, Select) ->
    util:prop_get_value(Sel, Select, sets:new()).

notify_selection(GuildID, Guild) ->
    #{select := Selection} = Guild,
    Rec = #sc_territory_notify_select{
        selection = convert_selection(Selection, [])
    },
    {ok, Bin} = prot_msg:encode_msg(31133, Rec),
    lib_scene_api:send_to_scene(prepare_scene(), GuildID, Bin),
    ok.

get_progress(RoleID, GuildID) ->
    case get_guild_data(GuildID) of
        #{group_id := GroupID} ->
            GroupInfo = get_group_info(GroupID),
            #{rooms := Rooms} = GroupInfo,
            Rec = #sc_territory_progress{
                rooms = collect_process(Rooms, [])
            },
            {ok, Bin} = prot_msg:encode_msg(31122, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        _ ->
            ignore
    end.

collect_process([], Acc) ->
    Acc;
collect_process([LineID | T], Acc) ->
    RoomInfo = get_room_info(LineID),
    #{id := RoomID, winner := Winner, camps := Camps, finish := Finish} = RoomInfo,
    List = collect_camp_role(Camps, []),
    Fin = ?iif(Finish, 1, 0),
    RedNum = util:prop_get_value(?TERRITORY_CAMP_RED, List, 0),
    BlueNum = util:prop_get_value(?TERRITORY_CAMP_BLUE, List, 0),
    NewAcc = [{RoomID, Fin, RedNum, BlueNum, Winner} | Acc],
    collect_process(T, NewAcc).

collect_camp_role([], Acc) ->
    Acc;
collect_camp_role([CampKey | T], Acc) ->
    CampInfo = get_camp_info(CampKey),
    #{id := CampID, roles := Roles} = CampInfo,
    collect_camp_role(T, [{CampID, length(Roles)} | Acc]).

%% -----------------------------------------------------------------------------

is_relative_scene(SceneID) ->
    is_battle_scene(SceneID) orelse is_prepare_scene(SceneID).

is_prepare_scene(SceneID) ->
    SceneID =:= prepare_scene().

prepare_scene() ->
    config:get_sys_config(territory_prepare_scene).

is_battle_scene(SceneID) ->
    SceneID =:= battle_scene().

battle_scene() ->
    config:get_sys_config(territory_battle_scene).

settle_up_mail(true) ->
    config:get_sys_config(territory_win_mail);
settle_up_mail(_) ->
    config:get_sys_config(territory_lose_mail).

born_pos(?TERRITORY_CAMP_RED) ->
    config:get_sys_config(territory_born_pos_red);
born_pos(?TERRITORY_CAMP_BLUE) ->
    config:get_sys_config(territory_born_pos_blue).

oppo_camp(?TERRITORY_CAMP_RED) ->
    ?TERRITORY_CAMP_BLUE;
oppo_camp(?TERRITORY_CAMP_BLUE) ->
    ?TERRITORY_CAMP_RED.

join_time() ->
    time:unixtime({time:get_week_day(6), {0, 0, 0}}).

is_ongoing() ->
    lib_activity:is_ongoing(?ACT_ID_TERRITORY_1) orelse
        lib_activity:is_ongoing(?ACT_ID_TERRITORY_2) orelse
        lib_activity:is_ongoing(?ACT_ID_TERRITORY_3).

%% -----------------------------------------------------------------------------

get_role_data(RoleID) ->
    case util:get_ets(?ETS_TERRITORY_BATTLE, ?ROLE_KEY(RoleID)) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?territory_role
    end.

set_role_data(RoleID, RoleData) ->
    util:put_ets(?ETS_TERRITORY_BATTLE, ?ROLE_KEY(RoleID), RoleData).

get_guild_data(GuildID) ->
    util:get_ets(?ETS_TERRITORY_BATTLE, ?GUILD_KEY(GuildID)).

set_guild_data(GuildID, Guild) ->
    util:put_ets(?ETS_TERRITORY_BATTLE, ?GUILD_KEY(GuildID), Guild).

get_group_info(GroupID) ->
    util:get_ets(?ETS_TERRITORY_BATTLE, ?GROUP_KEY(GroupID)).

set_group_info(GroupID, Group) ->
    util:put_ets(?ETS_TERRITORY_BATTLE, ?GROUP_KEY(GroupID), Group).

get_room_info(LineID) ->
    case util:get_ets(?ETS_TERRITORY_BATTLE, ?ROOM_KEY(LineID)) of
        RoomInfo when is_map(RoomInfo) ->
            RoomInfo;
        _ ->
            ?territory_room
    end.

set_room_info(LineID, RoomInfo) ->
    util:put_ets(?ETS_TERRITORY_BATTLE, ?ROOM_KEY(LineID), RoomInfo).

get_camp_info(CampKey) ->
    util:get_ets(?ETS_TERRITORY_BATTLE, ?CAMP_KEY(CampKey)).

set_camp_info(CampKey, CampInfo) ->
    util:put_ets(?ETS_TERRITORY_BATTLE, ?CAMP_KEY(CampKey), CampInfo).
