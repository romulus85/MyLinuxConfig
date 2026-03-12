#!/bin/bash
status=$(forticlient vpn status 2>&1)

if echo "$status" | grep -q "Connected"; then
    name=$(echo "$status" | grep "VPN name:" | cut -d':' -f2 | xargs)
    echo "VPN: $name"
else
    echo "VPN: off"
fi
