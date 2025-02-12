#!/bin/bash

work_dir=${HOME}/Analysis

if [ TRUE ];then
   out_dir=${work_dir}/results/star/GRCh38_ensembl
   ref_dir=${work_dir}/reference/human_GRCh38/ensembl_dataset
   ref_fasta=${ref_dir}/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa
   ref_gtf_file=${ref_dir}/Homo_sapiens.GRCh38.111.gtf
   genome_dir=${ref_dir}/star_genome_dir
fi

sample=Sample_1

#star=/STAR_install_directory/STAR
star=STAR

data_dir=${work_dir}/results/bbduk

R1_file=${data_dir}/${sample}*R1*
R2_file=${data_dir}/${sample}*R2*

if [ TRUE ];then
   ${star} \
      --runThreadN 8 \
      --genomeDir ${genome_dir} \
      --readFilesIn ${R1_file} ${R2_file} \
      --readFilesCommand zcat \
      --outSAMtype BAM SortedByCoordinate \
      --quantMode GeneCounts TranscriptomeSAM \
      --outFileNamePrefix ${out_dir}/${sample}/ \
      --outTmpDir ${work_dir}/_STARtmp_${sample}
fi

