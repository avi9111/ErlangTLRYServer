%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     帮派
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_guild).
-author("Ryuu").

-include("guild.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/1,
    p/1,
    mfa/3,
    mfa/4,
    stop/1,
    cast/2,
    call/2,
    bless/3,
    leave/2,
    start/1,
    online/2,
    rename/2,
    rename/3,
    invite/3,
    upgrade/2,
    offline/2,
    gm_kick/2,
    recruit/2,
    add_cont/3,
    kick_out/3,
    study_up/3,
    build_up/3,
    get_bless/2,
    add_funds/4,
    apply_for/2,
    broadcast/2,
    start_link/1,
    enter_seat/2,
    guild_task/1,
    add_exploit/2,
    guild_bonus/1,
    set_hostile/3,
    lucky_money/6,
    auto_inc_exp/1,
    cancel_apply/2,
    handle_apply/4,
    add_live_exp/3,
    get_seat_num/1,
    inc_seat_num/2,
    dec_seat_num/2,
    add_rob_times/2,
    sort_dice_num/1,
    guild_declare/3,
    sh_dung_reset/1,
    finish_sh_dung/3,
    update_subject/4,
    get_apply_list/2,
    get_guild_logs/2,
    gm_appoint_pos/3,
    cancel_hostile/3,
    get_lucky_money/3,
    cost_denf_funds/1,
    cross_day_reset/1,
    change_announce/3,
    get_member_list/2,
    rob_times_reset/1,
    get_declare_list/2,
    get_hostile_list/2,
    broadcast_except/3,
    desolation_check/1,
    finish_bonus_task/3,
    finish_guild_task/3,
    appoint_member_pos/4,
    change_accept_type/4,
    role_delete/2,
    update_comment_info/2
]).

%% 帮派烹饪
-export([
    cook/5
]).

