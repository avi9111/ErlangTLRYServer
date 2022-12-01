%%-------------------------------------------------------
%% @File     : lib_pet_agent.erl
%% @Brief    : 宠物场景管理器
%% @Author   : cablsbs
%% @Date     : 2018-7-20
%%-------------------------------------------------------
-module(lib_pet_agent).

-include("log.hrl").
-include("battle.hrl").
-include("scene_objs.hrl").
-include("proto/prot_902.hrl").

-export([
    get_ids/0,                      % 获取场景所有宠物id列表
    get_pet/1,                      % 获取宠物
    put_pet/1,                      % 保存宠物数据
    del_pet/1,                      % 删除宠物数据
    get_owner/1,                    % 获取主人数据
    get_owner_id/1,                 % 获取主人id
    pet_restore_data/1,             % 根据主人id获取宠物回存信息

    get_role_pet/1,                 % 找出玩家的pet
    get_scene_pet/0,                % 获取场景所有宠物
    get_scene_pet_owner/1,          % 获取宠物的归属者id
    get_scene_pet_by_area/3,        % 获取某范围内宠物列表(根据xy,距离)
    update_pets_owner_fields/2,     % 更新珍兽owner字段

    get_all_area/1,                 % 获取九宫格子宠物信息
    get_all_area_id/1,              % 获取九宫格子宠物id
    get_all_area_id_except/2        % 获取九宫格子宠物id(除归属者为第二参数)
]).


-export([
    % 选择攻击目标
    get_line_pet_for_battle/6,      % 选取直线形宠物
    get_sector_pet_for_battle/6,    % 选取扇形宠物
    get_circle_pet_for_battle/3,    % 选取圆形宠物

    % 选择追击目标
    get_scene_pet_ids_dist/3       % 获取x,y坐标一定范围内的宠物id列表
]).


%% Apis -------------------------------------------------
% @doc 获取当前场景的所有宠物id
% @spec get_ids() -> PetIds.
% PetIds    :: [integer()]
get_ids() ->
    PetIdsMap = get(pet_ids),
    maps:keys(PetIdsMap).


% @doc 获取宠物数据
% @spec get_pet(PetId) -> Pet.
% PetId     :: integer()
% Pet       :: #pet{} | []
get_pet(PetId) ->
    case get({pet, PetId}) of
        #pet{} = Pet -> Pet;
        _ -> []
    end.

