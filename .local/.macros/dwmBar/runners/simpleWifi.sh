#!/bin/sh
# interface=$(ip link | grep -o 'wl[^:]*')
# wifiRate=$(nmcli -f ACTIVE,RATE dev wifi list | awk '$1=="yes" {print $2 "Mbit/s"}')
# wifiBars=$(nmcli -f ACTIVE,BARS dev wifi list | awk '$1=="yes" {print $2}')
while true; do
    wifiSignal=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2}')
    wifiSSID=$(nmcli -f ACTIVE,SSID dev wifi list | awk '$1=="yes" {print $2 " " $3}')
    if [ -z $wifiSignal ] 
    then
        icon=" "
        printf "$icon" > '/tmp/wifi.txt';
    else
        if [ $wifiSignal -gt 80 ]
        then 
            icon=" "
        elif [ $wifiSignal -gt 60 ]
        then
            icon=" "
        elif [ $wifiSignal -gt 40 ]
        then
            icon=" "
        elif [ $wifiSignal -gt 20 ]
        then 
            icon=" "
        else 
            icon=" "
        fi
        printf "%s%s%s" "$icon" "$wifiSSID" "$wifiSignal%" > '/tmp/wifi.txt';
    fi
    sleep 10s
done &
