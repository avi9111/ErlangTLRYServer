%% -*- coding: latin-1 -*-
%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主 - 积分记录
%%% @end
%%% ----------------------------------------------------------------------------
-module(conf_master_log).
-author("Ryuu").

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        template => <<"~s挑战盟主获得~w积分">>
    };
get(2) ->
    #{
        id => 2,
        template => <<"~s掠夺~s获得~w积分">>
    };
get(3) ->
    #{
        id => 3,
        template => <<"~s掠夺~s失败，没有获得积分">>
    };
get(4) ->
    #{
        id => 4,
        template => <<"~s被~s掠夺损失~w积分">>
    };
get(5) ->
    #{
        id => 5,
        template => <<"~s被~s掠夺，但没有损失积分">>
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5].
