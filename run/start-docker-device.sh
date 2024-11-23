#!/bin/bash

options=("lidar" "lidar-simulation" "imu" "slam-toolbox" "foxglove-bridge")

if [ -z "$1" ]; then
	echo "Usage: $0 <name>"
 	echo "Available options:"
	for i in "${options[@]}"; do
		echo "$i"
	done
	exit 1
fi
if [ "$1" == "lidar-simulation" ]; then
	docker run --privileged --net=host --ipc=host -it cengaver/lidar:latest bash /autostart.sh use_sim_time:=true
	wait ; exit
fi
docker run --privileged --ipc=host --net=host -it cengaver/"$1":latest bash /autostart.sh $@
