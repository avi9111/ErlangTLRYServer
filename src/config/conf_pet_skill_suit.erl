%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽技能套装
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_skill_suit).

-export([
	get/4
]).


%% @doc 获取珍兽技能套装配置
%% @spec get(CarryLv, SuitLv, Quality, AtkType) -> AttrL.
%% CarryLv = SuitLv = AtkType   :: integer()
%% AttrL                        :: [{Type, Val}]
get(5, SuitLv, Quality, AtkType) ->
    if
    1 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,1800},{1,4861}];
          AtkType =:= 2 -> [{6,1800},{1,4861}];
          AtkType =:= 3 -> [{1,19444}];
          true -> []
        end;
    2 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,685},{10,171}];
          AtkType =:= 2 -> [{9,685},{10,171}];
          AtkType =:= 3 -> [{9,685},{10,171}];
          true -> []
        end;
    3 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,131}];
          AtkType =:= 2 -> [{11,131}];
          AtkType =:= 3 -> [{7,1600},{8,1600}];
          true -> []
        end;
    4 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,40}];
          AtkType =:= 2 -> [{106,40}];
          AtkType =:= 3 -> [{106,40}];
          true -> []
        end;
    5 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,28}];
          AtkType =:= 2 -> [{106,28}];
          AtkType =:= 3 -> [{106,28}];
          true -> []
        end;
    6 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1506},{10,428}];
          AtkType =:= 2 -> [{9,1506},{10,428}];
          AtkType =:= 3 -> [{9,1506},{10,428}];
          true -> []
        end;
    7 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2705},{12,131}];
          AtkType =:= 2 -> [{6,2705},{12,131}];
          AtkType =:= 3 -> [{1,8703},{12,131}];
          true -> []
        end;
    1 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,1800},{1,4861}];
          AtkType =:= 2 -> [{6,1800},{1,4861}];
          AtkType =:= 3 -> [{1,19444}];
          true -> []
        end;
    2 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,685},{10,171}];
          AtkType =:= 2 -> [{9,685},{10,171}];
          AtkType =:= 3 -> [{9,685},{10,171}];
          true -> []
        end;
    3 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,131}];
          AtkType =:= 2 -> [{11,131}];
          AtkType =:= 3 -> [{7,1600},{8,1600}];
          true -> []
        end;
    4 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,40}];
          AtkType =:= 2 -> [{106,40}];
          AtkType =:= 3 -> [{106,40}];
          true -> []
        end;
    5 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,28}];
          AtkType =:= 2 -> [{106,28}];
          AtkType =:= 3 -> [{106,28}];
          true -> []
        end;
    6 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1506},{10,428}];
          AtkType =:= 2 -> [{9,1506},{10,428}];
          AtkType =:= 3 -> [{9,1506},{10,428}];
          true -> []
        end;
    7 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2705},{12,131}];
          AtkType =:= 2 -> [{6,2705},{12,131}];
          AtkType =:= 3 -> [{1,8703},{12,131}];
          true -> []
        end;
    1 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,1800},{1,4861}];
          AtkType =:= 2 -> [{6,1800},{1,4861}];
          AtkType =:= 3 -> [{1,19444}];
          true -> []
        end;
    2 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,685},{10,171}];
          AtkType =:= 2 -> [{9,685},{10,171}];
          AtkType =:= 3 -> [{9,685},{10,171}];
          true -> []
        end;
    3 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,131}];
          AtkType =:= 2 -> [{11,131}];
          AtkType =:= 3 -> [{7,1600},{8,1600}];
          true -> []
        end;
    4 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,40}];
          AtkType =:= 2 -> [{106,40}];
          AtkType =:= 3 -> [{106,40}];
          true -> []
        end;
    5 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,28}];
          AtkType =:= 2 -> [{106,28}];
          AtkType =:= 3 -> [{106,28}];
          true -> []
        end;
    6 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1506},{10,428}];
          AtkType =:= 2 -> [{9,1506},{10,428}];
          AtkType =:= 3 -> [{9,1506},{10,428}];
          true -> []
        end;
    7 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2705},{12,131}];
          AtkType =:= 2 -> [{6,2705},{12,131}];
          AtkType =:= 3 -> [{1,8703},{12,131}];
          true -> []
        end;
      true ->
        []
    end;
