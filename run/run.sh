#!/bin/bash

if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "help" ]; then
        echo "Usage: $0 <name>"
        echo "Available options:"
        for i in $(find "$(dirname "$(readlink -f "$0")")"/../build/ -mindepth 1 -maxdepth 1 -type d); do
                echo "    $(basename "$i")"
        done
        exit 1
fi

# accept X11 gui requests from docker
xhost +local:docker

# find all configs' directory
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
CONFIG_DIR="$(readlink -f "$SCRIPT_DIR/../config")"

# run docker
docker run \
  --privileged \
  --ipc=host \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -v "$CONFIG_DIR:/configs" \
  -it cengaver/"$1":latest \
  "${@:2}"