%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     排行榜
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_rank).
-author("Ryuu").

-include("rank.hrl").
-include("common.hrl").
-include("guild.hrl").
-include("proto/prot_405.hrl").

%% API
-export([
    info/1,
    get_rank/3,
    get_rank/4,
    clear_rank/1,
    reset_rank/2,
    delete_rank/2,
    update_rank/3,
    refresh_rank/1,
    get_rank_info/1,
    init_all_rank/0,
    save_all_rank/0,
    timer_refresh/1,
    get_role_target_rank/3,
    role_delete/2
]).


%% -----------------------------------------------------------------------------
%% 请求处理
%% -----------------------------------------------------------------------------

%% @doc 排行榜信息
info(RankID) ->
    RankInfo = get_rank_info(RankID),
    #{rank := Rank, data := Data} = RankInfo,
    [
        {data, Data},
        {rank, Rank}
    ].

%% @doc 启动加载数据
init_all_rank() ->
    lists:foreach(fun init_rank/1, conf_rank:get_ids()),
    timer:send_interval(30 * 60 * 1000, self(), permanent),
    erlang:send_after(1000, self(), refresh_rank).

init_rank(RankID) when is_integer(RankID) ->
    init_rank(conf_rank:get(RankID));
init_rank(Conf) when is_map(Conf) ->
    #{id := RankRankID} = Conf,
    List = load_rank_data(RankRankID, Conf),
    init_rank_info(Conf, List),
    sup_rank_svr:start_child(RankRankID);
init_rank(_Conf) ->
    ignore.

%% @doc 保存排行榜
save_all_rank() ->
    lists:foreach(fun refresh_rank/1, conf_rank:get_ids()).

save_rank(RankInfo) ->
    #{id := RankID, rank := RankList} = RankInfo,
    ?TRY_CATCH(save_rank_item(RankID, RankList)).

%% @doc 清除排行榜
clear_rank(RankID) ->
    reset_rank(RankID, []).

%% @doc 重置排行榜
reset_rank(RankID, RankList) when is_integer(RankID) ->
    reset_rank(conf_rank:get(RankID), RankList);
reset_rank(Conf, RankList) when is_map(Conf) ->
    #{id := RankID} = Conf,
    init_rank_info(Conf, RankList),
    refresh_rank(RankID);
reset_rank(_RankID, _RankList) ->
    ignore.

init_rank_info(Conf, List) ->
    #{id := RankID, cap := Cap} = Conf,
    {Data, Tree} = init_rank_list(List, RankID, dict:new(), []),
    RankInfo = ?rank_info#{
        id => RankID, cap => Cap, data => Data, tree => Tree
    },
    set_rank_info(RankID, RankInfo).

init_rank_list([], _RankID, DataAcc, TreeAcc) ->
    {DataAcc, gb_trees:from_orddict(lists:sort(TreeAcc))};
init_rank_list([RankItem | T], RankID, DataAcc, TreeAcc) ->
    #{key := Key} = RankItem,
    NewDataAcc = dict:store(Key, RankItem, DataAcc),
    NewTreeAcc = [{tree_key(RankID, RankItem), Key} | TreeAcc],
    init_rank_list(T, RankID, NewDataAcc, NewTreeAcc).

%% @doc 更新排行榜
update_rank(RankID, Key, Val) ->
    RankInfo = get_rank_info(RankID),
    NewRankInfo = update(Key, Val, RankInfo),
    set_rank_info(RankID, NewRankInfo).

update(Key, RankItem, RankData) ->
    #{id := RankRankID, data := Data, tree := Tree, cap := Cap} = RankData,
    OldVal = util:dict_find(Key, Data),
    OTKey = tree_key(RankRankID, OldVal),
    NTKey = tree_key(RankRankID, RankItem),
    case update(OTKey, NTKey, Key, Tree, Cap) of
        NewTree when NewTree =/= Tree ->
            NewData = dict:store(Key, RankItem, Data),
            RankData#{data => NewData, tree => NewTree};
        _ ->
            RankData
    end.

