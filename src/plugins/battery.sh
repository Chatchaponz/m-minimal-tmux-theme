#!/usr/bin/env bash

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

battery_percentage() {
  if command_exists "pmset"; then
    pmset -g batt | awk 'NR==2 { gsub(/[;%]/,""); print $3 }'
  fi
}

battery_percentage="󰁹 $(battery_percentage)%%"
