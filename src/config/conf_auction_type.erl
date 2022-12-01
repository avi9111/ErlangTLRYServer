%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_auction_type
%% @Brief  : 拍卖来源
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_auction_type).

-export([
    get/1,
    get_ids/0,
    get_name/1
]).

get(1) ->
    #{
        type => 1,
        name => <<"武林禁地">>
    };
get(2) ->
    #{
        type => 2,
        name => <<"武林盟主">>
    };
get(3) ->
    #{
        type => 3,
        name => <<"帮会守卫战">>
    };
get(4) ->
    #{
        type => 4,
        name => <<"演武堂">>
    };
get(5) ->
    #{
        type => 5,
        name => <<"领地福利">>
    };
get(6) ->
    #{
        type => 6,
        name => <<"领地战">>
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6].

get_name(1) ->
    <<"武林禁地">>;
get_name(2) ->
    <<"武林盟主">>;
get_name(3) ->
    <<"帮会守卫战">>;
get_name(4) ->
    <<"演武堂">>;
get_name(5) ->
    <<"领地福利">>;
get_name(6) ->
    <<"领地战">>;
get_name(_ID) ->
    <<"">>.
