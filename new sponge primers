#using cutadapt to find amplicons for newly designed forward primer for sponges and reverse primer for corals
mamba activate bioinformatics #activate environment
cd ~/Desktop/AW/ #set current directory
ls #list directory contents

#identify only the sequences that contain new sponge primer 396F and coral R primer
cutadapt -g CGTGAGGGAAAGRTGAAAAGYAC...CGTCTTGAAACACGGACCAA -e 2 -O 10 --action=retain --trimmed-only -o retained_spongeprimer396F.fasta newprimer_spongesequences.fasta > retained_spongeprimer396F.txt

#identify only the sequences that contain new sponge primer 411F and coral R primer
cutadapt -g  GAAAAGCACTTTGAAAAGAGAG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --action=retain --trimmed-only -o retained_spongeprimer411F.fasta newprimer_spongesequences.fasta > retained_spongeprimer411F.txt
