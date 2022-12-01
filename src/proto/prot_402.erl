-module(prot_402).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_402.hrl").


%% ---------------------------------------------------------------------------------------

decode(40201, _BinData) ->

    UnpackRecordData = #cs_chat_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40202, BinData) ->
    {_RBin0, Channels} = prot_util:unpack(BinData, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_chat_info{
        channels = Channels
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40203, BinData) ->
    {RBin0, Channel} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Target} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Content} = prot_util:unpack(RBin1, string),
    {RBin3, Voice} = prot_util:unpack(RBin2, string),
    {RBin4, VoiceTime} = prot_util:unpack(RBin3, {16, unsigned}),
    {_RBin5, Extra} = prot_util:unpack(RBin4, string),

    UnpackRecordData = #cs_chat_public{
        channel = Channel,
        target = Target,
        content = Content,
        voice = Voice,
        voice_time = VoiceTime,
        extra = Extra
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40204, BinData) ->
    {RBin0, Channel} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Target} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Content} = prot_util:unpack(RBin1, string),
    {RBin3, Voice} = prot_util:unpack(RBin2, string),
    {RBin4, VoiceTime} = prot_util:unpack(RBin3, {16, unsigned}),
    {_RBin5, Extra} = prot_util:unpack(RBin4, string),

    UnpackRecordData = #sc_chat_public{
        channel = Channel,
        target = Target,
        content = Content,
        voice = Voice,
        voice_time = VoiceTime,
        extra = Extra
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40205, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, SvrNum} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Content} = prot_util:unpack(RBin1, string),
    {RBin3, Voice} = prot_util:unpack(RBin2, string),
    {RBin4, VoiceTime} = prot_util:unpack(RBin3, {16, unsigned}),
    {_RBin5, Extra} = prot_util:unpack(RBin4, string),

    UnpackRecordData = #cs_chat_private{
        id = Id,
        svr_num = SvrNum,
        content = Content,
        voice = Voice,
        voice_time = VoiceTime,
        extra = Extra
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40206, BinData) ->
    {RBin0, Target} = prot_util:unpack(BinData, {u,clt_chat_role}),
    {RBin1, Content} = prot_util:unpack(RBin0, string),
    {RBin2, Voice} = prot_util:unpack(RBin1, string),
    {RBin3, VoiceTime} = prot_util:unpack(RBin2, {16, unsigned}),
    {_RBin4, Extra} = prot_util:unpack(RBin3, string),

    UnpackRecordData = #sc_chat_private{
        target = Target,
        content = Content,
        voice = Voice,
        voice_time = VoiceTime,
        extra = Extra
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40207, BinData) ->
    {RBin0, Channel} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Target} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Sender} = prot_util:unpack(RBin1, {u,clt_chat_role}),
    {RBin3, Time} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Content} = prot_util:unpack(RBin3, string),
    {RBin5, Voice} = prot_util:unpack(RBin4, string),
    {RBin6, VoiceTime} = prot_util:unpack(RBin5, {16, unsigned}),
    {_RBin7, Extra} = prot_util:unpack(RBin6, string),

    UnpackRecordData = #sc_chat_public_notify{
        channel = Channel,
        target = Target,
        sender = Sender,
        time = Time,
        content = Content,
        voice = Voice,
        voice_time = VoiceTime,
        extra = Extra
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40208, BinData) ->
    {RBin0, Sender} = prot_util:unpack(BinData, {u,clt_chat_role}),
    {RBin1, Time} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Content} = prot_util:unpack(RBin1, string),
    {RBin3, Voice} = prot_util:unpack(RBin2, string),
    {RBin4, VoiceTime} = prot_util:unpack(RBin3, {16, unsigned}),
    {_RBin5, Extra} = prot_util:unpack(RBin4, string),

    UnpackRecordData = #sc_chat_private_notify{
        sender = Sender,
        time = Time,
        content = Content,
        voice = Voice,
        voice_time = VoiceTime,
        extra = Extra
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40209, BinData) ->
    {RBin0, Content} = prot_util:unpack(BinData, string),
    {RBin1, Extra} = prot_util:unpack(RBin0, string),
    {_RBin2, Type} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_chat_horn{
        content = Content,
        extra = Extra,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40210, BinData) ->
    {RBin0, Content} = prot_util:unpack(BinData, string),
    {RBin1, Extra} = prot_util:unpack(RBin0, string),
    {_RBin2, Type} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_chat_horn{
        content = Content,
        extra = Extra,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40211, BinData) ->
    {RBin0, Sender} = prot_util:unpack(BinData, {u,clt_chat_role}),
    {RBin1, Time} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Content} = prot_util:unpack(RBin1, string),
    {_RBin3, Extra} = prot_util:unpack(RBin2, string),

    UnpackRecordData = #sc_chat_horn_notify{
        sender = Sender,
        time = Time,
        content = Content,
        extra = Extra
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40213, _BinData) ->

    UnpackRecordData = #cs_chat_cache{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40214, BinData) ->
    {RBin0, OfflineTime} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Pub} = prot_util:unpack(RBin0, [{u,clt_chat_public_cache}]),
    {_RBin2, Pri} = prot_util:unpack(RBin1, [{u,clt_chat_private_cache}]),

    UnpackRecordData = #sc_chat_cache{
        offline_time = OfflineTime,
        pub = Pub,
        pri = Pri
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40215, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_chat_clear_cache{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(40216, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_chat_clear_cache{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(40201, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40202, PackRecordData) ->
    Channels = prot_util:pack(PackRecordData#sc_chat_info.channels, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        Channels/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40203, PackRecordData) ->
    Channel = prot_util:pack(PackRecordData#cs_chat_public.channel, {8, unsigned}),
    Target = prot_util:pack(PackRecordData#cs_chat_public.target, {64, unsigned}),
    Content = prot_util:pack(PackRecordData#cs_chat_public.content, string),
    Voice = prot_util:pack(PackRecordData#cs_chat_public.voice, string),
    VoiceTime = prot_util:pack(PackRecordData#cs_chat_public.voice_time, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#cs_chat_public.extra, string),

    BinData = <<
        Channel/binary,
        Target/binary,
        Content/binary,
        Voice/binary,
        VoiceTime/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40204, PackRecordData) ->
    Channel = prot_util:pack(PackRecordData#sc_chat_public.channel, {8, unsigned}),
    Target = prot_util:pack(PackRecordData#sc_chat_public.target, {64, unsigned}),
    Content = prot_util:pack(PackRecordData#sc_chat_public.content, string),
    Voice = prot_util:pack(PackRecordData#sc_chat_public.voice, string),
    VoiceTime = prot_util:pack(PackRecordData#sc_chat_public.voice_time, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#sc_chat_public.extra, string),

    BinData = <<
        Channel/binary,
        Target/binary,
        Content/binary,
        Voice/binary,
        VoiceTime/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40205, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_chat_private.id, {64, unsigned}),
    SvrNum = prot_util:pack(PackRecordData#cs_chat_private.svr_num, {32, unsigned}),
    Content = prot_util:pack(PackRecordData#cs_chat_private.content, string),
    Voice = prot_util:pack(PackRecordData#cs_chat_private.voice, string),
    VoiceTime = prot_util:pack(PackRecordData#cs_chat_private.voice_time, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#cs_chat_private.extra, string),

    BinData = <<
        Id/binary,
        SvrNum/binary,
        Content/binary,
        Voice/binary,
        VoiceTime/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40206, PackRecordData) ->
    Target = prot_util:pack(PackRecordData#sc_chat_private.target, {u,clt_chat_role}),
    Content = prot_util:pack(PackRecordData#sc_chat_private.content, string),
    Voice = prot_util:pack(PackRecordData#sc_chat_private.voice, string),
    VoiceTime = prot_util:pack(PackRecordData#sc_chat_private.voice_time, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#sc_chat_private.extra, string),

    BinData = <<
        Target/binary,
        Content/binary,
        Voice/binary,
        VoiceTime/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40207, PackRecordData) ->
    Channel = prot_util:pack(PackRecordData#sc_chat_public_notify.channel, {8, unsigned}),
    Target = prot_util:pack(PackRecordData#sc_chat_public_notify.target, {64, unsigned}),
    Sender = prot_util:pack(PackRecordData#sc_chat_public_notify.sender, {u,clt_chat_role}),
    Time = prot_util:pack(PackRecordData#sc_chat_public_notify.time, {32, unsigned}),
    Content = prot_util:pack(PackRecordData#sc_chat_public_notify.content, string),
    Voice = prot_util:pack(PackRecordData#sc_chat_public_notify.voice, string),
    VoiceTime = prot_util:pack(PackRecordData#sc_chat_public_notify.voice_time, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#sc_chat_public_notify.extra, string),

    BinData = <<
        Channel/binary,
        Target/binary,
        Sender/binary,
        Time/binary,
        Content/binary,
        Voice/binary,
        VoiceTime/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40208, PackRecordData) ->
    Sender = prot_util:pack(PackRecordData#sc_chat_private_notify.sender, {u,clt_chat_role}),
    Time = prot_util:pack(PackRecordData#sc_chat_private_notify.time, {32, unsigned}),
    Content = prot_util:pack(PackRecordData#sc_chat_private_notify.content, string),
    Voice = prot_util:pack(PackRecordData#sc_chat_private_notify.voice, string),
    VoiceTime = prot_util:pack(PackRecordData#sc_chat_private_notify.voice_time, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#sc_chat_private_notify.extra, string),

    BinData = <<
        Sender/binary,
        Time/binary,
        Content/binary,
        Voice/binary,
        VoiceTime/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40209, PackRecordData) ->
    Content = prot_util:pack(PackRecordData#cs_chat_horn.content, string),
    Extra = prot_util:pack(PackRecordData#cs_chat_horn.extra, string),
    Type = prot_util:pack(PackRecordData#cs_chat_horn.type, {8, unsigned}),

    BinData = <<
        Content/binary,
        Extra/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40210, PackRecordData) ->
    Content = prot_util:pack(PackRecordData#sc_chat_horn.content, string),
    Extra = prot_util:pack(PackRecordData#sc_chat_horn.extra, string),
    Type = prot_util:pack(PackRecordData#sc_chat_horn.type, {8, unsigned}),

    BinData = <<
        Content/binary,
        Extra/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40211, PackRecordData) ->
    Sender = prot_util:pack(PackRecordData#sc_chat_horn_notify.sender, {u,clt_chat_role}),
    Time = prot_util:pack(PackRecordData#sc_chat_horn_notify.time, {32, unsigned}),
    Content = prot_util:pack(PackRecordData#sc_chat_horn_notify.content, string),
    Extra = prot_util:pack(PackRecordData#sc_chat_horn_notify.extra, string),

    BinData = <<
        Sender/binary,
        Time/binary,
        Content/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40213, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40214, PackRecordData) ->
    OfflineTime = prot_util:pack(PackRecordData#sc_chat_cache.offline_time, {32, unsigned}),
    Pub = prot_util:pack(PackRecordData#sc_chat_cache.pub, [{u,clt_chat_public_cache}]),
    Pri = prot_util:pack(PackRecordData#sc_chat_cache.pri, [{u,clt_chat_private_cache}]),

    BinData = <<
        OfflineTime/binary,
        Pub/binary,
        Pri/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40215, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_chat_clear_cache.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(40216, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_chat_clear_cache.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

