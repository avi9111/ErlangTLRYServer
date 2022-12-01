%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     掉落
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_drop).
-author("Ryuu").

-include("role.hrl").

%% API
-export([
    give_drop/4,
    handle_info/2
]).

handle_info({give_drop, Items, ExtraInfo, OpType}, PS) ->
    give_drop(PS, Items, ExtraInfo, OpType);
handle_info(_Info, _PS) ->
    ignore.

%% @doc 发送掉落
give_drop(PS, Items, _ExtraInfo, OpType) ->
    #role_state{id = RoleID} = PS,
    case lib_role_assets:can_add_items(PS, Items) of
        true ->
            %% drop notify
            lib_role_assets:add_items_notify(PS, Items, OpType);
        _ ->
            MailID = config:get_sys_config(bag_room_not_enough_mail),
            svr_mail:sys2p(RoleID, MailID, Items, OpType),
            PS
    end.
