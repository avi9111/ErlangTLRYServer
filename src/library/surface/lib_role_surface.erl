%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     外观套装
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_surface).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("surface.hrl").
-include("proto/prot_417.hrl").

%% API
-export([
    do/3,
    init/1,
    event/2,
    get_attr/1,
    get_fight/1,
    send_info/1,
    handle_info/2,
    get_role_data/1
]).

handle_info(init_refresh, PS) ->
    refresh(PS, false);
handle_info(_Info, _PS) ->
    ignore.

event(PS, {active_fashion, _}) ->
    refresh(PS, true);
event(PS, {active_growup, _ID}) ->
    refresh(PS, true);
event(_PS, _Event) ->
    ignore.

do(41701, PS, _Req) ->
    send_info(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取信息
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{surfaces := Surfaces} = RoleData,
    Rec = #sc_surface_info{
        surfaces = convert_surfaces(Surfaces)
    },
    {ok, Bin} = prot_msg:encode_msg(41702, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_surfaces(Surfaces) ->
    convert_surfaces(Surfaces, []).

convert_surfaces([], Acc) ->
    Acc;
convert_surfaces([Surface | T], Acc) ->
    #{id := ID, num := Num, fashion := Fashion, mount := Mount,
        wing := Wing, god := God} = Surface,
    CltSurface = #clt_surface{
        id = ID, num = Num, fashion = Fashion, mount = Mount, wing = Wing,
        god = God
    },
    convert_surfaces(T, [CltSurface | Acc]).

%% @doc 刷新套装数据
refresh(PS, Notify) ->
    #role_state{id = RoleID} = PS,
    IDList = conf_surface_suit:get_ids(),
    RoleData = get_role_data(RoleID),
    #{surfaces := Surfaces} = RoleData,
    {NewSurfaces, Attrs, ChangeList} = update_suits(IDList, RoleID, Surfaces, [], []),
    Fight = lib_role_attr:calc_combat_power(Attrs),
    NewData = RoleData#{surfaces => NewSurfaces, attr => Attrs, fight => Fight},
    update_role_data(RoleID, NewData),
    Notify andalso begin
        Rec = #sc_surface_change{
            surfaces = convert_surfaces(ChangeList)
        },
        {ok, Bin} = prot_msg:encode_msg(41703, Rec),
        lib_role_send:send_to_role(PS, Bin)
    end.

update_suits([], _RoleID, Surfaces, AttrAcc, ChangeAcc) ->
    {Surfaces, AttrAcc, ChangeAcc};
update_suits([ID | T], RoleID, Surfaces, AttrAcc, ChangeAcc) ->
    Conf = conf_surface_suit:get(ID),
    Surface = map:keyfind(ID, id, Surfaces, ?surface#{id => ID}),
    NewSurface = update_suit(?SURFACE_SUIT, RoleID, Conf, Surface),
    NewChangeAcc = ?iif(Surface =/= NewSurface, [NewSurface | ChangeAcc], ChangeAcc),
    NewSurfaces = map:keystore(ID, id, Surfaces, NewSurface),
    #{attr := Attr} = NewSurface,
    NewAttrAcc = Attr ++ AttrAcc,
    update_suits(T, RoleID, NewSurfaces, NewAttrAcc, NewChangeAcc).

update_suit([], _RoleID, Conf, Surface) ->
    #{num := Num} = Surface,
    Surface#{attr => active_attr(Num, Conf)};
update_suit([F | T], RoleID, Conf, Surface) ->
    case maps:get(F, Surface, 0) > 0 of
        true ->
            update_suit(T, RoleID, Conf, Surface);
        _ ->
            #{num := Num} = Surface,
            CID = maps:get(F, Conf),
            Active = is_active(F, RoleID, CID),
            NewSurface = ?iif(Active, maps:put(F, CID, Surface#{num => Num + 1}), Surface),
            update_suit(T, RoleID, Conf, NewSurface)
    end.

is_active(fashion, RoleID, CID) ->
    lib_role_fashion:is_fashion_active(RoleID, CID);
is_active(mount, _RoleID, _CID) ->
    false;
is_active(wing, _RoleID, _CID) ->
    false;
is_active(god, _RoleID, _CID) ->
    false.

active_attr(2, #{attr2 := Attr}) ->
    Attr;
active_attr(3, #{attr3 := Attr}) ->
    Attr;
active_attr(Num, #{attr4 := Attr}) when Num >= 4 ->
    Attr;
active_attr(_Num, _Conf) ->
    [].

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 外观套装属性
get_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 初始化
init(_PS) ->
    lib_role:mod_after(0, ?MODULE, init_refresh).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_surface#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
