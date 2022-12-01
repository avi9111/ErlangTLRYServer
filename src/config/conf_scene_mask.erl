%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      场景移动坐标配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_scene_mask).

-include("log.hrl").

-export([
    get_pos_mask/3,
    get_max_pos/1,
    get_mask/1
]).

%% Apis ------------------------------------------------

%% @doc 获取场景移动坐标配置
%% @spec get_pos_mask(SceneId, X, Y) -> Mask.
%% SceneId = X = Y = Mask       :: integer()
get_pos_mask(SceneId, X, Y) ->
    {MaxX, MaxY} = get_max_pos(SceneId),
    if
        X =< 0 orelse X > MaxX -> 0;
        Y =< 0 orelse Y > MaxY -> 0;
        true -> do_get_pos_mask(SceneId, X, Y)
    end.

%% @doc 获取场景移动坐标配置
%% @spec get_max_pos(SceneId) -> {X, Y}.
%% SceneId = X = Y      :: integer()
get_max_pos(10000) ->
    conf_scene_mask_10000:get_max_pos();
get_max_pos(10001) ->
    conf_scene_mask_10001:get_max_pos();
get_max_pos(10002) ->
    conf_scene_mask_10002:get_max_pos();
get_max_pos(10003) ->
    conf_scene_mask_10003:get_max_pos();
get_max_pos(10004) ->
    conf_scene_mask_10004:get_max_pos();
get_max_pos(10005) ->
    conf_scene_mask_10005:get_max_pos();
get_max_pos(10006) ->
    conf_scene_mask_10006:get_max_pos();
get_max_pos(10007) ->
    conf_scene_mask_10007:get_max_pos();
get_max_pos(10008) ->
    conf_scene_mask_10008:get_max_pos();
get_max_pos(10009) ->
    conf_scene_mask_10009:get_max_pos();
get_max_pos(10010) ->
    conf_scene_mask_10010:get_max_pos();
get_max_pos(10011) ->
    conf_scene_mask_10011:get_max_pos();
get_max_pos(10012) ->
    conf_scene_mask_10012:get_max_pos();
get_max_pos(10013) ->
    conf_scene_mask_10013:get_max_pos();
get_max_pos(10014) ->
    conf_scene_mask_10014:get_max_pos();
get_max_pos(11000) ->
    conf_scene_mask_11000:get_max_pos();
get_max_pos(11001) ->
    conf_scene_mask_11001:get_max_pos();
get_max_pos(20001) ->
    conf_scene_mask_20001:get_max_pos();
get_max_pos(20002) ->
    conf_scene_mask_20002:get_max_pos();
get_max_pos(20003) ->
    conf_scene_mask_20003:get_max_pos();
get_max_pos(20004) ->
    conf_scene_mask_20004:get_max_pos();
get_max_pos(20005) ->
    conf_scene_mask_20005:get_max_pos();
get_max_pos(20006) ->
    conf_scene_mask_20006:get_max_pos();
get_max_pos(20007) ->
    conf_scene_mask_20007:get_max_pos();
get_max_pos(20008) ->
    conf_scene_mask_20008:get_max_pos();
get_max_pos(20009) ->
    conf_scene_mask_20009:get_max_pos();
get_max_pos(20010) ->
    conf_scene_mask_20010:get_max_pos();
get_max_pos(20011) ->
    conf_scene_mask_20011:get_max_pos();
get_max_pos(20012) ->
    conf_scene_mask_20012:get_max_pos();
get_max_pos(20013) ->
    conf_scene_mask_20013:get_max_pos();
get_max_pos(20014) ->
    conf_scene_mask_20014:get_max_pos();
get_max_pos(20015) ->
    conf_scene_mask_20015:get_max_pos();
get_max_pos(20016) ->
    conf_scene_mask_20016:get_max_pos();
get_max_pos(20017) ->
    conf_scene_mask_20017:get_max_pos();
get_max_pos(20018) ->
    conf_scene_mask_20018:get_max_pos();
get_max_pos(20019) ->
    conf_scene_mask_20019:get_max_pos();
get_max_pos(20020) ->
    conf_scene_mask_20020:get_max_pos();
get_max_pos(20021) ->
    conf_scene_mask_20021:get_max_pos();
get_max_pos(20022) ->
    conf_scene_mask_20022:get_max_pos();
get_max_pos(20023) ->
    conf_scene_mask_20023:get_max_pos();
get_max_pos(20024) ->
    conf_scene_mask_20024:get_max_pos();
get_max_pos(20025) ->
    conf_scene_mask_20025:get_max_pos();
get_max_pos(20026) ->
    conf_scene_mask_20026:get_max_pos();
