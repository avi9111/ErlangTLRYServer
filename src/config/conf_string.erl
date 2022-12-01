%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : string
%% @Brief  : 字符串
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_string).

-export([
    get/1
]).

get(mail_default_title) ->
    #{
        key => mail_default_title,
        string => <<"系统">>
    };
get(mail_default_content) ->
    #{
        key => mail_default_content,
        string => <<"邮件内容">>
    };
get(mail_from_name_sys) ->
    #{
        key => mail_from_name_sys,
        string => <<"系统">>
    };
get(monday) ->
    #{
        key => monday,
        string => <<"周一">>
    };
get(team_target_nil) ->
    #{
        key => team_target_nil,
        string => <<"无目标">>
    };
get(you) ->
    #{
        key => you,
        string => <<"你">>
    };
get(guild_wine_dice) ->
    #{
        key => guild_wine_dice,
        string => <<"我抛出了~s（共~w点）">>
    };
get(guild_wine_like_max1) ->
    #{
        key => guild_wine_like_max1,
        string => <<"~s，这运气也太好了吧！">>
    };
get(guild_wine_like_max2) ->
    #{
        key => guild_wine_like_max2,
        string => <<"能不能抱一下你的大腿，~s！">>
    };
get(guild_wine_dislike_max1) ->
    #{
        key => guild_wine_dislike_max1,
        string => <<"哇，太夸张了，不科学！">>
    };
get(guild_wine_dislike_max2) ->
    #{
        key => guild_wine_dislike_max2,
        string => <<"~s，还能再高一点嘛？">>
    };
get(guild_wine_like_min1) ->
    #{
        key => guild_wine_like_min1,
        string => <<"6666，点赞！">>
    };
get(guild_wine_like_min2) ->
    #{
        key => guild_wine_like_min2,
        string => <<"可以可以！">>
    };
get(guild_wine_dislike_min1) ->
    #{
        key => guild_wine_dislike_min1,
        string => <<"是不是没有洗手？">>
    };
get(guild_wine_dislike_min2) ->
    #{
        key => guild_wine_dislike_min2,
        string => <<"这也太菜了吧！">>
    };
get(guild_wine) ->
    #{
        key => guild_wine,
        string => <<"行酒令">>
    };
get(guild_quiz) ->
    #{
        key => guild_quiz,
        string => <<"答题">>
    };
get(guild_dice) ->
    #{
        key => guild_dice,
        string => <<"抛骰子">>
    };
get(guild_comment) ->
    #{
        key => guild_comment,
        string => <<"点评">>
    };
get(invite_in_group_msg) ->
    #{
        key => invite_in_group_msg,
        string => <<"~s邀请你进入~s群组，是否同意">>
    };
get(role_rename_msg) ->
    #{
        key => role_rename_msg,
        string => <<"你好，我是~s，已经使用更名帖将名字修改为~s，记得常联系哦 ^么么哒^">>
    };
get(one) ->
    #{
        key => one,
        string => <<"一">>
    };
get(two) ->
    #{
        key => two,
        string => <<"二">>
    };
get(three) ->
    #{
        key => three,
        string => <<"三">>
    };
get(four) ->
    #{
        key => four,
        string => <<"四">>
    };
get(five) ->
    #{
        key => five,
        string => <<"五">>
    };
get(sworn_create_confirm) ->
    #{
        key => sworn_create_confirm,
        string => <<"是否要和~s组成结拜关系？">>
    };
get(sworn_recruit_member_confirm) ->
    #{
        key => sworn_recruit_member_confirm,
        string => <<"~s要接纳~s加入结拜，是否同意？">>
    };
get(sworn_dismiss_member_confirm) ->
    #{
        key => sworn_dismiss_member_confirm,
        string => <<"由于[~s]~s现对其发起请离！是否同意？（如请离成功，金兰值达到10000点及以上，则扣除1000点金兰值）">>
    };
get(sworn_change_senior_confirm) ->
    #{
        key => sworn_change_senior_confirm,
        string => <<"是否同意进行辈分排序">>
    };
get(sworn_modify_name_req_confirm) ->
    #{
        key => sworn_modify_name_req_confirm,
        string => <<"是否同意进行江湖名号修改">>
    };
get(sworn_gather_member_confirm) ->
    #{
        key => sworn_gather_member_confirm,
        string => <<"结拜成员~s召集前往~s，请确认是否接受召集！">>
    };
get(sworn_default_enounce) ->
    #{
        key => sworn_default_enounce,
        string => <<"兄弟同心，其利断金！">>
    };
get(sworn_greet_msg) ->
    #{
        key => sworn_greet_msg,
        string => <<"我在结拜平台看到了你的信息，有意向结拜的话请联系我">>
    };
get(sworn_friend_group) ->
    #{
        key => sworn_friend_group,
        string => <<"结拜群">>
    };
get(mentor_friend_group) ->
    #{
        key => mentor_friend_group,
        string => <<"师徒群">>
    };
get(get_vow_send_info) ->
    #{
        key => get_vow_send_info,
        string => <<"我看到你的心愿，不知是否有幸与你共同完成；如果你中意我，你我二人可组队前往洛阳三生树下结成契约。">>
    };
get(yanhua_40010101) ->
    #{
        key => yanhua_40010101,
        string => <<"我送了你一枚[一见倾心]，以示对你爱在心怀！">>
    };
get(yanhua_40010102) ->
    #{
        key => yanhua_40010102,
        string => <<"我送了你一枚[天女散花]，以示对你爱在心怀！">>
    };
get(yanhua_40010103) ->
    #{
        key => yanhua_40010103,
        string => <<"我送了你一枚[喜结连理]，以示对你爱在心怀！">>
    };
get(yanhua_40010104) ->
    #{
        key => yanhua_40010104,
        string => <<"我送了你一枚[落英缤纷]，以示对你爱在心怀！">>
    };
get(naodongfang1) ->
    #{
        key => naodongfang1,
        string => <<"新郎~s被前来闹洞房的~s用皮鞭抽破了衣服">>
    };
get(naodongfang2) ->
    #{
        key => naodongfang2,
        string => <<"新郎~s被前来闹洞房的~s用板砖打晕了过去">>
    };
get(naodongfang3) ->
    #{
        key => naodongfang3,
        string => <<"新娘~s被前来闹洞房的~s用蜡烛烫红了皮肤">>
    };
get(naodongfang4) ->
    #{
        key => naodongfang4,
        string => <<"新娘~s被前来闹洞房的~s用花生打红了脸">>
    };
get(jiehunchuanwen) ->
    #{
        key => jiehunchuanwen,
        string => <<"亲爱的朋友，我与~s结婚了，快来跟我们一起玩耍吧，请来洛阳通过月老传送进入礼堂！">>
    };
get(mentor_finish_confirm) ->
    #{
        key => mentor_finish_confirm,
        string => <<"~s已顺利出师，是否要收其为亲传弟子，继续师徒之缘？">>
    };
get(tudi_finish_confirm) ->
    #{
        key => tudi_finish_confirm,
        string => <<"你已顺利出师，是否要成为~s的亲传弟子，继续师徒之缘？">>
    };
get(_) ->
    undefined.
