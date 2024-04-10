#!/bin/bash

# Получаем имя активного WiFi соединения
SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d':' -f2)

if [ -n "$SSID" ]; then
    # Получаем уровень сигнала для активного соединения
    SIGNAL=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^*' | cut -d':' -f2)
    
    # Выводим иконку, имя WiFi и уровень сигнала в процентах
    echo "🌐$SSID $SIGNAL%"
else
    echo "WiFi отключено"
fi

# nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2
# nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^*' | cut -d':' -f2
