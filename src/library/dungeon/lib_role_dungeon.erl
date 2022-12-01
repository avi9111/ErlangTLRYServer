%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     副本
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_dungeon).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("dungeon.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_252.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    log_dung/3,
    cross_day/1,
    is_passed/3,
    is_passed/4,
    send_info/1,
    handle_info/2,
    gm_reset_all/1,
    get_dung_info/2,
    calc_dung_wave/3,
    is_today_passed/4,
    gm_reset_dungeon/2,
    chapter_first_got/3,
    type_dung_fin_times/2,
    got_first_reward_num/2
]).

handle_info({enter, Opt}, PS) ->
    async_enter(PS, Opt);
handle_info({finish_wave, State, Wave}, PS) ->
    finish_wave(PS, State, Wave);
handle_info({finish_dung, State}, PS) ->
    finish_dung(PS, State);
handle_info({dung_drop, DungID, DropID, MID, Roles}, PS) ->
    dung_drop(PS, DungID, DropID, MID, Roles);
handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_PS, _) ->
    ignore.

do(25201, PS, _Req) ->
    send_info(PS);
do(25203, PS, #cs_dung_reset{dung_id = DungID}) ->
    reset(PS, DungID);
do(25205, PS, #cs_dung_wipe{dung_id = DungID}) ->
    wipe(PS, DungID);
do(25207, PS, #cs_dung_get_first_rwd{dung_id = DungID, level = Lv, wave = Wave}) ->
    get_first_reward(PS, DungID, Lv, Wave);
do(25211, PS, #cs_dung_single{dung_id = DungID}) ->
    send_dung_info(PS, DungID);
do(25213, PS, _Req) ->
    svr_hero_dungeon:hero_dung_info(PS#role_state.sid);
do(25221, PS, #cs_dung_enter{dung_id = DungID, prefer_lv = PreferLv}) ->
    enter(PS, DungID, PreferLv);
do(25223, PS, #cs_dung_enter_team{dung_id = DungID}) ->
    lib_role_team_dungeon:enter(PS, DungID);
do(25225, PS, _Req) ->
    leave(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取副本信息
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    DungList = conf_dungeon:get_ids(),
    Rec = #sc_dung_info{
        dungs = convert_dungs_info(DungList, RoleID, [])
    },
    {ok, Bin} = prot_msg:encode_msg(25202, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_dungs_info([], _RoleID, Acc) ->
    Acc;
convert_dungs_info([DungID | T], RoleID, Acc) ->
    DungInfo = get_dung_info(RoleID, DungID),
    CltDung = convert_dung_info(DungInfo),
    convert_dungs_info(T, RoleID, [CltDung | Acc]).

convert_dung_info(DungInfo) ->
    #{id := DungID, now_lv := NowLv, now_wave := NowWave, max_lv := MaxLv,
        max_wave := MaxWave, ymax_lv := YMaxLv, ymax_wave := YMaxWave,
        chal_times := ChalTimes, wipe_times := WipeTimes, reset_times := ResetTimes,
        life_his := LifeHis, daily_his := DailyHis, daily_wipe := DailyWipe,
        daily_reward := DailyReward, star_info := StarInfo, his_reward := _HisReward,
        first_reward := FirstReward, chapter_reward := ChapterReward,
        assist_times := AssistTimes} = DungInfo,
    #clt_dungeon{
        id = DungID, now_lv = NowLv, now_wave = NowWave, max_lv = MaxLv,
        max_wave = MaxWave, max_lv_yday = YMaxLv, max_wave_yday = YMaxWave,
        star_info = StarInfo, chal_times = ChalTimes, wipe_times = WipeTimes,
        daily_his = DailyHis, daily_wipe = DailyWipe, daily_reward = DailyReward,
        chapter_reward = ChapterReward, reset_times = ResetTimes, life_his = LifeHis,
        first_reward = FirstReward, assist_times = AssistTimes
    }.

%% @doc 获取单个副本信息
send_dung_info(PS, DungID) ->
    #role_state{id = RoleID} = PS,
    DungInfo = get_dung_info(RoleID, DungID),
    Rec = #sc_dung_single{dung = convert_dung_info(DungInfo)},
    {ok, Bin} = prot_msg:encode_msg(25212, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 重置
reset(PS, DungID) ->
    case catch check_reset(PS, DungID) of
        {ok, RoleID, DungInfo, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DUNGEON_RESET),
            update_dung_info(RoleID, DungInfo),
            Rec = #sc_dung_reset{dung = convert_dung_info(DungInfo)},
            {ok, Bin} = prot_msg:encode_msg(25204, Rec),
            lib_role_send:send_to_role(PS, Bin),
            {ok, PS1};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_reset(PS, DungID) ->
    #role_state{id = RoleID} = PS,
    DungConf = conf_dungeon:get(DungID),
    DungConf =/= undefined orelse erlang:throw({error, ?RC_DUNG_CONF_NOT_FOUND}),
    #{reset_times := ConfTimes, reset_cost := ResetCosts} = DungConf,
    VipLv = lib_role_vip:get_vip_lv(),
    MaxTimes = util:prop_get_value(VipLv, ConfTimes, 0),
    DungInfo = get_dung_info(RoleID, DungID),
    #{reset_times := ResetTimes, now_lv := NowLv, now_wave := NowWave} = DungInfo,
    NowLv =:= 1 andalso NowWave =:= 0 andalso erlang:throw({error, ?RC_DUNG_NOT_NEED_RESET}),
    ResetTimes < MaxTimes orelse erlang:throw({error, ?RC_DUNG_NO_RESET_TIMES}),
    NewResetTimes = ResetTimes + 1,
    Gold = util:prop_get_value(NewResetTimes, ResetCosts),
    Costs = [{?AST_GOLD, Gold}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewDungInfo = DungInfo#{
        reset_times => NewResetTimes, now_lv => 1, now_wave => 0, daily_reward => []
    },
    {ok, RoleID, NewDungInfo, Costs}.

%% @doc 扫荡
wipe(PS, DungID) ->
    case catch check_wipe(PS, DungID) of
        {ok, RoleID, DungInfo, ClientReward, AddItems, Mul, DungType, IsGetAll} ->
            update_dung_info(RoleID, DungInfo),
            NewPS1 = lib_role_assets:add_items_notify(PS, AddItems, ?OPT_DUNGEON_SWIPE),
            Rec = #sc_dung_wipe{
                dung = convert_dung_info(DungInfo), rewards = ClientReward,
                mul = erlang:floor(Mul * 10000)
            },
            {ok, Bin} = prot_msg:encode_msg(25206, Rec),
            lib_role_send:send_to_role(PS, Bin),
            IsGetAll orelse ?ERROR_TOC(PS, ?RC_GOODS_NOT_ENOUGH_ROOM),
            %% 副本扫荡事件 {wipe_dung, 副本类型, 副本ID, 次数}
            ?EVENT(RoleID, {'wipe_dung', DungType, DungID, 1}),
            update_rank(PS, DungInfo),
            {ok, NewPS1};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_wipe(PS, DungID) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    DungConf = conf_dungeon:get(DungID),
    DungConf =/= undefined orelse erlang:throw({error, ?RC_DUNG_CONF_NOT_FOUND}),
    #{can_wipe := CanWipe, wipe_lv := WipeLv, type := DungType} = DungConf,
    CanWipe =:= 1 orelse erlang:throw({error, ?RC_DUNG_CAN_NOT_WIPE}),
    RoleLv >= WipeLv orelse erlang:throw({error, ?RC_DUNG_WIPE_LEVEL_LIMIT}),
    DungInfo = get_dung_info(RoleID, DungID),
    #{now_lv := NowLv, max_lv := MaxLv, max_wave := MaxWave, daily_his := DailyHis,
        life_his := LifeHis, daily_reward := DailyReward, star_info := StarInfo,
        wipe_times := WipeTimes} = DungInfo,
    if
        DungID =:= ?DUNG_ID_DOCK ->
            WipeTimes =:= 0 orelse erlang:throw({error, ?RC_DUNG_ALREADY_WIPED}),
            MinLv = 1;
        true ->
            NowLv < MaxLv orelse erlang:throw({error, ?RC_DUNG_WIPE_MAX_LV}),
            MinLv = NowLv
    end,
    %% 循环扫荡
    {NewDailyHis, NewLifeHis, NewDailyReward, ClientReward, AddItems, NewNowLv} =
        loop_wipe(MinLv, MaxLv - 1, MaxWave, DungID, StarInfo, DailyHis, LifeHis, DailyReward, [], [], PS),
    AddItems =/= [] orelse erlang:throw({error, ?RC_GOODS_NOT_ENOUGH_ROOM}),
    Mul = dung_reward_mul(RoleID, DungType),
    NewWipeTimes = WipeTimes + 1,
    NewDungInfo = DungInfo#{
        daily_reward => NewDailyReward, now_lv => NewNowLv, max_wave => MaxWave,
        daily_his => NewDailyHis, life_his => NewLifeHis, wipe_times => NewWipeTimes
    },
    IsGetAll = NewNowLv =:= MaxLv,
    {ok, RoleID, NewDungInfo, ClientReward, AddItems, Mul, DungType, IsGetAll}.

loop_wipe(MaxLv, MaxLv, _, _, _, DailyHis, LifeHis, DailyReward, ClientReward, AddItems, _) ->
    {DailyHis, LifeHis, DailyReward, ClientReward, AddItems, MaxLv + 1};
loop_wipe(MinLv, MaxLv, MaxWave, DungID, StarInfo, DailyHis, LifeHis, DailyReward, ClientReward, AddItems, PS) ->
    CanWipeLv = min(MaxLv, MinLv + 10 - 1),
    {NewDailyHis, NewLifeHis, NewDailyReward, NewClientReward, NewAddItems} =
        loop_wipe_helper(MinLv, CanWipeLv, MaxWave, DungID, StarInfo, DailyHis, LifeHis, DailyReward, [], []),
    NewClientRewardN = ClientReward ++ NewClientReward,
    AddItemsN = AddItems ++ NewAddItems,
    case lib_role_assets:can_add_items(PS, AddItemsN) of
        true ->
            loop_wipe(CanWipeLv, MaxLv, MaxWave, DungID, StarInfo, NewDailyHis, NewLifeHis, NewDailyReward, NewClientRewardN, AddItemsN, PS);
        _ ->
            {DailyHis, LifeHis, DailyReward, ClientReward, AddItems, MinLv + 1}
    end.

loop_wipe_helper(MinLv, CanWipeLv, _, _, _, DailyHis, LifeHis, DailyReward, ClientReward, AddItems) when MinLv > CanWipeLv ->
    {DailyHis, LifeHis, DailyReward, ClientReward, AddItems};
loop_wipe_helper(MinLv, CanWipeLv, MaxWave, DungID, StarInfo, DailyHis, LifeHis, DailyReward, ClientReward, AddItems) ->
    {NewDailyHis, NewLifeHis, NewDailyReward, Drops} = wipe_reward(MinLv, CanWipeLv, MaxWave, DungID, StarInfo, DailyHis, LifeHis, DailyReward, []),
    {NewClientReward, NewAddItems} = calc_wipe_reward(Drops, 1),
    NewClientRewardN = ClientReward ++ NewClientReward,
    AddItemsN = AddItems ++ NewAddItems,
    loop_wipe_helper(MinLv + 1, CanWipeLv, MaxWave, DungID, StarInfo, NewDailyHis, NewLifeHis, NewDailyReward, NewClientRewardN, AddItemsN).

wipe_reward(NowLv, MaxLv, _MaxWave, _DungID, _StarInfo, DailyHis, LifeHis, DailyRwd, Acc) when NowLv > MaxLv ->
    {DailyHis, LifeHis, DailyRwd, [{Lv, DropList} || {Lv, DropList} <- Acc, DropList =/= []]};
wipe_reward(NowLv, MaxLv, MaxWave, DungID, StarInfo, DailyHis, LifeHis, DailyRwd, Acc) ->
    ConfDungLv = conf_dungeon_lv:get({DungID, NowLv}),
    #{wave_award := WaveRewards, daily_award := DailyReward, wave_list := WaveList,
        wipe_star := WipeStar} = ConfDungLv,
    Star = util:prop_get_value(NowLv, StarInfo, 0),
    LvWave = length(WaveList),
    if
        Star < WipeStar ->
            {NewAcc, NewDailyRwd} = {[], DailyRwd};
        true ->
            Reward = [{0, DailyReward}] ++ WaveRewards,
            {NewAcc, NewDailyRwd} = wipe_wave_reward(Reward, NowLv, LvWave, [], DailyRwd)
    end,
    NewLifeHis = util:prop_increase(NowLv, LifeHis),
    NewDailyHis = util:prop_increase(NowLv, DailyHis),
    wipe_reward(NowLv + 1, MaxLv, MaxWave, DungID, StarInfo, NewDailyHis, NewLifeHis, NewDailyRwd, [{NowLv, NewAcc} | Acc]).

wipe_wave_reward([], _Level, _MaxWave, Acc, DailyRwd) ->
    {Acc, DailyRwd};
wipe_wave_reward([{Wave, DropID} | T], Level, MaxWave, Acc, DailyRwd) ->
    case Wave =< MaxWave andalso not lists:member({Level, Wave}, DailyRwd) of
        true ->
            wipe_wave_reward(T, Level, MaxWave, [DropID | Acc], [{Level, Wave} | DailyRwd]);
        _ ->
            wipe_wave_reward(T, Level, MaxWave, Acc, DailyRwd)
    end.

%% @doc 领取首通奖励
get_first_reward(PS, DungID, Lv, Wave) ->
    case catch check_get_first_reward(PS, DungID, Lv, Wave) of
        {ok, RoleID, DungInfo, DropID, FirstReward} ->
            update_dung_info(RoleID, DungInfo),
            lib_drop_api:give_drop_asyn(PS, DropID, ?OPT_DUNGEON_FIRST),
            Rec = #sc_dung_get_first_rwd{
                dung_id = DungID, level = Lv, wave = Wave, first_reward = FirstReward
            },
            {ok, Bin} = prot_msg:encode_msg(25208, Rec),
            ?TASK_EVENT(RoleID, {'dung_first_reward', DungID}),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_first_reward(PS, DungID, Lv, Wave) ->
    #role_state{id = RoleID} = PS,
    DungConf = conf_dungeon:get(DungID),
    DungConf =/= undefined orelse erlang:throw({error, ?RC_DUNG_CONF_NOT_FOUND}),
    ConfDungLv = conf_dungeon_lv:get({DungID, Lv}),
    ConfDungLv =/= undefined orelse erlang:throw({error, ?RC_DUNG_LEVEL_NOT_FOUND}),
    #{first_award := LevelDrop, first_award_star := NeedStar,
        first_wave_award := WaveDrop} = ConfDungLv,
    DungInfo = get_dung_info(RoleID, DungID),
    #{max_lv := MaxLv, first_reward := FirstState, star_info := StarInfo} = DungInfo,
    MaxLv > Lv orelse erlang:throw({error, ?RC_DUNG_LEVEL_NOT_PASS}),
    lists:member({Lv, Wave}, FirstState) andalso erlang:throw({error, ?RC_DUNG_FIRST_REWARD_GOT}),
    if
        Wave =:= 0 ->
            util:prop_get_value(Lv, StarInfo, 0) >= NeedStar
                orelse erlang:throw({error, ?RC_DUNG_LEVEL_STAR_LIMIT}),
            DropID = LevelDrop;
        true ->
            DropID = util:prop_get_value(Wave, WaveDrop, 0)
    end,
    DropID > 0 orelse erlang:throw({error, ?RC_DUNG_NO_FIRST_REWARD}),
    NewFirstState = [{Lv, Wave} | FirstState],
    NewDungInfo = DungInfo#{first_reward => NewFirstState},
    {ok, RoleID, NewDungInfo, DropID, NewFirstState}.

%% -----------------------------------------------------------------------------

%% @doc 进入副本
enter(PS, DungID, PreferLv) ->
    case catch check_enter(PS, DungID, PreferLv) of
        {ok, Costs, Wave, ConfDungLv, MonOpts} ->
            #role_state{id = RoleID} = PS,
            Roles = [?dungeon_enter#{role_id => RoleID}],
            case sup_dungeon:start_child([Roles, RoleID, Wave, ConfDungLv, MonOpts]) of
                {ok, _} ->
                    PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DUNGEON),
                    Rec = #sc_dung_enter{dung_id = DungID},
                    {ok, Bin} = prot_msg:encode_msg(25222, Rec),
                    lib_role_send:send_to_role(PS, Bin),
                    PS1;
                Err ->
                    ?ERROR("start dung error ~w", [Err]),
                    PS
            end;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter(PS, DungID, PreferLv) ->
    #role_state{id = RoleID, combat_power = RoleFight, role_scene = RoleScene} = PS,
    %% 英雄试炼单人副本直接从前一关进入下一关处理
    conf_dungeon:get_count_dowwn(DungID) =< 0 andalso lib_scene_check:ensure_in_normal_scene(RoleScene#role_scene.scene_id),
    ConfDung = conf_dungeon:get(DungID),
    ConfDung =/= undefined orelse erlang:throw({error, ?RC_DUNG_CONF_NOT_FOUND}),
    #{type := DungType, record_wave := RecordWave} = ConfDung,
    DungInfo = get_dung_info(RoleID, DungID),
    #{now_lv := NowLv, now_wave := NowWave, max_lv := MaxLv} = DungInfo,
    %% 关卡，根据副本类型特殊处理
    DungLv = if
        DungType =:= ?DUNG_TYPE_DOCK orelse DungType =:= ?DUNG_TYPE_PRIZE -> %% 自由选择关卡
            PreferLv =< MaxLv + 1 orelse erlang:throw({error, ?RC_DUNG_PREV_NOT_PASS}),
            PreferLv;
        true ->
            ?iif(NowLv =:= 0, 1, NowLv)
    end,
    ConfDungLv = conf_dungeon_lv:get({DungID, DungLv}),
    ConfDungLv =/= undefined orelse erlang:throw({error, ?RC_DUNG_MAX_LV}),
    #{limit := Limits, consume := Consume, fight := Fight} = ConfDungLv,
    Wave = ?iif(RecordWave =:= 1, NowWave + 1, 1),
    enter_limits(Limits, PS),
    Costs = Consume,
    lib_role_assets:check_items_enough(PS, Costs),
    if
        DungType =:= ?DUNG_TYPE_SAVIOR ->
            MonOpts = get_savior_buff(RoleFight, Fight);
        true ->
            MonOpts = []
    end,
    {ok, Costs, Wave, ConfDungLv, MonOpts}.

enter_limits([], _PS) ->
    ok;
enter_limits([Limit | T], PS) ->
    enter_limit(Limit, PS),
    enter_limits(T, PS).

enter_limit({?DUNG_ENTER_LV, NeedLv}, PS) ->
    PS#role_state.level >= NeedLv;
enter_limit(_Limit, _PS) ->
    erlang:throw({error, ?RC_DUNG_INVALID_ENTER_LIMIT}).

async_enter(PS, [DungID, SceneID, LineID, ToX, ToY, Assist]) ->
    #role_state{id = RoleID} = PS,
    case lib_dungeon_util:is_sh_team_dung(DungID) of
        true ->
            DungInfo = get_dung_info(RoleID, ?DUNG_ID_SH_1);
        _ ->
            DungInfo = get_dung_info(RoleID, DungID)
    end,
    #{chal_times := ChalTimes, assist_times := AssistTimes} = DungInfo,
    if
        Assist ->
            NewChalTimes = ChalTimes, NewAssistTimes = AssistTimes + 1;
        true ->
            NewChalTimes = ChalTimes + 1, NewAssistTimes = AssistTimes
    end,
    NewDungInfo = DungInfo#{
        chal_times => NewChalTimes, assist_times => NewAssistTimes
    },
    update_dung_info(RoleID, NewDungInfo),
    SceneOpt = if
        DungID =:= ?DUNG_ID_SAVIOR ->
            [{realm, ?DUNG_REALM_ROLE}, {full_hpmp, 0}];
        true ->
            [{realm, ?DUNG_REALM_ROLE}]
    end,
    ?TASK_EVENT(PS, {'enter_dung', DungID}),
    PS1 = PS#role_state{scene_opt = SceneOpt},
    lib_scene_api:change_scene(PS1, SceneID, LineID, ToX, ToY).

%% @doc 退出副本
leave(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    case lib_scene_api:is_dungeon_scene(RoleScene) of
        true ->
            #role_scene{scene_id = SceneID} = RoleScene,
            {ok, PS1} = change_scene(PS, SceneID),
            Rec = #sc_dung_leave{},
            {ok, Bin} = prot_msg:encode_msg(25226, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        _ ->
            PS
    end.

change_scene(PS, SceneID) ->
    case lib_dungeon_util:is_sh_team_dung(conf_dungeon_lv:scene_dung(SceneID)) of
        true when PS#role_state.guild_id > 0 ->
            lib_scene_api:change_scene(PS, 40001, PS#role_state.guild_id, 356, 481);
        _ ->
            lib_scene_api:return_scene(PS)
    end.

get_savior_buff(RoleFight, Fight) when RoleFight < Fight ->
    BossBuff = config:get_sys_config(hero_boss_buff),
    BuffID = util:get_zone_config(BossBuff, Fight - RoleFight),
    [{buff, [{BuffID, 1}, {21100, 1}]}];
get_savior_buff(_, _) ->
    [{buff, [{21100, 1}]}].

%% -----------------------------------------------------------------------------
%% 副本逻辑
%% -----------------------------------------------------------------------------

%% @doc 完成某一波
finish_wave(PS, State, Wave) ->
    #{begin_time := BeginTime} = State,
    finish_wave_(time:is_today(BeginTime), PS, State, Wave).

finish_wave_(false, _PS, _State, _Wave) ->
    ignore;
finish_wave_(true, PS, State, Wave) ->
    #role_state{id = RoleID} = PS,
    #{id := DungID, conf := ConfDungLv} = State,
    DungInfo = get_dung_info(RoleID, DungID),
    #{first_reward := FirstRewards} = DungInfo,
    #{level := Level, first_wave_award := FWaveRewards, wave_award := WaveRewards} = ConfDungLv,
    ConfDung = conf_dungeon:get(DungID),
    #{first_auto := FirstAuto, type := DungType} = ConfDung,
    Mul = dung_reward_mul(RoleID, DungType),
    DropID = util:prop_get_value(Wave, WaveRewards, 0),
    FDropID = util:prop_get_value(Wave, FWaveRewards, 0),
    case FirstAuto =:= 1 andalso FDropID > 0
        andalso lists:member({Level, Wave}, FirstRewards) =:= false of
        true ->
            NewFirstRewards = [{Level, Wave} | FirstRewards],
            Drops = [Did || Did <- [DropID], Did =/= 0];
        _ ->
            NewFirstRewards = FirstRewards,
            Drops = [Did || Did <- [FDropID, DropID], Did =/= 0]
    end,
    Drops =/= [] andalso begin
        AddItems = lib_drop_api:give_drop_asyn(RoleID, {Drops, Mul}, ?OPT_DUNGEON),
        add_cache_reward(AddItems)
    end,
    NewDungInfo = DungInfo#{
        first_reward => NewFirstRewards, now_lv => Level, now_wave => Wave
    },
    update_dung_info(RoleID, NewDungInfo),
    update_rank(PS, NewDungInfo),
    ok.

%% @doc
dung_drop(PS, DungID, DropID, MID, Roles) ->
    Cate = lib_dungeon_util:get_dung_cate(DungID),
    dung_drop(Cate, PS, DungID, DropID, MID, Roles).

dung_drop(?DUNG_CATE_TEAM, PS, DungID, DropID, MID, Roles) ->
    #role_state{id = RoleID} = PS,
    IsTreasureMap = lists:member(DungID, [?DUNG_ID_RARE_MAP, ?DUNG_ID_TOP_MAP]),
    Assist = lib_dungeon_util:is_assist(RoleID, Roles),
    if
        (not Assist) orelse IsTreasureMap ->
            lib_role:mod_info(RoleID, lib_role_kill_mon_exp, {mon_exp, MID}),
            lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_DUNGEON_DROP);
        true ->
            ignore
    end;
dung_drop(_, _PS, _DungID, _DropID, _MID, _Roles) ->
    ignore.

%% @doc 完成某一关
finish_dung(PS, State) ->
    #{begin_time := BeginTime, succeed := Succeed, roles := Roles} = State,
    Assist = lib_dungeon_util:is_assist(PS#role_state.id, Roles),
    finish_dung_(time:is_today(BeginTime) andalso Succeed, Assist, PS, State).

finish_dung_(false, _, PS, State) ->
    #{id := DungID, succeed := Succeed, conf := ConfDungLv, stars := Stars,
        begin_time := BeginTime, end_time := EndTime, die_times := DieTimes} = State,
    #{level := Level} = ConfDungLv,
    CostTime = EndTime - BeginTime,
    Succ = ?iif(Succeed, 1, 0),
    TRewards = lib_role_assets:convert_items(erase_cached_rewards()),
    Rec = #sc_dung_result{
        dung_id = DungID, level = Level, succeed = Succ, stars = Stars,
        cost_time = CostTime, die_times = DieTimes, rewards = TRewards,
        hurt_list = []
    },
    {ok, Bin} = prot_msg:encode_msg(25227, Rec),
    lib_role_send:send_to_role(PS, Bin),
    send_dung_info(PS, DungID);
finish_dung_(true, true, PS, State) ->
    #{id := DungID} = State,
    #role_state{id = RoleID} = PS,
    ConfDung = conf_dungeon:get(DungID),
    #{cate := DungCate} = ConfDung,
    RewardTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_DUNG_ASSIST),
    MaxTimes = config:get_sys_config(dung_assist_reward_times),
    if
        DungCate =:= ?DUNG_CATE_TEAM andalso RewardTimes < MaxTimes ->
            Emprise = config:get_sys_config(dung_assist_emprise),
            lib_drop_api:give_drop_asyn(RoleID, Emprise, ?OPT_DUNGEON),
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_DUNG_ASSIST, RewardTimes + 1);
        true ->
            ignore
    end,
    finish_dung_(false, true, PS, State);
