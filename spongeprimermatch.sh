#find sponge sequences that will match coral primers

conda list #shows packages in miniconda environment
conda create --name bioinformatics #makes environment
conda install -c bioconda cutadapt #install cutadapt
conda activate bioinformatics #activates environment
conda install -c bioconda cutadapt #installs cutadapt package
cat 28S_Porifera_GoM_and_PR_Skims.fasta #shows contents of file

#installed mamba because conda kept reverting to an old version
mamba create -n bioinformatics -c bioconda cutadapt #create new environment
mamba activate bioinformatics #activate environment
cd ~/Desktop/AW #set current directory
ls #list directory contents

#identifies only the sponge sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --action=retain --trimmed-only -o retained_sponges.fasta 28S_Porifera_GoM_and_PR_Skims_Direction_Corrected.fasta > retained_sponges_output.txt

#identifies and trims only the sponges sequences containing F and R primer with 2 or fewer mismatches
cutadapt -g CGTGAAACCGYTRRAAGGG...CGTCTTGAAACACGGACCAA -e 2 -O 10 --trimmed-only -o trimmed_sponges.fasta 28S_Porifera_GoM_and_PR_Skims_Direction_Corrected.fasta > trimmed_sponges_output.txt 

