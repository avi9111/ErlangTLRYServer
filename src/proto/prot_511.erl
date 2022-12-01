-module(prot_511).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_511.hrl").


%% ---------------------------------------------------------------------------------------

decode(51101, _BinData) ->

    UnpackRecordData = #cs_guild_defend_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51102, _BinData) ->

    UnpackRecordData = #sc_guild_defend_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51103, _BinData) ->

    UnpackRecordData = #cs_guild_defend_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51104, _BinData) ->

    UnpackRecordData = #sc_guild_defend_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51111, BinData) ->
    {_RBin0, RefreshTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_guild_defend_publish{
        refresh_time = RefreshTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51112, BinData) ->
    {RBin0, Wave} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, RefreshTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_guild_defend_refresh{
        wave = Wave,
        refresh_time = RefreshTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51113, BinData) ->
    {RBin0, TripodId} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, HpPert} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_defend_tripod_hurt{
        tripod_id = TripodId,
        hp_pert = HpPert
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51114, _BinData) ->

    UnpackRecordData = #cs_guild_defend_panel{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51115, BinData) ->
    {RBin0, Wave} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, RefreshTime} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, TripodInfo} = prot_util:unpack(RBin1, [{{32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_defend_panel{
        wave = Wave,
        refresh_time = RefreshTime,
        tripod_info = TripodInfo
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51116, _BinData) ->

    UnpackRecordData = #cs_guild_defend_score{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51117, BinData) ->
    {RBin0, ScoreList} = prot_util:unpack(BinData, [{{16, unsigned}, string, {8, unsigned}, {16, unsigned}, {64, unsigned}, {64, unsigned}, {64, unsigned}}]),
    {_RBin1, RepelWave} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_defend_score{
        score_list = ScoreList,
        repel_wave = RepelWave
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51118, BinData) ->
    {_RBin0, TripodMonNum} = prot_util:unpack(BinData, [{{32, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_guild_defend_mon_num{
        tripod_mon_num = TripodMonNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51119, BinData) ->
    {RBin0, TotalNum} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, LeaveNum} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_guild_defend_cur_num{
        total_num = TotalNum,
        leave_num = LeaveNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51120, BinData) ->
    {_RBin0, EndTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_guild_defend_close{
        end_time = EndTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51102, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51103, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51104, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51111, PackRecordData) ->
    RefreshTime = prot_util:pack(PackRecordData#sc_guild_defend_publish.refresh_time, {32, unsigned}),

    BinData = <<
        RefreshTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51112, PackRecordData) ->
    Wave = prot_util:pack(PackRecordData#sc_guild_defend_refresh.wave, {8, unsigned}),
    RefreshTime = prot_util:pack(PackRecordData#sc_guild_defend_refresh.refresh_time, {32, unsigned}),

    BinData = <<
        Wave/binary,
        RefreshTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51113, PackRecordData) ->
    TripodId = prot_util:pack(PackRecordData#sc_guild_defend_tripod_hurt.tripod_id, {32, unsigned}),
    HpPert = prot_util:pack(PackRecordData#sc_guild_defend_tripod_hurt.hp_pert, {8, unsigned}),

    BinData = <<
        TripodId/binary,
        HpPert/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51114, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51115, PackRecordData) ->
    Wave = prot_util:pack(PackRecordData#sc_guild_defend_panel.wave, {8, unsigned}),
    RefreshTime = prot_util:pack(PackRecordData#sc_guild_defend_panel.refresh_time, {32, unsigned}),
    TripodInfo = prot_util:pack(PackRecordData#sc_guild_defend_panel.tripod_info, [{{32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Wave/binary,
        RefreshTime/binary,
        TripodInfo/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51116, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51117, PackRecordData) ->
    ScoreList = prot_util:pack(PackRecordData#sc_guild_defend_score.score_list, [{{16, unsigned}, string, {8, unsigned}, {16, unsigned}, {64, unsigned}, {64, unsigned}, {64, unsigned}}]),
    RepelWave = prot_util:pack(PackRecordData#sc_guild_defend_score.repel_wave, {8, unsigned}),

    BinData = <<
        ScoreList/binary,
        RepelWave/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51118, PackRecordData) ->
    TripodMonNum = prot_util:pack(PackRecordData#sc_guild_defend_mon_num.tripod_mon_num, [{{32, unsigned}, {32, unsigned}}]),

    BinData = <<
        TripodMonNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51119, PackRecordData) ->
    TotalNum = prot_util:pack(PackRecordData#sc_guild_defend_cur_num.total_num, {16, unsigned}),
    LeaveNum = prot_util:pack(PackRecordData#sc_guild_defend_cur_num.leave_num, {16, unsigned}),

    BinData = <<
        TotalNum/binary,
        LeaveNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51120, PackRecordData) ->
    EndTime = prot_util:pack(PackRecordData#sc_guild_defend_close.end_time, {32, unsigned}),

    BinData = <<
        EndTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

