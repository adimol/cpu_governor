#!/bin/bash

function show_help {
    printf "Usage:\n\n"
    printf "governor check       - show active governor for each cpu core\n"
    printf "governor performance - change to performance governor\n"
    printf "governor powersave   - change to powersave governor\n"
    exit
}

if [ $# -eq 0 ]; then
    show_help
fi

nr_cpu=$(grep -c ^processor /proc/cpuinfo)

for (( i = 0; i < $nr_cpu; i++)) do
    location="/sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_governor"
    if [ "$1" == "check" ]; then
        cat $location

    elif [ "$1" == "performance" ]; then
        echo "performance" | sudo tee $location

    elif [ "$1" == "powersave" ]; then
        echo "powersave" | sudo tee $location
    else
        show_help
    fi

done
