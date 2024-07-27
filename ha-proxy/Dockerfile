# Use an official HAProxy image as the base
FROM linuxserver/yq

# Copy the entrypoint script and YAML file into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY servers.yaml /usr/local/etc/haproxy/servers.yaml
# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
CMD ["/usr/local/bin/entrypoint.sh"]
