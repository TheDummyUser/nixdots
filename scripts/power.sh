#!/usr/bin/env sh


# Define options
options="Shutdown\nRestart\nSleep\nLock"

# Prompt the user to select an option using Rofi
selected_option=$(echo -e "$options" | rofi -dmenu -p "Select an action:")

# Perform the selected action
case $selected_option in
    "Shutdown")
        systemctl poweroff
        ;;
    "Restart")
        systemctl reboot
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Lock")
        # You can replace 'i3lock' with your preferred screen locking command
        swaylock
        ;;
    *)
        echo "Invalid option"
        ;;
esac
