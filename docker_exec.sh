#!/bin/sh 
source docker/Env.sh

if [ $# -gt 0 ] && [ $1 == "-h" ]; then
    echo "no argument: bash"
    echo "lab: jupyter lab"
    echo "notebook: jupyter notebook"
    echo "smi: nvidia-smi"
    exit 0
fi

EXEC_FG="docker exec -it $PROJECT_NAME"
EXEC_BG="docker exec -d $PROJECT_NAME"
JUPYTER_PASSWORD="pkgpl"

if [ $# == 0 ]; then
    $EXEC_FG bash
else
    case $1 in
        lab|notebook)
            IP=`curl ifconfig.me`
            USER=`whoami`
            echo "http://localhost:$PORT_JUPYTER or http://127.0.0.1:$PORT_JUPYTER"
            echo "  for ssh tunneling: ssh -N -L $PORT_JUPYTER:localhost:$PORT_JUPYTER $USER@$IP"
            echo "  password: $JUPYTER_PASSWORD"
            $EXEC_BG jupyter $1 --no-browser --ip=0.0.0.0 --NotebookApp.token=$JUPYTER_PASSWORD
            ;;
        smi)
            $EXEC_FG nvidia-smi
            ;;
    esac
fi
