%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_territory
%% @Brief  : 领地配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_territory).

-export([
    get/1,
    get_ids/0,
    get_reward/2,
    get_by_quality/1
]).

get(1) ->
    #{
        id => 1,
        name => <<"洛阳">>,
        quality => 3,
        win_reward => {290001,290051},
        lose_reward => {290101,290151},
        auction => [{3,[{4,5000},{5,5000}]},{2,[{3,5000},{4,5000}]},{1,[{2,5000},{3,5000}]},{9,[{4,5000},{5,5000}]},{10,[{3,5000},{4,5000}]},{4,[{3,5000},{4,5000}]}],
        daily_auction => [{3,[{2,5000},{3,5000}]},{2,[{2,5000},{3,5000}]},{1,[{2,5000},{3,5000}]},{9,[{0,5000},{0,5000}]},{10,[{0,5000},{0,5000}]},{4,[{2,5000},{3,5000}]},{101,[{0,3500},{1,5000},{2,1500}]},{102,[{0,3500},{1,5000},{2,1500}]},{103,[{0,3500},{1,5000},{2,1500}]},{104,[{0,3500},{1,5000},{2,1500}]},{105,[{0,3500},{1,5000},{2,1500}]},{106,[{0,3500},{1,5000},{2,1500}]},{107,[{0,3500},{1,5000},{2,1500}]},{108,[{0,3500},{1,5000},{2,1500}]},{109,[{0,3500},{1,5000},{2,1500}]},{110,[{0,3500},{1,5000},{2,1500}]},{111,[{0,3500},{1,5000},{2,1500}]},{112,[{0,3500},{1,5000},{2,1500}]},{113,[{0,3500},{1,5000},{2,1500}]},{114,[{0,3500},{1,5000},{2,1500}]},{115,[{0,3500},{1,5000},{2,1500}]},{116,[{0,3500},{1,5000},{2,1500}]},{201,[{0,3500},{1,5000},{2,1500}]},{202,[{0,3500},{1,5000},{2,1500}]},{203,[{0,3500},{1,5000},{2,1500}]},{204,[{0,3500},{1,5000},{2,1500}]},{205,[{0,3500},{1,5000},{2,1500}]},{206,[{0,3500},{1,5000},{2,1500}]},{207,[{0,3500},{1,5000},{2,1500}]},{208,[{0,3500},{1,5000},{2,1500}]},{209,[{0,3500},{1,5000},{2,1500}]},{210,[{0,3500},{1,5000},{2,1500}]},{211,[{0,3500},{1,5000},{2,1500}]},{212,[{0,3500},{1,5000},{2,1500}]},{213,[{0,3500},{1,5000},{2,1500}]}]
    };
get(2) ->
    #{
        id => 2,
        name => <<"大名府">>,
        quality => 2,
        win_reward => {290002,290052},
        lose_reward => {290102,290152},
        auction => [{3,[{3,5000},{4,5000}]},{2,[{2,5000},{3,5000}]},{1,[{1,5000},{2,5000}]},{9,[{3,5000},{4,5000}]},{10,[{2,5000},{3,5000}]},{4,[{2,5000},{3,5000}]}],
        daily_auction => [{3,[{2,5000},{3,5000}]},{2,[{1,5000},{2,5000}]},{1,[{1,5000},{2,5000}]},{9,[{0,5000},{0,5000}]},{10,[{0,5000},{0,5000}]},{4,[{1,5000},{2,5000}]},{101,[{0,5000},{1,4500},{2,500}]},{102,[{0,5000},{1,4500},{2,500}]},{103,[{0,5000},{1,4500},{2,500}]},{104,[{0,5000},{1,4500},{2,500}]},{105,[{0,5000},{1,4500},{2,500}]},{106,[{0,5000},{1,4500},{2,500}]},{107,[{0,5000},{1,4500},{2,500}]},{108,[{0,5000},{1,4500},{2,500}]},{109,[{0,5000},{1,4500},{2,500}]},{110,[{0,5000},{1,4500},{2,500}]},{111,[{0,5000},{1,4500},{2,500}]},{112,[{0,5000},{1,4500},{2,500}]},{113,[{0,5000},{1,4500},{2,500}]},{114,[{0,5000},{1,4500},{2,500}]},{115,[{0,5000},{1,4500},{2,500}]},{116,[{0,5000},{1,4500},{2,500}]},{201,[{0,5000},{1,4500},{2,500}]},{202,[{0,5000},{1,4500},{2,500}]},{203,[{0,5000},{1,4500},{2,500}]},{204,[{0,5000},{1,4500},{2,500}]},{205,[{0,5000},{1,4500},{2,500}]},{206,[{0,5000},{1,4500},{2,500}]},{207,[{0,5000},{1,4500},{2,500}]},{208,[{0,5000},{1,4500},{2,500}]},{209,[{0,5000},{1,4500},{2,500}]},{210,[{0,5000},{1,4500},{2,500}]},{211,[{0,5000},{1,4500},{2,500}]},{212,[{0,5000},{1,4500},{2,500}]},{213,[{0,5000},{1,4500},{2,500}]}]
    };
