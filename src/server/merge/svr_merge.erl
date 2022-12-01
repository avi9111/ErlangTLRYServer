%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc    合服处理
%%%
%%% @end
%%% Created : 23. 10月 2019 18:30
%%%-------------------------------------------------------------------
-module(svr_merge).
-author("Administrator").
-behavior(gen_server).
%%%=======================EXPORT=======================
-export([start_link/0, info/0, send_rename_card/1]).
-export([do_handle_call/3, do_handle_cast/2, do_handle_info/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).

%%%=======================INCLUDE======================
-include("op_type.hrl").
-include("role.hrl").
%%%=======================RECORD=======================
-record(merge, {
    dup_ids = []      %%重名发改名卡
}).
%%%=======================DEFINE=======================
-define(SAVE_INTERVAL, 60 * 60 * 1000).
-define(TYPE_RENAME, 1). % 重名
-define(SQL_GET_MERGE, <<"select * from `renames`">>).
-define(SQL_RENAME_DELETE, <<"delete from `renames` where `role_id` = ~w">>).
%%%=================EXPORTED FUNCTIONS=================
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

info() ->
    gen_server:call(?MODULE, info).

send_rename_card(RoleID) ->
    gen_server:cast(?MODULE, {send_card, RoleID}).

init(_) ->
    {ok, #merge{}, 2000}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Request, State) ->
    ?DO_HANDLE_INFO(Request, State).


do_handle_call(info, _From, State = #merge{dup_ids = List}) ->
    R = [{info, List}],
    {reply, R, State};
do_handle_call(_Req, _From, State) ->
    {noreply, State}.

do_handle_cast({send_card, RoleID}, State = #merge{dup_ids = List}) ->
    case lists:member(RoleID, List) of
        true ->
            Sql = io_lib:format(?SQL_RENAME_DELETE, [RoleID]),
            db:execute(Sql),
            MailID = config:get_sys_config(role_rename_mail),
            ItemID = config:get_sys_config(rename_item_id),
            Costs = [{?AST_ITEM, [{ItemID, 1}]}],
            svr_mail:sys2select([RoleID], MailID, Costs, ?OPT_GM),
            ?INFO("send_rename_card, RoleID:~p", [RoleID]),
            ListN = lists:delete(RoleID, List);
        _ ->
            ListN = List
    end,
    {noreply, State#merge{dup_ids = ListN}};
do_handle_cast(_Req, State) ->
    {noreply, State}.

do_handle_info(timeout, State) ->
    List = db:get_all(?SQL_GET_MERGE),
    DupIds = [H || [H] <- List],
    {noreply, State#merge{dup_ids = DupIds}};
do_handle_info(_Req, State) ->
    {noreply, State}.

code_change(_, State, _) ->
    {ok, State}.

terminate(_Reason, _State) ->
    ok.

