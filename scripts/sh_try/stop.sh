#!/bin/bash


shDir=`dirname $0`
rm -rf ../game/log/s1*
sh ${shDir}/svrctrl.sh s10001 stop_all
sh ${shDir}/svrctrl.sh s10002 stop_all
sh ${shDir}/svrctrl.sh k10001 stop_all

#sleep 3

#sh ${shDir}/svrctrl.sh k10001 start_all
#sh ${shDir}/svrctrl.sh s10001 start_all
#sh ${shDir}/svrctrl.sh s10002 start_all
