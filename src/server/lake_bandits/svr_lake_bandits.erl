%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     镜湖剿匪
%%% @end
%%% Created : 05. 十一月 2018 8:50
%%%-------------------------------------------------------------------
-module(svr_lake_bandits).

-behaviour(gen_server).

-include("role.hrl").
-include("ret_code.hrl").
-include("lake_bandits.hrl").
-include("battle.hrl").
-include("proto/prot_513.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2
]).

-export([
    start_activity/1,
    stop_activity/1,
    prepare_activity/1,
    cast/1,
    call/1,
    enter_check/3,
    enter_scene/2,
    leave/3,
    get_mon_list/3,
    get_role_list/1,
    switch/5,
    mon_die/3
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).


%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).


prepare_activity(_Activity) ->
    #{dragon_pos := DragonPos} = conf_lake_bandits_info:get(),
    publish_rumor(DragonPos, 20603),
    ok.

%% @doc 开启活动
start_activity(_Activity) ->
    #{
        scene := SceneID,
        clam_pos := ClamPos,
        dragon_pos := DragonPos,
        flood_dragon_pos := FdDragonPos,
        little_dragon_num := LDragonNum,
        little_dragon_pos := LDragonPos,
        line_num := LineNum,
        dragon_buff := DragonBuffID
    } = conf_lake_bandits_info:get(),
    WorldLv = util_svr:get_world_lv(),
    #{
        clam_id := ClamID,
        dragon_id := DragonID,
        flood_dragon_id := FDragonID,
        little_dragon_ids := LDragonIDs
    } = conf_lake_bandits_mon:get(WorldLv),
    LineNom = [{DragonID, length(DragonPos)}] ++ LDragonIDs,
    %% 刷新怪并返回分线怪物列表
    LineMonList =
    lists:foldl(fun(LineID, Acc) ->
        %% 刷新怪物
        create_mon(SceneID, LineID, ClamPos, ClamID, 0),
        create_mon(SceneID, LineID, DragonPos, DragonID, DragonBuffID),
        create_mon(SceneID, LineID, FdDragonPos, FDragonID, 0),
        RealLDragonPos = util:list_rand_n(LDragonPos, LDragonNum),
        create_mon(SceneID, LineID, RealLDragonPos, LDragonIDs, 0),
        [{LineID, LineNom} | Acc]
     end, [], lists:seq(1, LineNum)),
    publish_rumor(DragonPos, 20601),
    cast({start_activity, LineMonList}),
    ok.


%% @doc 结束活动
stop_activity(_Activity) ->
    #{scene := SceneID} = conf_lake_bandits_info:get(),
    #{line_num := LineNum} = conf_lake_bandits_info:get(),
    [lib_scene_api:clear_scene_mon(SceneID, Line, true) || Line <- lists:seq(1, LineNum)],
    ok.

%% 进入
enter_check(RoleID, RoleSid, SceneID) ->
    cast({enter_check, RoleID, RoleSid, SceneID}).

%% 进入镜湖剿匪
enter_scene(RoleID, LineID) ->
    cast({enter_scene, RoleID, LineID}).

%% 退出
leave(RoleID, LineID, SceneID) ->
    #{scene := Scene} = conf_lake_bandits_info:get(),
    InScene = SceneID =:= Scene,
    InScene andalso cast({leave, RoleID, LineID}).

%% 切换分线
switch(RoleID, RoleSid, SceneID, ToLineID, CurLineID) ->
    cast({switch, RoleID, RoleSid, SceneID, ToLineID, CurLineID}).

%% 查看玩家列表
get_role_list(RoleSid) ->
    cast({get_role_list, RoleSid}).

get_mon_list(RoleID, RoleSid, LineID) ->
    cast({get_mon_list, RoleID, RoleSid, LineID}).

mon_die(SceneID, LineID, MTypeID) ->
    cast({mon_die, SceneID, LineID, MTypeID}).

