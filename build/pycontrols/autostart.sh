#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash

declare -A MODES=(
    [drive]="python3 /ros_ws/rover-control-system/src/drive/jetson_drive_processor.py"
    [armik]="python3 /ros_ws/rover-control-system/src/arm/jetson_arm_processor_ik.py"
    [armfk]="python3 /ros_ws/rover-control-system/src/arm/jetson_arm_processor_fk.py"
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
