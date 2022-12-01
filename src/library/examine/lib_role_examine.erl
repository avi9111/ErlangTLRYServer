%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     科举考试
%%% @end
%%% Created : 12. 十一月 2018 19:51
%%%-------------------------------------------------------------------
-module(lib_role_examine).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_515.hrl").

-record(examine, {
    id = 0,
    help_times = 0,     %% 求助次数
    answer_num = 0,
    right_num = 0,
    acc_get = [],
    is_get = 0,
    begin_time = 0,
    end_time = 0,
    help_reward = 0,    %% 帮助次数
    last_check = 0,
    updated = false
}).

%% API
-export([
    do/3,
    init/1,
    info/1,
    begin_answer/1,
    answer/2,
    help/1,
    reward/1,
    cross_day/1,
    save/1,
    get_answer_num/1,
    check_help_other_helper/2
]).

do(51501, PS, _Req) ->
    info(PS);
do(51503, PS, _Req) ->
    begin_answer(PS);
do(51505, PS, _Req) ->
    svr_examine:get_rank(PS#role_state.sid);
do(51507, PS, #cs_examine_answer{index = Index}) ->
    answer(PS, Index);
do(51509, PS, _Req) ->
    help(PS);
do(51511, PS, _Req) ->
    reward(PS);
do(51513, PS, #cs_examine_help_reward{target_id = TargetID, id = ID}) ->
    help_reward(PS, TargetID, ID);
do(51515, PS, _Req) ->
    examine_guide(PS);
do(_, _, _) ->
    skip.

%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_db_data(RoleID),
    NewRoleData = ?iif(time:is_today(RoleData#examine.last_check), RoleData, #examine{last_check = time:unixtime(), updated = true}),
    set_role_data(RoleID, NewRoleData),
    ok.

%% @doc 红点信息
info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    MsgRecord = #sc_examine_info{
        answer_num = RoleData#examine.answer_num,
        is_get = RoleData#examine.is_get,
        right_num = RoleData#examine.right_num,
        acc_get = RoleData#examine.acc_get
    },
    {ok, Bin} = prot_msg:encode_msg(51502, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% @doc 开始答题
begin_answer(PS) ->
    case catch check_begin_answer(PS) of
        {ok, RoleData} ->
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_examine_begin{
                help_times = RoleData#examine.help_times,
                right_num = RoleData#examine.right_num,
                id = RoleData#examine.id,
                acc_get = RoleData#examine.acc_get
            },
            {ok, Bin} = prot_msg:encode_msg(51504, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_begin_answer(PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    is_func_open(Lv),
    RoleData = get_role_data(RoleID),
    #examine{id = ID, begin_time = BeginTime, answer_num = AnswerNum} = RoleData,
    #{question_num := MaxNum} = conf_examine_info:get(),
    AnswerNum < MaxNum orelse erlang:throw({error, ?RC_EXAMINE_ANSWER_ALL_QUESTION}),
    IDs = conf_examine_bank:get_ids(),
    NewID = ?iif(ID =:= 0, util:list_rand(IDs), ID),
    NewBeginTime = ?iif(BeginTime =:= 0, time:unixtime(), BeginTime),
    NewRoleData = RoleData#examine{id = NewID, begin_time = NewBeginTime},
    {ok, NewRoleData}.

%% @doc 答题
answer(PS, Answer) ->
    case catch check_answer(PS, Answer) of
        {ok, RoleData, Reward, IsRight, AllRight} ->
            NewPS = lib_role_assets:add_items_notify(PS, Reward, ?OPT_EXAMINE),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_examine_answer{
                answer_num = RoleData#examine.answer_num,
                right_num = RoleData#examine.right_num,
                id = RoleData#examine.id,
                acc_get = RoleData#examine.acc_get
            },
            {ok, Bin} = prot_msg:encode_msg(51508, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            lib_role_daily_lively:trigger_event(PS#role_state.id, 1006, 1),
            ?TASK_EVENT(PS#role_state.id, {'part_examine', IsRight}),
            AllRight andalso ?TASK_EVENT(PS#role_state.id, 'exam_all_right'),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_answer(PS, Answer) ->
    #role_state{id = RoleID, level = Lv} = PS,
    is_func_open(Lv),
    RoleData = get_role_data(RoleID),
    #examine{id = ID, answer_num = AnswerNum, right_num = RightNum, acc_get = AccGet, end_time = EndTime, begin_time = BeginTime} = RoleData,
    #{question_num := MaxNum} = conf_examine_info:get(),
    AnswerNum < MaxNum orelse erlang:throw({error, ?RC_EXAMINE_ANSWER_ALL_QUESTION}),
    ID > 0 orelse erlang:throw({error, ?RC_EXAMINE_NOT_QUESTION_ANSWER}),
    Conf = conf_examine_bank:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{answer := RightAnswer} = Conf,
    ConfR = conf_examine_reward:get(Lv),
    ConfR =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{right_answer := RightReward, wrong_answer := WrongReward} = ConfR,
    IsRight = Answer =:= RightAnswer,
    {NewRightNum, Reward} = ?iif(IsRight, {RightNum + 1, RightReward}, {RightNum, WrongReward}),
    NewAccGet = lib_role_assets:merge_add_items(AccGet ++ Reward),
    NewAnswerNum = AnswerNum + 1,
    %% 判断是否答完题 是否选出下一题
    IsAnsAll = NewAnswerNum >= MaxNum,
    IDs = conf_examine_bank:get_ids(),
    AnswerIds = get_answer_ids(),
    NewAnswerIds = [ID | AnswerIds],
    set_answer_ids(NewAnswerIds),
    {NewID, NewEndTime} = ?iif(IsAnsAll, {0, EndTime}, {util:list_rand(IDs -- NewAnswerIds), time:unixtime()}),
    IsAnsAll andalso svr_examine:answer_all(RoleID, NewRightNum, NewEndTime - BeginTime),
    AllRight = IsAnsAll andalso (NewRightNum =:= MaxNum),
    NewRoleData = RoleData#examine{
        id = NewID,
        answer_num = NewAnswerNum,
        right_num = NewRightNum,
        acc_get = NewAccGet,
        end_time = NewEndTime
    },
    {ok, NewRoleData, Reward, IsRight, AllRight}.

%% @doc 求助
help(PS) ->
    case catch check_help(PS) of
        {ok, RoleData, HelpTimes} ->
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_examine_help{help_times = HelpTimes},
            {ok, Bin} = prot_msg:encode_msg(51510, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_help(PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    is_func_open(Lv),
    RoleData = get_role_data(RoleID),
    #examine{help_times = HelpTimes} = RoleData,
    #{help_times := MaxHelpTimes} = conf_examine_info:get(),
    HelpTimes < MaxHelpTimes orelse erlang:throw({error, ?RC_EXAMINE_USE_ALL_HELP_TIMES}),
    NewHelpTimes = HelpTimes + 1,
    NewRoleData = RoleData#examine{help_times = NewHelpTimes},
    {ok, NewRoleData, NewHelpTimes}.

%% @doc 领取奖励
reward(PS) ->
    case catch check_reward(PS) of
        {ok, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_EXAMINE),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_examine_reward{is_get = 1},
            {ok, Bin} = prot_msg:encode_msg(51512, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_reward(PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    is_func_open(Lv),
    RoleData = get_role_data(RoleID),
    #examine{answer_num = AnswerNum, is_get = IsGet} = RoleData,
    #{question_num := MaxNum} = conf_examine_info:get(),
    AnswerNum >= MaxNum orelse erlang:throw({error, ?RC_EXAMINE_CAN_NOT_GET}),
    IsGet =:= 0 orelse erlang:throw({error, ?RC_EXAMINE_ALREADY_GET}),
    Conf = conf_examine_reward:get(Lv),
    Conf =/= undefiend orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{daily_reward := DailyReward} = Conf,
    NewRoleData = RoleData#examine{is_get = 1},
    {ok, NewRoleData, DailyReward}.

%% 帮助答题奖励
help_reward(PS, TargetID, ID) ->
    case catch check_help_reward(PS, TargetID, ID) of
        {ok, RoleData, Reward} ->
            update_role_data(PS#role_state.id, RoleData),
            NewPS = lib_role_assets:add_items_notify(PS, Reward, ?OPT_EXAMINE),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_help_reward(PS, TargetID, ID) ->
    check_help_other(TargetID, ID),
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #examine{help_reward = HelpReward} = RoleData,
    #{help_reward_times := MaxTimes} = conf_examine_info:get(),
    HelpReward < MaxTimes orelse erlang:throw({error, ?RC_EXAMINE_HELP_MAX_TIMES}),
    #{right_answer := Reward} = conf_examine_reward:get(Lv),
    NewRoleData = RoleData#examine{help_reward = HelpReward + 1},
    {ok, NewRoleData, Reward}.


check_help_other(RoleID, ID) ->
    case catch lib_role:apply_call3(RoleID, {?MODULE, check_help_other_helper, [ID]}) of
        ok -> ok;
        {error, Code} ->
            erlang:throw({error, Code});
        _ ->
            erlang:throw({error, ?RC_TASK_TARGET_OFFLINE})
    end.

check_help_other_helper(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #examine{id = NowID} = RoleData,
    case NowID =:= ID of
        true ->
            ok;
        _ ->
            {error, ?RC_EXAMINE_ALREADY_ANSWER}
    end.

%% @doc 跨天处理
cross_day(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = #examine{last_check = time:unixtime()},
    MsgRecord = #sc_examine_info{
        answer_num = 0,
        is_get = 0
    },
    {ok, Bin} = prot_msg:encode_msg(51502, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    update_role_data(RoleID, RoleData),
    ok.

%% @doc 新手指引
examine_guide(PS) ->
    case catch check_examine_guide(PS) of
        {ok, Reward, Times} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_EXAMINE),
            MsgRecord = #sc_examine_guide{num = Times},
            {ok, Bin} = prot_msg:encode_msg(51516, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_examine_guide(PS) ->
    #role_state{id = RoleID} = PS,
    Times = lib_role_kv:get_counter(RoleID, ?KEY_EXAMINE_GUIDE),
    Times < 5 orelse erlang:throw({error, ?RC_TASK_ALREADY_FINISHED}),
    Reward = config:get_sys_config(examine_guide_reward),
    NewTimes = Times + 1,
    lib_role_kv:set_kv(RoleID, ?KEY_EXAMINE_GUIDE, NewTimes),
    {ok, Reward, NewTimes}.

is_func_open(Lv) ->
    #{open_lv := OpenLv} = conf_examine_info:get(),
    Lv >= OpenLv orelse erlang:throw({error, ?RC_PET_ROLE_LEVEL_LMT}).

get_answer_num(RoleID) ->
    RoleData = get_role_data(RoleID),
    #examine{answer_num = AnswerNum} = RoleData,
    AnswerNum.

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#examine{updated = true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

get_answer_ids() ->
    case erlang:get({?MODULE, answer_ids}) of
        List when is_list(List) -> List;
        _ -> []
    end.

set_answer_ids(IDs) ->
    erlang:put({?MODULE, answer_ids}, IDs).

%% 下线保存
save(PS) ->
    RoleData = get_role_data(PS#role_state.id),
    ?iif(RoleData#examine.updated, save_data(PS#role_state.id, RoleData), skip).

save_data(RoleID, RoleData) ->
    #examine{
        id = ID,
        help_times = HelpTimes,
        answer_num = AnswerNum,
        right_num = RightNum,
        acc_get = AccGet,
        is_get = IsGet,
        begin_time = BeginTime,
        end_time = EndTime,
        help_reward = HelpReward,
        last_check = LastCheck
    } = RoleData,
    save_role_data(RoleID, ID, HelpTimes, AnswerNum, RightNum, IsGet, BeginTime, EndTime, AccGet, HelpReward, LastCheck).

-define(SQL_GET_ROLE_DATA, <<"select id, help_times, answer_num, right_num, is_get, begin_time, end_time, acc_get, help_reward, last_check from role_examine where role_id = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [ID, HelpTimes, AnswerNum, RightNum, IsGet, BeginTime, EndTime, DbAccGet, HelpReward, LastCheck] ->
            AccGet = type:convert_db_field(list, DbAccGet, []),
            #examine{
                id = ID,
                help_times = HelpTimes,
                answer_num = AnswerNum,
                right_num = RightNum,
                acc_get = AccGet,
                is_get = IsGet,
                begin_time = BeginTime,
                end_time = EndTime,
                help_reward = HelpReward,
                last_check = LastCheck
            };
        [] ->
            #examine{last_check = time:unixtime()}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_examine(role_id, id, help_times, answer_num, right_num, is_get, begin_time, end_time, acc_get, help_reward, last_check) values(~w, ~w, ~w, ~w, ~w, ~w, ~w, ~w, '~s', ~w, ~w)">>).
save_role_data(RoleID, ID, HelpTimes, AnswerNum, RightNum, IsGet, BeginTime, EndTime, AccGet, HelpReward, LastCheck) ->
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, ID, HelpTimes, AnswerNum, RightNum, IsGet, BeginTime, EndTime, type:term_to_bitstring(AccGet), HelpReward, LastCheck]),
    ?DB:execute(SQL).
