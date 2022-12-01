-module(prot_518).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_518.hrl").


%% ---------------------------------------------------------------------------------------

decode(51801, _BinData) ->

    UnpackRecordData = #cs_guild_wine_act_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51802, BinData) ->
    {RBin0, EndTime} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, ExpGet} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Number} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, ExpAddPer} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, CurSubject} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, NextSubject} = prot_util:unpack(RBin4, {8, unsigned}),
    {_RBin6, NextTime} = prot_util:unpack(RBin5, {32, unsigned}),

    UnpackRecordData = #sc_guild_wine_act_info{
        end_time = EndTime,
        exp_get = ExpGet,
        number = Number,
        exp_add_per = ExpAddPer,
        cur_subject = CurSubject,
        next_subject = NextSubject,
        next_time = NextTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51803, BinData) ->
    {_RBin0, ExpGet} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_guild_wine_act_update_exp{
        exp_get = ExpGet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51804, BinData) ->
    {RBin0, Number} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, ExpAddPer} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_wine_act_update_number{
        number = Number,
        exp_add_per = ExpAddPer
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51805, BinData) ->
    {RBin0, CurSubject} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, NextSubject} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, NextTime} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #sc_guild_wine_act_update_next_subject{
        cur_subject = CurSubject,
        next_subject = NextSubject,
        next_time = NextTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51806, _BinData) ->

    UnpackRecordData = #cs_guild_wine_act_dice{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51807, BinData) ->
    {_RBin0, DiceNum} = prot_util:unpack(BinData, [{8, unsigned}]),

    UnpackRecordData = #sc_guild_wine_act_dice{
        dice_num = DiceNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51808, _BinData) ->

    UnpackRecordData = #cs_guild_wine_act_comment_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51809, BinData) ->
    {RBin0, DiceMaxRole} = prot_util:unpack(BinData, {u,guild_comment_role}),
    {_RBin1, DiceMinRole} = prot_util:unpack(RBin0, {u,guild_comment_role}),

    UnpackRecordData = #sc_guild_wine_act_comment_info{
        dice_max_role = DiceMaxRole,
        dice_min_role = DiceMinRole
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51810, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, CommentType} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_guild_wine_act_give_comment{
        role_id = RoleId,
        comment_type = CommentType
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(51811, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, LikeNum} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, DislikeNum} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #sc_guild_wine_act_update_role{
        role_id = RoleId,
        like_num = LikeNum,
        dislike_num = DislikeNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(51801, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51802, PackRecordData) ->
    EndTime = prot_util:pack(PackRecordData#sc_guild_wine_act_info.end_time, {32, unsigned}),
    ExpGet = prot_util:pack(PackRecordData#sc_guild_wine_act_info.exp_get, {32, unsigned}),
    Number = prot_util:pack(PackRecordData#sc_guild_wine_act_info.number, {32, unsigned}),
    ExpAddPer = prot_util:pack(PackRecordData#sc_guild_wine_act_info.exp_add_per, {8, unsigned}),
    CurSubject = prot_util:pack(PackRecordData#sc_guild_wine_act_info.cur_subject, {8, unsigned}),
    NextSubject = prot_util:pack(PackRecordData#sc_guild_wine_act_info.next_subject, {8, unsigned}),
    NextTime = prot_util:pack(PackRecordData#sc_guild_wine_act_info.next_time, {32, unsigned}),

    BinData = <<
        EndTime/binary,
        ExpGet/binary,
        Number/binary,
        ExpAddPer/binary,
        CurSubject/binary,
        NextSubject/binary,
        NextTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51803, PackRecordData) ->
    ExpGet = prot_util:pack(PackRecordData#sc_guild_wine_act_update_exp.exp_get, {32, unsigned}),

    BinData = <<
        ExpGet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51804, PackRecordData) ->
    Number = prot_util:pack(PackRecordData#sc_guild_wine_act_update_number.number, {32, unsigned}),
    ExpAddPer = prot_util:pack(PackRecordData#sc_guild_wine_act_update_number.exp_add_per, {8, unsigned}),

    BinData = <<
        Number/binary,
        ExpAddPer/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51805, PackRecordData) ->
    CurSubject = prot_util:pack(PackRecordData#sc_guild_wine_act_update_next_subject.cur_subject, {8, unsigned}),
    NextSubject = prot_util:pack(PackRecordData#sc_guild_wine_act_update_next_subject.next_subject, {8, unsigned}),
    NextTime = prot_util:pack(PackRecordData#sc_guild_wine_act_update_next_subject.next_time, {32, unsigned}),

    BinData = <<
        CurSubject/binary,
        NextSubject/binary,
        NextTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51806, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51807, PackRecordData) ->
    DiceNum = prot_util:pack(PackRecordData#sc_guild_wine_act_dice.dice_num, [{8, unsigned}]),

    BinData = <<
        DiceNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51808, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51809, PackRecordData) ->
    DiceMaxRole = prot_util:pack(PackRecordData#sc_guild_wine_act_comment_info.dice_max_role, {u,guild_comment_role}),
    DiceMinRole = prot_util:pack(PackRecordData#sc_guild_wine_act_comment_info.dice_min_role, {u,guild_comment_role}),

    BinData = <<
        DiceMaxRole/binary,
        DiceMinRole/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51810, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_guild_wine_act_give_comment.role_id, {64, unsigned}),
    CommentType = prot_util:pack(PackRecordData#cs_guild_wine_act_give_comment.comment_type, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        CommentType/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(51811, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_guild_wine_act_update_role.role_id, {64, unsigned}),
    LikeNum = prot_util:pack(PackRecordData#sc_guild_wine_act_update_role.like_num, {32, unsigned}),
    DislikeNum = prot_util:pack(PackRecordData#sc_guild_wine_act_update_role.dislike_num, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        LikeNum/binary,
        DislikeNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