get(25, SuitLv, Quality, AtkType) ->
    if
    1 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2161},{1,5835}];
          AtkType =:= 2 -> [{6,2161},{1,5835}];
          AtkType =:= 3 -> [{1,23340}];
          true -> []
        end;
    2 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,822},{10,206}];
          AtkType =:= 2 -> [{9,822},{10,206}];
          AtkType =:= 3 -> [{9,822},{10,206}];
          true -> []
        end;
    3 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,158}];
          AtkType =:= 2 -> [{11,158}];
          AtkType =:= 3 -> [{7,1921},{8,1921}];
          true -> []
        end;
    4 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,49}];
          AtkType =:= 2 -> [{106,49}];
          AtkType =:= 3 -> [{106,49}];
          true -> []
        end;
    5 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,33}];
          AtkType =:= 2 -> [{106,33}];
          AtkType =:= 3 -> [{106,33}];
          true -> []
        end;
    6 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1808},{10,514}];
          AtkType =:= 2 -> [{9,1808},{10,514}];
          AtkType =:= 3 -> [{9,1808},{10,514}];
          true -> []
        end;
    7 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3247},{12,158}];
          AtkType =:= 2 -> [{6,3247},{12,158}];
          AtkType =:= 3 -> [{1,10447},{12,158}];
          true -> []
        end;
    1 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2161},{1,5835}];
          AtkType =:= 2 -> [{6,2161},{1,5835}];
          AtkType =:= 3 -> [{1,23340}];
          true -> []
        end;
    2 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,822},{10,206}];
          AtkType =:= 2 -> [{9,822},{10,206}];
          AtkType =:= 3 -> [{9,822},{10,206}];
          true -> []
        end;
    3 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,158}];
          AtkType =:= 2 -> [{11,158}];
          AtkType =:= 3 -> [{7,1921},{8,1921}];
          true -> []
        end;
    4 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,49}];
          AtkType =:= 2 -> [{106,49}];
          AtkType =:= 3 -> [{106,49}];
          true -> []
        end;
    5 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,33}];
          AtkType =:= 2 -> [{106,33}];
          AtkType =:= 3 -> [{106,33}];
          true -> []
        end;
    6 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1808},{10,514}];
          AtkType =:= 2 -> [{9,1808},{10,514}];
          AtkType =:= 3 -> [{9,1808},{10,514}];
          true -> []
        end;
    7 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3247},{12,158}];
          AtkType =:= 2 -> [{6,3247},{12,158}];
          AtkType =:= 3 -> [{1,10447},{12,158}];
          true -> []
        end;
    1 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2161},{1,5835}];
          AtkType =:= 2 -> [{6,2161},{1,5835}];
          AtkType =:= 3 -> [{1,23340}];
          true -> []
        end;
    2 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,822},{10,206}];
          AtkType =:= 2 -> [{9,822},{10,206}];
          AtkType =:= 3 -> [{9,822},{10,206}];
          true -> []
        end;
    3 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,158}];
          AtkType =:= 2 -> [{11,158}];
          AtkType =:= 3 -> [{7,1921},{8,1921}];
          true -> []
        end;
    4 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,49}];
          AtkType =:= 2 -> [{106,49}];
          AtkType =:= 3 -> [{106,49}];
          true -> []
        end;
    5 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,33}];
          AtkType =:= 2 -> [{106,33}];
          AtkType =:= 3 -> [{106,33}];
          true -> []
        end;
    6 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1808},{10,514}];
          AtkType =:= 2 -> [{9,1808},{10,514}];
          AtkType =:= 3 -> [{9,1808},{10,514}];
          true -> []
        end;
    7 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3247},{12,158}];
          AtkType =:= 2 -> [{6,3247},{12,158}];
          AtkType =:= 3 -> [{1,10447},{12,158}];
          true -> []
        end;
      true ->
        []
    end;
