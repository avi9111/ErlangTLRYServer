%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派行酒令
%%% @end
%%% Created : 16. 十一月 2018 14:00
%%%-------------------------------------------------------------------
-module(router_518).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_518.hrl").

-export([
    do/3,
    send_update_exp/2,
    send_update_number/3,
    send_update_next_subject/4,
    send_update_comment_info/2
]).

do(51801, State, #cs_guild_wine_act_info{}) ->
    case lib_role_guild_wine_act:info(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(51802, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin);
        _ -> skip
    end;

do(51806, State, #cs_guild_wine_act_dice{}) ->
    case catch lib_role_guild_wine_act:dice(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(51807, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(51808, State, #cs_guild_wine_act_comment_info{}) ->
    case lib_role_guild_wine_act:comment_info(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(51809, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin);
        _ -> skip
    end;

do(51810, State, #cs_guild_wine_act_give_comment{role_id = RoleID, comment_type = CommentType}) ->
    case lib_role_guild_wine_act:give_comment(State, RoleID, CommentType) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;


do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

%% 下发经验更新
send_update_exp(RoleSid, ExpGet) ->
%%    io:format("send_update_exp[ExpGet=~w].~n", [ExpGet]),
    {ok, Bin} = prot_msg:encode_msg(51803, #sc_guild_wine_act_update_exp{ exp_get = ExpGet }),
    lib_role_send:send_to_sid(RoleSid, Bin).

%% 下发参与人数更新
send_update_number(RoleID_List, Number, ExpAddPer ) ->
%%    io:format("send_update_number[Number=~w, ExpAddPer=~w].~n", [Number, ExpAddPer]),
    {ok, Bin} = prot_msg:encode_msg(51804, #sc_guild_wine_act_update_number{ number = Number, exp_add_per = ExpAddPer }),
    lib_role_send:broadcast(RoleID_List, Bin).

%% 下发新环节信息
send_update_next_subject(RoleID_List, CurSubject, NextSubject, NextTime ) ->
%%    io:format("send_update_next_subject[CurSubject=~w, NextSubject=~w, NextTime=~w].~n", [CurSubject, NextSubject, NextTime]),
    {ok, Bin} = prot_msg:encode_msg(51805, #sc_guild_wine_act_update_next_subject{ cur_subject = CurSubject, next_subject = NextSubject, next_time = NextTime }),
    lib_role_send:broadcast(RoleID_List, Bin).

%% 下发点评界面信息更新
send_update_comment_info(RoleID_List, MsgRecord) ->
%%    io:format("send_update_comment_info[MsgRecord=~p].~n", [MsgRecord]),
    {ok, Bin} = prot_msg:encode_msg(51811, MsgRecord),
    lib_role_send:broadcast(RoleID_List, Bin).
