#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

mkdir -p /ros_ws/src/rplidar_ros2/config/
cp /configs/rplidar_config.yaml /ros_ws/src/rplidar_ros2/config/.
echo "updated configs"

declare -A MODES=(
    [terminal]="ros2 launch rplidar_ros rplidar.launch.py"
    [visual]="ros2 launch rplidar_ros view_rplidar.launch.py"
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