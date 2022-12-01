-module(prot_523).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_523.hrl").


%% ---------------------------------------------------------------------------------------

decode(52301, _BinData) ->

    UnpackRecordData = #cs_lake_experience_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52302, BinData) ->
    {RBin0, KeepExp} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, HaveTimes} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, DlKeepExp} = prot_util:unpack(RBin1, {64, unsigned}),

    UnpackRecordData = #sc_lake_experience_info{
        keep_exp = KeepExp,
        have_times = HaveTimes,
        dl_keep_exp = DlKeepExp
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52303, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Num} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_lake_experience_use{
        type = Type,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52304, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, KeepExp} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, AddExp} = prot_util:unpack(RBin1, {64, unsigned}),
    {_RBin3, HaveTimes} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #sc_lake_experience_use{
        type = Type,
        keep_exp = KeepExp,
        add_exp = AddExp,
        have_times = HaveTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52301, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52302, PackRecordData) ->
    KeepExp = prot_util:pack(PackRecordData#sc_lake_experience_info.keep_exp, {64, unsigned}),
    HaveTimes = prot_util:pack(PackRecordData#sc_lake_experience_info.have_times, {8, unsigned}),
    DlKeepExp = prot_util:pack(PackRecordData#sc_lake_experience_info.dl_keep_exp, {64, unsigned}),

    BinData = <<
        KeepExp/binary,
        HaveTimes/binary,
        DlKeepExp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52303, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_lake_experience_use.type, {8, unsigned}),
    Num = prot_util:pack(PackRecordData#cs_lake_experience_use.num, {8, unsigned}),

    BinData = <<
        Type/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52304, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_lake_experience_use.type, {8, unsigned}),
    KeepExp = prot_util:pack(PackRecordData#sc_lake_experience_use.keep_exp, {64, unsigned}),
    AddExp = prot_util:pack(PackRecordData#sc_lake_experience_use.add_exp, {64, unsigned}),
    HaveTimes = prot_util:pack(PackRecordData#sc_lake_experience_use.have_times, {8, unsigned}),

    BinData = <<
        Type/binary,
        KeepExp/binary,
        AddExp/binary,
        HaveTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

