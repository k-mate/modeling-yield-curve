library(readxl)
library(dplyr)
rm(list = ls())

#-----------------------------------------------------------------------------------------------
# Step 1: Read raw excel files from datasets folder
#-----------------------------------------------------------------------------------------------

TBILL <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "3M TBILL", range = "C5:G1214")
colnames(TBILL) <- c("DATE", "TBILL_BID", "TBILL_BID_YIELD", "TBILL_ASK", "TBILL_ASK_YIELD")

US_REPO <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "US COLLATERAL REPO", range = "C5:E864")
colnames(US_REPO) <- c("DATE", "USREPO_BID", "USREPO_ASK")
  
VIX <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "VIX.VIX", range = "C5:D1263")
colnames(VIX) <- c("DATE", "VIX_TRADECLOSE")

SNP <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "S&P 500", range = "C5:D1263")
colnames(SNP) <- c("DATE", "SNP_TRADECLOSE")

US7to10YRS <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "US 7-10 years", range = "A1:E3746")
colnames(US7to10YRS)[1] <- "DATE"

INFLATION <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "Inflation", range = "A11:B2620")
colnames(INFLATION) <- c("DATE", "INFLATION_T5YIE")
 
FEDFRATE <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "Fed Fund Rate", range = "A11:B3817")
colnames(FEDFRATE) <- c("DATE", "FEDFRATE_DFF")

LIBOR <- read_excel("datasets/RATES FILE FOR RBI.xlsx", sheet = "3 M LIBOR", range = "C5:D1267")
colnames(LIBOR) <- c("DATE", "LIBOR_LAST")

YIELDAAA <- read_excel("datasets/BAMLC0A1CAAAEY.xls", range = "A11:B2766")
colnames(YIELDAAA) <- c("DATE", "YIELD_AAA")

YIELDAA <- read_excel("datasets/BAMLC0A2CAAEY.xls", range = "A11:B276")
colnames(YIELDAA) <- c("DATE", "YIELD_AA")

YIELDBBB <- read_excel("datasets/BAMLC0A4CBBBEY.xls", range = "A11:B2766")
colnames(YIELDBBB) <- c("DATE", "YIELD_BBB")

ICAP <- read_excel("datasets/ICAP_Data.xlsx", range = "B2:BH1568")
colnames(ICAP)[1] <- "DATE"

#-----------------------------------------------------------------------------------------------
# Step 2: Merge the files
#-----------------------------------------------------------------------------------------------

alldata <- TBILL %>% 
  merge(US_REPO, by = "DATE", all = TRUE)  %>% 
  merge(VIX, by = "DATE", all = TRUE)  %>% 
  merge(SNP, by = "DATE", all = TRUE)  %>% 
  merge(US7to10YRS, by = "DATE", all = TRUE)  %>% 
  merge(INFLATION, by = "DATE", all = TRUE)  %>% 
  merge(FEDFRATE, by = "DATE", all = TRUE) %>%
  merge(LIBOR, by = "DATE", all = TRUE) %>%
  merge(YIELDAAA, by = "DATE", all = TRUE) %>%
  merge(YIELDAA, by = "DATE", all = TRUE) %>%
  merge(YIELDBBB, by = "DATE", all = TRUE) %>%
  merge(ICAP, by = "DATE", all = TRUE) 

#-----------------------------------------------------------------------------------------------
# Step 3: Making DATE as time variable and save it as RDS file
#-----------------------------------------------------------------------------------------------
alldata$DATE <- as.Date(alldata$DATE)
# call it tidyData1.rds (first version of tidy data which has all the data/ or can be referred to as 
# base file)
saveRDS(alldata, "datasets/tidyData1.rds")

