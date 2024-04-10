# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

### sudo pacman -S noto-fonts-emoji


##################################################################### Datetime ###############################################################################
# Produces "21 days", for example
uptime_formatted="↑$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)"

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M:%S")


##################################################################### Linux Core Version #####################################################################
# Get the Linux version but remove the "-1-ARCH" part
linux_version=🐧$(uname -r | cut -d '-' -f1)


##################################################################### Bettery status #########################################################################
# sudo pacman -S acpi
# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$battery_status" = "Charging" ]; then
    battery_icon=🔌
    battery="$battery_icon$battery_capacity%";
else
    if [ "$battery_capacity" -gt 30 ]; then
        battery_icon=🔋
    else
        battery_icon=🪫
    fi
    battery="$battery_icon$battery_capacity%";
fi


##################################################################### WiFi status ############################################################################
# Получаем имя активного WiFi соединения
# TODO optimize this
SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d':' -f2)
if [ -n "$SSID" ]; then
    # Получаем уровень сигнала для активного соединения
    SIGNAL=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^*' | cut -d':' -f2)
    
    # Выводим иконку, имя WiFi и уровень сигнала в процентах
    wifi="🌐$SIGNAL% $SSID"
else
    wifi="WiFi disabled"
fi


##################################################################### Keyboard layout status ###########################################################################
# sudo pacman -S jq
layout_name=$(swaymsg -t get_inputs | jq -r '.[] | select(.type=="keyboard") | .xkb_active_layout_name' | head -n 1)

if [ "$layout_name" = "Russian" ]; then
    #layout="ru"
    layout=🇷🇺
elif [ "$layout_name" = "English (US)" ]; then
    #layout="en"
    layout=🇺🇲
else
    layout=$layout_name
fi

echo $wifi \| $layout \| $uptime_formatted \| $linux_version \| $battery \| $date_formatted

# Additional emojis and characters for the status bar:
# Electricity: ⚡ ↯ ⭍ 🪫🔋🔌
# Audio: 🔈 🔊 🎧 🎶 🎵 🎤
# Separators: \| ❘ ❙ ❚
# Misc: 🐧 💎 💻 💡 ⭐ 📁 ↑ ↓ ✉ ✅ ❎

# https://emojipedia.org/
# Battery: 🪫🔋🔌
# Brightness: 🔅🔆
# Volume: 🔇🔈🔉🔊
# Network: 🌐
# Languages: 🌐      🇷🇺    🇺🇲 🇬🇧 

