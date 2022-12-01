%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     外观
%%% @end
%%% Created : 15. 二月 2019 11:46
%%%-------------------------------------------------------------------
-module(lib_role_exterior).
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_525.hrl").
-include("exterior.hrl").
-include("scene.hrl").
-include("goods.hrl").
-include("vow.hrl").

%% API
-export([
    do/3,
    init/1,
    event/2,
    send_info/1,
    handle_info/2,
    choose_horse/2,
    ope_horse/1,
    scene_exteriors/2,
    get_horse_flag/1,
    fix_horse_stat/2,
    active_horse_with_effect/2,
    active_bubble_with_effect/2,
    active_frame_with_effect/2,
    active_action_with_effect/2
]).

%% 坐骑
do(52501, PS, _Req) ->
    horse_info(PS);
do(52503, PS, _Req) ->
    ope_horse(PS);
do(52505, PS, #cs_exterior_horse_choose{id = ID}) ->
    choose_horse(PS, ID);
%% 气泡
do(52510, PS, _Req) ->
    bubble_info(PS);
do(52512, PS, #cs_exterior_bubble_choose{id = ID}) ->
    choose_bubble(PS, ID);
%% 头像框
do(52520, PS, _Req) ->
    frame_info(PS);
do(52522, PS, #cs_exterior_frame_choose{id = ID}) ->
    choose_frame(PS, ID);
%% 动作
do(52530, PS, _Req) ->
    action_info(PS);
do(52532, PS, #cs_exterior_action{be_invited_id = TargetID, id = ID}) ->
    use_action(PS, TargetID, ID);
do(52535, PS, #cs_exterior_action_res{invited_id = InviteID, res = Res}) ->
    res(PS, InviteID, Res);
do(_, _, _) ->
    skip.

handle_info({invite_action, InviteID, ID}, PS) ->
    invite_action(PS, InviteID, ID);
handle_info({invite_res, Reply, ID}, PS) ->
    invite_res(PS, Reply, ID);
handle_info(_, _) ->
    skip.

event(PS, {timer, 'half_hour'}) ->
    check_expire(PS);
event(_, _) ->
    skip.

init(PS) ->
    horse_init(PS),
    PS1 = bubble_init(PS),
    PS2 = frame_init(PS1),
    {ok, PS2}.

send_info(PS) ->
    bubble_info(PS),
    frame_info(PS),
    action_info(PS),
    ok.

check_expire(PS) ->
    check_horse_expire(PS),
    PS1 = check_bubble_expire(PS),
    PS2 = check_frame_expire(PS1),
    {ok, PS2}.
%% ---------------------------------坐骑-----------------------------

horse_init(PS) ->
    #role_state{id = RoleID} = PS,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE, []),
    Now = time:unixtime(),
    FActiveList = lists:filter(fun({_, Expire}) ->
        Expire > Now orelse Expire =:= 0
                               end, ActiveList),
    HorseChoose = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
    SortActiveList = lists:sort(FActiveList),
    {NewID, _} = ?iif(SortActiveList =:= [], {0, 0}, lists:last(SortActiveList)),
    NewHorseChoose = ?iif(lists:keymember(HorseChoose, 1, FActiveList), HorseChoose, NewID),
    FActiveList =/= ActiveList andalso lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_HORSE, FActiveList),
    NewHorseChoose =/= HorseChoose andalso lib_role_kv:set_kv(PS#role_state.id, ?KEY_EXTERIOR_HORSE_CHOOSE, NewHorseChoose),
    ok.

%% @doc 坐骑信息
horse_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE, []),
    MsgRecord = #sc_exterior_horse_info{active_list = ActiveList},
    {ok, Bin} = prot_msg:encode_msg(52502, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 通过道具效果激活
active_horse_with_effect(PS, UseEffect) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    check_active_effect(UseEffect),
    {ID, AddLastTime} = UseEffect,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE, []),
    ExpireTime = util:prop_get_value(ID, ActiveList),
    Now = time:unixtime(),
    NewExpireTime =
        case AddLastTime =:= 0 orelse ExpireTime =:= 0 of
            %% 永久激活
            true ->
                0;
            %% 首次激活或已过期
            _ when ExpireTime =:= undefined orelse ExpireTime < Now ->
                Now + AddLastTime;
            %% 未过期，延迟过期时间
            _ ->
                ExpireTime + AddLastTime
        end,
    NewActiveList = util:prop_store(ID, NewExpireTime, ActiveList),
    lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_HORSE, NewActiveList),
    MsgRecord = #sc_exterior_horse_info{active_list = NewActiveList},
    {ok, Bin} = prot_msg:encode_msg(52502, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    HorseChoose = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
    HorseChoose =:= 0 andalso
        begin
            lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, ID),
            MsgRecord2 = #sc_exterior_horse_choose{id = ID},
            {ok, Bin2} = prot_msg:encode_msg(52506, MsgRecord2),
            lib_role_send:send_to_sid(RoleSid, Bin2),
            svr_scene_agent:cast_scene(PS#role_state.role_scene, {'ext_horse', RoleID, ID, ?EXT_HIDE})
        end,
    ok.

%% @doc 装备坐骑
choose_horse(PS, ID) ->
    case catch choose_check(PS, ID, ?KEY_EXTERIOR_HORSE) of
        ok ->
            #role_state{sid = RoleSid} = PS,
            lib_role_kv:set_kv(PS#role_state.id, ?KEY_EXTERIOR_HORSE_CHOOSE, ID),
            MsgRecord = #sc_exterior_horse_choose{id = ID},
            {ok, Bin} = prot_msg:encode_msg(52506, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin),
            svr_scene_agent:cast_scene(PS#role_state.role_scene, {'ext_horse', PS#role_state.id, ID, ?EXT_HIDE}),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% @doc 操作坐骑
ope_horse(PS) ->
    case catch check_ope_horse(PS) of
        {ok, HorseChoose} ->
            #role_state{bt_data = BtData} = PS,
            #{horse_stat := HorseStat} = BtData,
            HorseStatN = ?iif(HorseStat =:= 0, 1, 0),
            svr_scene_agent:cast_scene(PS#role_state.role_scene, {'ext_horse', PS#role_state.id, HorseChoose, -1}),
            NewPS = PS#role_state{bt_data = BtData#{horse_stat => HorseStatN}},
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_ope_horse(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    HorseChoose = lib_role_kv:get_kv(PS#role_state.id, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
    HorseChoose > 0 orelse erlang:throw({error, ?RC_EXTERIOR_NOT_ACTIVE_HORSE}),
    #scene{ban_horse = BanHorse} = conf_scene:get(SceneID),
    BanHorse =:= 0 orelse erlang:throw({error, ?RC_EXTERIOR_CAN_OPE}),
    choose_check(PS, HorseChoose, ?KEY_EXTERIOR_HORSE),
    {ok, HorseChoose}.

check_active_effect({_, _} = UseEffect) ->
    UseEffect;
check_active_effect(_GEffect) ->
    throw({error, ?RC_PET_BAD_GOODS_EFFECT}).

%% 生成场景外观数据
scene_exteriors(RoleID, HorseStat) ->
    HorseChoose = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
    ?iif(HorseChoose > 0, [{?EXT_TYPE_HORSE, HorseChoose, HorseStat}], []).

get_horse_flag(Exterior) ->
    case lists:keyfind(?EXT_TYPE_HORSE, 1, Exterior) of
        {_, _, Flag} -> Flag;
        _ -> 0
    end.

%% 切换场景修复坐骑状态
fix_horse_stat(SceneID, Exteriors) ->
    #scene{ban_horse = BanHorse} = conf_scene:get(SceneID),
    case lists:keyfind(?EXT_TYPE_HORSE, 1, Exteriors) of
        {_, ID, ?EXT_SHOW} when BanHorse =:= 1 ->
            lists:keystore(?EXT_TYPE_HORSE, 1, Exteriors, {?EXT_TYPE_HORSE, ID, ?EXT_HIDE});
        _ ->
            Exteriors
    end.

%% 检查过期
check_horse_expire(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE, []),
    Now = time:unixtime(),
    FActiveList = lists:filter(fun({_, Expire}) ->
        Expire > Now orelse Expire =:= 0
    end, ActiveList),
    HorseChoose = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_HORSE_CHOOSE, 0),
    SortActiveList = lists:sort(FActiveList),
    {NewID, _} = ?iif(SortActiveList =:= [], {0, 0}, lists:last(SortActiveList)),
    NewHorseChoose = ?iif(lists:keymember(HorseChoose, 1, FActiveList), HorseChoose, NewID),
    FActiveList =/= ActiveList andalso
        begin
            lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_HORSE, FActiveList),
            MsgRecord = #sc_exterior_horse_info{active_list = FActiveList},
            {ok, Bin} = prot_msg:encode_msg(52502, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin)
        end,
    NewHorseChoose =/= HorseChoose andalso
        begin
            lib_role_kv:set_kv(PS#role_state.id, ?KEY_EXTERIOR_HORSE_CHOOSE, NewHorseChoose),
            MsgRecord1 = #sc_exterior_horse_choose{id = NewHorseChoose},
            {ok, Bin1} = prot_msg:encode_msg(52506, MsgRecord1),
            lib_role_send:send_to_sid(RoleSid, Bin1),
            svr_scene_agent:cast_scene(PS#role_state.role_scene, {'ext_horse', PS#role_state.id, NewHorseChoose, ?EXT_HIDE})
        end,
    ok.

%% ---------------------------------气泡-----------------------------

bubble_init(PS) ->
    #role_state{id = RoleID, personal = Personal} = PS,
    #{bubble := BubbleID} = Personal,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_BUBBLE, []),
    Now = time:unixtime(),
    FActiveList = lists:filter(fun({_, Expire}) ->
        Expire > Now orelse Expire =:= 0
    end, ActiveList),
    NewBubbleID = ?iif(lists:keymember(BubbleID, 1, FActiveList), BubbleID, 0),
    FActiveList =/= ActiveList andalso lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_BUBBLE, FActiveList),
    case BubbleID =/= NewBubbleID of
        true ->
            NewPersonal = Personal#{bubble => NewBubbleID},
            PS#role_state{personal = NewPersonal};
        _ ->
            PS
    end.

%% @doc 气泡信息
bubble_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid, personal = Personal} = PS,
    #{bubble := Bubble} = Personal,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_BUBBLE, []),
    NewActiveList = init_list(RoleID, ActiveList, ?KEY_EXTERIOR_BUBBLE),
    MsgRecord = #sc_exterior_bubble_info{active_list = NewActiveList, id = Bubble},
    {ok, Bin} = prot_msg:encode_msg(52511, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 通过道具效果激活
active_bubble_with_effect(PS, UseEffect) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    check_active_effect(UseEffect),
    {ID, AddLastTime} = UseEffect,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_BUBBLE, []),
    ExpireTime = util:prop_get_value(ID, ActiveList),
    Now = time:unixtime(),
    NewExpireTime =
        case AddLastTime =:= 0 orelse ExpireTime =:= 0 of
            %% 永久激活
            true ->
                0;
            %% 首次激活或已过期
            _ when ExpireTime =:= undefined orelse ExpireTime < Now ->
                Now + AddLastTime;
            %% 未过期，延迟过期时间
            _ ->
                ExpireTime + AddLastTime
        end,
    NewActiveList = util:prop_store(ID, NewExpireTime, ActiveList),
    lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_BUBBLE, NewActiveList),
    MsgRecord = #sc_exterior_bubble_info{active_list = NewActiveList},
    {ok, Bin} = prot_msg:encode_msg(52511, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 装备气泡
choose_bubble(PS, ID) ->
    case catch choose_check(PS, ID, ?KEY_EXTERIOR_BUBBLE) of
        ok ->
            #role_state{sid = RoleSid, personal = Personal} = PS,
            #{bubble := Bubble} = Personal,
            ID =/= Bubble andalso begin
                MsgRecord = #sc_exterior_bubble_choose{id = ID},
                {ok, Bin} = prot_msg:encode_msg(52513, MsgRecord),
                lib_role_send:send_to_sid(RoleSid, Bin)
            end,
            NewPS = PS#role_state{personal = Personal#{bubble => ID}},
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% 检查过期
check_bubble_expire(PS) ->
    #role_state{id = RoleID, sid = RoleSid, personal = Personal} = PS,
    #{bubble := BubbleID} = Personal,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_BUBBLE, []),
    Now = time:unixtime(),
    FActiveList = lists:filter(fun({_, Expire}) ->
        Expire > Now orelse Expire =:= 0
    end, ActiveList),
    NewBubbleID = ?iif(lists:keymember(BubbleID, 1, FActiveList), BubbleID, 0),
    FActiveList =/= ActiveList andalso
        begin
            lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_BUBBLE, FActiveList),
            MsgRecord = #sc_exterior_bubble_info{active_list = FActiveList, id = NewBubbleID},
            {ok, Bin} = prot_msg:encode_msg(52511, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin)
        end,
    case BubbleID =/= NewBubbleID of
        true ->
            {ok, NewPS} = choose_bubble(PS, NewBubbleID),
            NewPS;
        _ ->
            PS
    end.


%% ---------------------------------头像框-----------------------------
frame_init(PS) ->
    #role_state{id = RoleID, personal = Personal} = PS,
    #{frame := Frame} = Personal,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_FRAME, []),
    Now = time:unixtime(),
    FActiveList = lists:filter(fun({_, Expire}) ->
        Expire > Now orelse Expire =:= 0
                               end, ActiveList),
    NewFrame = ?iif(lists:keymember(Frame, 1, FActiveList), Frame, 0),
    FActiveList =/= ActiveList andalso lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_FRAME, FActiveList),
    case NewFrame =/= Frame of
        true ->
            NewPersonal = Personal#{frame => NewFrame},
            PS#role_state{personal = NewPersonal};
        _ ->
            PS
    end.

%% @doc 头像框信息
frame_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid, personal = Personal} = PS,
    #{frame := Frame} = Personal,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_FRAME, []),
    NewActiveList = init_list(RoleID, ActiveList, ?KEY_EXTERIOR_FRAME),
    MsgRecord = #sc_exterior_frame_info{active_list = NewActiveList, id = Frame},
    {ok, Bin} = prot_msg:encode_msg(52521, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 通过道具效果激活
active_frame_with_effect(PS, UseEffect) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    check_active_effect(UseEffect),
    {ID, AddLastTime} = UseEffect,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_FRAME, []),
    ExpireTime = util:prop_get_value(ID, ActiveList),
    Now = time:unixtime(),
    NewExpireTime =
        case AddLastTime =:= 0 orelse ExpireTime =:= 0 of
            %% 永久激活
            true ->
                0;
            %% 首次激活或已过期
            _ when ExpireTime =:= undefined orelse ExpireTime < Now ->
                Now + AddLastTime;
            %% 未过期，延迟过期时间
            _ ->
                ExpireTime + AddLastTime
        end,
    NewActiveList = util:prop_store(ID, NewExpireTime, ActiveList),
    lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_FRAME, NewActiveList),
    MsgRecord = #sc_exterior_frame_info{active_list = NewActiveList},
    {ok, Bin} = prot_msg:encode_msg(52521, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 装备头像框
choose_frame(PS, ID) ->
    case catch choose_check(PS, ID, ?KEY_EXTERIOR_FRAME) of
        ok ->
            #role_state{sid = RoleSid, personal = Personal} = PS,
            #{frame := Frame} = Personal,
            ID =/= Frame andalso begin
                MsgRecord = #sc_exterior_frame_choose{id = ID},
                {ok, Bin} = prot_msg:encode_msg(52523, MsgRecord),
                lib_role_send:send_to_sid(RoleSid, Bin)
            end,
            NewPS = PS#role_state{personal = Personal#{frame => ID}},
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% 检查过期
check_frame_expire(PS) ->
    #role_state{id = RoleID, sid = RoleSid, personal = Personal} = PS,
    #{frame := Frame} = Personal,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_FRAME, []),
    Now = time:unixtime(),
    FActiveList = lists:filter(fun({_, Expire}) ->
        Expire > Now orelse Expire =:= 0
    end, ActiveList),
    NewFrame = ?iif(lists:keymember(Frame, 1, FActiveList), Frame, 0),
    FActiveList =/= ActiveList andalso
        begin
            lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_FRAME, FActiveList),
            MsgRecord = #sc_exterior_frame_info{active_list = FActiveList, id = NewFrame},
            {ok, Bin} = prot_msg:encode_msg(52521, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin)
        end,
    case NewFrame =/= Frame of
        true ->
            {ok, NewPS} = choose_frame(PS, NewFrame),
            NewPS;
        _ ->
            PS
    end.

%% ---------------------------------动作-----------------------------
%% @doc 动作信息
action_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    ActiveList = init_action_list(RoleID),
    SingleTime = get_single_time(),
    CoupeTime = get_coupe_time(),
    MsgRecord = #sc_exterior_action_info{active_list = ActiveList, single_time = SingleTime, coupe_time = CoupeTime},
    {ok, Bin} = prot_msg:encode_msg(52531, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 通过道具效果激活
active_action_with_effect(PS, ID) when ID > 0 ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_ACTION, []),
    NewActiveList = ?iif(lists:member(ID, ActiveList), ActiveList, [ID | ActiveList]),
    lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_ACTION, NewActiveList),
    SingleTime = get_single_time(),
    CoupeTime = get_coupe_time(),
    MsgRecord = #sc_exterior_action_info{active_list = NewActiveList, single_time = SingleTime, coupe_time = CoupeTime},
    {ok, Bin} = prot_msg:encode_msg(52531, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok;
active_action_with_effect(_, _) ->
    skip.

%% 使用动作
use_action(PS, TargetID, ID) ->
    case catch check_use_action(PS, TargetID, ID) of
        ok -> ok;
        {error, Code} -> ?ERROR_TOC(PS, Code)
    end.

check_use_action(PS, TargetID, ID) ->
    #role_state{id = RoleID, bt_data = #{horse_stat := HorseStat}} = PS,
    HorseStat =:= ?EXT_HIDE orelse erlang:throw({error, ?RC_EXTERIOR_ON_HORSE}),
    ActiveList = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_ACTION, []),
    lists:member(ID, ActiveList) orelse erlang:throw({error, ?RC_ACTION_NOT_ACTIVE}),
    Type = conf_exterior_action:get(ID),
    case Type of
        1 ->
            single_action(PS, ID);
        2 ->
            coupe_action(PS, TargetID, ID)
    end.

%% 单人动作
single_action(PS, ID) ->
    SingleTime = get_single_time(),
    Now = time:unixtime(),
    (SingleTime =:= 0 orelse SingleTime < Now) orelse erlang:throw({error, ?RC_ACTION_IN_CD}),
    Cd = config:get_sys_config(single_action_cd),
    NewSingleTime = Now + Cd,
    put_single_time(NewSingleTime),
    notify_action(PS, ID, 0),
    ok.

%% 双人动作
coupe_action(PS, TargetID, ID) ->
    #role_state{id = RoleID, name = Name, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, x = X, y = Y} = RoleScene,
    CoupeTime = get_coupe_time(),
    Now = time:unixtime(),
    CoupeTime < Now orelse erlang:throw({error, ?RC_ACTION_IN_CD}),
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_TASK_TARGET_OFFLINE}),
    Dist = config:get_sys_config(coupe_action_dist),
    lib_scene_api:is_target_near(TargetID, SceneID, LineID, X, Y, Dist)
        orelse erlang:throw({error, ?RC_ACTION_TARGET_NOT_NEAR}),
    MsgRecord = #sc_exterior_action_get_invite{id = ID, sender = Name, invite_id = RoleID},
    {ok, Bin} = prot_msg:encode_msg(52534, MsgRecord),
    lib_role_send:send_to_role(TargetID, Bin),
    lib_role:mod_info(TargetID, ?MODULE, {invite_action, RoleID, ID}),
    Cd = config:get_sys_config(coupe_action_cd),
    NewCoupeTime = CoupeTime + Cd,
    put_coupe_time(NewCoupeTime),
    ok.