update(OldKey, NewKey, NewVal, Tree, Cap) ->
    case gb_trees:is_defined(OldKey, Tree) of
        true ->
            case NewKey > OldKey of
                true -> %% 只更新最好的成绩
                    Tree1 = gb_trees:delete(OldKey, Tree),
                    gb_trees:insert(NewKey, NewVal, Tree1);
                _ ->
                    Tree
            end;
        _ ->
            case gb_trees:size(Tree) of
                Size when Size < Cap ->
                    gb_trees:insert(NewKey, NewVal, Tree);
                _ ->
                    {SmallKey, _, Tree1} = gb_trees:take_smallest(Tree),
                    case NewKey > SmallKey of
                        true ->
                            gb_trees:insert(NewKey, NewVal, Tree1);
                        _ ->
                            Tree
                    end

            end
    end.

delete_rank(RankID, Key) ->
    RankInfo = get_rank_info(RankID),
    #{id := RankRankID, data := Data, tree := Tree} = RankInfo,
    OldVal = util:dict_find(Key, Data),
    OTKey = tree_key(RankRankID, OldVal),
    NewData = dict:erase(Key, Data),
    case gb_trees:is_defined(OTKey, Tree) of
        true ->
            NewTree = gb_trees:delete(OTKey, Tree);
        _ ->
            NewTree = Tree
    end,
    NewRankInfo = RankInfo#{data => NewData, tree => NewTree},
    set_rank_info(RankID, NewRankInfo),
    refresh_rank(RankID).


