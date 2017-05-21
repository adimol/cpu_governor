#!/bin/bash

function show_help {
    printf "Usage:\n\n"
    printf "./governor.sh check       - show active governor for each cpu core\n"
    printf "./governor.sh performance - change to performance governor\n"
    printf "./governor.sh powersave   - change to powersave governor\n"
    exit
}

if [ $# -eq 0 ]; then
    show_help
fi

nr_cpu=$(grep -c ^processor /proc/cpuinfo)

if [ "$1" == "check" ]; then
    for (( i = 0; i < $nr_cpu; i++)) do
        location="/sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_governor"
        cat $location
    done

elif [ "$1" == "performance" ]; then
    for (( i = 0; i < $nr_cpu; i++)) do
        location="/sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_governor"
        echo "performance" | sudo tee $location
    done

elif [ "$1" == "powersave" ]; then
    for (( i = 0; i < $nr_cpu; i++)) do
        location="/sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_governor"
        echo "powersave" | sudo tee $location
    done
else
    show_help
fi
