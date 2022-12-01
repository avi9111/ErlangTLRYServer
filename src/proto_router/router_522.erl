%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     神器
%%% @end
%%% Created : 24. 十一月 2018 10:15
%%%-------------------------------------------------------------------
-module(router_522).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_522.hrl").

%% API
-export([
    do/3,
    send_new_chip_update/3,
    send_refresh_avatars/4
]).


do(52201, State, #cs_artifact_get_info{}) ->
    lib_role_artifact:info(State, false);

do(52203, State, #cs_artifact_add_extra_attr{pos = Pos}) ->
    case lib_role_artifact:add_extra_attr(State, Pos) of
        {ok, State_New, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52204, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            State_New;
        {error, State_New, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            State_New
    end;

do(52205, State, #cs_artifact_lv_up{}) ->
    case lib_role_artifact:lv_up(State) of
        {ok, StateNew, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52206, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            StateNew;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52207, State, #cs_artifact_change_avatar{avatar_id = AvatarId}) ->
    case catch lib_role_artifact:change_avatar(State, AvatarId) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52208, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52210, State, #cs_artifact_take_award{lv = Lv}) ->
    case catch lib_role_artifact:take_award(State, Lv) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52212, State, #cs_artifact_activate{}) ->
    case catch lib_role_artifact:activate_func(State) of
        {ok, PSN} -> PSN;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;


do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

%% @doc 下发新的幻化刷新列表
send_refresh_avatars(State, CurAvatar, Avatars, AvatarPower) ->
    MsgRecord = #sc_artifact_refresh_avatars{
        cur_avatar = CurAvatar,
        avatars = Avatars,
        a_combat_power = AvatarPower
    },
    {ok, Bin} = prot_msg:encode_msg(52209, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发新的碎片信息更新
send_new_chip_update(State, Lv, Take) ->
    MsgRecord = #sc_artifact_update_new{
        lv = Lv,
        take = Take
    },
    {ok, Bin} = prot_msg:encode_msg(52211, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).