%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     个人说明信息
%%% @end
%%% Created : 06. 十二月 2018 14:33
%%%-------------------------------------------------------------------
-module(lib_role_introduction).
-author("Tom").

-include("role.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_527.hrl").

%% API
-export([
    info/1,
    change_msg/2
]).


%% 获取个人说明
info(PS) ->
    #role_state{id = RoleID} = PS,
    Intro = lib_role_kv:get_kv(RoleID, ?KEY_INTRODUCTION, ""),
    MsgRecord = #sc_personal_info{msg = Intro},
    {ok, MsgRecord}.

%% 改变个人说明
change_msg(PS, Msg) ->
    #role_state{id = RoleID} = PS,
    Str1 = util:escape_varchar(Msg),
    Str2 = binary_to_list(Str1),
    validate_msg(Str2),
    lib_role_kv:set_kv(RoleID, ?KEY_INTRODUCTION, Msg),
    MsgRecord = #sc_personal_info_change{msg = Msg},
    {ok, MsgRecord}.

%%-------------------------Internal-------------------------------------
%% 检查内容合法性
validate_msg(Msg) ->
    validate_msg_sub(len, Msg),
    validate_msg_sub(keyword, Msg).

%% 检测长度
validate_msg_sub(len, Msg) ->
    % 长度为42个汉字
    case util:check_length(Msg, 1, 42) of
        false -> throw({error, ?RC_INTRODUCTION_LIMIT});
        true -> true
    end;
%% 检测关键字
validate_msg_sub(keyword, Msg) ->
    case util:check_filter(Msg) of
        false -> true;
        _ -> throw({error, ?RC_INTRODUCTION_SENSITIVE})
    end.