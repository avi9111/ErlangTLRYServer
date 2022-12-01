%%-------------------------------------------------------
%% @File     : lib_role_name
%% @Brief    : 名字相关
%% @Author   : cablsbs
%% @Date     : 2018-11-9
%%-------------------------------------------------------
-module(lib_role_name).

-include("role.hrl").
-include("ret_code.hrl").

-export([
    validate_name/1,
    check_name_unique/1,
    validate_name_unique/1
]).

%% @doc 角色名合法性检测， 依次检测 长度、关键字、重名
validate_name_unique(Name) ->
    case validate_name(Name) of
        true -> validate_name_sub(unique, Name);
        Ret -> Ret
    end.

%% @doc 角色名合法性检测， 依次检测 长度、关键字
validate_name(Name) ->
    validate_name_sub(len, Name),
    validate_name_sub(keyword, Name).

check_name_unique(Name) ->
    validate_name_sub(unique, Name).

%% Privates ---------------------------------------------------

%% 检测长度
validate_name_sub(len, Name) ->
    case lists:member(32, Name) of
        true ->
            throw({error, ?RC_NAME_ILLEGAL_STRING});
        false ->
            % 角色名称长度为2~6个汉字
            case util:check_length(Name, 2, 6) of
                false -> throw({error, ?RC_NAME_LEN_TOO_LONG});
                true -> true
            end
    end;
%% 检测关键字
validate_name_sub(keyword, Name) ->
    case util:check_filter(Name) of
        false -> true;
        _ -> throw({error, ?RC_NAME_CONTENT_SENSITIVE})
    end;
%% 检测指定名称的角色是否已存在
validate_name_sub(unique, Name) ->
    case lib_role_db:get_role_id_by_name(Name) of
        undefined -> true;
        _ -> throw({error, ?RC_NAME_ALREADY_USED})
    end.
