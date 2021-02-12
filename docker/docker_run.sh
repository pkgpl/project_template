#!/usr/bin/sh 
source Env.sh

WORKDIR=/home/$USER_NAME/$PROJECT_DIR

echo "Starting docker image: $IMAGE_NAME:$IMAGE_TAG"
echo "  user in container: $USER_NAME (uid=$USER_ID, gid=$GROUP_ID)"
echo "  project directory: $WORKDIR"

docker run --tty \
  --runtime nvidia \
  --name $PROJECT_NAME \
  --volume $PWD/../bin:$WORKDIR/bin \
  --volume $PWD/../data:$WORKDIR/data \
  --volume $PWD/../doc:$WORKDIR/doc \
  --volume $PWD/../notebooks:$WORKDIR/notebooks \
  --volume $PWD/../results:$WORKDIR/results \
  --volume $PWD/../src:$WORKDIR/src \
  --publish 8888:$PORT_JUPYTER \
  --publish 6006:$PORT_TENSORBOARD \
  $IMAGE_NAME &

docker ps
