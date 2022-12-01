%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     结婚
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_marriage).
-author("Ryuu").

-include("rank.hrl").
-include("title.hrl").
-include("assets.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("marriage.hrl").
-include("ret_code.hrl").
-include("proto/prot_416.hrl").

%% API
-export([
    info/0,
    init/0,
    marry/2,
    invite/2,
    confirm/2,
    request/1,
    divorce/1,
    add_love/3,
    response/3,
    permanent/0,
    is_married/1,
    is_married/2,
    get_role_data/1,
    get_marry_info/1,
    get_love_value/1,
    get_rank_field/1
]).

info() ->
    [
    ].

init() ->
    load(),
    timer:send_interval(30 * 60 * 1000, self(), permanent),
    ok.

invite(RoleID, TargetID) ->
    case catch check_invite(RoleID, TargetID) of
        {ok, RoleData, RoleName} ->
            update_role_data(RoleID, RoleData),
            Rec1 = #sc_marry_invite{id = TargetID},
            {ok, Bin1} = prot_msg:encode_msg(41604, Rec1),
            lib_role_send:send_to_role(RoleID, Bin1),
            Rec2 = #sc_marry_notify_invite{id = RoleID, name = RoleName},
            {ok, Bin2} = prot_msg:encode_msg(41607, Rec2),
            lib_role_send:send_to_role(TargetID, Bin2);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_invite(RoleID, TargetID) ->
    RoleData = get_role_data(RoleID),
    #{last_invite := LastInvite, mate_id := MateID} = RoleData,
    MateID =:= 0 orelse erlang:throw({error, ?RC_MARRY_ROLE_HAS_MATE}),
    InviteCD = config:get_sys_config(marry_invite_cd),
    Now = time:unixtime(),
    Now - LastInvite > InviteCD orelse erlang:throw({error, ?RC_MARRY_INVITE_IN_CD}),
    lib_role:is_online(TargetID) orelse erlang:throw({error, ?RC_MARRY_TARGET_NOT_ONLINE}),
    RoleBase = lib_cache:get_role_base(RoleID),
    #{gender := RGender, level := RLevel, name := RName} = RoleBase,
    TargetBase = lib_cache:get_role_base(TargetID),
    #{gender := TGender, level := TLevel} = TargetBase,
    RGender =/= TGender orelse erlang:throw({error, ?RC_MARRY_SAME_GENDER}),
    OpenLv = lib_func_util:get_marry_open_lv(),
    RLevel >= OpenLv orelse erlang:throw({error, ?RC_MARRY_SELF_LV_LIMIT}),
    TLevel >= OpenLv orelse erlang:throw({error, ?RC_MARRY_TARGET_LV_LIMIT}),
    lib_friend:is_friend(RoleID, TargetID) orelse erlang:throw({error, ?RC_MARRY_NOT_FRIEND}),
    NewData = RoleData#{invite => TargetID, last_invite => Now},
    {ok, NewData, RName}.

response(RoleID, TargetID, Opt) ->
    case catch check_response(RoleID, TargetID, Opt) of
        agree ->
            notify_response_resp(RoleID, TargetID, Opt),
            lib_role:mod_info(TargetID, lib_role_marriage, {marry, RoleID});
        reject ->
            notify_response_resp(RoleID, TargetID, Opt);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_response(RoleID, TargetID, Opt) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := RMateID} = RoleData,
    case Opt of
        ?MARRY_RESP_AGREE ->
            RMateID =:= 0 orelse erlang:throw({error, ?RC_MARRY_ROLE_HAS_MATE}),
            TargetData = get_role_data(TargetID),
            #{mate_id := TMateID, invite := Invite} = TargetData,
            TMateID =:= 0 orelse erlang:throw({error, ?RC_MARRY_TARGET_HAS_MATE}),
            Invite =:= RoleID orelse erlang:throw({error, ?RC_MARRY_INVITE_INVALID}),
            agree;
        _ ->
            reject
    end.

notify_response_resp(RoleID, TargetID, Opt) ->
    Rec1 = #sc_marry_response{id = TargetID, opt = Opt},
    {ok, Bin1} = prot_msg:encode_msg(41606, Rec1),
    lib_role_send:send_to_role(RoleID, Bin1),
    Rec2 = #sc_marry_notify_response{id = RoleID, opt = Opt},
    {ok, Bin2} = prot_msg:encode_msg(41608, Rec2),
    lib_role_send:send_to_role(TargetID, Bin2).

