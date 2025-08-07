# check genes in a list
# you have a list of results and you want to find out more info on a shorter list of genes
# you have a list of genes and you want to select specific types eg only protein coding

library(biomaRt)

get_list <- listEnsembl()




# Connect to Ensembl
#ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")

ensembl <- useEnsembl(
  biomart = "genes",
  dataset = "hsapiens_gene_ensembl",
  mirror = "us"  # alternatives: "www", "us", "asia"
)

# ensemble is a list of attributes, next we will select the relavent attributes
# just printing output is too long
att_ensemble <- listAttributes(ensembl)


# you now want to get info from a gene list
gene_list <- unique(df_filtered) # a long list times out
# need to select less things perhaps

gene_list <- top10[top10$cluster == "0",]$gene
# Then run your query again
gene_info <- getBM(
  attributes = c("hgnc_symbol", "ensembl_peptide_id", "go_id", "name_1006", "namespace_1003"),
  filters = "hgnc_symbol",
  values = gene_list,
  mart = ensembl
)

# other libraries that might be useful
"gene_biotype"
"definition_1006"
"genecards"
"protein_id"
"smart"

# Filter for subcellular terms
subcellular <- subset(gene_info, namespace_1003 == "cellular_component")
table(subcellular$name_1006)

# other libraries that might be useful
"gene_biotype"
"definition_1006"
"genecards"
"protein_id"
"smart"

gene_info <- getBM(
  attributes = c("hgnc_symbol", "gene_biotype", # protein coding or note
                 "definition_1006", # go term
                 "genecards", # gene card number not info
                 "protein_id", # id number
                 "smart"), # id number
  filters = "hgnc_symbol",
  values = gene_list,
  mart = ensembl
)
# note useful 



### better information can be found in UniProt

# Install if needed

BiocManager::install("UniProt.ws")
library(UniProt.ws)
up <- UniProt.ws(taxId = 9606)  # Human

# Map gene symbols to UniProt entries
columns(up)  # to list all available data fields
cols_of_interest <- c("UNIPROTKB", "SIGNAL", "TOPO_DOM", "SUBCELLULAR_LOCATION")

res <- select(
  up, keys = gene_list,
  keytype = "GENES", columns = cols_of_interest
)





