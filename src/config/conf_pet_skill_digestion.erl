%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽技能领悟
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_skill_digestion).

-export([
	get/2
]).


%% @doc 获取珍兽技能领悟配置
%% @spec get(PetCId, PetLv) -> SkillId.
%% PetCId = PetLv = SkillId     :: integer()
get(1001, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020019;
        true -> undefined
    end;
get(1002, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020019;
        true -> undefined
    end;
get(1003, Level) ->
    if
        5 =:= Level -> 16020006;
        15 =:= Level -> 16020001;
        true -> undefined
    end;
get(1004, Level) ->
    if
        5 =:= Level -> 16020010;
        15 =:= Level -> 16020001;
        true -> undefined
    end;
get(1005, Level) ->
    if
        5 =:= Level -> 16020006;
        15 =:= Level -> 16020002;
        true -> undefined
    end;
get(1006, Level) ->
    if
        5 =:= Level -> 16020007;
        15 =:= Level -> 16020002;
        true -> undefined
    end;
get(1007, Level) ->
    if
        5 =:= Level -> 16020006;
        15 =:= Level -> 16020003;
        true -> undefined
    end;
get(1008, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020003;
        true -> undefined
    end;
get(1009, Level) ->
    if
        5 =:= Level -> 16020006;
        15 =:= Level -> 16020004;
        25 =:= Level -> 16020012;
        true -> undefined
    end;
get(1010, Level) ->
    if
        5 =:= Level -> 16020009;
        15 =:= Level -> 16020003;
        25 =:= Level -> 16020018;
        true -> undefined
    end;
get(1011, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020005;
        25 =:= Level -> 16020022;
        true -> undefined
    end;
get(1012, Level) ->
    if
        5 =:= Level -> 16020010;
        15 =:= Level -> 16020003;
        25 =:= Level -> 16020016;
        true -> undefined
    end;
get(1013, Level) ->
    if
        5 =:= Level -> 16020009;
        15 =:= Level -> 16020004;
        25 =:= Level -> 16020017;
        true -> undefined
    end;
get(1014, Level) ->
    if
        5 =:= Level -> 16020006;
        15 =:= Level -> 16020002;
        true -> undefined
    end;
get(1015, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020006;
        25 =:= Level -> 16020017;
        true -> undefined
    end;
get(1016, Level) ->
    if
        5 =:= Level -> 16020009;
        15 =:= Level -> 16020001;
        25 =:= Level -> 16020018;
        true -> undefined
    end;
get(1017, Level) ->
    if
        5 =:= Level -> 16020007;
        15 =:= Level -> 16020002;
        25 =:= Level -> 16020013;
        true -> undefined
    end;
get(1018, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020004;
        25 =:= Level -> 16020017;
        true -> undefined
    end;
get(1019, Level) ->
    if
        5 =:= Level -> 16020009;
        15 =:= Level -> 16020002;
        true -> undefined
    end;
get(1020, Level) ->
    if
        5 =:= Level -> 16020007;
        15 =:= Level -> 16020004;
        25 =:= Level -> 16020013;
        true -> undefined
    end;
get(1021, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020005;
        25 =:= Level -> 16020017;
        true -> undefined
    end;
get(1022, Level) ->
    if
        5 =:= Level -> 16020006;
        15 =:= Level -> 16020001;
        25 =:= Level -> 16020018;
        true -> undefined
    end;
get(1023, Level) ->
    if
        5 =:= Level -> 16020010;
        15 =:= Level -> 16020002;
        25 =:= Level -> 16020012;
        35 =:= Level -> 16020016;
        true -> undefined
    end;
get(1024, Level) ->
    if
        5 =:= Level -> 16020008;
        15 =:= Level -> 16020002;
        25 =:= Level -> 16020019;
        35 =:= Level -> 16020016;
        true -> undefined
    end;
get(1025, Level) ->
    if
        5 =:= Level -> 16020009;
        15 =:= Level -> 16020001;
        25 =:= Level -> 16020017;
        35 =:= Level -> 16020015;
        true -> undefined
    end;
get(1026, Level) ->
    if
        5 =:= Level -> 16020010;
        15 =:= Level -> 16020004;
        25 =:= Level -> 16020013;
        35 =:= Level -> 16020012;
        true -> undefined
    end;
get(2001, Level) ->
    if
        5 =:= Level -> 16020016;
        15 =:= Level -> 16020008;
        25 =:= Level -> 16020002;
        35 =:= Level -> 16020019;
        45 =:= Level -> 16010010;
        true -> undefined
    end;
get(2002, Level) ->
    if
        5 =:= Level -> 16020016;
        15 =:= Level -> 16020009;
        25 =:= Level -> 16020004;
        35 =:= Level -> 16020017;
        45 =:= Level -> 16010013;
        true -> undefined
    end;
get(2003, Level) ->
    if
        5 =:= Level -> 16020024;
        15 =:= Level -> 16020010;
        25 =:= Level -> 16020004;
        35 =:= Level -> 16020012;
        45 =:= Level -> 16010011;
        true -> undefined
    end;
get(_PetCId, _Level) ->
    undefined.
