%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_warrior_soul_attr_alter
%% @Brief  : 武魂凝魂属性改变
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_warrior_soul_attr_alter).

-export([
    get_alter_list/1
]).

get_alter_list(1) ->
    [{21,4},{22,4},{23,4},{24,4},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,17},{10,4},{11,4},{105,1},{104,3},{103,3}];
get_alter_list(2) ->
    [{21,4},{22,4},{23,4},{24,4},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,16},{10,4},{11,4},{105,1},{104,3},{103,3}];
get_alter_list(3) ->
    [{21,4},{22,4},{23,4},{24,4},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,15},{10,4},{11,4},{105,1},{104,3},{103,3}];
get_alter_list(4) ->
    [{21,4},{22,4},{23,4},{24,4},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,14},{10,4},{11,4},{105,1},{104,2},{103,2}];
get_alter_list(5) ->
    [{21,3},{22,3},{23,3},{24,3},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,13},{10,3},{11,3},{105,1},{104,2},{103,2}];
get_alter_list(6) ->
    [{21,3},{22,3},{23,3},{24,3},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,12},{10,3},{11,3},{105,1},{104,2},{103,2}];
get_alter_list(7) ->
    [{21,3},{22,3},{23,3},{24,3},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,11},{10,3},{11,3},{105,1},{104,2},{103,2}];
get_alter_list(8) ->
    [{21,3},{22,3},{23,3},{24,3},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,10},{10,3},{11,3},{105,1},{104,2},{103,2}];
get_alter_list(9) ->
    [{21,2},{22,2},{23,2},{24,2},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,9},{10,2},{11,2},{105,1},{104,2},{103,2}];
get_alter_list(10) ->
    [{21,2},{22,2},{23,2},{24,2},{109,1},{29,1},{30,1},{31,1},{32,1},{25,1},{26,1},{27,1},{28,1},{9,8},{10,2},{11,2},{105,1},{104,1},{103,1}];
get_alter_list(11) ->
    [{21,2},{22,2},{23,2},{24,2},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,7},{10,2},{11,2},{105,1},{104,1},{103,1}];
get_alter_list(12) ->
    [{21,2},{22,2},{23,2},{24,2},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,6},{10,2},{11,2},{105,0},{104,1},{103,1}];
get_alter_list(13) ->
    [{21,1},{22,1},{23,1},{24,1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,5},{10,1},{11,1},{105,0},{104,1},{103,1}];
get_alter_list(14) ->
    [{21,1},{22,1},{23,1},{24,1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,4},{10,1},{11,1},{105,0},{104,1},{103,1}];
get_alter_list(15) ->
    [{21,1},{22,1},{23,1},{24,1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,3},{10,1},{11,1},{105,0},{104,1},{103,1}];
get_alter_list(16) ->
    [{21,1},{22,1},{23,1},{24,1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,2},{10,1},{11,1},{105,0},{104,0},{103,0}];
get_alter_list(17) ->
    [{21,0},{22,0},{23,0},{24,0},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,1},{10,0},{11,0},{105,0},{104,0},{103,0}];
get_alter_list(18) ->
    [{21,0},{22,0},{23,0},{24,0},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,0},{10,0},{11,0},{105,0},{104,0},{103,0}];
get_alter_list(19) ->
    [{21,0},{22,0},{23,0},{24,0},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,-1},{10,0},{11,0},{105,0},{104,0},{103,0}];
get_alter_list(20) ->
    [{21,-1},{22,-1},{23,-1},{24,-1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,-2},{10,-1},{11,-1},{105,0},{104,0},{103,0}];
get_alter_list(21) ->
    [{21,-1},{22,-1},{23,-1},{24,-1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,-3},{10,-1},{11,-1},{105,0},{104,-1},{103,-1}];
get_alter_list(22) ->
    [{21,-1},{22,-1},{23,-1},{24,-1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,-4},{10,-1},{11,-1},{105,0},{104,-1},{103,-1}];
get_alter_list(23) ->
    [{21,-1},{22,-1},{23,-1},{24,-1},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,-5},{10,-1},{11,-1},{105,0},{104,-1},{103,-1}];
get_alter_list(24) ->
    [{21,-2},{22,-2},{23,-2},{24,-2},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,-6},{10,-2},{11,-2},{105,0},{104,-1},{103,-1}];
get_alter_list(25) ->
    [{21,-2},{22,-2},{23,-2},{24,-2},{109,0},{29,0},{30,0},{31,0},{32,0},{25,0},{26,0},{27,0},{28,0},{9,-7},{10,-2},{11,-2},{105,-1},{104,-1},{103,-1}];
get_alter_list(26) ->
    [{21,-2},{22,-2},{23,-2},{24,-2},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-8},{10,-2},{11,-2},{105,-1},{104,-1},{103,-1}];
get_alter_list(27) ->
    [{21,-2},{22,-2},{23,-2},{24,-2},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-9},{10,-2},{11,-2},{105,-1},{104,-2},{103,-2}];
get_alter_list(28) ->
    [{21,-3},{22,-3},{23,-3},{24,-3},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-10},{10,-3},{11,-3},{105,-1},{104,-2},{103,-2}];
get_alter_list(29) ->
    [{21,-3},{22,-3},{23,-3},{24,-3},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-11},{10,-3},{11,-3},{105,-1},{104,-2},{103,-2}];
get_alter_list(30) ->
    [{21,-3},{22,-3},{23,-3},{24,-3},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-12},{10,-3},{11,-3},{105,-1},{104,-2},{103,-2}];
get_alter_list(31) ->
    [{21,-3},{22,-3},{23,-3},{24,-3},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-13},{10,-3},{11,-3},{105,-1},{104,-2},{103,-2}];
get_alter_list(32) ->
    [{21,-4},{22,-4},{23,-4},{24,-4},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-14},{10,-4},{11,-4},{105,-1},{104,-2},{103,-2}];
get_alter_list(33) ->
    [{21,-4},{22,-4},{23,-4},{24,-4},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-15},{10,-4},{11,-4},{105,-1},{104,-3},{103,-3}];
get_alter_list(34) ->
    [{21,-4},{22,-4},{23,-4},{24,-4},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-16},{10,-4},{11,-4},{105,-1},{104,-3},{103,-3}];
get_alter_list(35) ->
    [{21,-5},{22,-5},{23,-5},{24,-5},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-17},{10,-4},{11,-4},{105,-1},{104,-3},{103,-3}];
get_alter_list(36) ->
    [{21,-5},{22,-5},{23,-5},{24,-5},{109,-1},{29,-1},{30,-1},{31,-1},{32,-1},{25,-1},{26,-1},{27,-1},{28,-1},{9,-18},{10,-4},{11,-4},{105,-1},{104,-3},{103,-3}];
get_alter_list(_Index) ->
    undefined.