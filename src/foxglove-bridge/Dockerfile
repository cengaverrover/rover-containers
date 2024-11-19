# Cengaver Rover Dockerfile - denavdot/v2
# latest change(s): cyclonedds , denav -> denavdot
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp ros-humble-foxglove-bridge 
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /home
RUN mkdir src && cd src && git clone https://github.com/cengaverrover/cengaver_rover_description.git
RUN source /opt/ros/humble/setup.bash && rosdep update && rosdep install --from-path src --ignore-src -y
RUN source /opt/ros/humble/setup.bash && colcon build

WORKDIR /
COPY as.sh /autostart.sh
RUN chmod +x /autostart.sh
ENTRYPOINT ["/autostart.sh"]
