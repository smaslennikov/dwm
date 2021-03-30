#!/bin/bash
while true; do
    int=3

    volume_out=$(amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}');
    if $(amixer -c1 sget Mic); then
      audio_in=$(amixer -c1 sget Mic | grep 'Mono: Capture' | awk '{print $6;}');
    else
      audio_in=$(amixer -c0 sget Capture | grep 'Left: Capture' | awk '{print $7;}');
    fi
    clock=$(date '+%e %b %Y %a | %k:%M');
    uptime=$(uptime -p );
    kernel=$(uname -r );
    cputemp=$(sensors coretemp-isa-0000 | grep Package | awk '{print $4;}')
    if $(upsc); then
      buttery=$(upsc ups | grep battery.charge: | sed -e 's/battery.charge: //')%
    else
      buttery=$(acpi | awk '{print $3,$4}' | sed -e 's/\%,/%/')
    fi
    nvidiatemp=$(nvidia-smi -q -d temperature | grep "GPU Current" | cut -d':' -f2)

    status="$cputemp | gpu$nvidiatemp | $uptime | $volume_out| mic: $audio_in | $buttery | $clock";

    xsetroot -name "$status";
    sleep $int;
done
