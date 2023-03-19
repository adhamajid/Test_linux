#!/bin/bash

# Mengecek apakah argumen telah diberikan
if [ -z "$1" ]; then
    echo "Usage: $0 input.fastq"
    exit 1
fi

# Pangkas urutan adaptor dari "sequence reads"
cutadapt -a CCAGTCAGAGCACACGTCTGAACT "$1" -o output.fastq

# Petakan "sequence reads" ke genom referensi menggunakan HISAT2
hisat2 -x genome_index -U output.fastq | samtools sort -o output.bam

# Membuat indeks untuk file BAM yang dihasilkan
samtools index output.bam
