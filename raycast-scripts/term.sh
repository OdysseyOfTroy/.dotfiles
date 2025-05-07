#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Termscript
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 
# @raycast.packageName Raycast Scripts

osascript <<EOF
    do shell script "wezterm-gui start --" 
EOF
