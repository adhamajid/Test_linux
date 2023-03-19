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

# Menemukan semua file dengan ekstensi ".txt" dan menggabungkan isi file menjadi satu file "all.txt"
find "$1" -type f -name "*.txt" -exec cat {} + > all.txt

# Menghitung checksum MD5 dari file "all.txt" dan menyimpannya ke dalam file "checksum.txt"
md5sum all.txt > checksum.txt
