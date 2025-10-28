FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y \
    git vim ros-humble-rmw-cyclonedds-cpp ros-humble-foxglove-bridge ros-humble-xacro ros-humble-robot-localization
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp


WORKDIR /ros_ws/
COPY rover_teleoperation /ros_ws/src/rover_teleoperation
COPY mobility_controller /ros_ws/src/mobility_controller
COPY manipulator_controller /ros_ws/src/manipulator_controller


RUN apt update && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y && \
    source /opt/ros/${ROS_DISTRO}/setup.bash && \
    colcon build --symlink-install


WORKDIR /
COPY autostart.launch.py /.
COPY autostart.sh /.
RUN chmod +x /autostart.sh


ENTRYPOINT ["/autostart.sh"]
CMD ["placeholder"]