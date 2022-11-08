



# @ Transcript to Gene ----
print("Querying Biomart for protein coding genes")
ensembl=useMart("ensembl")
ensembl = useDataset("mmusculus_gene_ensembl",mart=ensembl)
proteinCodingGenes = getBM(attributes=c("ensembl_transcript_id", "ensembl_gene_id","external_gene_name","description"),
                           filters='biotype', values=c('protein_coding'), mart=ensembl)
save(proteinCodingGenes,file="proteinCodingGenes.Rda")
head(proteinCodingGenes)


# @ Count, TPM and Design Matrices ----
# =>> produce count and TPM matrices in R coming with kallisto outputs
sra_accession = rev(dir("abundances/"))
files = sort(file.path("abundances", sra_accession, "abundance.h5"))
names(files) = c("sham_1dMI_1", "sham_1dMI_2",
                 "MI_1dMI_1", "MI_1dMI_2", 
                 "sham_3dMI_1", "sham_3dMI_2",
                 "MI_3dMI_1", "MI_3dMI_2"
)
txi.kallisto <- tximport(files, type = "kallisto", txOut = F, tx2gene = proteinCodingGenes, ignoreTxVersion = T)

# count matrix
mat.count <- txi.kallisto$counts
# TPM matrix
mat.tpm <- txi.kallisto$abundance
# design matrix
mat.design <- data.frame(SRA_accession = sra_accession,
                         Sample_name = colnames(mat.count),
                         Treatment = sapply(strsplit(colnames(mat.count), split = "_"), function(x) x[1]),
                         Time = sapply(strsplit(colnames(mat.count), split = "_"), function(x) x[2])
                         )


# @ Feature Extraction ----
# =>> determine batch effects

# select 10000 highly variant genes
high.var.genes = sort( apply(mat.tpm, 1, sd), decreasing = T )[1:1000]
mat.tpm.pre_1000 = mat.tpm[which(rownames(mat.tpm) %in% names(high.var.genes)),]


# UMAP object
u.tpm.pre_1000 = umap( t(mat.tpm.pre_1000) )
u.tpm.pre_1000 = u.tpm.pre_1000$layout

# plot UMAP
g.tpm.pre_1000 = data.frame(UMAP1 = u.tpm.pre_1000[,1],
                            UMAP2 = u.tpm.pre_1000[,2],
                            mat.design[c("Treatment", "Time")])
# ? treatment
ggplot(g.tpm.pre_1000, aes(x = UMAP1, y = UMAP2, color = Treatment)) + 
  geom_point(aes(size = 6)) + 
  # stat_ellipse(linetype=1,level=0.95) +
  guides(size = F) +
  theme_bw()
# ? time
ggplot(g.tpm.pre_1000, aes(x = UMAP1, y = UMAP2, color = Time)) + 
  geom_point(aes(size = 6)) + 
  # stat_ellipse(linetype=1,level=0.95) +
  guides(size = F) +
  theme_bw()
# ? both
ggplot(g.tpm.pre_1000, aes(x = UMAP1, y = UMAP2, color = Time, shape = Treatment)) + 
  geom_point(aes(size = 4)) + 
  # stat_ellipse(linetype=1,level=0.95) +
  guides(size = F) +
  theme_bw()
