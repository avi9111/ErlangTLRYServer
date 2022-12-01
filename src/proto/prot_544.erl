-module(prot_544).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_544.hrl").


%% ---------------------------------------------------------------------------------------

decode(54401, _BinData) ->

    UnpackRecordData = #cs_marry_parade_begin{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54402, BinData) ->
    {RBin0, HusbandId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, WifeId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_marry_parade_begin{
        husband_id = HusbandId,
        wife_id = WifeId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54403, BinData) ->
    {RBin0, HusbandId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, WifeId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_marry_parade_end{
        husband_id = HusbandId,
        wife_id = WifeId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54451, _BinData) ->

    UnpackRecordData = #cs_marry_hall_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54452, BinData) ->
    {_RBin0, OpenList} = prot_util:unpack(BinData, [{{64, unsigned}, {64, unsigned}, string, string, {32, unsigned}}]),

    UnpackRecordData = #sc_marry_hall_info{
        open_list = OpenList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54453, _BinData) ->

    UnpackRecordData = #cs_marry_hall_open{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54454, _BinData) ->

    UnpackRecordData = #sc_marry_hall_open{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54455, BinData) ->
    {_RBin0, HusbandId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_marry_hall_enter{
        husband_id = HusbandId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54456, BinData) ->
    {RBin0, HusbandId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, WifeId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_marry_hall_enter{
        husband_id = HusbandId,
        wife_id = WifeId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54457, _BinData) ->

    UnpackRecordData = #cs_marry_hall_baitang{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54458, _BinData) ->

    UnpackRecordData = #sc_marry_hall_baitang{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54459, _BinData) ->

    UnpackRecordData = #cs_marry_hall_sleep{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54460, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_marry_hall_sleep{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54461, _BinData) ->

    UnpackRecordData = #cs_marry_hall_noisy{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54462, _BinData) ->

    UnpackRecordData = #sc_marry_hall_noisy{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54463, _BinData) ->

    UnpackRecordData = #cs_marry_hall_taste{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54464, _BinData) ->

    UnpackRecordData = #sc_marry_hall_taste{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54465, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_marry_hall_thank{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54466, _BinData) ->

    UnpackRecordData = #sc_marry_hall_thank{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54467, _BinData) ->

    UnpackRecordData = #cs_marry_hall_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54468, _BinData) ->

    UnpackRecordData = #sc_marry_hall_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54469, _BinData) ->

    UnpackRecordData = #cs_marry_hall_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54470, _BinData) ->

    UnpackRecordData = #sc_marry_hall_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(54401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54402, PackRecordData) ->
    HusbandId = prot_util:pack(PackRecordData#sc_marry_parade_begin.husband_id, {64, unsigned}),
    WifeId = prot_util:pack(PackRecordData#sc_marry_parade_begin.wife_id, {64, unsigned}),

    BinData = <<
        HusbandId/binary,
        WifeId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54403, PackRecordData) ->
    HusbandId = prot_util:pack(PackRecordData#sc_marry_parade_end.husband_id, {64, unsigned}),
    WifeId = prot_util:pack(PackRecordData#sc_marry_parade_end.wife_id, {64, unsigned}),

    BinData = <<
        HusbandId/binary,
        WifeId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54451, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54452, PackRecordData) ->
    OpenList = prot_util:pack(PackRecordData#sc_marry_hall_info.open_list, [{{64, unsigned}, {64, unsigned}, string, string, {32, unsigned}}]),

    BinData = <<
        OpenList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54453, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54454, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54455, PackRecordData) ->
    HusbandId = prot_util:pack(PackRecordData#cs_marry_hall_enter.husband_id, {64, unsigned}),

    BinData = <<
        HusbandId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54456, PackRecordData) ->
    HusbandId = prot_util:pack(PackRecordData#sc_marry_hall_enter.husband_id, {64, unsigned}),
    WifeId = prot_util:pack(PackRecordData#sc_marry_hall_enter.wife_id, {64, unsigned}),

    BinData = <<
        HusbandId/binary,
        WifeId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54457, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54458, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54459, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54460, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_marry_hall_sleep.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54461, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54462, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54463, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54464, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54465, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_marry_hall_thank.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54466, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54467, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54468, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54469, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54470, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

