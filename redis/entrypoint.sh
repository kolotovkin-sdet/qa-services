#!/bin/bash

echo "Getting IP address of redis master..."
export REDIS_MASTER_EXTERNAL_ADDRESS=$(hostname -I | awk '{print $1}')
echo "This will be address of redis master ${REDIS_MASTER_EXTERNAL_ADDRESS}"

echo "Starting service..."
exec supervisord -c /etc/supervisor/supervisord.conf
echo "Ready!"