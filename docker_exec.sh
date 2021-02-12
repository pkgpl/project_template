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
        lab)
            echo "http://localhost:8888 or http://127.0.0.1:8888"
            echo "password: $JUPYTER_PASSWORD"
            $EXEC_BG jupyter lab --no-browser --ip=0.0.0.0 --NotebookApp.token=$JUPYTER_PASSWORD
            ;;
        notebook)
            echo "http://localhost:8888 or http://127.0.0.1:8888"
            echo "password: $JUPYTER_PASSWORD"
            $EXEC_BG jupyter notebook --no-browser --ip=0.0.0.0 --NotebookApp.token=$JUPYTER_PASSWORD
            ;;
        smi)
            $EXEC_FG nvidia-smi
            ;;
    esac
fi
