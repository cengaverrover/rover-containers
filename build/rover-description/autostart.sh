#!/bin/bash
source /opt/ros/humble/setup.bash
source /ros_ws/install/setup.bash

exec ros2 launch cengaver_rover_description rover.launch.py use_foxglove:=true use_ds4:=true
