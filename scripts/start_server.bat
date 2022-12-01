@ECHO off

SET BAT_PATH=%cd%\
SET LOG_PATH=%BAT_PATH%\..\log
DEL /F /S /Q %LOG_PATH%\*.log

:: 启动跨服中心服务器
::FOR %%n IN (100 300) DO START /D%BAT_PATH% start_node.bat 0 %%n
FOR %%n IN (100) DO START /D%BAT_PATH% start_node.bat 0 %%n

:: 启动游戏服务器
::FOR %%s IN (2 12) DO START /D%BAT_PATH% start_node.bat %%s 10
::FOR %%s IN (2) DO START /D%BAT_PATH% start_node.bat %%s 10