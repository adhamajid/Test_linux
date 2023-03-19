#!/bin/bash

# Mengecek apakah argumen telah diberikan
if [ -z "$1" ]; then
    echo "Usage: $0 file.tsv"
    exit 1
fi

# Mengecek apakah argumen merupakan file yang valid
if [ ! -f "$1" ]; then
    echo "Error: $1 is not a valid file."
    exit 1
fi

# Urutkan file berdasarkan kolom ketiga dalam urutan menurun
sorted_file=$(sort -k 3 -r "$1")

# Filter file untuk menyimpan hanya baris yang kolom keempatnya lebih besar dari atau sama dengan 10
filtered_file=$(echo "$sorted_file" | awk -F '\t' '$4 >= 10')

# Mengecek apakah terdapat baris yang memenuhi kriteria filter
if [ -z "$filtered_file" ]; then
    echo "Error: No rows in the file meet the filter criteria."
    exit 1
fi

# Menghitung jumlah nilai di kolom kelima dan mencetaknya ke konsol
sum=$(echo "$filtered_file" | awk -F '\t' '{ sum += $5 } END { print sum }')
echo "Jumlah nilai di kolom kelima: $sum"
