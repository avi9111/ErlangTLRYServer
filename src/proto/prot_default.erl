-module(prot_default).

-export([
    encode/2,
    decode/2
]).

-include("log.hrl").

%% ---------------------------------------------------------------------------------------
decode(Cmd, Bin) ->
    ?ERROR("Recv undefined command: ~p with Bin: ~p from client !", [Cmd, Bin]),
    {error, []}.



%% ---------------------------------------------------------------------------------------
encode(Cmd, Msg) ->
    ?ERROR("Calling undefined prot_msg:encode with command: ~p Msg: ~p !", [Cmd, Msg]),
    {error, <<>>}.
