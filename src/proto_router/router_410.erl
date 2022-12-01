%%-------------------------------------------------------
%% @File     : router_410
%% @Brief    : 珍兽协议组
%% @Author   : cablsbs
%% @Date     : 2018-10-17
%%-------------------------------------------------------

-module(router_410).

-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_410.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
%%  -------------------- 珍兽基础协议 ---------------------------
do(41001, _State, #get_pet_bag_req{}) ->
    PetBag = lib_role_pet:get_pet_bag(),
    {reply, maps:to_list(PetBag)};

% 查看珍兽仓库
do(41003, _State, #get_pet_depot_req{}) ->
    PetDepot = lib_role_pet:get_pet_depot(),
    {reply, maps:to_list(PetDepot)};

% 查看仓库珍兽详细信息
do(41005, State, #get_dpet_detail_req{grid = Grid}) ->
    case lib_role_pet:get_depot_pet(Grid) of
        Pet when is_map(Pet) ->
            CltPet = data_transfer:sc_clt_pet({Grid, Pet}),
            RespRecord = #get_dpet_detail_resp{pet = CltPet},
            {ok, RespBin} = prot_msg:encode_msg(41006, RespRecord),
            lib_role_send:send_to_sid(State#role_state.sid, RespBin);
        _ ->
            ?ERROR_TOC(State#role_state.id, ?RC_PET_NO_SUCH_DPET),
            ok
    end;

% 激活珍兽
do(41007, State, #active_pet{goods_id = Gid}) ->
    case catch lib_role_pet:active_pet_with_gid(State, Gid) of
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok;
        {ok, StateN} ->
            {ok, StateN}
    end;

% 提升悟性
do(41010, State, #upgrade_savvy_req{grid = Grid}) ->
    case catch lib_role_pet:upgrade_savvy(State, Grid) of
        {ok, RetCode, StateN} ->
            {reply, RetCode, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            {reply, ?RC_FAILED}
    end;

% 珍兽放生
do(41012, State, #free_pet_req{grid = Grid}) ->
    case catch lib_role_pet:free_pet(State, Grid) of
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode);
        _ -> skip
    end,
    ok;

% 将珍兽从仓库取出
do(41013, State, #withdraw_pet_req{grid = Grid}) ->
    case catch lib_role_pet:withdraw_pet(State, Grid) of
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode);
        _ -> skip
    end,
    ok;

% 把珍兽存入仓库
do(41014, State, #depot_pet_req{grid = Grid}) ->
    case catch lib_role_pet:depot_pet(State, Grid) of
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode);
        _ -> skip
    end,
    ok;

% 提升成长率等级
do(41015, State, #upgrade_growup_req{grid = Grid}) ->
    case catch lib_role_pet:upgrade_growup(State, Grid) of
        {ok, RetCode, StateN} ->
            {reply, RetCode, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            {reply, ?RC_FAILED}
    end;

% 珍兽继承
do(41016, State, #pet_inherit_req{material = MaterialGrid, target = TargetGrid, type = InheritType}) ->
    case catch lib_role_pet:pet_inherit(State, MaterialGrid, TargetGrid, InheritType) of
        {ok, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 珍兽出战
do(41017, State, #pet_fight_req{grid = PetGrid}) ->
    case catch lib_role_pet:pet_fight(State, PetGrid) of
        ok ->
            {ok, lib_role_attr:refresh_combat_power(State)};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 珍兽休息
do(41018, State, #pet_rest_req{}) ->
    case catch lib_role_pet:pet_rest(State) of
        ok ->
            {ok, lib_role_attr:refresh_combat_power(State)};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;


%%  -------------------- 孵化相关协议 ---------------------------
% 请求孵化信息
do(41021, State, #get_hatch_info_req{}) ->
    lib_role_pet:get_hatch_info(State),
    ok;

% 对话孵化NPC请求
do(41023, State, #hatch_pet_req{type = Type}) ->
    case catch lib_role_pet:hatch_pet_req(State, Type) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end,
    ok;

% 取消孵化请求
do(41025, State, #pet_hatch_cancel{hatch_id = HatchId}) ->
    case catch lib_role_pet:pet_hatch_cancel(State, HatchId) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end,
    ok;

% 选取珍兽宝宝
do(41026, State, #pet_hatch_on{hatch_id = HatchId, pet_grid = Grid}) ->
    case catch lib_role_pet:pet_hatch_on(State, HatchId, Grid) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end,
    ok;

% 取消选取珍兽宝宝
do(41027, State, #pet_hatch_off{hatch_id = HatchId}) ->
    case catch lib_role_pet:pet_hatch_off(State, HatchId) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end,
    ok;

% 锁定珍兽宝宝
do(41028, State, #pet_hatch_lock{hatch_id = HatchId}) ->
    lib_role_pet:pet_hatch_lock(State, HatchId),
    ok;

% 取消锁定珍兽宝宝
do(41029, State, #pet_hatch_unlock{hatch_id = HatchId}) ->
    case catch lib_role_pet:pet_hatch_unlock(State, HatchId) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end,
    ok;

% 开始孵化珍兽宝宝
do(41030, State, #pet_hatch_start{hatch_id = HatchId}) ->
    case catch lib_role_pet:pet_hatch_start(State, HatchId) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end,
    ok;

% 单人孵化
do(41031, State, #pet_hatch_self{hatch_id = HatchId, grids = Grids}) ->
    case catch lib_role_pet:pet_hatch_self(State, HatchId, Grids) of
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok;
        Ret ->
            Ret
    end;

% 获取孵化幸运值
do(41033, State, #get_hatched_lucky_req{}) ->
    lib_role_pet:send_hatched_lucky(State#role_state.sid),
    ok;

% 领取孵化的珍兽
do(41035, State, #get_hatched_pet{hatch_id = HatchId}) ->
    case catch lib_role_pet:get_hatched_pet(State, HatchId) of
        ok -> skip;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end,
    ok;

% 学习技能
do(41041, State, #learn_pet_skill_req{pet_grid = PetGrid, skill_grid = SkillGrid, skill_id = SkillId}) ->
    case catch lib_role_pet:learn_skill(State, PetGrid, SkillGrid, SkillId) of
        {ok, RoleState} ->
            {ok, RoleState};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 移忘技能
do(41042, State, #forget_pet_skill_req{pet_grid = PetGrid, skill_grid = SkillGrid}) ->
    case catch lib_role_pet:forget_skill(State, PetGrid, SkillGrid) of
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok;
        Ret ->
            Ret
    end;

% 升级技能
do(41043, State, #upgrade_pet_skill_req{pet_grid = PetGrid, skill_grid = SkillGrid, stone_num = StoneNum}) ->
    case catch lib_role_pet:upgrade_skill(State, PetGrid, SkillGrid, StoneNum) of
        {ok, RoleState} ->
            {ok, RoleState};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;


% 获取珍兽附体信息
do(41051, State, #get_pet_attach_info_req{}) ->
    lib_role_pet_attach:send_attach_list(State#role_state.sid),
    ok;

% 珍兽附体
do(41053, State, #pet_attach_req{attach_id = AttachId, pet_grid = PetGrid}) ->
    case catch lib_role_pet_attach:pet_attach(State, AttachId, PetGrid) of
        ok ->
            {ok, lib_role_attr:refresh_combat_power(State)};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode), ok
    end;

% 珍兽取消附体
do(41054, State, #pet_unattach_req{attach_id = AttachId}) ->
    case catch lib_role_pet_attach:pet_unattach(State, AttachId) of
        ok ->
            {ok, lib_role_attr:refresh_combat_power(State)};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode), ok
    end;

% 装配内丹
do(41055, State, #puton_internal_req{attach_id = AttachId, internal_grid = InternalGrid, internal = Internal}) ->
    case catch lib_role_pet_attach:puton_internal(State, AttachId, InternalGrid, Internal) of
        {ok, true, StateN} ->
            {ok, lib_role_attr:refresh_combat_power(StateN)};
        {ok, false, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 升级内丹
do(41056, State, #upgrade_internal_req{attach_id = AttachId, internal_grid = InternalGrid}) ->
    case catch lib_role_pet_attach:upgrade_internal(State, AttachId, InternalGrid) of
        {ok, true, StateN} ->
            {ok, lib_role_attr:refresh_combat_power(StateN)};
        {ok, false, StateN} ->
            {ok, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;

% 清除内丹
do(41057, State, #clear_internal_req{attach_id = AttachId, internal_grid = InternalGrid}) ->
    case catch lib_role_pet_attach:clear_internal(State, AttachId, InternalGrid) of
        {ok, true} ->
            {ok, lib_role_attr:refresh_combat_power(State)};
        {ok, false} ->
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            ok
    end;


% 珍兽改名
do(41071, State, #pet_rename_req{grid = PetGrid, name = NameReq}) ->
    case catch lib_role_pet:pet_rename(State, PetGrid, NameReq) of
        ok -> ok;
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end;

% 激活神兽
do(41072, State, #active_god_pet_req{pet_cid = PetCId}) ->
    case catch lib_role_pet:active_god_pet(State, PetCId) of
        {ok, StateN} -> {ok, StateN};
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end;

% 神兽觉醒
do(41073, State, #god_pet_awaken_req{pet_grid = PetGrid}) ->
    case catch lib_role_pet:god_pet_awaken(State, PetGrid) of
        {ok, StateN} -> {ok, StateN};
        {error, RetCode} -> ?ERROR_TOC(State#role_state.id, RetCode)
    end;

%% 处理未定义协议
do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).


response(41001, State, PetList) ->
    CltPetList = data_transfer:sc_clt_pets(PetList),
    RespRecord = #get_pet_bag_resp{pet_list = CltPetList},
    {ok, RespBin} = prot_msg:encode_msg(41002, RespRecord),
    lib_role_send:send_to_sid(State#role_state.sid, RespBin);
response(41003, State, DpetList) ->
    CltDpetList = data_transfer:sc_clt_dpets(DpetList),
    RespRecord = #get_pet_depot_resp{dpet_list = CltDpetList},
    {ok, RespBin} = prot_msg:encode_msg(41004, RespRecord),
    lib_role_send:send_to_sid(State#role_state.sid, RespBin);

response(41010, State, RetCode) ->
    RespRecord = #upgrade_savvy_resp{ret_code = RetCode},
    {ok, RespBin} = prot_msg:encode_msg(41019, RespRecord),
    lib_role_send:send_to_sid(State#role_state.sid, RespBin);
response(41015, State, RetCode) ->
    RespRecord = #upgrade_growup_resp{ret_code = RetCode},
    {ok, RespBin} = prot_msg:encode_msg(41020, RespRecord),
    lib_role_send:send_to_sid(State#role_state.sid, RespBin);

%% 处理协议返回
response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).


%% Privates ---------------------------------------------
