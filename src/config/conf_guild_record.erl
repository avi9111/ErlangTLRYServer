%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_record
%% @Brief  : 帮派记录
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_guild_record).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        desc => <<"<font color='#18ff00'>~s</font> 加入了帮会">>
    };
get(2) ->
    #{
        id => 2,
        desc => <<"<font color='#18ff00'>~s</font> 离开了帮会">>
    };
get(3) ->
    #{
        id => 3,
        desc => <<"<font color='#18ff00'>~s</font> 被踢出了帮会">>
    };
get(4) ->
    #{
        id => 4,
        desc => <<"<font color='#18ff00'>~s</font> 成为了<font color='#18ff00'>~s</font>">>
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4].