get_max_pos(20027) ->
    conf_scene_mask_20027:get_max_pos();
get_max_pos(20028) ->
    conf_scene_mask_20028:get_max_pos();
get_max_pos(20029) ->
    conf_scene_mask_20029:get_max_pos();
get_max_pos(20030) ->
    conf_scene_mask_20030:get_max_pos();
get_max_pos(30001) ->
    conf_scene_mask_30001:get_max_pos();
get_max_pos(30002) ->
    conf_scene_mask_30002:get_max_pos();
get_max_pos(30003) ->
    conf_scene_mask_30003:get_max_pos();
get_max_pos(30004) ->
    conf_scene_mask_30004:get_max_pos();
get_max_pos(30005) ->
    conf_scene_mask_30005:get_max_pos();
get_max_pos(30006) ->
    conf_scene_mask_30006:get_max_pos();
get_max_pos(30007) ->
    conf_scene_mask_30007:get_max_pos();
get_max_pos(30008) ->
    conf_scene_mask_30008:get_max_pos();
get_max_pos(30009) ->
    conf_scene_mask_30009:get_max_pos();
get_max_pos(30011) ->
    conf_scene_mask_30011:get_max_pos();
get_max_pos(30012) ->
    conf_scene_mask_30012:get_max_pos();
get_max_pos(30013) ->
    conf_scene_mask_30013:get_max_pos();
get_max_pos(30014) ->
    conf_scene_mask_30014:get_max_pos();
get_max_pos(31001) ->
    conf_scene_mask_31001:get_max_pos();
get_max_pos(31002) ->
    conf_scene_mask_31002:get_max_pos();
get_max_pos(31003) ->
    conf_scene_mask_31003:get_max_pos();
get_max_pos(31004) ->
    conf_scene_mask_31004:get_max_pos();
get_max_pos(31005) ->
    conf_scene_mask_31005:get_max_pos();
get_max_pos(31006) ->
    conf_scene_mask_31006:get_max_pos();
get_max_pos(40001) ->
    conf_scene_mask_40001:get_max_pos();
get_max_pos(40002) ->
    conf_scene_mask_40002:get_max_pos();
get_max_pos(40003) ->
    conf_scene_mask_40003:get_max_pos();
get_max_pos(40004) ->
    conf_scene_mask_40004:get_max_pos();
get_max_pos(40005) ->
    conf_scene_mask_40005:get_max_pos();
get_max_pos(40006) ->
    conf_scene_mask_40006:get_max_pos();
get_max_pos(40007) ->
    conf_scene_mask_40007:get_max_pos();
get_max_pos(40008) ->
    conf_scene_mask_40008:get_max_pos();
get_max_pos(40009) ->
    conf_scene_mask_40009:get_max_pos();
get_max_pos(40010) ->
    conf_scene_mask_40010:get_max_pos();
get_max_pos(40011) ->
    conf_scene_mask_40011:get_max_pos();
get_max_pos(40012) ->
    conf_scene_mask_40012:get_max_pos();
get_max_pos(40013) ->
    conf_scene_mask_40013:get_max_pos();
get_max_pos(40014) ->
    conf_scene_mask_40014:get_max_pos();
get_max_pos(50001) ->
    conf_scene_mask_50001:get_max_pos();
get_max_pos(50002) ->
    conf_scene_mask_50002:get_max_pos();
get_max_pos(50003) ->
    conf_scene_mask_50003:get_max_pos();
get_max_pos(50004) ->
    conf_scene_mask_50004:get_max_pos();
get_max_pos(50005) ->
    conf_scene_mask_50005:get_max_pos();
get_max_pos(50006) ->
    conf_scene_mask_50006:get_max_pos();
get_max_pos(50007) ->
    conf_scene_mask_50007:get_max_pos();
get_max_pos(50008) ->
    conf_scene_mask_50008:get_max_pos();
get_max_pos(50009) ->
    conf_scene_mask_50009:get_max_pos();
get_max_pos(50010) ->
    conf_scene_mask_50010:get_max_pos();
get_max_pos(60001) ->
    conf_scene_mask_60001:get_max_pos();
get_max_pos(70001) ->
    conf_scene_mask_70001:get_max_pos();
get_max_pos(70002) ->
    conf_scene_mask_70002:get_max_pos();
get_max_pos(70003) ->
    conf_scene_mask_70003:get_max_pos();
get_max_pos(70004) ->
    conf_scene_mask_70004:get_max_pos();
get_max_pos(70005) ->
    conf_scene_mask_70005:get_max_pos();
get_max_pos(70101) ->
    conf_scene_mask_70101:get_max_pos();
