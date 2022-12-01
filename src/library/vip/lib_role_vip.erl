%%-------------------------------------------------------
%% @File     : lib_role_vip
%% @Brief    : vip模块
%% @Author   : cablsbs
%% @Date     : 2018-9-3
%%-------------------------------------------------------
-module(lib_role_vip).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_109.hrl").

-export([
    init/1,
    save/1,
    get_vip_lv/0,
    gm_set_vip_lv/2,
    vip_privileges/1,
    vip_privileges/2,
    add_exp/2,
    event/2,

    send_info/1,
    get_vip_gift/2
]).


%% Apis -------------------------------------------------

%% @doc 初始化
init(#role_state{id = RoleId}) ->
    RoleVip = init_from_db(RoleId),
    put_role_vip(RoleVip).

%% @doc 回存
save(#role_state{id = RoleId}) ->
    RoleVip = get_role_vip(),
    save_to_db(RoleId, RoleVip),
    ok.

%% @doc 获取Vip等级
get_vip_lv() ->
    #{level := VipLevel} = get_role_vip(),
    VipLevel.

%% @doc gm设置vip等级
gm_set_vip_lv(RoleSid, VipLevel) ->
    RoleVip = get_role_vip(),
    case conf_vip:get(VipLevel) of
        #{exp := NeedExp} ->
            RoleVipN = RoleVip#{level := VipLevel, exp := NeedExp},
            put_role_vip(RoleVipN),
            send_vip_info(RoleSid, RoleVipN);
        _ ->
            ?ERROR("GM set vip level faild ! Vip Level: ~p not found !", [VipLevel]),
            skip
    end.

%% @doc 获取vip特权
vip_privileges(Key) ->
    #{level := VipLevel} = get_role_vip(),
    vip_conf_field(VipLevel, Key, 0).

%% @doc 根据vip等级获取vip特权（用于跨玩家进程）
vip_privileges(VipLevel, Key) ->
    vip_conf_field(VipLevel, Key, 0).

%% @doc 增加vip经验
add_exp(RoleState, AddVipExp) ->
    #{exp := VipExp} = RoleVip = get_role_vip(),
    RoleVipN = RoleVip#{
        exp => VipExp + AddVipExp,
        last_update => time:unixtime()
    },
    check_upgrade_vip(RoleState, RoleVipN).

%% @doc 事件
%% 充值事件
event(RoleState, {'recharge', Exp}) ->
    #{exp := VipExp} = RoleVip = get_role_vip(),
    RoleVipN = RoleVip#{
        exp => VipExp + Exp,
        last_update => time:unixtime()
    },
    check_upgrade_vip(RoleState, RoleVipN),
    ok;
%% 半小时定时器
event(RoleState, {timer, 'half_hour'}) ->
    save(RoleState),
    ok;
%% 其他事件
event(_RoleState, _Event) ->
    ok.

%% @doc 发送vip数据
send_info(RoleState) ->
    RoleVip = get_role_vip(),
    send_vip_info(RoleState#role_state.sid, RoleVip),
    ok.

%% @doc 领取vip礼包
get_vip_gift(RoleState, Level) ->
    RoleVip = get_role_vip(),
    #{level := VipLevel, got_gifts := GotGifts} = RoleVip,
    Level =< VipLevel orelse throw({error, ?RC_VIP_VIPLV_LMT}),
    lists:member(Level, GotGifts) andalso throw({error, ?RC_VIP_ALREADY_GOT_THIS_GIFT}),
    RoleVipN = RoleVip#{got_gifts => [Level | GotGifts], last_update => time:unixtime()},
    put_role_vip(RoleVipN),
    #{gift := DropId} = conf_vip:get(Level),
    {RoleStateN, _} = lib_drop_api:give_drop_sync(RoleState, DropId, ?OPT_VIP_GIFT),
    {ok, RoleStateN}.


%% Privates ---------------------------------------------

put_role_vip(RoleVip) ->
    put(?MODULE, RoleVip).

get_role_vip() ->
    get(?MODULE).

init_from_db(RoleId) ->
    Sql = io_lib:format(?SQL_GET_ROLE_VIP, [RoleId]),
    case db:get_row(Sql) of
        [VipLevel, VipExp, GotGiftsBin, LastUpdate] ->
            GotGifts = type:bitstring_to_term(GotGiftsBin),
            ?role_vip#{
                level => VipLevel, exp => VipExp,
                got_gifts => GotGifts, last_update => LastUpdate
            };
        _ ->
            #{exp := NeedExp} = conf_vip:get(?DEFAULT_VIP_LEVEL),
            ?role_vip#{level => ?DEFAULT_VIP_LEVEL, exp => NeedExp}
    end.

save_to_db(RoleId, RoleVip) ->
    #{
        level := VipLevel, exp := VipExp,
        got_gifts := GotGifts,
        last_update := LastUpdate
    } = RoleVip,
    GotGiftsBin = type:term_to_bitstring(GotGifts),
    Sql = io_lib:format(?SQL_SAVE_ROLE_VIP, [RoleId, VipLevel, VipExp, GotGiftsBin, LastUpdate]),
    db:execute(Sql).

vip_conf_field(VipLv, Field, Def) when is_integer(VipLv) ->
    case conf_vip:get(VipLv) of
        Conf when is_map(Conf) ->
            maps:get(Field, Conf, Def);
        _ ->
            Def
    end.

send_vip_info(RoleSid, #{level := VipLevel, exp := VipExp, got_gifts := GotGifts}) ->
    Msg = #get_vip_info_resp{vip_level = VipLevel, vip_exp = VipExp, got_gifts = GotGifts},
    {ok, Bin} = prot_msg:encode_msg(10901, Msg),
    lib_role_send:send_to_sid(RoleSid, Bin).

check_upgrade_vip(PS, RoleVip) ->
    #{level := OldLv} = RoleVip,
    RoleVipN = do_check_upgrade_vip(RoleVip),
    #{level := NewLv} = RoleVipN,
    send_vip_info(PS, RoleVipN),
    put_role_vip(RoleVipN),
    OldLv =/= NewLv andalso ?EVENT(PS#role_state.id, 'vip_upgrade'),
    ok.

do_check_upgrade_vip(#{level := VipLevel, exp := VipExp} = RoleVip) ->
    case conf_vip:get(VipLevel + 1) of
        #{exp := NeedExp} when VipExp >= NeedExp ->
            do_check_upgrade_vip(RoleVip#{level => VipLevel + 1});
        _ ->
            RoleVip
    end.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------