%% 加入验证列表
invite_action(_PS, InviteID, ID) ->
    List = get_invite_list(),
    NewList = util:prop_store(InviteID, ID, List),
    put_invite_list(NewList).

%% 结果(被邀请人进程)
res(PS, InviteID, Res) ->
    #role_state{bt_data = #{horse_stat := HorseStat}} = PS,
    IsOnHorse = HorseStat =:= ?EXT_SHOW,
    List = get_invite_list(),
    ID = util:prop_get_value(InviteID, List),
    Reply =
    case Res of
        _ when IsOnHorse ->
            {error, ?RC_EXTERIOR_ON_HORSE};
        1 ->
            case is_integer(ID) andalso ID > 0 of
                true ->
                    SingleTime = get_single_time(),
                    CoupeTime = get_coupe_time(),
                    MsgRecord = #sc_exterior_action{id = ID, single_time = SingleTime, coupe_time = CoupeTime},
                    {ok, Bin} = prot_msg:encode_msg(52533, MsgRecord),
                    lib_role_send:send_to_role(PS#role_state.id, Bin),
                    lib_role:mod_info(PS#role_state.id, lib_role_vow, {trigger, ?DEED_TYPE_COUPE_ACTION, ID, InviteID}),
                    {ok, PS#role_state.id};
                _ ->
                    {error, ?RC_ACTION_INVITE_FAILED}
            end;
        2 ->
            {error, ?RC_ACTION_REFUSE};
        _ ->
            {error, ?RC_ACTION_IN_BATTLE}
    end,
    lib_role:mod_info(InviteID, ?MODULE, {invite_res, Reply, ID}),
    ok.

%% 邀请结果(邀请人进程)
invite_res(PS, Reply, ID) ->
    case Reply of
        {ok, TargetID} ->
            notify_action(PS, ID, TargetID);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% 通知做动作
notify_action(PS, ID, AnotherID) ->
    #role_state{id = RoleID} = PS,
    SingleTime = get_single_time(),
    CoupeTime = get_coupe_time(),
    MsgRecord = #sc_exterior_action{id = ID, single_time = SingleTime, coupe_time = CoupeTime},
    {ok, Bin} = prot_msg:encode_msg(52533, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    MsgRecord2 = #sc_exterior_action_notify{id = ID, invited_id = RoleID, be_invited_id = AnotherID},
    {ok, Bin2} = prot_msg:encode_msg(52536, MsgRecord2),
    lib_scene_api:send_to_role_area_scene(PS, Bin2),
    lib_role:mod_info(RoleID, lib_role_vow, {trigger, ?DEED_TYPE_COUPE_ACTION, ID, AnotherID}),
    ok.


get_invite_list() ->
    case erlang:get({?MODULE, invite}) of
        undefined -> [];
        Value -> Value
    end.

put_invite_list(List) ->
    erlang:put({?MODULE, invite}, List).

get_single_time() ->
    case erlang:get({?MODULE, single}) of
        Time when is_integer(Time) -> Time;
        _ -> 0
    end.

put_single_time(Time) ->
    erlang:put({?MODULE, single}, Time).

get_coupe_time() ->
    case erlang:get({?MODULE, coupe}) of
        Time when is_integer(Time) -> Time;
        _ -> 0
    end.

put_coupe_time(Time) ->
    erlang:put({?MODULE, coupe}, Time).
%% -----------------------------通用----------------------------

init_list(RoleID, List, Key) ->
    List = lib_role_kv:get_kv(RoleID, Key, []),
    case lists:keymember(0, 1, List) of
        true ->
            List;
        _ ->
            NewList = [{0, 0} | List],
            lib_role_kv:set_kv(RoleID, Key, NewList),
            NewList
    end.

init_action_list(RoleID) ->
    List = lib_role_kv:get_kv(RoleID, ?KEY_EXTERIOR_ACTION, []),
    IDList = config:get_sys_config(init_action_id_list),
    [ID | _] = IDList,
    case lists:member(ID, List) of
        true ->
            List;
        _ ->
            NewList = IDList ++ List,
            lib_role_kv:set_kv(RoleID, ?KEY_EXTERIOR_ACTION, NewList),
            NewList
    end.

choose_check(PS, ID, Key) ->
    #role_state{id = RoleID} = PS,
    ActiveList = lib_role_kv:get_kv(RoleID, Key, []),
    lists:keymember(ID, 1, ActiveList) orelse erlang:throw({error, ?RC_EXTERIOR_NOT_ACTIVE}),
    ExpireTime = util:prop_get_value(ID, ActiveList),
    (ExpireTime =:= 0 orelse ExpireTime >= time:unixtime()) orelse erlang:throw({error, ?RC_EXTERIOR_EXPIRED}),
    ok.
