#!/bin/bash

# Sleep 2 sec to allow mikrotik start network
sleep 2

if [ -z "$INTERFACE_NAME" ]; then
  INTERFACE_NAME="vpn0"
fi

iptables -t nat -A POSTROUTING -o $INTERFACE_NAME -j MASQUERADE

exec openconnect $SERVER $OC_OPTIONS --user=$USERNAME --passwd-on-stdin --interface=$INTERFACE_NAME  <<EOF
${PASSWORD}
EOF

