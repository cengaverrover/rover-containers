#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

#refresh config file(s)
cp /configs/bno055_config.yaml /ros_ws/src/bno055/config/bno055_config.yaml
echo "updated configs"

declare -A MODES=(
    [terminal]="ros2 run bno055 bno055 --ros-args --params-file /ros_ws/src/bno055/config/bno055_config.yaml"
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