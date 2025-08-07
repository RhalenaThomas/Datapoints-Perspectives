Copy RAW files from GEO SRA format


need module load sratoolkit
  mugqic/sratoolkit:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     Versions:
        mugqic/sratoolkit/2.6.2
        mugqic/sratoolkit/2.8.2-1
        mugqic/sratoolkit/2.10.5


# run 
module load mugqic/sratoolkit/2.10.5


# run 
vdb-config --interactive

# get the SRR number for each sample - there isn't any point though as they didn't put the mutant 70 days sample. 
# LRRK2-G2019S 35 days 

fasterq-dump SRR9648023 --split-files --threads 1 -O /lustre04/scratch/rhalena/TestGEO_SRA
