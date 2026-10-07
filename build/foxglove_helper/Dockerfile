FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y python3-numba \
python3-libevdev \
ros-humble-rmw-cyclonedds-cpp \
python3-usb \
ros-humble-robot-state-publisher \
ros-humble-joint-state-publisher \
ros-humble-foxglove-bridge \
ros-humble-ros-gz-bridge \
ros-humble-tf2-ros \
nodejs \
ros-humble-joy \
npm

RUN npm install -g http-server

COPY ./gazebo-simulation/ /ros_ws/gazebo-simulation/

WORKDIR /ros_ws
RUN source /opt/ros/humble/setup.bash

WORKDIR /
COPY autostart.sh /autostart.sh
RUN chmod +x /autostart.sh

ENTRYPOINT ["/autostart.sh"]
CMD [""]
