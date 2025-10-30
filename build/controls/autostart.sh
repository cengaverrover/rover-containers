#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

#refresh config file(s)
cp /configs/manipulator_controller_usb.yaml /ros_ws/src/manipulator_controller/config/.
cp /configs/mobility_controller_usb.yaml /ros_ws/src/mobility_controller/config/.
cp /configs/ds4_config.yaml /ros_ws/src/rover_teleoperation/config/.
echo "updated configs"

declare -A MODES=(
    [terminal]="python3 autostart.launch.py"
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