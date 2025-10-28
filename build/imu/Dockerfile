FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp vim
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

COPY ./bno055/ /ros_ws/src/.
RUN mkdir -p /ros_ws/src/bno055/config/

WORKDIR /ros_ws
RUN source /opt/ros/humble/setup.bash && colcon build

WORKDIR /
COPY autostart.sh /autostart.sh
RUN chmod +x /autostart.sh

ENTRYPOINT ["/autostart.sh"]
CMD debug
