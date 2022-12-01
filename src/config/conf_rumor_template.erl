%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_rumor_template
%% @Brief  : 传闻模板
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_rumor_template).

-export([
    get/1,
    get_ids/0
]).

get(0) ->
    #{
        id => 0,
        channel => [1],
        rumor => <<"%s">>
    };
get(1001) ->
    #{
        id => 1001,
        channel => [1],
        rumor => <<"东风夜放花千树。更吹落、星如雨。宝马雕车香满路。凤箫声动，玉壶光转，一夜鱼龙舞。蛾儿雪柳黄金缕。笑语盈盈暗香去。众里寻他千百度。蓦然回首，那人却在，灯火阑珊处。">>
    };
get(1002) ->
    #{
        id => 1002,
        channel => [1],
        rumor => <<"0">>
    };
get(10001) ->
    #{
        id => 10001,
        channel => [2],
        rumor => <<"热烈欢迎<font color='#ff923e'>%s</font>加入了帮会，我们的大家庭更加热闹了！">>
    };
get(10002) ->
    #{
        id => 10002,
        channel => [2],
        rumor => <<"月有圆缺，聚散有常，很遗憾，<font color='#ff923e'>%s</font>离开了帮会。">>
    };
get(10003) ->
    #{
        id => 10003,
        channel => [2],
        rumor => <<"恭喜<font color='#ff923e'>%s</font>成为了新帮主，带领大家营造更美好的家园。">>
    };
get(10004) ->
    #{
        id => 10004,
        channel => [2],
        rumor => <<"帮会升级为<font color='#ff923e'>%s</font>级，可招入更多帮众！">>
    };
get(10005) ->
    #{
        id => 10005,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>成为了<font color='#ff923e'>%s</font>。">>
    };
get(10006) ->
    #{
        id => 10006,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>帮会正在广纳贤士，欢迎各路少侠加入，战力需求<font color='#ff923e'>%s</font>。[1000]">>
    };
get(10007) ->
    #{
        id => 10007,
        channel => [1],
        rumor => <<"<font color='#ffffff'>恭喜</font><font color='#18ff00'>%s</font>和<font color='#18ff00'>%s</font>举办了<font color='#ff43fd'>%s</font>，结为连理。[1001]">>
    };
get(10008) ->
    #{
        id => 10008,
        channel => [2],
        rumor => <<"本帮成员<font color='#ff923e'>%s</font>在运镖过程中，不幸被<font color='#ff923e'>%s</font>帮会的成员<font color='#ff923e'>%s</font>偷袭，真是令人气愤！">>
    };
get(10009) ->
    #{
        id => 10009,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>在帮会领地举办了一场宴请，参与宴请可获得帮贡奖励。">>
    };
get(10010) ->
    #{
        id => 10010,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>的宴请已结束。">>
    };
get(20001) ->
    #{
        id => 20001,
        channel => [1],
        rumor => <<"鸿运当头！<font color='#ff923e'>%s</font>在幸运转盘活动中，幸运的抽到<font color='#ff923e'>%s</font>，真是令人羡慕！">>
    };
get(20002) ->
    #{
        id => 20002,
        channel => [1],
        rumor => <<"鸿运当头！<font color='#ff923e'>%s</font>在经脉夺宝中，幸运的获得<font color='#ff923e'>%s</font>，真是令人羡慕！">>
    };
get(20101) ->
    #{
        id => 20101,
        channel => [1],
        rumor => <<"武林禁地已经开启，各方武林霸主已严阵以待，禁地凶危，请各位少侠量力而行！">>
    };
get(20102) ->
    #{
        id => 20102,
        channel => [1],
        rumor => <<"武林禁地已经结束，各方武林霸主已经战略撤退，请各位少侠暂歇，以待日后征战！">>
    };
get(20103) ->
    #{
        id => 20103,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在武林禁地讨伐<font color='#ff923e'>%s</font>中，幸运的找到了隐藏的宝物<font color='#ff923e'>%s</font>，真是令人羡慕！">>
    };
get(20104) ->
    #{
        id => 20104,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在武林禁地讨伐<font color='#ff923e'>%s</font>中，威武过人击败了<font color='#ff923e'>%s</font>，获得了<font color='#ff923e'>%s</font>，真是令人羡慕！">>
    };
