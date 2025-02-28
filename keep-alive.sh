#!/bin/bash
while true; do
    curl -s http://localhost > /dev/null
    sleep 180 # Ping every 5 minutes
done
