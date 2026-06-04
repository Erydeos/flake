#!/usr/bin/env bash
# Check if any monitor is currently active
if hyprctl monitors -j | jq -e '.[] | select(.dpmsStatus == true)' >/dev/null; then
    # Small delay prevents immediate wake from your keyboard press
    sleep 0.5 && hyprctl dispatch dpms off
else
    hyprctl dispatch dpms on

