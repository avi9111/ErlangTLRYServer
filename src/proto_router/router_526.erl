%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     暗器
%%% @end
%%% Created : 29. 十一月 2018 11:25
%%%-------------------------------------------------------------------
-module(router_526).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_526.hrl").

%% API
-export([
    do/3,
    send_new_plan_update/3,
    send_poison_slot_update/2
]).

do(52601, State, #cs_anqi_get_info{}) ->
    case lib_role_anqi:info(State) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52602, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        _ -> skip
    end;

do(52603, State, #cs_anqi_practice{}) ->
    case lib_role_anqi:practice(State) of
        {ok, PSN} -> {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52605, State, #cs_anqi_forge{}) ->
    case lib_role_anqi:forge(State) of
        {ok, PSN, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52606, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52607, State, #cs_anqi_lv_up{}) ->
    case lib_role_anqi:lv_up(State) of
        {ok, PSN, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52608, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52609, State, #cs_anqi_change_plan{plan = Plan}) ->
    case catch lib_role_anqi:change_plan(State, Plan) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52610, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52611, State, #cs_anqi_unlock_plan{plan = Plan}) ->
    case lib_role_anqi:unlock_plan(State, Plan) of
        {ok, PSN, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52612, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52613, State, #cs_anqi_refresh_plan{}) ->
    case lib_role_anqi:refresh_plan(State) of
        {ok, PSN, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52614, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52615, State, #cs_anqi_replace_plan{plan = Plan}) ->
    case catch lib_role_anqi:replace_plan(State, Plan) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(52616, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52618, State, #cs_anqi_open_poison_slot{index = Index}) ->
    case lib_role_anqi:open_poison_slot(State, Index) of
        {ok, PSN} ->
            {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52619, State, #cs_anqi_create_poison{index = Index}) ->
    case lib_role_anqi:create_poison(State, Index) of
        {ok, PSN} ->
            {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(52620, State, #cs_anqi_replace_poison_attr{index = Index}) ->
    case catch lib_role_anqi:replace_poison_attr(State, Index) of
        {ok, PSV} ->
            {ok, PSV};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;


do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


%% @doc 下发新技能方案更新
send_new_plan_update(State, NewSkillPlan, CurPlan) ->
    MsgRecord = #sc_anqi_new_plan_update{
        cur_plan = CurPlan,
        skill_plan = NewSkillPlan
    },
    {ok, Bin} = prot_msg:encode_msg(52617, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发淬毒孔更新
send_poison_slot_update(State, PoisonSlot) ->
    MsgRecord = #sc_anqi_poison_slot_update{
        poison_slot = PoisonSlot
    },
    {ok, Bin} = prot_msg:encode_msg(52621, MsgRecord),
    lib_role_send:send_to_sid(State#role_state.sid, Bin).