get(20105) ->
    #{
        id => 20105,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在武林禁地成功讨伐了<font color='#ff923e'>%s</font>，获得大量珍稀物品，稍后会上架拍卖行供全帮购买，真是振奋人心！">>
    };
get(20106) ->
    #{
        id => 20106,
        channel => [2],
        rumor => <<"我帮在武林禁地参与讨伐了<font color='#ff923e'>%s</font>，获得大量珍稀物品，稍后会上架拍卖行供全帮购买，真是振奋人心！">>
    };
get(20201) ->
    #{
        id => 20201,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在消灭夺宝马贼时，偶遇白马义从。">>
    };
get(20202) ->
    #{
        id => 20202,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在消灭夺宝马贼时，触发奇遇转盘，获得<font color='#ff923e'>%s</font>。">>
    };
get(20301) ->
    #{
        id => 20301,
        channel => [2],
        rumor => <<"一众旁门左道蠢蠢欲动，即将来帮会城市中夺鼎，望兄弟们速速前往帮中守卫！">>
    };
get(20302) ->
    #{
        id => 20302,
        channel => [2],
        rumor => <<"第<font color='#ff923e'>%s</font>波敌人出现，意欲抢夺我帮会宝鼎，兄弟们速速将其击退！">>
    };
get(20303) ->
    #{
        id => 20303,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>已被摧毁，敌人将继续抢夺其他宝鼎，请务必小心！">>
    };
get(20304) ->
    #{
        id => 20304,
        channel => [2],
        rumor => <<"帮会守卫战已经结束，稀有道具将在帮会拍卖行上架，欢迎选购心仪的商品。拍卖收益将分配给参与守卫战的成员。">>
    };
get(20401) ->
    #{
        id => 20401,
        channel => [1],
        rumor => <<"武林盟主活动已开启，各位少侠前去挑战武林盟主获得荣耀吧！">>
    };
get(20402) ->
    #{
        id => 20402,
        channel => [1],
        rumor => <<"武林盟主活动已结束，<font color='#ff923e'>%s</font>武功卓越，非但与武林盟主交手不落下风，更力克群雄，夺得榜首！稍后稀有道具将在帮会拍卖行上架，欢迎选购心仪的商品。">>
    };
get(20501) ->
    #{
        id => 20501,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>加入了队伍">>
    };
get(20502) ->
    #{
        id => 20502,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>离开了队伍">>
    };
get(20503) ->
    #{
        id => 20503,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>被请离了队伍">>
    };
get(20504) ->
    #{
        id => 20504,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>成为了队长">>
    };
get(20505) ->
    #{
        id => 20505,
        channel => [3],
        rumor => <<"队伍目标已改变为<font color='#ff923e'>%s</font>，等级限制<font color='#ff923e'>%s-%s</font>">>
    };
get(20506) ->
    #{
        id => 20506,
        channel => [3],
        rumor => <<"队伍已开始自动匹配">>
    };
get(20507) ->
    #{
        id => 20507,
        channel => [3],
        rumor => <<"队伍已停止匹配">>
    };
get(20508) ->
    #{
        id => 20508,
        channel => [4],
        rumor => <<"<font color='#ff923e'>%s</font>正在招募参加<font color='#ff923e'>%s</font>的队友，等级要求<font color='#ff923e'>%s-%s</font>[1008]">>
    };
get(20509) ->
    #{
        id => 20509,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>已同意<font color='#ff923e'>%s</font>成为队长">>
    };
get(20510) ->
    #{
        id => 20510,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>已拒绝<font color='#ff923e'>%s</font>成为队长">>
    };
get(20511) ->
    #{
        id => 20511,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>距离过远">>
    };
get(20512) ->
    #{
        id => 20512,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>不满足副本进入等级要求">>
    };
get(20513) ->
    #{
        id => 20513,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>不在线">>
    };
get(20514) ->
    #{
        id => 20514,
        channel => [3],
        rumor => <<"<font color='#ff923e'>%s</font>挑战次数不足">>
    };
get(20515) ->
    #{
        id => 20515,
        channel => [3],
        rumor => <<"所有玩家都没有挑战次数，不能挑战">>
    };
get(20516) ->
    #{
        id => 20516,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>带队进入%s时，偶遇<font color='#ff923e'>%s</font>，获得丰厚奖励！">>
    };
get(20601) ->
    #{
        id => 20601,
        channel => [1],
        rumor => <<"据江湖探子密报，为害一方的混江龙在<font color='#ff923e'>镜湖(%s,%s)</font>现身了！各位少侠可速速前往剿匪！">>
    };
