%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     武魂系统
%%% @end
%%% Created : 23. 一月 2019 17:12
%%%-------------------------------------------------------------------
-module(router_539).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_539.hrl").

%% API
-export([
    do/3,
    send_refresh_avatars/5,
    send_soul_part_update/3
]).


do(53901, State, #cs_warrior_soul_info{}) ->
    lib_role_warrior_soul:info(State);

do(53903, State, #cs_warrior_soul_refine{}) ->
    case lib_role_warrior_soul:refine(State) of
        {ok, State_New} ->
            State_New;
        {error, State_New, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            State_New
    end;

do(53905, State, #cs_warrior_soul_star_up{}) ->
    case lib_role_warrior_soul:star_up(State) of
        {ok, StateNew, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(53906, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            StateNew;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(53907, State, #cs_warrior_soul_conden{type = Type, batch = Batch}) ->
    case lib_role_warrior_soul:conden_soul(State, Type, Batch) of
        {ok, StateNew, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(53908, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            StateNew;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(53909, State, #cs_warrior_soul_save_conden{type = Type, index_list = IndexList}) ->
    case catch lib_role_warrior_soul:save_conden(State, Type, IndexList) of
        {ok, StateNew} -> StateNew;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(53911, State, #cs_warrior_soul_change_attr{type = Type, cur_attr_id = CurAttrId, target_attr_id = TargetAttrId}) ->
    case lib_role_warrior_soul:change_attr(State, Type, CurAttrId, TargetAttrId) of
        {ok, StateNew} -> StateNew;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(53912, State, #cs_warrior_soul_change_avatar{avatar_id = AvatarId}) ->
    case catch lib_role_warrior_soul:change_avatar(State, AvatarId) of
        ok ->
            MsgRecord = #sc_warrior_soul_change_avatar{
                avatar_id = AvatarId
            },
            {ok, Bin} = prot_msg:encode_msg(53913, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;



do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


%% @doc 下发凝魂部位更新
send_soul_part_update(State, CombatPower, NewSoulPart) when is_record(NewSoulPart, soul_part_info) ->
    MsgRecord = #sc_warrior_soul_part_update{
        combat_power = CombatPower,
        new_part = NewSoulPart
    },
    {ok, Bin} = prot_msg:encode_msg(53910, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin);
send_soul_part_update(_, _, _) ->
    ignore.

%% @doc 下发最新的精魄幻化列表更新
send_refresh_avatars(State, CurAvatar, Avatars, CombatPower, CombatPowerAvatar) ->
    MsgRecord = #sc_warrior_soul_refresh_avatars{
        cur_avatar = CurAvatar,
        avatars = Avatars,
        combat_power = CombatPower,
        a_combat_power = CombatPowerAvatar
    },
    {ok, Bin} = prot_msg:encode_msg(53914, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).