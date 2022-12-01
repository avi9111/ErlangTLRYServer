%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      充值配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_recharge).

-include("log.hrl").

-export([
    get/1,
    get_all_product/1
]).


%% Apis ------------------------------------------------
%% @doc 获取充值配置
%% @spec get(ProductId) -> #{} | undefined.
%% ProductId    :: integer()
%%get(1) ->
%%    #{
%%        os => 1,
%%        product_id => 1,
%%        gold => 60,
%%        rmb => 30,
%%        extra_gold => 6,
%%        total_gold => 66,
%%        first_rebate => 0,
%%        product_name => <<"60元宝">>
%%    };
get(1) ->
    #{
        os => 1,
        product_id => 1,
        gold => 200,
        rmb => 100,
        extra_gold => 20,
        total_gold => 220,
        first_rebate => 0,
        product_name => <<"200元宝">>
    };
get(2) ->
    #{
        os => 1,
        product_id => 2,
        gold => 500,
        rmb => 250,
        extra_gold => 50,
        total_gold => 550,
        first_rebate => 0,
        product_name => <<"500元宝">>
    };
get(3) ->
    #{
        os => 1,
        product_id => 3,
        gold => 680,
        rmb => 340,
        extra_gold => 78,
        total_gold => 758,
        first_rebate => 0,
        product_name => <<"680元宝">>
    };
get(4) ->
    #{
        os => 1,
        product_id => 4,
        gold => 1280,
        rmb => 640,
        extra_gold => 156,
        total_gold => 1436,
        first_rebate => 0,
        product_name => <<"1280元宝">>
    };
get(5) ->
    #{
        os => 1,
        product_id => 5,
        gold => 1980,
        rmb => 990,
        extra_gold => 288,
        total_gold => 2268,
        first_rebate => 0,
        product_name => <<"1980元宝">>
    };
get(6) ->
    #{
        os => 1,
        product_id => 6,
        gold => 3280,
        rmb => 1640,
        extra_gold => 518,
        total_gold => 3798,
        first_rebate => 0,
        product_name => <<"3280元宝">>
    };
get(7) ->
    #{
        os => 1,
        product_id => 7,
        gold => 4880,
        rmb => 2440,
        extra_gold => 888,
        total_gold => 5768,
        first_rebate => 0,
        product_name => <<"4880元宝">>
    };
get(8) ->
    #{
        os => 1,
        product_id => 8,
        gold => 6480,
        rmb => 3240,
        extra_gold => 1288,
        total_gold => 7768,
        first_rebate => 0,
        product_name => <<"6480元宝">>
    };
get(11) ->
    #{
        os => 2,
        product_id => 11,
        gold => 60,
        rmb => 6,
        extra_gold => 6,
        total_gold => 66,
        first_rebate => 0,
        product_name => <<"60元宝">>
    };
get(12) ->
    #{
        os => 2,
        product_id => 12,
        gold => 300,
        rmb => 30,
        extra_gold => 33,
        total_gold => 333,
        first_rebate => 0,
        product_name => <<"300元宝">>
    };
get(13) ->
    #{
        os => 2,
        product_id => 13,
        gold => 680,
        rmb => 68,
        extra_gold => 78,
        total_gold => 758,
        first_rebate => 0,
        product_name => <<"680元宝">>
    };
get(14) ->
    #{
        os => 2,
        product_id => 14,
        gold => 1280,
        rmb => 128,
        extra_gold => 156,
        total_gold => 1436,
        first_rebate => 0,
        product_name => <<"1280元宝">>
    };
get(15) ->
    #{
        os => 2,
        product_id => 15,
        gold => 1980,
        rmb => 198,
        extra_gold => 288,
        total_gold => 2268,
        first_rebate => 0,
        product_name => <<"1980元宝">>
    };
get(16) ->
    #{
        os => 2,
        product_id => 16,
        gold => 3280,
        rmb => 328,
        extra_gold => 518,
        total_gold => 3798,
        first_rebate => 0,
        product_name => <<"3280元宝">>
    };
get(17) ->
    #{
        os => 2,
        product_id => 17,
        gold => 4880,
        rmb => 488,
        extra_gold => 888,
        total_gold => 5768,
        first_rebate => 0,
        product_name => <<"4880元宝">>
    };
get(18) ->
    #{
        os => 2,
        product_id => 18,
        gold => 6480,
        rmb => 648,
        extra_gold => 1288,
        total_gold => 7768,
        first_rebate => 0,
        product_name => <<"6480元宝">>
    };
get(ProductId) ->
    ?ERROR_FUNC_CALL([ProductId]),
    undefined.


%% @doc 获取所有充值档次
%% @spec get_all_product(OS) -> [ProductId].
%% OS           :: 1 | 2
%% ProductId    :: integer()
get_all_product(1) ->
    [1, 2, 3, 4, 5, 6, 7, 8];
get_all_product(2) ->
    [11, 12, 13, 14, 15, 16, 17, 18];
get_all_product(_OS) ->
    [].
