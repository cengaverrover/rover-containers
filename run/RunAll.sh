#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "help" ]; then
        echo "Usage: $0 <option>"
        echo "Available options:"
        echo "    live: Run containers attached to this terminal"
        echo "    restart: Run containers detached with automatic restart"
        exit 1
fi

if [ "$1" == "live" ]; then
        docker-compose -f "$DIR/docker-compose.yaml" up --remove-orphans
elif [ "$1" == "restart" ]; then
        docker-compose -f "$DIR/docker-compose.yaml" -f "$DIR/docker-compose-restart.yaml" up -d --remove-orphans
else
        echo "Unknown option: $1"
        exit 1
fi
