%%-------------------------------------------------------
%% @File     : lib_role_db
%% @Brief    : 角色db操作
%% @Author   : cablsbs
%% @Date     : 2018-6-12
%%---------------------------------------------------------
-module(lib_role_db).

-include("role.hrl").
-include("common.hrl").

-export([
    i_role_basic/12,
    i_role_create/10,
    search_by_name/1,
    get_role_login_by_id/1,
    get_role_basic_data/1,
    get_role_id_by_name/1,
    get_role_list/2,
    get_role_num/2,
    set_role_state/2,
    save_role_level/3,
    update_login_data/4,
    update_name_level/5,
    save_role_basic_data/1,
    update_role_name/2
]).


%%% Apis ------------------------------------------------
%% 角色基础数据
i_role_basic(RoleId, Accname, NameBin, Career, Gender, Icon, Hair, InitHp, InitMp, NowTime, ServerId, Scene) ->
    RoleSceneBin = type:term_to_bitstring(Scene),
    RolePersonal = lib_role_personal:create_init(RoleId, Career, Gender, Icon, Hair),
    RolePersonalBin = type:term_to_bitstring(RolePersonal),
    SkillList = lib_role_skill:create_init(Career, Gender),
    SkillListBin = type:term_to_bitstring(SkillList),
    Sql = <<"INSERT INTO `role_basic` "
    "(`role_id`, `accname`, `name`, `career`, `gender`,`hp`, `mp`, "
    " `last_logout_time`, `server_id`, `skill_list`, `role_personal`, `role_scene`) "
    " VALUES (~p, '~s', '~s', ~p, ~p, ~p, ~p, ~p, ~w, '~s', '~s', '~s')">>,
    Args = [
        RoleId, Accname, NameBin, Career, Gender, InitHp, InitMp,
        NowTime, ServerId, SkillListBin, RolePersonalBin, RoleSceneBin
    ],
    ?DB:execute(io_lib:format(Sql, Args)).

%% 创角数据
i_role_create(RoleId, Accname, NameBin, Career, Gender, NowTime, ServerId, Source, Ip, Device) ->
    Sql = <<"INSERT INTO `role_create` "
    "(`role_id`, `accname`, `source`, `server_id`, `career`, `gender`, `name`, `ip`, `device`, `ctime`)"
    "VALUES (~p, '~s', '~s', ~p, ~p, ~p, '~s', '~s', '~s', ~p)">>,
    IpStr = type:ip2str(Ip),
    Args = [
        RoleId, Accname, Source, ServerId, Career, Gender, NameBin,
        IpStr, Device, NowTime
    ],
    ?DB:execute(io_lib:format(Sql, Args)).

%% 获取角色平台账号及状态
get_role_login_by_id(RoleId) ->
    Sql = <<"SELECT `accname`, `state` FROM `role_basic` WHERE `role_id`=~p">>,
    ?DB:get_row(io_lib:format(Sql, [RoleId])).

%% 获取角色基础数据
get_role_basic_data(RoleId) ->
    Sql = <<
        "SELECT `last_logout_time`, `total_online`, `login_days`, `server_id`, "
        "`name`, `career`, `gender`, `last_upgrade_lv`, `first_recharge`, "
        " `hp`, `mp`, `level`, `exp`, `murderous`, `clr_mur_counter`, "
        " `skill_list`, `role_personal`, `role_scene` FROM `role_basic` WHERE role_id = ~p"
    >>,
    ?DB:get_row(io_lib:format(Sql, [RoleId])).

%% 根据角色名称查找ID
get_role_id_by_name(Name) ->
    Sql = <<"select role_id from role_basic where name = '~s' limit 1">>,
    ?DB:get_one(io_lib:format(Sql, [Name])).

%% @doc 根据名字查找
search_by_name(Name) ->
    Sql = <<"select role_id from `role_basic` where name like '%~s%' limit 100">>,
    [RoleID || [RoleID] <- ?DB:get_all(io_lib:format(Sql, [Name]))].

update_role_name(RoleID, Name) ->
    Sql = <<"update `role_basic` set `name` = '~s' where `role_id` = ~p">>,
    ?DB:execute(io_lib:format(Sql, [Name, RoleID])).

