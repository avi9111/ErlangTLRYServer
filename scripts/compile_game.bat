:: 多线程并行编译，编译速度比较快(只编译vtnemo)
@ECHO off

:: 设置标题
TITLE compile_game

CD ..
:start
SET choice=Y
ECHO "Compiling game ..."
erl -noshell -pa ebin_deps -eval "case make:files([\"./src/tools/mmake.erl\"]) of error -> halt(1); _ -> ok end" -eval "case mmake:all(12) of up_to_date -> halt(0); error -> halt(1) end."
ECHO
ECHO "Compile finished !!!"
SET /P choice= 已经编译完成，继续编译?(Y/N):
IF %choice%==N GOTO end
IF %choice%==n GOTO end

GOTO start
:endD:\Desktop\game_base\scripts\compile_game.bat