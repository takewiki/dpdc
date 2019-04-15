library(readxl)
glm_logistics_data1 <- read_excel("data-raw/glm_logistics_data1.xlsx")
glm_logistics_data1 <- as.data.frame(glm_logistics_data1)
library(devtools);
use_data(glm_logistics_data1,internal = F,overwrite = T)