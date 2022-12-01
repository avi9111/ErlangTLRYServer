@ECHO off

:: ��������
SET SERVER_ID=20002
SET NODE_ID=10
:: SET IP=192.168.0.102
SET NODE_BASE=vt_dev
SET COOKIE=vt_dev
SET CONFIG=vtnemo
SET NODE_NAME=vtnemo_base_s20002@base.vtnemo.com
ipconfig ^ | findstr "IPv4" >ipadd.txt
for /f "tokens=2 delims=:" %%i in (ipadd.txt) do set ipstr=%%i
for /f "tokens=1 delims= " %%i in ('echo %ipstr%') do set IP=%%i

del ipadd.txt

:: ��̬����
IF %SERVER_ID% EQU 0 (
    SET CONFIG=%CONFIG%_kf
) ELSE (
    SET CONFIG=%CONFIG%_s%SERVER_ID%
)

IF %NODE_ID% EQU 10 (
    :: SET NODE_NAME=%NODE_BASE%_s%SERVER_ID%@%IP%
	SET NODE_TITLE=s%SERVER_ID%
	SET COOKIE=%COOKIE%_s%SERVER_ID%
) ELSE (
	:: SET NODE_NAME=%NODE_BASE%_k%NODE_ID%@%IP%
	SET NODE_TITLE=k%NODE_ID%
	SET COOKIE=%COOKIE%_kf
)

:: ���ñ���
TITLE %NODE_TITLE%

:: �����ڵ�
CD ../
rd /s /q log
ECHO �����ڵ� - %NODE_ID%
start werl +P 1024000 +K true -name %NODE_NAME% -setcookie tl_s10001.Jmt6w.ci8qw -config config\%CONFIG% -pa ebin -pa ebin_deps -s game start -extra %NODE_ID%
exit