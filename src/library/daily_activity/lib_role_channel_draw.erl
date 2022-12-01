%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     经脉夺宝
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_channel_draw).
-author("Ryuu").

-include("role.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("proto/prot_421.hrl").

-export([
    do/3,
    init/1,
    cross_day/1,
    send_info/1,
    get_role_data/1
]).

-define(DRAW_TIMES, [1, 10]).

-define(role_channel_draw, #{
    role_id => 0,
    time => 0,
    times => 0,
    week_times => 0,
    accumulate => []
}).

do(42101, PS, #cs_channel_draw_info{}) ->
    send_info(PS);
do(42103, PS, #cs_channel_draw_do{times = Times}) ->
    draw(PS, Times);
do(42105, PS, #cs_channel_draw_fetch{id = ID}) ->
    fetch(PS, ID);
do(_Cmd, _PS, _Req) ->
    ok.

cross_day(PS) ->
    renew_role_data(PS).

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times, week_times := WeekTimes, accumulate := AccRewards} = RoleData,
    Rec = #sc_channel_draw_info{
        times = Times rem 10, week_times = WeekTimes, acc = AccRewards
    },
    {ok, Bin} = prot_msg:encode_msg(42102, Rec),
    lib_role_send:send_to_role(PS, Bin).

draw(PS, Times) ->
    case catch check_draw(PS, Times) of
        {ok, RoleID, RoleData, Costs, Rewards, Values} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_CHANNEL_DRAW),
            lib_drop_api:give_drop_asyn(RoleID, Rewards, ?OPT_CHANNEL_DRAW),
            update_role_data(RoleID, RoleData),
            #{times := TotalTimes, week_times := WeekTimes} = RoleData,
            Rec = #sc_channel_draw_do{
                rewards = Rewards, times = TotalTimes rem 10, week_times = WeekTimes
            },
            {ok, Bin} = prot_msg:encode_msg(42104, Rec),
            lib_role_send:send_to_role(PS, Bin),
            publish_value_rumor(PS#role_state.name, Values),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_draw(PS, Times) ->
    lists:member(Times, ?DRAW_TIMES) orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    ItemID = config:get_sys_config(channel_draw_item),
    Costs = [{?AST_ITEM, [{ItemID, Times}]}],
    lib_role_assets:check_items_enough(PS, Costs),
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{times := TotalTimes, week_times := WeekTimes} = RoleData,
    {NTotalTimes, NWeekTimes, Rewards, Values} = collect_draw(Times, TotalTimes, WeekTimes, [], []),
    NewData = RoleData#{times => NTotalTimes, week_times => NWeekTimes},
    {ok, RoleID, NewData, Costs, Rewards, Values}.

collect_draw(0, TAcc, WAcc, RAcc, VAcc) ->
    {TAcc, WAcc, lists:reverse(RAcc), VAcc};
collect_draw(N, TAcc, WAcc, RAcc, VAcc) ->
    NTAcc = TAcc + 1,
    NWAcc = WAcc + 1,
    Weight = conf_channel_draw:get_weight(NTAcc),
    {ID, _} = util:rand_by_weight(Weight, 2),
    Conf = conf_channel_draw:get(ID),
    #{drop := DropID, rumor := Rumor} = Conf,
    NRAcc = [DropID | RAcc],
    NVAcc = ?iif(Rumor > 0, [DropID | VAcc], VAcc),
    collect_draw(N - 1, NTAcc, NWAcc, NRAcc, NVAcc).

fetch(PS, ID) ->
    case catch check_fetch(PS, ID) of
        {ok, RoleID, RoleData, Rewards} ->
            lib_drop_api:give_drop_asyn(RoleID, Rewards, ?OPT_CHANNEL_DRAW),
            update_role_data(RoleID, RoleData),
            Rec = #sc_channel_draw_fetch{id = ID},
            {ok, Bin} = prot_msg:encode_msg(42106, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_fetch(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{accumulate := AccRewards, week_times := WeekTimes} = RoleData,
    Conf = conf_channel_draw_acc:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_CHANNEL_DRAW_NO_ACC_CONF}),
    #{times := NeedTimes, drop := DropID} = Conf,
    WeekTimes >= NeedTimes orelse erlang:throw({error, ?RC_CHANNEL_DRAW_WEEK_TIMES_LIMIT}),
    lists:member(ID, AccRewards) andalso erlang:throw({error, ?RC_CHANNEL_DRAW_ALREADY_GOT}),
    NAccRewards = [ID | AccRewards],
    NewData = RoleData#{accumulate => NAccRewards},
    {ok, RoleID, NewData, DropID}.

publish_value_rumor(_PS, []) ->
    ok;
publish_value_rumor(Name, Values) ->
    Fmt = lib_drop_base:format_drop(Values),
    Rumor = config:get_sys_config(channel_draw_rumor),
    svr_rumor:publish(world, Rumor, [Name, Fmt]).

%% -----------------------------------------------------------------------------

init(PS) ->
    renew_role_data(PS).

renew_role_data(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{time := Time} = RoleData,
    Now = time:unixtime(),
    SameWeek = time:is_same_week(Time, Now),
    if
        not SameWeek ->
            NewData = RoleData#{week_times => 0, accumulate => [], time => Now};
        true ->
            NewData = RoleData
    end,
    RoleData =/= NewData andalso update_role_data(RoleID, NewData).

get_role_data(RoleID) ->
    case lib_role_data:get_value(RoleID, ?KEY_CHANNEL_DRAW) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_channel_draw#{
                role_id => RoleID, time => time:unixtime()
            }
    end.

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData).

set_role_data(RoleID, RoleData) ->
    lib_role_data:put_value(RoleID, ?KEY_CHANNEL_DRAW, RoleData),
    RoleData.
