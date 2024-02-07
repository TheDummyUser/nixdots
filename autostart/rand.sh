#!/usr/bin/env sh

# Change to the desired directory
cd /mnt/Localdisk/folder/wall/ || exit

# Get a list of all files in the directory
files=(*)

# Pick a random index
random_index=$((RANDOM % ${#files[@]}))

# Pick the random file
random_file=${files[random_index]}

# Determine whether to pick the file above or below
direction=$((RANDOM % 2))  # 0 for above, 1 for below

# Calculate the index of the file above or below
if [ "$direction" -eq 0 ]; then
    target_index=$((random_index - 1))
else
    target_index=$((random_index + 1))
fi

# Ensure the target index is within bounds
if [ "$target_index" -ge 0 ] && [ "$target_index" -lt "${#files[@]}" ]; then
    target_file=${files[target_index]}


    swww img "$random_file" --transition-type wipe --transition-angle 10 --transition-step 90 --transition-fps 90

    # Output the selected file above or below
    # notify-send "Selected file: $target_file"
    
     # Send SIGUSR1 to each waybar process
    for pid in $(pgrep -x ".waybar-wrapped"); do
        kill -SIGUSR2 "$pid"
    done
else
    notify-send "Not enough files or invalid index for the selected direction."
fi
