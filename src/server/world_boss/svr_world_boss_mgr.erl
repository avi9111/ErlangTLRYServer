%%-------------------------------------------------------
%% @File     : svr_world_mgr.erl
%% @Brief    : 世界boss活动管理
%% @Author   : cablsbs
%% @Date     : 2018-10-12
%%-------------------------------------------------------
-module(svr_world_boss_mgr).

-include("rank.hrl").
-include("common.hrl").
-include("world_boss.hrl").

-behaviour(gen_server).

-export([
    start_link/1,
    start_activity/1,
    stop_activity/1,
    submit_battle_result/3
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-record(world_boss_mgr, {
    node_id = 0,
    on_going = false,
    layers = [],
    world_lv = 0,
    need_submit_layers = [],
    all_settled_data = [],
    all_contrib_data= [],
    clear_scene_ref = undefined,
    to_auction_ref = undefined,
    is_initiated = false
}).


%% Apis -------------------------------------------------
start_link(NodeId) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [NodeId], []).

start_activity(_Activity) ->
    ?MODULE ! 'start_activity'.

stop_activity(_Activity) ->
    ?MODULE ! 'stop_activity'.

submit_battle_result(Layer, SettledBossList, RoleContribListByGuild) ->
    gen_server:cast(?MODULE, {'submit_battle_result', Layer, SettledBossList, RoleContribListByGuild}).


%% Callbacks --------------------------------------------
init([NodeId]) ->
    erlang:send_after(10000, self(), 'open_boss_scene'),
    {ok, #world_boss_mgr{node_id = NodeId}}.

% 默认匹配
handle_call(Req, _From, State) ->
    ?ERROR("Recv unexpected call request: ~p", [Req]),
    {reply, undefined, State}.

% 收集boss结算数据
handle_cast({'submit_battle_result', Layer, SettledBossList, RoleContribListByGuild}, State) when State#world_boss_mgr.need_submit_layers =/= [] ->
    NeedSubmitLayers = lists:delete(Layer, State#world_boss_mgr.need_submit_layers),
    AllSettleData = SettledBossList ++ State#world_boss_mgr.all_settled_data,
    AllContribData = RoleContribListByGuild ++ State#world_boss_mgr.all_contrib_data,
    ToAuctionRef = case NeedSubmitLayers =:= [] of
        true ->
            util:cancel_timer(State#world_boss_mgr.to_auction_ref),
            erlang:send_after(0, self(), 'to_auction');
        false ->
            State#world_boss_mgr.to_auction_ref
    end,
    StateN = State#world_boss_mgr{
        need_submit_layers = NeedSubmitLayers,
        all_settled_data = AllSettleData,
        all_contrib_data = AllContribData,
        to_auction_ref = ToAuctionRef
    },
    {noreply, StateN};
handle_cast({'submit_battle_result', Layer, SettledBossList, RoleContribListByGuild}, State) ->
    ?ERROR("Layer: ~p settle data was ignored !", [Layer]),
    ?ERROR("SettleData:~n~p", [SettledBossList]),
    ?ERROR("RoleContribData:~n~p", [RoleContribListByGuild]),
    {noreply, State};

% 默认匹配
handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.


% 开启活动(在已开启的分线，召唤boss)
handle_info('start_activity', #world_boss_mgr{is_initiated = true} = State) ->
    util:cancel_timer(State#world_boss_mgr.clear_scene_ref),
    #world_boss_mgr{node_id = NodeId, on_going = OnGoing} = State,
    OnGoing andalso sup_world_boss_layer:clear_boss_without_settle(),
    StateT = make_clean(State),

    svr_rumor:publish(world, ?RUMOR_WORLD_BOSS_BEG, []),
    Layers = conf_world_boss_field:get_layers(NodeId),
    WorldLv = util_svr:get_world_lv(),
    sup_world_boss_layer:summon_boss(WorldLv),
    StateN = StateT#world_boss_mgr{
        on_going = true,
        layers = Layers,
        world_lv = WorldLv,
        clear_scene_ref = undefined,
        need_submit_layers = Layers
    },
    {noreply, StateN};
handle_info('start_activity', State) ->
    do_world_boss_initiate(State#world_boss_mgr.node_id),
    erlang:send_after(3000, self(), 'start_activity'),
    StateN = State#world_boss_mgr{is_initiated = true},
    {noreply, StateN};

% 开启关闭(在已开启的分线，清除boss)
handle_info('stop_activity', State) ->
    svr_rumor:publish(world, ?RUMOR_WORLD_BOSS_END, []),
    sup_world_boss_layer:clear_boss_and_settle(),
    ToAuctionRef = erlang:send_after(10000, self(), 'to_auction'),
    ClearSceneRef = erlang:send_after(7200000, self(), 'clear_scene'),
    StateN = State#world_boss_mgr{
        clear_scene_ref = ClearSceneRef,
        to_auction_ref = ToAuctionRef
    },
    {noreply, StateN};

% 提交到拍卖行
handle_info('to_auction', State) when State#world_boss_mgr.to_auction_ref =/= undefined ->
    #world_boss_mgr{
        world_lv = WorldLv,
        all_settled_data = AllSettleData,
        all_contrib_data = AllContribData,
        need_submit_layers = NeedSubmitLayers
    } = State,
    NeedSubmitLayers =/= [] andalso ?ERROR("Failed to gather layers: ~p settled data !", [NeedSubmitLayers]),
    GuildScoreList = lists:concat([GuildScoreL || {_BossId, _IsDead, GuildScoreL} <-   AllSettleData]),
    {GuildWBRank, AllContribDataN} = merge_role_contrib_by_guild(AllContribData, GuildScoreList, {[], []}),
    % TODO with AllContribDataN :: [{GuildId, [{RoleId, Rank, Contrib}]]
    svr_rank:reset_rank(?RANK_GUILD_WORLD_BOSS, GuildWBRank),
    AllAuctionData = gen_auction_data(AllSettleData, AllContribDataN, WorldLv),
    lib_auction_util:boss_auction(AllAuctionData),
    StateN = make_clean(State),
    {noreply, StateN};
handle_info('to_auction', State) ->
    ?ERROR("handle_info('to_auction', State) ignored !"),
    {noreply, State};

% 清理多余分线(每个场景只留一条分线)
handle_info('clear_scene', State) when State#world_boss_mgr.clear_scene_ref =/= undefined ->
    util:cancel_timer(State#world_boss_mgr.to_auction_ref),
    sup_world_boss_layer:clear_layer(),
    {noreply, State};
handle_info('clear_scene', State) ->
    ?ERROR("handle_info('clear_scene' State) ignored !"),
    {noreply, State};

% 初始化boss场景(每个层级建立一个分线)
handle_info('open_boss_scene', State) when not State#world_boss_mgr.is_initiated ->
    do_world_boss_initiate(State#world_boss_mgr.node_id),
    StateN = State#world_boss_mgr{is_initiated = true},
    {noreply, StateN};
handle_info('open_boss_scene', State) ->
    {noreply, State};


% 默认匹配
handle_info(Info, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Info]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
do_world_boss_initiate(NodeId) ->
    Layers = conf_world_boss_field:get_layers(NodeId),
    [sup_world_boss_layer:start_layer(Layer) || Layer <- Layers].

make_clean(#world_boss_mgr{on_going = true} = State) ->
    util:cancel_timer(State#world_boss_mgr.to_auction_ref),
    State#world_boss_mgr{
        on_going = false,
        layers = [],
        need_submit_layers = [],
        all_settled_data = [],
        to_auction_ref = undefined
    };
make_clean(State) ->
    State.

% 返回 [{GuildId, GuildHarmScore, RoleContribList].
% GuildId = GuildHarmScore  :: integer()
% RoleContribList           :: [{RoleId, RoleContrib}]
% RoleId = RoleContrib      :: integer()
merge_role_contrib_by_guild([{GuildId, RoleContribList} | Rest], SettleDataList, {RankList, ContribList}) ->
    case lists:keytake(GuildId, 1, ContribList) of
        {value, {GuildId, RoleContribs}, Rest} ->
            RoleContribsN = lists:foldl(fun do_merge_fun/2, RoleContribs, RoleContribList),
            ContribListN = [{GuildId, RoleContribsN} | Rest],
            merge_role_contrib_by_guild(Rest, SettleDataList, {RankList, ContribListN});
        _ ->
            {{GuildHarmScore, GuildName}, RestSettleDataList} = sum_guild_harm_score(GuildId, SettleDataList, {0, ""}, []),
            WorldBossRankCell = ?rank_guild_world_boss#{
                guild_id => GuildId,
                harm_score => erlang:ceil(GuildHarmScore),
                guild_name => GuildName
            },
            RankListN = [WorldBossRankCell | RankList],
            ContribListN = [{GuildId, RoleContribList} | ContribList],
            merge_role_contrib_by_guild(Rest, RestSettleDataList, {RankListN, ContribListN})
    end;
merge_role_contrib_by_guild([], _SettleDataList, {RankList, AllContribData}) ->
    GuildWBRank = sort_guild_wb_rank(RankList),
    AllContribDataN= [
        {GuildId, sort_role_contrib(RoleContribs)}
        || {GuildId, RoleContribs} <- AllContribData
    ],
    {GuildWBRank, AllContribDataN}.

do_merge_fun({RoleId, Contrib}, TmpContribs) ->
    case lists:keytake(RoleId, 1, TmpContribs) of
        false ->
            [{RoleId, Contrib} | TmpContribs];
        {value, {RoleId, OldContrib}, Rest} ->
            [{RoleId, OldContrib + Contrib} | Rest]
    end.

sum_guild_harm_score(GuildId, [{GuildId, GuildName, _Percent, Score} | Rest], {AccScore, _GuildName}, AccSettleList) ->
    sum_guild_harm_score(GuildId, Rest, {AccScore + Score, GuildName}, AccSettleList);
sum_guild_harm_score(GuildId, [GuildSettleData | Rest], ScoreAndName, AccSettleList) ->
    sum_guild_harm_score(GuildId, Rest, ScoreAndName, [GuildSettleData | AccSettleList]);
sum_guild_harm_score(_GuildId, [], ScoreAndName, AccSettleList) ->
    {ScoreAndName, AccSettleList}.

gen_auction_data(SettleDataList, AllContribData, WorldLv) ->
    SortFun = fun({BossId1, _IsDead1, _GList1}, {BossId2, _IsDead2, _GList2}) -> BossId1 >= BossId2 end,
    SortedSettleDataList = lists:sort(SortFun, SettleDataList),
    GuildAuctionData = gen_auction_items(SortedSettleDataList, [], WorldLv),
    MergeRoleBonus = fun({GuildId, AuctionShopIds}) ->
        case lists:keyfind(GuildId, 1, AllContribData) of
            {GuildId, RoleContribs} ->
                RoleBonus = [
                    {RoleId, conf_auction_boss_bonus:get(Rank)}
                    || {RoleId, Rank, _Contrib} <- RoleContribs
                ],
                {GuildId, AuctionShopIds, RoleBonus};
            _ ->
                {GuildId, AuctionShopIds, []}
        end
    end,
    lists:map(MergeRoleBonus, GuildAuctionData).

gen_auction_items([{BossId, IsDead, GuildPercentList} | RestSettleDataList], AccAuctionShopItems, WorldLv) ->
    AuctionConf = case IsDead of
        false -> conf_world_boss_level:get_auction_conf_alive(BossId, WorldLv);
        true -> conf_world_boss_level:get_auction_conf_dead(BossId, WorldLv)
    end,
    {_, AccAuctionShopItemsT} = lists:foldl(fun gen_guild_items/2, {AuctionConf, AccAuctionShopItems}, GuildPercentList),
    AccAuctionShopItemsN = case IsDead of
        true ->
            {BelongerGuildId, _, _, _} = hd(GuildPercentList),
            {BelongerItemsRatio, {MinNum, MaxNum}} = conf_world_boss_level:get_auction_conf_belonger(BossId, WorldLv),
            ExtraAuctionNum = util:rand(MinNum, MaxNum),
            ExtraAuctionIds = [AuctionId || {AuctionId, _W} <- util:rand_by_weight(BelongerItemsRatio, 2, ExtraAuctionNum)],
            {BelongerGuildId, AccPercent, AuctionShopIds} = lists:keyfind(BelongerGuildId, 1, AccAuctionShopItemsT),
            AuctionShopIdsN = ExtraAuctionIds ++ AuctionShopIds,
            lists:keystore(BelongerGuildId, 1, AccAuctionShopItemsT, {BelongerGuildId, AccPercent, AuctionShopIdsN});
        false ->
            AccAuctionShopItemsT
    end,
    gen_auction_items(RestSettleDataList, AccAuctionShopItemsN, WorldLv);
gen_auction_items([], AccAuctionShopItems, _WorldLv) ->
    [
        {GuildId, AuctionShopIds}
        || {GuildId, _TotalPercent, AuctionShopIds} <- AccAuctionShopItems
    ].

gen_guild_items({GuildId, _GuildName, Percent, _HarmScore}, {{ItemsRatio, NumRatio}, AccAuctionShopItems}) ->
    case lists:keyfind(GuildId, 1, AccAuctionShopItems) of
        {GuildId, AccPercent, GuildAuctionIds} ->
            AccPercentN = AccPercent + Percent,
            DecayRate = conf_auction_boss_decay:get(AccPercentN),
            DecayPercent = DecayRate * Percent,
            Num = calc_auction_item_num(NumRatio, DecayPercent),
            {ItemsRatioN, NewShopItems} = util:rand_by_weight_return_rest(ItemsRatio, 2, Num),
            NewAuctionShopIds = [element(1, Ratio) || Ratio <- NewShopItems],
            GuildAuctionData = {GuildId, AccPercentN, NewAuctionShopIds ++ GuildAuctionIds},
            AccAuctionShopItemsN = lists:keystore(GuildId, 1, AccAuctionShopItems, GuildAuctionData),
            {{ItemsRatioN, NumRatio}, AccAuctionShopItemsN};
        _ ->
            Num = calc_auction_item_num(NumRatio, Percent),
            {ItemsRatioN, NewShopItems} = util:rand_by_weight_return_rest(ItemsRatio, 2, Num),
            NewAuctionShopIds = [element(1, Ratio) || Ratio <- NewShopItems],
            GuildAuctionData = {GuildId, Percent, NewAuctionShopIds},
            AccAuctionShopItemsN = [GuildAuctionData | AccAuctionShopItems],
            {{ItemsRatioN, NumRatio}, AccAuctionShopItemsN}
    end.

calc_auction_item_num([{MinPercent, MaxPercent, MinNum, MaxNum} | Rest], Percent) ->
    if
        Percent > MinPercent andalso Percent =< MaxPercent ->
            util:rand(MinNum, MaxNum);
        true ->
            calc_auction_item_num(Rest, Percent)
    end;
calc_auction_item_num([], _Percent) ->
    0.

sort_guild_wb_rank([]) ->
    [];
sort_guild_wb_rank(GuildWBRank) ->
    SortRankFun = fun(#{harm_score := HarmScore1}, #{harm_score := HarmScore2}) -> HarmScore1 >= HarmScore2 end,
    SortedCells = lists:sort(SortRankFun, GuildWBRank),
    RankSize = length(GuildWBRank),
    RankIndexes = [R || R <- lists:seq(1, RankSize)],
    ZipWith = fun(Cell, Rank) -> Cell#{rank => Rank} end,
    lists:zipwith(ZipWith, SortedCells, RankIndexes).

sort_role_contrib([]) ->
    [];
sort_role_contrib(RoleContribs) ->
    SortRankFun = fun({_RoleId1, Contrib1}, {_RoleId2, Contrib2}) -> Contrib1 >= Contrib2 end,
    RoleContribsSorted = lists:sort(SortRankFun, RoleContribs),
    RankSize = length(RoleContribs),
    RankIndexes = [R || R <- lists:seq(1, RankSize)],
    ZipWith = fun({RoleId, Contrib}, Rank) -> {RoleId, Rank, Contrib} end,
    lists:zipwith(ZipWith, RoleContribsSorted, RankIndexes).
