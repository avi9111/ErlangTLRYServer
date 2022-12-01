-module(prot_902).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_902.hrl").


%% ---------------------------------------------------------------------------------------

decode(90200, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Cx} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Cy} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, X} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, Y} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Move} = prot_util:unpack(RBin5, {8, unsigned}),
    {_RBin7, ResetIndex} = prot_util:unpack(RBin6, {16, unsigned}),

    UnpackRecordData = #role_walk_req{
        scene_id = SceneId,
        role_id = RoleId,
        cx = Cx,
        cy = Cy,
        x = X,
        y = Y,
        move = Move,
        reset_index = ResetIndex
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90201, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Cx} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Cy} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, X} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, Y} = prot_util:unpack(RBin4, {16, unsigned}),
    {_RBin6, Move} = prot_util:unpack(RBin5, {8, unsigned}),

    UnpackRecordData = #bcast_obj_walk{
        type = Type,
        id = Id,
        cx = Cx,
        cy = Cy,
        x = X,
        y = Y,
        move = Move
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90202, BinData) ->
    {RBin0, PetId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, SceneId} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Cx} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Cy} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, X} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, Y} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Move} = prot_util:unpack(RBin5, {8, unsigned}),
    {_RBin7, ResetIndex} = prot_util:unpack(RBin6, {16, unsigned}),

    UnpackRecordData = #pet_walk_req{
        pet_id = PetId,
        scene_id = SceneId,
        cx = Cx,
        cy = Cy,
        x = X,
        y = Y,
        move = Move,
        reset_index = ResetIndex
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90203, BinData) ->
    {RBin0, ObjType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, ObjId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, X} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Y} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, ResetType} = prot_util:unpack(RBin3, {8, unsigned}),
    {_RBin5, ResetIndex} = prot_util:unpack(RBin4, {32, unsigned}),

    UnpackRecordData = #reset_point{
        obj_type = ObjType,
        obj_id = ObjId,
        x = X,
        y = Y,
        reset_type = ResetType,
        reset_index = ResetIndex
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90204, BinData) ->
    {_RBin0, Mids} = prot_util:unpack(BinData, [{32, unsigned}]),

    UnpackRecordData = #get_mon_pos_req{
        mids = Mids
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90205, BinData) ->
    {_RBin0, PosList} = prot_util:unpack(BinData, [{{32, unsigned}, {16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #get_mon_pos_resp{
        pos_list = PosList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90207, _BinData) ->

    UnpackRecordData = #scene_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90208, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, LineId} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #change_scene_req{
        scene_id = SceneId,
        line_id = LineId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90209, BinData) ->
    {_RBin0, Door} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #scene_transfer_req{
        door = Door
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90210, _BinData) ->

    UnpackRecordData = #get_scene_line_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90211, BinData) ->
    {RBin0, SceneId} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, LineInfo} = prot_util:unpack(RBin0, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #get_scene_line_info_resp{
        scene_id = SceneId,
        line_info = LineInfo
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90230, BinData) ->
    {RBin0, CasterType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, CasterId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, ToType} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, ToId} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, BuffAid} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, BuffId} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, BuffLv} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, BuffExpire} = prot_util:unpack(RBin6, {64, unsigned}),
    {_RBin8, ChangeType} = prot_util:unpack(RBin7, {8, unsigned}),

    UnpackRecordData = #bcast_buff_change{
        caster_type = CasterType,
        caster_id = CasterId,
        to_type = ToType,
        to_id = ToId,
        buff_aid = BuffAid,
        buff_id = BuffId,
        buff_lv = BuffLv,
        buff_expire = BuffExpire,
        change_type = ChangeType
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90232, BinData) ->
    {_RBin0, RoleList} = prot_util:unpack(BinData, [{u,role_scene_info}]),

    UnpackRecordData = #bcast_add_role_scene_info{
        role_list = RoleList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90233, BinData) ->
    {_RBin0, RoleIds} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #bcast_del_role{
        role_ids = RoleIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90234, BinData) ->
    {_RBin0, MonList} = prot_util:unpack(BinData, [{u,mon_scene_info}]),

    UnpackRecordData = #bcast_add_mon_scene_info{
        mon_list = MonList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90235, BinData) ->
    {_RBin0, MonIds} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #bcast_del_mon{
        mon_ids = MonIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90236, BinData) ->
    {_RBin0, PetList} = prot_util:unpack(BinData, [{u,pet_scene_info}]),

    UnpackRecordData = #bcast_add_pet_scene_info{
        pet_list = PetList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90237, BinData) ->
    {_RBin0, PetIds} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #bcast_del_pet{
        pet_ids = PetIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90239, BinData) ->
    {_RBin0, CollList} = prot_util:unpack(BinData, [{u,coll_scene_info}]),

    UnpackRecordData = #bcast_add_coll_scene_info{
        coll_list = CollList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90240, BinData) ->
    {_RBin0, CollIds} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #bcast_del_coll{
        coll_ids = CollIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90241, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Mid} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, ResId} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #bcast_mon_change_modle{
        id = Id,
        mid = Mid,
        res_id = ResId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90243, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Hp} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, HpLim} = prot_util:unpack(RBin2, {32, unsigned}),

    UnpackRecordData = #bcast_obj_hp_change{
        type = Type,
        id = Id,
        hp = Hp,
        hp_lim = HpLim
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90244, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Mp} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, MpLim} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #bcast_mp_change{
        role_id = RoleId,
        mp = Mp,
        mp_lim = MpLim
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90245, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Nickname} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #bcast_role_change_name{
        role_id = RoleId,
        nickname = Nickname
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90246, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Icon} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #bcast_role_change_icon{
        role_id = RoleId,
        icon = Icon
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90247, BinData) ->
    {RBin0, DeadType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, DeadId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, DeadName} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #notify_kill_role{
        dead_type = DeadType,
        dead_id = DeadId,
        dead_name = DeadName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90248, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #bcast_obj_die{
        type = Type,
        id = Id
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90249, BinData) ->
    {RBin0, ObjType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, ObjId} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, MoveSpeed} = prot_util:unpack(RBin1, {16, unsigned}),

    UnpackRecordData = #bcast_move_speed_change{
        obj_type = ObjType,
        obj_id = ObjId,
        move_speed = MoveSpeed
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90250, BinData) ->
    {RBin0, CollId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Stat} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Realm} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #bcast_collect_st{
        coll_id = CollId,
        stat = Stat,
        realm = Realm
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90251, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Level} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, CombatPower} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Hp} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, HpLim} = prot_util:unpack(RBin3, {64, unsigned}),
    {_RBin5, MoveSpeed} = prot_util:unpack(RBin4, {16, unsigned}),

    UnpackRecordData = #bcast_role_info_change{
        role_id = RoleId,
        level = Level,
        combat_power = CombatPower,
        hp = Hp,
        hp_lim = HpLim,
        move_speed = MoveSpeed
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90252, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, State} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, StateParams} = prot_util:unpack(RBin2, [{u,state_param}]),

    UnpackRecordData = #bcast_obj_spec_state{
        type = Type,
        id = Id,
        state = State,
        state_params = StateParams
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90253, BinData) ->
    {_RBin0, CarryList} = prot_util:unpack(BinData, [{u,carry_scene_info}]),

    UnpackRecordData = #bcast_add_carry_scene_info{
        carry_list = CarryList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90254, BinData) ->
    {_RBin0, CarryIds} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #bcast_del_carry{
        carry_ids = CarryIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90255, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Id} = prot_util:unpack(RBin1, {8, unsigned}),
    {_RBin3, Stat} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #bcast_exterior_change{
        role_id = RoleId,
        type = Type,
        id = Id,
        stat = Stat
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90256, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Murderous} = prot_util:unpack(RBin0, {8, signed}),

    UnpackRecordData = #bcast_murderous_change{
        role_id = RoleId,
        murderous = Murderous
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90257, BinData) ->
    {_RBin0, FlyitemList} = prot_util:unpack(BinData, [{u,flyitem_scene_info}]),

    UnpackRecordData = #bcast_add_flyitem_scene_info{
        flyitem_list = FlyitemList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90258, BinData) ->
    {_RBin0, FlyitemIds} = prot_util:unpack(BinData, [{64, unsigned}]),

    UnpackRecordData = #bcast_del_flyitem{
        flyitem_ids = FlyitemIds
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90259, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Artifact} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #bcast_artifact_change_avatar{
        role_id = RoleId,
        artifact = Artifact
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90260, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Guild} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, GuildName} = prot_util:unpack(RBin1, string),

    UnpackRecordData = #bcast_guild_info_change{
        role_id = RoleId,
        guild = Guild,
        guild_name = GuildName
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90261, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, WarriorSoul} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #bcast_warrior_soul_change_avatar{
        role_id = RoleId,
        warrior_soul = WarriorSoul
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90262, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, TranStat} = prot_util:unpack(RBin0, {16, unsigned}),

    UnpackRecordData = #bcast_transform_stat{
        role_id = RoleId,
        tran_stat = TranStat
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90263, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Mid} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, FirstAtt} = prot_util:unpack(RBin1, {64, unsigned}),

    UnpackRecordData = #bcast_mon_first_att{
        id = Id,
        mid = Mid,
        first_att = FirstAtt
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(90200, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#role_walk_req.scene_id, {32, unsigned}),
    RoleId = prot_util:pack(PackRecordData#role_walk_req.role_id, {64, unsigned}),
    Cx = prot_util:pack(PackRecordData#role_walk_req.cx, {16, unsigned}),
    Cy = prot_util:pack(PackRecordData#role_walk_req.cy, {16, unsigned}),
    X = prot_util:pack(PackRecordData#role_walk_req.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#role_walk_req.y, {16, unsigned}),
    Move = prot_util:pack(PackRecordData#role_walk_req.move, {8, unsigned}),
    ResetIndex = prot_util:pack(PackRecordData#role_walk_req.reset_index, {16, unsigned}),

    BinData = <<
        SceneId/binary,
        RoleId/binary,
        Cx/binary,
        Cy/binary,
        X/binary,
        Y/binary,
        Move/binary,
        ResetIndex/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90201, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#bcast_obj_walk.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#bcast_obj_walk.id, {64, unsigned}),
    Cx = prot_util:pack(PackRecordData#bcast_obj_walk.cx, {16, unsigned}),
    Cy = prot_util:pack(PackRecordData#bcast_obj_walk.cy, {16, unsigned}),
    X = prot_util:pack(PackRecordData#bcast_obj_walk.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#bcast_obj_walk.y, {16, unsigned}),
    Move = prot_util:pack(PackRecordData#bcast_obj_walk.move, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary,
        Cx/binary,
        Cy/binary,
        X/binary,
        Y/binary,
        Move/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90202, PackRecordData) ->
    PetId = prot_util:pack(PackRecordData#pet_walk_req.pet_id, {64, unsigned}),
    SceneId = prot_util:pack(PackRecordData#pet_walk_req.scene_id, {32, unsigned}),
    Cx = prot_util:pack(PackRecordData#pet_walk_req.cx, {16, unsigned}),
    Cy = prot_util:pack(PackRecordData#pet_walk_req.cy, {16, unsigned}),
    X = prot_util:pack(PackRecordData#pet_walk_req.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#pet_walk_req.y, {16, unsigned}),
    Move = prot_util:pack(PackRecordData#pet_walk_req.move, {8, unsigned}),
    ResetIndex = prot_util:pack(PackRecordData#pet_walk_req.reset_index, {16, unsigned}),

    BinData = <<
        PetId/binary,
        SceneId/binary,
        Cx/binary,
        Cy/binary,
        X/binary,
        Y/binary,
        Move/binary,
        ResetIndex/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90203, PackRecordData) ->
    ObjType = prot_util:pack(PackRecordData#reset_point.obj_type, {8, unsigned}),
    ObjId = prot_util:pack(PackRecordData#reset_point.obj_id, {64, unsigned}),
    X = prot_util:pack(PackRecordData#reset_point.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#reset_point.y, {16, unsigned}),
    ResetType = prot_util:pack(PackRecordData#reset_point.reset_type, {8, unsigned}),
    ResetIndex = prot_util:pack(PackRecordData#reset_point.reset_index, {32, unsigned}),

    BinData = <<
        ObjType/binary,
        ObjId/binary,
        X/binary,
        Y/binary,
        ResetType/binary,
        ResetIndex/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90204, PackRecordData) ->
    Mids = prot_util:pack(PackRecordData#get_mon_pos_req.mids, [{32, unsigned}]),

    BinData = <<
        Mids/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90205, PackRecordData) ->
    PosList = prot_util:pack(PackRecordData#get_mon_pos_resp.pos_list, [{{32, unsigned}, {16, unsigned}, {16, unsigned}}]),

    BinData = <<
        PosList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90207, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90208, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#change_scene_req.scene_id, {32, unsigned}),
    LineId = prot_util:pack(PackRecordData#change_scene_req.line_id, {64, unsigned}),

    BinData = <<
        SceneId/binary,
        LineId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90209, PackRecordData) ->
    Door = prot_util:pack(PackRecordData#scene_transfer_req.door, {8, unsigned}),

    BinData = <<
        Door/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90210, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90211, PackRecordData) ->
    SceneId = prot_util:pack(PackRecordData#get_scene_line_info_resp.scene_id, {32, unsigned}),
    LineInfo = prot_util:pack(PackRecordData#get_scene_line_info_resp.line_info, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        SceneId/binary,
        LineInfo/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90230, PackRecordData) ->
    CasterType = prot_util:pack(PackRecordData#bcast_buff_change.caster_type, {8, unsigned}),
    CasterId = prot_util:pack(PackRecordData#bcast_buff_change.caster_id, {64, unsigned}),
    ToType = prot_util:pack(PackRecordData#bcast_buff_change.to_type, {8, unsigned}),
    ToId = prot_util:pack(PackRecordData#bcast_buff_change.to_id, {64, unsigned}),
    BuffAid = prot_util:pack(PackRecordData#bcast_buff_change.buff_aid, {32, unsigned}),
    BuffId = prot_util:pack(PackRecordData#bcast_buff_change.buff_id, {32, unsigned}),
    BuffLv = prot_util:pack(PackRecordData#bcast_buff_change.buff_lv, {8, unsigned}),
    BuffExpire = prot_util:pack(PackRecordData#bcast_buff_change.buff_expire, {64, unsigned}),
    ChangeType = prot_util:pack(PackRecordData#bcast_buff_change.change_type, {8, unsigned}),

    BinData = <<
        CasterType/binary,
        CasterId/binary,
        ToType/binary,
        ToId/binary,
        BuffAid/binary,
        BuffId/binary,
        BuffLv/binary,
        BuffExpire/binary,
        ChangeType/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90232, PackRecordData) ->
    RoleList = prot_util:pack(PackRecordData#bcast_add_role_scene_info.role_list, [{u,role_scene_info}]),

    BinData = <<
        RoleList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90233, PackRecordData) ->
    RoleIds = prot_util:pack(PackRecordData#bcast_del_role.role_ids, [{64, unsigned}]),

    BinData = <<
        RoleIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90234, PackRecordData) ->
    MonList = prot_util:pack(PackRecordData#bcast_add_mon_scene_info.mon_list, [{u,mon_scene_info}]),

    BinData = <<
        MonList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90235, PackRecordData) ->
    MonIds = prot_util:pack(PackRecordData#bcast_del_mon.mon_ids, [{64, unsigned}]),

    BinData = <<
        MonIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90236, PackRecordData) ->
    PetList = prot_util:pack(PackRecordData#bcast_add_pet_scene_info.pet_list, [{u,pet_scene_info}]),

    BinData = <<
        PetList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90237, PackRecordData) ->
    PetIds = prot_util:pack(PackRecordData#bcast_del_pet.pet_ids, [{64, unsigned}]),

    BinData = <<
        PetIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90239, PackRecordData) ->
    CollList = prot_util:pack(PackRecordData#bcast_add_coll_scene_info.coll_list, [{u,coll_scene_info}]),

    BinData = <<
        CollList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90240, PackRecordData) ->
    CollIds = prot_util:pack(PackRecordData#bcast_del_coll.coll_ids, [{64, unsigned}]),

    BinData = <<
        CollIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90241, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#bcast_mon_change_modle.id, {64, unsigned}),
    Mid = prot_util:pack(PackRecordData#bcast_mon_change_modle.mid, {32, unsigned}),
    ResId = prot_util:pack(PackRecordData#bcast_mon_change_modle.res_id, {32, unsigned}),

    BinData = <<
        Id/binary,
        Mid/binary,
        ResId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90243, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#bcast_obj_hp_change.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#bcast_obj_hp_change.id, {64, unsigned}),
    Hp = prot_util:pack(PackRecordData#bcast_obj_hp_change.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#bcast_obj_hp_change.hp_lim, {32, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary,
        Hp/binary,
        HpLim/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90244, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_mp_change.role_id, {64, unsigned}),
    Mp = prot_util:pack(PackRecordData#bcast_mp_change.mp, {32, unsigned}),
    MpLim = prot_util:pack(PackRecordData#bcast_mp_change.mp_lim, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Mp/binary,
        MpLim/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90245, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_role_change_name.role_id, {64, unsigned}),
    Nickname = prot_util:pack(PackRecordData#bcast_role_change_name.nickname, string),

    BinData = <<
        RoleId/binary,
        Nickname/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90246, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_role_change_icon.role_id, {64, unsigned}),
    Icon = prot_util:pack(PackRecordData#bcast_role_change_icon.icon, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        Icon/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90247, PackRecordData) ->
    DeadType = prot_util:pack(PackRecordData#notify_kill_role.dead_type, {8, unsigned}),
    DeadId = prot_util:pack(PackRecordData#notify_kill_role.dead_id, {64, unsigned}),
    DeadName = prot_util:pack(PackRecordData#notify_kill_role.dead_name, string),

    BinData = <<
        DeadType/binary,
        DeadId/binary,
        DeadName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90248, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#bcast_obj_die.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#bcast_obj_die.id, {64, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90249, PackRecordData) ->
    ObjType = prot_util:pack(PackRecordData#bcast_move_speed_change.obj_type, {8, unsigned}),
    ObjId = prot_util:pack(PackRecordData#bcast_move_speed_change.obj_id, {64, unsigned}),
    MoveSpeed = prot_util:pack(PackRecordData#bcast_move_speed_change.move_speed, {16, unsigned}),

    BinData = <<
        ObjType/binary,
        ObjId/binary,
        MoveSpeed/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90250, PackRecordData) ->
    CollId = prot_util:pack(PackRecordData#bcast_collect_st.coll_id, {64, unsigned}),
    Stat = prot_util:pack(PackRecordData#bcast_collect_st.stat, {8, unsigned}),
    Realm = prot_util:pack(PackRecordData#bcast_collect_st.realm, {8, unsigned}),

    BinData = <<
        CollId/binary,
        Stat/binary,
        Realm/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90251, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_role_info_change.role_id, {64, unsigned}),
    Level = prot_util:pack(PackRecordData#bcast_role_info_change.level, {16, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#bcast_role_info_change.combat_power, {32, unsigned}),
    Hp = prot_util:pack(PackRecordData#bcast_role_info_change.hp, {64, unsigned}),
    HpLim = prot_util:pack(PackRecordData#bcast_role_info_change.hp_lim, {64, unsigned}),
    MoveSpeed = prot_util:pack(PackRecordData#bcast_role_info_change.move_speed, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        Level/binary,
        CombatPower/binary,
        Hp/binary,
        HpLim/binary,
        MoveSpeed/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90252, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#bcast_obj_spec_state.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#bcast_obj_spec_state.id, {64, unsigned}),
    State = prot_util:pack(PackRecordData#bcast_obj_spec_state.state, {8, unsigned}),
    StateParams = prot_util:pack(PackRecordData#bcast_obj_spec_state.state_params, [{u,state_param}]),

    BinData = <<
        Type/binary,
        Id/binary,
        State/binary,
        StateParams/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90253, PackRecordData) ->
    CarryList = prot_util:pack(PackRecordData#bcast_add_carry_scene_info.carry_list, [{u,carry_scene_info}]),

    BinData = <<
        CarryList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90254, PackRecordData) ->
    CarryIds = prot_util:pack(PackRecordData#bcast_del_carry.carry_ids, [{64, unsigned}]),

    BinData = <<
        CarryIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90255, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_exterior_change.role_id, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#bcast_exterior_change.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#bcast_exterior_change.id, {8, unsigned}),
    Stat = prot_util:pack(PackRecordData#bcast_exterior_change.stat, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Type/binary,
        Id/binary,
        Stat/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90256, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_murderous_change.role_id, {64, unsigned}),
    Murderous = prot_util:pack(PackRecordData#bcast_murderous_change.murderous, {8, signed}),

    BinData = <<
        RoleId/binary,
        Murderous/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90257, PackRecordData) ->
    FlyitemList = prot_util:pack(PackRecordData#bcast_add_flyitem_scene_info.flyitem_list, [{u,flyitem_scene_info}]),

    BinData = <<
        FlyitemList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90258, PackRecordData) ->
    FlyitemIds = prot_util:pack(PackRecordData#bcast_del_flyitem.flyitem_ids, [{64, unsigned}]),

    BinData = <<
        FlyitemIds/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90259, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_artifact_change_avatar.role_id, {64, unsigned}),
    Artifact = prot_util:pack(PackRecordData#bcast_artifact_change_avatar.artifact, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Artifact/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90260, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_guild_info_change.role_id, {64, unsigned}),
    Guild = prot_util:pack(PackRecordData#bcast_guild_info_change.guild, {64, unsigned}),
    GuildName = prot_util:pack(PackRecordData#bcast_guild_info_change.guild_name, string),

    BinData = <<
        RoleId/binary,
        Guild/binary,
        GuildName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90261, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_warrior_soul_change_avatar.role_id, {64, unsigned}),
    WarriorSoul = prot_util:pack(PackRecordData#bcast_warrior_soul_change_avatar.warrior_soul, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        WarriorSoul/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90262, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#bcast_transform_stat.role_id, {64, unsigned}),
    TranStat = prot_util:pack(PackRecordData#bcast_transform_stat.tran_stat, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        TranStat/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90263, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#bcast_mon_first_att.id, {64, unsigned}),
    Mid = prot_util:pack(PackRecordData#bcast_mon_first_att.mid, {32, unsigned}),
    FirstAtt = prot_util:pack(PackRecordData#bcast_mon_first_att.first_att, {64, unsigned}),

    BinData = <<
        Id/binary,
        Mid/binary,
        FirstAtt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

