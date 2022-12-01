#!/bin/bash
#set -o nounset
if [ ! -f "`dirname $0`/${1}_head.sh" ]  ; then
	echo "1  fail!"
	exit
fi
source `dirname $0`/${1}_head.sh

########################################
# 内部函数
########################################

## 更新启动节点脚本逻辑
function fun_gen_scripts() {
    local server=$1
    local node=$2
    local file=$3

    if [ "${node}" == "10" ];then                                                      
        NODE_NAME=${NODE_NAME_PREFIX}_${server}@${DOMAIN}
        NODE_COOKIE=${COOKIE_PREFIX}_${server}${COOKIE_SUBFIX}
        CONFIG=${LOGO}_s${SERVER_NUM}
    elif [ "${node}" -ge "100" ];then
        NODE_NAME=${NODE_NAME_PREFIX}_${server}${node}@${DOMAIN}
        NODE_COOKIE=${COOKIE_PREFIX}_kf100${server}${COOKIE_SUBFIX}
        CONFIG=${LOGO}_${server}
    fi


    cat > ${file} <<EOF
#!/bin/bash
#ulimit -SHn  100000

cd ${GAME_DIR}

# ${ERL} ${ERL_OPTION_SMP} -name ${NODE_NAME} ${HIDDEN} -setcookie ${NODE_COOKIE} -connect_all false -boot start_sasl -config config/${CONFIG} -pa ebin -pa ebin_libs -s game start -extra ${node}
${ERL} ${ERL_OPTION_SMP} -name ${NODE_NAME} ${HIDDEN} -setcookie ${NODE_COOKIE} -boot start_sasl -config config/${CONFIG} -pa ebin -pa ebin_libs -s game start -extra ${node}
EOF
}


## 启动节点逻辑
function fun_start(){
    local server=${1}
    local node=${2}
    task_name=${LOGO}_$node${server}
    file=${GAME_DIR}/scripts/node_${server}_${node}.sh

    fun_gen_scripts ${server} ${node} $file
 

    echo "正在启动节点 ${node} ..."
    fun_run_script ${task_name} ${file}
}


## 启动screen
function fun_run_script() {
    # 参数顺序说明：节点名，脚本路径
    local task_name=${1}
    local script_file=${2}
    chmod +x ${script_file}
    
    if [ "$is_real_run" == "1" ]; then
        echo "screen -dmS ${task_name} -s ${script_file}"
        screen -dmS ${task_name} -s ${script_file}
        sleep ${DELAY}
    else 
        echo "screen -no-test erl ${script_file}"
        grep ${ERL} "${script_file}"
        echo -e "\n"
    fi 
}


## 启动server
function fun_start_all(){
    if [ -n ${KF_NODES} ]; then
        for i in ${KF_NODES[@]}
        do
            fun_start $1 ${i}
        done
    fi

    if [ -n ${SERVER_IDS} ]; then
        for i in ${SERVER_IDS[@]}
        do
            fun_start ${1} 10
        done
    fi

}


## 单个启动逻辑
function fun_start_single() {
    if [ ! -z ${SERVER_IDS} ]; then
        fun_start ${2} 10
    elif [ ! -z ${KF_NODES} ]; then
        fun_start ${2} $1
    else
        echo "Bad start $1 cmd !"
    fi
}


## 关闭指定节点
function fun_stop() {
    local server=${1}
    local node=${2}
        cd ${GEME_DIR}
        if [ "${node}" -lt 100 ];then 
            STOP_NODE_NAME=${NODE_NAME_PREFIX}_stop_${server}@${DOMAIN}
            NODE_NAME=${NODE_NAME_PREFIX}_${server}@${DOMAIN}
            NODE_COOKIE=${COOKIE_PREFIX}_${server}${COOKIE_SUBFIX}
            echo "erl -detached -name ${STOP_NODE_NAME} -setcookie ${NODE_COOKIE} -eval \"rpc:call('${NODE_NAME}', game, stop, [])\" -s init stop" 
            ${ERL} -detached -name ${STOP_NODE_NAME} -setcookie ${NODE_COOKIE} -eval "rpc:call('${NODE_NAME}', game, stop, [])" -s init stop 
        else 
            STOP_NODE_NAME=${NODE_NAME_PREFIX}_stop_k${node}@${DOMAIN}
            NODE_NAME=${NODE_NAME_PREFIX}_${server}${node}@${DOMAIN}
            NODE_COOKIE=${COOKIE_PREFIX}_kf100${server}${COOKIE_SUBFIX}
            echo "erl -detached -name ${STOP_NODE_NAME} -setcookie ${NODE_COOKIE} -eval \"rpc:cast('${NODE_NAME}', game, stop, [])\" -s init stop" 
            ${ERL} -detached -name ${STOP_NODE_NAME} -setcookie ${NODE_COOKIE} -eval "rpc:cast('${NODE_NAME}', game, stop, [])" -s init stop 
        fi
        sleep ${DELAY}
 
    fun_kill_node_beam $NODE_NAME
}

