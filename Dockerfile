FROM debian:9.8-slim

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /

RUN apt-get update && apt-get install -y --no-install-recommends \
    #curl \
    iproute2 \
    iputils-ping \
    mininet \
    net-tools \
    openvswitch-switch \
    openvswitch-testcontroller \
    #x11-xserver-utils \
    #xterm \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /ENTRYPOINT.sh \
 && ln /usr/bin/ovs-testcontroller /usr/bin/controller

EXPOSE 6633 6653 6640

ENTRYPOINT ["/ENTRYPOINT.sh"]
