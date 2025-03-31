#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Neoscript
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 
# @raycast.packageName Raycast Scripts

osascript <<EOF
    do shell script "wezterm-gui start --" 
EOF
