#!/bin/bash
source /opt/ros/humble/setup.bash
source /home/install/setup.bash

trap 'kill "${pids[@]}"' SIGINT
pids=()

ros2 launch cengaver_rover_description description_foxglove.launch.py $@ &
pids+=($!)
ros2 launch foxglove_bridge foxglove_bridge_launch.xml &
pids+=($!)

wait "${pids[@]}"