get(20602) ->
    #{
        id => 20602,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>击杀镜湖水匪头领<font color='#ff923e'>混江龙</font>，除去武林大害，威风凛凛！">>
    };
get(20603) ->
    #{
        id => 20603,
        channel => [1],
        rumor => <<"混江龙将于<font color='#ff923e'>2</font>分钟后刷新于<font color='#ff923e'>镜湖(%s,%s)</font>，请各位侠士做好准备！">>
    };
get(20604) ->
    #{
        id => 20604,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在剿灭镜湖水匪<font color='#ff923e'>混江龙</font>时，竟意外斩获<font color='#ff923e'>%s</font>！">>
    };
get(20701) ->
    #{
        id => 20701,
        channel => [1],
        rumor => <<"领地争夺战将在%s分钟后开启，争夺领地可获得丰厚奖励，请各位侠客踊跃参加！">>
    };
get(20702) ->
    #{
        id => 20702,
        channel => [2],
        rumor => <<"【战报】我军在<font color='#ff923e'>%s</font>中击败<font color='#ff923e'>%s</font>，获得辉煌胜利！">>
    };
get(20703) ->
    #{
        id => 20703,
        channel => [2],
        rumor => <<"【战报】我军在<font color='#ff923e'>%s</font>中惜败<font color='#ff923e'>%s</font>，还需再接再厉！">>
    };
get(20704) ->
    #{
        id => 20704,
        channel => [2],
        rumor => <<"【战报】本次领地争夺战，我帮与<font color='#ff923e'>%s</font>的战绩为<font color='#ff923e'>%s</font>：<font color='#ff923e'>%s</font>大胜，获得丰厚奖励！">>
    };
get(20705) ->
    #{
        id => 20705,
        channel => [2],
        rumor => <<"【战报】本次领地争夺战，我帮与<font color='#ff923e'>%s</font>的战绩为<font color='#ff923e'>%s</font>：<font color='#ff923e'>%s</font>惜败，还需再接再厉！">>
    };
get(20801) ->
    #{
        id => 20801,
        channel => [1],
        rumor => <<"演武堂活动将在5分钟后开启，请各位侠客踊跃参加！">>
    };
get(20802) ->
    #{
        id => 20802,
        channel => [1],
        rumor => <<"演武堂活动已经开启，各位侠客可立刻参与！">>
    };
get(20803) ->
    #{
        id => 20803,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>对演武守将造成了最后一击，获得了丰厚的奖励！">>
    };
get(20804) ->
    #{
        id => 20804,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>帮会对演武守将造成的伤害排行第一，获得大量珍稀物品，稍后会上架拍卖行供全帮购买。">>
    };
get(20901) ->
    #{
        id => 20901,
        channel => [2],
        rumor => <<"帮会练功活动将在5分钟后开启，请各位侠客踊跃参加！">>
    };
get(20902) ->
    #{
        id => 20902,
        channel => [2],
        rumor => <<"帮会练功活动已开启，各位侠客可以组队到练功师处练功！">>
    };
get(21001) ->
    #{
        id => 21001,
        channel => [2],
        rumor => <<"帮会行酒令活动将在5分钟后开启，请各位侠客踊跃参加！">>
    };
get(21002) ->
    #{
        id => 21002,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>活动已开始，请各位侠客积极参与！">>
    };
get(21003) ->
    #{
        id => 21003,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>帮会对本帮发起了宣战，请各位成员做好作战准备，迎击挑衅者！">>
    };
get(21004) ->
    #{
        id => 21004,
        channel => [2],
        rumor => <<"本帮<font color='#ff923e'>%s</font>在<font color='#ff923e'>%s</font>击杀了<font color='#ff923e'>%s</font>的<font color='#ff923e'>%s</font>，大家为他喝彩！">>
    };
get(21005) ->
    #{
        id => 21005,
        channel => [2],
        rumor => <<"非常遗憾，本帮<font color='#ff923e'>%s</font>在<font color='#ff923e'>%s</font>被<font color='#ff923e'>%s</font>帮会的<font color='#ff923e'>%s</font>击杀了，帮内各位侠士请前往支援。">>
    };
get(21006) ->
    #{
        id => 21006,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>帮会对本帮设置了敌对关系，请各位成员运镖注意敌对成员，保护镖物！">>
    };
