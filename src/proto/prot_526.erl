-module(prot_526).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_526.hrl").


%% ---------------------------------------------------------------------------------------

decode(52601, _BinData) ->

    UnpackRecordData = #cs_anqi_get_info{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52602, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, QLevel} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, CombatPower} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Stren} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Stones} = prot_util:unpack(RBin3, [{{8, unsigned}, {32, unsigned}}]),
    {RBin5, PracticeLv} = prot_util:unpack(RBin4, {8, unsigned}),
    {RBin6, PracticeExp} = prot_util:unpack(RBin5, {32, unsigned}),
    {RBin7, CurPlan} = prot_util:unpack(RBin6, {8, unsigned}),
    {RBin8, EndPlanCdTime} = prot_util:unpack(RBin7, {32, unsigned}),
    {RBin9, SkillPlans} = prot_util:unpack(RBin8, [{u,anqi_skill_plan}]),
    {RBin10, OriginAttr} = prot_util:unpack(RBin9, [{{16, unsigned}, {32, unsigned}}]),
    {RBin11, AddAttr} = prot_util:unpack(RBin10, [{{16, unsigned}, {32, unsigned}}]),
    {_RBin12, PoisonSlots} = prot_util:unpack(RBin11, [{u,anqi_poison_slot}]),

    UnpackRecordData = #sc_anqi_get_info{
        id = Id,
        q_level = QLevel,
        combat_power = CombatPower,
        stren = Stren,
        stones = Stones,
        practice_lv = PracticeLv,
        practice_exp = PracticeExp,
        cur_plan = CurPlan,
        end_plan_cd_time = EndPlanCdTime,
        skill_plans = SkillPlans,
        origin_attr = OriginAttr,
        add_attr = AddAttr,
        poison_slots = PoisonSlots
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52603, _BinData) ->

    UnpackRecordData = #cs_anqi_practice{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52604, BinData) ->
    {RBin0, CombatPower} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, PracticeLv} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, PracticeExp} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, OriginAttr} = prot_util:unpack(RBin2, [{{16, unsigned}, {32, unsigned}}]),
    {_RBin4, AddAttr} = prot_util:unpack(RBin3, [{{16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_anqi_practice{
        combat_power = CombatPower,
        practice_lv = PracticeLv,
        practice_exp = PracticeExp,
        origin_attr = OriginAttr,
        add_attr = AddAttr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52605, _BinData) ->

    UnpackRecordData = #cs_anqi_forge{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52606, BinData) ->
    {RBin0, Id} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, CombatPower} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, OriginAttr} = prot_util:unpack(RBin1, [{{16, unsigned}, {32, unsigned}}]),
    {_RBin3, AddAttr} = prot_util:unpack(RBin2, [{{16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_anqi_forge{
        id = Id,
        combat_power = CombatPower,
        origin_attr = OriginAttr,
        add_attr = AddAttr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52607, _BinData) ->

    UnpackRecordData = #cs_anqi_lv_up{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52608, BinData) ->
    {RBin0, QLevel} = prot_util:unpack(BinData, {32, unsigned}),
    {RBin1, CombatPower} = prot_util:unpack(RBin0, {32, unsigned}),
    {_RBin2, AddAttr} = prot_util:unpack(RBin1, [{{16, unsigned}, {32, unsigned}}]),

    UnpackRecordData = #sc_anqi_lv_up{
        q_level = QLevel,
        combat_power = CombatPower,
        add_attr = AddAttr
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52609, BinData) ->
    {_RBin0, Plan} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_anqi_change_plan{
        plan = Plan
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52610, BinData) ->
    {RBin0, Plan} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, EndPlanCdTime} = prot_util:unpack(RBin0, {32, unsigned}),

    UnpackRecordData = #sc_anqi_change_plan{
        plan = Plan,
        end_plan_cd_time = EndPlanCdTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52611, BinData) ->
    {_RBin0, Plan} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_anqi_unlock_plan{
        plan = Plan
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52612, BinData) ->
    {_RBin0, Plan} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #sc_anqi_unlock_plan{
        plan = Plan
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52613, _BinData) ->

    UnpackRecordData = #cs_anqi_refresh_plan{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52614, BinData) ->
    {_RBin0, SkillPlan} = prot_util:unpack(BinData, {u,anqi_skill_plan}),

    UnpackRecordData = #sc_anqi_refresh_plan{
        skill_plan = SkillPlan
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52615, BinData) ->
    {_RBin0, Plan} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_anqi_replace_plan{
        plan = Plan
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52616, BinData) ->
    {_RBin0, SkillPlan} = prot_util:unpack(BinData, {u,anqi_skill_plan}),

    UnpackRecordData = #sc_anqi_replace_plan{
        skill_plan = SkillPlan
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52617, BinData) ->
    {RBin0, CurPlan} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, SkillPlan} = prot_util:unpack(RBin0, {u,anqi_skill_plan}),

    UnpackRecordData = #sc_anqi_new_plan_update{
        cur_plan = CurPlan,
        skill_plan = SkillPlan
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52618, BinData) ->
    {_RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_anqi_open_poison_slot{
        index = Index
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52619, BinData) ->
    {_RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_anqi_create_poison{
        index = Index
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52620, BinData) ->
    {_RBin0, Index} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #cs_anqi_replace_poison_attr{
        index = Index
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(52621, BinData) ->
    {_RBin0, PoisonSlot} = prot_util:unpack(BinData, {u,anqi_poison_slot}),

    UnpackRecordData = #sc_anqi_poison_slot_update{
        poison_slot = PoisonSlot
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(52601, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52602, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_anqi_get_info.id, {32, unsigned}),
    QLevel = prot_util:pack(PackRecordData#sc_anqi_get_info.q_level, {32, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#sc_anqi_get_info.combat_power, {32, unsigned}),
    Stren = prot_util:pack(PackRecordData#sc_anqi_get_info.stren, {8, unsigned}),
    Stones = prot_util:pack(PackRecordData#sc_anqi_get_info.stones, [{{8, unsigned}, {32, unsigned}}]),
    PracticeLv = prot_util:pack(PackRecordData#sc_anqi_get_info.practice_lv, {8, unsigned}),
    PracticeExp = prot_util:pack(PackRecordData#sc_anqi_get_info.practice_exp, {32, unsigned}),
    CurPlan = prot_util:pack(PackRecordData#sc_anqi_get_info.cur_plan, {8, unsigned}),
    EndPlanCdTime = prot_util:pack(PackRecordData#sc_anqi_get_info.end_plan_cd_time, {32, unsigned}),
    SkillPlans = prot_util:pack(PackRecordData#sc_anqi_get_info.skill_plans, [{u,anqi_skill_plan}]),
    OriginAttr = prot_util:pack(PackRecordData#sc_anqi_get_info.origin_attr, [{{16, unsigned}, {32, unsigned}}]),
    AddAttr = prot_util:pack(PackRecordData#sc_anqi_get_info.add_attr, [{{16, unsigned}, {32, unsigned}}]),
    PoisonSlots = prot_util:pack(PackRecordData#sc_anqi_get_info.poison_slots, [{u,anqi_poison_slot}]),

    BinData = <<
        Id/binary,
        QLevel/binary,
        CombatPower/binary,
        Stren/binary,
        Stones/binary,
        PracticeLv/binary,
        PracticeExp/binary,
        CurPlan/binary,
        EndPlanCdTime/binary,
        SkillPlans/binary,
        OriginAttr/binary,
        AddAttr/binary,
        PoisonSlots/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52603, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52604, PackRecordData) ->
    CombatPower = prot_util:pack(PackRecordData#sc_anqi_practice.combat_power, {32, unsigned}),
    PracticeLv = prot_util:pack(PackRecordData#sc_anqi_practice.practice_lv, {8, unsigned}),
    PracticeExp = prot_util:pack(PackRecordData#sc_anqi_practice.practice_exp, {32, unsigned}),
    OriginAttr = prot_util:pack(PackRecordData#sc_anqi_practice.origin_attr, [{{16, unsigned}, {32, unsigned}}]),
    AddAttr = prot_util:pack(PackRecordData#sc_anqi_practice.add_attr, [{{16, unsigned}, {32, unsigned}}]),

    BinData = <<
        CombatPower/binary,
        PracticeLv/binary,
        PracticeExp/binary,
        OriginAttr/binary,
        AddAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52605, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52606, PackRecordData) ->
    Id = prot_util:pack(PackRecordData#sc_anqi_forge.id, {32, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#sc_anqi_forge.combat_power, {32, unsigned}),
    OriginAttr = prot_util:pack(PackRecordData#sc_anqi_forge.origin_attr, [{{16, unsigned}, {32, unsigned}}]),
    AddAttr = prot_util:pack(PackRecordData#sc_anqi_forge.add_attr, [{{16, unsigned}, {32, unsigned}}]),

    BinData = <<
        Id/binary,
        CombatPower/binary,
        OriginAttr/binary,
        AddAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52607, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52608, PackRecordData) ->
    QLevel = prot_util:pack(PackRecordData#sc_anqi_lv_up.q_level, {32, unsigned}),
    CombatPower = prot_util:pack(PackRecordData#sc_anqi_lv_up.combat_power, {32, unsigned}),
    AddAttr = prot_util:pack(PackRecordData#sc_anqi_lv_up.add_attr, [{{16, unsigned}, {32, unsigned}}]),

    BinData = <<
        QLevel/binary,
        CombatPower/binary,
        AddAttr/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52609, PackRecordData) ->
    Plan = prot_util:pack(PackRecordData#cs_anqi_change_plan.plan, {8, unsigned}),

    BinData = <<
        Plan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52610, PackRecordData) ->
    Plan = prot_util:pack(PackRecordData#sc_anqi_change_plan.plan, {8, unsigned}),
    EndPlanCdTime = prot_util:pack(PackRecordData#sc_anqi_change_plan.end_plan_cd_time, {32, unsigned}),

    BinData = <<
        Plan/binary,
        EndPlanCdTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52611, PackRecordData) ->
    Plan = prot_util:pack(PackRecordData#cs_anqi_unlock_plan.plan, {8, unsigned}),

    BinData = <<
        Plan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52612, PackRecordData) ->
    Plan = prot_util:pack(PackRecordData#sc_anqi_unlock_plan.plan, {8, unsigned}),

    BinData = <<
        Plan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52613, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52614, PackRecordData) ->
    SkillPlan = prot_util:pack(PackRecordData#sc_anqi_refresh_plan.skill_plan, {u,anqi_skill_plan}),

    BinData = <<
        SkillPlan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52615, PackRecordData) ->
    Plan = prot_util:pack(PackRecordData#cs_anqi_replace_plan.plan, {8, unsigned}),

    BinData = <<
        Plan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52616, PackRecordData) ->
    SkillPlan = prot_util:pack(PackRecordData#sc_anqi_replace_plan.skill_plan, {u,anqi_skill_plan}),

    BinData = <<
        SkillPlan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52617, PackRecordData) ->
    CurPlan = prot_util:pack(PackRecordData#sc_anqi_new_plan_update.cur_plan, {8, unsigned}),
    SkillPlan = prot_util:pack(PackRecordData#sc_anqi_new_plan_update.skill_plan, {u,anqi_skill_plan}),

    BinData = <<
        CurPlan/binary,
        SkillPlan/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52618, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#cs_anqi_open_poison_slot.index, {8, unsigned}),

    BinData = <<
        Index/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52619, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#cs_anqi_create_poison.index, {8, unsigned}),

    BinData = <<
        Index/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52620, PackRecordData) ->
    Index = prot_util:pack(PackRecordData#cs_anqi_replace_poison_attr.index, {8, unsigned}),

    BinData = <<
        Index/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(52621, PackRecordData) ->
    PoisonSlot = prot_util:pack(PackRecordData#sc_anqi_poison_slot_update.poison_slot, {u,anqi_poison_slot}),

    BinData = <<
        PoisonSlot/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

