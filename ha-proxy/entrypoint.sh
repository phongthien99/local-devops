#!/bin/bash

# Generate the HAProxy configuration file
cat <<EOF > /usr/local/etc/haproxy/haproxy.cfg
global
    log /dev/log    local0
    # log /dev/log    local1 notice
    # chroot /var/lib/haproxy
    # stats socket /run/haproxy/admin.sock mode 660 level admin
    # stats timeout 30s
    # user haproxy
    # group haproxy
    # daemon

defaults
    mode tcp
    timeout connect 5000ms
    timeout client 50000ms
    timeout server 50000ms

frontend tcp-in
    bind *:8123
    default_backend clickhouse_back

backend clickhouse_back
    balance roundrobin
EOF
i=1
# Add servers from the YAML file
servers=$(yq '.servers[]' /usr/local/etc/haproxy/servers.yaml)
for address in $servers; do
    echo "    server server${i} ${address} check" >> /usr/local/etc/haproxy/haproxy.cfg
    i=$((i+1))
done

cat /usr/local/etc/haproxy/haproxy.cfg
# Execute the passed command
exec "$@"
