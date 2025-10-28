#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

mkdir -p /ros_ws/src/rplidar_ros2/config/
cp /configs/rplidar_config.yaml /ros_ws/src/rplidar_ros2/config/.
echo "updated configs"

if [ "$1" == "debug" ]; then
    echo "entering debug mode..."
    exec bash
elif [ "$1" == "default" ]; then
    echo "running default mode..."
    exec ros2 launch rplidar_ros rplidar.launch.py
else
    echo -e "arguments: \n    default, debug"
    exit 0
fi