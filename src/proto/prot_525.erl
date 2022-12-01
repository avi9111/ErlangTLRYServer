-module(prot_525).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_525.hrl").


%% ---------------------------------------------------------------------------------------

decode(52501, _BinData) ->

    UnpackRecordData = #cs_exterior_horse_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52502, BinData) ->
    {_RBin0, ActiveList} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_exterior_horse_info{
        active_list = ActiveList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52503, _BinData) ->

    UnpackRecordData = #cs_exterior_horse_ope{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52505, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_exterior_horse_choose{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52506, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_exterior_horse_choose{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52510, _BinData) ->

    UnpackRecordData = #cs_exterior_bubble_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52511, BinData) ->
    {RBin0, ActiveList} = prot_util:unpack(BinData, [{{16, unsigned}, {32, unsigned}}]),
    {_RBin1, Id} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_exterior_bubble_info{
        active_list = ActiveList,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52512, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_exterior_bubble_choose{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52513, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_exterior_bubble_choose{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52520, _BinData) ->

    UnpackRecordData = #cs_exterior_frame_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52521, BinData) ->
    {RBin0, ActiveList} = prot_util:unpack(BinData, [{{16, unsigned}, {32, unsigned}}]),
    {_RBin1, Id} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_exterior_frame_info{
        active_list = ActiveList,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52522, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_exterior_frame_choose{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52523, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_exterior_frame_choose{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52530, _BinData) ->

    UnpackRecordData = #cs_exterior_action_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52531, BinData) ->
    {RBin0, ActiveList} = prot_util:unpack(BinData, [{8, unsigned}]),
    {RBin1, SingleTime} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, CoupeTime} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #sc_exterior_action_info{
        active_list = ActiveList,
        single_time = SingleTime,
        coupe_time = CoupeTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52532, BinData) ->
    {RBin0, BeInvitedId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #cs_exterior_action{
        be_invited_id = BeInvitedId,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52533, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, SingleTime} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, CoupeTime} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #sc_exterior_action{
        id = Id,
        single_time = SingleTime,
        coupe_time = CoupeTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52534, BinData) ->
    {RBin0, InviteId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Sender} = prot_util:unpack(RBin0, string),
    {_RBin2, Id} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_exterior_action_get_invite{
        invite_id = InviteId,
        sender = Sender,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52535, BinData) ->
    {RBin0, InvitedId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Res} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_exterior_action_res{
        invited_id = InvitedId,
        res = Res
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52536, BinData) ->
    {RBin0, InvitedId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, BeInvitedId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Id} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #sc_exterior_action_notify{
        invited_id = InvitedId,
        be_invited_id = BeInvitedId,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52501, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52502, PackRecordData) ->
    ActiveList = prot_util:pack(PackRecordData#sc_exterior_horse_info.active_list, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        ActiveList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52503, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52505, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_exterior_horse_choose.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52506, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_exterior_horse_choose.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52510, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52511, PackRecordData) ->
    ActiveList = prot_util:pack(PackRecordData#sc_exterior_bubble_info.active_list, [{{16, unsigned}, {32, unsigned}}]),
    Id = prot_util:pack(PackRecordData#sc_exterior_bubble_info.id, {16, unsigned}),

    BinData = <<
        ActiveList/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52512, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_exterior_bubble_choose.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52513, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_exterior_bubble_choose.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52520, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52521, PackRecordData) ->
    ActiveList = prot_util:pack(PackRecordData#sc_exterior_frame_info.active_list, [{{16, unsigned}, {32, unsigned}}]),
    Id = prot_util:pack(PackRecordData#sc_exterior_frame_info.id, {16, unsigned}),

    BinData = <<
        ActiveList/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52522, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_exterior_frame_choose.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52523, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_exterior_frame_choose.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52530, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52531, PackRecordData) ->
    ActiveList = prot_util:pack(PackRecordData#sc_exterior_action_info.active_list, [{8, unsigned}]),
    SingleTime = prot_util:pack(PackRecordData#sc_exterior_action_info.single_time, {32, unsigned}),
    CoupeTime = prot_util:pack(PackRecordData#sc_exterior_action_info.coupe_time, {32, unsigned}),

    BinData = <<
        ActiveList/binary,
        SingleTime/binary,
        CoupeTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52532, PackRecordData) ->
    BeInvitedId = prot_util:pack(PackRecordData#cs_exterior_action.be_invited_id, {64, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_exterior_action.id, {16, unsigned}),

    BinData = <<
        BeInvitedId/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52533, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_exterior_action.id, {16, unsigned}),
    SingleTime = prot_util:pack(PackRecordData#sc_exterior_action.single_time, {32, unsigned}),
    CoupeTime = prot_util:pack(PackRecordData#sc_exterior_action.coupe_time, {32, unsigned}),

    BinData = <<
        Id/binary,
        SingleTime/binary,
        CoupeTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52534, PackRecordData) ->
    InviteId = prot_util:pack(PackRecordData#sc_exterior_action_get_invite.invite_id, {64, unsigned}),
    Sender = prot_util:pack(PackRecordData#sc_exterior_action_get_invite.sender, string),
    Id = prot_util:pack(PackRecordData#sc_exterior_action_get_invite.id, {16, unsigned}),

    BinData = <<
        InviteId/binary,
        Sender/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52535, PackRecordData) ->
    InvitedId = prot_util:pack(PackRecordData#cs_exterior_action_res.invited_id, {64, unsigned}),
    Res = prot_util:pack(PackRecordData#cs_exterior_action_res.res, {8, unsigned}),

    BinData = <<
        InvitedId/binary,
        Res/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52536, PackRecordData) ->
    InvitedId = prot_util:pack(PackRecordData#sc_exterior_action_notify.invited_id, {64, unsigned}),
    BeInvitedId = prot_util:pack(PackRecordData#sc_exterior_action_notify.be_invited_id, {64, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_exterior_action_notify.id, {16, unsigned}),

    BinData = <<
        InvitedId/binary,
        BeInvitedId/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

