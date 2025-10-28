#!/bin/bash

if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "help" ]; then
        echo "Usage: $0 <name>"
        echo "Available options:"
        for i in $(find "$(dirname "$(readlink -f "$0")")"/../build/ -mindepth 1 -maxdepth 1 -type d); do
                echo "    $(basename "$i")"
        done
        exit 1
fi

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
CONFIG_DIR="$(readlink -f "$SCRIPT_DIR/../config")"

docker run \
  --privileged \
  --ipc=host \
  --net=host \
  -v "$CONFIG_DIR:/configs" \
  -it cengaver/"$1":latest \
  "${@:2}"