get(21007) ->
    #{
        id => 21007,
        channel => [2],
        rumor => <<"非常遗憾，本帮<font color='#ff923e'>%s</font>在运镖过程中，惨遭<font color='#ff923e'>%s</font>帮会的<font color='#ff923e'>%s</font>埋伏，帮内各位侠士请前往支援。">>
    };
get(21101) ->
    #{
        id => 21101,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>在跑环任务过程中资源紧缺，同帮的兄弟姐妹们搭把手呗！<font color='#ff923e'>%s</font>【我来帮忙】">>
    };
get(21201) ->
    #{
        id => 21201,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>打开藏宝图，获得珍兽技能书<font color='#ff923e'>%s</font>！">>
    };
get(21301) ->
    #{
        id => 21301,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>将神器提升至<font color='#ff923e'>%s</font>！">>
    };
get(21401) ->
    #{
        id => 21401,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>驭兽显神威，将<font color='#5fc934'>%s</font>的成长率洗练至完美。">>
    };
get(21402) ->
    #{
        id => 21402,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>素以爱护珍兽闻名，这次竟繁殖出%s星<font color='#ff923e'>%s</font>。">>
    };
get(21403) ->
    #{
        id => 21403,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>将珍兽%s的悟性等级传承给了珍兽<font color='#ff923e'>%s</font>，令其实力得到极大增强。">>
    };
get(21404) ->
    #{
        id => 21404,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>将珍兽%s的技能传承给了珍兽<font color='#ff923e'>%s</font>，令其实力得到极大增强。">>
    };
get(21405) ->
    #{
        id => 21405,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>将%s聚灵法阵的<font color='#5fc934'>%s</font>内丹提升至<font color='#5fc934'>%s级</font>。">>
    };
get(21406) ->
    #{
        id => 21406,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>真乃驭兽高手，将<font color='#5fc934'>%s</font>的悟性提升至<font color='#5fc934'>%s级</font>。">>
    };
get(21501) ->
    #{
        id => 21501,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>将身上镶嵌的宝石提升至<font color='#5298e3'>%s</font>">>
    };
get(21502) ->
    #{
        id => 21502,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>开天辟地，获得上古神兵<font color='#d5722d'>重楼肩</font>！">>
    };
get(21503) ->
    #{
        id => 21503,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>将上古神兵重楼肩觉醒成<font color='#d5722d'>%s</font>！">>
    };
get(21504) ->
    #{
        id => 21504,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>将暗器打造成<font color='#d5722d'>%s</font>！">>
    };
get(21505) ->
    #{
        id => 21505,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>洗出暗器技能<font color='#d5722d'>%s</font>！">>
    };
get(21506) ->
    #{
        id => 21506,
        channel => [1],
        rumor => <<"<font color='#5298e3'>%s</font>成功打造出<font color='#d5722d'>%s</font>星装备<font color='#d5722d'>%s</font>！">>
    };
get(22001) ->
    #{
        id => 22001,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场已连续击败5人！无人能挡！">>
    };
get(22002) ->
    #{
        id => 22002,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场已连续击败10人！大战八方，所向披靡！">>
    };
get(22003) ->
    #{
        id => 22003,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场已连续击败15人！勇冠三军！还有谁能战！">>
    };
get(22004) ->
    #{
        id => 22004,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场已连续击败20人！所过之处，片甲不留！">>
    };
get(22005) ->
    #{
        id => 22005,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场已连续击败25人！天煞孤星，一代凶神！">>
    };
get(22006) ->
    #{
        id => 22006,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场已连续击败30人！人生真是寂寞如雪！！">>
    };
get(22007) ->
    #{
        id => 22007,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>给各位准备了一个<font color='#ff923e'>%s</font>，快来试试手气吧！[1013]">>
    };
get(22008) ->
    #{
        id => 22008,
        channel => [2],
        rumor => <<"喜从天降，<font color='#ff923e'>%s</font>领取<font color='#ff923e'>%s</font>的红包时，意外获得了<font color='#ff923e'>%s</font>绑元！">>
    };
get(23001) ->
    #{
        id => 23001,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在龙纹凝元中获得<font color='#ff923e'>%s</font>！">>
    };
get(23002) ->
    #{
        id => 23002,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>将龙纹提升到<font color='#ff923e'>%s</font>级！">>
    };
