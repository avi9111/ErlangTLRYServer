-module(prot_311).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_311.hrl").


%% ---------------------------------------------------------------------------------------

decode(31101, _BinData) ->

    UnpackRecordData = #cs_territory_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31102, BinData) ->
    {RBin0, Round} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Matches} = prot_util:unpack(RBin0, [{{8, unsigned}, {8, unsigned}}]),
    {_RBin2, Territories} = prot_util:unpack(RBin1, [{{8, unsigned}, {64, unsigned}, string}]),

    UnpackRecordData = #sc_territory_info{
        round = Round,
        matches = Matches,
        territories = Territories
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31111, _BinData) ->

    UnpackRecordData = #cs_territory_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31112, _BinData) ->

    UnpackRecordData = #sc_territory_enter{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31113, _BinData) ->

    UnpackRecordData = #cs_territory_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31114, _BinData) ->

    UnpackRecordData = #sc_territory_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31115, BinData) ->
    {_RBin0, Room} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_territory_switch{
        room = Room
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31116, BinData) ->
    {_RBin0, Room} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_territory_switch{
        room = Room
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31117, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_territory_beat_drum{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31118, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_territory_beat_drum{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31119, _BinData) ->

    UnpackRecordData = #cs_territory_rank{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31120, BinData) ->
    {_RBin0, Ranks} = prot_util:unpack(BinData, [{{8, unsigned}, {64, unsigned}, string, {16, unsigned}, {64, unsigned}}]),

    UnpackRecordData = #sc_territory_rank{
        ranks = Ranks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31121, _BinData) ->

    UnpackRecordData = #cs_territory_progress{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31122, BinData) ->
    {_RBin0, Rooms} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_territory_progress{
        rooms = Rooms
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31131, BinData) ->
    {RBin0, Select} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Selection} = prot_util:unpack(RBin0, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_territory_scene_prepare{
        select = Select,
        selection = Selection
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31132, BinData) ->
    {RBin0, Flag} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Occupy} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Camps} = prot_util:unpack(RBin1, [{{8, unsigned}, {64, unsigned}, string}]),
    {_RBin3, Drums} = prot_util:unpack(RBin2, [{8, unsigned}]),

    UnpackRecordData = #sc_territory_scene_battle{
        flag = Flag,
        occupy = Occupy,
        camps = Camps,
        drums = Drums
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31133, BinData) ->
    {_RBin0, Selection} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_territory_notify_select{
        selection = Selection
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31134, BinData) ->
    {RBin0, Flag} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Occupy} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_territory_notify_flag{
        flag = Flag,
        occupy = Occupy
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(31135, BinData) ->
    {RBin0, Camp} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Drums} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #sc_territory_notify_drum{
        camp = Camp,
        drums = Drums
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(31101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31102, PackRecordData) ->
    Round = prot_util:pack(PackRecordData#sc_territory_info.round, {8, unsigned}),
    Matches = prot_util:pack(PackRecordData#sc_territory_info.matches, [{{8, unsigned}, {8, unsigned}}]),
    Territories = prot_util:pack(PackRecordData#sc_territory_info.territories, [{{8, unsigned}, {64, unsigned}, string}]),

    BinData = <<
        Round/binary,
        Matches/binary,
        Territories/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31111, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31112, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31113, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31114, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31115, PackRecordData) ->
    Room = prot_util:pack(PackRecordData#cs_territory_switch.room, {8, unsigned}),

    BinData = <<
        Room/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31116, PackRecordData) ->
    Room = prot_util:pack(PackRecordData#sc_territory_switch.room, {8, unsigned}),

    BinData = <<
        Room/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31117, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_territory_beat_drum.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31118, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_territory_beat_drum.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31119, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31120, PackRecordData) ->
    Ranks = prot_util:pack(PackRecordData#sc_territory_rank.ranks, [{{8, unsigned}, {64, unsigned}, string, {16, unsigned}, {64, unsigned}}]),

    BinData = <<
        Ranks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31121, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31122, PackRecordData) ->
    Rooms = prot_util:pack(PackRecordData#sc_territory_progress.rooms, [{{8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Rooms/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31131, PackRecordData) ->
    Select = prot_util:pack(PackRecordData#sc_territory_scene_prepare.select, {8, unsigned}),
    Selection = prot_util:pack(PackRecordData#sc_territory_scene_prepare.selection, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Select/binary,
        Selection/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31132, PackRecordData) ->
    Flag = prot_util:pack(PackRecordData#sc_territory_scene_battle.flag, {8, unsigned}),
    Occupy = prot_util:pack(PackRecordData#sc_territory_scene_battle.occupy, {32, unsigned}),
    Camps = prot_util:pack(PackRecordData#sc_territory_scene_battle.camps, [{{8, unsigned}, {64, unsigned}, string}]),
    Drums = prot_util:pack(PackRecordData#sc_territory_scene_battle.drums, [{8, unsigned}]),

    BinData = <<
        Flag/binary,
        Occupy/binary,
        Camps/binary,
        Drums/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31133, PackRecordData) ->
    Selection = prot_util:pack(PackRecordData#sc_territory_notify_select.selection, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Selection/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31134, PackRecordData) ->
    Flag = prot_util:pack(PackRecordData#sc_territory_notify_flag.flag, {8, unsigned}),
    Occupy = prot_util:pack(PackRecordData#sc_territory_notify_flag.occupy, {32, unsigned}),

    BinData = <<
        Flag/binary,
        Occupy/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(31135, PackRecordData) ->
    Camp = prot_util:pack(PackRecordData#sc_territory_notify_drum.camp, {8, unsigned}),
    Drums = prot_util:pack(PackRecordData#sc_territory_notify_drum.drums, [{8, unsigned}]),

    BinData = <<
        Camp/binary,
        Drums/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

