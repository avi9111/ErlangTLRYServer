-module(prot_406).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_406.hrl").


%% ---------------------------------------------------------------------------------------

decode(40601, _BinData) ->

    UnpackRecordData = #cs_title_get_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40602, BinData) ->
    {RBin0, Cur} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Titles} = prot_util:unpack(RBin0, [{u,clt_title}]),

    UnpackRecordData = #sc_title_get_info{
        cur = Cur,
        titles = Titles
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40603, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_title_activate{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40604, _BinData) ->

    UnpackRecordData = #sc_title_activate{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40605, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_title_wear{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40606, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_title_wear{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40607, BinData) ->
    {_RBin0, Title} = prot_util:unpack(BinData, {u,clt_title}),

    UnpackRecordData = #sc_title_notify_new{
        title = Title
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40608, BinData) ->
    {_RBin0, Titles} = prot_util:unpack(BinData, [{32, unsigned}]),

    UnpackRecordData = #sc_title_notify_expire{
        titles = Titles
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40609, BinData) ->
    {_RBin0, Title} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_title_notify_current{
        title = Title
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40610, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Title} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, TitleExtra} = prot_util:unpack(RBin1, string),
    {_RBin3, TitleQuality} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #sc_title_change{
        role_id = RoleId,
        title = Title,
        title_extra = TitleExtra,
        title_quality = TitleQuality
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40611, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Header} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #sc_title_header{
        role_id = RoleId,
        header = Header
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40602, PackRecordData) ->
    Cur = prot_util:pack(PackRecordData#sc_title_get_info.cur, {32, unsigned}),
    Titles = prot_util:pack(PackRecordData#sc_title_get_info.titles, [{u,clt_title}]),

    BinData = <<
        Cur/binary,
        Titles/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40603, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_title_activate.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40604, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40605, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_title_wear.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40606, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_title_wear.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40607, PackRecordData) ->
    Title = prot_util:pack(PackRecordData#sc_title_notify_new.title, {u,clt_title}),

    BinData = <<
        Title/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40608, PackRecordData) ->
    Titles = prot_util:pack(PackRecordData#sc_title_notify_expire.titles, [{32, unsigned}]),

    BinData = <<
        Titles/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40609, PackRecordData) ->
    Title = prot_util:pack(PackRecordData#sc_title_notify_current.title, {32, unsigned}),

    BinData = <<
        Title/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40610, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_title_change.role_id, {64, unsigned}),
    Title = prot_util:pack(PackRecordData#sc_title_change.title, {32, unsigned}),
    TitleExtra = prot_util:pack(PackRecordData#sc_title_change.title_extra, string),
    TitleQuality = prot_util:pack(PackRecordData#sc_title_change.title_quality, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Title/binary,
        TitleExtra/binary,
        TitleQuality/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40611, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_title_header.role_id, {64, unsigned}),
    Header = prot_util:pack(PackRecordData#sc_title_header.header, {64, unsigned}),

    BinData = <<
        RoleId/binary,
        Header/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