%% 获取角色列表
get_role_list(Accname, ServerId) ->
    Sql = <<
        "SELECT rb.`role_id`, rc.`ctime`, rb.`state`, rb.`name`, rb.`gender`, rb.`level`, "
        " rb.`career`, rb.`last_login_time`, rb.`role_personal`, ra.`cur_avatar` FROM `role_basic` AS rb "
        " LEFT JOIN `role_create` AS rc  ON rb.`role_id` = rc.`role_id` LEFT JOIN `role_artifact` AS ra "
        " ON ra.`role_id` = rc.`role_id` WHERE binary rb.`accname`='~s' AND rb.`server_id`=~w"
    >>,
    ?DB:get_all(io_lib:format(Sql, [Accname, ServerId])).

%% 获取角色列表
get_role_num(Accname, ServerId) ->
    Sql = <<"SELECT count(1) FROM `role_basic` WHERE `accname`='~s' AND `server_id`=~w">>,
    ?DB:get_one(io_lib:format(Sql, [Accname, ServerId])).

%% 登陆更新角色数据
update_login_data(RoleId, Ip, Device, Time) ->
    Sql = <<
        "UPDATE `role_basic` SET "
        "`last_login_time`=~p, `last_login_ip`='~s', `device`='~s', `is_online`=1 "
        " WHERE role_id = ~p"
    >>,
    ?DB:execute(io_lib:format(Sql, [Time, type:ip2str(Ip), Device, RoleId])).

%% 登陆更新角色数据
update_name_level(Name, Level, Exp, Personal, RoleId) ->
    Sql = <<"UPDATE `role_basic` SET `name`='~s', `level`=~p, `exp`=~p, `role_personal`='~s' WHERE role_id = ~p">>,
    ?DB:execute(io_lib:format(Sql, [Name, Level, Exp, type:term_to_bitstring(Personal), RoleId])).

%% @doc 登出保存数据逻辑
save_role_basic_data(RoleState) ->
    #role_state{
        id = RoleId, name = Name, career = Career, gender = Gender,
        level = Level, exp = Exp, hp = Hp, mp = Mp, time_data = TimeData,
        murderous = Murderous, clr_mur_counter = ClrMurCounter,
        skill_list = SkillList, personal = Personal, role_scene = RoleScene,
        combat_power = Fight
    } = RoleState,
    Sql = <<
        "UPDATE `role_basic` SET "
        "`name` = '~s', `career` = ~p, `gender` = ~p, `level`=~p, `exp` = ~p, `hp` = ~p, `mp` = ~p,"
        "`murderous` = ~p, `clr_mur_counter` = ~p, `last_logout_time` = ~p, `last_upgrade_lv` = ~p,"
        "`first_recharge` = ~p, `total_online` = ~p, `is_online` = 0, `login_days` = ~p,"
        "`skill_list` = '~s',`role_personal` = '~s', `role_scene` = '~s', `fight` = ~w "
        " WHERE role_id = ~p"
    >>,
    #time_data{
        last_logout = LastLogoutTime,
        last_upgrade_lv = LastUpgradeLv,
        total_online = TotalOnline,
        login_days = LoginDays,
        first_recharge = FirstRecharge
    } = TimeData,
    SkillListBin = type:term_to_bitstring(SkillList),
    PersonalBin = type:term_to_bitstring(Personal),
    RoleSceneBin = type:term_to_bitstring(RoleScene#role_scene{line_pid = undefined}),
    Args = [
        Name, Career, Gender, Level, Exp, Hp, Mp, Murderous, ClrMurCounter,
        LastLogoutTime, LastUpgradeLv, FirstRecharge, TotalOnline,
        LoginDays, SkillListBin, PersonalBin, RoleSceneBin, Fight,
        RoleId
    ],
    ?DB:execute(io_lib:format(Sql, Args)).

save_role_level(RoleID, Level, Exp) ->
    SQL = <<"update `role_basic` set `level` = ~w, `exp` = ~w where `role_id` = ~w">>,
    db:execute(io_lib:format(SQL, [Level, Exp, RoleID])).

set_role_state(RoleID, State) ->
    SQL = if
        State =:= ?STATE_BAN_PERMANENT orelse State =:= ?STATE_NORMAL ->
            io_lib:format("update `role_basic` set `state` = ~w where `role_id` = ~w", [State, RoleID]);
        true ->
            io_lib:format("update `role_basic` set `state` = ~w where `role_id` = ~w and state != ~p", [State, RoleID, ?STATE_BAN_PERMANENT])
    end,
    db:execute(SQL).
