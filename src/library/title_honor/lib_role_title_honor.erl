%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     头衔
%%% @end
%%% Created : 10. 十二月 2018 17:50
%%%-------------------------------------------------------------------
-module(lib_role_title_honor).

-include("common.hrl").
-include("role.hrl").
-include("attr.hrl").
-include("assets.hrl").
-include("dungeon.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("proto/prot_530.hrl").

%% API
-export([
    do/3,
    up/1,
    init/1,
    get_attr/1,
    get_fight/1,
    has_title/1
]).

do(53001, PS, _Req) ->
    up(PS);
do(_, _, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID, personal = Personal, career = Career} = PS,
    TitleHonor = maps:get(title_honor, Personal, 0),
    Attr =
        case conf_title_honor:get(TitleHonor) of
            #{attr := AttrT, attr_by_career := CAttr} ->
                {_, CType, CValue} = lists:keyfind(Career, 1, CAttr),
                [{CType, CValue} | AttrT];
            _ ->
                []
        end,
    Fight = lib_role_attr:calc_combat_power(Attr),
    RoleData = #{attr => Attr, fight => Fight},
    set_role_data(RoleID, RoleData).


%% 升级头衔
up(PS) ->
    case catch check_up(PS) of
        {ok, RoleData, Personal, CostItem, TitleHonor} ->
            NewPS = ?iif(CostItem =/= [], lib_role_assets:cost_items_notify(PS, CostItem, ?OPT_TITLE_HONOR), PS),
            NewPS2 = NewPS#role_state{personal = Personal},
            set_role_data(PS#role_state.id, RoleData),
            lib_scene_api:update('title_honor', NewPS2),
            Rec = #sc_title_honor_up{title_honor = TitleHonor},
            {ok, Bin} = prot_msg:encode_msg(53002, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            NewPS3 = lib_role_attr:refresh_combat_power(NewPS2),
            ?TASK_EVENT(PS, 'upgrade_honor'),
            {ok, NewPS3};
        {error, Code} ->
            ?ERROR_TOC(PS, Code);
        {need_pass, Desc} ->
            ?ERROR_TOC(PS, ?RC_TITLE_HONOR_NEED_PASS_DUNGEON, [Desc])
    end.

check_up(PS) ->
    #role_state{id = RoleID, personal = Personal, career = Career} = PS,
    RoleData = get_role_data(RoleID),
    #{title_honor := TitleHonor} = Personal,
    NextTitleHonor = ?iif(TitleHonor =:= 0, 1001, TitleHonor + 1),
    Conf = conf_title_honor:get(NextTitleHonor),
    Conf =/= undefined orelse erlang:throw({error, ?RC_TITLE_HONOR_MAX_LEVEL}),
    #{condition := Condition, cost_item := CostItemID, cost_num := CostNum, attr := AttrT, desc := Desc, attr_by_career := CAttr} = Conf,
    CostItem = ?iif(CostItemID > 0, [{?AST_ITEM, [{CostItemID, CostNum}]}], []),
    ?iif(CostItemID > 0, lib_role_assets:check_items_enough(PS, CostItem), skip),
    #{max_lv := MaxLv} = lib_role_dungeon:get_dung_info(RoleID, ?DUNG_ID_SAVIOR),
    TopLv = conf_dungeon_lv:get_max_lv(?DUNG_ID_SAVIOR),
    RealMaxLv = ?iif(MaxLv >= TopLv, MaxLv, max(0, MaxLv - 1)),
    RealMaxLv >= Condition orelse erlang:throw({need_pass, Desc}),
    NewPersonal = Personal#{title_honor => NextTitleHonor},
    {_, CType, CValue} = lists:keyfind(Career, 1, CAttr),
    Attr = [{CType, CValue} | AttrT],
    Fight = lib_role_attr:calc_combat_power(Attr),
    NewRoleData = RoleData#{fight => Fight, attr => Attr},
    {ok, NewRoleData, NewPersonal, CostItem, NextTitleHonor}.

get_attr(RoleID) ->
    #{attr := Attr} = get_role_data(RoleID),
    Attr.

get_fight(RoleID) ->
    #{fight := Fight} = get_role_data(RoleID),
    Fight.

has_title(PS) ->
    #role_state{personal = Personal} = PS,
    #{title_honor := TitleHonor} = Personal,
    TitleHonor > 0.

set_role_data(_RoleId, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).
