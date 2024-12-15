#!/bin/bash

#for downladable/exception docker images:

if [ "$1" == "lidar-simulation" ]; then
	docker run --privileged --net=host --ipc=host -it cengaver/lidar:latest bash /autostart.sh use_sim_time:=true
	wait ; exit
elif [ "$1" == "micro-ros-agent" ]; then
	docker run -it --net=host microros/micro-ros-agent:humble udp4 -p 9999
	wait ; exit
fi


#for built docker images:

if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "help" ]; then
	echo "Usage: $0 <name>"
 	echo "Available options:"
	for i in $(find "$(dirname "$(readlink -f "$0")")"/../build/ -mindepth 1 -maxdepth 1 -type d); do
  		echo "    $(basename "$i")"
	done
	echo -e "    micro-ros-agent \n    lidar-simulation"
	exit 1
fi

docker run \
	--privileged \
       	--ipc=host \
	--net=host \
	-it cengaver/"$1":latest \
       	/autostart.sh
