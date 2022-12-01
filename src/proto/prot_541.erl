-module(prot_541).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_541.hrl").


%% ---------------------------------------------------------------------------------------

decode(54101, _BinData) ->

    UnpackRecordData = #cs_vow_panel_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54102, BinData) ->
    {RBin0, VowList} = prot_util:unpack(BinData, [{{64, unsigned}, string, string, {32, unsigned}}]),
    {_RBin1, RefreshTimes} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_vow_panel_info{
        vow_list = VowList,
        refresh_times = RefreshTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54103, _BinData) ->

    UnpackRecordData = #cs_vow_my_like{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54104, BinData) ->
    {_RBin0, VowList} = prot_util:unpack(BinData, [{{64, unsigned}, string, string, {32, unsigned}}]),

    UnpackRecordData = #sc_vow_my_like{
        vow_list = VowList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54105, _BinData) ->

    UnpackRecordData = #cs_vow_see_vow{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54106, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Career} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Level} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Context} = prot_util:unpack(RBin3, string),
    {_RBin5, IsPost} = prot_util:unpack(RBin4, {8, unsigned}),

    UnpackRecordData = #sc_vow_my_vow{
        role_id = RoleId,
        name = Name,
        career = Career,
        level = Level,
        context = Context,
        is_post = IsPost
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54107, BinData) ->
    {_RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_vow_other_vow{
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54108, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Career} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Level} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Context} = prot_util:unpack(RBin3, string),
    {_RBin5, IsLike} = prot_util:unpack(RBin4, {8, unsigned}),

    UnpackRecordData = #sc_vow_other_vow{
        role_id = RoleId,
        name = Name,
        career = Career,
        level = Level,
        context = Context,
        is_like = IsLike
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54109, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_vow_refresh{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54110, BinData) ->
    {_RBin0, Context} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_vow{
        context = Context
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54111, _BinData) ->

    UnpackRecordData = #sc_vow{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54112, BinData) ->
    {_RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_vow_get{
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54113, _BinData) ->

    UnpackRecordData = #sc_vow_get{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54114, BinData) ->
    {_RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_vow_agree{
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54115, BinData) ->
    {_RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_vow_agree{
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54116, BinData) ->
    {_RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_vow_cancel_like{
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54117, BinData) ->
    {_RBin0, TargetId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_vow_cancel_like{
        target_id = TargetId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54118, _BinData) ->

    UnpackRecordData = #cs_vow_revoke{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54119, _BinData) ->

    UnpackRecordData = #sc_vow_revoke{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54151, _BinData) ->

    UnpackRecordData = #cs_deed_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54152, BinData) ->
    {RBin0, TargetName} = prot_util:unpack(BinData, string),
    {RBin1, EndTime} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Deed} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Complete} = prot_util:unpack(RBin2, [{u,clt_deed_list}]),
    {_RBin4, GetList} = prot_util:unpack(RBin3, [{8, unsigned}]),

    UnpackRecordData = #sc_deed_info{
        target_name = TargetName,
        end_time = EndTime,
        deed = Deed,
        complete = Complete,
        get_list = GetList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54153, _BinData) ->

    UnpackRecordData = #cs_deed_invite{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54154, _BinData) ->

    UnpackRecordData = #sc_deed_notify{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54155, BinData) ->
    {_RBin0, Res} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_deed_res{
        res = Res
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54156, BinData) ->
    {RBin0, TargetName} = prot_util:unpack(BinData, string),
    {_RBin1, EndTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_deed_begin{
        target_name = TargetName,
        end_time = EndTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54157, BinData) ->
    {RBin0, Deed} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Complete} = prot_util:unpack(RBin0, [{u,clt_deed_list}]),

    UnpackRecordData = #sc_deed_complete{
        deed = Deed,
        complete = Complete
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54158, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_deed_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(54159, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_deed_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(54101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54102, PackRecordData) ->
    VowList = prot_util:pack(PackRecordData#sc_vow_panel_info.vow_list, [{{64, unsigned}, string, string, {32, unsigned}}]),
    RefreshTimes = prot_util:pack(PackRecordData#sc_vow_panel_info.refresh_times, {8, unsigned}),

    BinData = <<
        VowList/binary,
        RefreshTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54103, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54104, PackRecordData) ->
    VowList = prot_util:pack(PackRecordData#sc_vow_my_like.vow_list, [{{64, unsigned}, string, string, {32, unsigned}}]),

    BinData = <<
        VowList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54105, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54106, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_vow_my_vow.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_vow_my_vow.name, string),
    Career = prot_util:pack(PackRecordData#sc_vow_my_vow.career, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_vow_my_vow.level, {32, unsigned}),
    Context = prot_util:pack(PackRecordData#sc_vow_my_vow.context, string),
    IsPost = prot_util:pack(PackRecordData#sc_vow_my_vow.is_post, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        Career/binary,
        Level/binary,
        Context/binary,
        IsPost/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54107, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#cs_vow_other_vow.target_id, {64, unsigned}),

    BinData = <<
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54108, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_vow_other_vow.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_vow_other_vow.name, string),
    Career = prot_util:pack(PackRecordData#sc_vow_other_vow.career, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_vow_other_vow.level, {32, unsigned}),
    Context = prot_util:pack(PackRecordData#sc_vow_other_vow.context, string),
    IsLike = prot_util:pack(PackRecordData#sc_vow_other_vow.is_like, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        Career/binary,
        Level/binary,
        Context/binary,
        IsLike/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54109, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_vow_refresh.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54110, PackRecordData) ->
    Context = prot_util:pack(PackRecordData#cs_vow.context, string),

    BinData = <<
        Context/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54111, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54112, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#cs_vow_get.target_id, {64, unsigned}),

    BinData = <<
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54113, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54114, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#cs_vow_agree.target_id, {64, unsigned}),

    BinData = <<
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54115, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#sc_vow_agree.target_id, {64, unsigned}),

    BinData = <<
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54116, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#cs_vow_cancel_like.target_id, {64, unsigned}),

    BinData = <<
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54117, PackRecordData) ->
    TargetId = prot_util:pack(PackRecordData#sc_vow_cancel_like.target_id, {64, unsigned}),

    BinData = <<
        TargetId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54118, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54119, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54151, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54152, PackRecordData) ->
    TargetName = prot_util:pack(PackRecordData#sc_deed_info.target_name, string),
    EndTime = prot_util:pack(PackRecordData#sc_deed_info.end_time, {32, unsigned}),
    Deed = prot_util:pack(PackRecordData#sc_deed_info.deed, {16, unsigned}),
    Complete = prot_util:pack(PackRecordData#sc_deed_info.complete, [{u,clt_deed_list}]),
    GetList = prot_util:pack(PackRecordData#sc_deed_info.get_list, [{8, unsigned}]),

    BinData = <<
        TargetName/binary,
        EndTime/binary,
        Deed/binary,
        Complete/binary,
        GetList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54153, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54154, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54155, PackRecordData) ->
    Res = prot_util:pack(PackRecordData#cs_deed_res.res, {8, unsigned}),

    BinData = <<
        Res/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54156, PackRecordData) ->
    TargetName = prot_util:pack(PackRecordData#sc_deed_begin.target_name, string),
    EndTime = prot_util:pack(PackRecordData#sc_deed_begin.end_time, {32, unsigned}),

    BinData = <<
        TargetName/binary,
        EndTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54157, PackRecordData) ->
    Deed = prot_util:pack(PackRecordData#sc_deed_complete.deed, {16, unsigned}),
    Complete = prot_util:pack(PackRecordData#sc_deed_complete.complete, [{u,clt_deed_list}]),

    BinData = <<
        Deed/binary,
        Complete/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54158, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_deed_reward.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(54159, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_deed_reward.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

