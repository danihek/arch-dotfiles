#!/usr/bin/env bash

$HOME/hellwm/hellcli "get active_toplevel"
exit

previous=""
while true; do
    current=$($HOME/hellwm/hellcli "get active_toplevel")
    if [ "$current" != "$previous" ]; then
        previous="$current"
        echo "{\"text\": \"$current\", \"class\": \"active-toplevel\"}"
        pkill -SIGUSR2 waybar
    fi
    sleep 0.1
done
