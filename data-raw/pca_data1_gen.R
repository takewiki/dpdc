library(readxl)
pca_data1 <- read_excel("data-raw/pca_data1.xlsx")
pca_data1 <- as.data.frame(pca_data1);
devtools::use_data(pca_data1,internal = F,overwrite = T);