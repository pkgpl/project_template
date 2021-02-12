#!/usr/bin/sh 
source Env.sh

echo "Building new docker image for $USER_NAME (uid=$USER_ID, gid=$GROUP_ID)"
echo "  image name: $IMAGE_NAME:$IMAGE_TAG"
echo "  project directory: $PROJECT_DIR"

docker build \
  --rm \
  --build-arg username=$USER_NAME \
  --build-arg uid=$USER_ID \
  --build-arg gid=$GROUP_ID \
  --build-arg project_dir=$PROJECT_DIR \
  --file Dockerfile.gpu \
  --tag $IMAGE_NAME:$IMAGE_TAG \
  ../
