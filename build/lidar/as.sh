#!/bin/bash

source /opt/ros/humble/setup.bash
source /home/install/setup.bash

exec ros2 launch rplidar_ros rplidar.launch.py --ros-args -r /scan:=/scan_raw -p frame_id:=laser_frame $@
