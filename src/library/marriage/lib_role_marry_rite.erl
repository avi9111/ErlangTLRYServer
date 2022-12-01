%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     结婚仪式
%%% @end
%%% Created : 28. 二月 2019 9:54
%%%-------------------------------------------------------------------
-module(lib_role_marry_rite).

-include("role.hrl").
-include("keyvalue.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("proto/prot_544.hrl").
-include("marriage.hrl").
-include("op_type.hrl").
-include("chat.hrl").
-include("guild_carry.hrl").
-include("proto/prot_525.hrl").
-include("exterior.hrl").


%% API
-export([
    do/3,
    handle_info/2,
    finish_parade/1,
    is_in_marry_parade/1
]).

do(54401, PS, _Req) ->
    begin_parade(PS);
%% 礼堂
do(54451, PS, _Req) ->
    svr_marry_hall:info(PS#role_state.sid);
do(54453, PS, _Req) ->
    open(PS);
do(54455, PS, #cs_marry_hall_enter{husband_id = TargetID}) ->
    enter(PS, TargetID);
do(54457, PS, _Req) ->
    bai_tang(PS);
do(54459, PS, _Req) ->
    sleep(PS);
do(54461, PS, _Req) ->
    noisy(PS);
do(54463, PS, _Req) ->
    taste(PS);
do(54465, PS, #cs_marry_hall_thank{type = Type}) ->
    thank(PS, Type);
do(54467, PS, _Req) ->
    up(PS);
do(54469, PS, _Req) ->
    leave(PS);
do(_, _, _) ->
    skip.

finish_parade(RoleID) ->
    lib_role:mod_info(RoleID, ?MODULE, 'finish_parade').

handle_info({'send_open_hall_msg', MateName}, PS) ->
    send_open_hall_msg(PS, MateName);
handle_info('finish_parade', #role_state{id = RoleID, stat = Stat, role_scene = RoleScene, gender = Gender, bt_data = BtData} = PS) ->
    PS0 =
        case Gender =:= ?MALE of
            true ->
                #{mate_id := MateID} = lib_marriage:get_role_data(RoleID),
                MsgRecord = #sc_marry_parade_end{husband_id = RoleID, wife_id = MateID},
                {ok, Bin} = prot_msg:encode_msg(54403, MsgRecord),
                lib_scene_api:send_to_role_area_scene(PS, Bin),
                HorseChoose = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
                svr_scene_agent:cast_scene(RoleScene, {'ext_horse', RoleID, HorseChoose, -1}),
                BtDataN = BtData#{horse_stat => ?EXT_HIDE},
                PS#role_state{bt_data = BtDataN};
            _ ->
                PS
        end,
    StatN = bit_map:unset(?SPEC_STAT_BIT_MARRY, Stat),
    svr_scene_agent:cast_scene(RoleScene, {'marry_parade', 2, RoleID}),
    PS0#role_state{stat = StatN};
handle_info('mate_begin_parade', PS) ->
    change_marry_parade_stat(PS);
handle_info({'create_parade', Data, Owner}, _PS) ->
    create_parade(Data, Owner);
handle_info('hall_opened', PS) ->
    hall_opened(PS);
handle_info(_, _) ->
    skip.

%%---------------------------巡游----------------------

begin_parade(PS) ->
    case catch check_begin_parade(PS) of
        {ok, NewPS} -> {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_begin_parade(PS) ->
    #role_state{id = RoleID, team_id = TeamID, role_scene = RoleScene, sid = RoleSid, name = RoleName, gender = Gender} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, line_pid = LinePid} = RoleScene,
    #{mate_id := MateID, marry_id := MarryID} = lib_marriage:get_role_data(RoleID),
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    MarryInfo = lib_marriage:get_marry_info(MarryID),
    MarryInfo =/= undefined orelse erlang:throw({error, ?RC_MARRY_NOT_SAME_MATE}),
    #{is_parade := IsParade, male_id := MaleID, female_id := FemaleID} = MarryInfo,
    IsParade =:= 0 orelse erlang:throw({error, ?RC_MARRY_PARADE_USED}),
    svr_scene_agent:apply_call(SceneID, LineID, lib_carry_agent, is_have_marry_carry, []) andalso erlang:throw({error, ?RC_MARRY_PARADE_WAIT}),
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{members := Members, mem_num := MemNum, leader := Leader} = lib_team:get_team_info(TeamID),
    Leader =:= RoleID orelse erlang:throw({error, ?RC_PET_NOT_TEAM_LEADER}),
    lists:member(MateID, Members) orelse erlang:throw({error, ?RC_MARRY_PARADE_MATE_NOT_IN_TEAM}),
    MemNum =:= 2 orelse erlang:throw({error, ?RC_TEAM_ONLY_TWO_PEOPLE}),
    lib_role:is_online(MateID) orelse erlang:throw({error, ?RC_TEAM_TARGET_NOT_ONLINE}),
    NpcID = conf_guild_carry_common:get(parade_npc),
    lib_scene_api:is_nearby_npc(RoleScene, [NpcID]) orelse erlang:throw({error, ?RC_SWORN_MEM_FAR_FROM_NPC}),
    {_, NpcX, NpcY} = lib_scene_api:get_npc_pos(NpcID),
    lib_scene_api:is_team_near(Members, SceneID, LineID, NpcX, NpcY) orelse erlang:throw({error, ?RC_TREASURE_MAP_TEAM_NOT_TOGHER}),
    CarryLine = conf_guild_carry_common:get(parade_line),
    Quality = conf_guild_carry_common:get(parade_quality),
    CarryScene = conf_guild_carry_scene:get_init_scene(CarryLine),
    #{scene := StartSceneID, start_pos := {X, Y}} = CarryScene,
    StartSceneID =:= SceneID orelse erlang:throw({error, ?RC_SCENE_NOT_INSIDE_SPECIFY}),
    HorseChoose = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
    Gender =:= ?MALE andalso HorseChoose =< 0 andalso erlang:throw({error, ?RC_EXTERIOR_NOT_ACTIVE_HORSE}),
    MsgRecord = #sc_marry_parade_begin{wife_id = FemaleID, husband_id = MaleID},
    {ok, Bin} = prot_msg:encode_msg(54402, MsgRecord),
    lib_scene_api:send_to_role_area_scene(PS, Bin),
    ExpireTime = time:unixtime() + 100 * 60,
    Data = #{
        carry_line => CarryLine, scene_id => SceneID, line_id => LineID,
        line_pid => LinePid, path_index => 1,
        x => X, y => Y, expire_time => ExpireTime, quality => Quality
    },
    Owner = #{
        id => RoleID, sid => RoleSid, name => RoleName, couples => [RoleID, MateID]
    },
    lib_role:mod_info(MateID, ?MODULE, 'mate_begin_parade'),
    lib_role:mod_after(300, ?MODULE, {'create_parade', Data, Owner}),
    %% 巡游前改变状态
    NewPS = change_marry_parade_stat(PS),
    {ok, NewPS}.

change_marry_parade_stat(PS) ->
    #role_state{role_scene = RoleScene, id = RoleID, stat = Stat, bt_data = BtData, gender = Gender} = PS,
    StatN = bit_map:set(?SPEC_STAT_BIT_MARRY, Stat),
    #{horse_stat := HorseStat} = BtData,
    {BeforeStat, AfterStat} = ?iif(Gender =:= ?MALE, {?EXT_HIDE, ?EXT_SHOW}, {?EXT_SHOW, ?EXT_HIDE}),
    BtDataN =
        case HorseStat =:= BeforeStat of
            true ->
                HorseChoose = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
                svr_scene_agent:cast_scene(RoleScene, {'ext_horse', RoleID, HorseChoose, -1}),
                BtData#{horse_stat => AfterStat};
            _ ->
                BtData
        end,
    lib_role_kv:set_kv(RoleID, ?KEY_MARRY_START_PARADE, 1),
    ?TASK_EVENT(RoleID, 'cruise'),
    PS#role_state{stat = StatN, bt_data = BtDataN}.

create_parade(Data, Owner) ->
    LinePid = maps:get(line_pid, Data),
    CreateCarryMsg = {'create_carry', Data, Owner, ?CARRY_TYPE_MARRY},
    is_pid(LinePid) andalso svr_scene_agent:cast_scene(LinePid, CreateCarryMsg).

% 是否巡游
is_in_marry_parade(Stat) ->
    bit_map:is_set(?SPEC_STAT_BIT_MARRY, Stat).

%%---------------------------礼堂----------------------

%% @doc 开启礼堂
open(PS) ->
    case catch check_open(PS) of
        {ok, MarryID, HusbandID, WifeID, EndTime, CostItems, MateName} ->
            NewPS = lib_role_assets:cost_items_notify(PS, CostItems, ?OPT_MARRY_HALL),
            svr_marry_hall:open(MarryID, HusbandID, WifeID, EndTime),
            svr_scene_mgr:add_scene_line_asyn(?MARRY_HALL_SCENE, MarryID),
            MsgRecord = #sc_marry_hall_open{},
            {ok, Bin} = prot_msg:encode_msg(54454, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            send_open_hall_msg(PS, MateName),
            sys_log:log_marry_hall(HusbandID, WifeID),
            [lib_role:mod_info(ID, ?MODULE, 'hall_opened') || ID <- [HusbandID, WifeID]],
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_open(PS) ->
    #role_state{id = RoleID, gender = Gender, name = Name} = PS,
    #{mate_id := MateID, marry_id := MarryID} = lib_marriage:get_role_data(RoleID),
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    MarryInfo = lib_marriage:get_marry_info(MarryID),
    MarryInfo =/= undefined orelse erlang:throw({error, ?RC_MARRY_NOT_SAME_MATE}),
    #{is_open_hall := IsOpen} = MarryInfo,
    IsOpen =:= 0 orelse erlang:throw({error, ?RC_MARRY_HALL_OPENED}),
    in_scene_check(PS, false),
    #{open_hall_cost := Cost} = conf_marry_hall_info:get(),
    CostItems = [Cost],
    lib_role_assets:check_items_enough(PS, CostItems),
    EndTime = time:unixtime() + 1800,
    {HusbandID, WifeID} = ?iif(Gender =:= ?MALE, {RoleID, MateID}, {MateID, RoleID}),
    NewMarryInfo = MarryInfo#{is_open_hall => 1},
    util:put_ets(?ETS_MARRIAGE_U, MarryID, 1),
    util:put_ets(?ETS_MARRIAGE, MarryID, NewMarryInfo),
    lib_role:mod_info(MateID, ?MODULE, {'send_open_hall_msg', Name}),
    {ok, MarryID, HusbandID, WifeID, EndTime, CostItems, lib_cache:get_role_name(MateID)}.

hall_opened(PS) ->
    #role_state{id = RoleID} = PS,
    lib_role_kv:set_kv(RoleID, ?KEY_MARRY_OPEN_HELL, 1),
    ?TASK_EVENT(RoleID, 'open_hall'),
    ok.

%% 发送开启礼堂传闻
send_open_hall_msg(PS, MateName) ->
    #role_state{id = RoleID, server_num = SvrNum, guild_id = GuildID} = PS,
    TargetIDs = lib_friend:get_friend_id_list(RoleID),
    #{string := ChatStr} = conf_string:get(jiehunchuanwen),
    [lib_role_sworn:greet_send_msg(PS, {TargetID, SvrNum}, io_lib:format(ChatStr, [MateName])) || TargetID <- TargetIDs],
    GuildID > 0 andalso lib_role_chat:public_chat(PS, ?CHAT_CHANNEL_GUILD, 0, io_lib:format(ChatStr, [MateName]), "", 0, "", [{max_len, 100}]),
    ok.

%% @doc 进入礼堂
enter(PS, MaleID) ->
    case check_enter(PS, MaleID) of
        {ok, MarryID, FemaleID} ->
            SceneID = ?MARRY_HALL_SCENE,
            {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
            lib_scene_api:change_scene_async(PS#role_state.id, SceneID, MarryID, X, Y),
            MsgRecord = #sc_marry_hall_enter{husband_id = MaleID, wife_id = FemaleID},
            {ok, Bin} = prot_msg:encode_msg(54456, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            svr_marry_hall:enter(MaleID),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter(PS, MaleID) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    #{mate_id := FemaleID, marry_id := MarryID} = lib_marriage:get_role_data(MaleID),
    in_scene_check(PS, false),
    ?MAKE_SURE(svr_marry_hall:enter_check(MarryID)),
    MGuildID = lib_cache:get_role_guild(MaleID),
    FGuildID = lib_cache:get_role_guild(FemaleID),
    (lib_friend:is_friend(RoleID, MaleID) orelse
        lib_friend:is_friend(RoleID, FemaleID) orelse
        GuildID =:= MGuildID orelse
        GuildID =:= FGuildID) orelse
        RoleID =:= MaleID orelse
        RoleID =:= FemaleID orelse
        erlang:throw({error, ?RC_MARRY_HALL_NOT_FRIEND_GUILD}),
    ?iif(RoleID =:= MaleID orelse RoleID =:= FemaleID, ?TASK_EVENT(RoleID, 'open_hall'), skip),
    {ok, MarryID, FemaleID}.

%% @doc 退出
leave(PS) ->
    case catch check_leave(PS) of
        ok ->
            MsgRecord = #sc_marry_hall_leave{},
            {ok, Bin} = prot_msg:encode_msg(54470, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            lib_scene_api:return_scene(PS);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_leave(PS) ->
    in_scene_check(PS, true),
    ok.

%% @doc 拜堂
bai_tang(PS) ->
    case catch check_bai_tang(PS) of
        ok ->
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_bai_tang(PS) ->
    #role_state{id = RoleID, gender = Gender} = PS,
    {ok, SceneID, _LineID} = in_scene_check(PS, true),
    #{mate_id := MateID, marry_id := MarryID} = lib_marriage:get_role_data(RoleID),
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    ?MAKE_SURE(svr_marry_hall:have_hall_check(MarryID)),
    lib_scene_api:is_role_in_scene(?MARRY_HALL_SCENE, MarryID, MateID) orelse erlang:throw({error, ?RC_MARRY_HALL_NOT_IN}),
    #{baitang_use_id := ActionID} = conf_marry_hall_info:get(),
    Type = ?iif(Gender =:= ?MALE, 1, 2),
    lib_scene_api:same_scene_transfer(SceneID, MarryID, RoleID, {112, 224}),
    lib_scene_api:same_scene_transfer(SceneID, MarryID, MateID, {112, 224}),
    notify_action(PS, ActionID, MateID, Type),
    MsgRecord = #sc_marry_hall_baitang{},
    {ok, Bin} = prot_msg:encode_msg(54458, MsgRecord),
    lib_scene_api:send_to_scene(SceneID, MarryID, Bin),
    ?TASK_EVENT(RoleID, 'kowtow'),
    ?TASK_EVENT(MateID, 'kowtow'),
    ok.

%% 洞房
sleep(PS) ->
    case catch check_sleep(PS) of
        {ok, MarryID} ->
            MsgRecord = #sc_marry_hall_sleep{role_id = PS#role_state.id},
            {ok, Bin} = prot_msg:encode_msg(54460, MsgRecord),
            lib_scene_api:send_to_scene(?MARRY_HALL_SCENE, MarryID, Bin),
            svr_marry_hall:sleep(PS#role_state.id, PS#role_state.gender),
            ?TASK_EVENT(PS#role_state.id, 'enter_chamber'),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_sleep(PS) ->
    #role_state{id = RoleID} = PS,
    in_scene_check(PS, true),
    #{mate_id := MateID, marry_id := MarryID} = lib_marriage:get_role_data(RoleID),
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    ?MAKE_SURE(svr_marry_hall:have_hall_check(MarryID)),
    {ok, MarryID}.


%% @doc 从床上起来
up(PS) ->
    case catch check_up(PS) of
        {ok, MarryID} ->
            MsgRecord = #cs_marry_hall_up{},
            {ok, Bin} = prot_msg:encode_msg(54467, MsgRecord),
            lib_scene_api:send_to_scene(?MARRY_HALL_SCENE, MarryID, Bin),
            svr_marry_hall:up(PS#role_state.id, PS#role_state.gender),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_up(PS) ->
    #role_state{id = RoleID} = PS,
    in_scene_check(PS, true),
    #{mate_id := MateID, marry_id := MarryID} = lib_marriage:get_role_data(RoleID),
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    ?MAKE_SURE(svr_marry_hall:have_hall_check(MarryID)),
    {ok, MarryID}.

%% @doc 闹洞房
noisy(PS) ->
    case catch check_noisy(PS) of
        {error, Code} -> ?ERROR_TOC(PS, Code);
        Ret -> Ret
    end.

check_noisy(PS) ->
    #role_state{role_scene = RoleScene, name = Name, sid = RoleSid} = PS,
    #role_scene{line_id = MarryID} = RoleScene,
    ?MAKE_SURE(svr_marry_hall:check_sleep(MarryID)),
    in_scene_check(PS, true),
    MarryInfo = lib_marriage:get_marry_info(MarryID),
    MarryInfo =/= undefined orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{male_id := MaleID, female_id := FemaleID} = MarryInfo,
    #{noisy_cost := Cost, noisy_info_key := Keys} = conf_marry_hall_info:get(),
    Costs = [Cost],
    lib_role_assets:check_items_enough(PS, Costs),
    {MaleKeys, FemaleKeys} = lists:split(2, Keys),
    case util:list_rand([1, 2]) of
        1 ->
            Key = util:list_rand(MaleKeys),
            #{string := Str} = conf_string:get(Key),
            lib_role_chat:public_chat(PS, ?CHAT_CHANNEL_NEARBY, 0, io_lib:format(Str, [lib_cache:get_role_name(MaleID), Name]), "", 0, "");
        _ ->
            Key = util:list_rand(FemaleKeys),
            #{string := Str} = conf_string:get(Key),
            lib_role_chat:public_chat(PS, ?CHAT_CHANNEL_NEARBY, 0, io_lib:format(Str, [lib_cache:get_role_name(FemaleID), Name]), "", 0, "")
    end,
    MsgRecord = #sc_marry_hall_noisy{},
    {ok, Bin} = prot_msg:encode_msg(54462, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    NewPS = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARRY_HALL),
    {ok, NewPS}.

%% @doc 品尝美食
taste(PS) ->
    case catch check_taste(PS) of
        {ok, LastTime} ->
            MsgRecord = #sc_marry_hall_taste{},
            {ok, Bin} = prot_msg:encode_msg(54464, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            lib_role_trans:trans_t(PS, ?TRAN_STAT_MARRY_HALL, LastTime),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_taste(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{line_id = MarryID} = RoleScene,
    util:check_action_limit({?MODULE, taste}, 30),
    ?MAKE_SURE(svr_marry_hall:have_hall_check(MarryID)),
    in_scene_check(PS, true),
    #{tran_last_time := LastTime} = conf_marry_hall_info:get(),
    {ok, LastTime}.

%% @doc 答谢
thank(PS, Type) ->
    case catch check_thank(PS, Type) of
        {ok, Costs, Pos, MarryID, CollID} ->
            NewPS = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARRY_HALL),
            [begin
                lib_scene_api:create_coll_async(CollID, ?MARRY_HALL_SCENE, MarryID, X, Y, [])
            end || {X, Y} <- Pos],
            ?TASK_EVENT(PS#role_state.id, 'thanks_guest'),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_thank(PS, Type) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{line_id = MarryID} = RoleScene,
    #{marry_id := OwnerMarryID} = lib_marriage:get_role_data(RoleID),
    OwnerMarryID =:= MarryID orelse erlang:throw({error, ?RC_MARRY_HALL_ONLY_OWNER_CAN_DO}),
    ?MAKE_SURE(svr_marry_hall:have_hall_check(MarryID)),
    in_scene_check(PS, true),
    Conf = conf_marry_hall_gift:get(Type),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{cost := Cost, coll_id := CollID, coll_num := CollNum, coll_pos := PosList} = Conf,
    Costs = [Cost],
    lib_role_assets:check_items_enough(PS, Costs),
    Pos = util:list_rand_n(PosList, CollNum),
    {ok, Costs, Pos, MarryID, CollID}.


in_scene_check(PS, InScene) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = CurSceneID, line_id = LineID} = RoleScene,
    SceneID = ?MARRY_HALL_SCENE,
    NowInScene = CurSceneID =:= SceneID,
    (InScene =:= true andalso not NowInScene) andalso erlang:throw({error, ?RC_MARRY_HALL_NOT_IN_SCENE}),
    (InScene =:= false andalso NowInScene) andalso erlang:throw({error, ?RC_MARRY_HALL_ALREADY_IN_SCENE}),
    {ok, SceneID, LineID}.

%% 通知做动作
notify_action(PS, ID, AnotherID, Type) ->
    #role_state{id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID} = RoleScene,
    MsgRecord = #sc_exterior_action{id = ID, single_time = 0, coupe_time = 0},
    {ok, Bin} = prot_msg:encode_msg(52533, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    lib_role_send:send_to_role(AnotherID, Bin),
    {InviteID, TargetID} =
        if
            Type =:= 1 ->
                {RoleID, AnotherID};
            Type =:= 2 ->
                {AnotherID, RoleID};
            true ->
                {RoleID, 0}
        end,
    MsgRecord2 = #sc_exterior_action_notify{id = ID, invited_id = InviteID, be_invited_id = TargetID},
    {ok, Bin2} = prot_msg:encode_msg(52536, MsgRecord2),
    lib_scene_api:send_to_scene(SceneID, LineID, Bin2),
    ok.
