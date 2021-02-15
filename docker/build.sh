#!/usr/bin/sh 

source ./Env.sh

if [ $DEVICE == "gpu" ]; then
    DOCKERFROM=$GPU_FROM
else
    DOCKERFROM=$CPU_FROM
fi

echo "Building new docker image for $USER_NAME (uid=$USER_ID, gid=$GROUP_ID), device=$DEVICE"
echo "  image name: $IMAGE_NAME:$IMAGE_TAG"
echo "  project directory: $PROJECT_DIR"

docker build \
  --rm \
  --build-arg dockerfrom=$DOCKERFROM \
  --build-arg username=$USER_NAME \
  --build-arg uid=$USER_ID \
  --build-arg gid=$GROUP_ID \
  --build-arg project_dir=$PROJECT_DIR \
  --file Dockerfile \
  --tag $IMAGE_NAME:$IMAGE_TAG \
  ../
