#!/usr/bin/R
# ECR C&A PHP
# raw data in ecr.xlsx

# required packages
# - readxl
# - dplyr
# - Hmisc (requires acepack, requires gcc-fortran on *nix)

# library
library("readxl")
library("dplyr")
library("Hmisc")

# import raw excel to data frame
raw_data <- read_excel("ecr.xlsx", sheet = "Raw Data")

# convert data to numerical matrix
df <- as.matrix(as.data.frame(lapply(raw_data, as.numeric)))

# output file
sink("ecr_results.txt", split = TRUE, append = TRUE)

# descriptive statistics
summary(raw_data)

# correlations (r)  and significance (p)
rcorr(df, type=c("pearson"))
