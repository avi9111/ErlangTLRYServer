%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_territory).
-author("Ryuu").

-include("common.hrl").
-include("territory.hrl").
-include("proto/prot_311.hrl").

%% API
-export([
    info/0,
    init/0,
    save/0,
    update/3,
    get_info/1,
    reset_round/0,
    auction_bonus/1,
    daily_auction/0,
    get_territory_info/0
]).

-define(territory_info, #{
    round => 0,
    territories => [],
    matches => [],
    version => erlang:make_ref()
}).

-define(territory, #{
    id => 0,
    win => 0,
    ref => 0,
    first => 0,
    guild => 0,
    bonus => []
}).

info() ->
    [].

init() ->
    WeekNum = week_num(),
    SQL = io_lib:format(?SQL_GET_TERRITORY, [WeekNum]),
    case db:get_row(SQL) of
        [Round, DbTerritories, DbMatches] ->
            Territories = type:convert_db_field(list, DbTerritories, []),
            Matches = type:convert_db_field(list, DbMatches, []),
            TerritoryInfo = ?territory_info#{
                week => WeekNum, round => Round, territories => Territories,
                matches => Matches
            };
        _ ->
            TerritoryInfo = ?territory_info#{}
    end,
    set_territory_info(TerritoryInfo).

save() ->
    TerritoryInfo = get_territory_info(),
    save(TerritoryInfo).

save(TerritoryInfo) ->
    #{week := WeekNum, round := Round, territories := Territories,
        matches := Matches} = TerritoryInfo,
    DbTerritories = type:term_to_bitstring(Territories),
    DbMatches = type:term_to_bitstring(Matches),
    SQL = io_lib:format(?SQL_SET_TERRITORY, [WeekNum, Round, DbTerritories, DbMatches]),
    db:execute(SQL).

