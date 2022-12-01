%%-------------------------------------------------------
%% @File     : lib_role_personal
%% @Brief    : 角色个性化模块
%% @Author   : cablsbs
%% @Date     : 2018-6-20
%%-------------------------------------------------------
-module(lib_role_personal).

-include("role.hrl").
-include("common.hrl").


-export([
    create_init/5,
    parse_role_personal/1
]).


%% Apis -------------------------------------------------
create_init(RoleID, Career, Gender, Icon, Hair) ->
    {_Icon, FashionL, _SkillL} = conf_career_init:get_conf(Career, Gender),
    Fashion = lib_role_fashion:create_init(RoleID, FashionL),
    RolePersonal = ?role_personal#{icon => Icon, hair => Hair, fashion => Fashion},
    RolePersonal.

parse_role_personal(#{ver := 1} = RolePersonal) ->
    RolePersonal#{title_honor => 0, frame => 0, bubble => 0, ver => ?ROLE_PERSONAL_VER};
parse_role_personal(#{ver := 2} = RolePersonal) ->
    RolePersonal#{frame => 0, bubble => 0, ver => ?ROLE_PERSONAL_VER};
parse_role_personal(#{ver := ?ROLE_PERSONAL_VER} = RolePersonal) ->
    RolePersonal;
parse_role_personal(_Faidout) ->
    ?role_personal.


%% Privates ---------------------------------------------