get(45, SuitLv, Quality, AtkType) ->
    if
    1 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2521},{1,6805}];
          AtkType =:= 2 -> [{6,2521},{1,6805}];
          AtkType =:= 3 -> [{1,27222}];
          true -> []
        end;
    2 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,959},{10,240}];
          AtkType =:= 2 -> [{9,959},{10,240}];
          AtkType =:= 3 -> [{9,959},{10,240}];
          true -> []
        end;
    3 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,184}];
          AtkType =:= 2 -> [{11,184}];
          AtkType =:= 3 -> [{7,2241},{8,2241}];
          true -> []
        end;
    4 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,57}];
          AtkType =:= 2 -> [{106,57}];
          AtkType =:= 3 -> [{106,57}];
          true -> []
        end;
    5 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,39}];
          AtkType =:= 2 -> [{106,39}];
          AtkType =:= 3 -> [{106,39}];
          true -> []
        end;
    6 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,2561},{10,728}];
          AtkType =:= 2 -> [{9,2561},{10,728}];
          AtkType =:= 3 -> [{9,2561},{10,728}];
          true -> []
        end;
    7 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4599},{12,223}];
          AtkType =:= 2 -> [{6,4599},{12,223}];
          AtkType =:= 3 -> [{1,14796},{12,223}];
          true -> []
        end;
    1 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2521},{1,6805}];
          AtkType =:= 2 -> [{6,2521},{1,6805}];
          AtkType =:= 3 -> [{1,27222}];
          true -> []
        end;
    2 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,959},{10,240}];
          AtkType =:= 2 -> [{9,959},{10,240}];
          AtkType =:= 3 -> [{9,959},{10,240}];
          true -> []
        end;
    3 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,184}];
          AtkType =:= 2 -> [{11,184}];
          AtkType =:= 3 -> [{7,2241},{8,2241}];
          true -> []
        end;
    4 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,57}];
          AtkType =:= 2 -> [{106,57}];
          AtkType =:= 3 -> [{106,57}];
          true -> []
        end;
    5 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,39}];
          AtkType =:= 2 -> [{106,39}];
          AtkType =:= 3 -> [{106,39}];
          true -> []
        end;
    6 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,2561},{10,728}];
          AtkType =:= 2 -> [{9,2561},{10,728}];
          AtkType =:= 3 -> [{9,2561},{10,728}];
          true -> []
        end;
    7 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4599},{12,223}];
          AtkType =:= 2 -> [{6,4599},{12,223}];
          AtkType =:= 3 -> [{1,14796},{12,223}];
          true -> []
        end;
    1 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,2521},{1,6805}];
          AtkType =:= 2 -> [{6,2521},{1,6805}];
          AtkType =:= 3 -> [{1,27222}];
          true -> []
        end;
    2 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,959},{10,240}];
          AtkType =:= 2 -> [{9,959},{10,240}];
          AtkType =:= 3 -> [{9,959},{10,240}];
          true -> []
        end;
    3 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,184}];
          AtkType =:= 2 -> [{11,184}];
          AtkType =:= 3 -> [{7,2241},{8,2241}];
          true -> []
        end;
    4 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,57}];
          AtkType =:= 2 -> [{106,57}];
          AtkType =:= 3 -> [{106,57}];
          true -> []
        end;
    5 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,39}];
          AtkType =:= 2 -> [{106,39}];
          AtkType =:= 3 -> [{106,39}];
          true -> []
        end;
    6 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,2561},{10,728}];
          AtkType =:= 2 -> [{9,2561},{10,728}];
          AtkType =:= 3 -> [{9,2561},{10,728}];
          true -> []
        end;
    7 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4599},{12,223}];
          AtkType =:= 2 -> [{6,4599},{12,223}];
          AtkType =:= 3 -> [{1,14796},{12,223}];
          true -> []
        end;
      true ->
        []
    end;
