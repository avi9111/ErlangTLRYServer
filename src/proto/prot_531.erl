-module(prot_531).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_531.hrl").


%% ---------------------------------------------------------------------------------------

decode(53101, _BinData) ->

    UnpackRecordData = #cs_online_reward_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53102, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, List} = prot_util:unpack(RBin0, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_online_reward_info{
        times = Times,
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53103, _BinData) ->

    UnpackRecordData = #cs_online_reward_pray{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53104, BinData) ->
    {RBin0, Times} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_online_reward_pary{
        times = Times,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53105, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_online_reward_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53106, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_online_reward_get{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53110, _BinData) ->

    UnpackRecordData = #cs_grow_fund_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53111, BinData) ->
    {RBin0, Grade} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, GetList} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #sc_grow_fund_info{
        grade = Grade,
        get_list = GetList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53112, BinData) ->
    {RBin0, Grade} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_grow_fund_get{
        grade = Grade,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53113, BinData) ->
    {RBin0, Grade} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_grow_fund_get{
        grade = Grade,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53120, _BinData) ->

    UnpackRecordData = #cs_daily_gift_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53121, BinData) ->
    {_RBin0, RewardList} = prot_util:unpack(BinData, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_daily_gift_info{
        reward_list = RewardList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53122, BinData) ->
    {RBin0, Grade} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_daily_gift_get{
        grade = Grade,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53123, BinData) ->
    {RBin0, Grade} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_daily_gift_get{
        grade = Grade,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53130, _BinData) ->

    UnpackRecordData = #cs_mon_retrieve_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53131, BinData) ->
    {RBin0, LeaveNum} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_mon_retrieve_info{
        leave_num = LeaveNum,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53132, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_mon_retrieve_get{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53133, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_mon_retrieve_get{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53140, _BinData) ->

    UnpackRecordData = #cs_retrieve_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53141, BinData) ->
    {_RBin0, Retrieve} = prot_util:unpack(BinData, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_retrieve_info{
        retrieve = Retrieve
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53142, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {16, unsigned}),
    {_RBin2, RetrieveTimes} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #cs_retrieve_get{
        type = Type,
        id = Id,
        retrieve_times = RetrieveTimes
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53143, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Times} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_retrieve_get{
        id = Id,
        times = Times
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53144, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_buy_fund{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53102, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_online_reward_info.times, {8, unsigned}),
    List = prot_util:pack(PackRecordData#sc_online_reward_info.list, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Times/binary,
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53103, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53104, PackRecordData) ->
    Times = prot_util:pack(PackRecordData#sc_online_reward_pary.times, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_online_reward_pary.id, {8, unsigned}),

    BinData = <<
        Times/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53105, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_online_reward_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53106, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_online_reward_get.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53110, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53111, PackRecordData) ->
    Grade = prot_util:pack(PackRecordData#sc_grow_fund_info.grade, {8, unsigned}),
    GetList = prot_util:pack(PackRecordData#sc_grow_fund_info.get_list, [{8, unsigned}]),

    BinData = <<
        Grade/binary,
        GetList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53112, PackRecordData) ->
    Grade = prot_util:pack(PackRecordData#cs_grow_fund_get.grade, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_grow_fund_get.id, {8, unsigned}),

    BinData = <<
        Grade/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53113, PackRecordData) ->
    Grade = prot_util:pack(PackRecordData#sc_grow_fund_get.grade, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_grow_fund_get.id, {8, unsigned}),

    BinData = <<
        Grade/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53120, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53121, PackRecordData) ->
    RewardList = prot_util:pack(PackRecordData#sc_daily_gift_info.reward_list, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        RewardList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53122, PackRecordData) ->
    Grade = prot_util:pack(PackRecordData#cs_daily_gift_get.grade, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_daily_gift_get.id, {8, unsigned}),

    BinData = <<
        Grade/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53123, PackRecordData) ->
    Grade = prot_util:pack(PackRecordData#sc_daily_gift_get.grade, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#sc_daily_gift_get.id, {8, unsigned}),

    BinData = <<
        Grade/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53130, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53131, PackRecordData) ->
    LeaveNum = prot_util:pack(PackRecordData#sc_mon_retrieve_info.leave_num, {16, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_mon_retrieve_info.type, {8, unsigned}),

    BinData = <<
        LeaveNum/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53132, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_mon_retrieve_get.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53133, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_mon_retrieve_get.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53140, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53141, PackRecordData) ->
    Retrieve = prot_util:pack(PackRecordData#sc_retrieve_info.retrieve, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Retrieve/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53142, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_retrieve_get.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_retrieve_get.id, {16, unsigned}),
    RetrieveTimes = prot_util:pack(PackRecordData#cs_retrieve_get.retrieve_times, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary,
        RetrieveTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53143, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_retrieve_get.id, {16, unsigned}),
    Times = prot_util:pack(PackRecordData#sc_retrieve_get.times, {8, unsigned}),

    BinData = <<
        Id/binary,
        Times/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53144, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_buy_fund.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