marry(RoleID, TargetID) ->
    case catch check_marry(RoleID, TargetID) of
        {ok, MarryID, Marriage, RoleID, RoleData, TargetID, TargetData, RumorArgs} ->
            marry_db(Marriage, RoleData, TargetData),
            update_marry_info(MarryID, Marriage),
            update_role_data(RoleID, RoleData),
            update_role_data(TargetID, TargetData),
            lib_role:mod_info(TargetID, lib_role_marriage, {married, MarryID, RoleID}),
            lib_role:mod_info(RoleID, lib_role_marriage, {married, MarryID, TargetID}),
            [RName, TName] = RumorArgs,
            Rec2 = #sc_marry_notify_couple{id = RoleID, name = TName},
            {ok, Bin2} = prot_msg:encode_msg(41609, Rec2),
            Rec3 = #sc_marry_notify_couple{id = TargetID, name = RName},
            {ok, Bin3} = prot_msg:encode_msg(41609, Rec3),
            lib_role_send:send_to_role(RoleID, Bin3),
            lib_role_send:send_to_role(TargetID, Bin2),
            Rumor = config:get_sys_config(marry_rumor),
            svr_rumor:publish(world, Rumor, RumorArgs),
            svr_title:grant(RoleID, ?TITLE_ID_MARRY),
            svr_title:grant(TargetID, ?TITLE_ID_MARRY),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_marry(RoleID, TargetID) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := RMateID, invite := Invite} = RoleData,
    RMateID =:= 0 orelse erlang:throw({error, ?RC_MARRY_ROLE_HAS_MATE}),
    TargetData = get_role_data(TargetID),
    #{mate_id := TMateID} = TargetData,
    TMateID =:= 0 orelse erlang:throw({error, ?RC_MARRY_TARGET_HAS_MATE}),
    Invite =:= TargetID orelse erlang:throw({error, ?RC_MARRY_INVITE_INVALID}),
    RoleBase = lib_cache:get_role_base(RoleID),
    #{gender := RGender, name := RName} = RoleBase,
    TargetBase = lib_cache:get_role_base(TargetID),
    #{gender := TGender, name := TName} = TargetBase,
    RGender =/= TGender orelse erlang:throw({error, ?RC_MARRY_SAME_GENDER}),
    MarryID = svr_generator:gen_marry_id(),
    RumorArgs = [RName, TName],
    Now = time:unixtime(),
    NRoleData = RoleData#{marry_id => MarryID, mate_id => TargetID, marry_time => Now, invite => 0},
    NTargetData = TargetData#{marry_id => MarryID, mate_id => RoleID, marry_time => Now, invite => 0},
    Marriage = ?marriage#{
        id => MarryID, male_id => RoleID, female_id => TargetID,
        couples => [RoleID, TargetID], marry_time => Now
    },
    {ok, MarryID, Marriage, RoleID, NRoleData, TargetID, NTargetData, RumorArgs}.

request(RoleID) ->
    case catch check_request(RoleID) of
        {ok, MarryID, Marriage, MateID} ->
            update_marry_info(MarryID, Marriage),
            Rec2 = #sc_marry_notify_request{},
            {ok, Bin2} = prot_msg:encode_msg(41615, Rec2),
            lib_role_send:send_to_role(MateID, Bin2),
            ok;
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_request(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := MateID, marry_id := MarryID} = RoleData,
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    Marriage = get_marry_info(MarryID),
    Now = time:unixtime(),
    NewMarriage = Marriage#{divorce => {RoleID, Now}},
    {ok, MarryID, NewMarriage, MateID}.

confirm(RoleID, Opt) ->
    case catch check_confirm(RoleID, Opt) of
        {ok, MateID} when Opt =:= ?MARRY_RESP_AGREE ->
            lib_role:mod_info(MateID, lib_role_marriage, divorce),
            confirm_resp(RoleID, MateID, Opt);
        {ok, _MateID} ->
            confirm_resp(RoleID, 0, Opt);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_confirm(RoleID, _Opt) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := MateID, marry_id := MarryID} = RoleData,
    MateID > 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    Now = time:unixtime(),
    Marriage = get_marry_info(MarryID),
    #{divorce := Divorce} = Marriage,
    case Divorce of
        {MateID, Time} when Now - Time < 30 ->
            ok;
        _ ->
            erlang:throw({error, ?RC_MARRY_NO_DIVORCE_REQ})
    end,
    {ok, MateID}.

confirm_resp(RoleID, MateID, Opt) ->
    Rec1 = #sc_marry_confirm{opt = Opt},
    {ok, Bin1} = prot_msg:encode_msg(41614, Rec1),
    lib_role_send:send_to_role(RoleID, Bin1),
    MateID > 0 andalso begin
        Rec2 = #sc_marry_notify_confirm{opt = Opt},
        {ok, Bin2} = prot_msg:encode_msg(41616, Rec2),
        lib_role_send:send_to_role(MateID, Bin2)
    end.