-export([
    gm_reduce_funds/4
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    code_change/3,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SCOPE, local).
-define(SERVER, ?MODULE).

-record(state, {
    guild_id = 0,
    enter_seat_list = []              %% 当前进入了帮会领地的玩家id列表
}).

%% =============================================================================
%% API
%% =============================================================================

%% @doc 启动帮派进程
start(GuildID) ->
    sup_guild_svr:start_child(GuildID).

start_link(GuildID) ->
    RegName = get_reg_name(GuildID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [GuildID], []).

%% @doc 帮派进程数据
i(GuildID) ->
    call(GuildID, {info, GuildID}).

%% @doc 帮派进程Pid
p(GuildID) ->
    RegName = get_reg_name(GuildID),
    dist:whereis_name(?SCOPE, RegName).

%% @doc MFA
mfa(GuildID, M, F) ->
    mfa(GuildID, M, F, []).

mfa(GuildID, M, F, A) ->
    call(GuildID, {mfa, M, F, A}).

%% @doc 停止帮派进程
stop(GuildID) ->
    cast(GuildID, stop).

%% @doc 获取成员列表
get_member_list(GuildID, RoleID) ->
    cast(GuildID, {get_member_list, GuildID, RoleID}).

%% @doc 离开帮派
leave(GuildID, RoleID) ->
    cast(GuildID, {leave, GuildID, RoleID}).

%% @doc 更改公告
change_announce(GuildID, RoleID, Announce) ->
    cast(GuildID, {change_announce, GuildID, RoleID, Announce}).

%% @doc 设置招人条件
change_accept_type(GuildID, RoleID, Type, Auto) ->
    cast(GuildID, {change_accept_type, GuildID, RoleID, Type, Auto}).

%% @doc 喊话招募
recruit(GuildID, RoleID) ->
    cast(GuildID, {recruit, GuildID, RoleID}).

%% @doc 获取帮派记录
get_guild_logs(GuildID, RoleID) ->
    cast(GuildID, {get_guild_logs, GuildID, RoleID}).

%% @doc 获取申请列表
get_apply_list(GuildID, RoleID) ->
    cast(GuildID, {get_apply_list, GuildID, RoleID}).

%% @doc 申请
apply_for(GuildID, Apply) ->
    call(GuildID, {apply_for, GuildID, Apply}).

%% @doc 取消申请
cancel_apply(GuildID, RoleID) ->
    cast(GuildID, {cancel_apply, GuildID, RoleID}).

%% @doc 申请处理
handle_apply(GuildID, RoleID, Approve, TargetID) ->
    cast(GuildID, {handle_apply, GuildID, RoleID, Approve, TargetID}).

%% @doc 任命职位 [gm]
gm_appoint_pos(GuildID, TargetID, Pos) ->
    appoint_member_pos(GuildID, -1, TargetID, Pos).

%% @doc 任命成员职位
appoint_member_pos(GuildID, RoleID, TargetID, Pos) ->
    cast(GuildID, {appoint_member_pos, GuildID, RoleID, TargetID, Pos}).

%% @doc 踢玩家 [gm]
gm_kick(GuildID, RoleID) ->
    kick_out(GuildID, -1, RoleID).

%% @doc 踢人
kick_out(GuildID, RoleID, TargetID) ->
    cast(GuildID, {kick_out, GuildID, RoleID, TargetID}).

%% @doc 玩家上线
online(GuildID, RoleID) ->
    cast(GuildID, {online, GuildID, RoleID}).

%% @doc 玩家下线
offline(GuildID, RoleID) ->
    cast(GuildID, {offline, GuildID, RoleID}).

%% @doc 邀请加入帮派
invite(GuildID, RoleID, TargetID) ->
    cast(GuildID, {invite, GuildID, RoleID, TargetID}).

%% @doc 跨天重置
cross_day_reset(GuildID) ->
    cast(GuildID, {cross_day_reset, GuildID}).

%% @doc 帮派改名(GM)
rename(GuildID, Name) ->
    rename(GuildID, -1, Name).

%% @doc 帮派改名
rename(GuildID, RoleID, Name) ->
    call(GuildID, {rename, GuildID, RoleID, Name}).

%% @doc 增加帮派资金
add_funds(GuildID, RoleID, Funds, OpType) ->
    cast(GuildID, {add_funds, GuildID, RoleID, Funds, OpType}).

%% @doc 增加历史贡献
add_cont(GuildID, RoleID, Cont) ->
    cast(GuildID, {add_cont, GuildID, RoleID, Cont}).

%% @doc 帮派烹饪
cook(GuildID, RoleID, Name, Type, AddVal) ->
    call(GuildID, {cook, GuildID, RoleID, Name, Type, AddVal}).

%% @doc 进入领地
enter_seat(GuildID, RoleID) ->
    call(GuildID, {enter_seat, GuildID, RoleID}).

%% @doc 延迟检查
desolation_check(GuildID) ->
    cast(GuildID, {desolation_check, GuildID}).

%% @doc 帮派升级
upgrade(GuildID, RoleID) ->
    cast(GuildID, {upgrade, GuildID, RoleID}).

%% @doc 扣除维护资金
cost_denf_funds(GuildID) ->
    cast(GuildID, {cost_denf_funds, GuildID}).

%% @doc 增加活跃值
add_live_exp(GuildID, RoleID, AddExp) ->
    cast(GuildID, {add_live_exp, GuildID, RoleID, AddExp}).

%% @doc 完成分红任务
finish_bonus_task(GuildID, Type, Times) ->
    cast(GuildID, {finish_bonus_task, GuildID, Type, Times}).

%% @doc 帮派分红
guild_bonus(GuildID) ->
    cast(GuildID, {guild_bonus, GuildID}).

%% @doc 完成帮派任务
finish_guild_task(GuildID, Type, Times) ->
    cast(GuildID, {finish_guild_task, GuildID, Type, Times}).

%% @doc 帮派任务重置
guild_task(GuildID) ->
    cast(GuildID, {guild_task, GuildID}).

%% @doc 少室山副本重置
sh_dung_reset(GuildID) ->
    cast(GuildID, {sh_dung_reset, GuildID}).

%% @doc 劫镖次数充值
rob_times_reset(GuildID) ->
    cast(GuildID, {rob_times_reset, GuildID}).

%% @doc
finish_sh_dung(GuildID, ID, Times) ->
    cast(GuildID, {finish_sh_dung, GuildID, ID, Times}).

%% @doc 广播
broadcast(GuildID, Bin) ->
    cast(GuildID, {broadcast, GuildID, Bin}).

%% @doc 广播
broadcast_except(GuildID, Bin, RoleID) when is_integer(RoleID) ->
    broadcast_except(GuildID, Bin, [RoleID]);
broadcast_except(GuildID, Bin, RoleList) ->
    cast(GuildID, {broadcast_except, GuildID, Bin, RoleList}).

gm_reduce_funds(GuildID, RoleID, Funds, OpType) ->
    cast(GuildID, {gm_reduce_funds, GuildID, RoleID, Funds, OpType}).

%% @doc 获取当前帮会领地的人数
get_seat_num(GuildID) ->
    call(GuildID, get_seat_num).

%% @doc 增加领地人数统计
inc_seat_num(GuildID, RoleID) ->
    cast(GuildID, {inc_seat_num, RoleID}).

%% @doc 减少领地人数统计
dec_seat_num(GuildID, RoleID) ->
    cast(GuildID, {dec_seat_num, RoleID}).

%% @doc 帮派领地内的玩家自动累积经验
auto_inc_exp(GuildID) ->
    cast(GuildID, auto_inc_exp).

%% @doc 广播行酒令状态更新
update_subject(GuildID, CurSubject, NextSubject, NextTime) ->
    cast(GuildID, {update_subject, CurSubject, NextSubject, NextTime}).

%% @doc 对抛骰子的总点数排序获得最大最小值
sort_dice_num(GuildID) ->
    call(GuildID, sort_dice_num).

%% @doc 广播点评界面信息更新
update_comment_info(GuildID, MsgRecord) ->
    cast(GuildID, {update_comment_info, MsgRecord}).

%% @doc 删号
role_delete(GuildID, RoleIDs) ->
    cast(GuildID, {role_delete, GuildID, RoleIDs}).

%% @doc 帮派建筑升级
build_up(GuildID, RoleID, ID) ->
    cast(GuildID, {build_up, GuildID, RoleID, ID}).

%% @doc 帮派研究升级
study_up(GuildID, RoleID, ID) ->
    cast(GuildID, {study_up, GuildID, RoleID, ID}).

%% @doc 帮派宣战
guild_declare(GuildID, RoleID, DGuildID) ->
    cast(GuildID, {guild_declare, GuildID, RoleID, DGuildID}).

%% @doc 设置敌对
set_hostile(GuildID, RoleID, DGuildID) ->
    cast(GuildID, {set_hostile, GuildID, RoleID, DGuildID}).

%% @doc 取消敌对
cancel_hostile(GuildID, RoleID, DGuildID) ->
    cast(GuildID, {cancel_hostile, GuildID, RoleID, DGuildID}).

%% @doc 查看宣战列表
get_declare_list(GuildID, RoleSid) ->
    cast(GuildID, {get_declare_list, GuildID, RoleSid}).

%% @doc 查看宣战列表
get_hostile_list(GuildID, RoleSid) ->
    cast(GuildID, {get_hostile_list, GuildID, RoleSid}).

%% @doc 增加战绩
add_exploit(GuildID, AddNum) ->
    cast(GuildID, {add_exploit, GuildID, AddNum}).

%%%% @doc 增加劫镖收益
%%add_rob(GuildID, Value) ->
%%    cast(GuildID, {add_rob, GuildID, Value}).

%% @doc 增加劫镖次数
add_rob_times(GuildID, DGuildID) ->
    cast(GuildID, {add_rob_times, GuildID, DGuildID}).

%% @doc 查看帮派祝福
get_bless(GuildID, RoleID) ->
    cast(GuildID, {get_bless, GuildID, RoleID}).

%% @doc 帮派祝福
bless(GuildID, RoleID, ID) ->
    cast(GuildID, {bless, GuildID, RoleID, ID}).

%% @doc 帮派红包
lucky_money(GuildID, RoleName, Icon, Conf, RoleID, IsAutoGet) ->
    call(GuildID, {lucky_money, GuildID, RoleName, Icon, Conf, RoleID, IsAutoGet}).

%% @doc 抢红包
get_lucky_money(GuildID, RoleID, ID) ->
    call(GuildID, {get_lucky_money, GuildID, RoleID, ID}).

%% @doc call
call(GuildID, Request) ->
    ?call(GuildID, Request).

%% @doc cast
cast(GuildID, Request) ->
    ?cast(GuildID, Request).

%% @doc 注册名
get_reg_name(GuildID) ->
    list_to_atom(lists:concat(["guild_", GuildID])).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([GuildID]) ->
    erlang:process_flag(trap_exit, true),
    lib_guild:init(GuildID),
    {ok, #state{guild_id = GuildID}}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call({info, GuildID}, _From, State) ->
    Reply = lib_guild:get_guild_info(GuildID),
    {reply, Reply, State};
do_handle_call({mfa, M, F, A}, _From, State) ->
    Reply = erlang:apply(M, F, A),
    {reply, Reply, State};
do_handle_call({apply_for, GuildID, Apply}, _From, State) ->
    Reply = lib_guild:apply_for(GuildID, Apply),
    {reply, Reply, State};
do_handle_call({rename, GuildID, RoleID, Name}, _From, State) ->
    Reply = lib_guild:rename(GuildID, RoleID, Name),
    {reply, Reply, State};
do_handle_call({enter_seat, GuildID, RoleID}, _From, State) ->
    Reply = lib_guild:enter_seat(GuildID, RoleID),
    {reply, Reply, State};
do_handle_call(get_seat_num, _From, State) ->
    #state{enter_seat_list = EnterSeatList} = State,
    Num = length(EnterSeatList),
%%    io:format("get EnterSeatNum=~w~n", [Num]),
    {reply, Num, State};
do_handle_call(sort_dice_num, _From, State) ->
    DiceRecordList = case erlang:get({?MODULE, dice_record}) of
        undefined -> [];
        _List -> _List
    end,
    Rep = if
        length(DiceRecordList) =:= 0 -> undefined;
        true ->
            SortFunc = fun({RoleID1, DiceNum1, Time1, _}, {RoleID2, DiceNum2, Time2, _}) ->
                if
                    DiceNum1 > DiceNum2 -> true;
                    DiceNum1 < DiceNum2 -> false;
                    true ->
                        if
                            Time1 < Time2 -> true;
                            Time1 > Time2 -> false;
                            true ->
                                if
                                    RoleID1 < RoleID2 -> true;
                                    true -> false
                                end
                        end
                end
            end,
            DiceRecordList_N = lists:sort(SortFunc, DiceRecordList),
            DiceMaxTuple = lists:nth(1, DiceRecordList_N),
            DiceMinTuple = lists:nth(length(DiceRecordList_N), DiceRecordList_N),
%%            io:format("Max_Min_Dice_Tuple_Created.......~n"),
%%            io:format("DiceMaxTuple:~p~n", [DiceMaxTuple]),
%%            io:format("DiceMinTuple:~p~n", [DiceMinTuple]),
            {DiceMaxTuple, DiceMinTuple}
    end,
    erlang:put({?MODULE, dice_record}, []),
    {reply, Rep, State};
do_handle_call({cook, GuildID, RoleID, Name, Type, AddVal}, _From, State) ->
    Reply = lib_guild:cook(GuildID, RoleID, Name, Type, AddVal),
    {reply, Reply, State};
do_handle_call({lucky_money, GuildID, RoleName, Icon, Conf, RoleID, IsAutoGet}, _From, State) ->
    Reply = lib_guild:lucky_money(GuildID, RoleName, Icon, Conf, RoleID, IsAutoGet),
    {reply, Reply, State};
do_handle_call({get_lucky_money, GuildID, RoleID, ID}, _From, State) ->
    Reply = lib_guild:get_lucky_money(GuildID, RoleID, ID),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({broadcast, GuildID, Bin}, State) ->
    lib_guild:broadcast(GuildID, Bin),
    {noreply, State};
do_handle_cast({cancel_apply, GuildID, RoleID}, State) ->
    lib_guild:cancel_apply(GuildID, RoleID),
    {noreply, State};
do_handle_cast({online, GuildID, RoleID}, State) ->
    lib_guild:online(GuildID, RoleID),
    {noreply, State};
do_handle_cast({offline, GuildID, RoleID}, State) ->
    lib_guild:offline(GuildID, RoleID),
    {noreply, State};
do_handle_cast({broadcast_except, GuildID, Bin, RoleList}, State) ->
    lib_guild:broadcast_except(GuildID, Bin, RoleList),
    {noreply, State};
do_handle_cast(stop, State) ->
    {stop, normal, State};
do_handle_cast({cross_day_reset, GuildID}, State) ->
    lib_guild:cross_day_reset(GuildID),
    {noreply, State};
do_handle_cast({add_funds, GuildID, RoleID, Funds, OpType}, State) ->
    lib_guild:add_funds(GuildID, RoleID, Funds, OpType),
    {noreply, State};
do_handle_cast({add_cont, GuildID, RoleID, Cont}, State) ->
    lib_guild:add_cont(GuildID, RoleID, Cont),
    {noreply, State};
do_handle_cast({desolation_check, GuildID}, State) ->
    lib_guild:desolation_check(GuildID),
    {noreply, State};
do_handle_cast({auto_impeach, GuildID}, State) ->
    lib_guild:auto_impeach(GuildID),
    {noreply, State};
do_handle_cast({change_announce, GuildID, RoleID, Announce}, State) ->
    lib_guild:change_announce(GuildID, RoleID, Announce),
    {noreply, State};
do_handle_cast({appoint_member_pos, GuildID, RoleID, TargetID, Pos}, State) ->
    lib_guild:appoint_member_pos(GuildID, RoleID, TargetID, Pos),
    {noreply, State};
do_handle_cast({kick_out, GuildID, RoleID, TargetID}, State) ->
    lib_guild:kick_out(GuildID, RoleID, TargetID),
    {noreply, State};
do_handle_cast({handle_apply, GuildID, RoleID, Approve, TargetID}, State) ->
    lib_guild:handle_apply(GuildID, RoleID, Approve, TargetID),
    {noreply, State};
do_handle_cast({get_apply_list, GuildID, RoleID}, State) ->
    lib_guild:get_apply_list(GuildID, RoleID),
    {noreply, State};
do_handle_cast({leave, GuildID, RoleID}, State) ->
    case lib_guild:leave(GuildID, RoleID) of
        {ok, true} -> {stop, normal, State};
        _ -> {noreply, State}
    end;
do_handle_cast({change_accept_type, GuildID, RoleID, Type, Auto}, State) ->
    lib_guild:change_accept_type(GuildID, RoleID, Type, Auto),
    {noreply, State};
do_handle_cast({recruit, GuildID, RoleID}, State) ->
    lib_guild:recruit(GuildID, RoleID),
    {noreply, State};
do_handle_cast({get_guild_logs, GuildID, RoleID}, State) ->
    lib_guild:get_guild_logs(GuildID, RoleID),
    {noreply, State};
do_handle_cast({get_member_list, GuildID, RoleID}, State) ->
    lib_guild:get_member_list(GuildID, RoleID),
    {noreply, State};
do_handle_cast({invite, GuildID, RoleID, TargetID}, State) ->
    lib_guild:invite(GuildID, RoleID, TargetID),
    {noreply, State};
do_handle_cast({upgrade, GuildID, RoleID}, State) ->
    lib_guild:upgrade(GuildID, RoleID),
    {noreply, State};
do_handle_cast({cost_denf_funds, GuildID}, State) ->
    lib_guild:cost_denf_funds(GuildID),
    {noreply, State};
do_handle_cast({add_live_exp, GuildID, RoleID, AddExp}, State) ->
    lib_guild:add_live_exp(GuildID, RoleID, AddExp),
    {noreply, State};
do_handle_cast({finish_bonus_task, GuildID, Type, Times}, State) ->
    lib_guild:finish_bonus_task(GuildID, Type, Times),
    {noreply, State};
do_handle_cast({guild_bonus, GuildID}, State) ->
    lib_guild:guild_bonus(GuildID),
    {noreply, State};
do_handle_cast({finish_guild_task, GuildID, Type, Times}, State) ->
    lib_guild:finish_guild_task(GuildID, Type, Times),
    {noreply, State};
do_handle_cast({guild_task, GuildID}, State) ->
    lib_guild:guild_task(GuildID),
    {noreply, State};
do_handle_cast({sh_dung_reset, GuildID}, State) ->
    lib_guild:sh_dung_reset(GuildID),
    {noreply, State};
do_handle_cast({rob_times_reset, GuildID}, State) ->
    lib_guild:rob_times_reset(GuildID),
    {noreply, State};
do_handle_cast({finish_sh_dung, GuildID, ID, Times}, State) ->
    lib_guild:finish_sh_dung(GuildID, ID, Times),
    {noreply, State};
do_handle_cast({gm_reduce_funds, GuildID, RoleID, Funds, OpType}, State) ->
    lib_guild:gm_reduce_funds(GuildID, RoleID, Funds, OpType),
    {noreply, State};
do_handle_cast(auto_inc_exp, State) ->
    #state{enter_seat_list = EnterSeatList} = State,
    Number = length(EnterSeatList),
    if
        Number =/= 0 ->
            Func = fun(RoleID) ->
                lib_role:mod_info(RoleID, lib_role_guild_wine_act, {auto_inc_exp, Number})
            end,
            lists:foreach(Func, EnterSeatList);
        true -> skip
    end,
    {noreply, State};
do_handle_cast({update_subject, CurSubject, NextSubject, NextTime}, State) ->
    #state{enter_seat_list = EnterSeatList} = State,
    Number = length(EnterSeatList),
    Number =:= 0 orelse router_518:send_update_next_subject(EnterSeatList, CurSubject, NextSubject, NextTime),
    {noreply, State};
do_handle_cast({inc_seat_num, RoleID}, State) ->
    #state{enter_seat_list = EnterSeatList} = State,
    EnterSeatList_N = [RoleID | EnterSeatList],
    svr_guild_wine_act:broadcast_number_update(EnterSeatList_N),
%%    io:format("EnterSeatNum= ~w~n", [length(EnterSeatList_N)]),
    State_N = State#state{enter_seat_list = EnterSeatList_N},
    {noreply, State_N};
do_handle_cast({dec_seat_num, RoleID}, State) ->
    #state{enter_seat_list = EnterSeatList} = State,
    EnterSeatList_N = lists:delete(RoleID, EnterSeatList),
    svr_guild_wine_act:broadcast_number_update(EnterSeatList_N),
%%    io:format("EnterSeatNum= ~w~n", [length(EnterSeatList_N)]),
    State_N = State#state{enter_seat_list = EnterSeatList_N},
    {noreply, State_N};
do_handle_cast({dice_record, RoleID, DiceNum, Lv}, State) ->
    DiceRecordList = case erlang:get({?MODULE, dice_record}) of
        undefined -> [];
        _List -> _List
    end,
    DiceRecordListN = lists:keystore(RoleID, 1, DiceRecordList, {RoleID, DiceNum, time:unixtime(), Lv}),
    erlang:put({?MODULE, dice_record}, DiceRecordListN),
    {noreply, State};
do_handle_cast({update_comment_info, MsgRecord}, State) ->
    #state{enter_seat_list = EnterSeatList} = State,
    Number = length(EnterSeatList),
    Number =:= 0 orelse router_518:send_update_comment_info(EnterSeatList, MsgRecord),
    {noreply, State};

do_handle_cast({build_up, GuildID, RoleID, ID}, State) ->
    lib_guild:build_up(GuildID, RoleID, ID),
    {noreply, State};

do_handle_cast({study_up, GuildID, RoleID, ID}, State) ->
    lib_guild:study_up(GuildID, RoleID, ID),
    {noreply, State};

do_handle_cast({guild_declare, GuildID, RoleID, DGuildID}, State) ->
    lib_guild:guild_declare(GuildID, RoleID, DGuildID),
    {noreply, State};

do_handle_cast({set_hostile, GuildID, RoleID, DGuildID}, State) ->
    lib_guild:set_hostile(GuildID, RoleID, DGuildID),
    {noreply, State};

do_handle_cast({cancel_hostile, GuildID, RoleID, DGuildID}, State) ->
    lib_guild:cancel_hostile(GuildID, RoleID, DGuildID),
    {noreply, State};

do_handle_cast({get_declare_list, GuildID, RoleSid}, State) ->
    lib_guild:get_declare_list(GuildID, RoleSid),
    {noreply, State};

do_handle_cast({get_hostile_list, GuildID, RoleSid}, State) ->
    lib_guild:get_hostile_list(GuildID, RoleSid),
    {noreply, State};

do_handle_cast({add_exploit, GuildID, AddNum}, State) ->
    lib_guild:add_exploit(GuildID, AddNum),
    {noreply, State};

%%do_handle_cast({add_rob, GuildID, Value}, State) ->
%%    lib_guild:add_rob(GuildID, Value),
%%    {noreply, State};

do_handle_cast({add_rob_times, GuildID, DGuildID}, State) ->
    lib_guild:add_rob_times(GuildID, DGuildID),
    {noreply, State};

do_handle_cast({get_bless, GuildID, RoleID}, State) ->
    lib_guild:get_bless(GuildID, RoleID),
    {noreply, State};

do_handle_cast({bless, GuildID, RoleID, ID}, State) ->
    lib_guild:bless(GuildID, RoleID, ID),
    {noreply, State};

do_handle_cast({role_delete, GuildID, RoleIDs}, State) ->
    lib_guild:role_delete(GuildID, RoleIDs),
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_guild:loop(Now),
    {noreply, State};

do_handle_cast(_Request, State) ->
    {noreply, State}.
