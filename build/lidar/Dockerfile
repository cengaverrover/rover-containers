# Cengaver Rover Lidar Dockerfile - denavdot/v3
# latest change(s): repositories are copied instead of cloned
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /home
COPY ./rplidar_ros2/ /home/src/.
RUN source /opt/ros/humble/setup.bash && colcon build

WORKDIR /
COPY as.sh /autostart.sh
RUN chmod +x /autostart.sh
