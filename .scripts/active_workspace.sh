#!/usr/bin/env bash

$HOME/hellwm/hellcli "get active_workspace"
exit

previous=""
while true; do
    current=$($HOME/hellwm/hellcli "get active_workspace")
    if [ "$current" != "$previous" ]; then
        previous="$current"
        echo "{\"text\": \"$current\", \"class\": \"active-workspace\"}"
        pkill -SIGUSR1 waybar
    fi
    sleep 0.1
done
