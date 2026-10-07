FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y ros-humble-joy ros-humble-rmw-cyclonedds-cpp python3-usb python3-pip python3-numba python3-libevdev
RUN pip3 install evdev numba
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

RUN source /opt/ros/humble/setup.bash

COPY ./foxglove-controller/ /ros_ws/src/foxglove-controller/
COPY ./rover-control-system/ /deps/rover-control-system/

WORKDIR /deps/rover-control-system
RUN pip install --upgrade "setuptools<80" wheel pip
RUN pip install -e .

WORKDIR /
COPY autostart.sh /autostart.sh
RUN chmod +x /autostart.sh

ENTRYPOINT ["/autostart.sh"]
CMD [""]