get(3) ->
    #{
        id => 3,
        name => <<"应天府">>,
        quality => 2,
        win_reward => {290003,290053},
        lose_reward => {290103,290153},
        auction => [{3,[{3,5000},{4,5000}]},{2,[{2,5000},{3,5000}]},{1,[{1,5000},{2,5000}]},{9,[{3,5000},{4,5000}]},{10,[{2,5000},{3,5000}]},{4,[{2,5000},{3,5000}]}],
        daily_auction => [{3,[{2,5000},{3,5000}]},{2,[{1,5000},{2,5000}]},{1,[{1,5000},{2,5000}]},{9,[{0,5000},{0,5000}]},{10,[{0,5000},{0,5000}]},{4,[{1,5000},{2,5000}]},{101,[{0,5000},{1,4500},{2,500}]},{102,[{0,5000},{1,4500},{2,500}]},{103,[{0,5000},{1,4500},{2,500}]},{104,[{0,5000},{1,4500},{2,500}]},{105,[{0,5000},{1,4500},{2,500}]},{106,[{0,5000},{1,4500},{2,500}]},{107,[{0,5000},{1,4500},{2,500}]},{108,[{0,5000},{1,4500},{2,500}]},{109,[{0,5000},{1,4500},{2,500}]},{110,[{0,5000},{1,4500},{2,500}]},{111,[{0,5000},{1,4500},{2,500}]},{112,[{0,5000},{1,4500},{2,500}]},{113,[{0,5000},{1,4500},{2,500}]},{114,[{0,5000},{1,4500},{2,500}]},{115,[{0,5000},{1,4500},{2,500}]},{116,[{0,5000},{1,4500},{2,500}]},{201,[{0,5000},{1,4500},{2,500}]},{202,[{0,5000},{1,4500},{2,500}]},{203,[{0,5000},{1,4500},{2,500}]},{204,[{0,5000},{1,4500},{2,500}]},{205,[{0,5000},{1,4500},{2,500}]},{206,[{0,5000},{1,4500},{2,500}]},{207,[{0,5000},{1,4500},{2,500}]},{208,[{0,5000},{1,4500},{2,500}]},{209,[{0,5000},{1,4500},{2,500}]},{210,[{0,5000},{1,4500},{2,500}]},{211,[{0,5000},{1,4500},{2,500}]},{212,[{0,5000},{1,4500},{2,500}]},{213,[{0,5000},{1,4500},{2,500}]}]
    };
get(4) ->
    #{
        id => 4,
        name => <<"雁北郡">>,
        quality => 1,
        win_reward => {290004,290054},
        lose_reward => {290104,290154},
        auction => [{3,[{2,5000},{3,5000}]},{2,[{1,5000},{2,5000}]},{1,[{0,5000},{1,5000}]},{9,[{2,5000},{3,5000}]},{10,[{1,5000},{2,5000}]},{4,[{1,5000},{2,5000}]}],
        daily_auction => [{3,[{1,5000},{2,5000}]},{2,[{0,5000},{1,5000}]},{1,[{0,5000},{1,5000}]},{9,[{0,5000},{0,5000}]},{10,[{0,5000},{0,5000}]},{4,[{0,5000},{1,5000}]},{101,[{0,5000},{1,3500},{2,0}]},{102,[{0,5000},{1,3500},{2,0}]},{103,[{0,5000},{1,3500},{2,0}]},{104,[{0,5000},{1,3500},{2,0}]},{105,[{0,5000},{1,3500},{2,0}]},{106,[{0,5000},{1,3500},{2,0}]},{107,[{0,5000},{1,3500},{2,0}]},{108,[{0,5000},{1,3500},{2,0}]},{109,[{0,5000},{1,3500},{2,0}]},{110,[{0,5000},{1,3500},{2,0}]},{111,[{0,5000},{1,3500},{2,0}]},{112,[{0,5000},{1,3500},{2,0}]},{113,[{0,5000},{1,3500},{2,0}]},{114,[{0,5000},{1,3500},{2,0}]},{115,[{0,5000},{1,3500},{2,0}]},{116,[{0,5000},{1,3500},{2,0}]},{201,[{0,5000},{1,3500},{2,0}]},{202,[{0,5000},{1,3500},{2,0}]},{203,[{0,5000},{1,3500},{2,0}]},{204,[{0,5000},{1,3500},{2,0}]},{205,[{0,5000},{1,3500},{2,0}]},{206,[{0,5000},{1,3500},{2,0}]},{207,[{0,5000},{1,3500},{2,0}]},{208,[{0,5000},{1,3500},{2,0}]},{209,[{0,5000},{1,3500},{2,0}]},{210,[{0,5000},{1,3500},{2,0}]},{211,[{0,5000},{1,3500},{2,0}]},{212,[{0,5000},{1,3500},{2,0}]},{213,[{0,5000},{1,3500},{2,0}]}]
    };
