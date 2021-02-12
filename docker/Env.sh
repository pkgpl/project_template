# project name without space
PROJECT_NAME=my_project

# docker image name
IMAGE_NAME=$PROJECT_NAME
IMAGE_TAG=latest

# user name in container
#USER_NAME=dockeruser
USER_NAME=`whoami`

# work directory name
PROJECT_DIR=$PROJECT_NAME

USER_ID=`id -u`
GROUP_ID=`id -g`
#USER_ID=$UID
#GROUP_ID=$GID

PORT_JUPYTER=8888
PORT_TENSORBOARD=6006
