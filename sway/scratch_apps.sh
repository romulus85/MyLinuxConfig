#!/bin/bash

is_running() {
    swaymsg -t get_tree | grep -q "\"instance\": \"$1\""
}

if ! is_running "teams.microsoft.com"; then
    swaymsg "workspace 4; splith"
    swaymsg "exec microsoft-edge --app=https://teams.microsoft.com --app_id=teams"
    sleep 1
    swaymsg "exec microsoft-edge --app=https://outlook.office.com --app_id=outlook"

    sleep 4

    swaymsg "focus parent"

    swaymsg 'move to scratchpad'

    # Mostrar la ventana del scratchpad y redimensionarla
    swaymsg "scratchpad show"
    swaymsg "floating enable"
    swaymsg "focus parent"
    swaymsg "resize set width 85 ppt height 95 ppt"
    swaymsg "move position center"
    swaymsg "scratchpad hide"
fi
