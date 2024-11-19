# Cengaver Rover Slam Toolbox Dockerfile - denavdot/v2
# latest change(s): cyclonedds , denav -> denavdot
FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y git ros-humble-rmw-cyclonedds-cpp ros-humble-slam-toolbox
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /
COPY as.sh /autostart.sh
RUN chmod +x /autostart.sh
ENTRYPOINT ["/autostart.sh"]
