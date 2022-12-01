#!/bin/bash

SERVER_NUM=10001
LOGO=tl
DOMAIN=139.9.154.36
SERVER_IDS=(1)
########################################
# 基本参数
########################################

LOGO="tl"
COOKIE_PREFIX=${LOGO}
COOKIE_SUBFIX=".Jmt6w.ci8qw"
NODE_NAME_PREFIX="${LOGO}"

GAME_DIR=`dirname $0`/../game
ERL=erl
ERL_PORT_MIN=40001
ERL_PORT_MAX=40500
ERL_MAX_CONN=1000000
DELAY=3
ERL_OPTION=" -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} +P ${ERL_MAX_CONN} +K true -smp disable"
#ERL_OPTION=" -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} +P ${ERL_MAX_CONN} +K true -smp enable"
ERL_OPTION_SMP=" -kernel inet_dist_listen_min ${ERL_PORT_MIN} -kernel inet_dist_listen_max ${ERL_PORT_MAX} +P ${ERL_MAX_CONN} +K true -smp +S 10"

########################################
# 系统参数
########################################
par1=$2
par2=$3
par3=$4
is_real_run=1
