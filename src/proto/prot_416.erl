-module(prot_416).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_416.hrl").


%% ---------------------------------------------------------------------------------------

decode(41601, _BinData) ->

    UnpackRecordData = #cs_marry_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41602, BinData) ->
    {RBin0, MateId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, MateName} = prot_util:unpack(RBin0, string),
    {RBin2, MateIcon} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, MateFrame} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, MateCareer} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, MarryTime} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Bless} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, LoveValue} = prot_util:unpack(RBin6, {32, unsigned}),
    {_RBin8, Skills} = prot_util:unpack(RBin7, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_marry_info{
        mate_id = MateId,
        mate_name = MateName,
        mate_icon = MateIcon,
        mate_frame = MateFrame,
        mate_career = MateCareer,
        marry_time = MarryTime,
        bless = Bless,
        love_value = LoveValue,
        skills = Skills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41603, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Opt} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_marry_invite{
        id = Id,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41604, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_marry_invite{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41605, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Opt} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_marry_response{
        id = Id,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41606, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Opt} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_marry_response{
        id = Id,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41607, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_marry_notify_invite{
        id = Id,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41608, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {_RBin2, Opt} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_marry_notify_response{
        id = Id,
        name = Name,
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41609, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_marry_notify_couple{
        id = Id,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41610, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, MateId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, MateName} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #sc_marry_notify{
        role_id = RoleId,
        mate_id = MateId,
        mate_name = MateName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41611, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_marry_divorce{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41612, _BinData) ->

    UnpackRecordData = #sc_marry_divorce{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41613, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_marry_confirm{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41614, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_marry_confirm{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41615, _BinData) ->

    UnpackRecordData = #sc_marry_notify_request{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41616, BinData) ->
    {_RBin0, Opt} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_marry_notify_confirm{
        opt = Opt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41617, _BinData) ->

    UnpackRecordData = #sc_marry_notify_divorce{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41618, BinData) ->
    {_RBin0, LoveValue} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_marry_love_value{
        love_value = LoveValue
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41619, _BinData) ->

    UnpackRecordData = #cs_marry_adv_bless{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41620, BinData) ->
    {_RBin0, Bless} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_marry_adv_bless{
        bless = Bless
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41621, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_marry_lv_up_skill{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41622, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Level} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_marry_lv_up_skill{
        id = Id,
        level = Level
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41623, _BinData) ->

    UnpackRecordData = #cs_query_mate_scene{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41624, BinData) ->
    {_RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_query_mate_scene{
        scene_id = SceneId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(41601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41602, PackRecordData) ->
    MateId = prot_util:pack(PackRecordData#sc_marry_info.mate_id, {64, unsigned}),
    MateName = prot_util:pack(PackRecordData#sc_marry_info.mate_name, string),
    MateIcon = prot_util:pack(PackRecordData#sc_marry_info.mate_icon, {16, unsigned}),
    MateFrame = prot_util:pack(PackRecordData#sc_marry_info.mate_frame, {16, unsigned}),
    MateCareer = prot_util:pack(PackRecordData#sc_marry_info.mate_career, {8, unsigned}),
    MarryTime = prot_util:pack(PackRecordData#sc_marry_info.marry_time, {32, unsigned}),
    Bless = prot_util:pack(PackRecordData#sc_marry_info.bless, {8, unsigned}),
    LoveValue = prot_util:pack(PackRecordData#sc_marry_info.love_value, {32, unsigned}),
    Skills = prot_util:pack(PackRecordData#sc_marry_info.skills, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        MateId/binary,
        MateName/binary,
        MateIcon/binary,
        MateFrame/binary,
        MateCareer/binary,
        MarryTime/binary,
        Bless/binary,
        LoveValue/binary,
        Skills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41603, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_marry_invite.id, {64, unsigned}),
    Opt = prot_util:pack(PackRecordData#cs_marry_invite.opt, {8, unsigned}),

    BinData = <<
        Id/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41604, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_marry_invite.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41605, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_marry_response.id, {64, unsigned}),
    Opt = prot_util:pack(PackRecordData#cs_marry_response.opt, {8, unsigned}),

    BinData = <<
        Id/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41606, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_marry_response.id, {64, unsigned}),
    Opt = prot_util:pack(PackRecordData#sc_marry_response.opt, {8, unsigned}),

    BinData = <<
        Id/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41607, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_marry_notify_invite.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_marry_notify_invite.name, string),

    BinData = <<
        Id/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41608, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_marry_notify_response.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_marry_notify_response.name, string),
    Opt = prot_util:pack(PackRecordData#sc_marry_notify_response.opt, {8, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41609, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_marry_notify_couple.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_marry_notify_couple.name, string),

    BinData = <<
        Id/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41610, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_marry_notify.role_id, {64, unsigned}),
    MateId = prot_util:pack(PackRecordData#sc_marry_notify.mate_id, {64, unsigned}),
    MateName = prot_util:pack(PackRecordData#sc_marry_notify.mate_name, string),

    BinData = <<
        RoleId/binary,
        MateId/binary,
        MateName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41611, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_marry_divorce.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41612, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41613, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#cs_marry_confirm.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41614, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#sc_marry_confirm.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41615, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41616, PackRecordData) ->
    Opt = prot_util:pack(PackRecordData#sc_marry_notify_confirm.opt, {8, unsigned}),

    BinData = <<
        Opt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41617, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41618, PackRecordData) ->
    LoveValue = prot_util:pack(PackRecordData#sc_marry_love_value.love_value, {32, unsigned}),

    BinData = <<
        LoveValue/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41619, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41620, PackRecordData) ->
    Bless = prot_util:pack(PackRecordData#sc_marry_adv_bless.bless, {8, unsigned}),

    BinData = <<
        Bless/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41621, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_marry_lv_up_skill.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41622, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_marry_lv_up_skill.id, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_marry_lv_up_skill.level, {8, unsigned}),

    BinData = <<
        Id/binary,
        Level/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41623, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41624, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#sc_query_mate_scene.scene_id, {32, unsigned}),

    BinData = <<
        SceneId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