get_max_pos(70102) ->
    conf_scene_mask_70102:get_max_pos();
get_max_pos(70103) ->
    conf_scene_mask_70103:get_max_pos();
get_max_pos(70104) ->
    conf_scene_mask_70104:get_max_pos();
get_max_pos(70105) ->
    conf_scene_mask_70105:get_max_pos();
get_max_pos(71001) ->
    conf_scene_mask_71001:get_max_pos();
get_max_pos(SceneId) ->
    ?ERROR_FUNC_CALL(SceneId),
    {0, 0}.

%% @doc 获取场景标记
%% @spec get_mask(SceneId) -> {LineMask}.
%% LineMask             :: {PosMask}
%% SceneId = PosMask    :: integer()
get_mask(10000) ->
    catch conf_scene_mask_10000:get_mask();
get_mask(10001) ->
    catch conf_scene_mask_10001:get_mask();
get_mask(10002) ->
    catch conf_scene_mask_10002:get_mask();
get_mask(10003) ->
    catch conf_scene_mask_10003:get_mask();
get_mask(10004) ->
    catch conf_scene_mask_10004:get_mask();
get_mask(10005) ->
    catch conf_scene_mask_10005:get_mask();
get_mask(10006) ->
    catch conf_scene_mask_10006:get_mask();
get_mask(10007) ->
    catch conf_scene_mask_10007:get_mask();
get_mask(10008) ->
    catch conf_scene_mask_10008:get_mask();
get_mask(10009) ->
    catch conf_scene_mask_10009:get_mask();
get_mask(10010) ->
    catch conf_scene_mask_10010:get_mask();
get_mask(10011) ->
    catch conf_scene_mask_10011:get_mask();
get_mask(10012) ->
    catch conf_scene_mask_10012:get_mask();
get_mask(10013) ->
    catch conf_scene_mask_10013:get_mask();
get_mask(10014) ->
    catch conf_scene_mask_10014:get_mask();
get_mask(11000) ->
    catch conf_scene_mask_11000:get_mask();
get_mask(11001) ->
    catch conf_scene_mask_11001:get_mask();
get_mask(20001) ->
    catch conf_scene_mask_20001:get_mask();
get_mask(20002) ->
    catch conf_scene_mask_20002:get_mask();
get_mask(20003) ->
    catch conf_scene_mask_20003:get_mask();
get_mask(20004) ->
    catch conf_scene_mask_20004:get_mask();
get_mask(20005) ->
    catch conf_scene_mask_20005:get_mask();
get_mask(20006) ->
    catch conf_scene_mask_20006:get_mask();
get_mask(20007) ->
    catch conf_scene_mask_20007:get_mask();
get_mask(20008) ->
    catch conf_scene_mask_20008:get_mask();
get_mask(20009) ->
    catch conf_scene_mask_20009:get_mask();
get_mask(20010) ->
    catch conf_scene_mask_20010:get_mask();
get_mask(20011) ->
    catch conf_scene_mask_20011:get_mask();
get_mask(20012) ->
    catch conf_scene_mask_20012:get_mask();
get_mask(20013) ->
    catch conf_scene_mask_20013:get_mask();
get_mask(20014) ->
    catch conf_scene_mask_20014:get_mask();
get_mask(20015) ->
    catch conf_scene_mask_20015:get_mask();
get_mask(20016) ->
    catch conf_scene_mask_20016:get_mask();
get_mask(20017) ->
    catch conf_scene_mask_20017:get_mask();
get_mask(20018) ->
    catch conf_scene_mask_20018:get_mask();
get_mask(20019) ->
    catch conf_scene_mask_20019:get_mask();
get_mask(20020) ->
    catch conf_scene_mask_20020:get_mask();
get_mask(20021) ->
    catch conf_scene_mask_20021:get_mask();
get_mask(20022) ->
    catch conf_scene_mask_20022:get_mask();
get_mask(20023) ->
    catch conf_scene_mask_20023:get_mask();
get_mask(20024) ->
    catch conf_scene_mask_20024:get_mask();
get_mask(20025) ->
    catch conf_scene_mask_20025:get_mask();
get_mask(20026) ->
    catch conf_scene_mask_20026:get_mask();
get_mask(20027) ->
    catch conf_scene_mask_20027:get_mask();
get_mask(20028) ->
    catch conf_scene_mask_20028:get_mask();
get_mask(20029) ->
    catch conf_scene_mask_20029:get_mask();
get_mask(20030) ->
    catch conf_scene_mask_20030:get_mask();
get_mask(30001) ->
    catch conf_scene_mask_30001:get_mask();
