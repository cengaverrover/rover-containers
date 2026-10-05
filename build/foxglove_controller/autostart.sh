#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash

declare -A MODES=(
    [terminal]="python3 /ros_ws/src/foxglove-controller/foxglove_controller/foxglove_controller.launch.py ${@:2}"
    [debug]="bash"
)

if [[ -z "$1" ]]; then
    echo "Available modes:"
    for key in "${!MODES[@]}"; do
        echo "  - $key"
    done
    exit 0
fi

MODE="$1"

if [[ -n "${MODES[$MODE]}" ]]; then
    echo "Running $MODE mode..."
    exec ${MODES[$MODE]}
else
    echo "Invalid mode: $MODE"
    echo "Available modes:"
    for key in "${!MODES[@]}"; do
        echo "  - $key"
    done
    exit 1
fi