get(65, SuitLv, Quality, AtkType) ->
    if
    1 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3061},{1,8264}];
          AtkType =:= 2 -> [{6,3061},{1,8264}];
          AtkType =:= 3 -> [{1,33057}];
          true -> []
        end;
    2 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1164},{10,292}];
          AtkType =:= 2 -> [{9,1164},{10,292}];
          AtkType =:= 3 -> [{9,1164},{10,292}];
          true -> []
        end;
    3 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,223}];
          AtkType =:= 2 -> [{11,223}];
          AtkType =:= 3 -> [{7,2721},{8,2721}];
          true -> []
        end;
    4 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,69}];
          AtkType =:= 2 -> [{106,69}];
          AtkType =:= 3 -> [{106,69}];
          true -> []
        end;
    5 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,47}];
          AtkType =:= 2 -> [{106,47}];
          AtkType =:= 3 -> [{106,47}];
          true -> []
        end;
    6 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,2561},{10,728}];
          AtkType =:= 2 -> [{9,2561},{10,728}];
          AtkType =:= 3 -> [{9,2561},{10,728}];
          true -> []
        end;
    7 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4599},{12,223}];
          AtkType =:= 2 -> [{6,4599},{12,223}];
          AtkType =:= 3 -> [{1,14796},{12,223}];
          true -> []
        end;
    1 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3061},{1,8264}];
          AtkType =:= 2 -> [{6,3061},{1,8264}];
          AtkType =:= 3 -> [{1,33057}];
          true -> []
        end;
    2 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1164},{10,292}];
          AtkType =:= 2 -> [{9,1164},{10,292}];
          AtkType =:= 3 -> [{9,1164},{10,292}];
          true -> []
        end;
    3 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,223}];
          AtkType =:= 2 -> [{11,223}];
          AtkType =:= 3 -> [{7,2721},{8,2721}];
          true -> []
        end;
    4 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,69}];
          AtkType =:= 2 -> [{106,69}];
          AtkType =:= 3 -> [{106,69}];
          true -> []
        end;
    5 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,47}];
          AtkType =:= 2 -> [{106,47}];
          AtkType =:= 3 -> [{106,47}];
          true -> []
        end;
    6 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,2561},{10,728}];
          AtkType =:= 2 -> [{9,2561},{10,728}];
          AtkType =:= 3 -> [{9,2561},{10,728}];
          true -> []
        end;
    7 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4599},{12,223}];
          AtkType =:= 2 -> [{6,4599},{12,223}];
          AtkType =:= 3 -> [{1,14796},{12,223}];
          true -> []
        end;
    1 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3061},{1,8264}];
          AtkType =:= 2 -> [{6,3061},{1,8264}];
          AtkType =:= 3 -> [{1,33057}];
          true -> []
        end;
    2 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1164},{10,292}];
          AtkType =:= 2 -> [{9,1164},{10,292}];
          AtkType =:= 3 -> [{9,1164},{10,292}];
          true -> []
        end;
    3 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,223}];
          AtkType =:= 2 -> [{11,223}];
          AtkType =:= 3 -> [{7,2721},{8,2721}];
          true -> []
        end;
    4 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,69}];
          AtkType =:= 2 -> [{106,69}];
          AtkType =:= 3 -> [{106,69}];
          true -> []
        end;
    5 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,47}];
          AtkType =:= 2 -> [{106,47}];
          AtkType =:= 3 -> [{106,47}];
          true -> []
        end;
    6 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,2561},{10,728}];
          AtkType =:= 2 -> [{9,2561},{10,728}];
          AtkType =:= 3 -> [{9,2561},{10,728}];
          true -> []
        end;
    7 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4599},{12,223}];
          AtkType =:= 2 -> [{6,4599},{12,223}];
          AtkType =:= 3 -> [{1,14796},{12,223}];
          true -> []
        end;
      true ->
        []
    end;