get(24001) ->
    #{
        id => 24001,
        channel => [3],
        rumor => <<"队伍全部队员都已完成珍珑棋局，无法进入">>
    };
get(25001) ->
    #{
        id => 25001,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>进行帮会任务之际，触发奇遇转盘！">>
    };
get(26001) ->
    #{
        id => 26001,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>发布了任务求助信息，寻找<font color='#ff923e'>%s</font>。[1014]">>
    };
get(26002) ->
    #{
        id => 26002,
        channel => [2],
        rumor => <<"<font color='#ff923e'>%s</font>发布的任务求助信息已由<font color='#ff923e'>%s</font>完成。<font color='#5298e3'>[无价之宝(%s/%s)]</font>[1015]">>
    };
get(27001) ->
    #{
        id => 27001,
        channel => [1],
        rumor => <<"恭喜<font color='#ff923e'>%s</font>和<font color='#ff923e'>%s</font>喜结连理，祝愿他们白头偕老、比翼双飞、一生幸福。">>
    };
get(27002) ->
    #{
        id => 27002,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>与<font color='#ff923e'>%s</font>的花轿队伍将由洛阳出发，沿路会洒下新婚礼盒，大伙一起去沾沾喜气吧！">>
    };
get(27003) ->
    #{
        id => 27003,
        channel => [2],
        rumor => <<"亲爱的朋友，我与<font color='#ff923e'>%s</font>结婚了，快来跟我们一起玩耍吧~请来洛阳通过月老传送进入礼堂！">>
    };
get(28001) ->
    #{
        id => 28001,
        channel => [1],
        rumor => <<"<font color='#ff923e'>[%s]</font>在%s使用了<font color='#ff923e'>%s</font>，以示对<font color='#ff923e'>[%s]</font>爱在心怀！">>
    };
get(29001) ->
    #{
        id => 29001,
        channel => [1],
        rumor => <<"恭喜<font color='#ff923e'>%s</font>收了<font color='#ff923e'>%s</font>如此天资卓越的徒弟！">>
    };
get(29002) ->
    #{
        id => 29002,
        channel => [1],
        rumor => <<"恭喜<font color='#ff923e'>%s</font>顺利出师，希望他再接再厉，不要忘记师父<font color='#ff923e'>%s</font>的辛勤教诲！">>
    };
get(29003) ->
    #{
        id => 29003,
        channel => [1],
        rumor => <<"黄天在上，后土在下，今日<font color='#ff923e'>%s</font>在此结拜，祸福同享不离不弃！">>
    };
get(30001) ->
    #{
        id => 30001,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在秦皇陵战场已连续击败5人！无人能挡！">>
    };
get(30002) ->
    #{
        id => 30002,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在秦皇陵战场已连续击败10人！大战八方，所向披靡！">>
    };
get(30003) ->
    #{
        id => 30003,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在秦皇陵战场已连续击败15人！勇冠三军！还有谁能战！">>
    };
get(30004) ->
    #{
        id => 30004,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在秦皇陵战场已连续击败20人！所过之处，片甲不留！">>
    };
get(30005) ->
    #{
        id => 30005,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在秦皇陵战场已连续击败25人！天煞孤星，一代凶神！">>
    };
get(30006) ->
    #{
        id => 30006,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在秦皇陵战场已连续击败30人！人生真是寂寞如雪！！">>
    };
get(30007) ->
    #{
        id => 30007,
        channel => [1],
        rumor => <<"经过一番浴血奋战，<font color='#ff923e'>%s</font>在秦皇陵中表现异常突出，最终积分排名第一，声名大噪！">>
    };
get(31001) ->
    #{
        id => 31001,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败5人！">>
    };
get(31002) ->
    #{
        id => 31002,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败6人！">>
    };
get(31003) ->
    #{
        id => 31003,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败7人！">>
    };
get(31004) ->
    #{
        id => 31004,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败8人！">>
    };
get(31005) ->
    #{
        id => 31005,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败9人！">>
    };
get(31006) ->
    #{
        id => 31006,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败10人！">>
    };
get(31007) ->
    #{
        id => 31007,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败11人！">>
    };
get(31008) ->
    #{
        id => 31008,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败12人！">>
    };
get(31009) ->
    #{
        id => 31009,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败13人！">>
    };
get(31010) ->
    #{
        id => 31010,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败14人！">>
    };
get(31011) ->
    #{
        id => 31011,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败15人！">>
    };
