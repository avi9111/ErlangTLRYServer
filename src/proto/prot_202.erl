-module(prot_202).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_202.hrl").


%% ---------------------------------------------------------------------------------------

decode(20201, _BinData) ->

    UnpackRecordData = #cs_equip_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20202, BinData) ->
    {_RBin0, Equips} = prot_util:unpack(BinData, [{u,equip_info}]),

    UnpackRecordData = #sc_equip_info{
        equips = Equips
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20203, BinData) ->
    {_RBin0, Cell} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_equip_wear{
        cell = Cell
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20204, BinData) ->
    {_RBin0, Equip} = prot_util:unpack(BinData, {u,equip_info}),

    UnpackRecordData = #sc_equip_wear{
        equip = Equip
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20205, BinData) ->
    {_RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_equip_take_off{
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20206, BinData) ->
    {_RBin0, Equip} = prot_util:unpack(BinData, {u,equip_info}),

    UnpackRecordData = #sc_equip_take_off{
        equip = Equip
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20207, BinData) ->
    {_RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_equip_stren{
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20208, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Lv} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_equip_stren{
        pos = Pos,
        lv = Lv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20209, _BinData) ->

    UnpackRecordData = #cs_equip_one_key_stren{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20210, BinData) ->
    {_RBin0, Changes} = prot_util:unpack(BinData, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_equip_one_key_stren{
        changes = Changes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20211, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #cs_equip_inlay_stone{
        pos = Pos,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20212, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_equip_inlay_stone{
        pos = Pos,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20213, BinData) ->
    {_RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_equip_adv_stone{
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20214, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_equip_adv_stone{
        pos = Pos,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20215, BinData) ->
    {_RBin0, Pos} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_equip_inlay_paris{
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20216, BinData) ->
    {_RBin0, Equip} = prot_util:unpack(BinData, {u,equip_info}),

    UnpackRecordData = #sc_equip_inlay_paris{
        equip = Equip
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20217, BinData) ->
    {_RBin0, Pos} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_equip_stren_paris{
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20218, BinData) ->
    {_RBin0, Equip} = prot_util:unpack(BinData, {u,equip_info}),

    UnpackRecordData = #sc_equip_stren_paris{
        equip = Equip
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20219, BinData) ->
    {_RBin0, Pos} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_equip_strip_paris{
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(20220, BinData) ->
    {_RBin0, Equip} = prot_util:unpack(BinData, {u,equip_info}),

    UnpackRecordData = #sc_equip_strip_paris{
        equip = Equip
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(20201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20202, PackRecordData) ->
    Equips = prot_util:pack(PackRecordData#sc_equip_info.equips, [{u,equip_info}]),

    BinData = <<
        Equips/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20203, PackRecordData) ->
    Cell = prot_util:pack(PackRecordData#cs_equip_wear.cell, {16, unsigned}),

    BinData = <<
        Cell/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20204, PackRecordData) ->
    Equip = prot_util:pack(PackRecordData#sc_equip_wear.equip, {u,equip_info}),

    BinData = <<
        Equip/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20205, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_equip_take_off.pos, {8, unsigned}),

    BinData = <<
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20206, PackRecordData) ->
    Equip = prot_util:pack(PackRecordData#sc_equip_take_off.equip, {u,equip_info}),

    BinData = <<
        Equip/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20207, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_equip_stren.pos, {8, unsigned}),

    BinData = <<
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20208, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#sc_equip_stren.pos, {8, unsigned}),
    Lv = prot_util:pack(PackRecordData#sc_equip_stren.lv, {16, unsigned}),

    BinData = <<
        Pos/binary,
        Lv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20209, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20210, PackRecordData) ->
    Changes = prot_util:pack(PackRecordData#sc_equip_one_key_stren.changes, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        Changes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20211, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_equip_inlay_stone.pos, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_equip_inlay_stone.id, {32, unsigned}),

    BinData = <<
        Pos/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20212, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#sc_equip_inlay_stone.pos, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_equip_inlay_stone.id, {32, unsigned}),

    BinData = <<
        Pos/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20213, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_equip_adv_stone.pos, {8, unsigned}),

    BinData = <<
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20214, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#sc_equip_adv_stone.pos, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_equip_adv_stone.id, {32, unsigned}),

    BinData = <<
        Pos/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20215, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_equip_inlay_paris.pos, {16, unsigned}),

    BinData = <<
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20216, PackRecordData) ->
    Equip = prot_util:pack(PackRecordData#sc_equip_inlay_paris.equip, {u,equip_info}),

    BinData = <<
        Equip/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20217, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_equip_stren_paris.pos, {16, unsigned}),

    BinData = <<
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20218, PackRecordData) ->
    Equip = prot_util:pack(PackRecordData#sc_equip_stren_paris.equip, {u,equip_info}),

    BinData = <<
        Equip/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20219, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#cs_equip_strip_paris.pos, {16, unsigned}),

    BinData = <<
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(20220, PackRecordData) ->
    Equip = prot_util:pack(PackRecordData#sc_equip_strip_paris.equip, {u,equip_info}),

    BinData = <<
        Equip/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

