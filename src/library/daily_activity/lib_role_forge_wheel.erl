%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     打造转盘
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_forge_wheel).
-author("Ryuu").

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_207.hrl").

%% API
-export([
    forge_wheel/1
]).

forge_wheel(PS) ->
    case catch check_forge_wheel(PS) of
        {ok, RoleID, ID, Costs, DropID} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_FORGE_WHEEL),
            lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_FORGE_WHEEL),
            Rec = #sc_refine_forge_wheel{id = ID},
            {ok, Bin} = prot_msg:encode_msg(20712, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_forge_wheel(PS) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    Conf = conf_equip_forge_wheel:get(RoleLv),
    Conf =/= undefined orelse erlang:throw({error, ?RC_FORGE_NO_WHEEL_CONF}),
    #{score := Score, items := Items} = Conf,
    Costs = [{?AST_FORGE_S, Score}],
    lib_role_assets:check_items_enough(PS, Costs),
    {ID, DropID, _} = util:rand_by_weight(Items, 3),
    {ok, RoleID, ID, Costs, DropID}.
