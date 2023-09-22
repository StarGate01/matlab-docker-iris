#!/usr/bin/env bash

cd "${0%/*}"

docker build -t stargate01/matlab:r2023a-iris .

GID_VIDEO=$(getent group video | awk -F: '{printf "%d\n", $3}')
GID_RENDER=$(getent group render | awk -F: '{printf "%d\n", $3}')

SOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm -it --net=host --ipc=host --privileged -v $HOME:$HOME -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -e DISPLAY=$DISPLAY --user=$(id -u):$(id -g) --group-add $GID_VIDEO --group-add $GID_RENDER --shm-size=4G stargate01/matlab:r2023a-iris-mod bash -c "matlab ; bash"