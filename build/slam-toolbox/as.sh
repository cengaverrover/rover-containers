#!/bin/bash

source /opt/ros/humble/setup.bash

exec ros2 launch slam_toolbox online_async_launch.py $@
