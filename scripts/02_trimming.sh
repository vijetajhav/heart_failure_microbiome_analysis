#!/bin/bash

# Define the list of samples you actually have
SAMPLES=(
    "SRR37201872" "SRR37201873" "SRR37201874" "SRR37201875" "SRR37201877"
    "SRR37201878" "SRR37201879" "SRR37201880" "SRR37201881" "SRR37201883"
)

# Loop through each sample
for i in "${SAMPLES[@]}"; do
    echo "Trimming sample: $i"
    
    fastp -i ../data/raw/${i}_1.fastq \
          -I ../data/raw/${i}_2.fastq \
          -o ../data/trimmed/${i}_1_trimmed.fastq \
          -O ../data/trimmed/${i}_2_trimmed.fastq \
          --detect_adapter_for_pe \
          --trim_poly_g \
          --thread 4 \
          --html ../results/qc/${i}_fastp.html \
          --json ../results/qc/${i}_fastp.json
done
