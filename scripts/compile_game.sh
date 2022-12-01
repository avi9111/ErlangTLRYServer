#!/bin/bash


erl -noshell -pa _build/default/lib/lager/ebin -eval "case make:files([\"./src/tools/mmake.erl\"]) of error -> halt(1); _ -> ok end" -eval "case mmake:all(8) of up_to_date -> halt(0); error -> halt(1) end."
echo "<br/>"
