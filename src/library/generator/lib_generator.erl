%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     ID生成
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_generator).
-author("Ryuu").

-include("generator.hrl").

%% API
-export([
    info/1,
    init/1,
    gen_id/1
]).

info(State) ->
    [
        {state, State}
    ].

init(Type) ->
    ServerNum = config:get_server_num(),
    SvrNumOffset = ServerNum bsl ?SERVER_NUM_OFFSET,
    #{type => Type, svrnum_offset => SvrNumOffset, last_gen => 0, last_offset => 0}.

%% @doc 生成id
gen_id(State) ->
    #{svrnum_offset := SvrNumOffset, last_gen := LastGen, last_offset := LastOffset} = State,
    {ID, NewGen, NewOffset} = gen_id(SvrNumOffset, LastGen, LastOffset),
    {State#{last_gen => NewGen, last_offset => NewOffset}, ID}.

gen_id(CommonOffset, LastGen, LastOffset) ->
    NowTime = time:unixtime(),
    {Timestamp, NewOffset} = case LastGen < NowTime of
        true ->
            {NowTime, 0};
        false when LastOffset < ?MAX_ID_IN_SECOND ->
            {LastGen, LastOffset + 1};
        false ->
            {LastGen + 1, 0}
    end,
    TimestampOffset = Timestamp bsl ?TIMESTAMP_OFFSET,
    RoleID = CommonOffset + TimestampOffset + NewOffset,
    {RoleID, Timestamp, NewOffset}.
