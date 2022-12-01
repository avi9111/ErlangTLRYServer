%%% -----------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     投色子
%%% @end
%%% -----------------------------------------------------
-module(router_533).
-author("Ryuu").

-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_533.hrl").

%% API
-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
do(53301, PS, #roll_dice_req{id = ID}) ->
    #role_state{id = RoleID, name = RoleName} = PS,
    case svr_dice:roll_dice(RoleID, RoleName, ID) of
        {ok, DiceVal} ->
            Res = #roll_dice_resp{id = ID, val = DiceVal},
            {ok, Bin} = prot_msg:encode_msg(53302, Res),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin);
        {error, ErrCode} ->
            ?ERROR_TOC(RoleID, ErrCode)
    end;

do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).


%% Privates ---------------------------------------------
