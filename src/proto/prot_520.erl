-module(prot_520).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_520.hrl").


%% ---------------------------------------------------------------------------------------

decode(52001, _BinData) ->

    UnpackRecordData = #cs_guild_begin_practice{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52002, BinData) ->
    {_RBin0, EndTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_guild_begin_practice{
        end_time = EndTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52003, _BinData) ->

    UnpackRecordData = #cs_guild_join_in_practice{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52004, _BinData) ->

    UnpackRecordData = #cs_guild_send_team_invite{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52002, PackRecordData) ->
    EndTime = prot_util:pack(PackRecordData#sc_guild_begin_practice.end_time, {32, unsigned}),

    BinData = <<
        EndTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52003, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52004, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

