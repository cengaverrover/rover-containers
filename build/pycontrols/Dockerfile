FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y python3-numba python3-libevdev ros-humble-rmw-cyclonedds-cpp
RUN pip3 install evdev numba pyserial
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

COPY ./rover-control-system/ /ros_ws/rover-control-system/

WORKDIR /ros_ws
RUN source /opt/ros/humble/setup.bash

WORKDIR /
COPY autostart.sh /autostart.sh
RUN chmod +x /autostart.sh

ENTRYPOINT ["/autostart.sh"]
CMD [""]
