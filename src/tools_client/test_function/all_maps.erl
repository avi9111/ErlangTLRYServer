%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%`
%%% @end
%%% Created : 23. 九月 2019 21:37
%%%-------------------------------------------------------------------
-module(all_maps).
-author("Administrator").
-include("scene.hrl").
%% API
-export([all_maps/0]).

all_maps() ->
    lists:foldl(fun(H, Acc) ->
        case conf_scene:get(H) of
            #scene{name = Name} ->
                [{H, io_lib:format("~s", [binary_to_term(Name)])} | Acc];
            _ ->
                Acc
        end
    end, [], conf_scene:get_all_id()).
