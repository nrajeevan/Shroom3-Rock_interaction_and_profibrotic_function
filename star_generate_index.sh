#!/bin/bash

work_dir=${HOME}/MouseModel/Analysis

if [ TRUE ];then # human ensembl reference
   ref_dir=${work_dir}/reference/human_GRCh38/ensembl_dataset
   ref_fasta=${ref_dir}/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa
   ref_gtf_file=${ref_dir}/Homo_sapiens.GRCh38.111.gtf
   genome_dir=${ref_dir}/star_genome_dir
fi

star=/star_install_directory/STAR
star=STAR

if [ TRUE ];then
   ${star} \
      --runThreadN 8 \
      --runMode genomeGenerate \
      --genomeDir ${genome_dir} \
      --genomeFastaFiles ${ref_fasta} \
      --sjdbGTFfile ${ref_gtf_file} \
      --sjdbOverhang 150
fi
