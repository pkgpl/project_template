#!/bin/sh 
source ./Env.sh

if [ $# -gt 0 ] && [ $1 == "-h" ]; then
    echo "Run Container: $PROJECT_NAME"
    echo "$0 [argument]"
    echo "  no argument: docker run (publish ports for jupyter & tensorboard)"
    echo "  x11:         docker run with X11 forwarding"
    exit 0
fi

if [ $DEVICE == "gpu" ]; then
    RUNTIME="--runtime nvidia"
else
    RUNTIME=""
fi

echo "Starting docker image: $IMAGE_NAME:$IMAGE_TAG"
echo "  user in container: $USER_NAME (uid=$USER_ID, gid=$GROUP_ID)"
echo "  project directory: $WORKDIR"

if [ $# == 0 ]; then
    docker run $RUNTIME \
      --tty \
      --rm \
      --name $PROJECT_NAME \
      --volume $PWD/../bin:$WORKDIR/bin \
      --volume $PWD/../data:$WORKDIR/data \
      --volume $PWD/../doc:$WORKDIR/doc \
      --volume $PWD/../results:$WORKDIR/results \
      --volume $PWD/../src:$WORKDIR/src \
      --publish 8888:$PORT_JUPYTER \
      --publish 6006:$PORT_TENSORBOARD \
      --ipc=host \
      $IMAGE_NAME &
else
    case $1 in
        x11)
            docker run $RUNTIME \
              --tty \
              --rm \
              --name $PROJECT_NAME \
              --volume $PWD/../bin:$WORKDIR/bin \
              --volume $PWD/../data:$WORKDIR/data \
              --volume $PWD/../doc:$WORKDIR/doc \
              --volume $PWD/../results:$WORKDIR/results \
              --volume $PWD/../src:$WORKDIR/src \
              -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
              -v $HOME/.Xauthority:/home/$USER_NAME/.Xauthority \
              --env="DISPLAY" \
              --net=host \
              --ipc=host \
              $IMAGE_NAME &
            ;;
        *)
            echo ""
            echo "Error: Wrong argument"
            exit 1
            ;;
    esac
fi

echo ""
sleep 1
echo "$ docker ps"
sleep 2
docker ps

