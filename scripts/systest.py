#!/usr/bin/env python3

import subprocess
import os
import random

folder_path = "/mnt/Localdisk/folder/wall/"

files = os.listdir(folder_path)

if files:
    ran_file = random.choice(files)
    file_path = os.path.join(folder_path, ran_file)

    if os.path.isfile(file_path):
        subprocess.call(["swww", "img", file_path])
    else:
        print("Error: File not found.")
else:
    print("Error: No files found in the folder.")
