#!/bin/sh 
source Env.sh

WORKDIR=/home/$USER_NAME/$PROJECT_DIR

echo "Starting docker image: $IMAGE_NAME:$IMAGE_TAG"
echo "  user in container: $USER_NAME (uid=$USER_ID, gid=$GROUP_ID)"
echo "  project directory: $WORKDIR"

docker run --tty \
  --name $PROJECT_NAME \
  --volume $PWD/../bin:$WORKDIR/bin \
  --volume $PWD/../data:$WORKDIR/data \
  --volume $PWD/../doc:$WORKDIR/doc \
  --volume $PWD/../results:$WORKDIR/results \
  --volume $PWD/../src:$WORKDIR/src \
  --publish 8888:$PORT_JUPYTER \
  --publish 6006:$PORT_TENSORBOARD \
  $IMAGE_NAME &

sleep 2
echo "$ docker ps"
docker ps
