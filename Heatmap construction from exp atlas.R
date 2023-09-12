dataheat= read.table("hts.tsv", header = TRUE, sep = "\t")

dataheat <- rbind(dataheat, numeric(ncol(dataheat)))
rownames(dataheat)[nrow(dataheat)] <- "Zeros"

matrixheat= data.matrix(dataheat)

cold_colors <- colorRampPalette(c("blue", "lightblue", "white"))

heatmap.2(
  matrixheat,
  trace = "none",
  margins = c(10, 12),
  dendrogram = "none",
  col = cold_colors(100), # Use the custom color palette
  sepcolor = "white"
)

png("heatmap.png", width = 800, height = 600)  # Adjust width and height as needed
dev.off()
