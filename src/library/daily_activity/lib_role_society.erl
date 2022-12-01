%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     江湖之路
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_society).
-author("Ryuu").

-include("func.hrl").
-include("role.hrl").
-include("task.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_312.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    action/2,
    cross_day/1,
    send_info/1,
    role_login/1,
    handle_info/2,
    get_role_data/1
]).

-define(OPEN_DAY, 7).

-define(SQL_GET_ROLE_SOCIETY, <<"select `star`, `tasks`, `status`, `mails`, `open_time` from `role_society` where `role_id` = ~w">>).
-define(SQL_SET_ROLE_SOCIETY, <<"replace into `role_society`(`role_id`, `star`, `tasks`, `status`, `mails`, `open_time`) values(~w, ~w, '~s', '~s', '~s', ~w)">>).

-define(role_society, #{
    role_id => 0,
    star => 0,
    mails => [],
    tasks => [],
    status => [],
    open_time => 0,
    updated => false
}).

do(31201, PS, _) ->
    send_info(PS);
do(31203, PS, #cs_society_get_reward{id = ID}) ->
    get_reward(PS, ID);
do(31205, PS, #cs_society_star_reward{star = Star}) ->
    get_star_reward(PS, Star);
do(_Cmd, _PS, _Req) ->
    ok.

event(PS, {func_open, ?FUNC_SOCIETY}) ->
    func_open(PS);
event(PS, {timer, ?TIMER_DEFAULT}) ->
    save(PS);
event(_PS, _Event) ->
    ignore.

handle_info(_Info, _PS) ->
    ignore.

role_login(PS) ->
    refresh_task(PS, false),
    send_mails(PS#role_state.id).

cross_day(PS) ->
    refresh_task(PS, true),
    send_mails(PS#role_state.id).

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, star := TStar, status := Status, open_time := OpenTime} = RoleData,
    Rec = #sc_society_info{
        tasks = convert_tasks(Tasks, []), star = TStar, status = Status,
        open_time = OpenTime
    },
    {ok, Bin} = prot_msg:encode_msg(31202, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_tasks([], Acc) ->
    Acc;
convert_tasks([Task | T], Acc) ->
    #{id := ID, masks := Masks, stat := State} = Task,
    [#{current := Current} | _] = Masks,
    convert_tasks(T, [{ID, Current, State} | Acc]).

get_reward(PS, ID) ->
    case catch check_get_reward(PS, ID) of
        {ok, RoleID, RoleData, DropID, Star, Task} ->
            lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_SCOETY_REWARD),
            update_role_data(RoleID, RoleData),
            Rec = #sc_society_get_reward{id = ID, star = Star},
            {ok, Bin} = prot_msg:encode_msg(31204, Rec),
            lib_role_send:send_to_role(PS, Bin),
            notify_tasks(PS, [Task]);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{tasks := Tasks, star := TStar} = RoleData,
    ongoing(RoleData) orelse erlang:throw({error, ?RC_SOCIETY_NOT_ONGOING}),
    Task = map:keyfind(ID, id, Tasks),
    Task =/= false orelse erlang:throw({error, ?RC_SOCIETY_TASK_NOT_ACCEPT}),
    #{stat := Stat} = Task,
    Stat =:= ?TASK_STAT_DONE andalso erlang:throw({error, ?RC_SOCIETY_REWARD_GOT}),
    Stat =:= ?TASK_STAT_FINISHED orelse erlang:throw({error, ?RC_SOCIETY_NOT_FINISH}),
    Conf = conf_society_task:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_SOCIETY_TASK_NOT_FOUND}),
    #{reward := Reward, star := Star} = Conf,
    NewStar = TStar + Star,
    NewTask = Task#{stat => ?TASK_STAT_DONE},
    NewTasks = map:keystore(ID, id, Tasks, NewTask),
    NewData = RoleData#{tasks => NewTasks, star => NewStar},
    {ok, RoleID, NewData, Reward, NewStar, NewTask}.

get_star_reward(PS, Star) ->
    case catch check_get_star_reward(PS, Star) of
        {ok, RoleID, RoleData, DropID, Status} ->
            lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_SOCIETY_STAR_REWARD),
            update_role_data(RoleID, RoleData),
            Rec = #sc_society_star_reward{star = Star, status = Status},
            {ok, Bin} = prot_msg:encode_msg(31206, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_star_reward(PS, Star) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{star := TStar, status := Status} = RoleData,
    ongoing(RoleData) orelse erlang:throw({error, ?RC_SOCIETY_NOT_ONGOING}),
    TStar >= Star orelse erlang:throw({error, ?RC_SOCIETY_STAR_LIMIT}),
    Conf = conf_society_star:get(Star),
    Conf =/= undefined orelse erlang:throw({error, ?RC_SOCIETY_NO_STAR_CONF}),
    #{reward := DropID} = Conf,
    lists:member(Star, Status) andalso erlang:throw({error, ?RC_SOCIETY_STAR_REWARD_GOT}),
    NewStatus = [Star | Status],
    NewData = RoleData#{status => NewStatus},
    {ok, RoleID, NewData, DropID, NewStatus}.

notify_tasks(_PS, []) ->
    ignore;
notify_tasks(PS, Changes) ->
    Rec = #sc_society_notify_task{
        tasks = convert_tasks(Changes, [])
    },
    {ok, Bin} = prot_msg:encode_msg(31207, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% -----------------------------------------------------------------------------

action(PS, Action) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    case ongoing(RoleData) of
        true ->
            #{tasks := Tasks} = RoleData,
            {NewTasks, Changes} = lib_task_util:task_actions(Tasks, PS, Action),
            NewData = RoleData#{tasks => NewTasks},
            update_role_data(RoleID, NewData),
            notify_tasks(PS, Changes);
        _ ->
            ignore
    end.

func_open(PS) ->
    refresh_task(PS, true, false),
    send_info(PS).

refresh_task(PS, Notify) ->
    FuncOpen = lib_role_func:is_active(PS#role_state.id, ?FUNC_SOCIETY),
    refresh_task(PS, FuncOpen, Notify).

refresh_task(PS, FuncOpen, Notify) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{open_time := OpenTime} = RoleData,
    Ongoing = ongoing(RoleData),
    if
        OpenTime =:= 0 andalso FuncOpen ->
            NewData = RoleData#{open_time => time:unixtime()},
            update_role_data(RoleID, NewData),
            refresh_task2(PS, NewData, Notify);
        Ongoing ->
            refresh_task2(PS, RoleData, Notify);
        true ->
            ignore
    end.

refresh_task2(PS, RoleData, Notify) ->
    #role_state{id = RoleID} = PS,
    #{tasks := Tasks, open_time := OpenTime} = RoleData,
    OpenDay = time:get_diff_days(OpenTime, time:unixtime()) + 1,
    Days = [Day || Day <- conf_society_tag:get_days(), Day =< OpenDay],
    Accepted = sets:from_list([ID || #{id := ID} <- Tasks]),
    List = refresh_tasks1(Days, PS, Accepted, []),
    NewData = RoleData#{tasks => List ++ Tasks},
    update_role_data(RoleID, NewData),
    Notify andalso notify_tasks(PS, List).

refresh_tasks1([], _PS, _Accepted, Acc) ->
    Acc;
refresh_tasks1([Day | T], PS, Accepted, Acc) ->
    IDList = conf_society_task:get_by_day(Day),
    {NewAccepted, NewAcc} = refresh_task2(IDList, PS, Accepted, Acc),
    refresh_tasks1(T, PS, NewAccepted, NewAcc).

refresh_task2([], _PS, Accepted, Acc) ->
    {Accepted, Acc};
refresh_task2([ID | T], PS, Accepted, Acc) ->
    case sets:is_element(ID, Accepted) of
        false ->
            Conf = conf_society_task:get(ID),
            Task = lib_task_util:init_task(PS, Conf),
            refresh_task2(T, PS, sets:add_element(ID, Accepted), [Task | Acc]);
        _ ->
            refresh_task2(T, PS, Accepted, Acc)
    end.

ongoing(#{open_time := OpenTime}) ->
    time:get_diff_days(OpenTime, time:unixtime()) < ?OPEN_DAY.

%% -----------------------------------------------------------------------------

send_mails(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{open_time := OpenTime, mails := Mails} = RoleData,
    OpenDays = ?iif(OpenTime > 0, time:get_diff_days(OpenTime) + 1, 0),
    IDList = conf_society_tag:get_ids(),
    NewMails = send_mails(IDList, RoleID, OpenDays, Mails),
    NewMails =/= Mails andalso begin
        NewData = RoleData#{mails => NewMails},
        update_role_data(RoleID, NewData)
    end.

send_mails([], _RoleID, _OpenDays, Mails) ->
    Mails;
send_mails([ID | T], RoleID, OpenDays, Mails) ->
    Conf = conf_society_tag:get(ID),
    #{day := Day, mail := MailID, reward := Reward} = Conf,
    case Day =< OpenDays andalso MailID > 0 andalso
        not lists:member(ID, Mails) of
        true ->
            svr_mail:sys2p(RoleID, MailID, Reward, ?OPT_SOCIETY_MAIL_REWARD),
            send_mails(T, RoleID, OpenDays, [ID | Mails]);
        _ ->
            send_mails(T, RoleID, OpenDays, Mails)
    end.

%% -----------------------------------------------------------------------------
%% data
%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID} = PS,
    case db:get_row(io_lib:format(?SQL_GET_ROLE_SOCIETY, [RoleID])) of
        [Star, DbTasks, DbStatus, DbMails, OpenTime] ->
            Tasks = type:convert_db_field(list, DbTasks, []),
            Status = type:convert_db_field(list, DbStatus, []),
            Mails = type:convert_db_field(list, DbMails, []),
            RoleData = ?role_society#{
                role_id => RoleID, star => Star, tasks => Tasks, status => Status,
                open_time => OpenTime, mails => Mails
            };
        _ ->
            RoleData = ?role_society#{role_id => RoleID}
    end,
    set_role_data(RoleID, RoleData),
    lib_role:mod_after(0, ?MODULE, init_refresh).

save(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            save_role_data(RoleID, RoleData);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleData) ->
    #{star := Star, tasks := Tasks, status := Status, mails := Mails,
        open_time := OpenTime} = RoleData,
    DbTasks = type:term_to_bitstring(Tasks),
    DbStatus = type:term_to_bitstring(Status),
    DbMails = type:term_to_bitstring(Mails),
    db:execute(io_lib:format(?SQL_SET_ROLE_SOCIETY, [
        RoleID, Star, DbTasks, DbStatus, DbMails, OpenTime
    ])),
    set_role_data(RoleID, RoleData#{updated => false}).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        #{} = RoleData ->
            RoleData;
        _ ->
            ?role_society#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData#{updated => true}).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
