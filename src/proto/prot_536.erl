-module(prot_536).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_536.hrl").


%% ---------------------------------------------------------------------------------------

decode(53601, _BinData) ->

    UnpackRecordData = #cs_seven_login_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53602, BinData) ->
    {RBin0, LoginDay} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, List} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #sc_seven_login_info{
        login_day = LoginDay,
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53603, BinData) ->
    {_RBin0, Day} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_seven_login_get{
        day = Day
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(53604, BinData) ->
    {_RBin0, Day} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_seven_login_get{
        day = Day
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(53601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53602, PackRecordData) ->
    LoginDay = prot_util:pack(PackRecordData#sc_seven_login_info.login_day, {8, unsigned}),
    List = prot_util:pack(PackRecordData#sc_seven_login_info.list, [{8, unsigned}]),

    BinData = <<
        LoginDay/binary,
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53603, PackRecordData) ->
    Day = prot_util:pack(PackRecordData#cs_seven_login_get.day, {8, unsigned}),

    BinData = <<
        Day/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(53604, PackRecordData) ->
    Day = prot_util:pack(PackRecordData#sc_seven_login_get.day, {8, unsigned}),

    BinData = <<
        Day/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

