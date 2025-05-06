#!/bin/bash

if [ "$2" ]; then
    WORKDIR="$1"
elif [ "$1" == "gui" ]; then
    WORKDIR="/ns-3-mmwave-oran"
else
    WORKDIR="/flexric"
fi

if [ "$1" == "ric" ]; then
    ARG="./build/examples/ric/nearRT-RIC"
elif [ "$1" == "xapp_gui" ]; then
    ARG="python3 xApp_trigger.py"
elif [ "$1" == "xapp" ]; then
    ARG="./build/examples/xApp/c/ctrl/xapp_rc_handover_ctrl"
    # ARG="./build/examples/xApp/c/ctrl/orange_xapp_energy_saving_with_CU"
    # ARG="./build/examples/xApp/c/ctrl/xapp_handover_with_rule"
elif [ "$1" == "build" ]; then
    ARG="cmake --build build"
elif [ "$1" == "gui" ]; then
    ARG="python3 gui_trigger.py"
else
    ARG="/bin/bash"
fi


exec docker exec -w $WORKDIR -it ns-o-ran-flexric-flexric-1 $ARG
