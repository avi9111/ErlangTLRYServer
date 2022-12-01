#!/bin/bash

game_node=$1
cookie=$2
hot_node=$3


# echo "Start compiling ..."
# erl -noshell -pa _build/default/lib/lager/ebin -eval "case make:files([\"./src/tools/mmake.erl\"]) of error -> halt(1); _ -> ok end" -eval "case mmake:all(8) of up_to_date -> halt(0); error -> halt(1) end."
# echo "<br/>"

echo "Hot updating ... "
erl -noshell -pa _build/default/lib/vtnemo/ebin -name ${hot_node} -setcookie ${cookie} -eval "rpc:call('${game_node}', svr_hot_agent, hot, [])" -s init stop &
echo "<br/>"
