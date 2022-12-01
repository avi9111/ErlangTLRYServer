-module(prot_252).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_252.hrl").


%% ---------------------------------------------------------------------------------------

decode(25201, _BinData) ->

    UnpackRecordData = #cs_dung_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25202, BinData) ->
    {_RBin0, Dungs} = prot_util:unpack(BinData, [{u,clt_dungeon}]),

    UnpackRecordData = #sc_dung_info{
        dungs = Dungs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25203, BinData) ->
    {_RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_dung_reset{
        dung_id = DungId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25204, BinData) ->
    {_RBin0, Dung} = prot_util:unpack(BinData, {u,clt_dungeon}),

    UnpackRecordData = #sc_dung_reset{
        dung = Dung
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25205, BinData) ->
    {_RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_dung_wipe{
        dung_id = DungId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25206, BinData) ->
    {RBin0, Mul} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Dung} = prot_util:unpack(RBin0, {u,clt_dungeon}),
    {_RBin2, Rewards} = prot_util:unpack(RBin1, [{u,dund_wipe_drop_info}]),

    UnpackRecordData = #sc_dung_wipe{
        mul = Mul,
        dung = Dung,
        rewards = Rewards
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25207, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Level} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, Wave} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_dung_get_first_rwd{
        dung_id = DungId,
        level = Level,
        wave = Wave
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25208, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Level} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Wave} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, FirstReward} = prot_util:unpack(RBin2, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_dung_get_first_rwd{
        dung_id = DungId,
        level = Level,
        wave = Wave,
        first_reward = FirstReward
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25209, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Chapter} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Star} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_dung_get_chapter_rwd{
        dung_id = DungId,
        chapter = Chapter,
        star = Star
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25210, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Chapter} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Star} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, ChapterReward} = prot_util:unpack(RBin2, [{{16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_dung_get_chapter_rwd{
        dung_id = DungId,
        chapter = Chapter,
        star = Star,
        chapter_reward = ChapterReward
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25211, BinData) ->
    {_RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_dung_single{
        dung_id = DungId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25212, BinData) ->
    {_RBin0, Dung} = prot_util:unpack(BinData, {u,clt_dungeon}),

    UnpackRecordData = #sc_dung_single{
        dung = Dung
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25213, _BinData) ->

    UnpackRecordData = #cs_dung_hero_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25214, BinData) ->
    {_RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_dung_hero_info{
        dung_id = DungId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25221, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, PreferLv} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_dung_enter{
        dung_id = DungId,
        prefer_lv = PreferLv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25222, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, PreferLv} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_dung_enter{
        dung_id = DungId,
        prefer_lv = PreferLv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25223, BinData) ->
    {_RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_dung_enter_team{
        dung_id = DungId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25224, BinData) ->
    {_RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_dung_enter_team{
        dung_id = DungId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25225, _BinData) ->

    UnpackRecordData = #cs_dung_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25226, _BinData) ->

    UnpackRecordData = #sc_dung_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25227, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Mul} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Level} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Succeed} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Stars} = prot_util:unpack(RBin3, [{8, unsigned}]),
    {RBin5, CostTime} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, DieTimes} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Rewards} = prot_util:unpack(RBin6, [{{16, unsigned}, {32, unsigned}, {32, unsigned}}]),
    {RBin8, HurtList} = prot_util:unpack(RBin7, [{string, {32, unsigned}}]),
    {RBin9, ChapterReward} = prot_util:unpack(RBin8, [{{16, unsigned}, {16, unsigned}}]),
    {_RBin10, IsFirstChal} = prot_util:unpack(RBin9, {8, unsigned}),

    UnpackRecordData = #sc_dung_result{
        dung_id = DungId,
        mul = Mul,
        level = Level,
        succeed = Succeed,
        stars = Stars,
        cost_time = CostTime,
        die_times = DieTimes,
        rewards = Rewards,
        hurt_list = HurtList,
        chapter_reward = ChapterReward,
        is_first_chal = IsFirstChal
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25228, BinData) ->
    {RBin0, DungId} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Level} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Wave} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, BeginTime} = prot_util:unpack(RBin2, {32, unsigned}),
    {_RBin4, Members} = prot_util:unpack(RBin3, [{{64, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_dung_data{
        dung_id = DungId,
        level = Level,
        wave = Wave,
        begin_time = BeginTime,
        members = Members
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25229, BinData) ->
    {_RBin0, Status} = prot_util:unpack(BinData, [{{64, unsigned}, string, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_dung_team_status{
        status = Status
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25230, BinData) ->
    {RBin0, Wave} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Mons} = prot_util:unpack(RBin0, [{{64, unsigned}, {32, unsigned}, {32, unsigned}, {32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_dung_refresh_mon{
        wave = Wave,
        mons = Mons
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(25201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25202, PackRecordData) ->
    Dungs = prot_util:pack(PackRecordData#sc_dung_info.dungs, [{u,clt_dungeon}]),

    BinData = <<
        Dungs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25203, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#cs_dung_reset.dung_id, {16, unsigned}),

    BinData = <<
        DungId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25204, PackRecordData) ->
    Dung = prot_util:pack(PackRecordData#sc_dung_reset.dung, {u,clt_dungeon}),

    BinData = <<
        Dung/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25205, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#cs_dung_wipe.dung_id, {16, unsigned}),

    BinData = <<
        DungId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25206, PackRecordData) ->
    Mul = prot_util:pack(PackRecordData#sc_dung_wipe.mul, {32, unsigned}),
    Dung = prot_util:pack(PackRecordData#sc_dung_wipe.dung, {u,clt_dungeon}),
    Rewards = prot_util:pack(PackRecordData#sc_dung_wipe.rewards, [{u,dund_wipe_drop_info}]),

    BinData = <<
        Mul/binary,
        Dung/binary,
        Rewards/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25207, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#cs_dung_get_first_rwd.dung_id, {16, unsigned}),
    Level = prot_util:pack(PackRecordData#cs_dung_get_first_rwd.level, {16, unsigned}),
    Wave = prot_util:pack(PackRecordData#cs_dung_get_first_rwd.wave, {8, unsigned}),

    BinData = <<
        DungId/binary,
        Level/binary,
        Wave/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25208, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#sc_dung_get_first_rwd.dung_id, {16, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_dung_get_first_rwd.level, {16, unsigned}),
    Wave = prot_util:pack(PackRecordData#sc_dung_get_first_rwd.wave, {8, unsigned}),
    FirstReward = prot_util:pack(PackRecordData#sc_dung_get_first_rwd.first_reward, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        DungId/binary,
        Level/binary,
        Wave/binary,
        FirstReward/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25209, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#cs_dung_get_chapter_rwd.dung_id, {16, unsigned}),
    Chapter = prot_util:pack(PackRecordData#cs_dung_get_chapter_rwd.chapter, {8, unsigned}),
    Star = prot_util:pack(PackRecordData#cs_dung_get_chapter_rwd.star, {8, unsigned}),

    BinData = <<
        DungId/binary,
        Chapter/binary,
        Star/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25210, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#sc_dung_get_chapter_rwd.dung_id, {16, unsigned}),
    Chapter = prot_util:pack(PackRecordData#sc_dung_get_chapter_rwd.chapter, {8, unsigned}),
    Star = prot_util:pack(PackRecordData#sc_dung_get_chapter_rwd.star, {8, unsigned}),
    ChapterReward = prot_util:pack(PackRecordData#sc_dung_get_chapter_rwd.chapter_reward, [{{16, unsigned}, {16, unsigned}}]),

    BinData = <<
        DungId/binary,
        Chapter/binary,
        Star/binary,
        ChapterReward/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25211, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#cs_dung_single.dung_id, {16, unsigned}),

    BinData = <<
        DungId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25212, PackRecordData) ->
    Dung = prot_util:pack(PackRecordData#sc_dung_single.dung, {u,clt_dungeon}),

    BinData = <<
        Dung/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25213, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25214, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#sc_dung_hero_info.dung_id, {16, unsigned}),

    BinData = <<
        DungId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25221, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#cs_dung_enter.dung_id, {16, unsigned}),
    PreferLv = prot_util:pack(PackRecordData#cs_dung_enter.prefer_lv, {16, unsigned}),

    BinData = <<
        DungId/binary,
        PreferLv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25222, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#sc_dung_enter.dung_id, {16, unsigned}),
    PreferLv = prot_util:pack(PackRecordData#sc_dung_enter.prefer_lv, {16, unsigned}),

    BinData = <<
        DungId/binary,
        PreferLv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25223, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#cs_dung_enter_team.dung_id, {16, unsigned}),

    BinData = <<
        DungId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25224, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#sc_dung_enter_team.dung_id, {16, unsigned}),

    BinData = <<
        DungId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25225, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25226, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25227, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#sc_dung_result.dung_id, {16, unsigned}),
    Mul = prot_util:pack(PackRecordData#sc_dung_result.mul, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_dung_result.level, {16, unsigned}),
    Succeed = prot_util:pack(PackRecordData#sc_dung_result.succeed, {8, unsigned}),
    Stars = prot_util:pack(PackRecordData#sc_dung_result.stars, [{8, unsigned}]),
    CostTime = prot_util:pack(PackRecordData#sc_dung_result.cost_time, {16, unsigned}),
    DieTimes = prot_util:pack(PackRecordData#sc_dung_result.die_times, {8, unsigned}),
    Rewards = prot_util:pack(PackRecordData#sc_dung_result.rewards, [{{16, unsigned}, {32, unsigned}, {32, unsigned}}]),
    HurtList = prot_util:pack(PackRecordData#sc_dung_result.hurt_list, [{string, {32, unsigned}}]),
    ChapterReward = prot_util:pack(PackRecordData#sc_dung_result.chapter_reward, [{{16, unsigned}, {16, unsigned}}]),
    IsFirstChal = prot_util:pack(PackRecordData#sc_dung_result.is_first_chal, {8, unsigned}),

    BinData = <<
        DungId/binary,
        Mul/binary,
        Level/binary,
        Succeed/binary,
        Stars/binary,
        CostTime/binary,
        DieTimes/binary,
        Rewards/binary,
        HurtList/binary,
        ChapterReward/binary,
        IsFirstChal/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25228, PackRecordData) ->
    DungId = prot_util:pack(PackRecordData#sc_dung_data.dung_id, {16, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_dung_data.level, {16, unsigned}),
    Wave = prot_util:pack(PackRecordData#sc_dung_data.wave, {8, unsigned}),
    BeginTime = prot_util:pack(PackRecordData#sc_dung_data.begin_time, {32, unsigned}),
    Members = prot_util:pack(PackRecordData#sc_dung_data.members, [{{64, unsigned}, {8, unsigned}}]),

    BinData = <<
        DungId/binary,
        Level/binary,
        Wave/binary,
        BeginTime/binary,
        Members/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25229, PackRecordData) ->
    Status = prot_util:pack(PackRecordData#sc_dung_team_status.status, [{{64, unsigned}, string, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Status/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25230, PackRecordData) ->
    Wave = prot_util:pack(PackRecordData#sc_dung_refresh_mon.wave, {8, unsigned}),
    Mons = prot_util:pack(PackRecordData#sc_dung_refresh_mon.mons, [{{64, unsigned}, {32, unsigned}, {32, unsigned}, {32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Wave/binary,
        Mons/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

