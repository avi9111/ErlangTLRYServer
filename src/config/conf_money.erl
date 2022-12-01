%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_money
%% @Brief  : 货币类型
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_money).

-export([
    get/1,
    get_ids/0,
    field_id/1,
    ret_code/1,
    asset_field/1
]).

get(2) ->
    #{
        id => 2,
        name => <<"元宝">>,
        field => gold,
        code => 3        
    };
get(3) ->
    #{
        id => 3,
        name => <<"绑元">>,
        field => bgold,
        code => 4        
    };
get(4) ->
    #{
        id => 4,
        name => <<"铜钱">>,
        field => coin,
        code => 5        
    };
get(9) ->
    #{
        id => 9,
        name => <<"友情币">>,
        field => fcoin,
        code => 6        
    };
get(10) ->
    #{
        id => 10,
        name => <<"帮会贡献">>,
        field => cont,
        code => 7        
    };
get(11) ->
    #{
        id => 11,
        name => <<"声望">>,
        field => credit,
        code => 8        
    };
get(12) ->
    #{
        id => 12,
        name => <<"帮会通宝">>,
        field => currency,
        code => 11        
    };
get(13) ->
    #{
        id => 13,
        name => <<"绑元优先">>,
        field => undefined,
        code => 3        
    };
get(14) ->
    #{
        id => 14,
        name => <<"打造积分">>,
        field => forge_score,
        code => 12        
    };
get(15) ->
    #{
        id => 15,
        name => <<"百炼精华">>,
        field => essence,
        code => 13        
    };
get(16) ->
    #{
        id => 16,
        name => <<"侠义值">>,
        field => emprise,
        code => 14        
    };
get(17) ->
    #{
        id => 17,
        name => <<"银两">>,
        field => silver,
        code => 15        
    };
get(18) ->
    #{
        id => 18,
        name => <<"储备元宝">>,
        field => sgold,
        code => 16        
    };
get(19) ->
    #{
        id => 19,
        name => <<"许愿果">>,
        field => wfruit,
        code => 17        
    };
get(20) ->
    #{
        id => 20,
        name => <<"宝珠">>,
        field => tball,
        code => 18        
    };
get(21) ->
    #{
        id => 21,
        name => <<"积分">>,
        field => jifen,
        code => 19        
    };
get(22) ->
    #{
        id => 22,
        name => <<"桃李值">>,
        field => peach_value,
        code => 20        
    };
get(23) ->
    #{
        id => 23,
        name => <<"历史恩爱值">>,
        field => love_value,
        code => 21        
    };
get(24) ->
    #{
        id => 24,
        name => <<"天命印记">>,
        field => fate_token,
        code => 22        
    };
get(25) ->
    #{
        id => 25,
        name => <<"储备元宝优先">>,
        field => undefined,
        code => 3        
    };
get(26) ->
    #{
        id => 26,
        name => <<"宋辽积分">>,
        field => song_liao,
        code => 24        
    };
get(32) ->
    #{
        id => 32,
        name => <<"龙元精粹">>,
        field => serum,
        code => 26        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [2, 3, 4, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 32].

asset_field(2) ->
    gold;
asset_field(3) ->
    bgold;
asset_field(4) ->
    coin;
asset_field(9) ->
    fcoin;
asset_field(10) ->
    cont;
asset_field(11) ->
    credit;
asset_field(12) ->
    currency;
asset_field(14) ->
    forge_score;
asset_field(15) ->
    essence;
asset_field(16) ->
    emprise;
asset_field(17) ->
    silver;
asset_field(18) ->
    sgold;
asset_field(19) ->
    wfruit;
asset_field(20) ->
    tball;
asset_field(21) ->
    jifen;
asset_field(22) ->
    peach_value;
asset_field(23) ->
    love_value;
asset_field(24) ->
    fate_token;
asset_field(26) ->
    song_liao;
asset_field(32) ->
    serum;
asset_field(_ID) ->
    erlang:throw({error, 27}).

field_id(gold) ->
    2;
field_id(bgold) ->
    3;
field_id(coin) ->
    4;
field_id(fcoin) ->
    9;
field_id(cont) ->
    10;
field_id(credit) ->
    11;
field_id(currency) ->
    12;
field_id(forge_score) ->
    14;
field_id(essence) ->
    15;
field_id(emprise) ->
    16;
field_id(silver) ->
    17;
field_id(sgold) ->
    18;
field_id(wfruit) ->
    19;
field_id(tball) ->
    20;
field_id(jifen) ->
    21;
field_id(peach_value) ->
    22;
field_id(love_value) ->
    23;
field_id(fate_token) ->
    24;
field_id(song_liao) ->
    26;
field_id(serum) ->
    32;
field_id(_ID) ->
    0.

ret_code(2) ->
    3;
ret_code(3) ->
    4;
ret_code(4) ->
    5;
ret_code(9) ->
    6;
ret_code(10) ->
    7;
ret_code(11) ->
    8;
ret_code(12) ->
    11;
ret_code(13) ->
    3;
ret_code(14) ->
    12;
ret_code(15) ->
    13;
ret_code(16) ->
    14;
ret_code(17) ->
    15;
ret_code(18) ->
    16;
ret_code(19) ->
    17;
ret_code(20) ->
    18;
ret_code(21) ->
    19;
ret_code(22) ->
    20;
ret_code(23) ->
    21;
ret_code(24) ->
    22;
ret_code(25) ->
    3;
ret_code(26) ->
    24;
ret_code(32) ->
    26;
ret_code(_ID) ->
    erlang:throw({error, 27}).
