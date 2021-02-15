# project name without space, lower case for image name
PROJECT_NAME=my_project

# device: cpu or gpu
DEVICE=gpu

# docker image name
IMAGE_NAME=$PROJECT_NAME
IMAGE_TAG=latest

# user name in container
#USER_NAME=dockeruser
USER_NAME=`whoami`

# work directory name
PROJECT_DIR=$PROJECT_NAME
WORKDIR=/home/$USER_NAME/$PROJECT_DIR

USER_ID=`id -u`
GROUP_ID=`id -g`
#USER_ID=$UID
#GROUP_ID=$GID

PORT_JUPYTER=8888
PORT_TENSORBOARD=6006

GPU_FROM=pkgpl/pkgpl_base:0.20-gpu-horovod0.20.0-su-rsf
CPU_FROM=pkgpl/pkgpl_base:0.20-cpu-horovod0.20.0-su-rsf

