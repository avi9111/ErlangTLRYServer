%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     结拜系统
%%% @end
%%% Created : 15. 二月 2019 20:28
%%%-------------------------------------------------------------------
-module(router_540).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("sworn.hrl").
-include("ret_code.hrl").
-include("proto/prot_540.hrl").
-include("proto/prot_105.hrl").

%% API
-export([
    do/3,
    send_tipscode/2,
    send_confirm_ui/4,
    send_enounce_update/2,
    send_member_del_msg/3,
    send_leave_group_msg/1,
    send_create_group_msg/2,
    send_create_group_msg/3,
    send_change_senior_ui/2,
    send_member_update_msg/2,
    send_group_name_update/2,
    send_confirm_cancel_msg/4,
    send_confirm_ui_special/4,
    send_sworn_value_update/2,
    send_change_group_name_ui/1,
    send_register_button_update/2,
    send_group_name_quality_update/2

]).


do(54001, State, #cs_sworn_info{}) ->
    case lib_role_sworn:info(State) of
        ok -> ok;
        _ -> skip
    end;

do(54003, State, #cs_sworn_create_new{}) ->
    case catch lib_role_sworn:create_new(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err;
        {error, RetCode, Args} ->
            ?ERROR_TOC(State#role_state.id, RetCode, Args),
            err
    end;

do(54005, State, #cs_sworn_make_confirm{type = Type, choice = Choice}) ->
    case catch lib_role_sworn:make_confirm(State, Type, Choice) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54006, State, #cs_sworn_recruit_member{}) ->
    case catch lib_role_sworn:recruit_member(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err;
        {error, RetCode, Args} ->
            ?ERROR_TOC(State#role_state.id, RetCode, Args),
            err
    end;

do(54008, State, #cs_sworn_dismiss_member_req{}) ->
    case catch lib_role_sworn:dismiss_member_req(State) of
        ok ->
            MsgRecord = #sc_sworn_dismiss_member_req{},
            {ok, Bin} = prot_msg:encode_msg(54009, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin);
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err;
        {error, RetCode, Args} ->
            ?ERROR_TOC(State#role_state.id, RetCode, Args),
            err
    end;

do(54010, State, #cs_sworn_dismiss_member{role_id = RoleID, reason = Reason}) ->
    case catch lib_role_sworn:dismiss_member(State, RoleID, Reason) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54012, State, #cs_sworn_change_senior{}) ->
    case catch lib_role_sworn:change_senior(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err;
        {error, RetCode, Args} ->
            ?ERROR_TOC(State#role_state.id, RetCode, Args),
            err
    end;

do(54014, State, #cs_sworn_modify_name_req{}) ->
    case catch lib_role_sworn:modify_name_req(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err;
        {error, RetCode, Args} ->
            ?ERROR_TOC(State#role_state.id, RetCode, Args),
            err
    end;

do(54016, State, #cs_sworn_modify_name{name_head = NameHead, name_tail = NameTail}) ->
    case catch lib_role_sworn:modify_name(State, NameHead, NameTail) of
        {ok, State_New} ->
            State_New;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54018, State, #cs_sworn_modify_word{word = Word}) ->
    case catch lib_role_sworn:modify_word(State, Word) of
        {ok, PSN} ->
            MsgRecord = #sc_sworn_modify_word{word = Word},
            {ok, Bin} = prot_msg:encode_msg(54019, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin),
            {ok, PSN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54020, State, #cs_sworn_up_quality{}) ->
    case catch lib_role_sworn:up_quality(State) of
        ok-> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54023, State, #cs_sworn_modify_enounce{enounce = Enounce}) ->
    case catch lib_role_sworn:modify_enounce(State, Enounce) of
        ok-> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;


do(54025, State, #cs_sworn_gather_member{}) ->
    case catch lib_role_sworn:gather_member(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54026, State, #cs_sworn_get_platform_list{type = Type}) ->
    case catch lib_role_sworn:get_platform_list(State, Type) of
        {ok, MsgRecord} ->
            {ok, Bin} = prot_msg:encode_msg(54027, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin);
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54028, State, #cs_sworn_register{tend_career = TendCareer, tend_lv = TendLv, tend_time = TendTime}) ->
    case catch lib_role_sworn:platform_register(State, TendCareer, TendLv, TendTime) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54030, State, #cs_sworn_cancel_register{}) ->
    case catch lib_role_sworn:platform_cancel_register(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54031, State, #cs_sworn_greet{type = Type, id = Id}) ->
    case catch lib_role_sworn:greet(State, Type, Id) of
        {ok, GreetNum} ->
            {ok, Bin} = prot_msg:encode_msg(54032, #sc_sworn_greet{type = Type, id = Id, greet_num = GreetNum}),
            lib_role_send:send_to_sid(State#role_state.sid, Bin);
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54033, State, #cs_sworn_vote_senior{role_id = RoleID}) ->
    case catch lib_role_sworn:vote_senior(State, RoleID) of
        ok->
            MsgRecord = #sc_sworn_vote_senior{role_id = RoleID},
            {ok, Bin} = prot_msg:encode_msg(54034, MsgRecord),
            lib_role_send:send_to_sid(State#role_state.sid, Bin);
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;

do(54035, State, #cs_sworn_leave_group{}) ->
    case catch lib_role_sworn:leave_group(State) of
        ok -> ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            err
    end;





do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


%% @doc 下发请求发起返回确认框，对下发提示特殊处理
send_confirm_ui_special(Members, Type, NameArr, ConfirmCD) ->
    [begin
         NameStr = lib_role_sworn:get_name_concat_str(<<",">>, lists:keydelete(MemID, 1, NameArr), ""),
         Msg = io_lib:format(config:get_string(sworn_create_confirm), [NameStr]),
         MsgRecord = #sc_sworn_confirm_u_i{
             type = Type,
             msg = Msg,
             cd_time = ConfirmCD
         },
         {ok, Bin} = prot_msg:encode_msg(54004, MsgRecord),
         lib_role_send:send_to_role(MemID, Bin)
     end || MemID <- Members].

%% @doc 下发请求发起返回确认框
send_confirm_ui(Members, Type, Msg, ConfirmCD) ->
    MsgRecord = #sc_sworn_confirm_u_i{
        type = Type,
        msg = Msg,
        cd_time = ConfirmCD
    },
    {ok, Bin} = prot_msg:encode_msg(54004, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发离开结拜组消息
send_leave_group_msg(Members) ->
    MsgRecord = #sc_sworn_leave_group{},
    {ok, Bin} = prot_msg:encode_msg(54036, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发结拜成员被移除消息
send_member_del_msg(Members, TargetRoleID, SwornValue) ->
    MsgRecord = #sc_sworn_delete_member{
        role_id = TargetRoleID,
        sworn_value = SwornValue
    },
    {ok, Bin} = prot_msg:encode_msg(54011, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发取消确认的消息
send_confirm_cancel_msg(Members, Type, RetCode, Args) ->
    {ok, Bin1} = prot_msg:encode_msg(54004, #sc_sworn_confirm_u_i{type = Type}),
    {ok, Bin2} = prot_msg:encode_msg(10502, #sc_general_ret_code_e{code = RetCode, args = Args}),
    BinN = <<Bin1/binary, Bin2/binary>>,
    lib_role_send:broadcast(Members, BinN).

%% @doc 广播错误提示
send_tipscode(Members, RetCode) ->
    {ok, Bin} = prot_msg:encode_msg(10501, #sc_general_ret_code{code = RetCode}),
    lib_role_send:broadcast(Members, Bin).

%% @doc  下发结拜成功信息
send_create_group_msg(Members, Group) ->
    send_create_group_msg(Members, Group, 0).

send_create_group_msg(Members, Group, OpenUI) ->
    #sworn_group{
        group_id = GroupID,
        name = GroupName,
        quality = Quality,
        members = MemList,
        sworn_value = SwornValue,
        enounce = Enounce
    } = Group,
    MsgRecord = #sc_sworn_info{
        group_id = GroupID,
        mem_list = MemList,
        group_name = GroupName,
        quality = Quality,
        sworn_value = SwornValue,
        enounce = Enounce,
        open_ui = OpenUI
    },
    {ok, Bin} = prot_msg:encode_msg(54002, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发结拜成员信息更新
send_member_update_msg(Members, NewMemList) ->
    MsgRecord = #sc_sworn_member_update{
        mem_list = NewMemList
    },
    {ok, Bin} = prot_msg:encode_msg(54007, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发辈分排序界面
send_change_senior_ui(Members, ChangeSeniorData) ->
    #{
        expire_time := CloseTime,
        cur_senior := CurSenior,
        sorted_list := SortedList,
        raw_list := RawList
    } = ChangeSeniorData,
    MsgRecord = #sc_sworn_senior_sort_info{
        cur_senior = CurSenior,
        close_time = CloseTime,
        sorted_list = SortedList,
        raw_list = RawList
    },
    {ok, Bin} = prot_msg:encode_msg(54013, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 弹出名号修改界面
send_change_group_name_ui(RoleID) ->
    {ok, Bin} = prot_msg:encode_msg(54015, #sc_sworn_modify_name_req{}),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc 下发修改江湖名号成功返回
send_group_name_update(Members, GroupName) ->
    MsgRecord = #sc_sworn_modify_name{
        group_name = GroupName
    },
    {ok, Bin} = prot_msg:encode_msg(54017, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发江湖称号品质更新返回
send_group_name_quality_update(Members, NewQuality) ->
    MsgRecord = #sc_sworn_up_quality{
        quality = NewQuality
    },
    {ok, Bin} = prot_msg:encode_msg(54021, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发金兰宣言更新
send_enounce_update(Members, NewEnounce) ->
    MsgRecord = #sc_sworn_modify_enounce{
        enounce = NewEnounce
    },
    {ok, Bin} = prot_msg:encode_msg(54024, MsgRecord),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发登记按钮状态更新
send_register_button_update(Members, Registered) ->
    {ok, Bin} = prot_msg:encode_msg(54029, #sc_sworn_register_update{registered = Registered}),
    lib_role_send:broadcast(Members, Bin).

%% @doc 下发金兰值刷新
send_sworn_value_update(Members, NewValue) ->
    {ok, Bin} = prot_msg:encode_msg(54022, #sc_sworn_value_update{sworn_value = NewValue}),
    lib_role_send:broadcast(Members, Bin).