get(75, SuitLv, Quality, AtkType) ->
    if
    1 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3601},{1,9723}];
          AtkType =:= 2 -> [{6,3601},{1,9723}];
          AtkType =:= 3 -> [{1,38892}];
          true -> []
        end;
    2 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1370},{10,343}];
          AtkType =:= 2 -> [{9,1370},{10,343}];
          AtkType =:= 3 -> [{9,1370},{10,343}];
          true -> []
        end;
    3 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,263}];
          AtkType =:= 2 -> [{11,263}];
          AtkType =:= 3 -> [{7,3201},{8,3201}];
          true -> []
        end;
    4 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,81}];
          AtkType =:= 2 -> [{106,81}];
          AtkType =:= 3 -> [{106,81}];
          true -> []
        end;
    5 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,55}];
          AtkType =:= 2 -> [{106,55}];
          AtkType =:= 3 -> [{106,55}];
          true -> []
        end;
    6 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3013},{10,857}];
          AtkType =:= 2 -> [{9,3013},{10,857}];
          AtkType =:= 3 -> [{9,3013},{10,857}];
          true -> []
        end;
    7 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,5411},{12,263}];
          AtkType =:= 2 -> [{6,5411},{12,263}];
          AtkType =:= 3 -> [{1,17407},{12,263}];
          true -> []
        end;
    1 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3601},{1,9723}];
          AtkType =:= 2 -> [{6,3601},{1,9723}];
          AtkType =:= 3 -> [{1,38892}];
          true -> []
        end;
    2 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1370},{10,343}];
          AtkType =:= 2 -> [{9,1370},{10,343}];
          AtkType =:= 3 -> [{9,1370},{10,343}];
          true -> []
        end;
    3 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,263}];
          AtkType =:= 2 -> [{11,263}];
          AtkType =:= 3 -> [{7,3201},{8,3201}];
          true -> []
        end;
    4 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,81}];
          AtkType =:= 2 -> [{106,81}];
          AtkType =:= 3 -> [{106,81}];
          true -> []
        end;
    5 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,55}];
          AtkType =:= 2 -> [{106,55}];
          AtkType =:= 3 -> [{106,55}];
          true -> []
        end;
    6 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3013},{10,857}];
          AtkType =:= 2 -> [{9,3013},{10,857}];
          AtkType =:= 3 -> [{9,3013},{10,857}];
          true -> []
        end;
    7 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,5411},{12,263}];
          AtkType =:= 2 -> [{6,5411},{12,263}];
          AtkType =:= 3 -> [{1,17407},{12,263}];
          true -> []
        end;
    1 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,3601},{1,9723}];
          AtkType =:= 2 -> [{6,3601},{1,9723}];
          AtkType =:= 3 -> [{1,38892}];
          true -> []
        end;
    2 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1370},{10,343}];
          AtkType =:= 2 -> [{9,1370},{10,343}];
          AtkType =:= 3 -> [{9,1370},{10,343}];
          true -> []
        end;
    3 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,263}];
          AtkType =:= 2 -> [{11,263}];
          AtkType =:= 3 -> [{7,3201},{8,3201}];
          true -> []
        end;
    4 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,81}];
          AtkType =:= 2 -> [{106,81}];
          AtkType =:= 3 -> [{106,81}];
          true -> []
        end;
    5 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,55}];
          AtkType =:= 2 -> [{106,55}];
          AtkType =:= 3 -> [{106,55}];
          true -> []
        end;
    6 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3013},{10,857}];
          AtkType =:= 2 -> [{9,3013},{10,857}];
          AtkType =:= 3 -> [{9,3013},{10,857}];
          true -> []
        end;
    7 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,5411},{12,263}];
          AtkType =:= 2 -> [{6,5411},{12,263}];
          AtkType =:= 3 -> [{1,17407},{12,263}];
          true -> []
        end;
      true ->
        []
    end;
