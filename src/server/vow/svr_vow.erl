%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     众里寻卿
%%% @end
%%% Created : 25. 二月 2019 10:35
%%%-------------------------------------------------------------------
-module(svr_vow).

-behaviour(gen_server).
-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("vow.hrl").
-include("proto/prot_541.hrl").

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
    cast/1,
    call/1
]).

-export([
    panel_info/2,
    my_like/1,
    my_vow/2,
    other_vow/2,
    refresh/4,
    vow/3,
    like/2,
    cancel_like/2,
    revoke/1,
    role_delete/1,
    permanent/0
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

%% @doc 面板信息
panel_info(RoleID, RTimes) ->
    cast({panel_info, RoleID, RTimes}).

%% @doc 我的点赞
my_like(RoleID) ->
    cast({my_like, RoleID}).

%% @doc 我的许愿
my_vow(RoleID, Args) ->
    cast({my_vow, RoleID, Args}).

%% @doc 查看他人许愿
other_vow(RoleID, TargetID) ->
    cast({other_vow, RoleID, TargetID}).

%% @doc 刷新
refresh(RoleID, Type, RefreshTimes, GuildID) ->
    cast({refresh, RoleID, Type, RefreshTimes, GuildID}).

%% @doc 许愿
vow(RoleID, GuildID, Context) ->
    cast({vow, RoleID, GuildID, Context}).

%% @doc 点赞
like(RoleID, TargetID) ->
    cast({like, RoleID, TargetID}).

%% @doc 取消点赞
cancel_like(RoleID, TargetID) ->
    cast({cancel_like, RoleID, TargetID}).

%% @doc 删号
role_delete(RoleIds) ->
    cast({role_delete, RoleIds}).

%% @doc 撤销许愿
revoke(RoleID) ->
    cast({revoke, RoleID}).

%% @doc 数据持久化
permanent() ->
    cast(permanent).

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
    Data = get_all_data(),
    erlang:process_flag(trap_exit, true),
    {ok, #vow{data = Data}}.

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

do_handle_cast({panel_info, RoleID, RTimes}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    #{show_list := ShowList, type := Type} = RoleData,
    {NewRoleData, VowList} =
        case ShowList =:= [] of
            true when Type =:= 1 ->
                {RoleData, []};
            true ->
                {ShowData, NewShowList} = init_show_list(RoleID, Data),
                {RoleData#{show_list => NewShowList, updated => true}, ShowData};
            _ ->
                {ShowData, NewShowList} = gain_show_list(ShowList, Data),
                {RoleData#{show_list => NewShowList}, ShowData}
        end,
    NewData = set_role_data(RoleID, NewRoleData, Data),
    MsgRecord = #sc_vow_panel_info{vow_list = VowList, refresh_times = RTimes},
    {ok, Bin} = prot_msg:encode_msg(54102, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    NewState = State#vow{data = NewData},
    {noreply, NewState};

do_handle_cast({my_like, RoleID}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    #{like_list := LikeList} = RoleData,
    {LikeData, FLikeList} = complete_like_list(LikeList, Data),
    MsgRecord = #sc_vow_my_like{vow_list = LikeData},
    {ok, Bin} = prot_msg:encode_msg(54104, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    NewData =
        case FLikeList =/= LikeList of
            true ->
                NewRoleData = RoleData#{like_list => FLikeList},
                update_role_data(RoleID, NewRoleData, Data);
            _ ->
                Data
        end,
    NewState = State#vow{data = NewData},
    {noreply, NewState};

do_handle_cast({my_vow, RoleID, Args}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    #{context := Context, is_post := IsPost} = RoleData,
    {Name, Career, Lv} = Args,
    MsgRecord = #sc_vow_my_vow{
        role_id = RoleID,
        name = Name,
        career = Career,
        level = Lv,
        context = Context,
        is_post = IsPost
    },
    {ok, Bin} = prot_msg:encode_msg(54106, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    {noreply, State};

do_handle_cast({other_vow, RoleID, TargetID}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    #{like_list := LikeList} = RoleData,
    TargetData = get_role_data(TargetID, Data),
    #{context := Context} = TargetData,
    TName = lib_cache:get_role_name(TargetID),
    IsLike = ?iif(lists:member(TargetID, LikeList), 1, 2),
    TCareer = lib_cache:get_role_career(TargetID),
    TLv = lib_cache:get_role_level(TargetID),
    MsgRecord = #sc_vow_other_vow{
        role_id = TargetID,
        name = TName,
        career = TCareer,
        level = TLv,
        context = Context,
        is_like = IsLike
    },
    {ok, Bin} = prot_msg:encode_msg(54108, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    {noreply, State};

do_handle_cast({refresh, RoleID, Type, RefreshTimes, GuildID}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    {ShowData, ShowList} =
        case Type =:= 0 orelse GuildID =:= 0 of
            true ->
                init_show_list(RoleID, Data);
            _ ->
                init_guild_show_list(RoleID, GuildID, Data)
        end,
    NewRoleData = RoleData#{show_list => ShowList, type => Type},
    NewData = update_role_data(RoleID, NewRoleData, Data),
    MsgRecord = #sc_vow_panel_info{
        vow_list = ShowData,
        refresh_times = RefreshTimes
    },
    {ok, Bin} = prot_msg:encode_msg(54102, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    NewState = State#vow{data = NewData},
    {noreply, NewState};

do_handle_cast({vow, RoleID, GuildID, Context}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    NewRoleData = RoleData#{context => Context, guild_id => GuildID, is_post => 1},
    NewData = update_role_data(RoleID, NewRoleData, Data),
    MsgRecord = #sc_vow{},
    {ok, Bin} = prot_msg:encode_msg(54111, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    NewState = State#vow{data = NewData},
    {noreply, NewState};

do_handle_cast({like, RoleID, TargetID}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    #{like_list := LikeList} = RoleData,
    #{like_max_num := LikeMaxNum} = conf_vow_info:get(),
    IsLike = lists:member(TargetID, LikeList),
    NewData =
        case length(LikeList) < LikeMaxNum of
            _ when IsLike ->
                ?ERROR_TOC(RoleID, ?RC_VOW_ALREADY_LIKE),
                Data;
            true ->
                case map:keyfind(TargetID, id, Data) of
                    TRoleData when is_map(TRoleData) ->
                        #{be_like_num := BeLikeNum} = TRoleData,
                        NewTRoleData = TRoleData#{be_like_num => BeLikeNum + 1},
                        NewRoleData = RoleData#{like_list => [TargetID | LikeList]},
                        MsgRecord = #sc_vow_agree{target_id = TargetID},
                        {ok, Bin} = prot_msg:encode_msg(54115, MsgRecord),
                        lib_role_send:send_to_role(RoleID, Bin),
                        Data1 = update_role_data(RoleID, NewRoleData, Data),
                        update_role_data(TargetID, NewTRoleData, Data1);
                    _ ->
                        ?ERROR_TOC(RoleID, ?RC_VOW_NOT_FIND_TARGET),
                        Data
                end;
            _ ->
                ?ERROR_TOC(RoleID, ?RC_VOW_LIKE_NUM_MAX),
                Data
        end,
    NewState = State#vow{data = NewData},
    {noreply, NewState};

do_handle_cast({cancel_like, RoleID, TargetID}, #vow{data = Data} = State) ->
    RoleData = get_role_data(RoleID, Data),
    #{like_list := LikeList} = RoleData,
    NewData =
        case lists:member(TargetID, LikeList) of
            true ->
                case map:keyfind(TargetID, id, Data) of
                    TRoleData when is_map(TRoleData) ->
                        #{be_like_num := BeLikeNum} = TRoleData,
                        NewTRoleData = TRoleData#{be_like_num => max(BeLikeNum - 1, 0)},
                        NewRoleData = RoleData#{like_list => lists:delete(TargetID, LikeList)},
                        MsgRecord = #sc_vow_cancel_like{target_id = TargetID},
                        {ok, Bin} = prot_msg:encode_msg(54117, MsgRecord),
                        lib_role_send:send_to_role(RoleID, Bin),
                        Data1 = update_role_data(RoleID, NewRoleData, Data),
                        update_role_data(TargetID, NewTRoleData, Data1);
                    _ ->
                        NewRoleData = RoleData#{like_list => lists:delete(TargetID, LikeList)},
                        update_role_data(RoleID, NewRoleData, Data)
                end;
            _ ->
                ?ERROR_TOC(RoleID, ?RC_VOW_NOT_LIKE_TARGET),
                Data
        end,
    NewState = State#vow{data = NewData},
    {noreply, NewState};

do_handle_cast({revoke, RoleID}, #vow{data = Data} = State) ->
    NewData = remove_role_data(RoleID, Data),
    MsgRecord = #sc_vow_revoke{},
    {ok, Bin} = prot_msg:encode_msg(54119, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    NewState = State#vow{data = NewData},
    remove_db_data(RoleID),
    {noreply, NewState};

do_handle_cast(permanent, #vow{data = Data} = State) ->
    save_data(Data),
    NewState = State#vow{},
    {noreply, NewState};
do_handle_cast({role_delete, RoleIds}, #vow{data = Data} = State) ->
    DataN = map:keydelete_by_list(RoleIds, id, Data),
    {noreply, State#vow{data = DataN}};
do_handle_cast(_Request, State) ->
    {noreply, State}.

%%====================private===============
get_all_data() ->
    SQL = io_lib:format(?SQL_ALL_VOW_DATA, []),
    case ?DB:get_all(SQL) of
        [] ->
            [];
        List ->
            [
                ?role_vow#{
                    id => RoleID,
                    context => Context,
                    be_like_num => BeLikeNum,
                    like_list => type:convert_db_field(list, DbLikeList, []),
                    show_list => type:convert_db_field(list, DbShowList, []),
                    guild_id => lib_cache:get_role_guild(RoleID),
                    type => Type,
                    is_post => IsPost
                } || [RoleID, Context, BeLikeNum, DbLikeList, DbShowList, Type, IsPost] <- List
            ]
    end.

remove_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_DEL_VOW_DATA, [RoleID]),
    ?DB:execute(SQL).

save_data(Data) ->
    List =
        lists:foldl(fun(RoleData, Acc) ->
            #{
                id := RoleID, context := Context, be_like_num := BeLikeNum, like_list := LikeList,
                show_list := ShowList, type := Type, updated := Updated, is_post := IsPost
            } = RoleData,
            case Updated of
                true ->
                    DbLikeList = type:term_to_bitstring(LikeList),
                    DbShowList = type:term_to_bitstring(ShowList),
                    [[RoleID, Context, BeLikeNum, DbLikeList, DbShowList, Type, IsPost] | Acc];
                _ ->
                    Acc
            end
        end, [], Data),
    db:insert_values(?SQL_SET_VOW2, ?SQL_SET_VOW3, List),
    ok.

init_show_list(RoleID, Data) ->
    NewData = lists:filter(fun(#{id := ID, is_post := IsPost}) ->
        RoleID =/= ID andalso IsPost =:= 1
    end, Data),
    #{show_vow_num := ShowNum} = conf_vow_info:get(),
    SupplyData = util:list_rand_n(NewData, ShowNum),
    IDList = [ID || #{id := ID} <- SupplyData],
    complete_like_list(IDList, Data).
%%    {complete_show_list(IDList, Data), IDList}.

init_guild_show_list(RoleID, GuildID, Data) when GuildID > 0 ->
    FData = lists:filter(fun(#{id := ID, is_post := IsPost, guild_id := TGuildID}) ->
        RoleID =/= ID andalso IsPost =:= 1 andalso TGuildID =:= GuildID
    end, Data),
    #{show_vow_num := ShowNum} = conf_vow_info:get(),
    SupplyData = util:list_rand_n(FData, ShowNum),
    IDList = [ID || #{id := ID} <- SupplyData],
    {complete_show_list(IDList, Data), IDList};
init_guild_show_list(RoleID, _, Data) ->
    init_show_list(RoleID, Data).

gain_show_list(List, Data) ->
    FList =
        lists:filter(fun(RoleID) ->
            case map:keyfind(RoleID, id, Data) of
                false -> false;
                _ -> true
            end
        end, List),
    {complete_show_list(FList, Data), FList}.

%% 列表
complete_show_list(IDList, Data) ->
    lists:foldl(fun(RoleID, Acc) ->
        case map:keyfind(RoleID, id, Data) of
            #{id := ID, context := Context, be_like_num := BeLikeNum} ->
                Name = lib_cache:get_role_name(ID),
                [{ID, Name, Context, BeLikeNum} | Acc];
            _ ->
                Acc
        end
    end, [], IDList).

complete_like_list(IDList, Data) ->
    lists:foldl(fun(RoleID, {DataAcc, IDAcc}) ->
        case map:keyfind(RoleID, id, Data) of
            #{id := ID, context := Context, be_like_num := BeLikeNum} ->
                Name = lib_cache:get_role_name(ID),
                {[{ID, Name, Context, BeLikeNum} | DataAcc], [RoleID | IDAcc]};
            _ ->
                {DataAcc, IDAcc}
        end
    end, {[], []}, IDList).

get_role_data(RoleID, Data) ->
    map:keyfind(RoleID, id, Data, ?role_vow#{id => RoleID}).

set_role_data(RoleID, RoleData, Data) ->
    map:keystore(RoleID, id, Data, RoleData).

update_role_data(RoleID, RoleData, Data) ->
    NewRoleData = RoleData#{updated => true},
    set_role_data(RoleID, NewRoleData, Data).

remove_role_data(RoleID, Data) ->
    map:keydelete(RoleID, id, Data).
