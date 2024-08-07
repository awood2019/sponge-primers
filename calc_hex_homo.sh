#determining coral primer alignments for Calcarea, Hexactinellida, and Homoscleromorpha

#Calcarea--------------------------------------------------------------
mamba activate bioinformatics #activate environment
cd ~/Desktop/AW/ #set current directory
ls #list directory contents

#identifies only the calcarea sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --action=retain --trimmed-only -o retained_calcarea.fasta Calcarea_28S_sequences.fasta > retained_calcarea_output.txt

#identifies and trims only the sponges sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --trimmed-only -o trimmed_calcarea.fasta Calcarea_28S_sequences.fasta > trimmed_calcarea_output.txt 

#Hexactinellida--------------------------------------------------------------
#identifies only the hexactinellida sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --action=retain --trimmed-only -o retained_hexactinellida.fasta Hexactinellida_28S_sequences.fasta > retained_hexactinellida_output.txt

#identifies and trims only the sponges sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --trimmed-only -o trimmed_hexactinellida.fasta Hexactinellida_28S_sequences.fasta > trimmed_hexactinellida_output.txt 

#Homoscleromorpha--------------------------------------------------------------
#identifies only the homoscleromorpha sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --action=retain --trimmed-only -o retained_homoscleromorpha.fasta Homoscleromorpha_28S_sequences.fasta > retained_homoscleromorpha_output.txt

#identifies and trims only the sponges sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --trimmed-only -o trimmed_homoscleromorpha.fasta Homoscleromorpha_28S_sequences.fasta > trimmed_homoscleromorpha_output.txt 

#concatenate-------------------------------------------------------------------
#concatenate all retained sequences for skim data, Calcarea, Hexactinellida, and Homoscleromorpha into one FASTA file
cat retained_spongeskim.fasta retained_calcarea.fasta retained_hexactinellida.fasta retained_homoscleromorpha.fasta > cat_retainedsponges.fasta

#concatenate all trimmed sequences for skim data, Calcarea, Hexactinellida, and Homoscleromorpha into one FASTA file
cat trimmed_spongeskim.fasta trimmed_calcarea.fasta trimmed_hexactinellida.fasta trimmed_homoscleromorpha.fasta > cat_trimmedsponges.fasta

#concatenate all original sequence files into one FASTA file
cat 28S_Porifera_GoM_and_PR_Skims_Direction_Corrected.fasta Calcarea_28S_sequences.fasta Hexactinellida_28S_sequences.fasta Homoscleromorpha_28S_sequences.fasta > cat_originalsponges.fasta