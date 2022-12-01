-module(prot_410).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_410.hrl").


%% ---------------------------------------------------------------------------------------

decode(41001, _BinData) ->

    UnpackRecordData = #get_pet_bag_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41002, BinData) ->
    {_RBin0, PetList} = prot_util:unpack(BinData, [{u,clt_pet}]),

    UnpackRecordData = #get_pet_bag_resp{
        pet_list = PetList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41003, _BinData) ->

    UnpackRecordData = #get_pet_depot_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41004, BinData) ->
    {RBin0, DepotSize} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, DpetList} = prot_util:unpack(RBin0, [{u,clt_dpet}]),

    UnpackRecordData = #get_pet_depot_resp{
        depot_size = DepotSize,
        dpet_list = DpetList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41005, BinData) ->
    {_RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #get_dpet_detail_req{
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41006, BinData) ->
    {_RBin0, Pet} = prot_util:unpack(BinData, {u,clt_pet}),

    UnpackRecordData = #get_dpet_detail_resp{
        pet = Pet
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41007, BinData) ->
    {_RBin0, GoodsId} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #active_pet{
        goods_id = GoodsId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41008, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Pets} = prot_util:unpack(RBin0, [{u,clt_pet}]),

    UnpackRecordData = #notify_pet_change{
        type = Type,
        pets = Pets
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41009, BinData) ->
    {RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Grids} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #notify_del_pet{
        type = Type,
        grids = Grids
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41010, BinData) ->
    {_RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #upgrade_savvy_req{
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41011, BinData) ->
    {_RBin0, Dpets} = prot_util:unpack(BinData, [{u,clt_dpet}]),

    UnpackRecordData = #notify_dpet_change{
        dpets = Dpets
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41012, BinData) ->
    {_RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #free_pet_req{
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41013, BinData) ->
    {_RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #withdraw_pet_req{
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41014, BinData) ->
    {_RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #depot_pet_req{
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41015, BinData) ->
    {_RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #upgrade_growup_req{
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41016, BinData) ->
    {RBin0, Material} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Target} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Type} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #pet_inherit_req{
        material = Material,
        target = Target,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41017, BinData) ->
    {_RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #pet_fight_req{
        grid = Grid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41018, _BinData) ->

    UnpackRecordData = #pet_rest_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41019, BinData) ->
    {_RBin0, RetCode} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #upgrade_savvy_resp{
        ret_code = RetCode
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41020, BinData) ->
    {_RBin0, RetCode} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #upgrade_growup_resp{
        ret_code = RetCode
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41021, _BinData) ->

    UnpackRecordData = #get_hatch_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41022, BinData) ->
    {RBin0, Stat} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, HatchId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, Data} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, Materials} = prot_util:unpack(RBin2, [{{64, unsigned}, {16, unsigned}, {8, unsigned}}]),

    UnpackRecordData = #get_hatch_info_resp{
        stat = Stat,
        hatch_id = HatchId,
        data = Data,
        materials = Materials
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41023, BinData) ->
    {_RBin0, Type} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #hatch_pet_req{
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41024, BinData) ->
    {RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Type} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, PetBabies} = prot_util:unpack(RBin1, [{{64, unsigned}, {8, unsigned}, {16, unsigned}, string, {8, unsigned}, {16, unsigned}}]),

    UnpackRecordData = #sync_pet_hatch_pannel{
        hatch_id = HatchId,
        type = Type,
        pet_babies = PetBabies
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41025, BinData) ->
    {_RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #pet_hatch_cancel{
        hatch_id = HatchId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41026, BinData) ->
    {RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, PetGrid} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #pet_hatch_on{
        hatch_id = HatchId,
        pet_grid = PetGrid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41027, BinData) ->
    {_RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #pet_hatch_off{
        hatch_id = HatchId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41028, BinData) ->
    {_RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #pet_hatch_lock{
        hatch_id = HatchId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41029, BinData) ->
    {_RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #pet_hatch_unlock{
        hatch_id = HatchId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41030, BinData) ->
    {_RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #pet_hatch_start{
        hatch_id = HatchId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41031, BinData) ->
    {RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),
    {_RBin1, Grids} = prot_util:unpack(RBin0, [{8, unsigned}]),

    UnpackRecordData = #pet_hatch_self{
        hatch_id = HatchId,
        grids = Grids
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41033, _BinData) ->

    UnpackRecordData = #get_hatched_lucky_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41034, BinData) ->
    {_RBin0, Lucky} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #get_hatched_lucky_resp{
        lucky = Lucky
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41035, BinData) ->
    {_RBin0, HatchId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #get_hatched_pet{
        hatch_id = HatchId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41041, BinData) ->
    {RBin0, PetGrid} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, SkillGrid} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, SkillId} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #learn_pet_skill_req{
        pet_grid = PetGrid,
        skill_grid = SkillGrid,
        skill_id = SkillId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41042, BinData) ->
    {RBin0, PetGrid} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, SkillGrid} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #forget_pet_skill_req{
        pet_grid = PetGrid,
        skill_grid = SkillGrid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41043, BinData) ->
    {RBin0, PetGrid} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, SkillGrid} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, StoneNum} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #upgrade_pet_skill_req{
        pet_grid = PetGrid,
        skill_grid = SkillGrid,
        stone_num = StoneNum
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41051, _BinData) ->

    UnpackRecordData = #get_pet_attach_info_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41052, BinData) ->
    {_RBin0, AttachList} = prot_util:unpack(BinData, [{u,clt_attach}]),

    UnpackRecordData = #get_pet_attach_info_resp{
        attach_list = AttachList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41053, BinData) ->
    {RBin0, AttachId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, PetGrid} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #pet_attach_req{
        attach_id = AttachId,
        pet_grid = PetGrid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41054, BinData) ->
    {_RBin0, AttachId} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #pet_unattach_req{
        attach_id = AttachId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41055, BinData) ->
    {RBin0, AttachId} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, InternalGrid} = prot_util:unpack(RBin0, {8, unsigned}),
    {_RBin2, Internal} = prot_util:unpack(RBin1, {8, unsigned}),

    UnpackRecordData = #puton_internal_req{
        attach_id = AttachId,
        internal_grid = InternalGrid,
        internal = Internal
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41056, BinData) ->
    {RBin0, AttachId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, InternalGrid} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #upgrade_internal_req{
        attach_id = AttachId,
        internal_grid = InternalGrid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41057, BinData) ->
    {RBin0, AttachId} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, InternalGrid} = prot_util:unpack(RBin0, {8, unsigned}),

    UnpackRecordData = #clear_internal_req{
        attach_id = AttachId,
        internal_grid = InternalGrid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41058, BinData) ->
    {_RBin0, Attach} = prot_util:unpack(BinData, {u,clt_attach}),

    UnpackRecordData = #notify_attach_change{
        attach = Attach
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41071, BinData) ->
    {RBin0, Grid} = prot_util:unpack(BinData, {8, unsigned}),
    {_RBin1, Name} = prot_util:unpack(RBin0, string),

    UnpackRecordData = #pet_rename_req{
        grid = Grid,
        name = Name
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41072, BinData) ->
    {_RBin0, PetCid} = prot_util:unpack(BinData, {16, unsigned}),

    UnpackRecordData = #active_god_pet_req{
        pet_cid = PetCid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41073, BinData) ->
    {_RBin0, PetGrid} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #god_pet_awaken_req{
        pet_grid = PetGrid
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(41074, BinData) ->
    {RBin0, Level} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, Exp} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, DlExp} = prot_util:unpack(RBin1, {32, unsigned}),
    {_RBin3, AddExp} = prot_util:unpack(RBin2, {64, unsigned}),

    UnpackRecordData = #notify_fight_pet_level_exp{
        level = Level,
        exp = Exp,
        dl_exp = DlExp,
        add_exp = AddExp
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(41001, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41002, PackRecordData) ->
    PetList = prot_util:pack(PackRecordData#get_pet_bag_resp.pet_list, [{u,clt_pet}]),

    BinData = <<
        PetList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41003, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41004, PackRecordData) ->
    DepotSize = prot_util:pack(PackRecordData#get_pet_depot_resp.depot_size, {8, unsigned}),
    DpetList = prot_util:pack(PackRecordData#get_pet_depot_resp.dpet_list, [{u,clt_dpet}]),

    BinData = <<
        DepotSize/binary,
        DpetList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41005, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#get_dpet_detail_req.grid, {8, unsigned}),

    BinData = <<
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41006, PackRecordData) ->
    Pet = prot_util:pack(PackRecordData#get_dpet_detail_resp.pet, {u,clt_pet}),

    BinData = <<
        Pet/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41007, PackRecordData) ->
    GoodsId = prot_util:pack(PackRecordData#active_pet.goods_id, {32, unsigned}),

    BinData = <<
        GoodsId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41008, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#notify_pet_change.type, {8, unsigned}),
    Pets = prot_util:pack(PackRecordData#notify_pet_change.pets, [{u,clt_pet}]),

    BinData = <<
        Type/binary,
        Pets/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41009, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#notify_del_pet.type, {8, unsigned}),
    Grids = prot_util:pack(PackRecordData#notify_del_pet.grids, [{8, unsigned}]),

    BinData = <<
        Type/binary,
        Grids/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41010, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#upgrade_savvy_req.grid, {8, unsigned}),

    BinData = <<
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41011, PackRecordData) ->
    Dpets = prot_util:pack(PackRecordData#notify_dpet_change.dpets, [{u,clt_dpet}]),

    BinData = <<
        Dpets/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41012, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#free_pet_req.grid, {8, unsigned}),

    BinData = <<
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41013, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#withdraw_pet_req.grid, {8, unsigned}),

    BinData = <<
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41014, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#depot_pet_req.grid, {8, unsigned}),

    BinData = <<
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41015, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#upgrade_growup_req.grid, {8, unsigned}),

    BinData = <<
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41016, PackRecordData) ->
    Material = prot_util:pack(PackRecordData#pet_inherit_req.material, {8, unsigned}),
    Target = prot_util:pack(PackRecordData#pet_inherit_req.target, {8, unsigned}),
    Type = prot_util:pack(PackRecordData#pet_inherit_req.type, {8, unsigned}),

    BinData = <<
        Material/binary,
        Target/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41017, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#pet_fight_req.grid, {8, unsigned}),

    BinData = <<
        Grid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41018, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41019, PackRecordData) ->
    RetCode = prot_util:pack(PackRecordData#upgrade_savvy_resp.ret_code, {8, unsigned}),

    BinData = <<
        RetCode/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41020, PackRecordData) ->
    RetCode = prot_util:pack(PackRecordData#upgrade_growup_resp.ret_code, {8, unsigned}),

    BinData = <<
        RetCode/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41021, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41022, PackRecordData) ->
    Stat = prot_util:pack(PackRecordData#get_hatch_info_resp.stat, {8, unsigned}),
    HatchId = prot_util:pack(PackRecordData#get_hatch_info_resp.hatch_id, {64, unsigned}),
    Data = prot_util:pack(PackRecordData#get_hatch_info_resp.data, {32, unsigned}),
    Materials = prot_util:pack(PackRecordData#get_hatch_info_resp.materials, [{{64, unsigned}, {16, unsigned}, {8, unsigned}}]),

    BinData = <<
        Stat/binary,
        HatchId/binary,
        Data/binary,
        Materials/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41023, PackRecordData) ->
    Type = prot_util:pack(PackRecordData#hatch_pet_req.type, {8, unsigned}),

    BinData = <<
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41024, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#sync_pet_hatch_pannel.hatch_id, {64, unsigned}),
    Type = prot_util:pack(PackRecordData#sync_pet_hatch_pannel.type, {8, unsigned}),
    PetBabies = prot_util:pack(PackRecordData#sync_pet_hatch_pannel.pet_babies, [{{64, unsigned}, {8, unsigned}, {16, unsigned}, string, {8, unsigned}, {16, unsigned}}]),

    BinData = <<
        HatchId/binary,
        Type/binary,
        PetBabies/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41025, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#pet_hatch_cancel.hatch_id, {64, unsigned}),

    BinData = <<
        HatchId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41026, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#pet_hatch_on.hatch_id, {64, unsigned}),
    PetGrid = prot_util:pack(PackRecordData#pet_hatch_on.pet_grid, {8, unsigned}),

    BinData = <<
        HatchId/binary,
        PetGrid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41027, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#pet_hatch_off.hatch_id, {64, unsigned}),

    BinData = <<
        HatchId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41028, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#pet_hatch_lock.hatch_id, {64, unsigned}),

    BinData = <<
        HatchId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41029, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#pet_hatch_unlock.hatch_id, {64, unsigned}),

    BinData = <<
        HatchId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41030, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#pet_hatch_start.hatch_id, {64, unsigned}),

    BinData = <<
        HatchId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41031, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#pet_hatch_self.hatch_id, {64, unsigned}),
    Grids = prot_util:pack(PackRecordData#pet_hatch_self.grids, [{8, unsigned}]),

    BinData = <<
        HatchId/binary,
        Grids/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41033, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41034, PackRecordData) ->
    Lucky = prot_util:pack(PackRecordData#get_hatched_lucky_resp.lucky, {16, unsigned}),

    BinData = <<
        Lucky/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41035, PackRecordData) ->
    HatchId = prot_util:pack(PackRecordData#get_hatched_pet.hatch_id, {64, unsigned}),

    BinData = <<
        HatchId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41041, PackRecordData) ->
    PetGrid = prot_util:pack(PackRecordData#learn_pet_skill_req.pet_grid, {8, unsigned}),
    SkillGrid = prot_util:pack(PackRecordData#learn_pet_skill_req.skill_grid, {8, unsigned}),
    SkillId = prot_util:pack(PackRecordData#learn_pet_skill_req.skill_id, {32, unsigned}),

    BinData = <<
        PetGrid/binary,
        SkillGrid/binary,
        SkillId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41042, PackRecordData) ->
    PetGrid = prot_util:pack(PackRecordData#forget_pet_skill_req.pet_grid, {8, unsigned}),
    SkillGrid = prot_util:pack(PackRecordData#forget_pet_skill_req.skill_grid, {8, unsigned}),

    BinData = <<
        PetGrid/binary,
        SkillGrid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41043, PackRecordData) ->
    PetGrid = prot_util:pack(PackRecordData#upgrade_pet_skill_req.pet_grid, {8, unsigned}),
    SkillGrid = prot_util:pack(PackRecordData#upgrade_pet_skill_req.skill_grid, {8, unsigned}),
    StoneNum = prot_util:pack(PackRecordData#upgrade_pet_skill_req.stone_num, {8, unsigned}),

    BinData = <<
        PetGrid/binary,
        SkillGrid/binary,
        StoneNum/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41051, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41052, PackRecordData) ->
    AttachList = prot_util:pack(PackRecordData#get_pet_attach_info_resp.attach_list, [{u,clt_attach}]),

    BinData = <<
        AttachList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41053, PackRecordData) ->
    AttachId = prot_util:pack(PackRecordData#pet_attach_req.attach_id, {8, unsigned}),
    PetGrid = prot_util:pack(PackRecordData#pet_attach_req.pet_grid, {8, unsigned}),

    BinData = <<
        AttachId/binary,
        PetGrid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41054, PackRecordData) ->
    AttachId = prot_util:pack(PackRecordData#pet_unattach_req.attach_id, {8, unsigned}),

    BinData = <<
        AttachId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41055, PackRecordData) ->
    AttachId = prot_util:pack(PackRecordData#puton_internal_req.attach_id, {8, unsigned}),
    InternalGrid = prot_util:pack(PackRecordData#puton_internal_req.internal_grid, {8, unsigned}),
    Internal = prot_util:pack(PackRecordData#puton_internal_req.internal, {8, unsigned}),

    BinData = <<
        AttachId/binary,
        InternalGrid/binary,
        Internal/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41056, PackRecordData) ->
    AttachId = prot_util:pack(PackRecordData#upgrade_internal_req.attach_id, {8, unsigned}),
    InternalGrid = prot_util:pack(PackRecordData#upgrade_internal_req.internal_grid, {8, unsigned}),

    BinData = <<
        AttachId/binary,
        InternalGrid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41057, PackRecordData) ->
    AttachId = prot_util:pack(PackRecordData#clear_internal_req.attach_id, {8, unsigned}),
    InternalGrid = prot_util:pack(PackRecordData#clear_internal_req.internal_grid, {8, unsigned}),

    BinData = <<
        AttachId/binary,
        InternalGrid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41058, PackRecordData) ->
    Attach = prot_util:pack(PackRecordData#notify_attach_change.attach, {u,clt_attach}),

    BinData = <<
        Attach/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41071, PackRecordData) ->
    Grid = prot_util:pack(PackRecordData#pet_rename_req.grid, {8, unsigned}),
    Name = prot_util:pack(PackRecordData#pet_rename_req.name, string),

    BinData = <<
        Grid/binary,
        Name/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41072, PackRecordData) ->
    PetCid = prot_util:pack(PackRecordData#active_god_pet_req.pet_cid, {16, unsigned}),

    BinData = <<
        PetCid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41073, PackRecordData) ->
    PetGrid = prot_util:pack(PackRecordData#god_pet_awaken_req.pet_grid, {8, unsigned}),

    BinData = <<
        PetGrid/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(41074, PackRecordData) ->
    Level = prot_util:pack(PackRecordData#notify_fight_pet_level_exp.level, {8, unsigned}),
    Exp = prot_util:pack(PackRecordData#notify_fight_pet_level_exp.exp, {64, unsigned}),
    DlExp = prot_util:pack(PackRecordData#notify_fight_pet_level_exp.dl_exp, {32, unsigned}),
    AddExp = prot_util:pack(PackRecordData#notify_fight_pet_level_exp.add_exp, {64, unsigned}),

    BinData = <<
        Level/binary,
        Exp/binary,
        DlExp/binary,
        AddExp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