get(85, SuitLv, Quality, AtkType) ->
    if
    1 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4357},{1,11764}];
          AtkType =:= 2 -> [{6,4357},{1,11764}];
          AtkType =:= 3 -> [{1,47056}];
          true -> []
        end;
    2 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1657},{10,415}];
          AtkType =:= 2 -> [{9,1657},{10,415}];
          AtkType =:= 3 -> [{9,1657},{10,415}];
          true -> []
        end;
    3 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,318}];
          AtkType =:= 2 -> [{11,318}];
          AtkType =:= 3 -> [{7,3873},{8,3873}];
          true -> []
        end;
    4 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,89}];
          AtkType =:= 2 -> [{106,89}];
          AtkType =:= 3 -> [{106,89}];
          true -> []
        end;
    5 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,63}];
          AtkType =:= 2 -> [{106,63}];
          AtkType =:= 3 -> [{106,63}];
          true -> []
        end;
    6 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3645},{10,1037}];
          AtkType =:= 2 -> [{9,3645},{10,1037}];
          AtkType =:= 3 -> [{9,3645},{10,1037}];
          true -> []
        end;
    7 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,6482},{12,318}];
          AtkType =:= 2 -> [{6,6482},{12,318}];
          AtkType =:= 3 -> [{1,20853},{12,318}];
          true -> []
        end;
    1 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4357},{1,11764}];
          AtkType =:= 2 -> [{6,4357},{1,11764}];
          AtkType =:= 3 -> [{1,47056}];
          true -> []
        end;
    2 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1657},{10,415}];
          AtkType =:= 2 -> [{9,1657},{10,415}];
          AtkType =:= 3 -> [{9,1657},{10,415}];
          true -> []
        end;
    3 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,318}];
          AtkType =:= 2 -> [{11,318}];
          AtkType =:= 3 -> [{7,3873},{8,3873}];
          true -> []
        end;
    4 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,89}];
          AtkType =:= 2 -> [{106,89}];
          AtkType =:= 3 -> [{106,89}];
          true -> []
        end;
    5 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,63}];
          AtkType =:= 2 -> [{106,63}];
          AtkType =:= 3 -> [{106,63}];
          true -> []
        end;
    6 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3645},{10,1037}];
          AtkType =:= 2 -> [{9,3645},{10,1037}];
          AtkType =:= 3 -> [{9,3645},{10,1037}];
          true -> []
        end;
    7 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,6482},{12,318}];
          AtkType =:= 2 -> [{6,6482},{12,318}];
          AtkType =:= 3 -> [{1,20853},{12,318}];
          true -> []
        end;
    1 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4357},{1,11764}];
          AtkType =:= 2 -> [{6,4357},{1,11764}];
          AtkType =:= 3 -> [{1,47056}];
          true -> []
        end;
    2 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1657},{10,415}];
          AtkType =:= 2 -> [{9,1657},{10,415}];
          AtkType =:= 3 -> [{9,1657},{10,415}];
          true -> []
        end;
    3 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,318}];
          AtkType =:= 2 -> [{11,318}];
          AtkType =:= 3 -> [{7,3873},{8,3873}];
          true -> []
        end;
    4 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,89}];
          AtkType =:= 2 -> [{106,89}];
          AtkType =:= 3 -> [{106,89}];
          true -> []
        end;
    5 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,63}];
          AtkType =:= 2 -> [{106,63}];
          AtkType =:= 3 -> [{106,63}];
          true -> []
        end;
    6 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3645},{10,1037}];
          AtkType =:= 2 -> [{9,3645},{10,1037}];
          AtkType =:= 3 -> [{9,3645},{10,1037}];
          true -> []
        end;
    7 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,6482},{12,318}];
          AtkType =:= 2 -> [{6,6482},{12,318}];
          AtkType =:= 3 -> [{1,20853},{12,318}];
          true -> []
        end;
      true ->
        []
    end;
