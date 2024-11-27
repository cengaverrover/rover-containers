# Cengaver Rover Descriptor Dockerfile - denavdot/v1
# latest change(s): -
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp ros-humble-foxglove-bridge ros-humble-xacro ros-humble-robot-localization ros-humble-usb-cam
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /home
COPY ./rover_mobility_interfaces/ /home/src/.
RUN source /opt/ros/humble/setup.bash && rosdep update && rosdep install --from-path src --ignore-src -y
RUN source /opt/ros/humble/setup.bash && colcon build 
COPY ./cengaver_rover_description/ /home/src/.
RUN source /opt/ros/humble/setup.bash && source /home/install/setup.bash && colcon build --packages-select 'cengaver_rover_description'
 
WORKDIR /
COPY as.sh /autostart.sh
RUN chmod +x /autostart.sh