%% @doc call
call(Request) ->
    case dist:whereis_name(?SCOPE, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(Request) ->
    case dist:whereis_name(?SCOPE, ?SERVER) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    #{line_num := LineNum} = conf_lake_bandits_info:get(),
    LineRoleList = [{LineID, sets:new()} || LineID <- lists:seq(1, LineNum)],
    {ok, #lake_bandits{line_role_list = lists:sort(LineRoleList)}}.

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

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.


do_handle_cast({start_activity, LineMonList}, State) ->
    {noreply, State#lake_bandits{line_mon_list = LineMonList}};

do_handle_cast({enter_check, RoleID, RoleSid, SceneID}, #lake_bandits{line_role_list = LineRoleList} = State) ->
    #{line_max_role := LineMaxRole} = conf_lake_bandits_info:get(),
    {GetLine, _} = get_line(LineRoleList, LineMaxRole, LineRoleList, RoleID),
    case GetLine > 0 of
        true ->
            {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
            lib_scene_api:change_scene_async(RoleID, SceneID, GetLine, X, Y),
            MsgRecord = #sc_lake_bandits_enter{line_id = GetLine},
            {ok, Bin} = prot_msg:encode_msg(51302, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin);
        _ ->
            ?ERROR_TOC(RoleID, ?RC_LAKE_BANDITS_ALL_LINE_ENOUGH)
    end,
    {noreply, State};

do_handle_cast({enter_scene, RoleID, LineID}, #lake_bandits{line_role_list = LineRoleList} = State) ->
    RoleSets = util:prop_get_value(LineID, LineRoleList, 0),
    NewLineRoleList = util:prop_store(LineID, sets:add_element(RoleID, RoleSets), LineRoleList),
    NewState = State#lake_bandits{line_role_list = NewLineRoleList},
    {noreply, NewState};

do_handle_cast({leave, RoleID, LineID}, #lake_bandits{line_role_list = LineRoleList} = State) ->
    NewState =
    case util:prop_get_value(LineID, LineRoleList) of
        undefined ->
            State;
        RoleSets ->
            NewRoleSets = sets:del_element(RoleID, RoleSets),
            NewLineRoleList = util:prop_store(LineID, NewRoleSets, LineRoleList),
            State#lake_bandits{line_role_list = NewLineRoleList}
    end,
    {noreply, NewState};

do_handle_cast({switch, RoleID, RoleSid, SceneID, ToLineID, OldLineID}, #lake_bandits{line_role_list = LineRoleList} = State) ->
    #{line_max_role := LineMaxRole} = conf_lake_bandits_info:get(),
    NewState =
    case catch check_switch(RoleID, ToLineID, OldLineID, LineRoleList, LineMaxRole) of
        NewLineRoleList when is_list(NewLineRoleList) ->
            {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
            lib_scene_api:change_scene_async(RoleID, SceneID, ToLineID, X, Y),
            MsgRecord = #sc_lake_bandits_switch{line_id = ToLineID},
            {ok, Bin} = prot_msg:encode_msg(51306, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin),
            State#lake_bandits{line_role_list = NewLineRoleList};
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code),
            State
    end,
    {noreply, NewState};

do_handle_cast({get_role_list, RoleSid}, #lake_bandits{line_role_list = LineRoleList} = State) ->
    ClientLineRoles = [{LineID, sets:size(RoleSets)} || {LineID, RoleSets} <- LineRoleList],
    MsgRecord = #sc_lake_bandits_dragon_role{line_role_num = ClientLineRoles},
    {ok, Bin} = prot_msg:encode_msg(51313, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {noreply, State};

do_handle_cast({get_mon_list, RoleID, RoleSid, LineID}, #lake_bandits{line_mon_list = LineMonList} = State) ->
    case util:prop_get_value(LineID, LineMonList) of
        undefined ->
            ?ERROR_TOC(RoleID, ?RC_LAKE_BANDITS_ERROR_LINE);
        LineMon ->
            MsgRecord = #sc_lake_bandits_dragon_mon{mon_list = LineMon},
            {ok, Bin} = prot_msg:encode_msg(51315, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin)
    end,
    {noreply, State};

do_handle_cast({mon_die, SceneID, LineID, MTypeID}, #lake_bandits{line_mon_list = LineMonList} = State) ->
    LineMon = util:prop_get_value(LineID, LineMonList),
    NewState =
    case util:prop_get_value(MTypeID, LineMon) of
        undefined ->
            State;
        MonNum ->
            NewMonNum = max(0, MonNum - 1),
            NewLineMon = util:prop_store(MTypeID, NewMonNum, LineMon),
            NewLineMonList = util:prop_store(LineID, NewLineMon, LineMonList),
            MsgRecord = #sc_lake_bandits_dragon_mon{mon_list = NewLineMon},
            {ok, Bin} = prot_msg:encode_msg(51315, MsgRecord),
            lib_scene_api:send_to_scene(SceneID, LineID, Bin),
            State#lake_bandits{line_mon_list = NewLineMonList}
    end,
    {noreply, NewState};

do_handle_cast(_Request, State) ->
    {noreply, State}.

%%====================private===============
publish_rumor([{X, Y}], RumorID) ->
    svr_rumor:publish(world, RumorID, [?STR(X), ?STR(Y)]).

create_mon(SceneID, LineID, Pos, MTypeID, BuffID) when is_integer(MTypeID) ->
    lists:foreach(fun({X, Y}) ->
        case BuffID > 0 of
            true ->
                MID = lib_scene_api:create_mon(MTypeID, SceneID, LineID, [{xy, {X, Y}}]),
                ApplyArgs = [MID, BuffID],
                svr_scene_agent:apply_cast(SceneID, LineID, lib_scene_lake, add_dragon_buff, ApplyArgs);
%%                ObjKey = {?BATTLE_MON, MID},
%%                svr_scene_agent:push_cmd(SceneID, LineID, {'add_effect', {ObjKey, ObjKey, {BuffID, 1}}});
            _ ->
                lib_scene_api:create_mon_async(MTypeID, SceneID, LineID, [{xy, {X, Y}}])
        end
    end, Pos);

create_mon(_, _, [], _, _) -> ok;
create_mon(_, _, _, [], _) -> ok;
create_mon(SceneID, LineID, Pos, [{MTypeID, Num} | T], BuffID) ->
    NewPos = create_mon_helper(SceneID, LineID, Pos, MTypeID, Num),
    create_mon(SceneID, LineID, NewPos, T, BuffID).

create_mon_helper(_, _, Pos, _, 0) -> Pos;
create_mon_helper(_, _, [], _, _) -> [];
create_mon_helper(SceneID, LineID, [{X, Y} | Rest], MTypeID, Num) ->
    lib_scene_api:create_mon_async(MTypeID, SceneID, LineID, [{xy, {X, Y}}]),
    create_mon_helper(SceneID, LineID, Rest, MTypeID, Num - 1).

get_line([], _, List, _) -> {0, List};
get_line([{Line, RoleSet} | T], LineMaxRole, List, RoleID) ->
    case sets:size(RoleSet) >= LineMaxRole of
        true ->
            get_line(T, LineMaxRole, List, RoleID);
        _ ->
            NewList = lists:keystore(Line, 1, List, {Line, sets:add_element(RoleID, RoleSet)}),
            {Line, NewList}
    end.

check_switch(RoleID, ToLineID, OldLineID, LineRoleList, LineMaxRole) ->
    ToRoleSets = util:prop_get_value(ToLineID, LineRoleList),
    ToRoleSets =/= undefinde orelse erlang:throw({error, ?RC_LAKE_BANDITS_ERROR_LINE}),
    sets:size(ToRoleSets) < LineMaxRole orelse erlang:throw({error, ?RC_LAKE_BANDITS_MAX_ROLE}),
    ToRoleSetsN = sets:add_element(RoleID, ToRoleSets),
    OldRoleSets = util:prop_get_value(OldLineID, LineRoleList),
    OldRoleSetsN = sets:del_element(RoleID, OldRoleSets),
    LineRoleListN1 = util:prop_store(OldLineID, OldRoleSetsN, LineRoleList),
    util:prop_store(ToLineID, ToRoleSetsN, LineRoleListN1).
