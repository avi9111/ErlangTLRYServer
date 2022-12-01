%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     称号
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_title).
-author("Ryuu").

-include("role.hrl").
-include("title.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_406.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    activate/2,
    get_attr/1,
    get_fight/1,
    send_info/1,
    header_bin/2,
    wear_title/2,
    handle_info/2,
    refresh_title/2,
    get_role_data/1,
    is_title_exist/2
]).

%% -----------------------------------------------------------------------------

handle_info(check_expire_title, PS) ->
    check_expire_title(PS);
handle_info({add_title, TitleID, ExpireTime}, PS) ->
    add_role_title(PS, TitleID, ExpireTime);
handle_info({remove_title, TitleID}, PS) ->
    remove_role_title(PS, TitleID);
handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_, _) ->
    ignore.

do(40601, PS, _Req) ->
    send_info(PS);
%%do(40603, PS, #cs_title_activate{id = GID}) ->
%%    activate(PS, GID);
do(40605, PS, #cs_title_wear{id = ID}) ->
    wear_title(PS, ID);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc get title info
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{cur_title := Cur, titles := Titles} = RoleData,
    CltTitles = convert_titles(Titles, []),
    Rec = #sc_title_get_info{cur = Cur, titles = CltTitles},
    {ok, Bin} = prot_msg:encode_msg(40602, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_titles([], Acc) ->
    Acc;
convert_titles([Title | T], Acc) ->
    #{id := ID, expire_time := ExpiredTime, valid := Valid} = Title,
    CltTitle = #clt_title{id = ID, expire = ExpiredTime, valid = Valid},
    convert_titles(T, [CltTitle | Acc]).

%% @doc 激活称号
activate(PS, TitleID) ->
    case catch check_activate(PS, TitleID) of
        {ok, RoleID} ->
            svr_title:grant(RoleID, TitleID),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_activate(PS, TitleID) ->
    #role_state{id = RoleID, career = Career} = PS,
    Conf = conf_title:get(TitleID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_TITLE_NOT_FOUND}),
    #{career := NCareer} = Conf,
    NCareer =:= 0 orelse Career =:= NCareer orelse erlang:throw({error, ?RC_TITLE_CAREER_LIMIT}),
    RoleData = get_role_data(RoleID),
    #{titles := Titles} = RoleData,
    Title = map:keyfind(TitleID, id, Titles),
    case Title of
        #{expire_time := 0} -> erlang:throw({error, ?RC_TITLE_ALREADY_ACTIVATED});
        _ -> ok
    end,
    {ok, RoleID}.

%% @doc 佩戴、卸下称号
wear_title(PS, TitleID) ->
    #role_state{id = RoleID} = PS,
    case catch check_wear_title(RoleID, TitleID) of
        {ok, NewData} ->
            update_role_data(RoleID, NewData),
            Rec = #sc_title_wear{id = TitleID},
            {ok, Bin} = prot_msg:encode_msg(40606, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_title(PS, TitleID);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_wear_title(RoleID, TitleID) ->
    is_temp_title(TitleID) andalso erlang:throw({error, ?RC_TITLE_CANNOT_SWITCH_TEMP}),
    RoleData = get_role_data(RoleID),
    #{titles := Titles, cur_title := CurTitle} = RoleData,
    if
        TitleID =:= 0 ->
            CurTitle =/= 0 orelse erlang:throw({error, ?RC_TITLE_WEAR_NO_TITLE}),
            ok;
        true ->
            TitleID =:= CurTitle andalso erlang:throw({error, ?RC_TITLE_WEAR_SAME_TITLE}),
            Title = map:keyfind(TitleID, id, Titles),
            Title =/= false orelse erlang:throw({error, ?RC_TITLE_NOT_FOUND}),
            Now = time:unixtime(),
            #{expire_time := ExpireTime, valid := Valid} = Title,
            ExpireTime =:= 0 orelse ExpireTime > Now orelse erlang:throw({error, ?RC_TITLE_TITLE_EXPIRED}),
            Valid =:= ?TITLE_STATE_EXPIRED andalso erlang:throw({error, ?RC_TITLE_TITLE_EXPIRED})
    end,
    NewData = RoleData#{cur_title => TitleID},
    {ok, NewData}.

%% @doc 添加称号 [玩家进程]
add_role_title(PS, TitleID, ExpireTime) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{cur_title := CurTitle, titles := Titles} = RoleData,
    OldTitle = map:keyfind(TitleID, id, Titles),
    NewTitle = ?title#{id => TitleID, expire_time => ExpireTime, valid => ?TITLE_STATE_VALID},
    NewTitles = map:keystore(TitleID, id, Titles, NewTitle),
    {_Replace, NewID} = should_replace_title(OldTitle, CurTitle, TitleID),
    NewData = set_title_attr(RoleData#{cur_title => NewID, titles => NewTitles}),
    update_role_data(RoleID, NewData),
    start_expire_timer(NewData),
    CltTitle = #clt_title{id = TitleID, expire = ExpireTime, valid = 1},
    Rec = #sc_title_notify_new{title = CltTitle},
    {ok, Bin} = prot_msg:encode_msg(40607, Rec),
    lib_role_send:send_to_role(PS, Bin),
    refresh_title(PS, TitleID).

%% @doc 是否应该替换称号
should_replace_title(OldTitle, OldID, NewID) ->
    OldValid = is_title_valid(OldTitle, time:unixtime()),
    case OldValid of
        false -> should_replace_title2(OldID, NewID);
        _ -> {false, OldID}
    end.

should_replace_title2(0, NewID) ->
    {true, NewID};
should_replace_title2(OldID, NewID) ->
    CConf = conf_title:get(OldID),
    #{priority := CPriority} = CConf,
    NConf = conf_title:get(NewID),
    #{priority := NPriority} = NConf,
    case NPriority >= CPriority of
        true -> {true, NewID};
        _ -> {false, OldID}
    end.

%% @doc 移除玩家称号
remove_role_title(PS, TitleID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{cur_title := CurTitle, titles := Titles} = RoleData,
    NewTitles = map:keydelete(TitleID, id, Titles),
    Rec = #sc_title_notify_expire{titles = [TitleID]},
    {ok, Bin} = prot_msg:encode_msg(40608, Rec),
    lib_role_send:send_to_role(RoleID, Bin),
    NewTitle = init_select_title(CurTitle, NewTitles),
    NewData = set_title_attr(RoleData#{cur_title => NewTitle, titles => NewTitles}),
    update_role_data(RoleID, NewData),
    refresh_title(PS, NewTitle).

%% @doc 称号变化场景通知
refresh_title(PS, TitleID) ->
    #role_state{personal = Personal} = PS,
    #{title := OTitleID} = Personal,
    PS1 = PS#role_state{personal = Personal#{title => TitleID}},
    (OTitleID =/= TitleID orelse TitleID =:= ?TITLE_ID_SWORN) andalso begin
        notify_title_change(PS1, TitleID),
        lib_scene_api:update(title, PS1)
    end,
    lib_role_attr:refresh_combat_power(PS1).

notify_title_change(PS, TitleID) ->
    lib_scene_api:update(title, PS),
    #role_state{id = RoleID} = PS,
    Rec = #sc_title_notify_current{title = TitleID},
    {ok, Bin} = prot_msg:encode_msg(40609, Rec),
    lib_role_send:send_to_role(PS, Bin),
    {SwornTitle, Quality} = lib_role_sworn:get_sworn_name(RoleID, TitleID),
    ScenePkMsg = #sc_title_change{
        role_id = RoleID, title = TitleID, title_extra = SwornTitle, title_quality = Quality
    },
    {ok, BinData} = prot_msg:encode_msg(40610, ScenePkMsg),
    lib_scene_api:send_to_role_area_scene(PS, BinData).

%% -----------------------------------------------------------------------------
%% 过期检查Timer
%% -----------------------------------------------------------------------------

%% @doc 称号过期检查
start_expire_timer(RoleData) ->
    #{titles := Titles} = RoleData,
    del_expire_timer(),
    Fun = fun(#{valid := Valid, expire_time := ExpireTime}, Acc) ->
        case ExpireTime > 0 andalso Valid =:= ?TITLE_STATE_VALID
            andalso (Acc =:= -1 orelse ExpireTime < Acc)
        of
            true -> ExpireTime;
            _ -> Acc
        end
    end,
    MinTime = lists:foldl(Fun, -1, Titles),
    case MinTime of
        -1 ->
            0;
        _ ->
            Now = time:unixtime(),
            Span = erlang:max(MinTime - Now, 0),
            NRef = lib_role:mod_after(Span * 1000, ?MODULE, check_expire_title),
            set_expire_timer(NRef)
    end.

del_expire_timer() ->
    util:cancel_timer(erlang:erase({?MODULE, expire_timer})).

set_expire_timer(Ref) ->
    erlang:put({?MODULE, expire_timer}, Ref).

%% @doc 检查过期称号
check_expire_title(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{titles := Titles, cur_title := CurTitle} = RoleData,
    Now = time:unixtime(),
    {NewTitles, ExpireList} = filter_expire_title(Titles, Now),
    case ExpireList of
        [] ->
            start_expire_timer(RoleData);
        _ ->
            NewTitle = init_select_title(CurTitle, NewTitles),
            NewData = set_title_attr(RoleData#{
                cur_title => NewTitle, titles => NewTitles
            }),
            update_role_data(RoleID, NewData),
            start_expire_timer(NewData),
            handle_expired_title(RoleID, ExpireList, false),
            refresh_title(PS, NewTitle)
    end.

%% -----------------------------------------------------------------------------
%% Attr
%% -----------------------------------------------------------------------------

%% @doc 获取称号属性
get_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

%% @doc 计算称号属性
set_title_attr(RoleData) ->
    #{titles := Titles} = RoleData,
    Attr = calc_title_attr(Titles),
    Fight = lib_role_attr:calc_combat_power(Attr),
    RoleData#{attr => Attr, fight => Fight}.

calc_title_attr(Titles) ->
    calc_title_attr(Titles, []).

calc_title_attr([], Acc) ->
    lib_role_attr:merge_attr(Acc);
calc_title_attr([Title | T], Acc) ->
    #{id := ID, valid := Valid} = Title,
    case Valid of
        ?TITLE_STATE_VALID ->
            Conf = conf_title:get(ID),
            #{attr := ConfAttr} = Conf,
            calc_title_attr(T, ConfAttr ++ Acc);
        _ ->
            calc_title_attr(T, Acc)
    end.

%% -----------------------------------------------------------------------------
%% 其它
%% -----------------------------------------------------------------------------
%% @doc 是否已有此称号
is_title_exist(PS, TitleID) ->
    RoleData = get_role_data(PS#role_state.id),
    #{titles := Titles} = RoleData,
    Title = map:keyfind(TitleID, id, Titles),
    case Title of
        #{expire_time := 0} -> true;
        _ -> false
    end.

is_temp_title(TitleID) ->
    case conf_title:get(TitleID) of
        #{cate := ?TITLE_CATE_TEMP} ->
            true;
        _ ->
            false
    end.

%% @doc 检查并挑选称号
init_select_title(0, _Titles) ->
    0;
init_select_title(CurTitle, Titles) ->
    case map:keyfind(CurTitle, id, Titles) of
        #{valid := Valid} when Valid =/= ?TITLE_STATE_EXPIRED -> CurTitle;
        _ -> select_new_title(Titles)
    end.

select_new_title([]) ->
    0;
select_new_title(Titles) ->
    select_new_title(Titles, 0, 0).

select_new_title([], Title, _Priority) ->
    Title;
select_new_title([Title | T], BestID, BestPriority) ->
    #{id := TitleID, valid := Valid} = Title,
    Conf = conf_title:get(TitleID),
    #{priority := Priority} = Conf,
    if
        Valid =/= ?TITLE_STATE_EXPIRED andalso
            (BestID =:= 0 orelse
                (Priority > BestPriority) orelse
                (Priority =:= BestPriority andalso TitleID > BestID)) ->
            select_new_title(T, TitleID, Priority);
        true ->
            select_new_title(T, BestID, BestPriority)
    end.

%% @doc 过滤称号
filter_expire_title(Titles, Now) ->
    filter_expire_title(Titles, Now, [], []).

filter_expire_title([], _Now, ValidAcc, ExpiredAcc) ->
    {ValidAcc, ExpiredAcc};
filter_expire_title([Title | T], Now, ValidAcc, ExpiredAcc) ->
    #{expire_time := ExpireTime, valid := Valid} = Title,
    {NewValid, NewExpiredAcc} =
        case Valid =:= ?TITLE_STATE_VALID andalso
            ExpireTime =/= 0 andalso
            ExpireTime =< Now of
            true ->
                {?TITLE_STATE_EXPIRED, [Title | ExpiredAcc]};
            _ ->
                {Valid, ExpiredAcc}
        end,
    NewTitle = Title#{valid => NewValid},
    filter_expire_title(T, Now, [NewTitle | ValidAcc], NewExpiredAcc).

%% @doc 称号是否有效
is_title_valid(undefined, _Now) ->
    false;
is_title_valid(false, _Now) ->
    false;
is_title_valid(Title, Now) ->
    #{expire_time := ExpireTime, valid := Valid} = Title,
    Valid =:= ?TITLE_STATE_VALID andalso
        (ExpireTime =:= 0 orelse ExpireTime > Now).

%% @doc 处理过期称号
handle_expired_title(RoleID, ExpireList, Login) ->
    handle_expired_title(ExpireList, RoleID),
    (not Login) andalso begin
        IDList = [ID || #{id := ID} <- ExpireList],
        Rec = #sc_title_notify_expire{titles = IDList},
        {ok, Bin} = prot_msg:encode_msg(40608, Rec),
        lib_role_send:send_to_role(RoleID, Bin)
    end.

handle_expired_title([], _RoleID) ->
    ignore;
handle_expired_title([Title | T], RoleID) ->
    #{id := TitleID, expire_time := ExpireTime} = Title,
    send_title_expire_mail(RoleID, TitleID),
    ?DB:execute(io_lib:format(?SQL_DEL_ROLE_TITLE, [RoleID, TitleID, ExpireTime])),
    handle_expired_title(T, RoleID).

%% @doc 称号过期邮件
send_title_expire_mail(RoleID, TitleID) ->
    TempID = config:get_sys_config(title_expire_mail),
    case conf_title:get(TitleID) of
        #{name := Name} ->
            svr_mail:sys2p(RoleID, TempID, [Name], [], ?OPT_TITLE_EXPIRE);
        _ ->
            ignore
    end.

header_bin(RoleID, Header) ->
    Rec = #sc_title_header{role_id = RoleID, header = Header},
    {ok, Bin} = prot_msg:encode_msg(40611, Rec),
    Bin.

%% =============================================================================
%% 玩家数据
%% =============================================================================

%% @doc 初始化玩家数据
init(PS) ->
    #role_state{id = RoleID, personal = Personal} = PS,
    #{title := CurTitle} = Personal,
    SQLList = io_lib:format(?SQL_GET_ROLE_TITLE_LIST, [RoleID]),
    List = ?DB:get_all(SQLList),
    Fun1 = fun([TitleID, ExpireTime, Valid], Acc) ->
        Conf = conf_title:get(TitleID),
        case Conf =/= undefined of
            true ->
                Title = ?title#{id => TitleID, expire_time => ExpireTime, valid => Valid},
                [Title | Acc];
            _ ->
                Acc
        end
    end,
    Titles = lists:foldl(Fun1, [], List),
    RoleData = init_title_info(RoleID, CurTitle, Titles),
    #{cur_title := NewTitle} = RoleData,
    NewPS = PS#role_state{personal = Personal#{title => NewTitle}},
    {ok, NewPS}.

init_title_info(RoleID, CurTitle, Titles) ->
    Now = time:unixtime(),
    {NewTitles, ExpireList} = filter_expire_title(Titles, Now),
    NewCurTitle = init_select_title(CurTitle, NewTitles),
    ExpireList =/= [] andalso handle_expired_title(RoleID, ExpireList, true),
    RoleData = set_title_attr(?role_title#{
        role_id => RoleID, cur_title => NewCurTitle, titles => NewTitles,
        updated => ExpireList =/= []
    }),
    set_role_data(RoleID, RoleData),
    start_expire_timer(RoleData),
    RoleData.

save(PS) ->
    save_(PS).

%% @doc 保存玩家数据
save_(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    case Updated of
        true -> save_role_data(RoleID, RoleData);
        _ -> ignore
    end.

save_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => false},
    set_role_data(RoleID, NewData).

%% @doc 获取玩家数据
get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        M when is_map(M) -> M;
        _ -> ?role_title#{role_id => RoleID}
    end.

%% @doc 更新玩家数据
update_role_data(RoleID, Data) ->
    NewData = Data#{updated => true},
    set_role_data(RoleID, NewData).

%% @doc 设置玩家数据
set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).
