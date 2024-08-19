#!/bin/bash

#check super user
if [ "$(id -u)" -ne "0" ]; then
    echo "need sudo"
    exit 1
fi

# go in catalog /sys/devices/system/cpu/cpu*
for cpu_dir in /sys/devices/system/cpu/cpu*/cpuidle; do
    # check catalog
    if [ -d "$cpu_dir" ]; then
        # loop
        for state_dir in "$cpu_dir"/state*/disable; do
            # check files
            if [ -f "$state_dir" ]; then
                # Устанавливаем значение 1 в файл
                echo 1 > "$state_dir"
                echo "placed 1 in $state_dir"
            fi
        done
    fi
done

echo "all state changed to 1"
