%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      每日杀怪配置表
%% @lastUpdated 2018-12-11 14-11-45
%% @author      cablsbs
%%----------------------------------
-module(conf_daily_kill_mons).

-include("log.hrl").

-export([get_drops/1]).


%% Apis ------------------------------------------------
%% @doc 获取每日杀怪掉落
%% @spec get(Level) -> {DropIds} | undefined.
%% Level = DropIds  :: integer().
get_drops(1) ->
    {5001,5301,5601};
get_drops(2) ->
    {5001,5301,5601};
get_drops(3) ->
    {5001,5301,5601};
get_drops(4) ->
    {5001,5301,5601};
get_drops(5) ->
    {5001,5301,5601};
get_drops(6) ->
    {5001,5301,5601};
get_drops(7) ->
    {5001,5301,5601};
get_drops(8) ->
    {5001,5301,5601};
get_drops(9) ->
    {5001,5301,5601};
get_drops(10) ->
    {5002,5302,5602};
get_drops(11) ->
    {5002,5302,5602};
get_drops(12) ->
    {5002,5302,5602};
get_drops(13) ->
    {5002,5302,5602};
get_drops(14) ->
    {5002,5302,5602};
get_drops(15) ->
    {5002,5302,5602};
get_drops(16) ->
    {5002,5302,5602};
get_drops(17) ->
    {5002,5302,5602};
get_drops(18) ->
    {5002,5302,5602};
get_drops(19) ->
    {5002,5302,5602};
get_drops(20) ->
    {5003,5303,5603};
get_drops(21) ->
    {5003,5303,5603};
get_drops(22) ->
    {5003,5303,5603};
get_drops(23) ->
    {5003,5303,5603};
get_drops(24) ->
    {5003,5303,5603};
get_drops(25) ->
    {5003,5303,5603};
get_drops(26) ->
    {5003,5303,5603};
get_drops(27) ->
    {5003,5303,5603};
get_drops(28) ->
    {5003,5303,5603};
get_drops(29) ->
    {5003,5303,5603};
get_drops(30) ->
    {5004,5304,5604};
get_drops(31) ->
    {5004,5304,5604};
get_drops(32) ->
    {5004,5304,5604};
get_drops(33) ->
    {5004,5304,5604};
get_drops(34) ->
    {5004,5304,5604};
get_drops(35) ->
    {5004,5304,5604};
get_drops(36) ->
    {5004,5304,5604};
get_drops(37) ->
    {5004,5304,5604};
get_drops(38) ->
    {5004,5304,5604};
get_drops(39) ->
    {5004,5304,5604};
get_drops(40) ->
    {5005,5305,5605};
get_drops(41) ->
    {5005,5305,5605};
get_drops(42) ->
    {5005,5305,5605};
get_drops(43) ->
    {5005,5305,5605};
get_drops(44) ->
    {5005,5305,5605};
get_drops(45) ->
    {5005,5305,5605};
get_drops(46) ->
    {5005,5305,5605};
get_drops(47) ->
    {5005,5305,5605};
get_drops(48) ->
    {5005,5305,5605};
get_drops(49) ->
    {5005,5305,5605};
get_drops(50) ->
    {5006,5306,5606};
get_drops(51) ->
    {5006,5306,5606};
get_drops(52) ->
    {5006,5306,5606};
get_drops(53) ->
    {5006,5306,5606};
get_drops(54) ->
    {5006,5306,5606};
get_drops(55) ->
    {5006,5306,5606};
get_drops(56) ->
    {5006,5306,5606};
get_drops(57) ->
    {5006,5306,5606};
get_drops(58) ->
    {5006,5306,5606};
get_drops(59) ->
    {5006,5306,5606};
get_drops(60) ->
    {5007,5307,5607};
get_drops(61) ->
    {5007,5307,5607};
get_drops(62) ->
    {5007,5307,5607};
get_drops(63) ->
    {5007,5307,5607};
get_drops(64) ->
    {5007,5307,5607};
get_drops(65) ->
    {5007,5307,5607};
get_drops(66) ->
    {5007,5307,5607};
get_drops(67) ->
    {5007,5307,5607};
get_drops(68) ->
    {5007,5307,5607};
get_drops(69) ->
    {5007,5307,5607};
get_drops(70) ->
    {5008,5308,5608};
get_drops(71) ->
    {5008,5308,5608};
get_drops(72) ->
    {5008,5308,5608};
get_drops(73) ->
    {5008,5308,5608};
get_drops(74) ->
    {5008,5308,5608};
get_drops(75) ->
    {5008,5308,5608};
get_drops(76) ->
    {5008,5308,5608};
get_drops(77) ->
    {5008,5308,5608};
