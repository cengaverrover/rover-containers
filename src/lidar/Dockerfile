# Cengaver Rover Lidar Dockerfile - denavdot/v2
# latest change(s): cyclonedds , denav -> denavdot
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /home
RUN mkdir src && cd src && git clone https://github.com/babakhani/rplidar_ros2.git
RUN source /opt/ros/humble/setup.bash && colcon build

WORKDIR /
COPY as.sh /autostart.sh
RUN chmod +x /autostart.sh
ENTRYPOINT ["/autostart.sh"]
