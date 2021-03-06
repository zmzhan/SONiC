#!/bin/bash

rm -f /var/run/rsyslogd.pid
service rsyslog start

VLAN_IFACE_NAME=`sonic-cfggen -m /etc/sonic/minigraph.xml -v "minigraph_vlan_interfaces[0]['attachto']"`

# Wait for the VLAN to come up (i.e., 'ip link show' returns 0)
until ip link show $VLAN_IFACE_NAME > /dev/null 2>&1; do
    sleep 1
done

# Start the DHCP relay
service isc-dhcp-relay start

