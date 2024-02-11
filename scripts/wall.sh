#!/usr/bin/env sh
# Directory containing wallpapers

WALLPAPER_DIR="/mnt/Localdisk/folder/wall/"

# List all images in the directory
wallpapers=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \))

# Check if there are no wallpapers
if [ -z "$wallpapers" ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Use Rofi to select wallpaper
selected_wallpaper=$(echo "$wallpapers" | rofi -dmenu -i -p "Select Wallpaper")

# Check if user selected a wallpaper
if [ -z "$selected_wallpaper" ]; then
    exit 0
fi

# Set selected wallpaper as desktop background using feh
#feh --bg-fill "$selected_wallpaper"
swww img "$selected_wallpaper" --transition-type wipe --transition-angle 10 --transition-step 90 --transition-fps 90

#notify-send "$selected_wallpaper Wallpaper set successfully."
