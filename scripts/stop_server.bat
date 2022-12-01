@ECHO off

SET BAT_PATH=%cd%\

:: 停止游戏服务器
FOR %%s IN (2 12) DO START /d%BAT_PATH% stop_node.bat %%s 10

:: 停止跨服中心服务器(所有节点)
FOR %%n IN (100 300) DO START /d%BAT_PATH% stop_node.bat 0 %%n
