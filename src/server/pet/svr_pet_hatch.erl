%%-------------------------------------------------------
%% @File     : svr_pet_hatch
%% @Brief    : 珍兽孵化服务
%% @Author   : cablsbs
%% @Date     : 2018-11-3
%%-------------------------------------------------------
-module(svr_pet_hatch).

-include("pet.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("generator.hrl").
-include("proto/prot_410.hrl").

-behaviour(gen_server).

-export([
    start_link/0,
    permanent/0,
    role_login/1,
    role_logout/1
]).

-export([
    get_hatch_info/1,
    book_hatch/2,
    pet_hatch_cancel/2,
    pet_hatch_on/3,
    pet_hatch_off/2,
    pet_hatch_lock/2,
    pet_hatch_unlock/2,
    pet_hatch_start/2,
    pet_hatch_self/3,
    get_hatched_pet/2,
    role_delete/1
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

% 待孵化数据
-record(hatch_book, {
    hatch_id = 0,
    type = ?HATCH_TEAM,
    owner_id = 0,
    pet_babies = []         % [{RoleId, IsLock, #pet{}}]
}).

% 孵化格子
-record(hatch_slot, {
    role_id = 0,
    cid = 0,
    growup_lv = 0
}).

% 孵化记录
-record(hatch_rec, {
    hatch_id = 0,
    slots = [],
    growup_lv_sum = 0,
    growup_rate_sum = 0,
    finish_time = 0
}).

-record(svr_pet_hatch, {
    base_offset = 0,
    auto_id = 0,
    check_ref = undefined
}).


%% Apis -------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

permanent() ->
    gen_server:call(?MODULE, 'permanent').

role_login(RoleId) ->
    gen_server:cast(?MODULE, {'role_login', RoleId}).

role_logout(RoleId) ->
    gen_server:cast(?MODULE, {'role_logout', RoleId}).

get_hatch_info(RoleId) ->
    gen_server:cast(?MODULE, {'get_hatch_info', RoleId}).

book_hatch(Type, RoleIds) ->
    gen_server:cast(?MODULE, {'book_hatch', Type, RoleIds}).

pet_hatch_cancel(HatchId, RoleId) ->
    gen_server:cast(?MODULE, {'pet_hatch_cancel', HatchId, RoleId}).

pet_hatch_on(HatchId, RoleId, Pet) ->
    gen_server:cast(?MODULE, {'pet_hatch_on', HatchId, RoleId, Pet}).

pet_hatch_off(HatchId, RoleId) ->
    gen_server:cast(?MODULE, {'pet_hatch_off', HatchId, RoleId}).

pet_hatch_lock(HatchId, RoleId) ->
    gen_server:cast(?MODULE, {'pet_hatch_lock', HatchId, RoleId}).

pet_hatch_unlock(HatchId, RoleId) ->
    gen_server:cast(?MODULE, {'pet_hatch_unlock', HatchId, RoleId}).

pet_hatch_start(HatchId, RoleId) ->
    gen_server:cast(?MODULE, {'pet_hatch_start', HatchId, RoleId}).

pet_hatch_self(HatchId, RoleId, Pets) ->
    gen_server:cast(?MODULE, {'pet_hatch_self', HatchId, RoleId, Pets}).

get_hatched_pet(HatchId, RoleId) ->
    gen_server:cast(?MODULE, {'get_hatched_pet', HatchId, RoleId}).

role_delete(RoleIds) ->
    gen_server:cast(?MODULE, {'role_delete', RoleIds}).
%% Callbacks --------------------------------------------
init([]) ->
    erlang:process_flag(trap_exit, true),
    dictionary_init(),
    TimeStamp = time:unixtime(),
    ServerNum = config:get_server_num(),
    TimeOffset = TimeStamp bsl ?TIMESTAMP_OFFSET,
    Offset = ServerNum bsl ?SERVER_NUM_OFFSET + TimeOffset,
    Ref = start_interval_check(),
    {ok, #svr_pet_hatch{base_offset = Offset, check_ref = Ref}}.

% 停服保存
handle_call('permanent', _From, State) ->
    do_permanent(),
    {reply, ok, State};

% 默认匹配
handle_call(Req, _From, State) ->
    ?ERROR("Recv unexpected call request: ~p", [Req]),
    {reply, undefined, State}.

% 角色 删除/返还待孵化
handle_cast({'role_login', RoleId}, State) ->
    RoleHatchMap = get_role_hatch(),
    case maps:get(RoleId, RoleHatchMap, undefined) of
        undefined -> lib_role:mod_info(RoleId, lib_role_pet, 'return_hatched_pet');
        _ -> lib_role:mod_info(RoleId, lib_role_pet, 'del_hatched_pet')
    end,
    {noreply, State};

% 角色登出(取消尚未开始的孵化)
handle_cast({'role_logout', RoleId}, State) ->
    RoleHatchMap = get_role_hatch(),
    case maps:get(RoleId, RoleHatchMap, undefined) of
        {HatchId, ?HATCH_ST_BOOKED} ->
            do_cancel_hatch(HatchId, RoleId);
        _ ->
            skip
    end,
    {noreply, State};

% 查询孵化信息
handle_cast({'get_hatch_info', RoleId}, State) ->
    RoleHatchMap = get_role_hatch(),
    SyncMsg = case maps:get(RoleId, RoleHatchMap, undefined) of
        {HatchId, ?HATCH_ST_ING} ->
            HatchingList = get_hatch_list(),
            HatchRec = util:list_find(HatchId, #hatch_rec.hatch_id, HatchingList, #hatch_rec{}),
            Materials = [{RId, CId, GLv} || #hatch_slot{role_id = RId, cid = CId, growup_lv = GLv} <- HatchRec#hatch_rec.slots],
            #get_hatch_info_resp{stat = ?HATCH_ST_ING, hatch_id = HatchId, data = HatchRec#hatch_rec.finish_time, materials = Materials};
        {HatchId, ?HATCH_ST_FINISH} ->
            FinishedMap = get_hatch_finished(),
            HatchRec = maps:get(HatchId, FinishedMap, #hatch_rec{}),
            PetNum = length([RId || #hatch_slot{role_id = RId} <- HatchRec#hatch_rec.slots, RId =:= RoleId]),
            Materials = [{RId, CId, GLv} || #hatch_slot{role_id = RId, cid = CId, growup_lv = GLv} <- HatchRec#hatch_rec.slots],
            #get_hatch_info_resp{stat = ?HATCH_ST_FINISH, hatch_id = HatchId, data = PetNum, materials = Materials};
        {HatchId, ?HATCH_ST_BOOKED} ->
            ?ERROR("RoleId: ~p Should not send this request !", [RoleId]),
            #get_hatch_info_resp{stat = ?HATCH_ST_BOOKED, hatch_id = HatchId};
        _ ->
            #get_hatch_info_resp{}
    end,
    {ok, SyncBin} = prot_msg:encode_msg(41022, SyncMsg),
    lib_role_send:send_to_role(RoleId, SyncBin),
    {noreply, State};


% 咨询孵化NPC(创建孵化实例)
handle_cast({'book_hatch', Type, RoleIds}, State) ->
    #svr_pet_hatch{base_offset = Offset, auto_id = AutoId} = State,
    {HatchId, AutoIdN} = gen_hatch_id(Offset, AutoId),
    PetBabies = [{RoleId, ?HATCH_UNLOCKED, undefined} || RoleId <- RoleIds],
    HatchBook = #hatch_book{
        hatch_id = HatchId,
        owner_id = hd(RoleIds),
        type = Type,
        pet_babies = PetBabies
    },
    update_role_hatch(RoleIds, HatchId, ?HATCH_ST_BOOKED),
    push_and_sync_booked(HatchBook),
    StateN = State#svr_pet_hatch{auto_id = AutoIdN},
    {noreply, StateN};

% 取消孵化珍兽
handle_cast({'pet_hatch_cancel', HatchId, RoleId}, State) ->
    do_cancel_hatch(HatchId, RoleId),
    {noreply, State};
handle_cast({'role_delete', RoleIds}, State) ->
    role_delete_(RoleIds),
    {noreply, State};

% 选上孵化珍兽(组队孵化)
handle_cast({'pet_hatch_on', HatchId, RoleId, Pet}, State) ->
    Booked = get_booked(),
    case maps:get(HatchId, Booked, undefined) of
        #hatch_book{type = ?HATCH_TEAM, pet_babies = PetBabies} = BookRec ->
            case lists:keytake(RoleId, 1, PetBabies) of
                {value, {RoleId, ?HATCH_UNLOCKED, undefined}, Rest} ->
                    PetBabiesN = [{RoleId, ?HATCH_UNLOCKED, Pet} | Rest],
                    BookRecN = BookRec#hatch_book{pet_babies = PetBabiesN},
                    push_and_sync_booked(BookRecN);
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
            end;
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
    end,
    {noreply, State};

% 收回孵化珍兽(组队孵化)
handle_cast({'pet_hatch_off', HatchId, RoleId}, State) ->
    Booked = get_booked(),
    case maps:get(HatchId, Booked, undefined) of
        #hatch_book{type = ?HATCH_TEAM, pet_babies = PetBabies} = BookRec ->
            case lists:keytake(RoleId, 1, PetBabies) of
                {value, {RoleId, ?HATCH_UNLOCKED, Pet}, Rest} when is_map(Pet) ->
                    PetBabiesN = [{RoleId, ?HATCH_UNLOCKED, undefined} | Rest],
                    lib_role:mod_info(RoleId, lib_role_pet, 'return_hatched_pet'),
                    BookRecN = BookRec#hatch_book{pet_babies = PetBabiesN},
                    push_and_sync_booked(BookRecN);
                {value, {RoleId, ?HATCH_LOCKED, _Pet}, _Rest} ->
                    ?ERROR_TOC(RoleId, ?RC_PET_IS_LOCKED);
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_PET_NO_PET_IN_HATCH)
            end;
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
    end,
    {noreply, State};

% 锁定孵化珍兽
handle_cast({'pet_hatch_lock', HatchId, RoleId}, State) ->
    Booked = get_booked(),
    case maps:get(HatchId, Booked, undefined) of
        #hatch_book{type = ?HATCH_TEAM, pet_babies = PetBabies} = BookRec ->
            case lists:keytake(RoleId, 1, PetBabies) of
                {value, {RoleId, ?HATCH_UNLOCKED, Pet}, Rest} when is_map(Pet) ->
                    PetBabiesN = [{RoleId, ?HATCH_LOCKED, Pet} | Rest],
                    BookRecN = BookRec#hatch_book{pet_babies = PetBabiesN},
                    push_and_sync_booked(BookRecN);
                {value, {RoleId, ?HATCH_LOCKED, _Pet}, _Rest} ->
                    ?ERROR_TOC(RoleId, ?RC_PET_ALREADY_LOCKED);
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_PET_NO_PET_IN_HATCH)
            end;
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
    end,
    {noreply, State};

% 解锁孵化珍兽
handle_cast({'pet_hatch_unlock', HatchId, RoleId}, State) ->
    Booked = get_booked(),
    case maps:get(HatchId, Booked, undefined) of
        #hatch_book{type = ?HATCH_TEAM, pet_babies = PetBabies} = BookRec ->
            case lists:keytake(RoleId, 1, PetBabies) of
                {value, {RoleId, ?HATCH_LOCKED, Pet}, Rest} ->
                    PetBabiesN = [{RoleId, ?HATCH_UNLOCKED, Pet} | Rest],
                    BookRecN = BookRec#hatch_book{pet_babies = PetBabiesN},
                    push_and_sync_booked(BookRecN);
                {value, {RoleId, ?HATCH_UNLOCKED, _Pet}, _Rest} ->
                    ?ERROR_TOC(RoleId, ?RC_PET_NOT_LOCKED);
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
            end;
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
    end,
    {noreply, State};

% 开始孵化
handle_cast({'pet_hatch_start', HatchId, RoleId}, State) ->
    Booked = get_booked(),
    case maps:get(HatchId, Booked, undefined) of
        #hatch_book{owner_id = RoleId, pet_babies = PetBabies} ->
            case lists:all(fun({_, IsLock, _}) -> IsLock =:= ?HATCH_LOCKED end, PetBabies) of
                true ->
                    HatchRec = gen_hatch_rec(HatchId, PetBabies),
                    push_and_sync_hatch(HatchRec),
                    RoleIds = [element(#hatch_slot.role_id, Slot) || Slot <- HatchRec#hatch_rec.slots],
                    update_role_hatch(RoleIds, HatchId, ?HATCH_ST_ING),
                    set_booked(maps:remove(HatchId, Booked)),
                    [lib_role:mod_info(RId, lib_role_pet, 'del_hatched_pet') || RId <- RoleIds];
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
            end;
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
    end,
    {noreply, State};

% 单人孵化
handle_cast({'pet_hatch_self', HatchId, RoleId, Pets}, State) ->
    Booked = get_booked(),
    case maps:get(HatchId, Booked, undefined) of
        #hatch_book{owner_id = RoleId, type = ?HATCH_SELF} ->
            PetBabies = [{RoleId, ?HATCH_LOCKED, Pet} || Pet <- Pets],
            HatchRec = gen_hatch_rec(HatchId, PetBabies),
            push_and_sync_hatch(HatchRec),
            update_role_hatch([RoleId], HatchId, ?HATCH_ST_ING),
            set_booked(maps:remove(HatchId, Booked)),
            lib_role:mod_info(RoleId, lib_role_pet, 'del_hatched_pet');
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
    end,
    {noreply, State};

% 领取孵化的珍兽
handle_cast({'get_hatched_pet', HatchId, RoleId}, State) ->
    RoleHatchMap = get_role_hatch(),
    case maps:get(RoleId, RoleHatchMap, undefined) of
        {HatchId, ?HATCH_ST_FINISH} ->
            FinishedMap = get_hatch_finished(),
            case maps:get(HatchId, FinishedMap, undefined) of
                #hatch_rec{growup_lv_sum = GrowupLvSum, growup_rate_sum = GrowupRateSum, slots = Slots} = HatchRec ->
                    case lists:keytake(RoleId, #hatch_slot.role_id, Slots) of
                        {value, Slot, Rest} ->
                            FinishedMapN = case Rest of
                                [] -> maps:remove(HatchId, FinishedMap);
                                _ -> maps:put(HatchId, HatchRec#hatch_rec{slots = Rest}, FinishedMap)
                            end,
                            set_hatch_finished(FinishedMapN),

                            {RestNum, PanelMsg} = case Rest of
                                [#hatch_slot{role_id = RoleId, cid = CId, growup_lv = GLv}] ->
                                    Materials = [{RoleId, CId, GLv}],
                                    {1, #get_hatch_info_resp{stat = ?HATCH_ST_FINISH, hatch_id = HatchId, data = 1, materials = Materials}};
                                Rest ->
                                    remove_role_hatch([RoleId]),
                                    {0, #get_hatch_info_resp{stat = ?HATCH_ST_DEFAULT, hatch_id = 0, data = 0, materials = []}}
                            end,
                            GrowupRate = trunc(GrowupRateSum / 2),
                            #hatch_slot{cid = PetCId, growup_lv = GrowupLv} = Slot,
                            {ok, PanelBin} = prot_msg:encode_msg(41022, PanelMsg),
                            lib_role_send:send_to_role(RoleId, PanelBin),
                            ModInfo = {'do_gen_hatched_pet', {PetCId, GrowupLvSum, GrowupLv, GrowupRate}, RestNum},
                            lib_role:mod_info(RoleId, lib_role_pet, ModInfo);
                        _ ->
                            ?ERROR_TOC(RoleId, ?RC_PET_NO_PET_TO_GET)
                    end;
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_PET_NO_PET_TO_GET)
            end;
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_NO_PET_TO_GET)
    end,
    {noreply, State};

% 默认匹配
handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

% 定时检测孵化结束
handle_info('interval_check', State) ->
    do_interval_check(),
    Ref = start_interval_check(),
    {noreply, State#svr_pet_hatch{check_ref = Ref}};

% 默认匹配
handle_info(Info, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Info]),
    {noreply, State}.

terminate(shutdown, _State) ->
    ok;
terminate(normal, _State) ->
    ok;
terminate(Reason, _State) ->
    ?ERROR("~p terminate with Reason: ~p", [Reason]),
    do_permanent(),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
start_interval_check() ->
    erlang:send_after(10000, self(), 'interval_check').

do_interval_check() ->
    Now = time:unixtime(),
    ParFun = fun(#hatch_rec{finish_time = FTime}) -> FTime =< Now end,
    {FinishedList, HatchingList} = lists:partition(ParFun, get_hatch_list()),
    set_hatch_list(HatchingList),
    MergeFun = fun(#hatch_rec{hatch_id = HatchId, slots = _Slots} = HatchRec, {AccRoleHatch, AccFinishMap}) ->
        #hatch_rec{hatch_id = HatchId, slots = Slots} = HatchRec,
        TmpHatch = {HatchId, ?HATCH_ST_FINISH},
        {AccRoleHatchN, RoleIds, PetNum, Materials} = case Slots of
            [#hatch_slot{role_id = RoleId, cid = CId, growup_lv = GLv}, #hatch_slot{role_id = RoleId}] ->
                MaterialsT = [{RoleId, CId, GLv}, {RoleId, CId, GLv}],
                {AccRoleHatch#{RoleId => TmpHatch}, [RoleId], 2, MaterialsT};
            [#hatch_slot{role_id = RoleId1, cid = CId1, growup_lv = GLv1}, #hatch_slot{role_id = RoleId2, cid = CId2, growup_lv = GLv2}] ->
                MaterialsT = [{RoleId1, CId1, GLv1}, {RoleId2, CId2, GLv2}],
                {AccRoleHatch#{RoleId1 => TmpHatch, RoleId2 => TmpHatch}, [RoleId1, RoleId2], 1, MaterialsT};
            [#hatch_slot{role_id = RoleId, cid = CId, growup_lv = GLv}] ->
                MaterialsT = [{RoleId, CId, GLv}],
                {AccRoleHatch#{RoleId => TmpHatch}, [RoleId], 1, MaterialsT}
        end,
        SyncMsg = #get_hatch_info_resp{stat = ?HATCH_ST_FINISH, hatch_id = HatchId, data = PetNum, materials = Materials},
        {ok, SyncBin} = prot_msg:encode_msg(41022, SyncMsg),
        [lib_role_send:send_to_role(RId, SyncBin) || RId <- RoleIds],
        {AccRoleHatchN, maps:put(HatchId, HatchRec, AccFinishMap)}
    end,
    {RoleHatchAdded, FinishedMapAdded} = lists:foldl(MergeFun, {#{}, #{}}, FinishedList),

    RoleHatchMap = get_role_hatch(),
    RoleHatchMapN = maps:merge(RoleHatchMap, RoleHatchAdded),
    set_role_hatch(RoleHatchMapN),
    FinishedMap = get_hatch_finished(),
    FinishedMapN = maps:merge(FinishedMap, FinishedMapAdded),
    set_hatch_finished(FinishedMapN),
    ok.

gen_hatch_id(Offset, AutoId) ->
    {Offset + AutoId, AutoId + 1}.

% 孵化服务初始化
dictionary_init() ->
    set_booked(#{}),
    NowTime = time:unixtime(),
    ConvertFun = fun(HatchData, {AccHatchList, AccFinishList, AccRoleHatch}) ->
        [HatchId, SlotsDb, GrowupLvSum, GrowupRateSum, FinishTime] = HatchData,
        Slots = type:bitstring_to_term(SlotsDb),
        SlotRecs = [
            #hatch_slot{role_id = RoleId, cid = CId, growup_lv = GrowupLv}
            || {RoleId, CId, GrowupLv} <- Slots
        ],
        HatchRec = #hatch_rec{
            hatch_id = HatchId, slots = SlotRecs, growup_lv_sum = GrowupLvSum,
            growup_rate_sum = GrowupRateSum, finish_time = FinishTime
        },
        HatchStat = ?iif(NowTime >= FinishTime, ?HATCH_ST_FINISH, ?HATCH_ST_ING),
        NewRoleHatch = [{RoleId, {HatchId, HatchStat}} || {RoleId, _, _} <- Slots],
        AccRoleHatchN = NewRoleHatch ++ AccRoleHatch,
        case HatchStat of
            ?HATCH_ST_FINISH ->
                AccFinishListN = [{HatchId, HatchRec} | AccFinishList],
                {AccHatchList, AccFinishListN, AccRoleHatchN};
            HatchStat ->
                AccHatchListN = [HatchRec | AccHatchList],
                {AccHatchListN, AccFinishList, AccRoleHatchN}
        end
    end,
    HatchListDb = ?DB:get_all(?SQL_GET_PET_HATCH_LIST),
    {HatchingList, FinishedList, RoleHatchList} =
        lists:foldl(ConvertFun, {[], [], []}, HatchListDb),
    set_hatch_list(HatchingList),
    FinishedMap = maps:from_list(FinishedList),
    set_hatch_finished(FinishedMap),
    RoleHatchMap = maps:from_list(RoleHatchList),
    set_role_hatch(RoleHatchMap).

get_booked() ->
    get(booked).

set_booked(BookedList) ->
    put(booked, BookedList).

push_and_sync_booked(BookRec) ->
    #hatch_book{hatch_id = HatchId, pet_babies = PetBabies} = BookRec,
    HatchType = length(PetBabies),
    SyncPannelFun = fun() ->
        SyncMsg = #sync_pet_hatch_pannel{
            hatch_id = HatchId,
            type = HatchType,
            pet_babies = [
                {RoleId, IsLock, CId, Name, GrowupLv, GrowupRate}
                || {RoleId, IsLock, #{cid:=CId, name:=Name, growup_lv:=GrowupLv, growup_rate:=GrowupRate} = Pet} <- PetBabies, is_map(Pet)
            ]
        },
        {ok, SyncBin} = prot_msg:encode_msg(41024, SyncMsg),
        [lib_role_send:send_to_role(element(1, PB), SyncBin) || PB <- PetBabies]
    end,
    spawn(SyncPannelFun),
    BookedMap = get_booked(),
    BookedMapN = maps:put(HatchId, BookRec, BookedMap),
    put(booked, BookedMapN).

push_and_sync_hatch(HatchRec) ->
    #hatch_rec{hatch_id = HatchId, slots = Slots, finish_time = FinishTime} = HatchRec,
    SyncHatchFun = fun() ->
        Materials = [{RId, CId, GLv} || #hatch_slot{role_id = RId, cid = CId, growup_lv = GLv} <- Slots],
        SyncMsg = #get_hatch_info_resp{
            stat = ?HATCH_ST_ING, hatch_id = HatchId,
            data = FinishTime, materials = Materials
        },
        {ok, SyncBin} = prot_msg:encode_msg(41022, SyncMsg),
        [lib_role_send:send_to_role(Slot#hatch_slot.role_id, SyncBin) || Slot <- Slots]
    end,
    spawn(SyncHatchFun),
    HatchList = get_hatch_list(),
    set_hatch_list([HatchRec | HatchList]).

get_hatch_list() ->
    get(hatch_list).

set_hatch_list(HatchingList) ->
    put(hatch_list, HatchingList).

get_hatch_finished() ->
    get(hatch_finished).

set_hatch_finished(FinishedMap) ->
    put(hatch_finished, FinishedMap).

get_role_hatch() ->
    get(role_hatch).

set_role_hatch(RoleHatch) ->
    put(role_hatch, RoleHatch).

remove_role_hatch(RoleIds) ->
    RoleHatchMap = get(role_hatch),
    RoleHatchMapN = maps:without(RoleIds, RoleHatchMap),
    put(role_hatch, RoleHatchMapN).

update_role_hatch(RoleIds, HatchId, Stat) ->
    UpdateFun = fun(RoleId, RoleHatchMap) ->
        case RoleId > 0 of
            true -> maps:put(RoleId, {HatchId, Stat}, RoleHatchMap);
            false -> RoleHatchMap
        end
    end,
    RoleHatch = get_role_hatch(),
    RoleHatchN = lists:foldl(UpdateFun, RoleHatch, RoleIds),
    set_role_hatch(RoleHatchN).

gen_hatch_rec(HatchId, [{RId1, _, #{cid:=PetCId, growup_lv:=GLv1, growup_rate:=GRate1}}, {RId2, _, #{growup_lv:=GLv2, growup_rate:=GRate2}}]) ->
    HatchSlot1 = #hatch_slot{role_id = RId1, cid = PetCId, growup_lv = GLv1},
    HatchSlot2 = #hatch_slot{role_id = RId2, cid = PetCId, growup_lv = GLv2},
    #hatch_rec{
        hatch_id = HatchId,
        slots = [HatchSlot1, HatchSlot2],
        growup_lv_sum = GLv1 + GLv2,
        growup_rate_sum = GRate1 + GRate2,
        finish_time = time:unixtime() + conf_pet_common:get(hatch_time)
    };
gen_hatch_rec(HatchId, [{RoleId, _, #{cid:=PetCId, growup_lv:=GLv, growup_rate:=GRate}}]) ->
    HatchSlot = #hatch_slot{role_id = RoleId, cid = PetCId, growup_lv = GLv},
    #hatch_rec{
        hatch_id = HatchId,
        slots = [HatchSlot],
        growup_lv_sum = GLv * 2,
        growup_rate_sum = GRate * 2,
        finish_time = time:unixtime() + conf_pet_common:get(hatch_time)
    }.

role_delete_(RoleIds) ->
    lists:foreach(fun(RoleId) ->
        RoleHatchMap = get_role_hatch(),
        case maps:get(RoleId, RoleHatchMap, undefined) of
            {HatchId, _} ->
                do_cancel_hatch(HatchId, RoleId);
            _ ->
                skip
        end
    end, RoleIds).

do_cancel_hatch(HatchId, RoleId) ->
    Booked = get_booked(),
    case maps:get(HatchId, Booked, undefined) of
        #hatch_book{type = ?HATCH_TEAM, pet_babies = PetBabies} ->
            case PetBabies of
                [{RoleId1, _, _}, {RoleId2, _, _}] when RoleId1 =:= RoleId orelse RoleId2 =:= RoleId ->
                    remove_role_hatch([RoleId1, RoleId2]),
                    BookedN = maps:remove(HatchId, Booked),
                    put(booked, BookedN),
                    lib_role:mod_info(RoleId1, lib_role_pet, 'return_hatched_pet'),
                    lib_role:mod_info(RoleId2, lib_role_pet, 'return_hatched_pet'),
                    sync_close_pet_hatch_pannel([RoleId1, RoleId2]);
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
            end;
        #hatch_book{type = ?HATCH_SELF} ->
            remove_role_hatch([RoleId]),
            BookedN = maps:remove(HatchId, Booked),
            put(booked, BookedN),
            lib_role:mod_info(RoleId, lib_role_pet, 'return_hatched_pet'),
            sync_close_pet_hatch_pannel([RoleId]);
        _ ->
            ?ERROR_TOC(RoleId, ?RC_PET_BAD_HATCH_REQ)
    end.

sync_close_pet_hatch_pannel(RoleIds) ->
    SyncMsg = #sync_pet_hatch_pannel{hatch_id = 0},
    {ok, SyncBin} = prot_msg:encode_msg(41024, SyncMsg),
    [lib_role_send:send_to_role(RoleId, SyncBin) || RoleId <- RoleIds].

do_permanent() ->
    db:execute(?SQL_TRUNCATE_HATCH_LIST),
    MakeDbDataFun = fun(HatchRec) ->
        #hatch_rec{
            hatch_id = HatchId, slots = SlotRecs, growup_lv_sum = GrowupLvSum,
            growup_rate_sum = GrowupRateSum, finish_time = FinishTime
        } = HatchRec,
        Slots = [
            {RoleId, CId, GrowupLv}
            || #hatch_slot{role_id = RoleId, cid = CId, growup_lv = GrowupLv} <- SlotRecs
        ],
        SlotsDb = type:term_to_bitstring(Slots),
        [HatchId, SlotsDb, GrowupLvSum, GrowupRateSum, FinishTime]
    end,

    FinishedList = maps:values(get_hatch_finished()),
    FinishedListDb = lists:map(MakeDbDataFun, FinishedList),
    db:insert_values(?SQL_SET_PET_HATCH_LIST, ?SQL_SET_PET_HATCH_LIST_FMT, FinishedListDb),
    HatchingList = get_hatch_list(),
    HatchingListDb = lists:map(MakeDbDataFun, HatchingList),
    db:insert_values(?SQL_SET_PET_HATCH_LIST, ?SQL_SET_PET_HATCH_LIST_FMT, HatchingListDb).
