#!/bin/bash
while true; do
    int=3

    vol=$( amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );
    clock=$( date '+%e %b %Y %a | %k:%M' );
    uptime=$( uptime -p );
    kernel=$( uname -r );
    cputemp=$(sensors coretemp-isa-0000 | grep Package | awk '{print $4;}')
    buttery=$(acpi | cut -d',' -f2,3)

    if [ $(which nvidia-smi) ]; then
        nvidiatemp=$(nvidia-smi -q -d temperature | grep "GPU Current" | cut -d':' -f2)
        status="$cputemp | gpu$nvidiatemp | $uptime | $vol | buttery$buttery | $clock";
    else
        status="$cputemp | $uptime | $vol| buttery$buttery | $clock";
    fi

    xsetroot -name "$status";
    sleep $int;
done