role_delete(RankID, RoleIds) ->
    RankInfo = get_rank_info(RankID),
    #{id := RankRankID, tree := Tree, data := Data} = RankInfo,
    {TreeN, DataN} = lists:foldl(fun(Key, {TreeAcc, DictAcc}) ->
        OldVal = util:dict_find(Key, DictAcc),
        OTKey = tree_key(RankRankID, OldVal),
        NewData = dict:erase(Key, DictAcc),
        case gb_trees:is_defined(OTKey, TreeAcc) of
            true ->
                NewTree = gb_trees:delete(OTKey, TreeAcc);
            _ ->
                NewTree = TreeAcc
        end,
        {NewTree, NewData}
    end, {Tree, Data}, RoleIds),
    RankDataN = maps:merge(?rank_info#{tree => TreeN, data => DataN}, RankInfo),
    set_rank_info(RankID, RankDataN).
%%    save_rank(RankDataN).

%% @doc 定时刷新排行榜
timer_refresh(RankID) when is_integer(RankID) ->
    timer_refresh(conf_rank:get(RankID));
timer_refresh(Conf) when is_map(Conf) ->
    #{id := RankID, refresh := Refresh} = Conf,
    {_, {_, M, _}} = erlang:localtime(),
    case Refresh > 0 andalso M rem Refresh =:= 0 of
        true ->
            refresh_rank(RankID);
        _ ->
            ignore
    end.

%% @doc 刷新排行榜
refresh_rank(RankID) ->
    RankInfo = get_rank_info(RankID),
    NewRankInfo = sort_rank(RankInfo),
    set_rank_info(RankID, NewRankInfo),
    refresh_handler(RankID, NewRankInfo),
    save_rank(NewRankInfo).





sort_rank(RankData) ->
    #{tree := Tree, data := Data, cap := Cap} = RankData,
    KvList = gb_trees:to_list(Tree),
    Now = time:unixtime(),
    {RankList, NewData} = assign_rank(lists:reverse(KvList), Data, Cap),
    RankData#{rank => RankList, data => NewData, refresh => Now}.

assign_rank(List, Data, Cap) ->
    assign_rank(List, Data, 1, [], [], Cap).

assign_rank([], _Data, _Rank, RankAcc, DataAcc, _Cap) ->
    {lists:reverse(RankAcc), dict:from_list(DataAcc)};
assign_rank([{_, DKey} | T], Data, Rank, RankAcc, DataAcc, Cap) when Rank =< Cap ->
    RankItem = util:dict_find(DKey, Data),
    NewRankItem = RankItem#{rank => Rank},
    NewRankAcc = [NewRankItem | RankAcc],
    NewDataAcc = [{DKey, RankItem} | DataAcc],
    assign_rank(T, Data, Rank + 1, NewRankAcc, NewDataAcc, Cap);
assign_rank(_, _Data, _, RankAcc, DataAcc, _) ->
    {lists:reverse(RankAcc), dict:from_list(DataAcc)}.

%% @doc 获取排行榜
get_rank(RoleID, RankID, Page, Key) ->
    {ok, Info} = get_rank(RankID, Page, Key),
    Rec = #sc_rank_get_info{info = Info},
    {ok, Bin} = prot_msg:encode_msg(40502, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

get_rank(RankID, Page, Key) ->
    RankInfo = get_rank_info(RankID),
    #{rank := RankList} = RankInfo,
    TotalPage = erlang:ceil(erlang:length(RankList) / ?RANK_PAGE_SIZE),
    NewPage = erlang:max(1, erlang:min(Page, TotalPage)),
    PageList = lists:sublist(RankList, (NewPage - 1) * ?RANK_PAGE_SIZE + 1, ?RANK_PAGE_SIZE),
    CltRanks = convert_rank(PageList, RankID, []),
    TargetRank = get_target_rank(RankID, Key, RankList),
    Info = #clt_rank_info{
        type = RankID, page = NewPage, total = TotalPage, items = CltRanks,
        relative = TargetRank
    },
    {ok, Info}.

get_target_rank(ID, Key, RankList) ->
    case map:keyfind(Key, key, RankList) of
        false -> [];
        V -> convert_rank([V], ID, [])
    end.

convert_rank([], _ID, Acc) ->
    lists:reverse(Acc);
convert_rank([Item | T], ID, Acc) ->
    case convert_rank_item(ID, Item) of
        #clt_rank_item{} = V ->
            NewAcc = [V | Acc],
            convert_rank(T, ID, NewAcc);
        _ ->
            convert_rank(T, ID, Acc)
    end.

get_role_target_rank(RoleID, RankID, Key) ->
    RankInfo = get_rank_info(RankID),
    #{rank := RankList} = RankInfo,
    TargetRank =
        case map:keyfind(Key, key, RankList) of
            false ->
                0;
            V ->
                #{rank := Rank} = V,
                Rank
        end,
    Rec = #sc_rank_get_target_rank{type = RankID, target_rank = TargetRank},
    {ok, Bin} = prot_msg:encode_msg(40504, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% -----------------------------------------------------------------------------
%% 需要自定义的函数
%% -----------------------------------------------------------------------------

%% @doc 加载排行榜数据
load_rank_data(RankID, _Conf) ->
    SQL = io_lib:format(?SQL_GET_RANK_RECORD, [RankID]),
    List = db:get_all(SQL),
    Fun = fun([_, _, DbItem], Acc) ->
        Item = type:convert_db_field(map, DbItem),
        ?iif(Item =/= undefined, [Item | Acc], Acc)
    end,
    L = lists:foldl(Fun, [], List),
    L.

%% @doc 保存排行榜数据
save_rank_item(RankID, RankList) ->
    Fun = fun(RankItem) ->
        #{rank := Rank} = RankItem,
        DbItem = type:term_to_bitstring(RankItem),
        [RankID, Rank, DbItem]
    end,
    List = lists:map(Fun, RankList),
    db:execute(io_lib:format(?SQL_LOG_RANK_RECORD, [RankID])),
    db:execute(io_lib:format(?SQL_CLS_RANK_RECORD, [RankID])),
    db:insert_values(?SQL_SET_RANK_RECORD2, ?SQL_SET_RANK_RECORD3, List).

%% @doc 提取用于排序的字段，返回 tuple {Key1(值小反而大的使用负值), Key2, ...}，
%% 优先级高的排在前面，最后一个字段必须为 RankItem 的 key。
tree_key(_, undefined) ->
    undefined;
tree_key(?RANK_ROLE_FIGHT, #{fight := Fight, time := Time, key := Key}) ->
    {Fight, -Time, Key};
tree_key(?RANK_ROLE_LEVEL, #{level := Level, exp := Exp, time := Time, key := Key}) ->
    {Level, Exp, Time, Key};
tree_key(RankID, #{level := Level, wave := Wave, time := Time, key := Key})
    when ?RANK_IS_DUNG(RankID) ->
    {Level, Wave, Time, Key};
tree_key(?RANK_GUILD_LIVE, #{guild_id := GuildID, live := LiveExp, time := Time, key := Key}) ->
    {LiveExp, GuildID, -Time, Key};
tree_key(RankID, #{rank := Rank, key := Key})
    when RankID =:= ?RANK_MASTER_ROLE orelse RankID =:= ?RANK_MASTER_GUILD -> %% 已在外部排序
    {-Rank, Key};
tree_key(RankID, #{key := Key, fight := Fight, time := Time})
    when ?RANK_IS_EQUIP(RankID) ->
    {Fight, -Time, Key};
tree_key(RankID, #{key := Key, fight := Fight, time := Time})
    when ?RANK_IS_CAREER(RankID) ->
    {Fight, -Time, Key};
tree_key(?RANK_PET_FIGHT, #{key := Key, fight := Fight, time := Time}) ->
    {Fight, -Time, Key};
tree_key(?RANK_GUILD_FIGHT, #{key := Key, rank := Rank}) -> %% 已在外部排序
    {-Rank, Key};
tree_key(?RANK_LOVE_VALUE, #{key := Key, love_value := LoveValue, time := Time}) ->
    {LoveValue, -Time, Key};
tree_key(_, _) ->
    undefined.

%% @doc 转换排行榜数据
convert_rank_item(?RANK_ROLE_FIGHT, #{rank := Rank, key := RoleID, fight := Fight, career := Career} = Item) ->
    GuildName = maps:get(guild_name, Item, ""),
    Name = lib_cache:get_role_name(RoleID),
    #clt_rank_item{rank = Rank, id = RoleID, columns = [Name, GuildName, ?STR(Fight), ?STR(0), ?STR(Career)]};
convert_rank_item(?RANK_ROLE_LEVEL, #{rank := Rank, key := RoleID, level := Level, career := Career} = Item) ->
    GuildName = maps:get(guild_name, Item, ""),
    Name = lib_cache:get_role_name(RoleID),
    #clt_rank_item{rank = Rank, id = RoleID, columns = [Name, GuildName, ?STR(Level), ?STR(0), ?STR(Career)]};
convert_rank_item(RankID, #{rank := Rank, key := RoleID, dung_id := DungID, level := Level, wave := Wave, career := Career} = Item)
    when ?RANK_IS_DUNG(RankID) ->
    GuildName = maps:get(guild_name, Item, ""),
    Name = lib_cache:get_role_name(RoleID),
    TWave = lib_role_dungeon:calc_dung_wave(DungID, Level, Wave),
    #clt_rank_item{rank = Rank, id = RoleID, columns = [Name, GuildName, ?STR(TWave), ?STR(0), ?STR(Career)]};
convert_rank_item(?RANK_GUILD_LIVE, #{rank := Rank, key := GuildID, live := LiveExp, guild_name := GuildName}) ->
    #guild{chief_name = ChiefName, level = Level} = lib_guild:get_guild_info(GuildID),
    #clt_rank_item{rank = Rank, id = GuildID, columns = [GuildName, ChiefName, ?STR(LiveExp), ?STR(Level), ?STR(0)]};
convert_rank_item(?RANK_MASTER_GUILD, #{rank := Rank, key := GuildID, name := GName, num := _RoleNum, chief := Chief, score := Score}) ->
    #clt_rank_item{rank = Rank, id = GuildID, columns = [GName, Chief, ?STR(Score), ?STR(0), ?STR(0)]};
convert_rank_item(RankID, #{rank := Rank, key := RoleID, fight := Fight, name := GoodsName, career := Career})
    when ?RANK_IS_EQUIP(RankID) ->
    Name = lib_cache:get_role_name(RoleID),
    #clt_rank_item{rank = Rank, id = RoleID, columns = [GoodsName, Name, ?STR(Fight), ?STR(0), ?STR(Career)]};
convert_rank_item(RankID, #{rank := Rank, key := RoleID, fight := Fight, guild_name := GuildName, career := Career})
    when ?RANK_IS_CAREER(RankID) ->
    Name = lib_cache:get_role_name(RoleID),
    #clt_rank_item{rank = Rank, id = RoleID, columns = [Name, GuildName, ?STR(Fight), ?STR(0), ?STR(Career)]};
convert_rank_item(?RANK_PET_FIGHT, #{rank := Rank, key := RoleID, pet_name := PetName, fight := Fight, career := Career}) ->
    Name = lib_cache:get_role_name(RoleID),
    #clt_rank_item{rank = Rank, id = RoleID, columns = [PetName, Name, ?STR(Fight), ?STR(0), ?STR(Career)]};
convert_rank_item(?RANK_GUILD_FIGHT, #{rank := Rank, key := GuildID, fight := Fight}) ->
    #guild{name = Name, chief_name = ChiefName, level = Level} = lib_guild:get_guild_info(GuildID),
    #clt_rank_item{rank = Rank, id = GuildID, columns = [Name, ChiefName, ?STR(Fight), ?STR(Level), ?STR(0)]};
convert_rank_item(?RANK_GUILD_WORLD_BOSS, #{rank := Rank, key := GuildID, harm_score := HarmScore, guild_name := GuildName}) ->
    #clt_rank_item{rank = Rank, id = GuildID, columns = [GuildName, ?STR(HarmScore)]};
convert_rank_item(?RANK_MASTER_ROLE, #{rank := Rank, key := RoleID, name := RName, career := Career, guild_name := GName, score := Score}) ->
    #clt_rank_item{rank = Rank, id = RoleID, columns = [RName, ?STR(Career), GName, ?STR(Score)]};
convert_rank_item(?RANK_LOVE_VALUE, #{rank := Rank, key := MarryID, love_value := LoveValue}) ->
    Fields = lib_marriage:get_rank_field(MarryID),
    #clt_rank_item{rank = Rank, id = MarryID, columns = Fields ++ [?STR(LoveValue)]};
convert_rank_item(_RankID, _Data) ->
    undefined.

%% @doc 排行榜刷新钩子
refresh_handler(?RANK_ROLE_LEVEL, #{rank := RankList}) ->
    Num = config:get_sys_config(pioneer_level_rank),
    TopList = lists:sublist(RankList, 1, Num),
    case length(TopList) of
        0 ->
            PioneerLv = util_svr:def_pioneer_lv();
        L ->
            Total = lists:sum([Level || #{level := Level} <- TopList]),
            PioneerLv = erlang:floor(Total / L)
    end,
    util_svr:set_pioneer_lv(PioneerLv);
refresh_handler(_RankID, _NewRank) ->
    ignore.

%% -----------------------------------------------------------------------------
%% 排行榜数据
%% -----------------------------------------------------------------------------

%% @doc 获取排行榜信息
get_rank_info(RankID) ->
    case util:get_ets(?ETS_RANK, RankID) of
        M when is_map(M) -> M;
        _ -> new_rank_info(RankID)
    end.

new_rank_info(RankID) when is_integer(RankID) ->
    new_rank_info(conf_rank:get(RankID));
new_rank_info(Conf) when is_map(Conf) ->
    #{type := RankID, cap := Cap} = Conf,
    ?rank_info#{type => RankID, cap => Cap};
new_rank_info(undefined) ->
    ?rank_info#{}.

%% @doc 设置排行榜信息
set_rank_info(RankID, Info) ->
    util:put_ets(?ETS_RANK, RankID, Info),
    Info.
