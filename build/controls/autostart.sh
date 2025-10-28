#!/bin/bash
# Cengaver Rover Docker container - Author:DenavDot

set -e #abort on error

source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

#refresh config file(s)
cp /configs/manipulator_controller_usb.yaml /ros_ws/src/manipulator_controller/config/.
cp /configs/mobility_controller_usb.yaml /ros_ws/src/mobility_controller/config/.
cp /configs/ds4_config.yaml /ros_ws/src/rover_teleoperation/config/.

if [ "$1" == "debug" ]; then
    echo "entering debug mode..."
    exec bash
elif [ "$1" == "default" ]; then
    echo "running default mode..."
    exec python3 autostart.launch.py
else
    echo -e "arguments: \n   default, debug"
    exit 0
fi