## 单个关闭逻辑
function fun_stop_single() {
    if [  ! -z  ${SERVER_IDS} ]; then
        fun_stop $2 10
    elif [ ! -z  ${KF_NODES} ]; then
        fun_stop $2 $1
    else
        echo "Bad stop $1 cmd !"
    fi
}


# 关闭所有server节点
function fun_stop_all(){
    echo "正在关闭..."
	cd ${GAME_DIR}
	check_kf=`echo $1 |egrep "^k"`
    if [ -z "$check_kf" ] ; then
		for i in ${SERVER_IDS[@]}
		do
			fun_stop ${1} 10
		done
	else
		for i in ${KF_NODES[@]}
		do
			fun_stop $1 ${i}
		done
	fi
         echo "30秒後关闭公共進程..."
         sleep 30
   
     fun_kill_all_beam ${NODE_NAME_PREFIX}_$1
}


function fun_kill_pid(){
    if [ "${is_real_run}" == "1" ] ; then
        kill -9 $1
    else 
        echo "kill -9 $1"
    fi
}


# 杀掉某个节点
function fun_kill_node_beam(){
    ps aux | grep beam |grep -v 'grep' | grep -w "${1}" | awk '{print $2}' | while read pid
    do
        fun_kill_pid $pid
    done
}

# 杀掉所有beam进程
function fun_kill_all_beam(){
    ps aux | grep beam | grep -v grep | grep  -w $1 | awk '{print $2}' | while read pid
    do
        fun_kill_pid $pid
    done
}

# 重启server
function fun_restart_all(){
    fun_stop_all $1
    fun_start_all $1
}

# 重启server
function fun_restart(){
    fun_stop_single $1 $2
    fun_start_single $1 $2
}



#####################################
# 流程逻辑
#####################################

## 测试模式
if [ "${par1}" == "-t" ] || [ "$par2" == "-t" ] || [ "$par3" == "-t" ] ; then
    echo  -e "\n  ############### 测试模式，仅显示，不执行 ################# \n"
    is_real_run=0
fi

## 系统判断
if [ -z "$KF_NODES" ] && [ -z "$SERVER_IDS" ]; then
    echo "节点列表未配置 " && exit 1
fi

if [ -z "$DOMAIN" ]; then
    echo "域名未配置 " && exit 1
fi


case $par1 in
    start) fun_start_single $par2 $1;;	# 启动指定的服或节点
    stop) fun_stop_single $par2 $1;; 	# 关闭指定的服或节点
    start_all) fun_start_all $1;; 		# 启动所有设定的节点
    stop_all) fun_stop_all $1;; 		# 关闭所有节点
    restart_all) fun_restart_all $1;; 	# 重启指定head.sh中的所有服或节点
    restart) fun_restart $par2 $1;; 	# 重启指定head.sh中的单个服或节点
    *)
        echo "脚本使用说明："
        # echo "   100 300+ 节点的服id是 0"
        # echo "   游戏服的节点id固定是 10"
        echo "   最后的参数加 -t ，则启用测试模式.例如: sdctrl.sh start_all -t"
        echo "   svrctrl.sh g1 start_all        #启动g1_head.sh SERVER_IDS 中的所有服, 注：KF_NODES为空数组"
        echo "   svrctrl.sh g1 stop_all         #关闭g1_head.sh SERVER_IDS 中的所有服, 注：KF_NODES为空数组"
        echo "   svrctrl.sh g1 start SvrId      #使用g1_head.sh 中的参数配置, 启动g1_head.sh SERVER_IDS 中的 Svr 服, 注：KF_NODES为空数组"
        echo "   svrctrl.sh g1 stop SvrId       #使用g1_head.sh 中的参数配置, 关闭g1_head.sh SERVER_IDS 中的 Svr 服, 注：KF_NODES为空数组"
        echo "   svrctrl.sh g1 restart_all 	#重启g1_head.sh SSERVER_IDS 的所有服"
        echo "   svrctrl.sh g1 restart SvrId    #重启g1_head.sh SSERVER_IDS 中 SvrId 服"

        echo "   svrctrl.sh kf start_all        #启动kf_head.sh KF_NODES 中的所有跨服节点, 注：SERVER_IDS为空数组"
        echo "   svrctrl.sh kf stop_all         #启动kf_head.sh KF_NODES 中的所有跨服节点, 注：SERVER_IDS为空数组"
        echo "   svrctrl.sh kf start Node       #使用kf_head.sh 中的参数配置, 启动 KF_NODES 中的 Node 节点, 注：SERVER_IDS为空数组"
        echo "   svrctrl.sh kf stop Node        #使用kf_head.sh 中的参数配置, 启动 KF_NODES 中的 Node 节点, 注：SERVER_IDS为空数组"
        echo "   svrctrl.sh kf restart_all    	#重启kf_head.sh KF_NODES 中的所有跨服节点"
        echo "   svrctrl.sh kf restart NodeId   #重启kf_head.sh KF_NODES 中的 NodeId 跨服节点"

        exit 1
        ;;
esac

#wait # 等待脚本执行完成
echo "-------------------------------------------"
echo " ${1} ${2} done dir=${GAME_DIR}"
echo "-------------------------------------------"


