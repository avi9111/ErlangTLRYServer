@ECHO off

:: ���ñ���  ����һ ��  ��www.90   175.com
TITLE compile_all

CD ..
SET root=%cd%

ECHO "��ʼ�������˴��� ..."
CALL rebar3 compile
ECHO "��ɱ������˴��� !!"

SET from=%root%\_build\default\lib\
SET game=%root%\ebin\
SET deps=%root%\ebin_deps\

CD %from%
ECHO "��ʼ���� beam ..."
FOR /D %%i IN (*) DO (
	IF "%%i" neq "vtnemo" (
		XCOPY /S/E/Y/Q "%from%%%i\ebin\*.*" "%deps%"
	) ELSE (
		XCOPY /S/E/Y/Q "%from%%%i\ebin\*.*" "%game%"
	)
)
ECHO "��ɸ��� beam !!"
IF EXIST %root%\tmp RD /Q/S %root%\tmp

ECHO "Compile all finished !!!"
ECHO "Window close in 3 seconds"
PING 0.0.0.0  -n 3 > null