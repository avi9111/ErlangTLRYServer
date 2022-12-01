-module(prot_535).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_535.hrl").


%% ---------------------------------------------------------------------------------------

decode(53501, BinData) ->
    {_RBin0, GuildId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_guild_declare{
        guild_id = GuildId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53502, BinData) ->
    {RBin0, GuildId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, ExpireTime} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Exploit} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Num} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, GuildName} = prot_util:unpack(RBin3, string),
    {_RBin5, Type} = prot_util:unpack(RBin4, {8, unsigned}),

    UnpackRecordData = #sc_guild_declare{
        guild_id = GuildId,
        expire_time = ExpireTime,
        exploit = Exploit,
        num = Num,
        guild_name = GuildName,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53503, BinData) ->
    {_RBin0, GuildId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_guild_hostile{
        guild_id = GuildId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53504, BinData) ->
    {RBin0, GuildId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Rob} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Num} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, GuildLv} = prot_util:unpack(RBin2, {16, unsigned}),
    {_RBin4, GuildName} = prot_util:unpack(RBin3, string),

    UnpackRecordData = #sc_guild_hostile{
        guild_id = GuildId,
        rob = Rob,
        num = Num,
        guild_lv = GuildLv,
        guild_name = GuildName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53505, _BinData) ->

    UnpackRecordData = #cs_guild_declare_list{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53506, BinData) ->
    {RBin0, Declare} = prot_util:unpack(BinData, [{{32, unsigned}, {32, unsigned}, {32, unsigned}, string, {64, unsigned}}]),
    {_RBin1, Back} = prot_util:unpack(RBin0, [{{32, unsigned}, {32, unsigned}, {32, unsigned}, string, {64, unsigned}}]),

    UnpackRecordData = #sc_guild_declare_list{
        declare = Declare,
        back = Back
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53507, _BinData) ->

    UnpackRecordData = #cs_guild_hostile_list{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53508, BinData) ->
    {_RBin0, Hostile} = prot_util:unpack(BinData, [{{32, unsigned}, {8, unsigned}, {16, unsigned}, string, {64, unsigned}}]),

    UnpackRecordData = #sc_guild_hostile_list{
        hostile = Hostile
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53509, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_guild_declare_expire{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53510, _BinData) ->

    UnpackRecordData = #cs_guild_bless_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53511, BinData) ->
    {_RBin0, Bless} = prot_util:unpack(BinData, [{{16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_guild_bless_info{
        bless = Bless
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53512, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_bless{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53513, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Expire} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_guild_bless{
        id = Id,
        expire = Expire
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53515, BinData) ->
    {RBin0, LuckyMoney} = prot_util:unpack(BinData, [{u,clt_lucky_money}]),
    {_RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_money_change{
        lucky_money = LuckyMoney,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53516, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #cs_guild_money_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53517, BinData) ->
    {_RBin0, RemoveList} = prot_util:unpack(BinData, [{32, unsigned}]),

    UnpackRecordData = #sc_guild_money_remove{
        remove_list = RemoveList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53518, BinData) ->
    {RBin0, ShDung} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    {_RBin1, ShCurPage} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_sh_dung_change{
        sh_dung = ShDung,
        sh_cur_page = ShCurPage
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53519, BinData) ->
    {_RBin0, GuildId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_guild_hostile_cancel{
        guild_id = GuildId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53520, BinData) ->
    {_RBin0, GuildId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_guild_hostile_cancel{
        guild_id = GuildId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53501, PackRecordData) ->
    GuildId = prot_util:pack(PackRecordData#cs_guild_declare.guild_id, {64, unsigned}),

    BinData = <<
        GuildId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53502, PackRecordData) ->
    GuildId = prot_util:pack(PackRecordData#sc_guild_declare.guild_id, {64, unsigned}),
    ExpireTime = prot_util:pack(PackRecordData#sc_guild_declare.expire_time, {32, unsigned}),
    Exploit = prot_util:pack(PackRecordData#sc_guild_declare.exploit, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#sc_guild_declare.num, {32, unsigned}),
    GuildName = prot_util:pack(PackRecordData#sc_guild_declare.guild_name, string),
    Type = prot_util:pack(PackRecordData#sc_guild_declare.type, {8, unsigned}),

    BinData = <<
        GuildId/binary,
        ExpireTime/binary,
        Exploit/binary,
        Num/binary,
        GuildName/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53503, PackRecordData) ->
    GuildId = prot_util:pack(PackRecordData#cs_guild_hostile.guild_id, {64, unsigned}),

    BinData = <<
        GuildId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53504, PackRecordData) ->
    GuildId = prot_util:pack(PackRecordData#sc_guild_hostile.guild_id, {64, unsigned}),
    Rob = prot_util:pack(PackRecordData#sc_guild_hostile.rob, {8, unsigned}),
    Num = prot_util:pack(PackRecordData#sc_guild_hostile.num, {32, unsigned}),
    GuildLv = prot_util:pack(PackRecordData#sc_guild_hostile.guild_lv, {16, unsigned}),
    GuildName = prot_util:pack(PackRecordData#sc_guild_hostile.guild_name, string),

    BinData = <<
        GuildId/binary,
        Rob/binary,
        Num/binary,
        GuildLv/binary,
        GuildName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53505, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53506, PackRecordData) ->
    Declare = prot_util:pack(PackRecordData#sc_guild_declare_list.declare, [{{32, unsigned}, {32, unsigned}, {32, unsigned}, string, {64, unsigned}}]),
    Back = prot_util:pack(PackRecordData#sc_guild_declare_list.back, [{{32, unsigned}, {32, unsigned}, {32, unsigned}, string, {64, unsigned}}]),

    BinData = <<
        Declare/binary,
        Back/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53507, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53508, PackRecordData) ->
    Hostile = prot_util:pack(PackRecordData#sc_guild_hostile_list.hostile, [{{32, unsigned}, {8, unsigned}, {16, unsigned}, string, {64, unsigned}}]),

    BinData = <<
        Hostile/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53509, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_guild_declare_expire.list, [{64, unsigned}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53510, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53511, PackRecordData) ->
    Bless = prot_util:pack(PackRecordData#sc_guild_bless_info.bless, [{{16, unsigned}, {32, unsigned}}]),

    BinData = <<
        Bless/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53512, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_bless.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53513, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_bless.id, {8, unsigned}),
    Expire = prot_util:pack(PackRecordData#sc_guild_bless.expire, {32, unsigned}),

    BinData = <<
        Id/binary,
        Expire/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53515, PackRecordData) ->
    LuckyMoney = prot_util:pack(PackRecordData#sc_guild_money_change.lucky_money, [{u,clt_lucky_money}]),
    Type = prot_util:pack(PackRecordData#sc_guild_money_change.type, {8, unsigned}),

    BinData = <<
        LuckyMoney/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53516, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_money_get.id, {32, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53517, PackRecordData) ->
    RemoveList = prot_util:pack(PackRecordData#sc_guild_money_remove.remove_list, [{32, unsigned}]),

    BinData = <<
        RemoveList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53518, PackRecordData) ->
    ShDung = prot_util:pack(PackRecordData#sc_guild_sh_dung_change.sh_dung, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    ShCurPage = prot_util:pack(PackRecordData#sc_guild_sh_dung_change.sh_cur_page, {8, unsigned}),

    BinData = <<
        ShDung/binary,
        ShCurPage/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53519, PackRecordData) ->
    GuildId = prot_util:pack(PackRecordData#cs_guild_hostile_cancel.guild_id, {64, unsigned}),

    BinData = <<
        GuildId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53520, PackRecordData) ->
    GuildId = prot_util:pack(PackRecordData#sc_guild_hostile_cancel.guild_id, {64, unsigned}),

    BinData = <<
        GuildId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

