# Cengaver Rover Foxglove Dockerfile - denavdot/v3
# latest change(s): rover_description now initializes before bridge is started, repositories are copied instead of cloned
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp ros-humble-foxglove-bridge 
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /home
COPY ./cengaver_rover_description/ /home/src/.
RUN source /opt/ros/humble/setup.bash && rosdep update && rosdep install --from-path src --ignore-src -y
RUN source /opt/ros/humble/setup.bash && colcon build

WORKDIR /
COPY as.sh /autostart.sh
RUN chmod +x /autostart.sh
ENTRYPOINT ["/autostart.sh"]
