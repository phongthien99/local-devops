# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install Telepresence prerequisites
RUN apt-get update && \
    apt-get install -y curl iproute2 sshfs iptables iproute2 netcat&& \
    rm -rf /var/lib/apt/lists/*

# Download and install the Telepresence binary
COPY telepresence /usr/local/bin/telepresence
# Set the default command to run Telepresence
CMD ["/bin/sh", "-c", "/usr/local/bin/telepresence connect && tail -f /dev/null"]

# telnet sigma-media-live-api.sigma-media-live
