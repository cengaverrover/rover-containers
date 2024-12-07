# Cengaver Rover Descriptor Dockerfile - denavdot/v1
# latest change(s): -
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp ros-humble-foxglove-bridge ros-humble-xacro ros-humble-robot-localization ros-humble-usb-cam
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

COPY ./rover_mobility_interfaces/ /ros_ws/src/.
WORKDIR /ros_ws/
RUN source /opt/ros/humble/setup.bash && rosdep update && rosdep install --from-path src --ignore-src -y && colcon build
COPY ./cengaver_rover_description/ /ros_ws/src/.
RUN source /opt/ros/humble/setup.bash && source /ros_ws/install/setup.bash && colcon build --packages-select 'cengaver_rover_description'
 
WORKDIR /
COPY autostart.sh /autostart.sh
RUN chmod +x /autostart.sh
