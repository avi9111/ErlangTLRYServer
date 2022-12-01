#!/bin/bash

old_dir=`pwd`
script_dir=`dirname $0`
cd $script_dir/..
root_dir=`pwd`

echo "开始编译服务端 ..."
./rebar3 compile

echo "<br/>"
echo "所有操作完成 !!!"
cd ${old_dir}
echo "<br/>"