get(5) ->
    #{
        id => 5,
        name => <<"敦煌郡">>,
        quality => 1,
        win_reward => {290005,290055},
        lose_reward => {290105,290155},
        auction => [{3,[{2,5000},{3,5000}]},{2,[{1,5000},{2,5000}]},{1,[{0,5000},{1,5000}]},{9,[{2,5000},{3,5000}]},{10,[{1,5000},{2,5000}]},{4,[{1,5000},{2,5000}]}],
        daily_auction => [{3,[{1,5000},{2,5000}]},{2,[{0,5000},{1,5000}]},{1,[{0,5000},{1,5000}]},{9,[{0,5000},{0,5000}]},{10,[{0,5000},{0,5000}]},{4,[{0,5000},{1,5000}]},{101,[{0,5000},{1,3500},{2,0}]},{102,[{0,5000},{1,3500},{2,0}]},{103,[{0,5000},{1,3500},{2,0}]},{104,[{0,5000},{1,3500},{2,0}]},{105,[{0,5000},{1,3500},{2,0}]},{106,[{0,5000},{1,3500},{2,0}]},{107,[{0,5000},{1,3500},{2,0}]},{108,[{0,5000},{1,3500},{2,0}]},{109,[{0,5000},{1,3500},{2,0}]},{110,[{0,5000},{1,3500},{2,0}]},{111,[{0,5000},{1,3500},{2,0}]},{112,[{0,5000},{1,3500},{2,0}]},{113,[{0,5000},{1,3500},{2,0}]},{114,[{0,5000},{1,3500},{2,0}]},{115,[{0,5000},{1,3500},{2,0}]},{116,[{0,5000},{1,3500},{2,0}]},{201,[{0,5000},{1,3500},{2,0}]},{202,[{0,5000},{1,3500},{2,0}]},{203,[{0,5000},{1,3500},{2,0}]},{204,[{0,5000},{1,3500},{2,0}]},{205,[{0,5000},{1,3500},{2,0}]},{206,[{0,5000},{1,3500},{2,0}]},{207,[{0,5000},{1,3500},{2,0}]},{208,[{0,5000},{1,3500},{2,0}]},{209,[{0,5000},{1,3500},{2,0}]},{210,[{0,5000},{1,3500},{2,0}]},{211,[{0,5000},{1,3500},{2,0}]},{212,[{0,5000},{1,3500},{2,0}]},{213,[{0,5000},{1,3500},{2,0}]}]
    };
