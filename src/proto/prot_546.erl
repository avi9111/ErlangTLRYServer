-module(prot_546).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_546.hrl").


%% ---------------------------------------------------------------------------------------

decode(54601, _BinData) ->

    UnpackRecordData = #cs_sword_fight_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54602, _BinData) ->

    UnpackRecordData = #sc_sword_fight_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54603, _BinData) ->

    UnpackRecordData = #cs_sword_fight_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54604, _BinData) ->

    UnpackRecordData = #sc_sword_fight_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54605, BinData) ->
    {_RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_sword_fight_reward{
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54606, BinData) ->
    {_RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_sword_fight_reward{
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54621, _BinData) ->

    UnpackRecordData = #cs_sword_fight_lounge_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54622, BinData) ->
    {RBin0, MatchTime} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, BattleTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, LeaveTimes} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, WinTimes} = prot_util:unpack(RBin2, {8, unsigned}),
    {_RBin4, RewardList} = prot_util:unpack(RBin3, [{8, unsigned}]),

    UnpackRecordData = #sc_sword_fight_lounge_info{
        match_time = MatchTime,
        battle_times = BattleTimes,
        leave_times = LeaveTimes,
        win_times = WinTimes,
        reward_list = RewardList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54623, BinData) ->
    {_RBin0, BattleEnd} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_sword_fight_enter_bat{
        battle_end = BattleEnd
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54624, BinData) ->
    {_RBin0, HurtList} = prot_util:unpack(BinData, [{{64, unsigned}, {64, unsigned}}]),

    UnpackRecordData = #sc_sword_fight_update_hurt{
        hurt_list = HurtList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54625, BinData) ->
    {RBin0, Res} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, AddPrestige} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, AddCoin} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, SelfData} = prot_util:unpack(RBin2, {u,clt_sword_res}),
    {RBin4, OtherData} = prot_util:unpack(RBin3, {u,clt_sword_res}),
    {_RBin5, LeaveTime} = prot_util:unpack(RBin4, {32, unsigned}),

    UnpackRecordData = #sc_sword_fight_bat_end{
        res = Res,
        add_prestige = AddPrestige,
        add_coin = AddCoin,
        self_data = SelfData,
        other_data = OtherData,
        leave_time = LeaveTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(54601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54602, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54603, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54604, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54605, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#cs_sword_fight_reward.times, {8, unsigned}),

    BinData = <<
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54606, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_sword_fight_reward.times, {8, unsigned}),

    BinData = <<
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54621, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54622, PackRecordData) ->
    MatchTime = prot_util:pack(PackRecordData#sc_sword_fight_lounge_info.match_time, {32, unsigned}),
    BattleTimes = prot_util:pack(PackRecordData#sc_sword_fight_lounge_info.battle_times, {8, unsigned}),
    LeaveTimes = prot_util:pack(PackRecordData#sc_sword_fight_lounge_info.leave_times, {8, unsigned}),
    WinTimes = prot_util:pack(PackRecordData#sc_sword_fight_lounge_info.win_times, {8, unsigned}),
    RewardList = prot_util:pack(PackRecordData#sc_sword_fight_lounge_info.reward_list, [{8, unsigned}]),

    BinData = <<
        MatchTime/binary,
        BattleTimes/binary,
        LeaveTimes/binary,
        WinTimes/binary,
        RewardList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54623, PackRecordData) ->
    BattleEnd = prot_util:pack(PackRecordData#sc_sword_fight_enter_bat.battle_end, {32, unsigned}),

    BinData = <<
        BattleEnd/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54624, PackRecordData) ->
    HurtList = prot_util:pack(PackRecordData#sc_sword_fight_update_hurt.hurt_list, [{{64, unsigned}, {64, unsigned}}]),

    BinData = <<
        HurtList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54625, PackRecordData) ->
    Res = prot_util:pack(PackRecordData#sc_sword_fight_bat_end.res, {8, unsigned}),
    AddPrestige = prot_util:pack(PackRecordData#sc_sword_fight_bat_end.add_prestige, {8, unsigned}),
    AddCoin = prot_util:pack(PackRecordData#sc_sword_fight_bat_end.add_coin, {32, unsigned}),
    SelfData = prot_util:pack(PackRecordData#sc_sword_fight_bat_end.self_data, {u,clt_sword_res}),
    OtherData = prot_util:pack(PackRecordData#sc_sword_fight_bat_end.other_data, {u,clt_sword_res}),
    LeaveTime = prot_util:pack(PackRecordData#sc_sword_fight_bat_end.leave_time, {32, unsigned}),

    BinData = <<
        Res/binary,
        AddPrestige/binary,
        AddCoin/binary,
        SelfData/binary,
        OtherData/binary,
        LeaveTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

