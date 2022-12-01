-module(prot_251).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_251.hrl").


%% ---------------------------------------------------------------------------------------

decode(25101, _BinData) ->

    UnpackRecordData = #cs_func_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25102, BinData) ->
    {_RBin0, Funcs} = prot_util:unpack(BinData, [{32, unsigned}]),

    UnpackRecordData = #sc_func_info{
        funcs = Funcs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25103, BinData) ->
    {_RBin0, Funcs} = prot_util:unpack(BinData, [{32, unsigned}]),

    UnpackRecordData = #sc_func_opened{
        funcs = Funcs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25141, _BinData) ->

    UnpackRecordData = #get_newbie_guide_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25142, BinData) ->
    {_RBin0, NewbieGuide} = prot_util:unpack(BinData, [{{32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #get_newbie_guide_info_resp{
        newbie_guide = NewbieGuide
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(25143, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Num} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #update_newbie_guide_req{
        id = Id,
        num = Num
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(25101, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25102, PackRecordData) ->
    Funcs = prot_util:pack(PackRecordData#sc_func_info.funcs, [{32, unsigned}]),

    BinData = <<
        Funcs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25103, PackRecordData) ->
    Funcs = prot_util:pack(PackRecordData#sc_func_opened.funcs, [{32, unsigned}]),

    BinData = <<
        Funcs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25141, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25142, PackRecordData) ->
    NewbieGuide = prot_util:pack(PackRecordData#get_newbie_guide_info_resp.newbie_guide, [{{32, unsigned}, {8, unsigned}}]),

    BinData = <<
        NewbieGuide/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(25143, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#update_newbie_guide_req.id, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#update_newbie_guide_req.num, {32, unsigned}),

    BinData = <<
        Id/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

