%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派工资
%%% @end
%%% Created : 25. 十二月 2018 10:49
%%%-------------------------------------------------------------------
-module(lib_role_guild_wages).

-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("guild_wages.hrl").
-include("assets.hrl").
-include("guild.hrl").
-include("proto/prot_534.hrl").

%% API
-export([
    do/3,
    init/1,
    send_info/1,
    trigger_event/3,
    handle_info/2,
    cross_day/1,
    save/1,
    id_map/1
]).

trigger_event(RoleID, ID, Times) ->
    lib_role:mod_info(RoleID, ?MODULE, {'trigger_event', ID, Times}).

handle_info({'trigger_event', ID, Times}, PS) ->
    handle_trigger_event(PS, ID, Times);
handle_info(_, _) ->
    skip.

do(53401, PS, _Req) ->
    send_info(PS);
do(_, _, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    {Stages, LastCheck} = get_role_db_data(RoleID),
    Now = time:unixtime(),
    RoleData =
    case time:is_same_week(Now, LastCheck) of
        true ->
            #{stages => Stages, last_check => LastCheck, updated => false};
        _ ->
            refresh_data(RoleID, Stages, GuildID)
    end,
    set_role_data(RoleID, RoleData).

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{stages := Stages} = RoleData,
    MsgRecord = #sc_guild_wages_info{stages = Stages},
    {ok, Bin} = prot_msg:encode_msg(53402, MsgRecord),
    lib_role_send:send_to_sid(PS#role_state.sid, Bin),
    ok.

handle_trigger_event(PS, ID, AddTimes) ->
    case catch check_trigger_event(PS, ID, AddTimes) of
        {ok, RoleData, Stages} ->
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_guild_wages_info{stages = Stages},
            {ok, Bin} = prot_msg:encode_msg(53402, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        _ ->
            skip
    end.

check_trigger_event(PS, ID, AddTimes) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{stages := Stages} = RoleData,
    Times = util:prop_get_value(ID, Stages),
    Conf = conf_guild_wages:get(ID),
    Conf =/= undefined orelse erlang:throw(error),
    #{times := MaxTimes} = Conf,
    NewTimes = ?iif(Times + AddTimes > MaxTimes, MaxTimes, Times + AddTimes),
    NewStages = util:prop_store(ID, NewTimes, Stages),
    NewRoleData = RoleData#{stages => NewStages},
    {ok, NewRoleData, NewStages}.

cross_day(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    RoleData = get_role_data(RoleID),
    #{stages := Stages, last_check := LastCheck} = RoleData,
    NewRoleData =
    case time:is_same_week(time:unixtime(), LastCheck) of
        true ->
            RoleData;
        _ ->
            refresh_data(RoleID, Stages, GuildID)
    end,
    set_role_data(RoleID, NewRoleData),
    ok.

refresh_data(RoleID, Stages, GuildID) ->
    Effect = lib_guild:get_study_lv(GuildID, ?GUILD_STUDY_4),
    GetBgold =
    lists:foldl(fun({ID, Times}, Acc) ->
        case conf_guild_wages:get(ID) of
            #{times := NeedTimes, bgold := Bgold} when Times >= NeedTimes ->
                Acc + Bgold + Effect;
            _ ->
                Acc
        end
    end, 0, Stages),
    GetBgold > 0 andalso svr_mail:sys2p(RoleID, 2101, [{?AST_BGOLD, GetBgold}], ?OPT_GUILD_WAGES),
    #{stages => init_stages(), last_check => time:unixtime(), updated => true}.

init_stages() ->
    IDs = conf_guild_wages:get_ids(),
    [{ID, 0} || ID <- IDs].

fix_stages(Stages) ->
    IDs = conf_guild_wages:get_ids(),
    lists:foldl(fun(ID, Acc) ->
        case proplists:is_defined(ID, Acc) of
            true ->
                Acc;
            _ ->
                [{ID, 0} | Acc]
        end
    end, Stages, IDs).

%% 每日活跃任务ID -> 帮派工资任务ID
id_map(ID) ->
    case ID of
        4 -> ?WAGES_DEFEND;
        7 -> ?WAGES_WINE;
        9 -> ?WAGES_PRACTICE;
        11 -> ?WAGES_CARRY;
        1005 -> ?WAGES_TASK;
        1014 -> ?WAGES_METALL;
        _ -> 0
    end.

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#{updated => true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

%% 下线保存
save(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    case Updated of
        true ->
            #{stages := Stages, last_check := LastCheck} = RoleData,
            save_role_data(RoleID, Stages, LastCheck);
        _ ->
            skip
    end.

get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_WAGES_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [DbStages, LastCheck] ->
            Stages = type:convert_db_field(list, DbStages, []),
            {fix_stages(Stages), LastCheck};
        [] ->
            {init_stages(), time:unixtime()}
    end.

save_role_data(RoleID, Stages, LastCheck) ->
    DbStages = type:term_to_bitstring(Stages),
    SQL = io_lib:format(?SQL_SET_WAGES_DATA, [RoleID, DbStages, LastCheck]),
    ?DB:execute(SQL).