finish_dung_(true, _, PS, State) ->
    #role_state{id = RoleID} = PS,
    #{id := DungID, succeed := Succeed, conf := ConfDungLv, stars := Stars,
        begin_time := BeginTime, end_time := EndTime, die_times := DieTimes,
        wave := Wave, max_wave := CMaxWave, leader := Leader} = State,
    #{level := Level, first_award := CFirstRewards, first_award_star := FirstStar,
        daily_award := DailyAward, leader_reward := LeaderReward} = ConfDungLv,
    ConfDung = conf_dungeon:get(DungID),
    #{first_auto := FirstAuto, type := DungType} = ConfDung,
    DungInfo = get_dung_info(RoleID, DungID),
    #{max_lv := MaxLv, max_wave := MaxWave, daily_reward := DailyRewards,
        daily_his := DailyHis, first_reward := FirstRewards, life_his := LifeHis,
        star_info := StarInfo, chapter_reward := ChapterReward} = DungInfo,
    if
        LeaderReward > 0 andalso Leader =:= RoleID ->
            LRewards = [LeaderReward];
        true ->
            LRewards = []
    end,
    Star = length(Stars),
    case FirstAuto =:= 1 andalso CFirstRewards > 0 andalso Star >= FirstStar
        andalso (not lists:member({Level, 0}, FirstRewards)) of
        true ->
            FRewards = [CFirstRewards],
            NewFirstRewards = [{Level, 0} | FirstRewards],
            ?TASK_EVENT(RoleID, {'dung_first_reward', DungID});
        _ ->
            FRewards = [],
            NewFirstRewards = FirstRewards
    end,
    case DailyAward > 0 andalso ((not lists:member({Level, 0}, DailyRewards)) orelse
        DungType =:= ?DUNG_TYPE_CHESS) of
        true ->
            DRewards = [DailyAward],
            NewDailyRewards = util:list_uniq([{Level, 0} | DailyRewards]);
        _ ->
            DRewards = [],
            NewDailyRewards = DailyRewards
    end,
    Rewards = LRewards ++ FRewards ++ DRewards,
    ChapterRewardN = calc_chapter_reward(RoleID, DungID, Level, ChapterReward),
    case util:prop_get_value(Level, StarInfo, 0) of
        OldStar when OldStar =< Star ->
            NewStarInfo = util:prop_store(Level, Star, StarInfo);
        _ ->
            NewStarInfo = StarInfo
    end,
    NewLifeHis = util:prop_increase(Level, LifeHis),
    NewDailyHis = util:prop_increase(Level, DailyHis),
    {NewLv, NewWave} = ?iif(Wave >= CMaxWave, {Level + 1, 0}, {Level, Wave}),
    {NewMaxLv, NewMaxWave} = if
        NewLv >= MaxLv -> {NewLv, 0};
        NewLv =:= MaxLv andalso NewWave > MaxWave -> {NewLv, NewWave};
        true -> {MaxLv, MaxWave}
    end,
    NewDungInfo = DungInfo#{
        now_lv => NewLv, now_wave => NewWave, max_lv => NewMaxLv,
        max_wave => NewMaxWave, daily_his => NewDailyHis, life_his => NewLifeHis,
        first_reward => NewFirstRewards, daily_reward => NewDailyRewards,
        star_info => NewStarInfo, chapter_reward => ChapterRewardN
    },
    update_dung_info(RoleID, NewDungInfo),
    Mul = dung_reward_mul(RoleID, DungType),
    AddItems = lib_drop_api:give_drop_asyn(PS, {Rewards, Mul}, ?OPT_DUNGEON),
    Succ = ?iif(Succeed, 1, 0),
    CostTime = EndTime - BeginTime,
    TRewards = lib_role_assets:convert_items(erase_cached_rewards() ++ AddItems),
    IsFirstChal = ?iif(NewMaxLv > MaxLv, 1, 0),
    Rec = #sc_dung_result{
        dung_id = DungID, level = Level, succeed = Succ, stars = Stars,
        cost_time = CostTime, die_times = DieTimes, rewards = TRewards,
        hurt_list = [], mul = erlang:floor(Mul * 10000),
        is_first_chal = IsFirstChal
    },
    {ok, Bin} = prot_msg:encode_msg(25227, Rec),
    lib_role_send:send_to_role(PS, Bin),
    send_dung_info(PS, DungID),
    log_dung(State, RoleID, 3),
    ?EVENT(RoleID, {'finish_dung', DungType, DungID, 1}),
    ?TASK_EVENT(RoleID, {pass_dung, DungID, Level}),
    lib_role_mentor:is_team_with_mentor(PS) andalso ?TASK_EVENT(RoleID, {'mentor_dungeon', DungID}),
    update_rank(PS, NewDungInfo),
    LiveID = lib_role_daily_lively:dungen_map(DungID),
    lib_role_marriage:part_team_act(RoleID, LiveID, ?OPT_DUNGEON),
    ok.

