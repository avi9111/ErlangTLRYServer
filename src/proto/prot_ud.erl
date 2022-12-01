-module(prot_ud).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_ud.hrl").


%% ---------------------------------------------------------------------------------------

decode(goods_info, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Pos} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Num} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Bind} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Expire} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Paris} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Attr} = prot_util:unpack(RBin5, [{{16, unsigned}, {16, unsigned}}]),
    {RBin7, SellTime} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, SellTimes} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, Effect} = prot_util:unpack(RBin8, {32, unsigned}),
    {RBin10, Level} = prot_util:unpack(RBin9, {8, unsigned}),
    {RBin11, Exp} = prot_util:unpack(RBin10, {16, unsigned}),
    {RBin12, Extra} = prot_util:unpack(RBin11, [string]),

    UnpackRecordData = #goods_info{
        id = Id,
        pos = Pos,
        num = Num,
        bind = Bind,
        expire = Expire,
        paris = Paris,
        attr = Attr,
        sell_time = SellTime,
        sell_times = SellTimes,
        effect = Effect,
        level = Level,
        exp = Exp,
        extra = Extra
    },

    {RBin12, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(bag_info, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, CellNum} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Goods} = prot_util:unpack(RBin2, [{u,goods_info}]),

    UnpackRecordData = #bag_info{
        bag_id = BagId,
        name = Name,
        cell_num = CellNum,
        goods = Goods
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(bag_change, BinData) ->
    {RBin0, BagId} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Change} = prot_util:unpack(RBin0, [{u,goods_info}]),
    {RBin2, Delete} = prot_util:unpack(RBin1, [{16, unsigned}]),

    UnpackRecordData = #bag_change{
        bag_id = BagId,
        change = Change,
        delete = Delete
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(item, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Num} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Bind} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #item{
        type = Type,
        id = Id,
        num = Num,
        bind = Bind
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(equip_info, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Stren} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Stones} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),
    {RBin4, Paris} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Attr} = prot_util:unpack(RBin4, [{{16, unsigned}, {16, unsigned}}]),
    {RBin6, Extra} = prot_util:unpack(RBin5, [string]),

    UnpackRecordData = #equip_info{
        pos = Pos,
        id = Id,
        stren = Stren,
        stones = Stones,
        paris = Paris,
        attr = Attr,
        extra = Extra
    },

    {RBin6, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(dragon, BinData) ->
    {RBin0, Pos} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Level} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Exp} = prot_util:unpack(RBin2, {16, unsigned}),

    UnpackRecordData = #dragon{
        pos = Pos,
        id = Id,
        level = Level,
        exp = Exp
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(dragon_view, BinData) ->
    {RBin0, Items} = prot_util:unpack(BinData, [{u,dragon}]),
    {RBin1, GrowthLv} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, GrowthHole} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, RefineLv} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, RefineStar} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, RefineExp} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, RefineQuality} = prot_util:unpack(RBin5, [{{8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #dragon_view{
        items = Items,
        growth_lv = GrowthLv,
        growth_hole = GrowthHole,
        refine_lv = RefineLv,
        refine_star = RefineStar,
        refine_exp = RefineExp,
        refine_quality = RefineQuality
    },

    {RBin6, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_chat_role, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, SvrNum} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Career} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Gender} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Level} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Icon} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, Frame} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, Bubble} = prot_util:unpack(RBin7, {16, unsigned}),

    UnpackRecordData = #clt_chat_role{
        id = Id,
        name = Name,
        svr_num = SvrNum,
        career = Career,
        gender = Gender,
        level = Level,
        icon = Icon,
        frame = Frame,
        bubble = Bubble
    },

    {RBin8, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_chat_his_item, BinData) ->
    {RBin0, Role} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Content} = prot_util:unpack(RBin0, string),
    {RBin2, Voice} = prot_util:unpack(RBin1, string),
    {RBin3, VoiceTime} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Extra} = prot_util:unpack(RBin3, string),
    {RBin5, Time} = prot_util:unpack(RBin4, {32, unsigned}),

    UnpackRecordData = #clt_chat_his_item{
        role = Role,
        content = Content,
        voice = Voice,
        voice_time = VoiceTime,
        extra = Extra,
        time = Time
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_chat_public_cache, BinData) ->
    {RBin0, Channel} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Target} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, History} = prot_util:unpack(RBin1, [{u,clt_chat_public_item}]),

    UnpackRecordData = #clt_chat_public_cache{
        channel = Channel,
        target = Target,
        history = History
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_chat_public_item, BinData) ->
    {RBin0, Sender} = prot_util:unpack(BinData, {u,clt_chat_role}),
    {RBin1, Item} = prot_util:unpack(RBin0, {u,clt_chat_his_item}),

    UnpackRecordData = #clt_chat_public_item{
        sender = Sender,
        item = Item
    },

    {RBin1, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_chat_private_cache, BinData) ->
    {RBin0, Sender} = prot_util:unpack(BinData, {u,clt_chat_role}),
    {RBin1, History} = prot_util:unpack(RBin0, [{u,clt_chat_his_item}]),

    UnpackRecordData = #clt_chat_private_cache{
        sender = Sender,
        history = History
    },

    {RBin1, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(marry_view, BinData) ->
    {RBin0, MateId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, MateName} = prot_util:unpack(RBin0, string),
    {RBin2, Bless} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #marry_view{
        mate_id = MateId,
        mate_name = MateName,
        bless = Bless
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(state_param, BinData) ->
    {RBin0, CenterX} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, CenterY} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, EndTime} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #state_param{
        center_x = CenterX,
        center_y = CenterY,
        end_time = EndTime
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(role_login_info, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Career} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Gender} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Level} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, Fashion} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Artifact} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, Icon} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, Hair} = prot_util:unpack(RBin7, {32, unsigned}),
    {RBin9, State} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, RegTime} = prot_util:unpack(RBin9, {32, unsigned}),
    {RBin11, LastLoginTime} = prot_util:unpack(RBin10, {32, unsigned}),

    UnpackRecordData = #role_login_info{
        role_id = RoleId,
        name = Name,
        career = Career,
        gender = Gender,
        level = Level,
        fashion = Fashion,
        artifact = Artifact,
        icon = Icon,
        hair = Hair,
        state = State,
        reg_time = RegTime,
        last_login_time = LastLoginTime
    },

    {RBin11, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(role_scene_info, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, OwnerId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, ServerNum} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Name} = prot_util:unpack(RBin2, string),
    {RBin4, Career} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Gender} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Level} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, Guild} = prot_util:unpack(RBin6, {64, unsigned}),
    {RBin8, GuildName} = prot_util:unpack(RBin7, string),
    {RBin9, Team} = prot_util:unpack(RBin8, {64, unsigned}),
    {RBin10, Realm} = prot_util:unpack(RBin9, {8, unsigned}),
    {RBin11, MateId} = prot_util:unpack(RBin10, {64, unsigned}),
    {RBin12, MateName} = prot_util:unpack(RBin11, string),
    {RBin13, CurPet} = prot_util:unpack(RBin12, {64, unsigned}),
    {RBin14, X} = prot_util:unpack(RBin13, {16, unsigned}),
    {RBin15, Y} = prot_util:unpack(RBin14, {16, unsigned}),
    {RBin16, ToX} = prot_util:unpack(RBin15, {16, unsigned}),
    {RBin17, ToY} = prot_util:unpack(RBin16, {16, unsigned}),
    {RBin18, Hp} = prot_util:unpack(RBin17, {32, unsigned}),
    {RBin19, HpLim} = prot_util:unpack(RBin18, {32, unsigned}),
    {RBin20, Mp} = prot_util:unpack(RBin19, {32, unsigned}),
    {RBin21, MpLim} = prot_util:unpack(RBin20, {32, unsigned}),
    {RBin22, MoveSpeed} = prot_util:unpack(RBin21, {16, unsigned}),
    {RBin23, CombatPower} = prot_util:unpack(RBin22, {32, unsigned}),
    {RBin24, Icon} = prot_util:unpack(RBin23, {16, unsigned}),
    {RBin25, Hair} = prot_util:unpack(RBin24, {32, unsigned}),
    {RBin26, Fashion} = prot_util:unpack(RBin25, {32, unsigned}),
    {RBin27, Title} = prot_util:unpack(RBin26, {16, unsigned}),
    {RBin28, TitleExtra} = prot_util:unpack(RBin27, string),
    {RBin29, TitleQuality} = prot_util:unpack(RBin28, {8, unsigned}),
    {RBin30, Header} = prot_util:unpack(RBin29, {64, unsigned}),
    {RBin31, TitleHonor} = prot_util:unpack(RBin30, {32, unsigned}),
    {RBin32, Buffs} = prot_util:unpack(RBin31, [{{32, unsigned}, {32, unsigned}, {8, unsigned}, {64, unsigned}}]),
    {RBin33, State} = prot_util:unpack(RBin32, {8, unsigned}),
    {RBin34, StateParams} = prot_util:unpack(RBin33, [{u,state_param}]),
    {RBin35, Exteriors} = prot_util:unpack(RBin34, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    {RBin36, Murderous} = prot_util:unpack(RBin35, {8, signed}),
    {RBin37, Artifact} = prot_util:unpack(RBin36, {32, unsigned}),
    {RBin38, WarriorSoul} = prot_util:unpack(RBin37, {32, unsigned}),
    {RBin39, TranStat} = prot_util:unpack(RBin38, {8, unsigned}),
    {RBin40, FightTeamId} = prot_util:unpack(RBin39, {64, unsigned}),
    {RBin41, Prestige} = prot_util:unpack(RBin40, {16, unsigned}),

    UnpackRecordData = #role_scene_info{
        role_id = RoleId,
        owner_id = OwnerId,
        server_num = ServerNum,
        name = Name,
        career = Career,
        gender = Gender,
        level = Level,
        guild = Guild,
        guild_name = GuildName,
        team = Team,
        realm = Realm,
        mate_id = MateId,
        mate_name = MateName,
        cur_pet = CurPet,
        x = X,
        y = Y,
        to_x = ToX,
        to_y = ToY,
        hp = Hp,
        hp_lim = HpLim,
        mp = Mp,
        mp_lim = MpLim,
        move_speed = MoveSpeed,
        combat_power = CombatPower,
        icon = Icon,
        hair = Hair,
        fashion = Fashion,
        title = Title,
        title_extra = TitleExtra,
        title_quality = TitleQuality,
        header = Header,
        title_honor = TitleHonor,
        buffs = Buffs,
        state = State,
        state_params = StateParams,
        exteriors = Exteriors,
        murderous = Murderous,
        artifact = Artifact,
        warrior_soul = WarriorSoul,
        tran_stat = TranStat,
        fight_team_id = FightTeamId,
        prestige = Prestige
    },

    {RBin41, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(mon_scene_info, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Mid} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Name} = prot_util:unpack(RBin1, string),
    {RBin3, Level} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, OwnerId} = prot_util:unpack(RBin3, {64, unsigned}),
    {RBin5, OwnerName} = prot_util:unpack(RBin4, string),
    {RBin6, OwnerTeam} = prot_util:unpack(RBin5, {64, unsigned}),
    {RBin7, MoveSpeed} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, X} = prot_util:unpack(RBin7, {16, unsigned}),
    {RBin9, Y} = prot_util:unpack(RBin8, {16, unsigned}),
    {RBin10, ToX} = prot_util:unpack(RBin9, {16, unsigned}),
    {RBin11, ToY} = prot_util:unpack(RBin10, {16, unsigned}),
    {RBin12, Hp} = prot_util:unpack(RBin11, {32, unsigned}),
    {RBin13, HpLim} = prot_util:unpack(RBin12, {32, unsigned}),
    {RBin14, Buffs} = prot_util:unpack(RBin13, [{{32, unsigned}, {32, unsigned}, {8, unsigned}, {64, unsigned}}]),
    {RBin15, Realm} = prot_util:unpack(RBin14, {16, unsigned}),
    {RBin16, Attackable} = prot_util:unpack(RBin15, {8, unsigned}),
    {RBin17, FirstAtt} = prot_util:unpack(RBin16, {64, unsigned}),

    UnpackRecordData = #mon_scene_info{
        id = Id,
        mid = Mid,
        name = Name,
        level = Level,
        owner_id = OwnerId,
        owner_name = OwnerName,
        owner_team = OwnerTeam,
        move_speed = MoveSpeed,
        x = X,
        y = Y,
        to_x = ToX,
        to_y = ToY,
        hp = Hp,
        hp_lim = HpLim,
        buffs = Buffs,
        realm = Realm,
        attackable = Attackable,
        first_att = FirstAtt
    },

    {RBin17, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(pet_scene_info, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, PetCid} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, TitleC} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, TitleS} = prot_util:unpack(RBin2, string),
    {RBin4, Name} = prot_util:unpack(RBin3, string),
    {RBin5, Level} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Star} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Awaken} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, OwnerId} = prot_util:unpack(RBin7, {64, unsigned}),
    {RBin9, OwnerName} = prot_util:unpack(RBin8, string),
    {RBin10, Guild} = prot_util:unpack(RBin9, {64, unsigned}),
    {RBin11, Team} = prot_util:unpack(RBin10, {64, unsigned}),
    {RBin12, Realm} = prot_util:unpack(RBin11, {8, unsigned}),
    {RBin13, MoveSpeed} = prot_util:unpack(RBin12, {16, unsigned}),
    {RBin14, X} = prot_util:unpack(RBin13, {16, unsigned}),
    {RBin15, Y} = prot_util:unpack(RBin14, {16, unsigned}),
    {RBin16, ToX} = prot_util:unpack(RBin15, {16, unsigned}),
    {RBin17, ToY} = prot_util:unpack(RBin16, {16, unsigned}),
    {RBin18, Hp} = prot_util:unpack(RBin17, {32, unsigned}),
    {RBin19, HpLim} = prot_util:unpack(RBin18, {32, unsigned}),
    {RBin20, Buffs} = prot_util:unpack(RBin19, [{{32, unsigned}, {32, unsigned}, {8, unsigned}, {64, unsigned}}]),

    UnpackRecordData = #pet_scene_info{
        id = Id,
        pet_cid = PetCid,
        title_c = TitleC,
        title_s = TitleS,
        name = Name,
        level = Level,
        star = Star,
        awaken = Awaken,
        owner_id = OwnerId,
        owner_name = OwnerName,
        guild = Guild,
        team = Team,
        realm = Realm,
        move_speed = MoveSpeed,
        x = X,
        y = Y,
        to_x = ToX,
        to_y = ToY,
        hp = Hp,
        hp_lim = HpLim,
        buffs = Buffs
    },

    {RBin20, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(coll_scene_info, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, CollCid} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, OwnerId} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, BelongerId} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, BelongerName} = prot_util:unpack(RBin3, string),
    {RBin5, Stat} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, X} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, Y} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, Realm} = prot_util:unpack(RBin7, {8, unsigned}),

    UnpackRecordData = #coll_scene_info{
        id = Id,
        coll_cid = CollCid,
        owner_id = OwnerId,
        belonger_id = BelongerId,
        belonger_name = BelongerName,
        stat = Stat,
        x = X,
        y = Y,
        realm = Realm
    },

    {RBin8, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(carry_scene_info, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Cid} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, OwnerId} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, OwnerName} = prot_util:unpack(RBin2, string),
    {RBin4, GuildName} = prot_util:unpack(RBin3, string),
    {RBin5, X} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Y} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, ToX} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, ToY} = prot_util:unpack(RBin7, {16, unsigned}),
    {RBin9, Type} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, Couples} = prot_util:unpack(RBin9, [{64, unsigned}]),

    UnpackRecordData = #carry_scene_info{
        id = Id,
        cid = Cid,
        owner_id = OwnerId,
        owner_name = OwnerName,
        guild_name = GuildName,
        x = X,
        y = Y,
        to_x = ToX,
        to_y = ToY,
        type = Type,
        couples = Couples
    },

    {RBin10, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(flyitem_scene_info, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Cid} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, X} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Y} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, ToX} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, ToY} = prot_util:unpack(RBin4, {16, unsigned}),

    UnpackRecordData = #flyitem_scene_info{
        id = Id,
        cid = Cid,
        x = X,
        y = Y,
        to_x = ToX,
        to_y = ToY
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(obj_skill, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, SkillCd} = prot_util:unpack(RBin1, [{{32, unsigned}, {64, unsigned}}]),
    {RBin3, SkillList} = prot_util:unpack(RBin2, [{{32, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #obj_skill{
        type = Type,
        id = Id,
        skill_cd = SkillCd,
        skill_list = SkillList
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(base_attr, BinData) ->
    {RBin0, Power} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Anima} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Energy} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Concent} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Method} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Basic} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Adef} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, AdefRed} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, Aatt} = prot_util:unpack(RBin7, {32, unsigned}),
    {RBin9, AdefMin} = prot_util:unpack(RBin8, {16, unsigned}),

    UnpackRecordData = #base_attr{
        power = Power,
        anima = Anima,
        energy = Energy,
        concent = Concent,
        method = Method,
        basic = Basic,
        adef = Adef,
        adef_red = AdefRed,
        aatt = Aatt,
        adef_min = AdefMin
    },

    {RBin9, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(bt_attr, BinData) ->
    {RBin0, HpLim} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, HpRec} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, MpLim} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, MpRec} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, OuterAtt} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, InnerAtt} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, OuterDef} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, InnerDef} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, Hit} = prot_util:unpack(RBin7, {32, unsigned}),
    {RBin9, Dodge} = prot_util:unpack(RBin8, {32, unsigned}),
    {RBin10, CritHurt} = prot_util:unpack(RBin9, {32, unsigned}),
    {RBin11, CritDef} = prot_util:unpack(RBin10, {32, unsigned}),
    {RBin12, AttSpeed} = prot_util:unpack(RBin11, {16, unsigned}),
    {RBin13, MoveSpeed} = prot_util:unpack(RBin12, {16, unsigned}),
    {RBin14, IgndefHurt} = prot_util:unpack(RBin13, {32, unsigned}),
    {RBin15, IgndefDef} = prot_util:unpack(RBin14, {32, unsigned}),
    {RBin16, HurtAdd} = prot_util:unpack(RBin15, {16, unsigned}),
    {RBin17, HurtRed} = prot_util:unpack(RBin16, {16, unsigned}),
    {RBin18, CritAdd} = prot_util:unpack(RBin17, {16, unsigned}),
    {RBin19, CritRed} = prot_util:unpack(RBin18, {16, unsigned}),
    {RBin20, AattIce} = prot_util:unpack(RBin19, {32, unsigned}),
    {RBin21, AattFire} = prot_util:unpack(RBin20, {32, unsigned}),
    {RBin22, AattDark} = prot_util:unpack(RBin21, {32, unsigned}),
    {RBin23, AattPoison} = prot_util:unpack(RBin22, {32, unsigned}),
    {RBin24, AdefIce} = prot_util:unpack(RBin23, {16, unsigned}),
    {RBin25, AdefFire} = prot_util:unpack(RBin24, {16, unsigned}),
    {RBin26, AdefDark} = prot_util:unpack(RBin25, {16, unsigned}),
    {RBin27, AdefPoison} = prot_util:unpack(RBin26, {16, unsigned}),
    {RBin28, AdefRedIce} = prot_util:unpack(RBin27, {16, unsigned}),
    {RBin29, AdefRedFire} = prot_util:unpack(RBin28, {16, unsigned}),
    {RBin30, AdefRedDark} = prot_util:unpack(RBin29, {16, unsigned}),
    {RBin31, AdefRedPoison} = prot_util:unpack(RBin30, {16, unsigned}),
    {RBin32, AdefMinIce} = prot_util:unpack(RBin31, {16, unsigned}),
    {RBin33, AdefMinFire} = prot_util:unpack(RBin32, {16, unsigned}),
    {RBin34, AdefMinDark} = prot_util:unpack(RBin33, {16, unsigned}),
    {RBin35, AdefMinPoison} = prot_util:unpack(RBin34, {16, unsigned}),
    {RBin36, AhurtAddIce} = prot_util:unpack(RBin35, {16, unsigned}),
    {RBin37, AhurtAddFire} = prot_util:unpack(RBin36, {16, unsigned}),
    {RBin38, AhurtAddDark} = prot_util:unpack(RBin37, {16, unsigned}),
    {RBin39, AhurtAddPoison} = prot_util:unpack(RBin38, {16, unsigned}),
    {RBin40, AhurtAdd} = prot_util:unpack(RBin39, {16, unsigned}),
    {RBin41, AhurtRed} = prot_util:unpack(RBin40, {16, unsigned}),
    {RBin42, PenetrateAtt} = prot_util:unpack(RBin41, {32, unsigned}),
    {RBin43, PenetrateDef} = prot_util:unpack(RBin42, {32, unsigned}),
    {RBin44, PenetrateCrit} = prot_util:unpack(RBin43, {32, unsigned}),
    {RBin45, PenetrateCritDef} = prot_util:unpack(RBin44, {32, unsigned}),
    {RBin46, PenetrateSpeed} = prot_util:unpack(RBin45, {16, unsigned}),
    {RBin47, PenetrateHurtAdd} = prot_util:unpack(RBin46, {16, unsigned}),
    {RBin48, PenetrateHurtRed} = prot_util:unpack(RBin47, {16, unsigned}),
    {RBin49, AhurtRedIce} = prot_util:unpack(RBin48, {16, unsigned}),
    {RBin50, AhurtRedFire} = prot_util:unpack(RBin49, {16, unsigned}),
    {RBin51, AhurtRedDark} = prot_util:unpack(RBin50, {16, unsigned}),
    {RBin52, AhurtRedPoison} = prot_util:unpack(RBin51, {16, unsigned}),
    {RBin53, AhurtPercIce} = prot_util:unpack(RBin52, {32, unsigned}),
    {RBin54, AhurtPercFire} = prot_util:unpack(RBin53, {32, unsigned}),
    {RBin55, AhurtPercDark} = prot_util:unpack(RBin54, {32, unsigned}),
    {RBin56, AhurtPercPoison} = prot_util:unpack(RBin55, {32, unsigned}),
    {RBin57, AaffectPercIce} = prot_util:unpack(RBin56, {32, unsigned}),
    {RBin58, AaffectPercFire} = prot_util:unpack(RBin57, {32, unsigned}),
    {RBin59, AaffectPercDark} = prot_util:unpack(RBin58, {32, unsigned}),
    {RBin60, AaffectPercPoison} = prot_util:unpack(RBin59, {32, unsigned}),

    UnpackRecordData = #bt_attr{
        hp_lim = HpLim,
        hp_rec = HpRec,
        mp_lim = MpLim,
        mp_rec = MpRec,
        outer_att = OuterAtt,
        inner_att = InnerAtt,
        outer_def = OuterDef,
        inner_def = InnerDef,
        hit = Hit,
        dodge = Dodge,
        crit_hurt = CritHurt,
        crit_def = CritDef,
        att_speed = AttSpeed,
        move_speed = MoveSpeed,
        igndef_hurt = IgndefHurt,
        igndef_def = IgndefDef,
        hurt_add = HurtAdd,
        hurt_red = HurtRed,
        crit_add = CritAdd,
        crit_red = CritRed,
        aatt_ice = AattIce,
        aatt_fire = AattFire,
        aatt_dark = AattDark,
        aatt_poison = AattPoison,
        adef_ice = AdefIce,
        adef_fire = AdefFire,
        adef_dark = AdefDark,
        adef_poison = AdefPoison,
        adef_red_ice = AdefRedIce,
        adef_red_fire = AdefRedFire,
        adef_red_dark = AdefRedDark,
        adef_red_poison = AdefRedPoison,
        adef_min_ice = AdefMinIce,
        adef_min_fire = AdefMinFire,
        adef_min_dark = AdefMinDark,
        adef_min_poison = AdefMinPoison,
        ahurt_add_ice = AhurtAddIce,
        ahurt_add_fire = AhurtAddFire,
        ahurt_add_dark = AhurtAddDark,
        ahurt_add_poison = AhurtAddPoison,
        ahurt_add = AhurtAdd,
        ahurt_red = AhurtRed,
        penetrate_att = PenetrateAtt,
        penetrate_def = PenetrateDef,
        penetrate_crit = PenetrateCrit,
        penetrate_crit_def = PenetrateCritDef,
        penetrate_speed = PenetrateSpeed,
        penetrate_hurt_add = PenetrateHurtAdd,
        penetrate_hurt_red = PenetrateHurtRed,
        ahurt_red_ice = AhurtRedIce,
        ahurt_red_fire = AhurtRedFire,
        ahurt_red_dark = AhurtRedDark,
        ahurt_red_poison = AhurtRedPoison,
        ahurt_perc_ice = AhurtPercIce,
        ahurt_perc_fire = AhurtPercFire,
        ahurt_perc_dark = AhurtPercDark,
        ahurt_perc_poison = AhurtPercPoison,
        aaffect_perc_ice = AaffectPercIce,
        aaffect_perc_fire = AaffectPercFire,
        aaffect_perc_dark = AaffectPercDark,
        aaffect_perc_poison = AaffectPercPoison
    },

    {RBin60, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(ud_defer, BinData) ->
    {RBin0, DeferType} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, DeferId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, DeferX} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, DeferY} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, DeferHp} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, HurtSeq} = prot_util:unpack(RBin4, [{{8, unsigned}, {32, signed}}]),

    UnpackRecordData = #ud_defer{
        defer_type = DeferType,
        defer_id = DeferId,
        defer_x = DeferX,
        defer_y = DeferY,
        defer_hp = DeferHp,
        hurt_seq = HurtSeq
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_mail_goods, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Num} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Bind} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #clt_mail_goods{
        type = Type,
        id = Id,
        num = Num,
        bind = Bind
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_mail_goods_list, BinData) ->
    {RBin0, List} = prot_util:unpack(BinData, [{u,clt_mail_goods}]),

    UnpackRecordData = #clt_mail_goods_list{
        list = List
    },

    {RBin0, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_artifact, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, CurAvatar} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Avatars} = prot_util:unpack(RBin1, [{32, unsigned}]),
    {RBin3, CombatPower} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Stren} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Stones} = prot_util:unpack(RBin4, [{{8, unsigned}, {32, unsigned}}]),
    {RBin6, ExtraAttr} = prot_util:unpack(RBin5, [{{16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #clt_artifact{
        id = Id,
        cur_avatar = CurAvatar,
        avatars = Avatars,
        combat_power = CombatPower,
        stren = Stren,
        stones = Stones,
        extra_attr = ExtraAttr
    },

    {RBin6, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_anqi, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, QLevel} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, CombatPower} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Stren} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Stones} = prot_util:unpack(RBin3, [{{8, unsigned}, {32, unsigned}}]),
    {RBin5, PracticeLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, OriginAttr} = prot_util:unpack(RBin5, [{{16, unsigned}, {32, unsigned}}]),
    {RBin7, AddAttr} = prot_util:unpack(RBin6, [{{16, unsigned}, {32, unsigned}}]),
    {RBin8, PoisonSlots} = prot_util:unpack(RBin7, [{u,anqi_poison_slot}]),

    UnpackRecordData = #clt_anqi{
        id = Id,
        q_level = QLevel,
        combat_power = CombatPower,
        stren = Stren,
        stones = Stones,
        practice_lv = PracticeLv,
        origin_attr = OriginAttr,
        add_attr = AddAttr,
        poison_slots = PoisonSlots
    },

    {RBin8, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(warrior_soul_view, BinData) ->
    {RBin0, Lv} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, StarLv} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Stren} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Stones} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),
    {RBin4, CombatPower} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, SoulParts} = prot_util:unpack(RBin4, [{u,soul_part_info}]),
    {RBin6, Skills} = prot_util:unpack(RBin5, [{32, unsigned}]),
    {RBin7, CurAvatar} = prot_util:unpack(RBin6, {32, unsigned}),

    UnpackRecordData = #warrior_soul_view{
        lv = Lv,
        star_lv = StarLv,
        stren = Stren,
        stones = Stones,
        combat_power = CombatPower,
        soul_parts = SoulParts,
        skills = Skills,
        cur_avatar = CurAvatar
    },

    {RBin7, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_role_view, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, ServerNum} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, ServerId} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Level} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, Career} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Gender} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Icon} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, Hair} = prot_util:unpack(RBin7, {32, unsigned}),
    {RBin9, Frame} = prot_util:unpack(RBin8, {16, unsigned}),
    {RBin10, Bubble} = prot_util:unpack(RBin9, {16, unsigned}),
    {RBin11, Fashion} = prot_util:unpack(RBin10, {32, unsigned}),
    {RBin12, Title} = prot_util:unpack(RBin11, {16, unsigned}),
    {RBin13, TitleHonor} = prot_util:unpack(RBin12, {32, unsigned}),
    {RBin14, SceneId} = prot_util:unpack(RBin13, {32, unsigned}),
    {RBin15, Offline} = prot_util:unpack(RBin14, {32, unsigned}),
    {RBin16, GuildName} = prot_util:unpack(RBin15, string),
    {RBin17, MateName} = prot_util:unpack(RBin16, string),
    {RBin18, Stat} = prot_util:unpack(RBin17, {8, unsigned}),
    {RBin19, TeamId} = prot_util:unpack(RBin18, {64, unsigned}),
    {RBin20, TeamNum} = prot_util:unpack(RBin19, {8, unsigned}),
    {RBin21, Introduction} = prot_util:unpack(RBin20, string),
    {RBin22, Equips} = prot_util:unpack(RBin21, [{u,equip_info}]),
    {RBin23, Anqi} = prot_util:unpack(RBin22, {u,clt_anqi}),
    {RBin24, Artifact} = prot_util:unpack(RBin23, {u,clt_artifact}),
    {RBin25, Dragon} = prot_util:unpack(RBin24, {u,dragon_view}),
    {RBin26, WarriorSoul} = prot_util:unpack(RBin25, {u,warrior_soul_view}),
    {RBin27, Marriage} = prot_util:unpack(RBin26, {u,marry_view}),

    UnpackRecordData = #clt_role_view{
        id = Id,
        name = Name,
        server_num = ServerNum,
        server_id = ServerId,
        level = Level,
        career = Career,
        gender = Gender,
        icon = Icon,
        hair = Hair,
        frame = Frame,
        bubble = Bubble,
        fashion = Fashion,
        title = Title,
        title_honor = TitleHonor,
        scene_id = SceneId,
        offline = Offline,
        guild_name = GuildName,
        mate_name = MateName,
        stat = Stat,
        team_id = TeamId,
        team_num = TeamNum,
        introduction = Introduction,
        equips = Equips,
        anqi = Anqi,
        artifact = Artifact,
        dragon = Dragon,
        warrior_soul = WarriorSoul,
        marriage = Marriage
    },

    {RBin27, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_rank_item, BinData) ->
    {RBin0, Rank} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Id} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, ServerNum} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Columns} = prot_util:unpack(RBin2, [string]),

    UnpackRecordData = #clt_rank_item{
        rank = Rank,
        id = Id,
        server_num = ServerNum,
        columns = Columns
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_rank_info, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Page} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Total} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Items} = prot_util:unpack(RBin2, [{u,clt_rank_item}]),
    {RBin4, Relative} = prot_util:unpack(RBin3, [{u,clt_rank_item}]),

    UnpackRecordData = #clt_rank_info{
        type = Type,
        page = Page,
        total = Total,
        items = Items,
        relative = Relative
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_title, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Expire} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Valid} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #clt_title{
        id = Id,
        expire = Expire,
        valid = Valid
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_shop, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Items} = prot_util:unpack(RBin0, [{u,clt_shop_item}]),

    UnpackRecordData = #clt_shop{
        id = Id,
        items = Items
    },

    {RBin1, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_shop_item, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Num} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #clt_shop_item{
        id = Id,
        num = Num
    },

    {RBin1, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_dungeon, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, NowLv} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, NowWave} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, MaxLv} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, MaxWave} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, MaxLvYday} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, MaxWaveYday} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, EnterTimes} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, ResetTimes} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, ChalTimes} = prot_util:unpack(RBin8, {16, unsigned}),
    {RBin10, WipeTimes} = prot_util:unpack(RBin9, {16, unsigned}),
    {RBin11, AssistTimes} = prot_util:unpack(RBin10, {16, unsigned}),
    {RBin12, DailyHis} = prot_util:unpack(RBin11, [{{16, unsigned}, {8, unsigned}}]),
    {RBin13, DailyWipe} = prot_util:unpack(RBin12, [{{16, unsigned}, {8, unsigned}}]),
    {RBin14, DailyReward} = prot_util:unpack(RBin13, [{{16, unsigned}, {8, unsigned}}]),
    {RBin15, LifeHis} = prot_util:unpack(RBin14, [{{16, unsigned}, {8, unsigned}}]),
    {RBin16, StarInfo} = prot_util:unpack(RBin15, [{{16, unsigned}, {8, unsigned}}]),
    {RBin17, ChapterReward} = prot_util:unpack(RBin16, [{{16, unsigned}, {16, unsigned}}]),
    {RBin18, FirstReward} = prot_util:unpack(RBin17, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #clt_dungeon{
        id = Id,
        now_lv = NowLv,
        now_wave = NowWave,
        max_lv = MaxLv,
        max_wave = MaxWave,
        max_lv_yday = MaxLvYday,
        max_wave_yday = MaxWaveYday,
        enter_times = EnterTimes,
        reset_times = ResetTimes,
        chal_times = ChalTimes,
        wipe_times = WipeTimes,
        assist_times = AssistTimes,
        daily_his = DailyHis,
        daily_wipe = DailyWipe,
        daily_reward = DailyReward,
        life_his = LifeHis,
        star_info = StarInfo,
        chapter_reward = ChapterReward,
        first_reward = FirstReward
    },

    {RBin18, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(pet_poten, BinData) ->
    {RBin0, Power} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Anima} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Energy} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Concent} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Method} = prot_util:unpack(RBin3, {16, unsigned}),

    UnpackRecordData = #pet_poten{
        power = Power,
        anima = Anima,
        energy = Energy,
        concent = Concent,
        method = Method
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_pet, BinData) ->
    {RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Cid} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Name} = prot_util:unpack(RBin1, string),
    {RBin3, Stat} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Level} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Exp} = prot_util:unpack(RBin4, {64, unsigned}),
    {RBin6, Hp} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, Star} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, SavvyLv} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, GrowupLv} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, GrowupRate} = prot_util:unpack(RBin9, {16, unsigned}),
    {RBin11, Awaken} = prot_util:unpack(RBin10, {8, unsigned}),
    {RBin12, Potential} = prot_util:unpack(RBin11, {u,pet_poten}),
    {RBin13, InitAttr} = prot_util:unpack(RBin12, [{{8, unsigned}, {32, unsigned}}]),
    {RBin14, BtAttr} = prot_util:unpack(RBin13, [{{8, unsigned}, {32, unsigned}}]),
    {RBin15, Skills} = prot_util:unpack(RBin14, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),
    {RBin16, SellTime} = prot_util:unpack(RBin15, {32, unsigned}),
    {RBin17, SellTimes} = prot_util:unpack(RBin16, {8, unsigned}),

    UnpackRecordData = #clt_pet{
        grid = Grid,
        cid = Cid,
        name = Name,
        stat = Stat,
        level = Level,
        exp = Exp,
        hp = Hp,
        star = Star,
        savvy_lv = SavvyLv,
        growup_lv = GrowupLv,
        growup_rate = GrowupRate,
        awaken = Awaken,
        potential = Potential,
        init_attr = InitAttr,
        bt_attr = BtAttr,
        skills = Skills,
        sell_time = SellTime,
        sell_times = SellTimes
    },

    {RBin17, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_dpet, BinData) ->
    {RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Cid} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Name} = prot_util:unpack(RBin1, string),
    {RBin3, Level} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Star} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, SavvyLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, GrowupLv} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, GrowupRate} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, Awaken} = prot_util:unpack(RBin7, {8, unsigned}),

    UnpackRecordData = #clt_dpet{
        grid = Grid,
        cid = Cid,
        name = Name,
        level = Level,
        star = Star,
        savvy_lv = SavvyLv,
        growup_lv = GrowupLv,
        growup_rate = GrowupRate,
        awaken = Awaken
    },

    {RBin8, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_attach, BinData) ->
    {RBin0, AttachId} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, PetGrid} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Internals} = prot_util:unpack(RBin1, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    {RBin3, BtAttr} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),
    {RBin4, Fight} = prot_util:unpack(RBin3, {32, unsigned}),

    UnpackRecordData = #clt_attach{
        attach_id = AttachId,
        pet_grid = PetGrid,
        internals = Internals,
        bt_attr = BtAttr,
        fight = Fight
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_guild, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Rank} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Level} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Funds} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Fight} = prot_util:unpack(RBin4, {64, unsigned}),
    {RBin6, Announce} = prot_util:unpack(RBin5, string),
    {RBin7, ChiefId} = prot_util:unpack(RBin6, {64, unsigned}),
    {RBin8, ChiefName} = prot_util:unpack(RBin7, string),
    {RBin9, AcceptType} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, AutoAccept} = prot_util:unpack(RBin9, {8, unsigned}),
    {RBin11, Members} = prot_util:unpack(RBin10, [{u,clt_guild_member}]),
    {RBin12, DenfState} = prot_util:unpack(RBin11, {8, unsigned}),
    {RBin13, PauseDenfTime} = prot_util:unpack(RBin12, {32, unsigned}),
    {RBin14, RecentlyLive} = prot_util:unpack(RBin13, {32, unsigned}),
    {RBin15, Bonus} = prot_util:unpack(RBin14, [{{8, unsigned}, {32, unsigned}}]),
    {RBin16, Build} = prot_util:unpack(RBin15, [{{16, unsigned}, {8, unsigned}}]),
    {RBin17, Study} = prot_util:unpack(RBin16, [{{16, unsigned}, {8, unsigned}}]),
    {RBin18, Battle} = prot_util:unpack(RBin17, {32, unsigned}),
    {RBin19, LuckyMoney} = prot_util:unpack(RBin18, [{u,clt_lucky_money}]),
    {RBin20, Num} = prot_util:unpack(RBin19, {32, unsigned}),
    {RBin21, ShDung} = prot_util:unpack(RBin20, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    {RBin22, ShCurPage} = prot_util:unpack(RBin21, {8, unsigned}),
    {RBin23, RecruitTime} = prot_util:unpack(RBin22, {32, unsigned}),

    UnpackRecordData = #clt_guild{
        id = Id,
        name = Name,
        rank = Rank,
        level = Level,
        funds = Funds,
        fight = Fight,
        announce = Announce,
        chief_id = ChiefId,
        chief_name = ChiefName,
        accept_type = AcceptType,
        auto_accept = AutoAccept,
        members = Members,
        denf_state = DenfState,
        pause_denf_time = PauseDenfTime,
        recently_live = RecentlyLive,
        bonus = Bonus,
        build = Build,
        study = Study,
        battle = Battle,
        lucky_money = LuckyMoney,
        num = Num,
        sh_dung = ShDung,
        sh_cur_page = ShCurPage,
        recruit_time = RecruitTime
    },

    {RBin23, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_guild_member, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Pos} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Name} = prot_util:unpack(RBin1, string),
    {RBin3, Level} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Gender} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Fight} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Career} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Contri} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, VipLv} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, Offline} = prot_util:unpack(RBin8, {32, unsigned}),
    {RBin10, WeeklyLive} = prot_util:unpack(RBin9, {32, unsigned}),
    {RBin11, WeeklyFunds} = prot_util:unpack(RBin10, {32, unsigned}),
    {RBin12, WeeklyCont} = prot_util:unpack(RBin11, {32, unsigned}),
    {RBin13, Icon} = prot_util:unpack(RBin12, {16, unsigned}),
    {RBin14, Frame} = prot_util:unpack(RBin13, {16, unsigned}),

    UnpackRecordData = #clt_guild_member{
        id = Id,
        pos = Pos,
        name = Name,
        level = Level,
        gender = Gender,
        fight = Fight,
        career = Career,
        contri = Contri,
        vip_lv = VipLv,
        offline = Offline,
        weekly_live = WeeklyLive,
        weekly_funds = WeeklyFunds,
        weekly_cont = WeeklyCont,
        icon = Icon,
        frame = Frame
    },

    {RBin14, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_guild_request, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Level} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Fight} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Frame} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, Icon} = prot_util:unpack(RBin4, {16, unsigned}),

    UnpackRecordData = #clt_guild_request{
        id = Id,
        name = Name,
        level = Level,
        fight = Fight,
        frame = Frame,
        icon = Icon
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_guild_brief, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Rank} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Name} = prot_util:unpack(RBin1, string),
    {RBin3, Level} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, MemNum} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Fight} = prot_util:unpack(RBin4, {64, unsigned}),
    {RBin6, Apply} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, ChiefName} = prot_util:unpack(RBin6, string),
    {RBin8, AcceptType} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, AutoAccept} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, DenfState} = prot_util:unpack(RBin9, {8, unsigned}),
    {RBin11, MaxNum} = prot_util:unpack(RBin10, {32, unsigned}),
    {RBin12, Num} = prot_util:unpack(RBin11, {32, unsigned}),

    UnpackRecordData = #clt_guild_brief{
        id = Id,
        rank = Rank,
        name = Name,
        level = Level,
        mem_num = MemNum,
        fight = Fight,
        apply = Apply,
        chief_name = ChiefName,
        accept_type = AcceptType,
        auto_accept = AutoAccept,
        denf_state = DenfState,
        max_num = MaxNum,
        num = Num
    },

    {RBin12, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_guild_donate, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Contri} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #clt_guild_donate{
        id = Id,
        name = Name,
        contri = Contri
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(guild_comment_role, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleName} = prot_util:unpack(RBin0, string),
    {RBin2, Career} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Gender} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, LikeNum} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, DislikeNum} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, DiceNum} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, RewardId} = prot_util:unpack(RBin6, {32, unsigned}),

    UnpackRecordData = #guild_comment_role{
        role_id = RoleId,
        role_name = RoleName,
        career = Career,
        gender = Gender,
        like_num = LikeNum,
        dislike_num = DislikeNum,
        dice_num = DiceNum,
        reward_id = RewardId
    },

    {RBin7, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_surface, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Num} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Fashion} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Mount} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Wing} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, God} = prot_util:unpack(RBin4, {16, unsigned}),

    UnpackRecordData = #clt_surface{
        id = Id,
        num = Num,
        fashion = Fashion,
        mount = Mount,
        wing = Wing,
        god = God
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_hero, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Level} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Exp} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Legend} = prot_util:unpack(RBin2, {8, unsigned}),

    UnpackRecordData = #clt_hero{
        id = Id,
        level = Level,
        exp = Exp,
        legend = Legend
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_hero_guide, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Desc} = prot_util:unpack(RBin1, string),
    {RBin3, Plan} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #clt_hero_guide{
        id = Id,
        name = Name,
        desc = Desc,
        plan = Plan
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(wb_guild_rank, BinData) ->
    {RBin0, BossId} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, TotalHarm} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, BossHpLmt} = prot_util:unpack(RBin1, {64, unsigned}),
    {RBin3, RankList} = prot_util:unpack(RBin2, [{{32, unsigned}, string, {64, unsigned}}]),

    UnpackRecordData = #wb_guild_rank{
        boss_id = BossId,
        total_harm = TotalHarm,
        boss_hp_lmt = BossHpLmt,
        rank_list = RankList
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_dice_val, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, RoleName} = prot_util:unpack(RBin0, string),
    {RBin2, Val} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #clt_dice_val{
        role_id = RoleId,
        role_name = RoleName,
        val = Val
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_team, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Match} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Target} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Follow} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Leader} = prot_util:unpack(RBin3, {64, unsigned}),
    {RBin5, MinLv} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, MaxLv} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, Members} = prot_util:unpack(RBin6, [{u,clt_team_member}]),
    {RBin8, Robots} = prot_util:unpack(RBin7, [{8, unsigned}]),
    {RBin9, MatchBeg} = prot_util:unpack(RBin8, {32, unsigned}),

    UnpackRecordData = #clt_team{
        id = Id,
        match = Match,
        target = Target,
        follow = Follow,
        leader = Leader,
        min_lv = MinLv,
        max_lv = MaxLv,
        members = Members,
        robots = Robots,
        match_beg = MatchBeg
    },

    {RBin9, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_team_brief, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Level} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Career} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Leader} = prot_util:unpack(RBin3, {64, unsigned}),
    {RBin5, MemNum} = prot_util:unpack(RBin4, {8, unsigned}),

    UnpackRecordData = #clt_team_brief{
        id = Id,
        name = Name,
        level = Level,
        career = Career,
        leader = Leader,
        mem_num = MemNum
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_team_member, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Hp} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, HpLim} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Level} = prot_util:unpack(RBin3, {16, unsigned}),
    {RBin5, State} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Scene} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, Line} = prot_util:unpack(RBin6, {64, unsigned}),
    {RBin8, Career} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, Gender} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, Offline} = prot_util:unpack(RBin9, {32, unsigned}),
    {RBin11, Icon} = prot_util:unpack(RBin10, {16, unsigned}),
    {RBin12, Frame} = prot_util:unpack(RBin11, {16, unsigned}),
    {RBin13, Assist} = prot_util:unpack(RBin12, {8, unsigned}),

    UnpackRecordData = #clt_team_member{
        id = Id,
        name = Name,
        hp = Hp,
        hp_lim = HpLim,
        level = Level,
        state = State,
        scene = Scene,
        line = Line,
        career = Career,
        gender = Gender,
        offline = Offline,
        icon = Icon,
        frame = Frame,
        assist = Assist
    },

    {RBin13, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_channel, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Hero} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Level} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Equips} = prot_util:unpack(RBin2, [{{8, unsigned}, {32, unsigned}}]),
    {RBin4, Potentials} = prot_util:unpack(RBin3, [{{8, unsigned}, {16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #clt_channel{
        id = Id,
        hero = Hero,
        level = Level,
        equips = Equips,
        potentials = Potentials
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(anqi_skill_plan, BinData) ->
    {RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Skill1} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Skill2} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Skill3} = prot_util:unpack(RBin2, {32, unsigned}),

    UnpackRecordData = #anqi_skill_plan{
        index = Index,
        skill1 = Skill1,
        skill2 = Skill2,
        skill3 = Skill3
    },

    {RBin3, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(anqi_poison_slot, BinData) ->
    {RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Lv} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Exp} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Attr} = prot_util:unpack(RBin2, [{{16, unsigned}, {32, unsigned}}]),
    {RBin4, SubAttr} = prot_util:unpack(RBin3, [{{16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #anqi_poison_slot{
        index = Index,
        lv = Lv,
        exp = Exp,
        attr = Attr,
        sub_attr = SubAttr
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_task, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Stat} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Masks} = prot_util:unpack(RBin1, [{{16, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #clt_task{
        id = Id,
        stat = Stat,
        masks = Masks
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_market_goods, BinData) ->
    {RBin0, Uid} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Tag} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Id} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Num} = prot_util:unpack(RBin2, {32, unsigned}),
    {RBin4, Stat} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Price} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Follower} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, EndTime} = prot_util:unpack(RBin6, {32, unsigned}),
    {RBin8, Following} = prot_util:unpack(RBin7, {8, unsigned}),

    UnpackRecordData = #clt_market_goods{
        uid = Uid,
        tag = Tag,
        id = Id,
        num = Num,
        stat = Stat,
        price = Price,
        follower = Follower,
        end_time = EndTime,
        following = Following
    },

    {RBin8, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(friend_info, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Vip} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Name} = prot_util:unpack(RBin1, string),
    {RBin3, Level} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Fight} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Offline} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Gender} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, Career} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, Icon} = prot_util:unpack(RBin7, {16, unsigned}),
    {RBin9, Frame} = prot_util:unpack(RBin8, {16, unsigned}),
    {RBin10, TeamId} = prot_util:unpack(RBin9, {64, unsigned}),
    {RBin11, TeamNum} = prot_util:unpack(RBin10, {8, unsigned}),
    {RBin12, Guild} = prot_util:unpack(RBin11, {64, unsigned}),
    {RBin13, GuildName} = prot_util:unpack(RBin12, string),
    {RBin14, Scene} = prot_util:unpack(RBin13, {32, unsigned}),
    {RBin15, Stat} = prot_util:unpack(RBin14, {8, unsigned}),

    UnpackRecordData = #friend_info{
        id = Id,
        vip = Vip,
        name = Name,
        level = Level,
        fight = Fight,
        offline = Offline,
        gender = Gender,
        career = Career,
        icon = Icon,
        frame = Frame,
        team_id = TeamId,
        team_num = TeamNum,
        guild = Guild,
        guild_name = GuildName,
        scene = Scene,
        stat = Stat
    },

    {RBin15, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(friend_block, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, MemList} = prot_util:unpack(RBin1, [{64, unsigned}]),

    UnpackRecordData = #friend_block{
        id = Id,
        name = Name,
        mem_list = MemList
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(friend_group, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, MaxNum} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Name} = prot_util:unpack(RBin2, string),
    {RBin4, Announce} = prot_util:unpack(RBin3, string),
    {RBin5, Owner} = prot_util:unpack(RBin4, {64, unsigned}),
    {RBin6, MemList} = prot_util:unpack(RBin5, [{64, unsigned}]),
    {RBin7, ApplyList} = prot_util:unpack(RBin6, [{64, unsigned}]),

    UnpackRecordData = #friend_group{
        id = Id,
        type = Type,
        max_num = MaxNum,
        name = Name,
        announce = Announce,
        owner = Owner,
        mem_list = MemList,
        apply_list = ApplyList
    },

    {RBin7, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(friend_group_simple, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, MaxNum} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Num} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Name} = prot_util:unpack(RBin3, string),
    {RBin5, Announce} = prot_util:unpack(RBin4, string),
    {RBin6, OwnerRole} = prot_util:unpack(RBin5, {u,clt_chat_role}),

    UnpackRecordData = #friend_group_simple{
        id = Id,
        type = Type,
        max_num = MaxNum,
        num = Num,
        name = Name,
        announce = Announce,
        owner_role = OwnerRole
    },

    {RBin6, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(friend_update_list, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, NewList} = prot_util:unpack(RBin0, [{64, unsigned}]),

    UnpackRecordData = #friend_update_list{
        type = Type,
        new_list = NewList
    },

    {RBin1, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(dund_wipe_drop_info, BinData) ->
    {RBin0, Lv} = prot_util:unpack(BinData, {16, unsigned}),
    {RBin1, Rewards} = prot_util:unpack(RBin0, [{{8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #dund_wipe_drop_info{
        lv = Lv,
        rewards = Rewards
    },

    {RBin1, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_forge_soul, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Exp} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Soul} = prot_util:unpack(RBin1, [{{8, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #clt_forge_soul{
        level = Level,
        exp = Exp,
        soul = Soul
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(battle_lose_log, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Time} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Scene} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, WinnerId} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, WinnerName} = prot_util:unpack(RBin3, string),

    UnpackRecordData = #battle_lose_log{
        id = Id,
        time = Time,
        scene = Scene,
        winner_id = WinnerId,
        winner_name = WinnerName
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_lucky_money, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, Cid} = prot_util:unpack(RBin0, {16, unsigned}),
    {RBin2, Sender} = prot_util:unpack(RBin1, string),
    {RBin3, List} = prot_util:unpack(RBin2, [{{16, unsigned}, {64, unsigned}, string, {32, unsigned}}]),
    {RBin4, ExpireTime} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Icon} = prot_util:unpack(RBin4, {32, unsigned}),

    UnpackRecordData = #clt_lucky_money{
        id = Id,
        cid = Cid,
        sender = Sender,
        list = List,
        expire_time = ExpireTime,
        icon = Icon
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(conden_soul_result, BinData) ->
    {RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Recommend} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Alters} = prot_util:unpack(RBin1, [{{16, unsigned}, {8, signed}}]),

    UnpackRecordData = #conden_soul_result{
        index = Index,
        recommend = Recommend,
        alters = Alters
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(soul_part_info, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Attr} = prot_util:unpack(RBin0, [{{16, unsigned}, {32, unsigned}}]),
    {RBin2, CondenRet} = prot_util:unpack(RBin1, {u,conden_soul_result}),

    UnpackRecordData = #soul_part_info{
        type = Type,
        attr = Attr,
        conden_ret = CondenRet
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(sworn_member, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, TitleHonor} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Lv} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Career} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Gender} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Icon} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, Frame} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, Senior} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, Word} = prot_util:unpack(RBin8, string),
    {RBin10, Scene} = prot_util:unpack(RBin9, {32, unsigned}),

    UnpackRecordData = #sworn_member{
        role_id = RoleId,
        name = Name,
        title_honor = TitleHonor,
        lv = Lv,
        career = Career,
        gender = Gender,
        icon = Icon,
        frame = Frame,
        senior = Senior,
        word = Word,
        scene = Scene
    },

    {RBin10, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(sworn_sort_info, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Icon} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Frame} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Senior} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Votes} = prot_util:unpack(RBin4, {8, unsigned}),

    UnpackRecordData = #sworn_sort_info{
        role_id = RoleId,
        name = Name,
        icon = Icon,
        frame = Frame,
        senior = Senior,
        votes = Votes
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(sworn_person_plat, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, TitleHonor} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Lv} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Career} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Icon} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Frame} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, GuildName} = prot_util:unpack(RBin6, string),
    {RBin8, TendCareer} = prot_util:unpack(RBin7, {8, unsigned}),
    {RBin9, TendLv} = prot_util:unpack(RBin8, {8, unsigned}),
    {RBin10, TendTime} = prot_util:unpack(RBin9, {8, unsigned}),

    UnpackRecordData = #sworn_person_plat{
        role_id = RoleId,
        name = Name,
        title_honor = TitleHonor,
        lv = Lv,
        career = Career,
        icon = Icon,
        frame = Frame,
        guild_name = GuildName,
        tend_career = TendCareer,
        tend_lv = TendLv,
        tend_time = TendTime
    },

    {RBin10, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(sworn_member_simple, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Lv} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Career} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Gender} = prot_util:unpack(RBin3, {8, unsigned}),

    UnpackRecordData = #sworn_member_simple{
        role_id = RoleId,
        name = Name,
        lv = Lv,
        career = Career,
        gender = Gender
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(sworn_group_plat, BinData) ->
    {RBin0, GroupId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, MemList} = prot_util:unpack(RBin0, [{u,sworn_member_simple}]),
    {RBin2, SwornValue} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, TendCareer} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, TendLv} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, TendTime} = prot_util:unpack(RBin4, {8, unsigned}),

    UnpackRecordData = #sworn_group_plat{
        group_id = GroupId,
        mem_list = MemList,
        sworn_value = SwornValue,
        tend_career = TendCareer,
        tend_lv = TendLv,
        tend_time = TendTime
    },

    {RBin5, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_deed_list, BinData) ->
    {RBin0, Day} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, List} = prot_util:unpack(RBin0, [{{16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #clt_deed_list{
        day = Day,
        list = List
    },

    {RBin1, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(mentor_base_info, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Senior} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Lv} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Career} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Gender} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, Icon} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, Frame} = prot_util:unpack(RBin6, {16, unsigned}),
    {RBin8, OfflineTime} = prot_util:unpack(RBin7, {32, unsigned}),
    {RBin9, Scene} = prot_util:unpack(RBin8, {32, unsigned}),
    {RBin10, Morality} = prot_util:unpack(RBin9, {32, unsigned}),

    UnpackRecordData = #mentor_base_info{
        role_id = RoleId,
        name = Name,
        senior = Senior,
        lv = Lv,
        career = Career,
        gender = Gender,
        icon = Icon,
        frame = Frame,
        offline_time = OfflineTime,
        scene = Scene,
        morality = Morality
    },

    {RBin10, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(mentor_tudi_info, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Senior} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Type} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Mark} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, PracticeNum} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, BeginTime} = prot_util:unpack(RBin4, {32, unsigned}),
    {RBin6, Comment} = prot_util:unpack(RBin5, {8, unsigned}),
    {RBin7, LearnTasks} = prot_util:unpack(RBin6, [{{16, unsigned}, {16, unsigned}}]),
    {RBin8, MentorTasks} = prot_util:unpack(RBin7, [{{16, unsigned}, {16, unsigned}}]),
    {RBin9, TaixueTasks} = prot_util:unpack(RBin8, [{{16, unsigned}, {16, unsigned}}]),
    {RBin10, AwardTaken} = prot_util:unpack(RBin9, {8, unsigned}),

    UnpackRecordData = #mentor_tudi_info{
        role_id = RoleId,
        senior = Senior,
        type = Type,
        mark = Mark,
        practice_num = PracticeNum,
        begin_time = BeginTime,
        comment = Comment,
        learn_tasks = LearnTasks,
        mentor_tasks = MentorTasks,
        taixue_tasks = TaixueTasks,
        award_taken = AwardTaken
    },

    {RBin10, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_fight_team, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Prestige} = prot_util:unpack(RBin1, {16, unsigned}),
    {RBin3, Leader} = prot_util:unpack(RBin2, {64, unsigned}),
    {RBin4, Members} = prot_util:unpack(RBin3, [{u,clt_fight_team_member}]),

    UnpackRecordData = #clt_fight_team{
        id = Id,
        name = Name,
        prestige = Prestige,
        leader = Leader,
        members = Members
    },

    {RBin4, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_fight_team_member, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Name} = prot_util:unpack(RBin0, string),
    {RBin2, Fight} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Level} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Career} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Frame} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Icon} = prot_util:unpack(RBin5, {16, unsigned}),
    {RBin7, Prestige} = prot_util:unpack(RBin6, {16, unsigned}),

    UnpackRecordData = #clt_fight_team_member{
        id = Id,
        name = Name,
        fight = Fight,
        level = Level,
        career = Career,
        frame = Frame,
        icon = Icon,
        prestige = Prestige
    },

    {RBin7, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(clt_sword_res, BinData) ->
    {RBin0, SvrName} = prot_util:unpack(BinData, string),
    {RBin1, FightTeamName} = prot_util:unpack(RBin0, string),
    {RBin2, Members} = prot_util:unpack(RBin1, [{string, {8, unsigned}, {64, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #clt_sword_res{
        svr_name = SvrName,
        fight_team_name = FightTeamName,
        members = Members
    },

    {RBin2, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(goods_info, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#goods_info.id, {32, unsigned}),
    Pos = prot_util:pack(PackRecordData#goods_info.pos, {16, unsigned}),
    Num = prot_util:pack(PackRecordData#goods_info.num, {16, unsigned}),
    Bind = prot_util:pack(PackRecordData#goods_info.bind, {8, unsigned}),
    Expire = prot_util:pack(PackRecordData#goods_info.expire, {32, unsigned}),
    Paris = prot_util:pack(PackRecordData#goods_info.paris, {8, unsigned}),
    Attr = prot_util:pack(PackRecordData#goods_info.attr, [{{16, unsigned}, {16, unsigned}}]),
    SellTime = prot_util:pack(PackRecordData#goods_info.sell_time, {32, unsigned}),
    SellTimes = prot_util:pack(PackRecordData#goods_info.sell_times, {8, unsigned}),
    Effect = prot_util:pack(PackRecordData#goods_info.effect, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#goods_info.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#goods_info.exp, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#goods_info.extra, [string]),

    BinData = <<
        Id/binary,
        Pos/binary,
        Num/binary,
        Bind/binary,
        Expire/binary,
        Paris/binary,
        Attr/binary,
        SellTime/binary,
        SellTimes/binary,
        Effect/binary,
        Level/binary,
        Exp/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(bag_info, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#bag_info.bag_id, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#bag_info.name, string),
    CellNum = prot_util:pack(PackRecordData#bag_info.cell_num, {16, unsigned}),
    Goods = prot_util:pack(PackRecordData#bag_info.goods, [{u,goods_info}]),

    BinData = <<
        BagId/binary,
        Name/binary,
        CellNum/binary,
        Goods/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(bag_change, PackRecordData) ->
    BagId = prot_util:pack(PackRecordData#bag_change.bag_id, {8, unsigned}),
    Change = prot_util:pack(PackRecordData#bag_change.change, [{u,goods_info}]),
    Delete = prot_util:pack(PackRecordData#bag_change.delete, [{16, unsigned}]),

    BinData = <<
        BagId/binary,
        Change/binary,
        Delete/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(item, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#item.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#item.id, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#item.num, {32, unsigned}),
    Bind = prot_util:pack(PackRecordData#item.bind, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary,
        Num/binary,
        Bind/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(equip_info, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#equip_info.pos, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#equip_info.id, {32, unsigned}),
    Stren = prot_util:pack(PackRecordData#equip_info.stren, {8, unsigned}),
    Stones = prot_util:pack(PackRecordData#equip_info.stones, [{{8, unsigned}, {32, unsigned}}]),
    Paris = prot_util:pack(PackRecordData#equip_info.paris, {8, unsigned}),
    Attr = prot_util:pack(PackRecordData#equip_info.attr, [{{16, unsigned}, {16, unsigned}}]),
    Extra = prot_util:pack(PackRecordData#equip_info.extra, [string]),

    BinData = <<
        Pos/binary,
        Id/binary,
        Stren/binary,
        Stones/binary,
        Paris/binary,
        Attr/binary,
        Extra/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(dragon, PackRecordData) ->
    Pos = prot_util:pack(PackRecordData#dragon.pos, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#dragon.id, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#dragon.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#dragon.exp, {16, unsigned}),

    BinData = <<
        Pos/binary,
        Id/binary,
        Level/binary,
        Exp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(dragon_view, PackRecordData) ->
    Items = prot_util:pack(PackRecordData#dragon_view.items, [{u,dragon}]),
    GrowthLv = prot_util:pack(PackRecordData#dragon_view.growth_lv, {8, unsigned}),
    GrowthHole = prot_util:pack(PackRecordData#dragon_view.growth_hole, {8, unsigned}),
    RefineLv = prot_util:pack(PackRecordData#dragon_view.refine_lv, {8, unsigned}),
    RefineStar = prot_util:pack(PackRecordData#dragon_view.refine_star, {8, unsigned}),
    RefineExp = prot_util:pack(PackRecordData#dragon_view.refine_exp, {16, unsigned}),
    RefineQuality = prot_util:pack(PackRecordData#dragon_view.refine_quality, [{{8, unsigned}, {16, unsigned}}]),

    BinData = <<
        Items/binary,
        GrowthLv/binary,
        GrowthHole/binary,
        RefineLv/binary,
        RefineStar/binary,
        RefineExp/binary,
        RefineQuality/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_chat_role, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_chat_role.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_chat_role.name, string),
    SvrNum = prot_util:pack(PackRecordData#clt_chat_role.svr_num, {16, unsigned}),
    Career = prot_util:pack(PackRecordData#clt_chat_role.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#clt_chat_role.gender, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_chat_role.level, {16, unsigned}),
    Icon = prot_util:pack(PackRecordData#clt_chat_role.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#clt_chat_role.frame, {16, unsigned}),
    Bubble = prot_util:pack(PackRecordData#clt_chat_role.bubble, {16, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        SvrNum/binary,
        Career/binary,
        Gender/binary,
        Level/binary,
        Icon/binary,
        Frame/binary,
        Bubble/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_chat_his_item, PackRecordData) ->
    Role = prot_util:pack(PackRecordData#clt_chat_his_item.role, {8, unsigned}),
    Content = prot_util:pack(PackRecordData#clt_chat_his_item.content, string),
    Voice = prot_util:pack(PackRecordData#clt_chat_his_item.voice, string),
    VoiceTime = prot_util:pack(PackRecordData#clt_chat_his_item.voice_time, {16, unsigned}),
    Extra = prot_util:pack(PackRecordData#clt_chat_his_item.extra, string),
    Time = prot_util:pack(PackRecordData#clt_chat_his_item.time, {32, unsigned}),

    BinData = <<
        Role/binary,
        Content/binary,
        Voice/binary,
        VoiceTime/binary,
        Extra/binary,
        Time/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_chat_public_cache, PackRecordData) ->
    Channel = prot_util:pack(PackRecordData#clt_chat_public_cache.channel, {8, unsigned}),
    Target = prot_util:pack(PackRecordData#clt_chat_public_cache.target, {64, unsigned}),
    History = prot_util:pack(PackRecordData#clt_chat_public_cache.history, [{u,clt_chat_public_item}]),

    BinData = <<
        Channel/binary,
        Target/binary,
        History/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_chat_public_item, PackRecordData) ->
    Sender = prot_util:pack(PackRecordData#clt_chat_public_item.sender, {u,clt_chat_role}),
    Item = prot_util:pack(PackRecordData#clt_chat_public_item.item, {u,clt_chat_his_item}),

    BinData = <<
        Sender/binary,
        Item/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_chat_private_cache, PackRecordData) ->
    Sender = prot_util:pack(PackRecordData#clt_chat_private_cache.sender, {u,clt_chat_role}),
    History = prot_util:pack(PackRecordData#clt_chat_private_cache.history, [{u,clt_chat_his_item}]),

    BinData = <<
        Sender/binary,
        History/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(marry_view, PackRecordData) ->
    MateId = prot_util:pack(PackRecordData#marry_view.mate_id, {64, unsigned}),
    MateName = prot_util:pack(PackRecordData#marry_view.mate_name, string),
    Bless = prot_util:pack(PackRecordData#marry_view.bless, {8, unsigned}),

    BinData = <<
        MateId/binary,
        MateName/binary,
        Bless/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(state_param, PackRecordData) ->
    CenterX = prot_util:pack(PackRecordData#state_param.center_x, {16, unsigned}),
    CenterY = prot_util:pack(PackRecordData#state_param.center_y, {16, unsigned}),
    EndTime = prot_util:pack(PackRecordData#state_param.end_time, {32, unsigned}),

    BinData = <<
        CenterX/binary,
        CenterY/binary,
        EndTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(role_login_info, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#role_login_info.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#role_login_info.name, string),
    Career = prot_util:pack(PackRecordData#role_login_info.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#role_login_info.gender, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#role_login_info.level, {16, unsigned}),
    Fashion = prot_util:pack(PackRecordData#role_login_info.fashion, {32, unsigned}),
    Artifact = prot_util:pack(PackRecordData#role_login_info.artifact, {32, unsigned}),
    Icon = prot_util:pack(PackRecordData#role_login_info.icon, {16, unsigned}),
    Hair = prot_util:pack(PackRecordData#role_login_info.hair, {32, unsigned}),
    State = prot_util:pack(PackRecordData#role_login_info.state, {8, unsigned}),
    RegTime = prot_util:pack(PackRecordData#role_login_info.reg_time, {32, unsigned}),
    LastLoginTime = prot_util:pack(PackRecordData#role_login_info.last_login_time, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        Career/binary,
        Gender/binary,
        Level/binary,
        Fashion/binary,
        Artifact/binary,
        Icon/binary,
        Hair/binary,
        State/binary,
        RegTime/binary,
        LastLoginTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(role_scene_info, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#role_scene_info.role_id, {64, unsigned}),
    OwnerId = prot_util:pack(PackRecordData#role_scene_info.owner_id, {64, unsigned}),
    ServerNum = prot_util:pack(PackRecordData#role_scene_info.server_num, {32, unsigned}),
    Name = prot_util:pack(PackRecordData#role_scene_info.name, string),
    Career = prot_util:pack(PackRecordData#role_scene_info.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#role_scene_info.gender, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#role_scene_info.level, {16, unsigned}),
    Guild = prot_util:pack(PackRecordData#role_scene_info.guild, {64, unsigned}),
    GuildName = prot_util:pack(PackRecordData#role_scene_info.guild_name, string),
    Team = prot_util:pack(PackRecordData#role_scene_info.team, {64, unsigned}),
    Realm = prot_util:pack(PackRecordData#role_scene_info.realm, {8, unsigned}),
    MateId = prot_util:pack(PackRecordData#role_scene_info.mate_id, {64, unsigned}),
    MateName = prot_util:pack(PackRecordData#role_scene_info.mate_name, string),
    CurPet = prot_util:pack(PackRecordData#role_scene_info.cur_pet, {64, unsigned}),
    X = prot_util:pack(PackRecordData#role_scene_info.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#role_scene_info.y, {16, unsigned}),
    ToX = prot_util:pack(PackRecordData#role_scene_info.to_x, {16, unsigned}),
    ToY = prot_util:pack(PackRecordData#role_scene_info.to_y, {16, unsigned}),
    Hp = prot_util:pack(PackRecordData#role_scene_info.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#role_scene_info.hp_lim, {32, unsigned}),
    Mp = prot_util:pack(PackRecordData#role_scene_info.mp, {32, unsigned}),
    MpLim = prot_util:pack(PackRecordData#role_scene_info.mp_lim, {32, unsigned}),
    MoveSpeed = prot_util:pack(PackRecordData#role_scene_info.move_speed, {16, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#role_scene_info.combat_power, {32, unsigned}),
    Icon = prot_util:pack(PackRecordData#role_scene_info.icon, {16, unsigned}),
    Hair = prot_util:pack(PackRecordData#role_scene_info.hair, {32, unsigned}),
    Fashion = prot_util:pack(PackRecordData#role_scene_info.fashion, {32, unsigned}),
    Title = prot_util:pack(PackRecordData#role_scene_info.title, {16, unsigned}),
    TitleExtra = prot_util:pack(PackRecordData#role_scene_info.title_extra, string),
    TitleQuality = prot_util:pack(PackRecordData#role_scene_info.title_quality, {8, unsigned}),
    Header = prot_util:pack(PackRecordData#role_scene_info.header, {64, unsigned}),
    TitleHonor = prot_util:pack(PackRecordData#role_scene_info.title_honor, {32, unsigned}),
    Buffs = prot_util:pack(PackRecordData#role_scene_info.buffs, [{{32, unsigned}, {32, unsigned}, {8, unsigned}, {64, unsigned}}]),
    State = prot_util:pack(PackRecordData#role_scene_info.state, {8, unsigned}),
    StateParams = prot_util:pack(PackRecordData#role_scene_info.state_params, [{u,state_param}]),
    Exteriors = prot_util:pack(PackRecordData#role_scene_info.exteriors, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    Murderous = prot_util:pack(PackRecordData#role_scene_info.murderous, {8, signed}),
    Artifact = prot_util:pack(PackRecordData#role_scene_info.artifact, {32, unsigned}),
    WarriorSoul = prot_util:pack(PackRecordData#role_scene_info.warrior_soul, {32, unsigned}),
    TranStat = prot_util:pack(PackRecordData#role_scene_info.tran_stat, {8, unsigned}),
    FightTeamId = prot_util:pack(PackRecordData#role_scene_info.fight_team_id, {64, unsigned}),
    Prestige = prot_util:pack(PackRecordData#role_scene_info.prestige, {16, unsigned}),

    BinData = <<
        RoleId/binary,
        OwnerId/binary,
        ServerNum/binary,
        Name/binary,
        Career/binary,
        Gender/binary,
        Level/binary,
        Guild/binary,
        GuildName/binary,
        Team/binary,
        Realm/binary,
        MateId/binary,
        MateName/binary,
        CurPet/binary,
        X/binary,
        Y/binary,
        ToX/binary,
        ToY/binary,
        Hp/binary,
        HpLim/binary,
        Mp/binary,
        MpLim/binary,
        MoveSpeed/binary,
        CombatPower/binary,
        Icon/binary,
        Hair/binary,
        Fashion/binary,
        Title/binary,
        TitleExtra/binary,
        TitleQuality/binary,
        Header/binary,
        TitleHonor/binary,
        Buffs/binary,
        State/binary,
        StateParams/binary,
        Exteriors/binary,
        Murderous/binary,
        Artifact/binary,
        WarriorSoul/binary,
        TranStat/binary,
        FightTeamId/binary,
        Prestige/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(mon_scene_info, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#mon_scene_info.id, {64, unsigned}),
    Mid = prot_util:pack(PackRecordData#mon_scene_info.mid, {32, unsigned}),
    Name = prot_util:pack(PackRecordData#mon_scene_info.name, string),
    Level = prot_util:pack(PackRecordData#mon_scene_info.level, {16, unsigned}),
    OwnerId = prot_util:pack(PackRecordData#mon_scene_info.owner_id, {64, unsigned}),
    OwnerName = prot_util:pack(PackRecordData#mon_scene_info.owner_name, string),
    OwnerTeam = prot_util:pack(PackRecordData#mon_scene_info.owner_team, {64, unsigned}),
    MoveSpeed = prot_util:pack(PackRecordData#mon_scene_info.move_speed, {16, unsigned}),
    X = prot_util:pack(PackRecordData#mon_scene_info.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#mon_scene_info.y, {16, unsigned}),
    ToX = prot_util:pack(PackRecordData#mon_scene_info.to_x, {16, unsigned}),
    ToY = prot_util:pack(PackRecordData#mon_scene_info.to_y, {16, unsigned}),
    Hp = prot_util:pack(PackRecordData#mon_scene_info.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#mon_scene_info.hp_lim, {32, unsigned}),
    Buffs = prot_util:pack(PackRecordData#mon_scene_info.buffs, [{{32, unsigned}, {32, unsigned}, {8, unsigned}, {64, unsigned}}]),
    Realm = prot_util:pack(PackRecordData#mon_scene_info.realm, {16, unsigned}),
    Attackable = prot_util:pack(PackRecordData#mon_scene_info.attackable, {8, unsigned}),
    FirstAtt = prot_util:pack(PackRecordData#mon_scene_info.first_att, {64, unsigned}),

    BinData = <<
        Id/binary,
        Mid/binary,
        Name/binary,
        Level/binary,
        OwnerId/binary,
        OwnerName/binary,
        OwnerTeam/binary,
        MoveSpeed/binary,
        X/binary,
        Y/binary,
        ToX/binary,
        ToY/binary,
        Hp/binary,
        HpLim/binary,
        Buffs/binary,
        Realm/binary,
        Attackable/binary,
        FirstAtt/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(pet_scene_info, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#pet_scene_info.id, {64, unsigned}),
    PetCid = prot_util:pack(PackRecordData#pet_scene_info.pet_cid, {16, unsigned}),
    TitleC = prot_util:pack(PackRecordData#pet_scene_info.title_c, {8, unsigned}),
    TitleS = prot_util:pack(PackRecordData#pet_scene_info.title_s, string),
    Name = prot_util:pack(PackRecordData#pet_scene_info.name, string),
    Level = prot_util:pack(PackRecordData#pet_scene_info.level, {16, unsigned}),
    Star = prot_util:pack(PackRecordData#pet_scene_info.star, {8, unsigned}),
    Awaken = prot_util:pack(PackRecordData#pet_scene_info.awaken, {8, unsigned}),
    OwnerId = prot_util:pack(PackRecordData#pet_scene_info.owner_id, {64, unsigned}),
    OwnerName = prot_util:pack(PackRecordData#pet_scene_info.owner_name, string),
    Guild = prot_util:pack(PackRecordData#pet_scene_info.guild, {64, unsigned}),
    Team = prot_util:pack(PackRecordData#pet_scene_info.team, {64, unsigned}),
    Realm = prot_util:pack(PackRecordData#pet_scene_info.realm, {8, unsigned}),
    MoveSpeed = prot_util:pack(PackRecordData#pet_scene_info.move_speed, {16, unsigned}),
    X = prot_util:pack(PackRecordData#pet_scene_info.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#pet_scene_info.y, {16, unsigned}),
    ToX = prot_util:pack(PackRecordData#pet_scene_info.to_x, {16, unsigned}),
    ToY = prot_util:pack(PackRecordData#pet_scene_info.to_y, {16, unsigned}),
    Hp = prot_util:pack(PackRecordData#pet_scene_info.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#pet_scene_info.hp_lim, {32, unsigned}),
    Buffs = prot_util:pack(PackRecordData#pet_scene_info.buffs, [{{32, unsigned}, {32, unsigned}, {8, unsigned}, {64, unsigned}}]),

    BinData = <<
        Id/binary,
        PetCid/binary,
        TitleC/binary,
        TitleS/binary,
        Name/binary,
        Level/binary,
        Star/binary,
        Awaken/binary,
        OwnerId/binary,
        OwnerName/binary,
        Guild/binary,
        Team/binary,
        Realm/binary,
        MoveSpeed/binary,
        X/binary,
        Y/binary,
        ToX/binary,
        ToY/binary,
        Hp/binary,
        HpLim/binary,
        Buffs/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(coll_scene_info, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#coll_scene_info.id, {64, unsigned}),
    CollCid = prot_util:pack(PackRecordData#coll_scene_info.coll_cid, {16, unsigned}),
    OwnerId = prot_util:pack(PackRecordData#coll_scene_info.owner_id, {64, unsigned}),
    BelongerId = prot_util:pack(PackRecordData#coll_scene_info.belonger_id, {64, unsigned}),
    BelongerName = prot_util:pack(PackRecordData#coll_scene_info.belonger_name, string),
    Stat = prot_util:pack(PackRecordData#coll_scene_info.stat, {8, unsigned}),
    X = prot_util:pack(PackRecordData#coll_scene_info.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#coll_scene_info.y, {16, unsigned}),
    Realm = prot_util:pack(PackRecordData#coll_scene_info.realm, {8, unsigned}),

    BinData = <<
        Id/binary,
        CollCid/binary,
        OwnerId/binary,
        BelongerId/binary,
        BelongerName/binary,
        Stat/binary,
        X/binary,
        Y/binary,
        Realm/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(carry_scene_info, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#carry_scene_info.id, {64, unsigned}),
    Cid = prot_util:pack(PackRecordData#carry_scene_info.cid, {16, unsigned}),
    OwnerId = prot_util:pack(PackRecordData#carry_scene_info.owner_id, {64, unsigned}),
    OwnerName = prot_util:pack(PackRecordData#carry_scene_info.owner_name, string),
    GuildName = prot_util:pack(PackRecordData#carry_scene_info.guild_name, string),
    X = prot_util:pack(PackRecordData#carry_scene_info.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#carry_scene_info.y, {16, unsigned}),
    ToX = prot_util:pack(PackRecordData#carry_scene_info.to_x, {16, unsigned}),
    ToY = prot_util:pack(PackRecordData#carry_scene_info.to_y, {16, unsigned}),
    Type = prot_util:pack(PackRecordData#carry_scene_info.type, {8, unsigned}),
    Couples = prot_util:pack(PackRecordData#carry_scene_info.couples, [{64, unsigned}]),

    BinData = <<
        Id/binary,
        Cid/binary,
        OwnerId/binary,
        OwnerName/binary,
        GuildName/binary,
        X/binary,
        Y/binary,
        ToX/binary,
        ToY/binary,
        Type/binary,
        Couples/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(flyitem_scene_info, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#flyitem_scene_info.id, {64, unsigned}),
    Cid = prot_util:pack(PackRecordData#flyitem_scene_info.cid, {16, unsigned}),
    X = prot_util:pack(PackRecordData#flyitem_scene_info.x, {16, unsigned}),
    Y = prot_util:pack(PackRecordData#flyitem_scene_info.y, {16, unsigned}),
    ToX = prot_util:pack(PackRecordData#flyitem_scene_info.to_x, {16, unsigned}),
    ToY = prot_util:pack(PackRecordData#flyitem_scene_info.to_y, {16, unsigned}),

    BinData = <<
        Id/binary,
        Cid/binary,
        X/binary,
        Y/binary,
        ToX/binary,
        ToY/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(obj_skill, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#obj_skill.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#obj_skill.id, {64, unsigned}),
    SkillCd = prot_util:pack(PackRecordData#obj_skill.skill_cd, [{{32, unsigned}, {64, unsigned}}]),
    SkillList = prot_util:pack(PackRecordData#obj_skill.skill_list, [{{32, unsigned}, {8, unsigned}}]),

    BinData = <<
        Type/binary,
        Id/binary,
        SkillCd/binary,
        SkillList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(base_attr, PackRecordData) ->
    Power = prot_util:pack(PackRecordData#base_attr.power, {32, unsigned}),
    Anima = prot_util:pack(PackRecordData#base_attr.anima, {32, unsigned}),
    Energy = prot_util:pack(PackRecordData#base_attr.energy, {32, unsigned}),
    Concent = prot_util:pack(PackRecordData#base_attr.concent, {32, unsigned}),
    Method = prot_util:pack(PackRecordData#base_attr.method, {32, unsigned}),
    Basic = prot_util:pack(PackRecordData#base_attr.basic, {32, unsigned}),
    Adef = prot_util:pack(PackRecordData#base_attr.adef, {16, unsigned}),
    AdefRed = prot_util:pack(PackRecordData#base_attr.adef_red, {16, unsigned}),
    Aatt = prot_util:pack(PackRecordData#base_attr.aatt, {32, unsigned}),
    AdefMin = prot_util:pack(PackRecordData#base_attr.adef_min, {16, unsigned}),

    BinData = <<
        Power/binary,
        Anima/binary,
        Energy/binary,
        Concent/binary,
        Method/binary,
        Basic/binary,
        Adef/binary,
        AdefRed/binary,
        Aatt/binary,
        AdefMin/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(bt_attr, PackRecordData) ->
    HpLim = prot_util:pack(PackRecordData#bt_attr.hp_lim, {32, unsigned}),
    HpRec = prot_util:pack(PackRecordData#bt_attr.hp_rec, {32, unsigned}),
    MpLim = prot_util:pack(PackRecordData#bt_attr.mp_lim, {32, unsigned}),
    MpRec = prot_util:pack(PackRecordData#bt_attr.mp_rec, {32, unsigned}),
    OuterAtt = prot_util:pack(PackRecordData#bt_attr.outer_att, {32, unsigned}),
    InnerAtt = prot_util:pack(PackRecordData#bt_attr.inner_att, {32, unsigned}),
    OuterDef = prot_util:pack(PackRecordData#bt_attr.outer_def, {32, unsigned}),
    InnerDef = prot_util:pack(PackRecordData#bt_attr.inner_def, {32, unsigned}),
    Hit = prot_util:pack(PackRecordData#bt_attr.hit, {32, unsigned}),
    Dodge = prot_util:pack(PackRecordData#bt_attr.dodge, {32, unsigned}),
    CritHurt = prot_util:pack(PackRecordData#bt_attr.crit_hurt, {32, unsigned}),
    CritDef = prot_util:pack(PackRecordData#bt_attr.crit_def, {32, unsigned}),
    AttSpeed = prot_util:pack(PackRecordData#bt_attr.att_speed, {16, unsigned}),
    MoveSpeed = prot_util:pack(PackRecordData#bt_attr.move_speed, {16, unsigned}),
    IgndefHurt = prot_util:pack(PackRecordData#bt_attr.igndef_hurt, {32, unsigned}),
    IgndefDef = prot_util:pack(PackRecordData#bt_attr.igndef_def, {32, unsigned}),
    HurtAdd = prot_util:pack(PackRecordData#bt_attr.hurt_add, {16, unsigned}),
    HurtRed = prot_util:pack(PackRecordData#bt_attr.hurt_red, {16, unsigned}),
    CritAdd = prot_util:pack(PackRecordData#bt_attr.crit_add, {16, unsigned}),
    CritRed = prot_util:pack(PackRecordData#bt_attr.crit_red, {16, unsigned}),
    AattIce = prot_util:pack(PackRecordData#bt_attr.aatt_ice, {32, unsigned}),
    AattFire = prot_util:pack(PackRecordData#bt_attr.aatt_fire, {32, unsigned}),
    AattDark = prot_util:pack(PackRecordData#bt_attr.aatt_dark, {32, unsigned}),
    AattPoison = prot_util:pack(PackRecordData#bt_attr.aatt_poison, {32, unsigned}),
    AdefIce = prot_util:pack(PackRecordData#bt_attr.adef_ice, {16, unsigned}),
    AdefFire = prot_util:pack(PackRecordData#bt_attr.adef_fire, {16, unsigned}),
    AdefDark = prot_util:pack(PackRecordData#bt_attr.adef_dark, {16, unsigned}),
    AdefPoison = prot_util:pack(PackRecordData#bt_attr.adef_poison, {16, unsigned}),
    AdefRedIce = prot_util:pack(PackRecordData#bt_attr.adef_red_ice, {16, unsigned}),
    AdefRedFire = prot_util:pack(PackRecordData#bt_attr.adef_red_fire, {16, unsigned}),
    AdefRedDark = prot_util:pack(PackRecordData#bt_attr.adef_red_dark, {16, unsigned}),
    AdefRedPoison = prot_util:pack(PackRecordData#bt_attr.adef_red_poison, {16, unsigned}),
    AdefMinIce = prot_util:pack(PackRecordData#bt_attr.adef_min_ice, {16, unsigned}),
    AdefMinFire = prot_util:pack(PackRecordData#bt_attr.adef_min_fire, {16, unsigned}),
    AdefMinDark = prot_util:pack(PackRecordData#bt_attr.adef_min_dark, {16, unsigned}),
    AdefMinPoison = prot_util:pack(PackRecordData#bt_attr.adef_min_poison, {16, unsigned}),
    AhurtAddIce = prot_util:pack(PackRecordData#bt_attr.ahurt_add_ice, {16, unsigned}),
    AhurtAddFire = prot_util:pack(PackRecordData#bt_attr.ahurt_add_fire, {16, unsigned}),
    AhurtAddDark = prot_util:pack(PackRecordData#bt_attr.ahurt_add_dark, {16, unsigned}),
    AhurtAddPoison = prot_util:pack(PackRecordData#bt_attr.ahurt_add_poison, {16, unsigned}),
    AhurtAdd = prot_util:pack(PackRecordData#bt_attr.ahurt_add, {16, unsigned}),
    AhurtRed = prot_util:pack(PackRecordData#bt_attr.ahurt_red, {16, unsigned}),
    PenetrateAtt = prot_util:pack(PackRecordData#bt_attr.penetrate_att, {32, unsigned}),
    PenetrateDef = prot_util:pack(PackRecordData#bt_attr.penetrate_def, {32, unsigned}),
    PenetrateCrit = prot_util:pack(PackRecordData#bt_attr.penetrate_crit, {32, unsigned}),
    PenetrateCritDef = prot_util:pack(PackRecordData#bt_attr.penetrate_crit_def, {32, unsigned}),
    PenetrateSpeed = prot_util:pack(PackRecordData#bt_attr.penetrate_speed, {16, unsigned}),
    PenetrateHurtAdd = prot_util:pack(PackRecordData#bt_attr.penetrate_hurt_add, {16, unsigned}),
    PenetrateHurtRed = prot_util:pack(PackRecordData#bt_attr.penetrate_hurt_red, {16, unsigned}),
    AhurtRedIce = prot_util:pack(PackRecordData#bt_attr.ahurt_red_ice, {16, unsigned}),
    AhurtRedFire = prot_util:pack(PackRecordData#bt_attr.ahurt_red_fire, {16, unsigned}),
    AhurtRedDark = prot_util:pack(PackRecordData#bt_attr.ahurt_red_dark, {16, unsigned}),
    AhurtRedPoison = prot_util:pack(PackRecordData#bt_attr.ahurt_red_poison, {16, unsigned}),
    AhurtPercIce = prot_util:pack(PackRecordData#bt_attr.ahurt_perc_ice, {32, unsigned}),
    AhurtPercFire = prot_util:pack(PackRecordData#bt_attr.ahurt_perc_fire, {32, unsigned}),
    AhurtPercDark = prot_util:pack(PackRecordData#bt_attr.ahurt_perc_dark, {32, unsigned}),
    AhurtPercPoison = prot_util:pack(PackRecordData#bt_attr.ahurt_perc_poison, {32, unsigned}),
    AaffectPercIce = prot_util:pack(PackRecordData#bt_attr.aaffect_perc_ice, {32, unsigned}),
    AaffectPercFire = prot_util:pack(PackRecordData#bt_attr.aaffect_perc_fire, {32, unsigned}),
    AaffectPercDark = prot_util:pack(PackRecordData#bt_attr.aaffect_perc_dark, {32, unsigned}),
    AaffectPercPoison = prot_util:pack(PackRecordData#bt_attr.aaffect_perc_poison, {32, unsigned}),

    BinData = <<
        HpLim/binary,
        HpRec/binary,
        MpLim/binary,
        MpRec/binary,
        OuterAtt/binary,
        InnerAtt/binary,
        OuterDef/binary,
        InnerDef/binary,
        Hit/binary,
        Dodge/binary,
        CritHurt/binary,
        CritDef/binary,
        AttSpeed/binary,
        MoveSpeed/binary,
        IgndefHurt/binary,
        IgndefDef/binary,
        HurtAdd/binary,
        HurtRed/binary,
        CritAdd/binary,
        CritRed/binary,
        AattIce/binary,
        AattFire/binary,
        AattDark/binary,
        AattPoison/binary,
        AdefIce/binary,
        AdefFire/binary,
        AdefDark/binary,
        AdefPoison/binary,
        AdefRedIce/binary,
        AdefRedFire/binary,
        AdefRedDark/binary,
        AdefRedPoison/binary,
        AdefMinIce/binary,
        AdefMinFire/binary,
        AdefMinDark/binary,
        AdefMinPoison/binary,
        AhurtAddIce/binary,
        AhurtAddFire/binary,
        AhurtAddDark/binary,
        AhurtAddPoison/binary,
        AhurtAdd/binary,
        AhurtRed/binary,
        PenetrateAtt/binary,
        PenetrateDef/binary,
        PenetrateCrit/binary,
        PenetrateCritDef/binary,
        PenetrateSpeed/binary,
        PenetrateHurtAdd/binary,
        PenetrateHurtRed/binary,
        AhurtRedIce/binary,
        AhurtRedFire/binary,
        AhurtRedDark/binary,
        AhurtRedPoison/binary,
        AhurtPercIce/binary,
        AhurtPercFire/binary,
        AhurtPercDark/binary,
        AhurtPercPoison/binary,
        AaffectPercIce/binary,
        AaffectPercFire/binary,
        AaffectPercDark/binary,
        AaffectPercPoison/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(ud_defer, PackRecordData) ->
    DeferType = prot_util:pack(PackRecordData#ud_defer.defer_type, {8, unsigned}),
    DeferId = prot_util:pack(PackRecordData#ud_defer.defer_id, {64, unsigned}),
    DeferX = prot_util:pack(PackRecordData#ud_defer.defer_x, {16, unsigned}),
    DeferY = prot_util:pack(PackRecordData#ud_defer.defer_y, {16, unsigned}),
    DeferHp = prot_util:pack(PackRecordData#ud_defer.defer_hp, {32, unsigned}),
    HurtSeq = prot_util:pack(PackRecordData#ud_defer.hurt_seq, [{{8, unsigned}, {32, signed}}]),

    BinData = <<
        DeferType/binary,
        DeferId/binary,
        DeferX/binary,
        DeferY/binary,
        DeferHp/binary,
        HurtSeq/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_mail_goods, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#clt_mail_goods.type, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#clt_mail_goods.id, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#clt_mail_goods.num, {32, unsigned}),
    Bind = prot_util:pack(PackRecordData#clt_mail_goods.bind, {8, unsigned}),

    BinData = <<
        Type/binary,
        Id/binary,
        Num/binary,
        Bind/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_mail_goods_list, PackRecordData) ->
    List = prot_util:pack(PackRecordData#clt_mail_goods_list.list, [{u,clt_mail_goods}]),

    BinData = <<
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_artifact, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_artifact.id, {32, unsigned}),
    CurAvatar = prot_util:pack(PackRecordData#clt_artifact.cur_avatar, {32, unsigned}),
    Avatars = prot_util:pack(PackRecordData#clt_artifact.avatars, [{32, unsigned}]),
    CombatPower = prot_util:pack(PackRecordData#clt_artifact.combat_power, {32, unsigned}),
    Stren = prot_util:pack(PackRecordData#clt_artifact.stren, {8, unsigned}),
    Stones = prot_util:pack(PackRecordData#clt_artifact.stones, [{{8, unsigned}, {32, unsigned}}]),
    ExtraAttr = prot_util:pack(PackRecordData#clt_artifact.extra_attr, [{{16, unsigned}, {32, unsigned}}]),

    BinData = <<
        Id/binary,
        CurAvatar/binary,
        Avatars/binary,
        CombatPower/binary,
        Stren/binary,
        Stones/binary,
        ExtraAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_anqi, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_anqi.id, {32, unsigned}),
    QLevel = prot_util:pack(PackRecordData#clt_anqi.q_level, {32, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#clt_anqi.combat_power, {32, unsigned}),
    Stren = prot_util:pack(PackRecordData#clt_anqi.stren, {8, unsigned}),
    Stones = prot_util:pack(PackRecordData#clt_anqi.stones, [{{8, unsigned}, {32, unsigned}}]),
    PracticeLv = prot_util:pack(PackRecordData#clt_anqi.practice_lv, {8, unsigned}),
    OriginAttr = prot_util:pack(PackRecordData#clt_anqi.origin_attr, [{{16, unsigned}, {32, unsigned}}]),
    AddAttr = prot_util:pack(PackRecordData#clt_anqi.add_attr, [{{16, unsigned}, {32, unsigned}}]),
    PoisonSlots = prot_util:pack(PackRecordData#clt_anqi.poison_slots, [{u,anqi_poison_slot}]),

    BinData = <<
        Id/binary,
        QLevel/binary,
        CombatPower/binary,
        Stren/binary,
        Stones/binary,
        PracticeLv/binary,
        OriginAttr/binary,
        AddAttr/binary,
        PoisonSlots/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(warrior_soul_view, PackRecordData) ->
    Lv = prot_util:pack(PackRecordData#warrior_soul_view.lv, {8, unsigned}),
    StarLv = prot_util:pack(PackRecordData#warrior_soul_view.star_lv, {8, unsigned}),
    Stren = prot_util:pack(PackRecordData#warrior_soul_view.stren, {8, unsigned}),
    Stones = prot_util:pack(PackRecordData#warrior_soul_view.stones, [{{8, unsigned}, {32, unsigned}}]),
    CombatPower = prot_util:pack(PackRecordData#warrior_soul_view.combat_power, {32, unsigned}),
    SoulParts = prot_util:pack(PackRecordData#warrior_soul_view.soul_parts, [{u,soul_part_info}]),
    Skills = prot_util:pack(PackRecordData#warrior_soul_view.skills, [{32, unsigned}]),
    CurAvatar = prot_util:pack(PackRecordData#warrior_soul_view.cur_avatar, {32, unsigned}),

    BinData = <<
        Lv/binary,
        StarLv/binary,
        Stren/binary,
        Stones/binary,
        CombatPower/binary,
        SoulParts/binary,
        Skills/binary,
        CurAvatar/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_role_view, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_role_view.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_role_view.name, string),
    ServerNum = prot_util:pack(PackRecordData#clt_role_view.server_num, {32, unsigned}),
    ServerId = prot_util:pack(PackRecordData#clt_role_view.server_id, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_role_view.level, {16, unsigned}),
    Career = prot_util:pack(PackRecordData#clt_role_view.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#clt_role_view.gender, {8, unsigned}),
    Icon = prot_util:pack(PackRecordData#clt_role_view.icon, {8, unsigned}),
    Hair = prot_util:pack(PackRecordData#clt_role_view.hair, {32, unsigned}),
    Frame = prot_util:pack(PackRecordData#clt_role_view.frame, {16, unsigned}),
    Bubble = prot_util:pack(PackRecordData#clt_role_view.bubble, {16, unsigned}),
    Fashion = prot_util:pack(PackRecordData#clt_role_view.fashion, {32, unsigned}),
    Title = prot_util:pack(PackRecordData#clt_role_view.title, {16, unsigned}),
    TitleHonor = prot_util:pack(PackRecordData#clt_role_view.title_honor, {32, unsigned}),
    SceneId = prot_util:pack(PackRecordData#clt_role_view.scene_id, {32, unsigned}),
    Offline = prot_util:pack(PackRecordData#clt_role_view.offline, {32, unsigned}),
    GuildName = prot_util:pack(PackRecordData#clt_role_view.guild_name, string),
    MateName = prot_util:pack(PackRecordData#clt_role_view.mate_name, string),
    Stat = prot_util:pack(PackRecordData#clt_role_view.stat, {8, unsigned}),
    TeamId = prot_util:pack(PackRecordData#clt_role_view.team_id, {64, unsigned}),
    TeamNum = prot_util:pack(PackRecordData#clt_role_view.team_num, {8, unsigned}),
    Introduction = prot_util:pack(PackRecordData#clt_role_view.introduction, string),
    Equips = prot_util:pack(PackRecordData#clt_role_view.equips, [{u,equip_info}]),
    Anqi = prot_util:pack(PackRecordData#clt_role_view.anqi, {u,clt_anqi}),
    Artifact = prot_util:pack(PackRecordData#clt_role_view.artifact, {u,clt_artifact}),
    Dragon = prot_util:pack(PackRecordData#clt_role_view.dragon, {u,dragon_view}),
    WarriorSoul = prot_util:pack(PackRecordData#clt_role_view.warrior_soul, {u,warrior_soul_view}),
    Marriage = prot_util:pack(PackRecordData#clt_role_view.marriage, {u,marry_view}),

    BinData = <<
        Id/binary,
        Name/binary,
        ServerNum/binary,
        ServerId/binary,
        Level/binary,
        Career/binary,
        Gender/binary,
        Icon/binary,
        Hair/binary,
        Frame/binary,
        Bubble/binary,
        Fashion/binary,
        Title/binary,
        TitleHonor/binary,
        SceneId/binary,
        Offline/binary,
        GuildName/binary,
        MateName/binary,
        Stat/binary,
        TeamId/binary,
        TeamNum/binary,
        Introduction/binary,
        Equips/binary,
        Anqi/binary,
        Artifact/binary,
        Dragon/binary,
        WarriorSoul/binary,
        Marriage/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_rank_item, PackRecordData) ->
    Rank = prot_util:pack(PackRecordData#clt_rank_item.rank, {16, unsigned}),
    Id = prot_util:pack(PackRecordData#clt_rank_item.id, {64, unsigned}),
    ServerNum = prot_util:pack(PackRecordData#clt_rank_item.server_num, {32, unsigned}),
    Columns = prot_util:pack(PackRecordData#clt_rank_item.columns, [string]),

    BinData = <<
        Rank/binary,
        Id/binary,
        ServerNum/binary,
        Columns/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_rank_info, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#clt_rank_info.type, {16, unsigned}),
    Page = prot_util:pack(PackRecordData#clt_rank_info.page, {8, unsigned}),
    Total = prot_util:pack(PackRecordData#clt_rank_info.total, {8, unsigned}),
    Items = prot_util:pack(PackRecordData#clt_rank_info.items, [{u,clt_rank_item}]),
    Relative = prot_util:pack(PackRecordData#clt_rank_info.relative, [{u,clt_rank_item}]),

    BinData = <<
        Type/binary,
        Page/binary,
        Total/binary,
        Items/binary,
        Relative/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_title, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_title.id, {32, unsigned}),
    Expire = prot_util:pack(PackRecordData#clt_title.expire, {32, unsigned}),
    Valid = prot_util:pack(PackRecordData#clt_title.valid, {8, unsigned}),

    BinData = <<
        Id/binary,
        Expire/binary,
        Valid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_shop, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_shop.id, {32, unsigned}),
    Items = prot_util:pack(PackRecordData#clt_shop.items, [{u,clt_shop_item}]),

    BinData = <<
        Id/binary,
        Items/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_shop_item, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_shop_item.id, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#clt_shop_item.num, {32, unsigned}),

    BinData = <<
        Id/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_dungeon, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_dungeon.id, {16, unsigned}),
    NowLv = prot_util:pack(PackRecordData#clt_dungeon.now_lv, {16, unsigned}),
    NowWave = prot_util:pack(PackRecordData#clt_dungeon.now_wave, {16, unsigned}),
    MaxLv = prot_util:pack(PackRecordData#clt_dungeon.max_lv, {16, unsigned}),
    MaxWave = prot_util:pack(PackRecordData#clt_dungeon.max_wave, {16, unsigned}),
    MaxLvYday = prot_util:pack(PackRecordData#clt_dungeon.max_lv_yday, {16, unsigned}),
    MaxWaveYday = prot_util:pack(PackRecordData#clt_dungeon.max_wave_yday, {16, unsigned}),
    EnterTimes = prot_util:pack(PackRecordData#clt_dungeon.enter_times, {16, unsigned}),
    ResetTimes = prot_util:pack(PackRecordData#clt_dungeon.reset_times, {8, unsigned}),
    ChalTimes = prot_util:pack(PackRecordData#clt_dungeon.chal_times, {16, unsigned}),
    WipeTimes = prot_util:pack(PackRecordData#clt_dungeon.wipe_times, {16, unsigned}),
    AssistTimes = prot_util:pack(PackRecordData#clt_dungeon.assist_times, {16, unsigned}),
    DailyHis = prot_util:pack(PackRecordData#clt_dungeon.daily_his, [{{16, unsigned}, {8, unsigned}}]),
    DailyWipe = prot_util:pack(PackRecordData#clt_dungeon.daily_wipe, [{{16, unsigned}, {8, unsigned}}]),
    DailyReward = prot_util:pack(PackRecordData#clt_dungeon.daily_reward, [{{16, unsigned}, {8, unsigned}}]),
    LifeHis = prot_util:pack(PackRecordData#clt_dungeon.life_his, [{{16, unsigned}, {8, unsigned}}]),
    StarInfo = prot_util:pack(PackRecordData#clt_dungeon.star_info, [{{16, unsigned}, {8, unsigned}}]),
    ChapterReward = prot_util:pack(PackRecordData#clt_dungeon.chapter_reward, [{{16, unsigned}, {16, unsigned}}]),
    FirstReward = prot_util:pack(PackRecordData#clt_dungeon.first_reward, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Id/binary,
        NowLv/binary,
        NowWave/binary,
        MaxLv/binary,
        MaxWave/binary,
        MaxLvYday/binary,
        MaxWaveYday/binary,
        EnterTimes/binary,
        ResetTimes/binary,
        ChalTimes/binary,
        WipeTimes/binary,
        AssistTimes/binary,
        DailyHis/binary,
        DailyWipe/binary,
        DailyReward/binary,
        LifeHis/binary,
        StarInfo/binary,
        ChapterReward/binary,
        FirstReward/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(pet_poten, PackRecordData) ->
    Power = prot_util:pack(PackRecordData#pet_poten.power, {16, unsigned}),
    Anima = prot_util:pack(PackRecordData#pet_poten.anima, {16, unsigned}),
    Energy = prot_util:pack(PackRecordData#pet_poten.energy, {16, unsigned}),
    Concent = prot_util:pack(PackRecordData#pet_poten.concent, {16, unsigned}),
    Method = prot_util:pack(PackRecordData#pet_poten.method, {16, unsigned}),

    BinData = <<
        Power/binary,
        Anima/binary,
        Energy/binary,
        Concent/binary,
        Method/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_pet, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#clt_pet.grid, {8, unsigned}),
    Cid = prot_util:pack(PackRecordData#clt_pet.cid, {16, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_pet.name, string),
    Stat = prot_util:pack(PackRecordData#clt_pet.stat, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_pet.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#clt_pet.exp, {64, unsigned}),
    Hp = prot_util:pack(PackRecordData#clt_pet.hp, {32, unsigned}),
    Star = prot_util:pack(PackRecordData#clt_pet.star, {8, unsigned}),
    SavvyLv = prot_util:pack(PackRecordData#clt_pet.savvy_lv, {8, unsigned}),
    GrowupLv = prot_util:pack(PackRecordData#clt_pet.growup_lv, {8, unsigned}),
    GrowupRate = prot_util:pack(PackRecordData#clt_pet.growup_rate, {16, unsigned}),
    Awaken = prot_util:pack(PackRecordData#clt_pet.awaken, {8, unsigned}),
    Potential = prot_util:pack(PackRecordData#clt_pet.potential, {u,pet_poten}),
    InitAttr = prot_util:pack(PackRecordData#clt_pet.init_attr, [{{8, unsigned}, {32, unsigned}}]),
    BtAttr = prot_util:pack(PackRecordData#clt_pet.bt_attr, [{{8, unsigned}, {32, unsigned}}]),
    Skills = prot_util:pack(PackRecordData#clt_pet.skills, [{{8, unsigned}, {32, unsigned}, {8, unsigned}}]),
    SellTime = prot_util:pack(PackRecordData#clt_pet.sell_time, {32, unsigned}),
    SellTimes = prot_util:pack(PackRecordData#clt_pet.sell_times, {8, unsigned}),

    BinData = <<
        Grid/binary,
        Cid/binary,
        Name/binary,
        Stat/binary,
        Level/binary,
        Exp/binary,
        Hp/binary,
        Star/binary,
        SavvyLv/binary,
        GrowupLv/binary,
        GrowupRate/binary,
        Awaken/binary,
        Potential/binary,
        InitAttr/binary,
        BtAttr/binary,
        Skills/binary,
        SellTime/binary,
        SellTimes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_dpet, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#clt_dpet.grid, {8, unsigned}),
    Cid = prot_util:pack(PackRecordData#clt_dpet.cid, {16, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_dpet.name, string),
    Level = prot_util:pack(PackRecordData#clt_dpet.level, {8, unsigned}),
    Star = prot_util:pack(PackRecordData#clt_dpet.star, {8, unsigned}),
    SavvyLv = prot_util:pack(PackRecordData#clt_dpet.savvy_lv, {8, unsigned}),
    GrowupLv = prot_util:pack(PackRecordData#clt_dpet.growup_lv, {8, unsigned}),
    GrowupRate = prot_util:pack(PackRecordData#clt_dpet.growup_rate, {16, unsigned}),
    Awaken = prot_util:pack(PackRecordData#clt_dpet.awaken, {8, unsigned}),

    BinData = <<
        Grid/binary,
        Cid/binary,
        Name/binary,
        Level/binary,
        Star/binary,
        SavvyLv/binary,
        GrowupLv/binary,
        GrowupRate/binary,
        Awaken/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_attach, PackRecordData) ->
    AttachId = prot_util:pack(PackRecordData#clt_attach.attach_id, {8, unsigned}),
    PetGrid = prot_util:pack(PackRecordData#clt_attach.pet_grid, {8, unsigned}),
    Internals = prot_util:pack(PackRecordData#clt_attach.internals, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    BtAttr = prot_util:pack(PackRecordData#clt_attach.bt_attr, [{{8, unsigned}, {32, unsigned}}]),
    Fight = prot_util:pack(PackRecordData#clt_attach.fight, {32, unsigned}),

    BinData = <<
        AttachId/binary,
        PetGrid/binary,
        Internals/binary,
        BtAttr/binary,
        Fight/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_guild, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_guild.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_guild.name, string),
    Rank = prot_util:pack(PackRecordData#clt_guild.rank, {16, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_guild.level, {8, unsigned}),
    Funds = prot_util:pack(PackRecordData#clt_guild.funds, {32, unsigned}),
    Fight = prot_util:pack(PackRecordData#clt_guild.fight, {64, unsigned}),
    Announce = prot_util:pack(PackRecordData#clt_guild.announce, string),
    ChiefId = prot_util:pack(PackRecordData#clt_guild.chief_id, {64, unsigned}),
    ChiefName = prot_util:pack(PackRecordData#clt_guild.chief_name, string),
    AcceptType = prot_util:pack(PackRecordData#clt_guild.accept_type, {8, unsigned}),
    AutoAccept = prot_util:pack(PackRecordData#clt_guild.auto_accept, {8, unsigned}),
    Members = prot_util:pack(PackRecordData#clt_guild.members, [{u,clt_guild_member}]),
    DenfState = prot_util:pack(PackRecordData#clt_guild.denf_state, {8, unsigned}),
    PauseDenfTime = prot_util:pack(PackRecordData#clt_guild.pause_denf_time, {32, unsigned}),
    RecentlyLive = prot_util:pack(PackRecordData#clt_guild.recently_live, {32, unsigned}),
    Bonus = prot_util:pack(PackRecordData#clt_guild.bonus, [{{8, unsigned}, {32, unsigned}}]),
    Build = prot_util:pack(PackRecordData#clt_guild.build, [{{16, unsigned}, {8, unsigned}}]),
    Study = prot_util:pack(PackRecordData#clt_guild.study, [{{16, unsigned}, {8, unsigned}}]),
    Battle = prot_util:pack(PackRecordData#clt_guild.battle, {32, unsigned}),
    LuckyMoney = prot_util:pack(PackRecordData#clt_guild.lucky_money, [{u,clt_lucky_money}]),
    Num = prot_util:pack(PackRecordData#clt_guild.num, {32, unsigned}),
    ShDung = prot_util:pack(PackRecordData#clt_guild.sh_dung, [{{8, unsigned}, {8, unsigned}, {8, unsigned}}]),
    ShCurPage = prot_util:pack(PackRecordData#clt_guild.sh_cur_page, {8, unsigned}),
    RecruitTime = prot_util:pack(PackRecordData#clt_guild.recruit_time, {32, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Rank/binary,
        Level/binary,
        Funds/binary,
        Fight/binary,
        Announce/binary,
        ChiefId/binary,
        ChiefName/binary,
        AcceptType/binary,
        AutoAccept/binary,
        Members/binary,
        DenfState/binary,
        PauseDenfTime/binary,
        RecentlyLive/binary,
        Bonus/binary,
        Build/binary,
        Study/binary,
        Battle/binary,
        LuckyMoney/binary,
        Num/binary,
        ShDung/binary,
        ShCurPage/binary,
        RecruitTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_guild_member, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_guild_member.id, {64, unsigned}),
    Pos = prot_util:pack(PackRecordData#clt_guild_member.pos, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_guild_member.name, string),
    Level = prot_util:pack(PackRecordData#clt_guild_member.level, {16, unsigned}),
    Gender = prot_util:pack(PackRecordData#clt_guild_member.gender, {8, unsigned}),
    Fight = prot_util:pack(PackRecordData#clt_guild_member.fight, {32, unsigned}),
    Career = prot_util:pack(PackRecordData#clt_guild_member.career, {8, unsigned}),
    Contri = prot_util:pack(PackRecordData#clt_guild_member.contri, {32, unsigned}),
    VipLv = prot_util:pack(PackRecordData#clt_guild_member.vip_lv, {8, unsigned}),
    Offline = prot_util:pack(PackRecordData#clt_guild_member.offline, {32, unsigned}),
    WeeklyLive = prot_util:pack(PackRecordData#clt_guild_member.weekly_live, {32, unsigned}),
    WeeklyFunds = prot_util:pack(PackRecordData#clt_guild_member.weekly_funds, {32, unsigned}),
    WeeklyCont = prot_util:pack(PackRecordData#clt_guild_member.weekly_cont, {32, unsigned}),
    Icon = prot_util:pack(PackRecordData#clt_guild_member.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#clt_guild_member.frame, {16, unsigned}),

    BinData = <<
        Id/binary,
        Pos/binary,
        Name/binary,
        Level/binary,
        Gender/binary,
        Fight/binary,
        Career/binary,
        Contri/binary,
        VipLv/binary,
        Offline/binary,
        WeeklyLive/binary,
        WeeklyFunds/binary,
        WeeklyCont/binary,
        Icon/binary,
        Frame/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_guild_request, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_guild_request.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_guild_request.name, string),
    Level = prot_util:pack(PackRecordData#clt_guild_request.level, {16, unsigned}),
    Fight = prot_util:pack(PackRecordData#clt_guild_request.fight, {32, unsigned}),
    Frame = prot_util:pack(PackRecordData#clt_guild_request.frame, {16, unsigned}),
    Icon = prot_util:pack(PackRecordData#clt_guild_request.icon, {16, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Level/binary,
        Fight/binary,
        Frame/binary,
        Icon/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_guild_brief, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_guild_brief.id, {64, unsigned}),
    Rank = prot_util:pack(PackRecordData#clt_guild_brief.rank, {16, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_guild_brief.name, string),
    Level = prot_util:pack(PackRecordData#clt_guild_brief.level, {8, unsigned}),
    MemNum = prot_util:pack(PackRecordData#clt_guild_brief.mem_num, {8, unsigned}),
    Fight = prot_util:pack(PackRecordData#clt_guild_brief.fight, {64, unsigned}),
    Apply = prot_util:pack(PackRecordData#clt_guild_brief.apply, {8, unsigned}),
    ChiefName = prot_util:pack(PackRecordData#clt_guild_brief.chief_name, string),
    AcceptType = prot_util:pack(PackRecordData#clt_guild_brief.accept_type, {8, unsigned}),
    AutoAccept = prot_util:pack(PackRecordData#clt_guild_brief.auto_accept, {8, unsigned}),
    DenfState = prot_util:pack(PackRecordData#clt_guild_brief.denf_state, {8, unsigned}),
    MaxNum = prot_util:pack(PackRecordData#clt_guild_brief.max_num, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#clt_guild_brief.num, {32, unsigned}),

    BinData = <<
        Id/binary,
        Rank/binary,
        Name/binary,
        Level/binary,
        MemNum/binary,
        Fight/binary,
        Apply/binary,
        ChiefName/binary,
        AcceptType/binary,
        AutoAccept/binary,
        DenfState/binary,
        MaxNum/binary,
        Num/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_guild_donate, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_guild_donate.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_guild_donate.name, string),
    Contri = prot_util:pack(PackRecordData#clt_guild_donate.contri, {32, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Contri/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(guild_comment_role, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#guild_comment_role.role_id, {64, unsigned}),
    RoleName = prot_util:pack(PackRecordData#guild_comment_role.role_name, string),
    Career = prot_util:pack(PackRecordData#guild_comment_role.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#guild_comment_role.gender, {8, unsigned}),
    LikeNum = prot_util:pack(PackRecordData#guild_comment_role.like_num, {32, unsigned}),
    DislikeNum = prot_util:pack(PackRecordData#guild_comment_role.dislike_num, {32, unsigned}),
    DiceNum = prot_util:pack(PackRecordData#guild_comment_role.dice_num, {8, unsigned}),
    RewardId = prot_util:pack(PackRecordData#guild_comment_role.reward_id, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        RoleName/binary,
        Career/binary,
        Gender/binary,
        LikeNum/binary,
        DislikeNum/binary,
        DiceNum/binary,
        RewardId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_surface, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_surface.id, {8, unsigned}),
    Num = prot_util:pack(PackRecordData#clt_surface.num, {8, unsigned}),
    Fashion = prot_util:pack(PackRecordData#clt_surface.fashion, {16, unsigned}),
    Mount = prot_util:pack(PackRecordData#clt_surface.mount, {16, unsigned}),
    Wing = prot_util:pack(PackRecordData#clt_surface.wing, {16, unsigned}),
    God = prot_util:pack(PackRecordData#clt_surface.god, {16, unsigned}),

    BinData = <<
        Id/binary,
        Num/binary,
        Fashion/binary,
        Mount/binary,
        Wing/binary,
        God/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_hero, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_hero.id, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_hero.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#clt_hero.exp, {16, unsigned}),
    Legend = prot_util:pack(PackRecordData#clt_hero.legend, {8, unsigned}),

    BinData = <<
        Id/binary,
        Level/binary,
        Exp/binary,
        Legend/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_hero_guide, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_hero_guide.id, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_hero_guide.name, string),
    Desc = prot_util:pack(PackRecordData#clt_hero_guide.desc, string),
    Plan = prot_util:pack(PackRecordData#clt_hero_guide.plan, [{{8, unsigned}, {32, unsigned}}]),

    BinData = <<
        Id/binary,
        Name/binary,
        Desc/binary,
        Plan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(wb_guild_rank, PackRecordData) ->
    BossId = prot_util:pack(PackRecordData#wb_guild_rank.boss_id, {32, unsigned}),
    TotalHarm = prot_util:pack(PackRecordData#wb_guild_rank.total_harm, {64, unsigned}),
    BossHpLmt = prot_util:pack(PackRecordData#wb_guild_rank.boss_hp_lmt, {64, unsigned}),
    RankList = prot_util:pack(PackRecordData#wb_guild_rank.rank_list, [{{32, unsigned}, string, {64, unsigned}}]),

    BinData = <<
        BossId/binary,
        TotalHarm/binary,
        BossHpLmt/binary,
        RankList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_dice_val, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#clt_dice_val.role_id, {64, unsigned}),
    RoleName = prot_util:pack(PackRecordData#clt_dice_val.role_name, string),
    Val = prot_util:pack(PackRecordData#clt_dice_val.val, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        RoleName/binary,
        Val/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_team, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_team.id, {64, unsigned}),
    Match = prot_util:pack(PackRecordData#clt_team.match, {8, unsigned}),
    Target = prot_util:pack(PackRecordData#clt_team.target, {16, unsigned}),
    Follow = prot_util:pack(PackRecordData#clt_team.follow, {8, unsigned}),
    Leader = prot_util:pack(PackRecordData#clt_team.leader, {64, unsigned}),
    MinLv = prot_util:pack(PackRecordData#clt_team.min_lv, {16, unsigned}),
    MaxLv = prot_util:pack(PackRecordData#clt_team.max_lv, {16, unsigned}),
    Members = prot_util:pack(PackRecordData#clt_team.members, [{u,clt_team_member}]),
    Robots = prot_util:pack(PackRecordData#clt_team.robots, [{8, unsigned}]),
    MatchBeg = prot_util:pack(PackRecordData#clt_team.match_beg, {32, unsigned}),

    BinData = <<
        Id/binary,
        Match/binary,
        Target/binary,
        Follow/binary,
        Leader/binary,
        MinLv/binary,
        MaxLv/binary,
        Members/binary,
        Robots/binary,
        MatchBeg/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_team_brief, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_team_brief.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_team_brief.name, string),
    Level = prot_util:pack(PackRecordData#clt_team_brief.level, {16, unsigned}),
    Career = prot_util:pack(PackRecordData#clt_team_brief.career, {8, unsigned}),
    Leader = prot_util:pack(PackRecordData#clt_team_brief.leader, {64, unsigned}),
    MemNum = prot_util:pack(PackRecordData#clt_team_brief.mem_num, {8, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Level/binary,
        Career/binary,
        Leader/binary,
        MemNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_team_member, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_team_member.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_team_member.name, string),
    Hp = prot_util:pack(PackRecordData#clt_team_member.hp, {32, unsigned}),
    HpLim = prot_util:pack(PackRecordData#clt_team_member.hp_lim, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_team_member.level, {16, unsigned}),
    State = prot_util:pack(PackRecordData#clt_team_member.state, {8, unsigned}),
    Scene = prot_util:pack(PackRecordData#clt_team_member.scene, {32, unsigned}),
    Line = prot_util:pack(PackRecordData#clt_team_member.line, {64, unsigned}),
    Career = prot_util:pack(PackRecordData#clt_team_member.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#clt_team_member.gender, {8, unsigned}),
    Offline = prot_util:pack(PackRecordData#clt_team_member.offline, {32, unsigned}),
    Icon = prot_util:pack(PackRecordData#clt_team_member.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#clt_team_member.frame, {16, unsigned}),
    Assist = prot_util:pack(PackRecordData#clt_team_member.assist, {8, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Hp/binary,
        HpLim/binary,
        Level/binary,
        State/binary,
        Scene/binary,
        Line/binary,
        Career/binary,
        Gender/binary,
        Offline/binary,
        Icon/binary,
        Frame/binary,
        Assist/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_channel, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_channel.id, {8, unsigned}),
    Hero = prot_util:pack(PackRecordData#clt_channel.hero, {8, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_channel.level, {8, unsigned}),
    Equips = prot_util:pack(PackRecordData#clt_channel.equips, [{{8, unsigned}, {32, unsigned}}]),
    Potentials = prot_util:pack(PackRecordData#clt_channel.potentials, [{{8, unsigned}, {16, unsigned}, {16, unsigned}}]),

    BinData = <<
        Id/binary,
        Hero/binary,
        Level/binary,
        Equips/binary,
        Potentials/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(anqi_skill_plan, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#anqi_skill_plan.index, {8, unsigned}),
    Skill1 = prot_util:pack(PackRecordData#anqi_skill_plan.skill1, {32, unsigned}),
    Skill2 = prot_util:pack(PackRecordData#anqi_skill_plan.skill2, {32, unsigned}),
    Skill3 = prot_util:pack(PackRecordData#anqi_skill_plan.skill3, {32, unsigned}),

    BinData = <<
        Index/binary,
        Skill1/binary,
        Skill2/binary,
        Skill3/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(anqi_poison_slot, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#anqi_poison_slot.index, {8, unsigned}),
    Lv = prot_util:pack(PackRecordData#anqi_poison_slot.lv, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#anqi_poison_slot.exp, {16, unsigned}),
    Attr = prot_util:pack(PackRecordData#anqi_poison_slot.attr, [{{16, unsigned}, {32, unsigned}}]),
    SubAttr = prot_util:pack(PackRecordData#anqi_poison_slot.sub_attr, [{{16, unsigned}, {32, unsigned}}]),

    BinData = <<
        Index/binary,
        Lv/binary,
        Exp/binary,
        Attr/binary,
        SubAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_task, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_task.id, {32, unsigned}),
    Stat = prot_util:pack(PackRecordData#clt_task.stat, {8, unsigned}),
    Masks = prot_util:pack(PackRecordData#clt_task.masks, [{{16, unsigned}, {16, unsigned}}]),

    BinData = <<
        Id/binary,
        Stat/binary,
        Masks/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_market_goods, PackRecordData) ->
    Uid = prot_util:pack(PackRecordData#clt_market_goods.uid, {64, unsigned}),
    Tag = prot_util:pack(PackRecordData#clt_market_goods.tag, {8, unsigned}),
    Id = prot_util:pack(PackRecordData#clt_market_goods.id, {32, unsigned}),
    Num = prot_util:pack(PackRecordData#clt_market_goods.num, {32, unsigned}),
    Stat = prot_util:pack(PackRecordData#clt_market_goods.stat, {8, unsigned}),
    Price = prot_util:pack(PackRecordData#clt_market_goods.price, {32, unsigned}),
    Follower = prot_util:pack(PackRecordData#clt_market_goods.follower, {16, unsigned}),
    EndTime = prot_util:pack(PackRecordData#clt_market_goods.end_time, {32, unsigned}),
    Following = prot_util:pack(PackRecordData#clt_market_goods.following, {8, unsigned}),

    BinData = <<
        Uid/binary,
        Tag/binary,
        Id/binary,
        Num/binary,
        Stat/binary,
        Price/binary,
        Follower/binary,
        EndTime/binary,
        Following/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(friend_info, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#friend_info.id, {64, unsigned}),
    Vip = prot_util:pack(PackRecordData#friend_info.vip, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#friend_info.name, string),
    Level = prot_util:pack(PackRecordData#friend_info.level, {16, unsigned}),
    Fight = prot_util:pack(PackRecordData#friend_info.fight, {32, unsigned}),
    Offline = prot_util:pack(PackRecordData#friend_info.offline, {32, unsigned}),
    Gender = prot_util:pack(PackRecordData#friend_info.gender, {8, unsigned}),
    Career = prot_util:pack(PackRecordData#friend_info.career, {8, unsigned}),
    Icon = prot_util:pack(PackRecordData#friend_info.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#friend_info.frame, {16, unsigned}),
    TeamId = prot_util:pack(PackRecordData#friend_info.team_id, {64, unsigned}),
    TeamNum = prot_util:pack(PackRecordData#friend_info.team_num, {8, unsigned}),
    Guild = prot_util:pack(PackRecordData#friend_info.guild, {64, unsigned}),
    GuildName = prot_util:pack(PackRecordData#friend_info.guild_name, string),
    Scene = prot_util:pack(PackRecordData#friend_info.scene, {32, unsigned}),
    Stat = prot_util:pack(PackRecordData#friend_info.stat, {8, unsigned}),

    BinData = <<
        Id/binary,
        Vip/binary,
        Name/binary,
        Level/binary,
        Fight/binary,
        Offline/binary,
        Gender/binary,
        Career/binary,
        Icon/binary,
        Frame/binary,
        TeamId/binary,
        TeamNum/binary,
        Guild/binary,
        GuildName/binary,
        Scene/binary,
        Stat/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(friend_block, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#friend_block.id, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#friend_block.name, string),
    MemList = prot_util:pack(PackRecordData#friend_block.mem_list, [{64, unsigned}]),

    BinData = <<
        Id/binary,
        Name/binary,
        MemList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(friend_group, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#friend_group.id, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#friend_group.type, {8, unsigned}),
    MaxNum = prot_util:pack(PackRecordData#friend_group.max_num, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#friend_group.name, string),
    Announce = prot_util:pack(PackRecordData#friend_group.announce, string),
    Owner = prot_util:pack(PackRecordData#friend_group.owner, {64, unsigned}),
    MemList = prot_util:pack(PackRecordData#friend_group.mem_list, [{64, unsigned}]),
    ApplyList = prot_util:pack(PackRecordData#friend_group.apply_list, [{64, unsigned}]),

    BinData = <<
        Id/binary,
        Type/binary,
        MaxNum/binary,
        Name/binary,
        Announce/binary,
        Owner/binary,
        MemList/binary,
        ApplyList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(friend_group_simple, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#friend_group_simple.id, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#friend_group_simple.type, {8, unsigned}),
    MaxNum = prot_util:pack(PackRecordData#friend_group_simple.max_num, {8, unsigned}),
    Num = prot_util:pack(PackRecordData#friend_group_simple.num, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#friend_group_simple.name, string),
    Announce = prot_util:pack(PackRecordData#friend_group_simple.announce, string),
    OwnerRole = prot_util:pack(PackRecordData#friend_group_simple.owner_role, {u,clt_chat_role}),

    BinData = <<
        Id/binary,
        Type/binary,
        MaxNum/binary,
        Num/binary,
        Name/binary,
        Announce/binary,
        OwnerRole/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(friend_update_list, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#friend_update_list.type, {8, unsigned}),
    NewList = prot_util:pack(PackRecordData#friend_update_list.new_list, [{64, unsigned}]),

    BinData = <<
        Type/binary,
        NewList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(dund_wipe_drop_info, PackRecordData) ->
    Lv = prot_util:pack(PackRecordData#dund_wipe_drop_info.lv, {16, unsigned}),
    Rewards = prot_util:pack(PackRecordData#dund_wipe_drop_info.rewards, [{{8, unsigned}, {32, unsigned}, {32, unsigned}}]),

    BinData = <<
        Lv/binary,
        Rewards/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_forge_soul, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#clt_forge_soul.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#clt_forge_soul.exp, {16, unsigned}),
    Soul = prot_util:pack(PackRecordData#clt_forge_soul.soul, [{{8, unsigned}, {8, unsigned}}]),

    BinData = <<
        Level/binary,
        Exp/binary,
        Soul/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(battle_lose_log, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#battle_lose_log.id, {8, unsigned}),
    Time = prot_util:pack(PackRecordData#battle_lose_log.time, {32, unsigned}),
    Scene = prot_util:pack(PackRecordData#battle_lose_log.scene, {32, unsigned}),
    WinnerId = prot_util:pack(PackRecordData#battle_lose_log.winner_id, {64, unsigned}),
    WinnerName = prot_util:pack(PackRecordData#battle_lose_log.winner_name, string),

    BinData = <<
        Id/binary,
        Time/binary,
        Scene/binary,
        WinnerId/binary,
        WinnerName/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_lucky_money, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_lucky_money.id, {32, unsigned}),
    Cid = prot_util:pack(PackRecordData#clt_lucky_money.cid, {16, unsigned}),
    Sender = prot_util:pack(PackRecordData#clt_lucky_money.sender, string),
    List = prot_util:pack(PackRecordData#clt_lucky_money.list, [{{16, unsigned}, {64, unsigned}, string, {32, unsigned}}]),
    ExpireTime = prot_util:pack(PackRecordData#clt_lucky_money.expire_time, {32, unsigned}),
    Icon = prot_util:pack(PackRecordData#clt_lucky_money.icon, {32, unsigned}),

    BinData = <<
        Id/binary,
        Cid/binary,
        Sender/binary,
        List/binary,
        ExpireTime/binary,
        Icon/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(conden_soul_result, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#conden_soul_result.index, {8, unsigned}),
    Recommend = prot_util:pack(PackRecordData#conden_soul_result.recommend, {8, unsigned}),
    Alters = prot_util:pack(PackRecordData#conden_soul_result.alters, [{{16, unsigned}, {8, signed}}]),

    BinData = <<
        Index/binary,
        Recommend/binary,
        Alters/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(soul_part_info, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#soul_part_info.type, {8, unsigned}),
    Attr = prot_util:pack(PackRecordData#soul_part_info.attr, [{{16, unsigned}, {32, unsigned}}]),
    CondenRet = prot_util:pack(PackRecordData#soul_part_info.conden_ret, {u,conden_soul_result}),

    BinData = <<
        Type/binary,
        Attr/binary,
        CondenRet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(sworn_member, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sworn_member.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sworn_member.name, string),
    TitleHonor = prot_util:pack(PackRecordData#sworn_member.title_honor, {32, unsigned}),
    Lv = prot_util:pack(PackRecordData#sworn_member.lv, {8, unsigned}),
    Career = prot_util:pack(PackRecordData#sworn_member.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#sworn_member.gender, {8, unsigned}),
    Icon = prot_util:pack(PackRecordData#sworn_member.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#sworn_member.frame, {16, unsigned}),
    Senior = prot_util:pack(PackRecordData#sworn_member.senior, {8, unsigned}),
    Word = prot_util:pack(PackRecordData#sworn_member.word, string),
    Scene = prot_util:pack(PackRecordData#sworn_member.scene, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        TitleHonor/binary,
        Lv/binary,
        Career/binary,
        Gender/binary,
        Icon/binary,
        Frame/binary,
        Senior/binary,
        Word/binary,
        Scene/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(sworn_sort_info, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sworn_sort_info.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sworn_sort_info.name, string),
    Icon = prot_util:pack(PackRecordData#sworn_sort_info.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#sworn_sort_info.frame, {16, unsigned}),
    Senior = prot_util:pack(PackRecordData#sworn_sort_info.senior, {8, unsigned}),
    Votes = prot_util:pack(PackRecordData#sworn_sort_info.votes, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        Icon/binary,
        Frame/binary,
        Senior/binary,
        Votes/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(sworn_person_plat, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sworn_person_plat.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sworn_person_plat.name, string),
    TitleHonor = prot_util:pack(PackRecordData#sworn_person_plat.title_honor, {32, unsigned}),
    Lv = prot_util:pack(PackRecordData#sworn_person_plat.lv, {8, unsigned}),
    Career = prot_util:pack(PackRecordData#sworn_person_plat.career, {8, unsigned}),
    Icon = prot_util:pack(PackRecordData#sworn_person_plat.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#sworn_person_plat.frame, {16, unsigned}),
    GuildName = prot_util:pack(PackRecordData#sworn_person_plat.guild_name, string),
    TendCareer = prot_util:pack(PackRecordData#sworn_person_plat.tend_career, {8, unsigned}),
    TendLv = prot_util:pack(PackRecordData#sworn_person_plat.tend_lv, {8, unsigned}),
    TendTime = prot_util:pack(PackRecordData#sworn_person_plat.tend_time, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        TitleHonor/binary,
        Lv/binary,
        Career/binary,
        Icon/binary,
        Frame/binary,
        GuildName/binary,
        TendCareer/binary,
        TendLv/binary,
        TendTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(sworn_member_simple, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#sworn_member_simple.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#sworn_member_simple.name, string),
    Lv = prot_util:pack(PackRecordData#sworn_member_simple.lv, {8, unsigned}),
    Career = prot_util:pack(PackRecordData#sworn_member_simple.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#sworn_member_simple.gender, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        Lv/binary,
        Career/binary,
        Gender/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(sworn_group_plat, PackRecordData) ->
    GroupId = prot_util:pack(PackRecordData#sworn_group_plat.group_id, {64, unsigned}),
    MemList = prot_util:pack(PackRecordData#sworn_group_plat.mem_list, [{u,sworn_member_simple}]),
    SwornValue = prot_util:pack(PackRecordData#sworn_group_plat.sworn_value, {32, unsigned}),
    TendCareer = prot_util:pack(PackRecordData#sworn_group_plat.tend_career, {8, unsigned}),
    TendLv = prot_util:pack(PackRecordData#sworn_group_plat.tend_lv, {8, unsigned}),
    TendTime = prot_util:pack(PackRecordData#sworn_group_plat.tend_time, {8, unsigned}),

    BinData = <<
        GroupId/binary,
        MemList/binary,
        SwornValue/binary,
        TendCareer/binary,
        TendLv/binary,
        TendTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_deed_list, PackRecordData) ->
    Day = prot_util:pack(PackRecordData#clt_deed_list.day, {8, unsigned}),
    List = prot_util:pack(PackRecordData#clt_deed_list.list, [{{16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Day/binary,
        List/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(mentor_base_info, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#mentor_base_info.role_id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#mentor_base_info.name, string),
    Senior = prot_util:pack(PackRecordData#mentor_base_info.senior, {8, unsigned}),
    Lv = prot_util:pack(PackRecordData#mentor_base_info.lv, {8, unsigned}),
    Career = prot_util:pack(PackRecordData#mentor_base_info.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#mentor_base_info.gender, {8, unsigned}),
    Icon = prot_util:pack(PackRecordData#mentor_base_info.icon, {16, unsigned}),
    Frame = prot_util:pack(PackRecordData#mentor_base_info.frame, {16, unsigned}),
    OfflineTime = prot_util:pack(PackRecordData#mentor_base_info.offline_time, {32, unsigned}),
    Scene = prot_util:pack(PackRecordData#mentor_base_info.scene, {32, unsigned}),
    Morality = prot_util:pack(PackRecordData#mentor_base_info.morality, {32, unsigned}),

    BinData = <<
        RoleId/binary,
        Name/binary,
        Senior/binary,
        Lv/binary,
        Career/binary,
        Gender/binary,
        Icon/binary,
        Frame/binary,
        OfflineTime/binary,
        Scene/binary,
        Morality/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(mentor_tudi_info, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#mentor_tudi_info.role_id, {64, unsigned}),
    Senior = prot_util:pack(PackRecordData#mentor_tudi_info.senior, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#mentor_tudi_info.type, {8, unsigned}),
    Mark = prot_util:pack(PackRecordData#mentor_tudi_info.mark, {16, unsigned}),
    PracticeNum = prot_util:pack(PackRecordData#mentor_tudi_info.practice_num, {8, unsigned}),
    BeginTime = prot_util:pack(PackRecordData#mentor_tudi_info.begin_time, {32, unsigned}),
    Comment = prot_util:pack(PackRecordData#mentor_tudi_info.comment, {8, unsigned}),
    LearnTasks = prot_util:pack(PackRecordData#mentor_tudi_info.learn_tasks, [{{16, unsigned}, {16, unsigned}}]),
    MentorTasks = prot_util:pack(PackRecordData#mentor_tudi_info.mentor_tasks, [{{16, unsigned}, {16, unsigned}}]),
    TaixueTasks = prot_util:pack(PackRecordData#mentor_tudi_info.taixue_tasks, [{{16, unsigned}, {16, unsigned}}]),
    AwardTaken = prot_util:pack(PackRecordData#mentor_tudi_info.award_taken, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Senior/binary,
        Type/binary,
        Mark/binary,
        PracticeNum/binary,
        BeginTime/binary,
        Comment/binary,
        LearnTasks/binary,
        MentorTasks/binary,
        TaixueTasks/binary,
        AwardTaken/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_fight_team, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_fight_team.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_fight_team.name, string),
    Prestige = prot_util:pack(PackRecordData#clt_fight_team.prestige, {16, unsigned}),
    Leader = prot_util:pack(PackRecordData#clt_fight_team.leader, {64, unsigned}),
    Members = prot_util:pack(PackRecordData#clt_fight_team.members, [{u,clt_fight_team_member}]),

    BinData = <<
        Id/binary,
        Name/binary,
        Prestige/binary,
        Leader/binary,
        Members/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_fight_team_member, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#clt_fight_team_member.id, {64, unsigned}),
    Name = prot_util:pack(PackRecordData#clt_fight_team_member.name, string),
    Fight = prot_util:pack(PackRecordData#clt_fight_team_member.fight, {32, unsigned}),
    Level = prot_util:pack(PackRecordData#clt_fight_team_member.level, {16, unsigned}),
    Career = prot_util:pack(PackRecordData#clt_fight_team_member.career, {8, unsigned}),
    Frame = prot_util:pack(PackRecordData#clt_fight_team_member.frame, {16, unsigned}),
    Icon = prot_util:pack(PackRecordData#clt_fight_team_member.icon, {16, unsigned}),
    Prestige = prot_util:pack(PackRecordData#clt_fight_team_member.prestige, {16, unsigned}),

    BinData = <<
        Id/binary,
        Name/binary,
        Fight/binary,
        Level/binary,
        Career/binary,
        Frame/binary,
        Icon/binary,
        Prestige/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(clt_sword_res, PackRecordData) ->
    SvrName = prot_util:pack(PackRecordData#clt_sword_res.svr_name, string),
    FightTeamName = prot_util:pack(PackRecordData#clt_sword_res.fight_team_name, string),
    Members = prot_util:pack(PackRecordData#clt_sword_res.members, [{string, {8, unsigned}, {64, unsigned}, {8, unsigned}}]),

    BinData = <<
        SvrName/binary,
        FightTeamName/binary,
        Members/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

