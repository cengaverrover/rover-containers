#!/bin/bash
source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

exec ros2 run bno055_ros2 bno055_publisher /dev/i2c-1 0x28 $@
