library(readxl)

# read excel
data <- read_excel("../input/efotw-2023-master-index-data-for-researchers-iso.xlsx", skip = 4)

# write csv
write.csv(data, file = "../output/freedom_data.csv", row.names = FALSE)

