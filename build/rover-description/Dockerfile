# Cengaver Rover Descriptor Dockerfile - denavdot/v1
# latest change(s): -
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp ros-humble-foxglove-bridge ros-humble-xacro ros-humble-robot-localization ros-humble-usb-cam
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /ros_ws/
COPY ./cengaver_rover_description /ros_ws./src/.
COPY ./rover_teleoperation/ /ros_ws/src/.
COPY ./mobility_controller /ros_ws/src/.
COPY ./manipulator_controller /ros_ws/src/.
#COPY ./bno055_ros2 /ros_ws/src/. disabled for maintenance
RUN apt update && rosdep update && rosdep install --from-path src --ignore-src -y && colcon build
 
WORKDIR /
COPY autostart.sh /autostart.sh
RUN chmod +x /autostart.sh
