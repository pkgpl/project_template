#!/bin/sh 
source ./Env.sh

if [ $DEVICE == "gpu" ]; then
    RUNTIME="--runtime nvidia"
else
    RUNTIME=""
fi

echo "Starting docker image: $IMAGE_NAME:$IMAGE_TAG"
echo "  user in container: $USER_NAME (uid=$USER_ID, gid=$GROUP_ID)"
echo "  project directory: $WORKDIR"

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
  -h docker \
  $IMAGE_NAME &

echo ""
sleep 1
echo "$ docker ps"
sleep 2
docker ps
