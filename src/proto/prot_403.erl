-module(prot_403).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_403.hrl").


%% ---------------------------------------------------------------------------------------

decode(40301, _BinData) ->

    UnpackRecordData = #cs_mail_list{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40302, BinData) ->
    {_RBin0, Mails} = prot_util:unpack(BinData, [{{64, unsigned}, {32, unsigned}, {8, signed}, string, string, {64, unsigned}, string, {u,clt_mail_goods_list}}]),

    UnpackRecordData = #sc_mail_list{
        mails = Mails
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40303, BinData) ->
    {_RBin0, Mails} = prot_util:unpack(BinData, [{{64, unsigned}, {32, unsigned}, {8, signed}, string, string, {64, unsigned}, string, {u,clt_mail_goods_list}}]),

    UnpackRecordData = #sc_mail_notify_new{
        mails = Mails
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40304, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_mail_notify_expired{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40305, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_mail_get_attach{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40306, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_mail_get_attach{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40307, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_mail_delete{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40308, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_mail_delete{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40309, _BinData) ->

    UnpackRecordData = #cs_mail_one_key_get_attach{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40310, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_mail_one_key_get_attach{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40311, _BinData) ->

    UnpackRecordData = #cs_mail_one_key_delete{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40312, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_mail_one_key_delete{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40313, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_mail_mark_as_read{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40301, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40302, PackRecordData) ->
    Mails = prot_util:pack(PackRecordData#sc_mail_list.mails, [{{64, unsigned}, {32, unsigned}, {8, signed}, string, string, {64, unsigned}, string, {u,clt_mail_goods_list}}]),

    BinData = <<
        Mails/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40303, PackRecordData) ->
    Mails = prot_util:pack(PackRecordData#sc_mail_notify_new.mails, [{{64, unsigned}, {32, unsigned}, {8, signed}, string, string, {64, unsigned}, string, {u,clt_mail_goods_list}}]),

    BinData = <<
        Mails/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40304, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_mail_notify_expired.list, [{64, unsigned}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40305, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_mail_get_attach.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40306, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_mail_get_attach.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40307, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_mail_delete.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40308, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_mail_delete.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40309, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40310, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_mail_one_key_get_attach.list, [{64, unsigned}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40311, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40312, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_mail_one_key_delete.list, [{64, unsigned}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40313, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_mail_mark_as_read.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

