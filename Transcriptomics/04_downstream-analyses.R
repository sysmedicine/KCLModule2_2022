
# @ Gene Set Enrichment Analysis ----

# @ # Pathway Enrichments from KEGG
# pulling KEGG Pathways
kegg.gs <- getGenesets(org = "mmu", db = "kegg", cache = T, return.type = "list")
# conversion of ENSEMBL gene IDs to gene symbols
kegg.gs.list = list()
count = 0
for(pathway in kegg.gs){
  count = count + 1
  kegg.gs.list[[names(kegg.gs[count])]] <- AnnotationDbi::select(org.Mm.eg.db, keys = pathway, keytype = "ENTREZID", columns = "SYMBOL")$SYMBOL
}


# deframe DEA statistics for each gene, change duplicates minimally
kegg_input = sort(deframe(cbind(Symbol = rownames(res), res["stat"])))
while( length(kegg_input[duplicated(kegg_input)]) > 0){
  kegg_input[duplicated(kegg_input)] = kegg_input[duplicated(kegg_input)] + 0.0000001
}

# change Ensembl IDs to gene symbols
names(kegg_input) = proteinCodingGenes[match(names(kegg_input), proteinCodingGenes$ensembl_gene_id),3]

# uniquely choose genes
kegg_input = kegg_input[unique(names(kegg_input))]

# fgsea
fgseaRes = fgsea(kegg.gs.list, kegg_input, nperm = 10000)

# tidy up (by dplyr)
fgseaResTidy <- fgseaRes %>%
  as_tibble() %>%
  arrange(desc(NES))

# table view
fgseaResTidy %>% 
  select(-leadingEdge, -ES, -nMoreExtreme) %>% 
  filter(padj < 0.05) %>%
  arrange(padj) %>% 
  DT::datatable()

# dot plot view
ggplot(fgseaResTidy[fgseaResTidy$padj < 0.005,], aes(reorder(pathway, NES), NES)) +
  geom_col(aes(fill = NES > 0), show.legend = F) +
  coord_flip() +
  labs(x="", y="Normalized Enrichment Score", title = "") +
  theme(
    axis.text.x = element_text(size=12),
    axis.text.y = element_text(size=10),
    axis.title=element_text(size=14,face="bold"),
    panel.background = element_rect(fill = "white"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',colour = "white"))



# @ 