#!/bin/bash

# Mengecek apakah argumen telah diberikan
if [ $# -eq 0 ]; then
    echo "Usage: $0 apaaja1 apaaja2 apaaja3 ..."
    exit 1
fi

# Membuat arsip tar terkompresi dari file-file yang diberikan
tar czf archive.tar.gz "$@"

# Menampilkan pesan jika proses telah selesai
echo "Archive created: archive.tar.gz"
