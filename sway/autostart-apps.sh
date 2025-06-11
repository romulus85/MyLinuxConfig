#!/bin/bash

# Función que comprueba si ya hay una ventana con un app_id o instance dados
already_running() {
  swaymsg -t get_tree | grep -q "\"$1\": \"$2\""
}

sleep 10
# Workspace 1
swaymsg "workspace 1"
if ! already_running "instance" "jetbrains-idea"; then
  swaymsg exec '/home/cx02913/.local/share/JetBrains/Toolbox/scripts/idea-ultimate'
  sleep 10
fi

if ! already_running "app_id" "kitty"; then
  swaymsg exec 'kitty'
  sleep 0.5
  swaymsg '[app_id="kitty"] focus'
  swaymsg "resize set width 33 ppt"
fi

# Workspace 2
if ! already_running "instance" "microsoft-edge"; then
  swaymsg exec 'microsoft-edge'
fi

# Workspace 3
if ! already_running "instance" "spotify"; then
  swaymsg exec 'spotify'
fi

if ! already_running "app_id" "telegram-desktop_telegram-desktop"; then
  swaymsg exec 'telegram-desktop'
fi

if ! already_running "instance" "crx__hnpfjngllnobngcgfapefoaidbinmjnm"; then
  swaymsg exec 'microsoft-edge --app-id=hnpfjngllnobngcgfapefoaidbinmjnm'
fi