get_drops(78) ->
    {5008,5308,5608};
get_drops(79) ->
    {5008,5308,5608};
get_drops(80) ->
    {5009,5309,5609};
get_drops(81) ->
    {5009,5309,5609};
get_drops(82) ->
    {5009,5309,5609};
get_drops(83) ->
    {5009,5309,5609};
get_drops(84) ->
    {5009,5309,5609};
get_drops(85) ->
    {5009,5309,5609};
get_drops(86) ->
    {5009,5309,5609};
get_drops(87) ->
    {5009,5309,5609};
get_drops(88) ->
    {5009,5309,5609};
get_drops(89) ->
    {5009,5309,5609};
get_drops(90) ->
    {5010,5310,5610};
get_drops(91) ->
    {5010,5310,5610};
get_drops(92) ->
    {5010,5310,5610};
get_drops(93) ->
    {5010,5310,5610};
get_drops(94) ->
    {5010,5310,5610};
get_drops(95) ->
    {5010,5310,5610};
get_drops(96) ->
    {5010,5310,5610};
get_drops(97) ->
    {5010,5310,5610};
get_drops(98) ->
    {5010,5310,5610};
get_drops(99) ->
    {5010,5310,5610};
get_drops(100) ->
    {5011,5311,5611};
get_drops(101) ->
    {5011,5311,5611};
get_drops(102) ->
    {5011,5311,5611};
get_drops(103) ->
    {5011,5311,5611};
get_drops(104) ->
    {5011,5311,5611};
get_drops(105) ->
    {5011,5311,5611};
get_drops(106) ->
    {5011,5311,5611};
get_drops(107) ->
    {5011,5311,5611};
get_drops(108) ->
    {5011,5311,5611};
get_drops(109) ->
    {5011,5311,5611};
get_drops(110) ->
    {5012,5312,5612};
get_drops(111) ->
    {5012,5312,5612};
get_drops(112) ->
    {5012,5312,5612};
get_drops(113) ->
    {5012,5312,5612};
get_drops(114) ->
    {5012,5312,5612};
get_drops(115) ->
    {5012,5312,5612};
get_drops(116) ->
    {5012,5312,5612};
get_drops(117) ->
    {5012,5312,5612};
get_drops(118) ->
    {5012,5312,5612};
get_drops(119) ->
    {5012,5312,5612};
get_drops(120) ->
    {5013,5313,5613};
get_drops(121) ->
    {5013,5313,5613};
get_drops(122) ->
    {5013,5313,5613};
get_drops(123) ->
    {5013,5313,5613};
get_drops(124) ->
    {5013,5313,5613};
get_drops(125) ->
    {5013,5313,5613};
get_drops(126) ->
    {5013,5313,5613};
get_drops(127) ->
    {5013,5313,5613};
get_drops(128) ->
    {5013,5313,5613};
get_drops(129) ->
    {5013,5313,5613};
get_drops(130) ->
    {5014,5314,5614};
get_drops(131) ->
    {5014,5314,5614};
get_drops(132) ->
    {5014,5314,5614};
get_drops(133) ->
    {5014,5314,5614};
get_drops(134) ->
    {5014,5314,5614};
get_drops(135) ->
    {5014,5314,5614};
get_drops(136) ->
    {5014,5314,5614};
get_drops(137) ->
    {5014,5314,5614};
get_drops(138) ->
    {5014,5314,5614};
get_drops(139) ->
    {5014,5314,5614};
get_drops(140) ->
    {5015,5315,5615};
get_drops(141) ->
    {5015,5315,5615};
get_drops(142) ->
    {5015,5315,5615};
get_drops(143) ->
    {5015,5315,5615};
get_drops(144) ->
    {5015,5315,5615};
get_drops(145) ->
    {5015,5315,5615};
get_drops(146) ->
    {5015,5315,5615};
get_drops(147) ->
    {5015,5315,5615};
get_drops(148) ->
    {5015,5315,5615};
get_drops(149) ->
    {5015,5315,5615};
get_drops(150) ->
    {5016,5316,5616};
get_drops(151) ->
    {5016,5316,5616};
get_drops(152) ->
    {5016,5316,5616};
get_drops(153) ->
    {5016,5316,5616};
get_drops(154) ->
    {5016,5316,5616};
get_drops(155) ->
    {5016,5316,5616};
get_drops(156) ->
    {5016,5316,5616};
get_drops(157) ->
    {5016,5316,5616};
get_drops(158) ->
    {5016,5316,5616};
get_drops(159) ->
    {5016,5316,5616};
get_drops(160) ->
    {5017,5317,5617};
get_drops(Level) ->
    ?ERROR_FUNC_CALL(Level),
    undefined.