reset_round() ->
    TerritoryInfo = next_match(#{round => 0}),
    set_territory_info(TerritoryInfo),
    lib_role_send:broadcast(make_info(TerritoryInfo)),
    save().

next_match(#{round := 0}) ->
    Top4 = shuffle([{8 + (Rank - 1) * 2, lib_guild:get_rank_guild(Rank)} || Rank <- lists:seq(1, 4)]),
    Next4 = shuffle([{2 * Rank - 1, lib_guild:get_rank_guild(Rank)} || Rank <- lists:seq(5, 8)]),
    Territories = init_territory(Top4 ++ Next4, [?territory#{id => ID} || ID <- lists:seq(1, 7)]),
    Matches = split_group(?TERRITORY_ROUND_1, Territories),
    ?territory#{
        week => week_num(), round => ?TERRITORY_ROUND_1, territories => Territories,
        matches => Matches, version => make_ref()
    };
next_match(#{round := Round} = Territory) when Round < ?TERRITORY_ROUND_3 ->
    #{territories := Territories} = Territory,
    Matches = split_group(Round + 1, Territories),
    Territory#{round => Round + 1, matches => Matches, version => make_ref()};
next_match(#{round := Round} = Territory) ->
    Territory#{round => Round + 1, matches => [], version => make_ref()}.

init_territory([], Acc) ->
    Acc;
init_territory([{ID, GuildID} | T], Acc) ->
    Ref = type:term_to_string(make_ref()),
    Territory = ?territory#{id => ID, ref => Ref, first => Ref, guild => GuildID},
    init_territory(T, [Territory | Acc]).

split_group(Round, Territories) ->
    List = lists:sublist(lists:seq(5 - Round, 4), 1, 2),
    split_group(List, Territories, 0, []).

split_group([], _Territories, _Group, Acc) ->
    Acc;
split_group([R | T], Territories, Group, Acc) ->
    List = filter_group(Territories, R),
    {NewGroup, NewAcc} = assign_group(lists:sort(List), Group, Acc),
    split_group(T, Territories, NewGroup, NewAcc).

filter_group(Territories, R) ->
    Fun = fun(Territory, Acc) ->
        #{id := ID, ref := Ref, first := Ref2} = Territory,
        case erlang:ceil(math:log2(ID + 1)) =:= R
            andalso Ref =:= Ref2 of
            true -> [{ID, Ref} | Acc];
            _ -> Acc
        end
    end,
    lists:foldl(Fun, [], Territories).

assign_group([], Group, Acc) ->
    {Group, Acc};
assign_group([{Red, RedRef}, {Blue, BlueRef} | T], Group, Acc) ->
    NewGroup = Group + 1,
    Quality = 5 - erlang:ceil(math:log2((Red + Blue) / 2)),
    NewAcc = [{NewGroup, Quality, RedRef, BlueRef} | Acc],
    assign_group(T, NewGroup, NewAcc).

shuffle(List) ->
    {Ranks, Guilds} = lists:unzip(List),
    lists:zip(Ranks, util:list_shuffle(Guilds)).

update(DVersion, Winners, GuildList) ->
    TerritoryInfo = lib_territory:get_territory_info(),
    #{round := Round, territories := Territories, version := Version} = TerritoryInfo,
    case DVersion =:= Version of
        true ->
            NewTerritories = arrange(Round, update_guild(GuildList, Winners, Territories)),
            NewTerritoryInfo = next_match(TerritoryInfo#{territories => NewTerritories}),
            set_territory_info(NewTerritoryInfo),
            save(NewTerritoryInfo),
            settle_auction(NewTerritoryInfo),
            lib_role_send:broadcast(make_info(NewTerritoryInfo));
        _ ->
            ignore
    end.

update_guild([], _Winners, Territories) ->
    Territories;
update_guild([{Ref, Ratios} | T], Winners, Territories) ->
    Territory = map:keyfind(Ref, ref, Territories),
    #{win := Win} = Territory,
    NewWin = ?iif(lists:member(Ref, Winners), Win + 1, Win),
    NewTerritory = Territory#{win => NewWin, bonus => Ratios},
    NewTerritories = map:keystore(Ref, ref, Territories, NewTerritory),
    update_guild(T, Winners, NewTerritories).

arrange(Round, Territories) ->
    List = lists:reverse(lists:seq(1, Round)),
    case Round =:= ?TERRITORY_ROUND_3 of
        true ->
            arrange2(List, Territories);
        _ ->
            arrange3(conf_territory:get_by_quality(1), 0, arrange2(List, Territories))
    end.

arrange2([], Territories) ->
    Territories;
arrange2([Q | T], Territories) ->
    IDList = conf_territory:get_by_quality(Q),
    arrange2(T, arrange3(IDList, Q, Territories)).

arrange3([], _Q, Territories) ->
    Territories;
arrange3([ID | T], Q, Territories) ->
    case map:keyfind(ID, id, Territories) of
        #{ref := 0} ->
            case search(lists:seq(1, erlang:ceil(math:log2(ID + 1))), ID, Q, Territories) of
                TID when TID > 0 ->
                    arrange3(T, Q, switch(TID, ID, Territories));
                _ ->
                    arrange3(T, Q, Territories)
            end;
        _ ->
            arrange3(T, Q, Territories)
    end.

search([], _ID, _Q, _Territories) ->
    0;
search([D | T], ID, Q, Territories) ->
    L = erlang:trunc(floor(ID / math:pow(2, D - 1)) * math:pow(2, D)),
    H = erlang:trunc(floor(ID / math:pow(2, D - 1) + 1) * math:pow(2, D) - 1),
    case search2(lists:seq(L, H), Q, Territories) of
        [] -> search(T, ID, Q, Territories);
        C -> C
    end.

search2([], _Q, _Territories) ->
    [];
search2([ID | T], Q, Territories) ->
    case map:keyfind(ID, id, Territories) of
        #{win := W} when W =:= Q -> ID;
        _ -> search2(T, Q, Territories)
    end.

switch(SID, TID, Territories) ->
    STerritory = map:keyfind(SID, id, Territories),
    TTerritory = map:keyfind(TID, id, Territories),
    #{first := _SFirst, ref := SRef, guild := SGuildID, bonus := SBonus, win := SWin} = STerritory,
    #{first := TFirst, ref := TRef, guild := TGuildID, bonus := _TBonus, win := _TWin} = TTerritory,
    (TGuildID =:= 0 andalso TRef =:= 0) orelse erlang:throw({error, bug}),
    NewTFirst = ?iif(TFirst =/= 0, TFirst, SRef),
    NewTTerritory = TTerritory#{guild => SGuildID, bonus => SBonus, ref => SRef, first => NewTFirst, win => SWin},
    NewSTerritory = STerritory#{guild => 0, bonus => [], ref => 0, win => 0},
    Territories1 = map:keystore(SID, id, Territories, NewSTerritory),
    map:keystore(TID, id, Territories1, NewTTerritory).

daily_auction() ->
    TerritoryInfo = get_territory_info(),
    #{territories := Territories} = TerritoryInfo,
    auction(Territories, daily_auction).

settle_auction(TerritoryInfo) ->
    #{territories := Territories} = TerritoryInfo,
    auction(Territories, auction).

auction([], _F) ->
    ok;
auction([#{id := ID, guild := GuildID, bonus := Ratios} | T], F) ->
    case lib_guild:get_guild_info(GuildID) =/= undefined
        andalso conf_territory:get(ID) of
        #{} = Conf ->
            Groups = maps:get(F, Conf, []),
            Items = auction_items(Groups, []),
            lib_auction_util:territory_auction(GuildID, Ratios, Items);
        _ ->
            ignore
    end,
    auction(T, F).

auction_items([], Acc) ->
    Acc;
auction_items([{ItemID, Ratios} | T], Acc) ->
    {Num, _} = util:rand_by_weight(Ratios, 2),
    case Num of
        0 -> NewAcc = Acc;
        _ -> NewAcc = lists:duplicate(Num, ItemID) ++ Acc
    end,
    auction_items(T, NewAcc).

auction_bonus(RoleList) ->
    SortList = lists:reverse(lists:sort([{Score, RoleID} || {RoleID, Score} <- RoleList])),
    SortRole = [RoleID || {_, RoleID} <- SortList],
    auction_bonus(SortRole, 1, []).

auction_bonus([], _Rank, Acc) ->
    Acc;
auction_bonus([RoleID | T], Rank, Acc) ->
    Ratio = conf_territory_bonus:get_ratio(Rank),
    auction_bonus(T, Rank + 1, [{RoleID, Ratio} | Acc]).

get_info(RoleID) ->
    TerritoryInfo = get_territory_info(),
    lib_role_send:send_to_role(RoleID, make_info(TerritoryInfo)).

make_info(TerritoryInfo) ->
    #{round := Round, territories := Territories, matches := Matches} = TerritoryInfo,
    Rec = #sc_territory_info{
        round = Round,
        territories = convert_territories(Territories, []),
        matches = convert_matches(Matches, Territories, [])
    },
    {ok, Bin} = prot_msg:encode_msg(31102, Rec),
    Bin.

convert_territories([], Acc) ->
    Acc;
convert_territories([Territory | T], Acc) ->
    #{id := ID, guild := GuildID} = Territory,
    Rec = {ID, GuildID, lib_guild:get_guild_name(GuildID)},
    convert_territories(T, [Rec | Acc]).

convert_matches([], _Territories, Acc) ->
    Acc;
convert_matches([{_, _, RedRef, BlueRef} | T], Territories, Acc) ->
    #{id := RedID} = map:keyfind(RedRef, ref, Territories),
    #{id := BlueID} = map:keyfind(BlueRef, ref, Territories),
    Rec = {RedID, BlueID},
    convert_matches(T, Territories, [Rec | Acc]).

week_num() ->
    {D, _} = erlang:localtime(),
    {Y, W} = calendar:iso_week_number(time:add_days(D, 2)),
    Y * 100 + W.

get_territory_info() ->
    util:get_ets(?ETS_TERRITORY, territory).

set_territory_info(TerritoryInfo) ->
    util:put_ets(?ETS_TERRITORY, territory, TerritoryInfo).
