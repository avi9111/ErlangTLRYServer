%%-------------------------------------------------------
%% @File     : hot
%% @Brief    : 热更模块
%% @Author   : cablsbs
%% @Date     : 2018-9-21
%%-------------------------------------------------------
-module(hot).

-include("common.hrl").

-export([
    hot_reload/0,
    scan_changed/0
]).


%% Apis -------------------------------------------------
% @doc 智能热更
hot_reload() ->
    ChangedMods = scan_changed(),
    [c:nl(Mod) || Mod <- ChangedMods],
    ChangedMods.

% @doc 获取改变的beam
scan_changed() ->
    EbinPath = get_ebin_path(),
    AllBeam = all_beam(EbinPath),
    ScanFun = fun(Beam, AccModules) ->
        ModStr = filename:basename(Beam, ".beam"),
        Module = list_to_atom(ModStr),
        Md5 = Module:module_info(md5),
        BeamFileName = EbinPath ++ Beam,
        {ok, {_, Md5N}} = beam_lib:md5(BeamFileName),
        case Md5 =:= Md5N of
            true -> AccModules;
            false -> [Module | AccModules]
        end
    end,
    lists:foldl(ScanFun, [], AllBeam).


%% Privates ---------------------------------------------
% @doc 根据具体环境计算ebin目录
-ifndef(app_ebin).

get_ebin_path() ->
    "ebin/".

-else.

get_ebin_path() ->
    case config:is_release() of
        false -> ?app_ebin;
        true -> "ebin/"
    end.

-endif.

% @doc 获取指定目录下所有模块
all_beam(EbinDir) ->
    filelib:wildcard("*.beam", type:object_to_list(EbinDir)).
