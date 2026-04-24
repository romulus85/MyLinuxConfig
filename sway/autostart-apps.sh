#!/bin/bash

already_running() {
  swaymsg -t get_tree | grep -q "\"$1\": \"$2\""
}

start_workspace_1_apps() {
  local opencode_running=0
  local code_running=0
  local kitty_running=0

  if already_running "app_id" "OpenCode"; then
    opencode_running=1
  fi
  if already_running "app_id" "code"; then
    code_running=1
  fi
  if already_running "app_id" "kitty"; then
    kitty_running=1
  fi

  swaymsg "workspace 1"

  # Solo reconstruimos el layout si el workspace arranca limpio.
  if [ "$opencode_running" -eq 0 ] && [ "$code_running" -eq 0 ] && [ "$kitty_running" -eq 0 ]; then
    swaymsg exec 'OpenCode'
    sleep 10

    swaymsg '[app_id="OpenCode"] focus'
    swaymsg 'focus parent'
    swaymsg 'layout tabbed'

    swaymsg exec 'code'
    sleep 10

    swaymsg '[app_id="OpenCode"] focus'
    swaymsg 'focus parent'
    swaymsg 'focus parent'
    swaymsg 'splith'

    swaymsg exec 'kitty'
    sleep 0.5
    swaymsg '[app_id="kitty"] focus'
    swaymsg 'resize set width 33 ppt'
    return
  fi

  if [ "$opencode_running" -eq 0 ]; then
    swaymsg exec 'OpenCode'
    sleep 10
  fi

  if [ "$code_running" -eq 0 ]; then
    swaymsg exec 'code'
    sleep 10
  fi

  if [ "$kitty_running" -eq 0 ]; then
    swaymsg exec 'kitty'
    sleep 0.5
    swaymsg '[app_id="kitty"] focus'
    swaymsg 'resize set width 33 ppt'
  fi
}

sleep 10

# Workspace 1
start_workspace_1_apps

# Workspace 2
swaymsg "workspace 2"
if ! already_running "class" "microsoft-edge"; then
  swaymsg exec 'microsoft-edge'
  sleep 5
fi

# Workspace 3
swaymsg "workspace 3"
if ! already_running "class" "Spotify"; then
  swaymsg exec 'spotify'
fi
if ! already_running "app_id" "org.telegram.desktop"; then
  swaymsg exec 'telegram-desktop'
fi
if ! already_running "class" "crx__hnpfjngllnobngcgfapefoaidbinmjnm"; then
  swaymsg exec 'microsoft-edge --app-id=hnpfjngllnobngcgfapefoaidbinmjnm'
fi
