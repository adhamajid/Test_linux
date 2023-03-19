#!/bin/bash

# Mengecek apakah argumen telah diberikan
if [ -z "$1" ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

# Mengecek apakah argumen merupakan direktori yang valid
if [ ! -d "$1" ]; then
    echo "Error: $1 is not a valid directory."
    exit 1
fi

# Rekursif mencantumkan semua file dalam direktori dan subdirektorinya yang memiliki ekstensi ".txt"
find "$1" -type f -name "*.txt" -printf "%f %s %TY-%Tm-%Td\n"
