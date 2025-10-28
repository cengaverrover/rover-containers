#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

#refresh config file(s)
cp /configs/bno055_config.yaml /ros_ws/src/bno055/config/bno055_config.yaml
echo "updated configs"

if [ "$1" == "debug" ]; then
    echo "entering debug mode..."
    exec bash
elif [ "$1" == "default" ]; then
    echo "running default mode..."
    exec ros2 run bno055 bno055 --ros-args --params-file /ros_ws/src/bno055/config/bno055_config.yaml
else
    echo -e "arguments: \n   default, debug"
    exit 0
fi