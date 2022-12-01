%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     拍卖行
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_auction_util).
-author("Ryuu").

-include("common.hrl").
-include("auction.hrl").

%% API
-export([
    boss_auction/1,
    defend_auction/3,
    jousts_auction/3,
    territory_auction/3
]).

%% @doc 世界Boss拍卖 [{帮派ID, [物品ID], [{RoleID, 分成}]}]
boss_auction([]) ->
    [];
boss_auction([{GuildID, Items, Roles} | T]) ->
    svr_auction:auction(?AUCTION_TYPE_WORLD_BOSS, ?AUCTION_SCOPE_GUILD, GuildID, Roles, Items),
    boss_auction(T).

%% @doc 帮派守卫战拍卖
defend_auction(GuildID, Items, Roles) ->
    svr_auction:auction(?AUCTION_TYPE_GUILD_DEFEND, ?AUCTION_SCOPE_GUILD, GuildID, Roles, Items).

%% @doc 演武堂拍卖
jousts_auction(GuildID, Items, Roles) ->
    svr_auction:auction(?AUCTION_TYPE_JOUSTS_HALL, ?AUCTION_SCOPE_GUILD, GuildID, Roles, Items).

territory_auction(GuildID, Roles, Items) ->
    svr_auction:auction(?AUCTION_TYPE_TERRITORY, ?AUCTION_SCOPE_GUILD, GuildID, Roles, Items).
