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
tell application "iTerm"
    activate
    set newWindow to (create window with default profile)
    tell current session of newWindow
        write text "nvim"
    end tell
end tell
EOF