%% @doc 副本奖励倍数 [活动等]
dung_reward_mul(_RoleID, _DungType) ->
    1.

add_cache_reward(Drops) ->
    case erlang:get({?MODULE, cache_reward}) of
        L when is_list(L) ->
            erlang:put({?MODULE, cache_reward}, Drops ++ L);
        _ ->
            erlang:put({?MODULE, cache_reward}, Drops)
    end.

erase_cached_rewards() ->
    case erlang:erase({?MODULE, cache_reward}) of
        L when is_list(L) -> L;
        _ -> []
    end.

%% 章节奖励
calc_chapter_reward(RoleID, ?DUNG_ID_SAVIOR, Level, ChapterReward) ->
    Chapters = conf_dungeon_chapter:get_chapters(?DUNG_ID_SAVIOR),
    {Drop, ChapterRewardN, Chapter} = calc_chapter_reward_helper(Chapters, ChapterReward, Level),
    Drop > 0 andalso begin
        lib_drop_api:give_drop_asyn(RoleID, Drop, ?OPT_DUNGEON_CHAPTER),
        Rec = #sc_dung_get_chapter_rwd{
            dung_id = ?DUNG_ID_SAVIOR, chapter = Chapter, star = 0,
            chapter_reward = ChapterRewardN
        },
        {ok, Bin} = prot_msg:encode_msg(25210, Rec),
        lib_role_send:send_to_role(RoleID, Bin)
    end,
    ChapterRewardN;
