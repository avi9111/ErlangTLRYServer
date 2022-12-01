%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     意见反馈
%%% @end
%%% Created : 21. 一月 2019 16:44
%%%-------------------------------------------------------------------
-module(lib_questionnaire).
-include("common.hrl").
-include("questionnaire.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("proto/prot_537.hrl").

%% API
-export([
    do/3,
    send_info/1,
    prepare_commit/4
]).

do(53701, PS, _) ->
    send_info(PS);
do(53703, PS, #cs_questionnaire_commit{id = ID, star = Star, context = Context}) ->
    prepare_commit(PS, ID, Star, Context);
do(_, _, _) ->
    skip.

%% 发送信息
send_info(PS) ->
    #role_state{id = RoleId} = PS,
    ID = get_ongoing(),
    LastPutTime = lib_role_kv:get_counter(RoleId, ?KEY_QUESTIONNAIRE),
    Flag = ?iif(time:is_same_week(time:unixtime(), LastPutTime), ?REWARD_STATE_GOT, ?REWARD_STATE_CAN),
    {ok, BinData} = prot_msg:encode_msg(53702, #sc_questionnaire_info{id = ID, flag = Flag}),
    lib_role_send:send_to_sid(PS#role_state.sid, BinData),
    ok.

get_ongoing() ->
    IDs = conf_questionnaire:get_ids(),
    MaxID = ?iif(IDs =/= [], lists:max(IDs), 0),
    Now = time:unixtime(),
    case conf_questionnaire:get(MaxID) of
        #{start_time := ConfSt, end_time := ConfEt} ->
            St = time:unixtime(ConfSt),
            Et = time:unixtime(ConfEt),
            ?iif(time:is_in_time(Now, St, Et), MaxID, 0);
        _ ->
            0
    end.

prepare_commit(PS, Id, Star, Context) ->
    CommitTime = time:unixtime(),
    case catch check_commit(CommitTime, Id, Star, binary_to_list(util:escape_varchar(Context))) of
        {ok, Reward, Id, NewStar, NewContext} ->
            commit(PS, Reward, CommitTime, Id, NewStar, NewContext);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

commit(PS, Reward, CommitTime, Id, Star, Context) ->
    #role_state{
        id = RoleID, name = NickName, level = Lv, sid = RoleSid,
        server_num = SvrNum, combat_power = Power
    } = PS,
    _ = save_one(RoleID, Id, SvrNum, NickName, Lv, Power, CommitTime, Star, Context),
    LastPutTime = lib_role_kv:get_counter(RoleID, ?KEY_QUESTIONNAIRE),
    Now = time:unixtime(),
    (not time:is_same_week(Now, LastPutTime)) andalso begin
        lib_role_kv:set_kv(RoleID, ?KEY_QUESTIONNAIRE, Now),
        lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_QUESTIONNAIRE)
    end,
    {ok, BinData} = prot_msg:encode_msg(53704, #sc_questionnaire_commit{id = Id, flag = ?REWARD_STATE_GOT}),
    lib_role_send:send_to_sid(RoleSid, BinData),
    ok.

check_commit(CommitTime, Id, Star, Context) ->
    util:check_action_limit({?MODULE, questionnaire}, 60),
    Conf = conf_questionnaire:get(Id),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{reward := Reward, start_time := ConfSt, end_time := ConfEt} = Conf,
    time:is_in_time(CommitTime, time:unixtime(ConfSt), time:unixtime(ConfEt)) orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    {ok, Reward, Id,
        ?iif(lists:member(Star, ?stars), Star, lists:last(?stars)), %% 错误的评分，直接给5星
        ?iif(length(Context) =< ?max_context_len, Context, lists:sublist(Context, 1, ?max_context_len))  %% 截取内容长度
    }.

-define(SQL_SAVE_QUESTIONNAIRE, <<"insert into questionnaire_log(role_id, id, server_num, nickname, lv, power, commit_time, star, context) values(~w, ~w, ~w, '~s', ~w, ~w, ~w, ~w, '~s')">>).
save_one(RoleId, Id, SvrNum, NickName, Lv, Power, CommitTime, Star, Context) ->
    SQL = io_lib:format(?SQL_SAVE_QUESTIONNAIRE, [RoleId, Id, SvrNum, NickName, Lv, Power, CommitTime, Star, Context]),
    ?DB:execute(SQL).
