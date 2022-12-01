-module(prot_513).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_513.hrl").


%% ---------------------------------------------------------------------------------------

decode(51301, _BinData) ->

    UnpackRecordData = #cs_lake_bandits_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51302, BinData) ->
    {_RBin0, LineId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_lake_bandits_enter{
        line_id = LineId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51303, _BinData) ->

    UnpackRecordData = #cs_lake_bandits_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51304, _BinData) ->

    UnpackRecordData = #sc_lake_bandits_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51305, BinData) ->
    {_RBin0, LineId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_lake_bandits_switch{
        line_id = LineId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51306, BinData) ->
    {_RBin0, LineId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_lake_bandits_switch{
        line_id = LineId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51311, BinData) ->
    {RBin0, MonId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_lake_bandits_dragon_belong{
        mon_id = MonId,
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51312, _BinData) ->

    UnpackRecordData = #cs_lake_bandits_dragon_role{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51313, BinData) ->
    {_RBin0, LineRoleNum} = prot_util:unpack(BinData, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_lake_bandits_dragon_role{
        line_role_num = LineRoleNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51314, BinData) ->
    {_RBin0, LineId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_lake_bandits_dragon_mon{
        line_id = LineId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51315, BinData) ->
    {_RBin0, MonList} = prot_util:unpack(BinData, [{{32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_lake_bandits_dragon_mon{
        mon_list = MonList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51316, BinData) ->
    {RBin0, MonId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, FirstAtt} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_lake_bandits_first_att{
        mon_id = MonId,
        first_att = FirstAtt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51317, BinData) ->
    {_RBin0, Info} = prot_util:unpack(BinData, [{{8, unsigned}, {16, unsigned}, {16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_lake_bandits_dragon_info{
        info = Info
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51301, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51302, PackRecordData) ->
    LineId = prot_util:pack(PackRecordData#sc_lake_bandits_enter.line_id, {8, unsigned}),

    BinData = <<
        LineId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51303, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51304, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51305, PackRecordData) ->
    LineId = prot_util:pack(PackRecordData#cs_lake_bandits_switch.line_id, {8, unsigned}),

    BinData = <<
        LineId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51306, PackRecordData) ->
    LineId = prot_util:pack(PackRecordData#sc_lake_bandits_switch.line_id, {8, unsigned}),

    BinData = <<
        LineId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51311, PackRecordData) ->
    MonId = prot_util:pack(PackRecordData#sc_lake_bandits_dragon_belong.mon_id, {64, unsigned}),
    RoleId = prot_util:pack(PackRecordData#sc_lake_bandits_dragon_belong.role_id, {64, unsigned}),

    BinData = <<
        MonId/binary,
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51312, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51313, PackRecordData) ->
    LineRoleNum = prot_util:pack(PackRecordData#sc_lake_bandits_dragon_role.line_role_num, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        LineRoleNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51314, PackRecordData) ->
    LineId = prot_util:pack(PackRecordData#cs_lake_bandits_dragon_mon.line_id, {8, unsigned}),

    BinData = <<
        LineId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51315, PackRecordData) ->
    MonList = prot_util:pack(PackRecordData#sc_lake_bandits_dragon_mon.mon_list, [{{32, unsigned}, {8, unsigned}}]),

    BinData = <<
        MonList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51316, PackRecordData) ->
    MonId = prot_util:pack(PackRecordData#sc_lake_bandits_first_att.mon_id, {64, unsigned}),
    FirstAtt = prot_util:pack(PackRecordData#sc_lake_bandits_first_att.first_att, {64, unsigned}),

    BinData = <<
        MonId/binary,
        FirstAtt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51317, PackRecordData) ->
    Info = prot_util:pack(PackRecordData#sc_lake_bandits_dragon_info.info, [{{8, unsigned}, {16, unsigned}, {16, unsigned}, {16, unsigned}}]),

    BinData = <<
        Info/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

