#!/bin/bash
source /opt/ros/humble/setup.bash
source /home/install/setup.bash

exec ros2 launch cengaver_rover_description rsp.launch.py use_foxglove:=true use_control:=true use_usb_cam:=true