get(95, SuitLv, Quality, AtkType) ->
    if
    1 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4357},{1,11764}];
          AtkType =:= 2 -> [{6,4357},{1,11764}];
          AtkType =:= 3 -> [{1,47056}];
          true -> []
        end;
    2 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1657},{10,415}];
          AtkType =:= 2 -> [{9,1657},{10,415}];
          AtkType =:= 3 -> [{9,1657},{10,415}];
          true -> []
        end;
    3 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,318}];
          AtkType =:= 2 -> [{11,318}];
          AtkType =:= 3 -> [{7,3873},{8,3873}];
          true -> []
        end;
    4 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,89}];
          AtkType =:= 2 -> [{106,89}];
          AtkType =:= 3 -> [{106,89}];
          true -> []
        end;
    5 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,63}];
          AtkType =:= 2 -> [{106,63}];
          AtkType =:= 3 -> [{106,63}];
          true -> []
        end;
    6 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3645},{10,1037}];
          AtkType =:= 2 -> [{9,3645},{10,1037}];
          AtkType =:= 3 -> [{9,3645},{10,1037}];
          true -> []
        end;
    7 =:= SuitLv andalso 1 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,6482},{12,318}];
          AtkType =:= 2 -> [{6,6482},{12,318}];
          AtkType =:= 3 -> [{1,20853},{12,318}];
          true -> []
        end;
    1 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4357},{1,11764}];
          AtkType =:= 2 -> [{6,4357},{1,11764}];
          AtkType =:= 3 -> [{1,47056}];
          true -> []
        end;
    2 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1657},{10,415}];
          AtkType =:= 2 -> [{9,1657},{10,415}];
          AtkType =:= 3 -> [{9,1657},{10,415}];
          true -> []
        end;
    3 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,318}];
          AtkType =:= 2 -> [{11,318}];
          AtkType =:= 3 -> [{7,3873},{8,3873}];
          true -> []
        end;
    4 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,89}];
          AtkType =:= 2 -> [{106,89}];
          AtkType =:= 3 -> [{106,89}];
          true -> []
        end;
    5 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,63}];
          AtkType =:= 2 -> [{106,63}];
          AtkType =:= 3 -> [{106,63}];
          true -> []
        end;
    6 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3645},{10,1037}];
          AtkType =:= 2 -> [{9,3645},{10,1037}];
          AtkType =:= 3 -> [{9,3645},{10,1037}];
          true -> []
        end;
    7 =:= SuitLv andalso 2 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,6482},{12,318}];
          AtkType =:= 2 -> [{6,6482},{12,318}];
          AtkType =:= 3 -> [{1,20853},{12,318}];
          true -> []
        end;
    1 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,4357},{1,11764}];
          AtkType =:= 2 -> [{6,4357},{1,11764}];
          AtkType =:= 3 -> [{1,47056}];
          true -> []
        end;
    2 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,1657},{10,415}];
          AtkType =:= 2 -> [{9,1657},{10,415}];
          AtkType =:= 3 -> [{9,1657},{10,415}];
          true -> []
        end;
    3 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{11,318}];
          AtkType =:= 2 -> [{11,318}];
          AtkType =:= 3 -> [{7,3873},{8,3873}];
          true -> []
        end;
    4 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,89}];
          AtkType =:= 2 -> [{106,89}];
          AtkType =:= 3 -> [{106,89}];
          true -> []
        end;
    5 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{106,63}];
          AtkType =:= 2 -> [{106,63}];
          AtkType =:= 3 -> [{106,63}];
          true -> []
        end;
    6 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{9,3645},{10,1037}];
          AtkType =:= 2 -> [{9,3645},{10,1037}];
          AtkType =:= 3 -> [{9,3645},{10,1037}];
          true -> []
        end;
    7 =:= SuitLv andalso 3 =:= Quality  ->
        if
          AtkType =:= 1 -> [{5,6482},{12,318}];
          AtkType =:= 2 -> [{6,6482},{12,318}];
          AtkType =:= 3 -> [{1,20853},{12,318}];
          true -> []
        end;
      true ->
        []
    end;
get(_CarryLv, _SuitLv, _Quality, _AtkType) ->
    [].