% @doc 保存宠物数据
put_pet(Pet) ->
    case get_pet(Pet#pet.id) of
        #pet{x = OldX, y = OldY} ->
            OldXY = lib_scene_map:get_xy(OldX, OldY),
            NewXY = lib_scene_map:get_xy(Pet#pet.x, Pet#pet.y),
            if
                NewXY =:= OldXY ->
                    skip;
                true ->
                    lib_scene_map:pop_from_xy(?BATTLE_PET, OldXY, Pet#pet.id),
                    lib_scene_map:push_into_xy(?BATTLE_PET, NewXY, Pet#pet.id)
            end,
            put({pet, Pet#pet.id}, Pet);
        _ ->
            put_id(Pet#pet.id),
            XY = lib_scene_map:get_xy(Pet#pet.x, Pet#pet.y),
            lib_scene_map:push_into_xy(?BATTLE_PET, XY, Pet#pet.id),
            put({pet, Pet#pet.id}, Pet)
    end.

% @doc 删除宠物数据
% @spec del_pet(PetId) -> {PetId, XY} | skip
% PetId = XY    :: integer()
del_pet(PetId) ->
    case erase({pet, PetId}) of
        #pet{x = X, y = Y} ->
            del_id(PetId),
            XY = lib_scene_map:get_xy(X, Y),
            lib_scene_map:pop_from_xy(?BATTLE_PET, XY, PetId),
            {PetId, XY};
        _ ->
            skip
    end.

% @doc 获取主人场景数据
% @spec get_owner(PetId) -> #scene_role{}.
% PetId     :: integer()
get_owner(PetId) ->
    OwnerId = get_owner_id(PetId),
    lib_scene_agent:get_roler(OwnerId).

% @doc 获取主人id
% @spec get_owner_id(PetId) -> ok.
% PetId     :: integer()
get_owner_id(PetId) ->
    case get_pet(PetId) of
        #pet{owner = #{id := OwnerId}} -> OwnerId;
        _ -> 0
    end.

% @doc 更新宠物数据
% @spec pet_restore_data(RoleId) -> RestoreDatas.
% RoleId        :: integer()
% RestoreDatas  :: [{Key :: atom(), Value :: term()}]
pet_restore_data(RoleId) ->
    case get_role_pet(RoleId) of
        #pet{hp = Hp, skill_cd = SkillCd} -> [{hp, Hp}, {skill_cd, SkillCd}];
        _ -> []
    end.

% @doc 获取场景内的所有宠物
% @spec get_scene_pet() -> PetList
% PetList   :: [#pet{}...]
get_scene_pet() ->
    AllPetId = get_ids(),
    get_scene_pet_helper(AllPetId, []).


% @doc 找出玩家的 Pet
% @spec get_role_pet(RoleId) -> #pet{} | [].
get_role_pet(RoleId) ->
    case lib_scene_agent:get_role_pet_ids(RoleId) of
        [RolePetId | _] -> get_pet(RolePetId);
        _ -> []
    end.

% @doc 返回宠物的归属者id
get_scene_pet_owner(PetId) ->
    case get_pet(PetId) of
        #pet{owner = #{id := OwnerId}} -> OwnerId;
        _ -> undefined
    end.

% @doc 获取距离XY, Dist范围内宠物列表
% @spec get_scene_pet_area(X, Y, Dist) -> [#pet{}].
% X = Y     :: integer()
% Dist      :: number()
get_scene_pet_by_area(X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllPet = get_all_area(AllArea),
    %% 加1和乘以1.5都是为了和宠物攻击距离保持一致
    X1 = X + Dist + 1,
    X2 = X - Dist - 1,
    Y1 = Y + Dist * 1.5 + 1,
    Y2 = Y - Dist * 1.5 - 1,
    [Pet || Pet <- AllPet, Pet#pet.x >= X2 andalso Pet#pet.x =< X1, Pet#pet.y >= Y2 andalso Pet#pet.y =< Y1, Pet#pet.hp > 0].

% @doc 同步更新宠物主人数据
update_pets_owner_fields(RoleId, KvList) ->
    UpdateFun = fun(PetId) ->
        case lib_pet_agent:get_pet(PetId) of
            #pet{owner = Owner} = Pet ->
                OwnerN = do_update_owner_fields(Owner, KvList),
                PetN = Pet#pet{owner = OwnerN},
                lib_pet_agent:put_pet(PetN);
            _ ->
                skip
        end
    end,
    RolePetIds = lib_scene_agent:get_role_pet_ids(RoleId),
    lists:foreach(UpdateFun, RolePetIds).

%% 获取九宫格子宠物id
get_all_area_id(Area) ->
    lists:foldl(fun(XY, L) ->
        lib_scene_map:get_xy_objs(?BATTLE_PET, XY) ++ L
    end, [], Area).

%% 获取九宫格子宠物id
get_all_area_id_except(Area, OwnerId) ->
    PetsAreas = lists:foldl(fun(XY, L) ->
        lib_scene_map:get_xy_objs(?BATTLE_PET, XY) ++ L
    end, [], Area),
    OwnerPets = lib_scene_agent:get_role_pet_ids(OwnerId),
    [PetId || PetId <- PetsAreas, not lists:member(PetId, OwnerPets)].

%% 获取九宫格子宠物信息
get_all_area(XY) ->
    AllPet = get_all_area_id(XY),
    get_scene_pet_helper(AllPet, []).


% @doc 选择一定范围(以{X,Y}为中心,距离不超过Dist)的宠物Id列表
% @spec get_scene_pet_ids_dist(X, Y, Dist) -> [PetId].
% X = Y = Dist = PetId      :: integer()
get_scene_pet_ids_dist(X, Y, Dist) ->
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllPet = get_all_area(AllArea),
    X1 = X + Dist,
    X2 = X - Dist,
    Y1 = Y + Dist,
    Y2 = Y - Dist,
    [
        PetId
        || #pet{id = PetId, x = PX, y = PY} <- AllPet,
        PX >= X2 andalso PX =< X1, PY >= Y2 andalso PY =< Y1
    ].


%%% Apis for battle select pets ---------------------------------
% @doc 直线型选择目标宠物
get_line_pet_for_battle(OX, OY, X, Y, Width, Dist) ->
    SelectArgs = [OX, OY, X, Y, Width, Dist],
    AllArea = lib_scene_map:get_the_area(X, Y),
    AllPet = get_all_area(AllArea),
    [
        Pet
        || Pet <- AllPet,
        Pet#pet.hp > 0,
        lib_battle_aid:get_line_for_battle(Pet#pet.x, Pet#pet.y, SelectArgs)
    ].

% @doc 扇形选择宠物
get_sector_pet_for_battle(Cx, Cy, Dist, Ux, Uy, Angle) ->
    Vx = Ux - Cx,
    Vy = Uy - Cy,
    Cos = util:angle_to_float(Angle / 2),
    SelectArgs = [Cx, Cy, Dist, Vx, Vy, Cos],
    AllArea = lib_scene_map:get_the_area(Cx, Cy),
    AllPet = get_all_area(AllArea),
    [
        Pet
        || Pet <- AllPet,
        Pet#pet.hp > 0,
        lib_battle_aid:get_sector_for_battle(Pet#pet.x, Pet#pet.y, SelectArgs)
    ].

% @doc 圆形选择宠物
get_circle_pet_for_battle(Cx, Cy, Dist) ->
    AllArea = lib_scene_map:get_the_area(Cx, Cy),
    AllPet = get_all_area(AllArea),
    DistSqr = lib_battle_aid:square(Dist),
    SelectArgs = [Cx, Cy, DistSqr],
    [
        Pet
        || Pet <- AllPet,
        Pet#pet.hp > 0,
        lib_battle_aid:get_circle_for_battle(Pet#pet.x, Pet#pet.y, SelectArgs)
    ].


%%% Privates ----------------------------------------------------
%% 保存宠物id
put_id(PetId) ->
    PetIdsMap = get(pet_ids),
    put(pet_ids, PetIdsMap#{PetId => 0}).

%% 删除宠物
del_id(PetId) ->
    PetIdsMap = get(pet_ids),
    put(pet_ids, maps:remove(PetId, PetIdsMap)).


%% 获取宠物数据列表
get_scene_pet_helper([PetId | RestPetIds], AccPets) ->
    case get({pet, PetId}) of
        undefined ->
            del_id(PetId),
            get_scene_pet_helper(RestPetIds, AccPets);
        Pet ->
            get_scene_pet_helper(RestPetIds, [Pet | AccPets])
    end;
get_scene_pet_helper([], PetList) ->
    PetList.

do_update_owner_fields(Owner, [{Field, Value} | Rest]) ->
    OwnerT = maps:put(Field, Value, Owner),
    do_update_owner_fields(OwnerT, Rest);
do_update_owner_fields(Owner, []) ->
    Owner.