divorce(RoleID) ->
    case catch check_divorce(RoleID) of
        {ok, MarryID, RoleID, RoleData, TargetID, TargetData, MailArgs} ->
            divorce_db(MarryID, RoleData, TargetData),
            update_role_data(RoleID, RoleData),
            update_role_data(TargetID, TargetData),
            del_marry_info(MarryID),
            lib_role:mod_info(TargetID, lib_role_marriage, {divorced, RoleID}),
            lib_role:mod_info(RoleID, lib_role_marriage, {divorced, TargetID}),
            Rec1 = #sc_marry_divorce{},
            {ok, Bin1} = prot_msg:encode_msg(41612, Rec1),
            lib_role_send:send_to_role(RoleID, Bin1),
            Rec2 = #sc_marry_notify_divorce{},
            {ok, Bin2} = prot_msg:encode_msg(41617, Rec2),
            lib_role_send:send_to_role(TargetID, Bin2),
            Time = time:date_to_iso_string(),
            [begin
                svr_mail:sys2p(RID, MailID, [Name, Time], 0, ?OPT_MARRY_DIVORCE)
            end || {RID, MailID, Name} <- MailArgs],
            svr_rank:delete_rank(?RANK_LOVE_VALUE, MarryID),
            svr_title:deprive(RoleID, ?TITLE_ID_MARRY),
            svr_title:deprive(TargetID, ?TITLE_ID_MARRY),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_divorce(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := RMateID, marry_id := MarryID} = RoleData,
    RMateID =/= 0 orelse erlang:throw({error, ?RC_MARRY_HAS_NO_MATE}),
    TargetData = get_role_data(RMateID),
    #{mate_id := TMateID} = TargetData,
    TMateID =:= RoleID orelse erlang:throw({error, ?RC_MARRY_NOT_SAME_MATE}),
    RoleName = lib_cache:get_role_name(RoleID),
    MateName = lib_cache:get_role_name(RMateID),
    NRoleData = RoleData#{mate_id => 0, marry_id => 0},
    NTargetData = TargetData#{mate_id => 0, marry_id => 0},
    {MailID1, MailID2} = config:get_sys_config(marry_divorce_mail),
    MailArgs = [{RoleID, MailID1, MateName}, {RMateID, MailID2, RoleName}],
    {ok, MarryID, RoleID, NRoleData, RMateID, NTargetData, MailArgs}.

add_love(MarryID, Val, OpType) ->
    Marriage = get_marry_info(MarryID),
    is_map(Marriage) andalso begin
        #{love_value := CurVal, couples := Couples} = Marriage,
        NewVal = CurVal + Val,
        NewMarriage = Marriage#{love_value => NewVal},
        [lib_role_assets:async_add_items(RoleID, [{?AST_LOVE_VALUE, Val}], OpType) || RoleID <- Couples],
        update_marry_info(MarryID, NewMarriage),
        svr_rank:update_rank(?RANK_LOVE_VALUE, MarryID, ?rank_love_value#{
            key => MarryID, love_value => NewVal, time => time:unixtime()
        }),
        Rec = #sc_marry_love_value{love_value = NewVal},
        {ok, Bin} = prot_msg:encode_msg(41618, Rec),
        lib_role_send:broadcast(Couples, Bin)
    end.

%% -----------------------------------------------------------------------------

load() ->
    load_marriage(),
    load_all_roles(),
    ok.

load_marriage() ->
    List = db:get_all(?SQL_GET_MARRIAGE),
    Fun = fun([ID, MaleID, FemaleID, LoveValue, MarryTime, IsOpenHall, IsParade]) ->
        Marriage = ?marriage#{
            id => ID, couples => [MaleID, FemaleID], love_value => LoveValue,
            marry_time => MarryTime, male_id => MaleID, female_id => FemaleID,
            is_open_hall => IsOpenHall, is_parade => IsParade
        },
        set_marry_info(ID, Marriage)
    end,
    lists:foreach(Fun, List).

load_all_roles() ->
    List = db:get_all(?SQL_GET_MARRIAGE_ROLE),
    Fun = fun([RoleID, MarryID, MateID, MarryTimes]) ->
        RoleData = ?marriage_role#{
            role_id => RoleID, marry_id => MarryID, mate_id => MateID,
            marry_times => MarryTimes
        },
        set_role_data(RoleID, RoleData)
    end,
    lists:foreach(Fun, List).

permanent() ->
    Roles = ets:foldl(fun({RoleID, _}, Acc) ->
        RoleData = get_role_data(RoleID),
        [role_fields(RoleData) | Acc]
    end, [], ?ETS_MARRIAGE_ROLE_U),
    Marriages = ets:foldl(fun({ID, _}, Acc) ->
        Marry = get_marry_info(ID),
        [marry_fields(Marry) | Acc]
    end, [], ?ETS_MARRIAGE_U),
    case db:transaction(fun() -> permanent_db(Roles, Marriages) end) of
        ok ->
            util:cls_ets(?ETS_MARRIAGE_ROLE_U),
            util:cls_ets(?ETS_MARRIAGE_U);
        R ->
            R
    end.

