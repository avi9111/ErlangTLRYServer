%%-------------------------------------------------------
%% @File     : svr_logic.erl
%% @Brief    : 游戏逻辑线服务
%% @Author   : shebiao
%% @Date     : 2015-1-6
%%-------------------------------------------------------
-module(svr_logic).

-include("chat.hrl").
-include("dice.hrl").
-include("role.hrl").
-include("cache.hrl").
-include("scene.hrl").
-include("common.hrl").
-include("cluster.hrl").
-include("ets_defines.hrl").

-behaviour(gen_server).

-export([
    start_link/1
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).


%% Apis ----------------------------------------------------------
start_link(NodeID) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [NodeID], []).


%% Callbacks -----------------------------------------------------
init([_NodeID]) ->
    erlang:process_flag(trap_exit, true),
    %% 初始 ets 表
    ok = init_ets(),
    {ok, ?MODULE}.

handle_cast(_R, State) ->
    {noreply, State}.

handle_call(_R, _FROM, State) ->
    {reply, ok, State}.

handle_info(_Reason, State) ->
    {noreply, State}.

terminate(_Reason, State) ->
    {ok, State}.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ------------------------------------------------------
%% @doc 初始ETS表
init_ets() ->
    ets:new(?ETS_SERVER_STATE, ?ETS_KEYPOS_OPTIONS(#server_state.name)),                % 服务器信息
    ets:new(?ETS_NODE, ?ETS_KEYPOS_OPTIONS(#node_info.id)),                             % 节点列表(100节点)
    ets:new(?ETS_SCENE_MGR, ?ETS_KEYPOS_OPTIONS(#ets_scene.scene_id)),                  % 场景数据
    ets:new(?ETS_CLUSTER_SCENE_AGENT, ?ETS_KEYPOS_OPTIONS(#ets_scene_line.scene_id)),   % 场景数据
    ets:new(?ETS_ONLINE, ?ETS_KEYPOS_OPTIONS(#role_online.id)),                         % 角色在线数据
    ets:new(?ETS_CACHE, ?ETS_KEYPOS_OPTIONS(#cache_item.key)),                          % 缓存
    %% 聊天过滤
    ets:new(?ETS_SENSITIVE_TALK, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_SENSITIVE_TALK_PASS_1, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_SENSITIVE_TALK_PASS_2, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_SENSITIVE_TALK_PASS_3, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_SENSITIVE_NAME, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_SENSITIVE_WORD_GROUP, ?ETS_DEFAULT_OPTIONS),
    %% 聊天
    ets:new(?ETS_CHAT_CACHE_PUBLIC, ?ETS_KEYPOS_OPTIONS(#chat_cache_public.channel_key)),
    ets:new(?ETS_CHAT_CACHE_PRIVATE, ?ETS_KEYPOS_OPTIONS(#chat_cache_private.key)),
    %% 好友
    ets:new(?ETS_FRIEND, ?ETS_DEFAULT_OPTIONS),
    %% 结拜
    ets:new(?ETS_SWORN, ?ETS_DEFAULT_OPTIONS),
    %% 师徒
    ets:new(?ETS_MENTOR, ?ETS_DEFAULT_OPTIONS),
    %% 帮派
    ets:new(?ETS_GUILD, ?ETS_KEY_CURRENCY(2)),
    ets:new(?ETS_GUILD_UPDATE, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_GUILD_ROLE, ?ETS_KEY_CURRENCY(2)),
    ets:new(?ETS_GUILD_ROLE_UPDATE, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_GUILD_OTHERS, ?ETS_DEFAULT_OPTIONS),
    %% 结婚
    ets:new(?ETS_MARRIAGE, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_MARRIAGE_U, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_MARRIAGE_ROLE, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_MARRIAGE_ROLE_U, ?ETS_DEFAULT_OPTIONS),
    %% 活动
    ets:new(?ETS_ACTIVITY, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_OPERATION_ACTIVITY, ?ETS_DEFAULT_OPTIONS),
    %% 排行榜
    ets:new(?ETS_RANK, ?ETS_CURRENCY_OPTIONS),
    %% 拍卖
    ets:new(?ETS_AUCTION, ?ETS_CURRENCY_OPTIONS),
    ets:new(?ETS_AUCTION_U, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_AUCTION_LOG, ?ETS_CURRENCY_OPTIONS),
    %% 骰子
    ets:new(?ETS_DICE, ?ETS_KEYPOS_OPTIONS(#dice.id)),
    %% 门派竞技
    ets:new(?ETS_CAREER_BATTLE, ?ETS_KEY_CURRENCY(1)),
    ets:new(?ETS_CAREER_BATTLE_U, ?ETS_DEFAULT_OPTIONS),
    %% 组队
    ets:new(?ETS_TEAM, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_TEAM_MEMBER, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_TEAM_APPLY_INVITE, ?ETS_KEYPOS_OPTIONS(2)),
    %% 领地战
    ets:new(?ETS_TERRITORY, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_TERRITORY_BATTLE, ?ETS_CURRENCY_OPTIONS),
    %% 商会
    ets:new(?ETS_MARKET, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_MARKET_ITEM, ?ETS_KEY_CURRENCY(2)),
    ets:new(?ETS_MARKET_ITEM_U, ?ETS_DEFAULT_OPTIONS),
    ets:new(?ETS_MARKET_ROLE, ?ETS_CURRENCY_OPTIONS),
    ets:new(?ETS_MARKET_ROLE_U, ?ETS_DEFAULT_OPTIONS),
    ok.