calc_chapter_reward(_, _, _, ChapterReward) ->
    ChapterReward.

calc_chapter_reward_helper([], ChapterReward, _Level) ->
    {0, ChapterReward, 0};
calc_chapter_reward_helper([Chapter | T], ChapterReward, Level) ->
    Key = {Chapter, 0},
    MaxLevel = lists:max(conf_dungeon_lv:get_chapter_lv(?DUNG_ID_SAVIOR, Chapter)),
    IsReach = Level >= MaxLevel,
    case lists:member(Key, ChapterReward) of
        false when IsReach ->
            case conf_dungeon_chapter:get({?DUNG_ID_SAVIOR, Chapter, 0}) of
                #{reward := Reward} ->
                    {Reward, [Key | ChapterReward], Chapter};
                _ ->
                    {0, ChapterReward, 0}
            end;
        false ->
            {0, ChapterReward, 0};
        _ ->
            calc_chapter_reward_helper(T, ChapterReward, Level)
    end.

log_dung(State, RoleID, Action) ->
    #{id := DungID, level := Level, roles := Roles} = State,
    Now = time:unixtime(),
    Mode = ?iif(lib_dungeon_util:is_assist(RoleID, Roles), 2, 1),
    DbMembers = type:term_to_bitstring([MemID || #{role_id := MemID} <- Roles, MemID =/= RoleID]),
    SQL = io_lib:format(?SQL_LOG_ROLE_DUNGEON, [RoleID, DungID, Level, Mode, Action, DbMembers, Now]),
    ?LOG(SQL).

%% -----------------------------------------------------------------------------
%% 常用方法
%% -----------------------------------------------------------------------------

%% @doc 是否通关
is_passed(RoleID, DungID, Level) ->
    DungInfo = get_dung_info(RoleID, DungID),
    #{max_lv := MaxLv} = DungInfo,
    MaxLv > Level.

is_passed(RoleID, DungID, Level, Wave) ->
    DungInfo = get_dung_info(RoleID, DungID),
    #{max_lv := MaxLv, max_wave := MaxWave} = DungInfo,
    MaxLv > Level orelse (MaxLv =:= Level andalso MaxWave >= Wave).

%% @doc 今天是否通关
is_today_passed(RoleID, DungID, Level, Wave) ->
    DungInfo = get_dung_info(RoleID, DungID),
    #{now_lv := NowLv, now_wave := NowWave} = DungInfo,
    NowLv > Level orelse (NowLv =:= Level andalso NowWave >= Wave).

%% @doc 指定类型副本完成次数
type_dung_fin_times(RoleID, Type) ->
    IDs = conf_dungeon:get_id_by_type(Type),
    dung_fin_times(RoleID, IDs).

dung_fin_times(RoleID, IDs) when is_list(IDs) ->
    lists:sum([dung_fin_times(RoleID, ID) || ID <- IDs]);
dung_fin_times(RoleID, DungID) when is_integer(DungID) ->
    DungInfo = get_dung_info(RoleID, DungID),
    #{life_his := LifeHis} = DungInfo,
    util:prop_get_value(1, LifeHis, 0).

calc_dung_wave(DungID, MaxLv, MaxWave) ->
    case conf_dungeon_lv:get({DungID, 1}) of
        #{wave_list := WaveList} ->
            LvWave = length(WaveList),
            erlang:max(MaxLv - 1, 0) * LvWave + MaxWave;
        _ ->
            0
    end.

%% @doc 更新排行榜
update_rank(PS, DungInfo) ->
    lib_role_rank:update_dung_rank(PS, DungInfo).

calc_wipe_reward(Drops, Mul) ->
    lists:foldl(fun({Lv, DropIDList}, {ClientAcc, DropAcc}) ->
        AddItems = lib_drop_base:get_drop_goods([{DropIDList, Mul}]),
        ClientReward =
            lists:foldl(fun({Type, Value}, Acc) ->
                case Type =:= ?AST_ITEM of
                    true ->
                        [{?AST_ITEM, GID, GNum} || #{id := GID, num := GNum} <- Value] ++ Acc;
                    _ ->
                        [{Type, 0, Value} | Acc]
                end
            end, [], AddItems),
        {[#dund_wipe_drop_info{lv = Lv, rewards = ClientReward} | ClientAcc], AddItems ++ DropAcc}
    end, {[], []}, Drops).

got_first_reward_num(RoleID, DungID) ->
    DungInfo = get_dung_info(RoleID, DungID),
    #{first_reward := FirstState} = DungInfo,
    LvList = conf_dungeon_lv:get_dung_lv(DungID),
    got_first_reward_num(LvList, DungID, FirstState, 0).

got_first_reward_num([], _DungID, _FirstState, Acc) ->
    Acc;
got_first_reward_num([Lv | T], DungID, FirstState, Acc) ->
    case conf_dungeon_lv:get({DungID, Lv}) of
        #{first_award := Reward} when Reward > 0 ->
            case lists:member({Lv, 0}, FirstState) of
                true ->
                    got_first_reward_num(T, DungID, FirstState, Acc + 1);
                _ ->
                    got_first_reward_num(T, DungID, FirstState, Acc)
            end;
        _ ->
            got_first_reward_num(T, DungID, FirstState, Acc)
    end.

%% @doc 指定章节所有通关奖励
chapter_first_got(RoleID, DungID, Chapter) ->
    DungInfo = get_dung_info(RoleID, DungID),
    #{first_reward := FirstState} = DungInfo,
    LvList = conf_dungeon_lv:get_chapter_lv(DungID, Chapter),
    chapter_first_got2(LvList, DungID, FirstState).

chapter_first_got2([], _DungID, _FirstState) ->
    true;
chapter_first_got2([Lv | T], DungID, FirstState) ->
    case conf_dungeon_lv:get({DungID, Lv}) of
        #{first_award := Reward} when Reward > 0 ->
            case lists:member({Lv, 0}, FirstState) of
                true ->
                    chapter_first_got2(T, DungID, FirstState);
                _ ->
                    false
            end;
        _ ->
            chapter_first_got2(T, DungID, FirstState)
    end.

%% -----------------------------------------------------------------------------
%% 跨天重置
%% -----------------------------------------------------------------------------

%% @doc 跨天重置
reset_dungeons(RoleID) ->
    IDList = conf_dungeon:get_ids(),
    reset_dungeons(IDList, RoleID).

reset_dungeons([], _RoleID) ->
    ok;
reset_dungeons([DungID | T], RoleID) ->
    ConfDung = conf_dungeon:get(DungID),
    #{reset := Reset} = ConfDung,
    DungInfo = get_dung_info(RoleID, DungID),
    #{time := Time} = DungInfo,
    Now = time:unixtime(),
    DiffDay = not time:is_same_day(Time, Now),
    DiffWeek = not time:is_same_week(Time, Now),
    case Reset =:= 1 andalso DiffDay of
        true ->
            reset_dungeon(RoleID, DungInfo, DiffWeek);
        _ ->
            ignore
    end,
    reset_dungeons(T, RoleID).

reset_dungeon(RoleID, DungInfo, DiffWeek) ->
    #{id := DungID, max_lv := MaxLv, max_wave := MaxWave,
        assist_times := AssistTimes} = DungInfo,
    if
        DungID =:= ?DUNG_TEAM_SH andalso not DiffWeek ->
            NewAssistTimes = AssistTimes;
        true ->
            NewAssistTimes = 0
    end,
    NewInfo = DungInfo#{
        now_lv => 1, now_wave => 0, ymax_lv => MaxLv, ymax_wave => MaxWave,
        chal_times => 0, wipe_times => 0, reset_times => 0, daily_his => [],
        daily_wipe => [], daily_reward => [], time => time:unixtime(),
        assist_times => NewAssistTimes
    },
    update_dung_info(RoleID, NewInfo).

%% -----------------------------------------------------------------------------
%% GM命令
%% -----------------------------------------------------------------------------

%% @doc GM 重置指定副本
gm_reset_dungeon(PS, DungID) ->
    conf_dungeon:get(DungID) =/= undefined andalso begin
        gm_reset_dungeon_(PS#role_state.id, DungID),
        send_dung_info(PS, DungID),
        ok
    end.

%% @doc GM 重置所有副本
gm_reset_all(PS) ->
    IDList = conf_dungeon:get_ids(),
    [gm_reset_dungeon_(PS#role_state.id, DungID) || DungID <- IDList],
    send_info(PS),
    ok.

gm_reset_dungeon_(RoleID, DungID) ->
    reset_dungeon(RoleID, get_dung_info(RoleID, DungID), true).

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_DUNGEON, [RoleID]),
    List = db:get_all(SQL),
    init_dung_info(List, []),
    reset_dungeons(RoleID).

%% @doc 下线保存
save(PS) ->
    save_(leave(PS)).

%% @doc 跨天
cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    reset_dungeons(RoleID).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    save_dungeons(RoleID).

init_dung_info([], _Acc) ->
    ok;
init_dung_info([[DungID, NowLv, NowWave, MaxLv, MaxWave, YMaxLv, YMaxWave, ChalTimes,
    WipeTimes, AssistTimes, ResetTimes, DbLifeHis, DbDailyHis, DbDailyWipe, DbDailyReward,
    DbStarInfo, DbHisReward, DbFirstReward, DbChapterReward, DbExtra, Time] | T], Acc) ->
    LifeHis = type:convert_db_field(list, DbLifeHis, []),
    DailyHis = type:convert_db_field(list, DbDailyHis, []),
    DailyWipe = type:convert_db_field(list, DbDailyWipe, []),
    DailyReward = type:convert_db_field(list, DbDailyReward, []),
    StarInfo = type:convert_db_field(list, DbStarInfo, []),
    HisReward = type:convert_db_field(list, DbHisReward, []),
    FirstReward = type:convert_db_field(list, DbFirstReward, []),
    ChapterReward = type:convert_db_field(list, DbChapterReward, []),
    Extra = type:convert_db_field(list, DbExtra, []),
    DungInfo = ?dungeon_info#{
        id => DungID, now_lv => NowLv, now_wave => NowWave, max_lv => MaxLv,
        max_wave => MaxWave, ymax_lv => YMaxLv, ymax_wave => YMaxWave,
        chal_times => ChalTimes, wipe_times => WipeTimes, assist_times => AssistTimes,
        reset_times => ResetTimes, life_his => LifeHis, daily_his => DailyHis,
        daily_wipe => DailyWipe, daily_reward => DailyReward, star_info => StarInfo,
        his_reward => HisReward, first_reward => FirstReward,
        chapter_reward => ChapterReward, extra => Extra, time => Time
    },
    set_dung_info(DungID, DungInfo),
    init_dung_info(T, [DungID | Acc]).

save_dungeons(RoleID) ->
    IDList = conf_dungeon:get_ids(),
    save_dungeons(IDList, RoleID, []).

save_dungeons([], _RoleID, Acc) ->
    db:insert_values(?SQL_SET_ROLE_DUNGEON2, ?SQL_SET_ROLE_DUNGEON3, Acc);
save_dungeons([DungID | T], RoleID, Acc) ->
    case erlang:get(?DICT_DUN_INFO(DungID)) of
        #{updated := true} = DungInfo ->
            #{id := DungID, now_lv := NowLv, now_wave := NowWave, max_lv := MaxLv,
                max_wave := MaxWave, ymax_lv := YMaxLv, ymax_wave := YMaxWave,
                chal_times := ChalTimes, wipe_times := WipeTimes,
                assist_times := AssistTimes, reset_times := ResetTimes,
                life_his := LifeHis, daily_his := DailyHis, daily_wipe := DailyWipe,
                daily_reward := DailyReward, star_info := StarInfo,
                his_reward := HisReward, first_reward := FirstReward,
                chapter_reward := ChapterReward, extra := Extra, time := Time} = DungInfo,
            DbLifeHis = type:term_to_bitstring(LifeHis),
            DbDailyHis = type:term_to_bitstring(DailyHis),
            DbDailyWipe = type:term_to_bitstring(DailyWipe),
            DbDailyReward = type:term_to_bitstring(DailyReward),
            DbStarInfo = type:term_to_bitstring(StarInfo),
            DbHisReward = type:term_to_bitstring(HisReward),
            DbFirstReward = type:term_to_bitstring(FirstReward),
            DbChapterReward = type:term_to_bitstring(ChapterReward),
            DbExtra = type:term_to_bitstring(Extra),
            Fields = [
                RoleID, DungID, NowLv, NowWave, MaxLv, MaxWave, YMaxLv, YMaxWave,
                ChalTimes, WipeTimes, AssistTimes, ResetTimes, DbLifeHis, DbDailyHis,
                DbDailyWipe, DbDailyReward, DbStarInfo, DbHisReward, DbFirstReward,
                DbChapterReward, DbExtra, Time
            ],
            save_dungeons(T, RoleID, [Fields | Acc]);
        _ ->
            save_dungeons(T, RoleID, Acc)
    end.

get_dung_info(_RoleID, DungID) ->
    case erlang:get(?DICT_DUN_INFO(DungID)) of
        DungInfo when is_map(DungInfo) ->
            DungInfo;
        _ ->
            ?dungeon_info#{id => DungID}
    end.

update_dung_info(RoleID, DungInfo) ->
    NewInfo = DungInfo#{updated => true},
    set_dung_info(RoleID, NewInfo).

set_dung_info(_RoleID, DungInfo) ->
    #{id := DungID} = DungInfo,
    erlang:put(?DICT_DUN_INFO(DungID), DungInfo),
    DungInfo.