get(31012) ->
    #{
        id => 31012,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败16人！">>
    };
get(31013) ->
    #{
        id => 31013,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败17人！">>
    };
get(31014) ->
    #{
        id => 31014,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败18人！">>
    };
get(31015) ->
    #{
        id => 31015,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败19人！">>
    };
get(31016) ->
    #{
        id => 31016,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败20人！">>
    };
get(31017) ->
    #{
        id => 31017,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败21人！">>
    };
get(31018) ->
    #{
        id => 31018,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败22人！">>
    };
get(31019) ->
    #{
        id => 31019,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败23人！">>
    };
get(31020) ->
    #{
        id => 31020,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败24人！">>
    };
get(31021) ->
    #{
        id => 31021,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败25人！">>
    };
get(31022) ->
    #{
        id => 31022,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败26人！">>
    };
get(31023) ->
    #{
        id => 31023,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败27人！">>
    };
get(31024) ->
    #{
        id => 31024,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败28人！">>
    };
get(31025) ->
    #{
        id => 31025,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败29人！">>
    };
get(31026) ->
    #{
        id => 31026,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败30人！">>
    };
get(31027) ->
    #{
        id => 31027,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败31人！">>
    };
get(31028) ->
    #{
        id => 31028,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败32人！">>
    };
get(31029) ->
    #{
        id => 31029,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败33人！">>
    };
get(31030) ->
    #{
        id => 31030,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败34人！">>
    };
get(31031) ->
    #{
        id => 31031,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败35人！">>
    };
get(31032) ->
    #{
        id => 31032,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败36人！">>
    };
get(31033) ->
    #{
        id => 31033,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败37人！">>
    };
get(31034) ->
    #{
        id => 31034,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败38人！">>
    };
get(31035) ->
    #{
        id => 31035,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败39人！">>
    };
get(31036) ->
    #{
        id => 31036,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败40人！">>
    };
get(31037) ->
    #{
        id => 31037,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败41人！">>
    };
get(31038) ->
    #{
        id => 31038,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败42人！">>
    };
get(31039) ->
    #{
        id => 31039,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败43人！">>
    };
get(31040) ->
    #{
        id => 31040,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败44人！">>
    };
get(31041) ->
    #{
        id => 31041,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败45人！">>
    };
get(31042) ->
    #{
        id => 31042,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败46人！">>
    };
get(31043) ->
    #{
        id => 31043,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败47人！">>
    };
get(31044) ->
    #{
        id => 31044,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败48人！">>
    };
get(31045) ->
    #{
        id => 31045,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败49人！">>
    };
get(31046) ->
    #{
        id => 31046,
        channel => [1],
        rumor => <<"<font color='#ff923e'>%s</font>在宋辽战场连战连捷，骁勇异常，已经连续击败50人！">>
    };
get(_ID) ->
    undefined.

get_ids() ->
    [0, 1001, 1002, 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009, 10010, 20001, 20002, 20101, 20102, 20103, 20104, 20105, 20106, 20201, 20202, 20301, 20302, 20303, 20304, 20401, 20402, 20501, 20502, 20503, 20504, 20505, 20506, 20507, 20508, 20509, 20510, 20511, 20512, 20513, 20514, 20515, 20516, 20601, 20602, 20603, 20604, 20701, 20702, 20703, 20704, 20705, 20801, 20802, 20803, 20804, 20901, 20902, 21001, 21002, 21003, 21004, 21005, 21006, 21007, 21101, 21201, 21301, 21401, 21402, 21403, 21404, 21405, 21406, 21501, 21502, 21503, 21504, 21505, 21506, 22001, 22002, 22003, 22004, 22005, 22006, 22007, 22008, 23001, 23002, 24001, 25001, 26001, 26002, 27001, 27002, 27003, 28001, 29001, 29002, 29003, 30001, 30002, 30003, 30004, 30005, 30006, 30007, 31001, 31002, 31003, 31004, 31005, 31006, 31007, 31008, 31009, 31010, 31011, 31012, 31013, 31014, 31015, 31016, 31017, 31018, 31019, 31020, 31021, 31022, 31023, 31024, 31025, 31026, 31027, 31028, 31029, 31030, 31031, 31032, 31033, 31034, 31035, 31036, 31037, 31038, 31039, 31040, 31041, 31042, 31043, 31044, 31045, 31046].
