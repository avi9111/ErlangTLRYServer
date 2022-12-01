-module(prot_414).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_414.hrl").


%% ---------------------------------------------------------------------------------------

decode(41401, _BinData) ->

    UnpackRecordData = #cs_guild_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41402, BinData) ->
    {_RBin0, Guild} = prot_util:unpack(BinData, {u,clt_guild}),

    UnpackRecordData = #sc_guild_info{
        guild = Guild
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41403, _BinData) ->

    UnpackRecordData = #cs_guild_list{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41404, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{u,clt_guild_brief}]),

    UnpackRecordData = #sc_guild_list{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41405, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_guild_get_detail{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41406, BinData) ->
    {_RBin0, Guild} = prot_util:unpack(BinData, {u,clt_guild}),

    UnpackRecordData = #sc_guild_get_detail{
        guild = Guild
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41407, _BinData) ->

    UnpackRecordData = #cs_guild_get_members{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41408, BinData) ->
    {_RBin0, Members} = prot_util:unpack(BinData, [{u,clt_guild_member}]),

    UnpackRecordData = #sc_guild_get_members{
        members = Members
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41409, _BinData) ->

    UnpackRecordData = #cs_guild_get_join_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41410, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{u,clt_guild_request}]),

    UnpackRecordData = #sc_guild_get_join_req{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41411, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {_RBin2, Announce} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #cs_guild_create{
        type = Type,
        name = Name,
        announce = Announce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41412, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_guild_create{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41413, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_guild_join_req{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41414, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_guild_join_req{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41415, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_guild_cancel_req{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41416, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_guild_cancel_req{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41417, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Level} = prot_util:unpack(RBin1, {16, unsigned}),
    {_RBin3, Fight} = prot_util:unpack(RBin2, {32, unsigned}),

    UnpackRecordData = #sc_guild_notify_join_req{
        id = Id,
        name = Name,
        level = Level,
        fight = Fight
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41418, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #sc_guild_notify_cancel_req{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41419, BinData) ->
    {RBin0, Approve} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #cs_guild_handle_req{
        approve = Approve,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41420, BinData) ->
    {RBin0, Approve} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, List} = prot_util:unpack(RBin0, [{64, unsigned}]),

    UnpackRecordData = #sc_guild_handle_req{
        approve = Approve,
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41421, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_invite_join_guild{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41422, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_invite_join_guild{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41423, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {_RBin2, Approve} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_guild_approve_result{
        id = Id,
        name = Name,
        approve = Approve
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41424, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleName} = prot_util:unpack(RBin0, string),
    {RBin2, GuildId} = prot_util:unpack(RBin1, {64, unsigned}),
    {_RBin3, GuildName} = prot_util:unpack(RBin2, string),

    UnpackRecordData = #sc_new_guild_invite{
        role_id = RoleId,
        role_name = RoleName,
        guild_id = GuildId,
        guild_name = GuildName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41425, _BinData) ->

    UnpackRecordData = #cs_guild_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41426, _BinData) ->

    UnpackRecordData = #sc_guild_leave{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41427, BinData) ->
    {_RBin0, List} = prot_util:unpack(BinData, [{u,clt_guild_member}]),

    UnpackRecordData = #sc_guild_notify_join{
        list = List
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41428, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_guild_notify_leave{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41429, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #cs_guild_kick_member{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41430, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_guild_kick_member{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41431, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #sc_guild_notify_kick{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41433, BinData) ->
    {_RBin0, Name} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_guild_rename{
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41434, BinData) ->
    {_RBin0, Name} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_guild_rename{
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41435, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Pos} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_guild_appoint_pos{
        role_id = RoleId,
        pos = Pos
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41436, _BinData) ->

    UnpackRecordData = #sc_guild_appoint_pos{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41437, BinData) ->
    {RBin0, GuildId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, GuildName} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #sc_guild_notify_rename{
        guild_id = GuildId,
        guild_name = GuildName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41438, BinData) ->
    {_RBin0, Change} = prot_util:unpack(BinData, [{{64, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_notify_pos{
        change = Change
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41439, BinData) ->
    {_RBin0, Announce} = prot_util:unpack(BinData, string),

    UnpackRecordData = #cs_guild_change_announce{
        announce = Announce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41440, _BinData) ->

    UnpackRecordData = #sc_guild_change_announce{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41441, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Auto} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #cs_guild_change_accept_type{
        type = Type,
        auto = Auto
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41442, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Auto} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_change_accept_type{
        type = Type,
        auto = Auto
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41443, BinData) ->
    {_RBin0, Announce} = prot_util:unpack(BinData, string),

    UnpackRecordData = #sc_guild_notify_announce{
        announce = Announce
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41444, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Funds} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_guild_notify_level_up{
        level = Level,
        funds = Funds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41445, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Time} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_guild_notify_online{
        role_id = RoleId,
        time = Time
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41447, _BinData) ->

    UnpackRecordData = #cs_guild_recruit{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41448, BinData) ->
    {_RBin0, RecruitTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_guild_recruit{
        recruit_time = RecruitTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41449, _BinData) ->

    UnpackRecordData = #cs_guild_logs{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41450, BinData) ->
    {_RBin0, Logs} = prot_util:unpack(BinData, [{{32, unsigned}, string}]),

    UnpackRecordData = #sc_guild_logs{
        logs = Logs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41451, _BinData) ->

    UnpackRecordData = #cs_guild_skill_list{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41452, BinData) ->
    {_RBin0, Skills} = prot_util:unpack(BinData, [{{32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_skill_list{
        skills = Skills
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41453, _BinData) ->

    UnpackRecordData = #cs_guild_up_skill{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41454, BinData) ->
    {RBin0, Skill} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, Level} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_up_skill{
        skill = Skill,
        level = Level
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41455, _BinData) ->

    UnpackRecordData = #cs_guild_live_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41456, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Exp} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Daily} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Reward} = prot_util:unpack(RBin2, [{8, unsigned}]),
    {_RBin4, Tasks} = prot_util:unpack(RBin3, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_live_info{
        level = Level,
        exp = Exp,
        daily = Daily,
        reward = Reward,
        tasks = Tasks
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41457, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_get_live_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41458, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_guild_get_live_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41459, _BinData) ->

    UnpackRecordData = #cs_guild_live_upgrade{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41460, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Exp} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_guild_live_upgrade{
        level = Level,
        exp = Exp
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41461, BinData) ->
    {RBin0, Exp} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, Daily} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #sc_guild_live_notify{
        exp = Exp,
        daily = Daily
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41463, _BinData) ->

    UnpackRecordData = #cs_guild_cook_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41464, BinData) ->
    {RBin0, Num} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Total} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Reward} = prot_util:unpack(RBin2, [{8, unsigned}]),
    {_RBin4, Logs} = prot_util:unpack(RBin3, [{{32, unsigned}, {64, unsigned}, string, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_cook_info{
        num = Num,
        type = Type,
        total = Total,
        reward = Reward,
        logs = Logs
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41465, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_cook{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41466, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_guild_cook{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41467, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_get_cook_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41468, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_guild_get_cook_reward{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41471, _BinData) ->

    UnpackRecordData = #cs_guild_enter_seat{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41472, _BinData) ->

    UnpackRecordData = #sc_guild_enter_seat{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41473, _BinData) ->

    UnpackRecordData = #cs_guild_leave_seat{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41474, _BinData) ->

    UnpackRecordData = #sc_guild_leave_seat{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41475, _BinData) ->

    UnpackRecordData = #cs_guild_ex_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41476, BinData) ->
    {RBin0, Items} = prot_util:unpack(BinData, [{{16, unsigned}, {8, unsigned}}]),
    {RBin1, Refresh} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, Manual} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #sc_guild_ex_info{
        items = Items,
        refresh = Refresh,
        manual = Manual
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41477, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_guild_exchange{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41478, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_guild_exchange{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41479, _BinData) ->

    UnpackRecordData = #cs_guild_ex_refresh{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41480, _BinData) ->

    UnpackRecordData = #sc_guild_ex_refresh{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41481, _BinData) ->

    UnpackRecordData = #cs_guild_upgrade{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41482, BinData) ->
    {_RBin0, Funds} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #sc_guild_cost_denf{
        funds = Funds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41483, _BinData) ->

    UnpackRecordData = #cs_guild_practice_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41484, BinData) ->
    {RBin0, PracMaxLv} = prot_util:unpack(BinData, {16, unsigned}),
    {_RBin1, PracticeSkill} = prot_util:unpack(RBin0, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sc_guild_practice_info{
        prac_max_lv = PracMaxLv,
        practice_skill = PracticeSkill
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41485, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_practice_up{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41486, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Lv} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_guild_practice_up{
        id = Id,
        lv = Lv
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41487, _BinData) ->

    UnpackRecordData = #cs_guild_banquet{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41488, _BinData) ->

    UnpackRecordData = #sc_guild_banquet{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41489, _BinData) ->

    UnpackRecordData = #cs_guild_metall_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41490, BinData) ->
    {_RBin0, MetallLively} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #sc_guild_metall_info{
        metall_lively = MetallLively
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41491, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_guild_metall_task{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41492, BinData) ->
    {RBin0, TaskId} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, MetallLively} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #sc_guild_metall_task{
        task_id = TaskId,
        metall_lively = MetallLively
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41493, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_guild_build_up{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41494, BinData) ->
    {_RBin0, Build} = prot_util:unpack(BinData, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_build_up{
        build = Build
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41495, BinData) ->
    {_RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #cs_guild_study_up{
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41496, BinData) ->
    {_RBin0, Study} = prot_util:unpack(BinData, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #sc_guild_study_up{
        study = Study
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(41401, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41402, PackRecordData) ->
    Guild = prot_util:pack(PackRecordData#sc_guild_info.guild, {u,clt_guild}),

    BinData = <<
        Guild/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41403, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41404, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_guild_list.list, [{u,clt_guild_brief}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41405, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_get_detail.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41406, PackRecordData) ->
    Guild = prot_util:pack(PackRecordData#sc_guild_get_detail.guild, {u,clt_guild}),

    BinData = <<
        Guild/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41407, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41408, PackRecordData) ->
    Members = prot_util:pack(PackRecordData#sc_guild_get_members.members, [{u,clt_guild_member}]),

    BinData = <<
        Members/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41409, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41410, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_guild_get_join_req.list, [{u,clt_guild_request}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41411, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_guild_create.type, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#cs_guild_create.name, string),
    Announce = prot_util:pack(PackRecordData#cs_guild_create.announce, string),

    BinData = <<
        Type/binary,
        Name/binary,
        Announce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41412, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_create.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41413, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_join_req.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41414, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_join_req.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41415, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_cancel_req.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41416, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_cancel_req.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41417, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_notify_join_req.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_guild_notify_join_req.name, string),
    Level = prot_util:pack(PackRecordData#sc_guild_notify_join_req.level, {16, unsigned}),
    Fight = prot_util:pack(PackRecordData#sc_guild_notify_join_req.fight, {32, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Level/binary,
        Fight/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41418, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_guild_notify_cancel_req.list, [{64, unsigned}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41419, PackRecordData) ->
    Approve = prot_util:pack(PackRecordData#cs_guild_handle_req.approve, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#cs_guild_handle_req.id, {64, unsigned}),

    BinData = <<
        Approve/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41420, PackRecordData) ->
    Approve = prot_util:pack(PackRecordData#sc_guild_handle_req.approve, {8, unsigned}),
    List = prot_util:pack(PackRecordData#sc_guild_handle_req.list, [{64, unsigned}]),

    BinData = <<
        Approve/binary,
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41421, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_invite_join_guild.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41422, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_invite_join_guild.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41423, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_approve_result.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sc_guild_approve_result.name, string),
    Approve = prot_util:pack(PackRecordData#sc_guild_approve_result.approve, {8, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Approve/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41424, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_new_guild_invite.role_id, {64, unsigned}),
    RoleName = prot_util:pack(PackRecordData#sc_new_guild_invite.role_name, string),
    GuildId = prot_util:pack(PackRecordData#sc_new_guild_invite.guild_id, {64, unsigned}),
    GuildName = prot_util:pack(PackRecordData#sc_new_guild_invite.guild_name, string),

    BinData = <<
        RoleId/binary,
        RoleName/binary,
        GuildId/binary,
        GuildName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41425, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41426, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41427, PackRecordData) ->
    List = prot_util:pack(PackRecordData#sc_guild_notify_join.list, [{u,clt_guild_member}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41428, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_notify_leave.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41429, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_kick_member.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41430, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_kick_member.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41431, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_notify_kick.id, {64, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41433, PackRecordData) ->
    Name = prot_util:pack(PackRecordData#cs_guild_rename.name, string),

    BinData = <<
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41434, PackRecordData) ->
    Name = prot_util:pack(PackRecordData#sc_guild_rename.name, string),

    BinData = <<
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41435, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#cs_guild_appoint_pos.role_id, {64, unsigned}),
    Pos = prot_util:pack(PackRecordData#cs_guild_appoint_pos.pos, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Pos/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41436, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41437, PackRecordData) ->
    GuildId = prot_util:pack(PackRecordData#sc_guild_notify_rename.guild_id, {64, unsigned}),
    GuildName = prot_util:pack(PackRecordData#sc_guild_notify_rename.guild_name, string),

    BinData = <<
        GuildId/binary,
        GuildName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41438, PackRecordData) ->
    Change = prot_util:pack(PackRecordData#sc_guild_notify_pos.change, [{{64, unsigned}, {8, unsigned}}]),

    BinData = <<
        Change/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41439, PackRecordData) ->
    Announce = prot_util:pack(PackRecordData#cs_guild_change_announce.announce, string),

    BinData = <<
        Announce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41440, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41441, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_guild_change_accept_type.type, {8, unsigned}),
    Auto = prot_util:pack(PackRecordData#cs_guild_change_accept_type.auto, {8, unsigned}),

    BinData = <<
        Type/binary,
        Auto/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41442, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_guild_change_accept_type.type, {8, unsigned}),
    Auto = prot_util:pack(PackRecordData#sc_guild_change_accept_type.auto, {8, unsigned}),

    BinData = <<
        Type/binary,
        Auto/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41443, PackRecordData) ->
    Announce = prot_util:pack(PackRecordData#sc_guild_notify_announce.announce, string),

    BinData = <<
        Announce/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41444, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#sc_guild_notify_level_up.level, {8, unsigned}),
    Funds = prot_util:pack(PackRecordData#sc_guild_notify_level_up.funds, {32, unsigned}),

    BinData = <<
        Level/binary,
        Funds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41445, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sc_guild_notify_online.role_id, {64, unsigned}),
    Time = prot_util:pack(PackRecordData#sc_guild_notify_online.time, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Time/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41447, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41448, PackRecordData) ->
    RecruitTime = prot_util:pack(PackRecordData#sc_guild_recruit.recruit_time, {32, unsigned}),

    BinData = <<
        RecruitTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41449, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41450, PackRecordData) ->
    Logs = prot_util:pack(PackRecordData#sc_guild_logs.logs, [{{32, unsigned}, string}]),

    BinData = <<
        Logs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41451, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41452, PackRecordData) ->
    Skills = prot_util:pack(PackRecordData#sc_guild_skill_list.skills, [{{32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Skills/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41453, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41454, PackRecordData) ->
    Skill = prot_util:pack(PackRecordData#sc_guild_up_skill.skill, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#sc_guild_up_skill.level, {8, unsigned}),

    BinData = <<
        Skill/binary,
        Level/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41455, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41456, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#sc_guild_live_info.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_guild_live_info.exp, {16, unsigned}),
    Daily = prot_util:pack(PackRecordData#sc_guild_live_info.daily, {8, unsigned}),
    Reward = prot_util:pack(PackRecordData#sc_guild_live_info.reward, [{8, unsigned}]),
    Tasks = prot_util:pack(PackRecordData#sc_guild_live_info.tasks, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Level/binary,
        Exp/binary,
        Daily/binary,
        Reward/binary,
        Tasks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41457, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_get_live_reward.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41458, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_get_live_reward.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41459, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41460, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#sc_guild_live_upgrade.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#sc_guild_live_upgrade.exp, {16, unsigned}),

    BinData = <<
        Level/binary,
        Exp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41461, PackRecordData) ->
    Exp = prot_util:pack(PackRecordData#sc_guild_live_notify.exp, {16, unsigned}),
    Daily = prot_util:pack(PackRecordData#sc_guild_live_notify.daily, {8, unsigned}),

    BinData = <<
        Exp/binary,
        Daily/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41463, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41464, PackRecordData) ->
    Num = prot_util:pack(PackRecordData#sc_guild_cook_info.num, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#sc_guild_cook_info.type, {8, unsigned}),
    Total = prot_util:pack(PackRecordData#sc_guild_cook_info.total, {8, unsigned}),
    Reward = prot_util:pack(PackRecordData#sc_guild_cook_info.reward, [{8, unsigned}]),
    Logs = prot_util:pack(PackRecordData#sc_guild_cook_info.logs, [{{32, unsigned}, {64, unsigned}, string, {8, unsigned}}]),

    BinData = <<
        Num/binary,
        Type/binary,
        Total/binary,
        Reward/binary,
        Logs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41465, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_guild_cook.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41466, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#sc_guild_cook.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41467, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_get_cook_reward.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41468, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_get_cook_reward.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41471, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41472, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41473, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41474, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41475, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41476, PackRecordData) ->
    Items = prot_util:pack(PackRecordData#sc_guild_ex_info.items, [{{16, unsigned}, {8, unsigned}}]),
    Refresh = prot_util:pack(PackRecordData#sc_guild_ex_info.refresh, {32, unsigned}),
    Manual = prot_util:pack(PackRecordData#sc_guild_ex_info.manual, {8, unsigned}),

    BinData = <<
        Items/binary,
        Refresh/binary,
        Manual/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41477, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_exchange.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41478, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_exchange.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41479, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41480, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41481, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41482, PackRecordData) ->
    Funds = prot_util:pack(PackRecordData#sc_guild_cost_denf.funds, {32, unsigned}),

    BinData = <<
        Funds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41483, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41484, PackRecordData) ->
    PracMaxLv = prot_util:pack(PackRecordData#sc_guild_practice_info.prac_max_lv, {16, unsigned}),
    PracticeSkill = prot_util:pack(PackRecordData#sc_guild_practice_info.practice_skill, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        PracMaxLv/binary,
        PracticeSkill/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41485, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_practice_up.id, {8, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41486, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_guild_practice_up.id, {8, unsigned}),
    Lv = prot_util:pack(PackRecordData#sc_guild_practice_up.lv, {16, unsigned}),

    BinData = <<
        Id/binary,
        Lv/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41487, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41488, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41489, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41490, PackRecordData) ->
    MetallLively = prot_util:pack(PackRecordData#sc_guild_metall_info.metall_lively, {16, unsigned}),

    BinData = <<
        MetallLively/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41491, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#cs_guild_metall_task.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41492, PackRecordData) ->
    TaskId = prot_util:pack(PackRecordData#sc_guild_metall_task.task_id, {32, unsigned}),
    MetallLively = prot_util:pack(PackRecordData#sc_guild_metall_task.metall_lively, {16, unsigned}),

    BinData = <<
        TaskId/binary,
        MetallLively/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41493, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_build_up.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41494, PackRecordData) ->
    Build = prot_util:pack(PackRecordData#sc_guild_build_up.build, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Build/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41495, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#cs_guild_study_up.id, {16, unsigned}),

    BinData = <<
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41496, PackRecordData) ->
    Study = prot_util:pack(PackRecordData#sc_guild_study_up.study, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Study/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

