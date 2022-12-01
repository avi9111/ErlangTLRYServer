
:: 编译并热更修改的模块  九  零  一起玩www.9  0 175.com
@ECHO off
TITLE hot_game

:: 设置变量
SET COOKIE=vt_dev
SET NODE_PREFIX=vt_dev
SET IP=192.168.1.242

CD ..
ECHO "Compiling game ... "
erl -noshell -pa ebin_deps -eval "case make:files([\"./src/tools/mmake.erl\"]) of error -> halt(1); _ -> ok end" -eval "case mmake:all(12) of up_to_date -> halt(0); error -> halt(1) end."
ECHO


ECHO "Hot update server nodes ... "
FOR %%i IN (2 12) DO erl -noshell -pa ebin -name vt_hot%%i@%IP% -setcookie %COOKIE%_s%%i -eval "case net_adm:ping('%NODE_PREFIX%_s%%i@%IP%') of pong -> rpc:cast('%NODE_PREFIX%_s%%i@%IP%', svr_hot_agent, hot, []); _ -> io:format(\"No nodes!!!\") end, halt(1)"

ECHO "Hot update kf nodes ... "
erl -noshell -pa ebin -name vt_hot_kf@%IP% -setcookie %COOKIE%_kf -eval "case net_adm:ping('%NODE_PREFIX%_k100@%IP%') of pong -> rpc:cast('%NODE_PREFIX%_k100@%IP%', svr_hot_agent, hot, []); _ -> io:format(\"No nodes!!!\") end, halt(1)"


ECHO "Hot game finished !!!"
ECHO "Window close in 3 seconds"
PING 0.0.0.0  -n 3 > null