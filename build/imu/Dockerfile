# Cengaver Rover IMU Dockerfile - denavdot/v3
# latest change(s): rename to bno055
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /home
COPY ./bno055_ros2/ /home/src/.
RUN source /opt/ros/humble/setup.bash && colcon build --cmake-args=-DCMAKE_BUILD_TYPE='Release' --packages-select bno055_ros2

WORKDIR /
COPY as.sh /autostart.sh
RUN chmod +x /autostart.sh
