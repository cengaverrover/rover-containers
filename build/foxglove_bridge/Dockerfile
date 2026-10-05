FROM ros:humble
SHELL ["/bin/bash","-c"]

RUN apt-get update && apt-get install -y ros-humble-rmw-cyclonedds-cpp ros-humble-foxglove-bridge
ENV RMW_IMPLEMENTATION rmw_cyclonedds_cpp

WORKDIR /
COPY autostart.sh /autostart.sh
RUN chmod +x /autostart.sh

ENTRYPOINT ["/autostart.sh"]
CMD [""]
