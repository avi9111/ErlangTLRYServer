:: ���̲߳��б��룬�����ٶȱȽϿ�(ֻ����vtnemo)
@ECHO off
CD ..
erl -noshell -pa ebin_deps -eval "case make:files([\"./src/tools/mmake.erl\"]) of error -> halt(1); _ -> ok end" -eval "case mmake:all(12) of up_to_date -> halt(0); error -> halt(1) end."

pause