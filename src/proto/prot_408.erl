-module(prot_408).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_408.hrl").


%% ---------------------------------------------------------------------------------------

decode(40801, _BinData) ->

    UnpackRecordData = #cs_skill_get_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40802, BinData) ->
    {_RBin0, Skills} = prot_util:unpack(BinData, {32, signed}),

    UnpackRecordData = #sc_skill_get_info{
        skills = Skills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40803, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_skill_active{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40804, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Lv} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_skill_active{
        id = Id,
        lv = Lv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40805, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_skill_upgrade{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40806, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Lv} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_skill_upgrade{
        id = Id,
        lv = Lv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40807, _BinData) ->

    UnpackRecordData = #cs_skill_one_key_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40808, BinData) ->
    {RBin0, Gold} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Skills} = prot_util:unpack(RBin0, [{{32, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_skill_one_key_up{
        gold = Gold,
        skills = Skills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40809, BinData) ->
    {_RBin0, Skills} = prot_util:unpack(BinData, [{{32, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_skill_new{
        skills = Skills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40802, PackRecordData) ->
    Skills = prot_util:pack(PackRecordData#sc_skill_get_info.skills, {32, signed}),

    BinData = <<
        Skills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40803, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_skill_active.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40804, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_skill_active.id, {32, unsigned}),
    Lv = prot_util:pack(PackRecordData#sc_skill_active.lv, {16, unsigned}),

    BinData = <<
        Id/binary,
        Lv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40805, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_skill_upgrade.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40806, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_skill_upgrade.id, {32, unsigned}),
    Lv = prot_util:pack(PackRecordData#sc_skill_upgrade.lv, {16, unsigned}),

    BinData = <<
        Id/binary,
        Lv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40807, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40808, PackRecordData) ->
    Gold = prot_util:pack(PackRecordData#sc_skill_one_key_up.gold, {32, unsigned}),
    Skills = prot_util:pack(PackRecordData#sc_skill_one_key_up.skills, [{{32, unsigned}, {16, unsigned}}]),

    BinData = <<
        Gold/binary,
        Skills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40809, PackRecordData) ->
    Skills = prot_util:pack(PackRecordData#sc_skill_new.skills, [{{32, unsigned}, {16, unsigned}}]),

    BinData = <<
        Skills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