get(6) ->
    #{
        id => 6,
        name => <<"龙泉郡">>,
        quality => 1,
        win_reward => {290006,290056},
        lose_reward => {290106,290156},
        auction => [{3,[{2,5000},{3,5000}]},{2,[{1,5000},{2,5000}]},{1,[{0,5000},{1,5000}]},{9,[{2,5000},{3,5000}]},{10,[{1,5000},{2,5000}]},{4,[{1,5000},{2,5000}]}],
        daily_auction => [{3,[{1,5000},{2,5000}]},{2,[{0,5000},{1,5000}]},{1,[{0,5000},{1,5000}]},{9,[{0,5000},{0,5000}]},{10,[{0,5000},{0,5000}]},{4,[{0,5000},{1,5000}]},{101,[{0,5000},{1,3500},{2,0}]},{102,[{0,5000},{1,3500},{2,0}]},{103,[{0,5000},{1,3500},{2,0}]},{104,[{0,5000},{1,3500},{2,0}]},{105,[{0,5000},{1,3500},{2,0}]},{106,[{0,5000},{1,3500},{2,0}]},{107,[{0,5000},{1,3500},{2,0}]},{108,[{0,5000},{1,3500},{2,0}]},{109,[{0,5000},{1,3500},{2,0}]},{110,[{0,5000},{1,3500},{2,0}]},{111,[{0,5000},{1,3500},{2,0}]},{112,[{0,5000},{1,3500},{2,0}]},{113,[{0,5000},{1,3500},{2,0}]},{114,[{0,5000},{1,3500},{2,0}]},{115,[{0,5000},{1,3500},{2,0}]},{116,[{0,5000},{1,3500},{2,0}]},{201,[{0,5000},{1,3500},{2,0}]},{202,[{0,5000},{1,3500},{2,0}]},{203,[{0,5000},{1,3500},{2,0}]},{204,[{0,5000},{1,3500},{2,0}]},{205,[{0,5000},{1,3500},{2,0}]},{206,[{0,5000},{1,3500},{2,0}]},{207,[{0,5000},{1,3500},{2,0}]},{208,[{0,5000},{1,3500},{2,0}]},{209,[{0,5000},{1,3500},{2,0}]},{210,[{0,5000},{1,3500},{2,0}]},{211,[{0,5000},{1,3500},{2,0}]},{212,[{0,5000},{1,3500},{2,0}]},{213,[{0,5000},{1,3500},{2,0}]}]
    };
get(7) ->
    #{
        id => 7,
        name => <<"南海郡">>,
        quality => 1,
        win_reward => {290007,290057},
        lose_reward => {290107,290157},
        auction => [{3,[{2,5000},{3,5000}]},{2,[{1,5000},{2,5000}]},{1,[{0,5000},{1,5000}]},{9,[{2,5000},{3,5000}]},{10,[{1,5000},{2,5000}]},{4,[{1,5000},{2,5000}]}],
        daily_auction => [{3,[{1,5000},{2,5000}]},{2,[{0,5000},{1,5000}]},{1,[{0,5000},{1,5000}]},{9,[{0,5000},{0,5000}]},{10,[{0,5000},{0,5000}]},{4,[{0,5000},{1,5000}]},{101,[{0,5000},{1,3500},{2,0}]},{102,[{0,5000},{1,3500},{2,0}]},{103,[{0,5000},{1,3500},{2,0}]},{104,[{0,5000},{1,3500},{2,0}]},{105,[{0,5000},{1,3500},{2,0}]},{106,[{0,5000},{1,3500},{2,0}]},{107,[{0,5000},{1,3500},{2,0}]},{108,[{0,5000},{1,3500},{2,0}]},{109,[{0,5000},{1,3500},{2,0}]},{110,[{0,5000},{1,3500},{2,0}]},{111,[{0,5000},{1,3500},{2,0}]},{112,[{0,5000},{1,3500},{2,0}]},{113,[{0,5000},{1,3500},{2,0}]},{114,[{0,5000},{1,3500},{2,0}]},{115,[{0,5000},{1,3500},{2,0}]},{116,[{0,5000},{1,3500},{2,0}]},{201,[{0,5000},{1,3500},{2,0}]},{202,[{0,5000},{1,3500},{2,0}]},{203,[{0,5000},{1,3500},{2,0}]},{204,[{0,5000},{1,3500},{2,0}]},{205,[{0,5000},{1,3500},{2,0}]},{206,[{0,5000},{1,3500},{2,0}]},{207,[{0,5000},{1,3500},{2,0}]},{208,[{0,5000},{1,3500},{2,0}]},{209,[{0,5000},{1,3500},{2,0}]},{210,[{0,5000},{1,3500},{2,0}]},{211,[{0,5000},{1,3500},{2,0}]},{212,[{0,5000},{1,3500},{2,0}]},{213,[{0,5000},{1,3500},{2,0}]}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7].

get_by_quality(3) ->
    [1];
get_by_quality(2) ->
    [2, 3];
get_by_quality(1) ->
    [4, 5, 6, 7];
get_by_quality(_) ->
    [].

get_reward(true, 3) ->
    {290001,290051};
get_reward(false, 3) ->
    {290101,290151};
get_reward(true, 2) ->
    {290002,290052};
get_reward(false, 2) ->
    {290102,290152};
get_reward(true, 1) ->
    {290004,290054};
get_reward(false, 1) ->
    {290104,290154};
get_reward(_, _) ->
    {0, 0}.
