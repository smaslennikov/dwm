#!/bin/bash
while true; do
    int=3

    volume_out=$(amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}');
    audio_in=$(amixer -c1 sget Mic | grep 'Mono: Capture' | awk '{print $6;}');
    clock=$(date '+%e %b %Y %a | %k:%M');
    uptime=$(uptime -p );
    kernel=$(uname -r );
    cputemp=$(sensors coretemp-isa-0000 | grep Package | awk '{print $4;}')
    buttery=$(upsc ups | grep battery.charge: | sed -e 's/battery.charge: //')
    nvidiatemp=$(nvidia-smi -q -d temperature | grep "GPU Current" | cut -d':' -f2)

    status="$cputemp | gpu$nvidiatemp | $uptime | $volume_out| $buttery% | $clock";

    xsetroot -name "$status";
    sleep $int;
done
