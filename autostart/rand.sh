#!/usr/bin/env sh

# Change to the desired directory
cd /mnt/Localdisk/folder/wall/ || { echo "Unable to change directory."; exit 1; }

# Get a random file from the directory
random_file=$(find . -maxdepth 1 -type f | shuf -n 1)

# Ensure a file was found
if [ -z "$random_file" ]; then
    echo "No files found in the directory."
    exit 1
fi

# Determine whether to pick the file above or below

# Define the signal
signal="SIGUSR2"

# Calculate the transition type
swww img "$random_file" --transition-type wipe --transition-angle 45 --transition-step 60 --transition-fps 60

# Send the signal to each waybar process
pgrep -x ".waybar-wrapped" | xargs -I {} kill -"$signal" "{}"
