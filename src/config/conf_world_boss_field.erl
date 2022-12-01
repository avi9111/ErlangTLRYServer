%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      世界boss领地配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_world_boss_field).

-include("log.hrl").

-export([
    get_layer/1,
    get_field/1,
    get_layers/0,
    get_layers/1,
    get_layer_field/1
]).


%% Apis ------------------------------------------------
%% @doc 获取世界boss领地层数配置
%% @spec get_layer(LayerId) -> Layer.
%% LayerId  :: integer()
%% Layer    :: #{} | undefined
get_layer(1) ->
    #{
        layer => 1,
        min_guild_lv => 0,
        max_guild_lv => 100,
        is_cross => 0,
        fields => [1, 2, 3, 4, 5]
    };
get_layer(2) ->
    #{
        layer => 2,
        min_guild_lv => 0,
        max_guild_lv => 100,
        is_cross => 0,
        fields => [6, 7, 8]
    };
get_layer(3) ->
    #{
        layer => 3,
        min_guild_lv => 0,
        max_guild_lv => 100,
        is_cross => 0,
        fields => [9, 10]
    };
get_layer(LayerId) ->
    ?ERROR_FUNC_CALL(LayerId),
    undefined.


%% @doc 获取世界boss领地配置
%% @spec get_field(FieldId) -> Field.
%% FieldId  :: integer()
%% Field    :: #{} | undefined
get_field(1) ->
    #{
        scene_id => 50001,
        world_lv => 1,
        boss_list => [160101, 160102, 160103],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 3,
        field_name => <<"无量玉璧">>
    };
get_field(2) ->
    #{
        scene_id => 50002,
        world_lv => 1,
        boss_list => [160201, 160202, 160203],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 3,
        field_name => <<"还施水阁">>
    };
get_field(3) ->
    #{
        scene_id => 50003,
        world_lv => 1,
        boss_list => [160301, 160302, 160303],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 3,
        field_name => <<"西夏一品堂">>
    };
get_field(4) ->
    #{
        scene_id => 50004,
        world_lv => 1,
        boss_list => [160401, 160402, 160403],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 3,
        field_name => <<"珍珑棋阵">>
    };
get_field(5) ->
    #{
        scene_id => 50005,
        world_lv => 1,
        boss_list => [160501, 160502, 160503],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 1,
        field_name => <<"大理皇陵">>
    };
get_field(6) ->
    #{
        scene_id => 50006,
        world_lv => 1,
        boss_list => [160601, 160602, 160603],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 2,
        field_name => <<"灵鹫宫">>
    };
get_field(7) ->
    #{
        scene_id => 50007,
        world_lv => 1,
        boss_list => [160701, 160702, 160703],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 2,
        field_name => <<"星宿毒窟">>
    };
get_field(8) ->
    #{
        scene_id => 50008,
        world_lv => 1,
        boss_list => [160801, 160802, 160803],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 2,
        field_name => <<"吐蕃国寺">>
    };
get_field(9) ->
    #{
        scene_id => 50009,
        world_lv => 1,
        boss_list => [160901, 160902, 160903],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 2,
        field_name => <<"西夏后宫">>
    };
get_field(10) ->
    #{
        scene_id => 50010,
        world_lv => 1,
        boss_list => [161001, 161002, 161003],
        born_pos => [{162,268}, {270,306}, {372,258}],
        role_lmt => {50, 100},
        max_lines => 1,
        field_name => <<"雁门关">>
    };
get_field(FieldId) ->
    ?ERROR_FUNC_CALL(FieldId),
    undefined.


%% @doc 获取所有层数
%% @spec get_layers() -> Layers.
%% Layers   :: [integer()]
get_layers() ->
    [1, 2, 3].


%% @doc 根据节点获取所有层数
%% @spec get_layers(NodeId) -> Layers.
%% NodeId   :: integer()
%% Layers   :: [integer()]
get_layers(10) ->
    [1, 2, 3];
get_layers(_NodeId) ->
    [].


%% @doc 根据场景id对应的层数及领地id
%% @spec get_layer_field(SceneId) -> {Layer, FieldId} | undefined.
%% SceneId          :: integer()
%% Layer = FieldId  :: integer()
get_layer_field(50001) ->
    {1, 1};
get_layer_field(50002) ->
    {1, 2};
get_layer_field(50003) ->
    {1, 3};
get_layer_field(50004) ->
    {1, 4};
get_layer_field(50005) ->
    {1, 5};
get_layer_field(50006) ->
    {2, 6};
get_layer_field(50007) ->
    {2, 7};
get_layer_field(50008) ->
    {2, 8};
get_layer_field(50009) ->
    {3, 9};
get_layer_field(50010) ->
    {3, 10};
get_layer_field(_SceneId) ->
    undefined.
