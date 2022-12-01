%%-------------------------------------------------------
%% @File     : tester.erl
%% @Brief    : 测试逻辑
%% @Author   : cablsbs
%% @Date     : 2017-3-27
%%-------------------------------------------------------
-module(tester).

-include("log.hrl").
-include("tester.hrl").
-include("scene.hrl").

-export([
    test_record_and_maps/0,
    test_record_and_maps/2,

    test_get_pos_mask/0,
    test_get_pos_mask/2,

    test_map_dict_set/0,
    test_map_dict_set/2
]).


%% Apis ------------------------------
test_record_and_maps() ->
    test_record_and_maps(10000, 20).

test_record_and_maps(Repeat, FindSize) ->
    Maps = ?test_map,
    Record = #test_record{},
    {ToFindKeys, ToFindIndexes} = gen_record_and_maps_material(FindSize),
    UpRecordFun = fun(I, R) -> update_record_field(R, I) end,
    UpMapFun = fun(K, M) -> update_map_field(M, K) end,
    F1 = fun(_) -> lists:foldl(UpRecordFun, Record, ToFindIndexes) end,
    F2 = fun(_) -> lists:foldl(UpMapFun, Maps, ToFindKeys) end,
    Tester = [
        {"update_record_field/2", F1},
        {"update_map_field/2", F2}
    ],
    test:time_compare(Repeat, Tester).

test_get_pos_mask() ->
    test_get_pos_mask(1000, 100).

test_get_pos_mask(Repeat, SceneId) ->
    #scene{width = Width, height = Height} = conf_scene:get(SceneId),
    GetMask = fun(_) -> conf_scene_mask:get_pos_mask(SceneId, util:rand(1, Width), util:rand(1, Height)) end,
    GetMask2 = fun(_) -> conf_scene_mask2:get_pos_mask(SceneId, util:rand(1, Width), util:rand(1, Height)) end,

    Tester = [
        {"conf_scene_mask", GetMask},
        {"conf_scene_mask2", GetMask2}
    ],
    test:time_compare(Repeat, Tester).

test_map_dict_set() ->
    test_map_dict_set(10000, 30).

test_map_dict_set(Repeat, Size) ->
    Keys = [Size+1, Size+2 | [Size div I || I <- lists:seq(1,6)]],
    Map = maps:from_list([{I, 0} || I <-lists:seq(1, Size)]),
    Dict = dict:from_list([{I, 0} || I <-lists:seq(1, Size)]),
    Set = sets:from_list([I || I <-lists:seq(1, Size)]),
    F1 = fun(_) -> {maps:keys(Map), [maps:is_key(K, Map) || K <- Keys]}  end,
    F2 = fun(_) -> {dict:fetch_keys(Dict), [dict:is_key(K, Dict) || K <- Keys]} end,
    F3 = fun(_) -> {sets:to_list(Set), [sets:is_element(K, Set) || K <- Keys]} end,
    Tester = [
        {"map/2", F1},
        {"dict/2", F2},
        {"set/2", F3}
    ],
    test:time_compare(Repeat, Tester).


%% Privates --------------------------
gen_record_and_maps_material(FindSize) ->
    ToFindKeys = [
        begin
            [Key | _] = util:list_disorder(?test_keys),
            Key
        end || _ <- lists:seq(1, FindSize)
    ],
    ToFindIndexes = [util:rand(2, 51) || _ <- lists:seq(1, FindSize)],
    {ToFindKeys, ToFindIndexes}.

update_record_field(Record, Index) ->
    Value = element(Index, Record),
    setelement(Index, Record, Value + 5).

update_map_field(Map, Key) ->
    Value = maps:get(Key, Map),
    maps:put(Key, Value + 5, Map).