permanent_db(Roles, Marriages) ->
    db:insert_values(?SQL_SET_MARRIAGE_ROLE2, ?SQL_SET_MARRIAGE_ROLE3, Roles),
    db:insert_values(?SQL_SET_MARRIAGE2, ?SQL_SET_MARRIAGE3, Marriages),
    ok.

role_fields(RoleData) ->
    #{role_id := RoleID, marry_id := MarryID, mate_id := MateID,
        marry_times := MarryTimes} = RoleData,
    [RoleID, MarryID, MateID, MarryTimes].

marry_fields(Marry) ->
    #{id := MarryID, male_id := MaleID, female_id := FemaleID,
        love_value := LoveValue, marry_time := MarryTime, is_open_hall := IsOpenHall,
        is_parade := IsParade
    } = Marry,
    [MarryID, MaleID, FemaleID, LoveValue, MarryTime, IsOpenHall, IsParade].

marry_db(Marriage, RoleData, MateData) ->
    ok = db:transaction(fun() ->
        #{id := MarryID} = Marriage,
        #{role_id := RoleID} = RoleData,
        #{role_id := MateID} = MateData,
        permanent_db([role_fields(RoleData), role_fields(MateData)], [marry_fields(Marriage)]),
        log_marry(RoleID, MateID, MarryID),
        ok
    end).

log_marry(RoleID, MateID, MarryID) ->
    LogSQL = io_lib:format(?SQL_LOG_MARRIAGE, [RoleID, MateID, MarryID]),
    db:execute(LogSQL).

divorce_db(MarryID, RoleData, MateData) ->
    ok = db:transaction(fun() ->
        #{role_id := RoleID} = RoleData,
        #{role_id := MateID} = MateData,
        permanent_db([role_fields(RoleData), role_fields(MateData)], []),
        db:execute(io_lib:format(?SQL_DEL_MARRIAGE, [MarryID])),
        log_divorce(RoleID, MateID, MarryID),
        ok
    end).

log_divorce(RoleID, MateID, MarryID) ->
    LogSQL = io_lib:format(?SQL_LOG_DIVORCE, [RoleID, MateID, MarryID]),
    db:execute(LogSQL),
    ok.

%% -----------------------------------------------------------------------------

is_married(RoleID, TargetRoleID) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := RMateID} = RoleData,
    TargetRoleID =:= RMateID.

is_married(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{mate_id := MateID} = RoleData,
    MateID > 0.

get_love_value(MarryID) ->
    case get_marry_info(MarryID) of
        #{love_value := LoveValue} -> LoveValue;
        _ -> 0
    end.

get_rank_field(MarryID) ->
    Marriage = get_marry_info(MarryID),
    case Marriage of
        #{couples := [RoleID, MateID]} ->
            RoleBase = lib_cache:get_role_base(RoleID),
            MateBase = lib_cache:get_role_base(MateID),
            #{name := RName, career := RCareer, personal := RPersonal, gender := RSex} = RoleBase,
            #{title_honor := RTitle} = RPersonal,
            #{name := MName, career := MCareer, personal := MPersonal} = MateBase,
            #{title_honor := MTitle} = MPersonal,
            if
                RSex =/= ?FEMALE ->
                    [?STR(RoleID), RName, ?STR(RCareer), ?STR(RTitle), ?STR(MateID), MName, ?STR(MCareer), ?STR(MTitle)];
                true ->
                    [?STR(MateID), MName, ?STR(MCareer), ?STR(MTitle), ?STR(RoleID), RName, ?STR(RCareer), ?STR(RTitle)]
            end;
        _ ->
            ["", "", "", "", "", "", "", ""]
    end.

%% -----------------------------------------------------------------------------

get_marry_info(ID) ->
    case util:get_ets(?ETS_MARRIAGE, ID) of
        MarryInfo when is_map(MarryInfo) ->
            MarryInfo;
        _ ->
            undefined
    end.

update_marry_info(ID, Info) ->
    util:put_ets(?ETS_MARRIAGE_U, ID, 1),
    set_marry_info(ID, Info).

set_marry_info(ID, Info) ->
    util:put_ets(?ETS_MARRIAGE, ID, Info).

del_marry_info(ID) ->
    util:del_ets(?ETS_MARRIAGE, ID),
    util:del_ets(?ETS_MARRIAGE_U, ID).

get_role_data(RoleID) ->
    case util:get_ets(?ETS_MARRIAGE_ROLE, RoleID) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?marriage_role#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    util:put_ets(?ETS_MARRIAGE_ROLE_U, RoleID, 1),
    set_role_data(RoleID, RoleData).

set_role_data(RoleID, RoleData) ->
    util:put_ets(?ETS_MARRIAGE_ROLE, RoleID, RoleData),
    RoleData.
