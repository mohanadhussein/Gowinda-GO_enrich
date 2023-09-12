setwd("C:/Users/user/Desktop/EPFL/lab/GWAS/GWAS round 3/New conception/Vol")

########## This finally works smooth as hell :0
# Load the stringr package
library(stringr)

# Read CSV file
data <- read.csv("2R-10683713-10683713.csv", header = FALSE, stringsAsFactors = FALSE)

# Extract DGRP lines and variant state
dgrp_lines <- gsub("^DGRP-(\\d+).*", "\\1", data[[1]])
variant_state <- ifelse(str_detect(data[[1]], "ref"), "Reference",
                        ifelse(str_detect(data[[1]], "no-call"), "No-seq", "Mutated"))

# Create a list with different column lengths
output_list <- list(
  Reference = dgrp_lines[variant_state == "Reference"],
  Mutated = dgrp_lines[variant_state == "Mutated"],
  `No-seq` = dgrp_lines[variant_state == "No-seq"]
)

# Get the maximum length among the columns
max_length <- max(lengths(output_list))

# Pad shorter columns with NA values
output_list <- lapply(output_list, function(x) {
  length(x) <- max_length
  x
})

# Convert the list to a data frame
output_data <- as.data.frame(output_list)

# Write the data frame to a CSV file
write.csv(output_data, file = "2R-10683713-10683713-sorted.csv", row.names = FALSE)