get_mask(30002) ->
    catch conf_scene_mask_30002:get_mask();
get_mask(30003) ->
    catch conf_scene_mask_30003:get_mask();
get_mask(30004) ->
    catch conf_scene_mask_30004:get_mask();
get_mask(30005) ->
    catch conf_scene_mask_30005:get_mask();
get_mask(30006) ->
    catch conf_scene_mask_30006:get_mask();
get_mask(30007) ->
    catch conf_scene_mask_30007:get_mask();
get_mask(30008) ->
    catch conf_scene_mask_30008:get_mask();
get_mask(30009) ->
    catch conf_scene_mask_30009:get_mask();
get_mask(30011) ->
    catch conf_scene_mask_30011:get_mask();
get_mask(30012) ->
    catch conf_scene_mask_30012:get_mask();
get_mask(30013) ->
    catch conf_scene_mask_30013:get_mask();
get_mask(30014) ->
    catch conf_scene_mask_30014:get_mask();
get_mask(31001) ->
    catch conf_scene_mask_31001:get_mask();
get_mask(31002) ->
    catch conf_scene_mask_31002:get_mask();
get_mask(31003) ->
    catch conf_scene_mask_31003:get_mask();
get_mask(31004) ->
    catch conf_scene_mask_31004:get_mask();
get_mask(31005) ->
    catch conf_scene_mask_31005:get_mask();
get_mask(31006) ->
    catch conf_scene_mask_31006:get_mask();
get_mask(40001) ->
    catch conf_scene_mask_40001:get_mask();
get_mask(40002) ->
    catch conf_scene_mask_40002:get_mask();
get_mask(40003) ->
    catch conf_scene_mask_40003:get_mask();
get_mask(40004) ->
    catch conf_scene_mask_40004:get_mask();
get_mask(40005) ->
    catch conf_scene_mask_40005:get_mask();
get_mask(40006) ->
    catch conf_scene_mask_40006:get_mask();
get_mask(40007) ->
    catch conf_scene_mask_40007:get_mask();
get_mask(40008) ->
    catch conf_scene_mask_40008:get_mask();
get_mask(40009) ->
    catch conf_scene_mask_40009:get_mask();
get_mask(40010) ->
    catch conf_scene_mask_40010:get_mask();
get_mask(40011) ->
    catch conf_scene_mask_40011:get_mask();
get_mask(40012) ->
    catch conf_scene_mask_40012:get_mask();
get_mask(40013) ->
    catch conf_scene_mask_40013:get_mask();
get_mask(40014) ->
    catch conf_scene_mask_40014:get_mask();
get_mask(50001) ->
    catch conf_scene_mask_50001:get_mask();
get_mask(50002) ->
    catch conf_scene_mask_50002:get_mask();
get_mask(50003) ->
    catch conf_scene_mask_50003:get_mask();
get_mask(50004) ->
    catch conf_scene_mask_50004:get_mask();
get_mask(50005) ->
    catch conf_scene_mask_50005:get_mask();
get_mask(50006) ->
    catch conf_scene_mask_50006:get_mask();
get_mask(50007) ->
    catch conf_scene_mask_50007:get_mask();
get_mask(50008) ->
    catch conf_scene_mask_50008:get_mask();
get_mask(50009) ->
    catch conf_scene_mask_50009:get_mask();
get_mask(50010) ->
    catch conf_scene_mask_50010:get_mask();
get_mask(60001) ->
    catch conf_scene_mask_60001:get_mask();
get_mask(70001) ->
    catch conf_scene_mask_70001:get_mask();
get_mask(70002) ->
    catch conf_scene_mask_70002:get_mask();
get_mask(70003) ->
    catch conf_scene_mask_70003:get_mask();
get_mask(70004) ->
    catch conf_scene_mask_70004:get_mask();
get_mask(70005) ->
    catch conf_scene_mask_70005:get_mask();
get_mask(70101) ->
    catch conf_scene_mask_70101:get_mask();
get_mask(70102) ->
    catch conf_scene_mask_70102:get_mask();
get_mask(70103) ->
    catch conf_scene_mask_70103:get_mask();
get_mask(70104) ->
    catch conf_scene_mask_70104:get_mask();
get_mask(70105) ->
    catch conf_scene_mask_70105:get_mask();
get_mask(71001) ->
    catch conf_scene_mask_71001:get_mask();
get_mask(SceneId) ->
    ?ERROR_FUNC_CALL(SceneId),
    {}.

%% Privates --------------------------------------------

do_get_pos_mask(SceneId, X, Y) ->
    case get_mask(SceneId) of
        {} -> 0;
        Mask -> element(X, element(Y, Mask))
    end.

