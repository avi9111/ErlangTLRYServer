@ECHO off

:: 设置标题  九零一 起  玩www.90   175.com
TITLE compile_all

CD ..
SET root=%cd%

ECHO "开始编译服务端代码 ..."
CALL rebar3 compile
ECHO "完成编译服务端代码 !!"

SET from=%root%\_build\default\lib\
SET game=%root%\ebin\
SET deps=%root%\ebin_deps\

CD %from%
ECHO "开始复制 beam ..."
FOR /D %%i IN (*) DO (
	IF "%%i" neq "vtnemo" (
		XCOPY /S/E/Y/Q "%from%%%i\ebin\*.*" "%deps%"
	) ELSE (
		XCOPY /S/E/Y/Q "%from%%%i\ebin\*.*" "%game%"
	)
)
ECHO "完成复制 beam !!"
IF EXIST %root%\tmp RD /Q/S %root%\tmp

ECHO "Compile all finished !!!"
ECHO "Window close in 3 seconds"
PING 0.0.0.0  -n 3 > null