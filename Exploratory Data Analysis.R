# Exploratory data analysis through graphs/charts

alldata <- readRDS("datasets/tidyData1.rds")


# charts for bid and ask 
jpeg(file="charts/plot1.jpeg")
par(mfrow = c(1,2))
with(alldata, plot(x = DATE, y = TBILL_BID, type = "l", col = "red"))
with(alldata, plot(x = DATE, y = TBILL_ASK, type = "l", col = "blue"))
dev.off()

# charts for bid yield and ask yield
jpeg(file="charts/plot2.jpeg")
par(mfrow = c(1,2))
with(alldata, plot(x = DATE, y = TBILL_BID_YIELD, type = "l", col = "red"))
with(alldata, plot(x = DATE, y = TBILL_ASK_YIELD, type = "l", col = "blue"))
dev.off()

# charts for US repo bid and ask
jpeg(file="charts/plot3.jpeg")
par(mfrow = c(1,2))
with(alldata, plot(x = DATE, y = USREPO_BID, type = "l", col = "red"))
with(alldata, plot(x = DATE, y = USREPO_ASK, type = "l", col = "blue"))
dev.off()

# charts for Trade Close
jpeg(file="charts/plot4.jpeg")
par(mfrow = c(1,2))
with(alldata, plot(x = DATE, y = VIX_TRADECLOSE, type = "l", col = "red"))
with(alldata, plot(x = DATE, y = SNP_TRADECLOSE, type = "l", col = "blue"))
dev.off()

# charts for US Total
jpeg(file="charts/plot5.jpeg")
par(mfrow = c(2,2))
with(alldata, plot(x = DATE, y = `US TOTAL 7-10 YEARS DS GOVT. INDEX - TOT RETURN IND`, type = "l", ylab = "TOT RETURN IND"))
with(alldata, plot(x = DATE, y = `US TOTAL 7-10 YEARS DS GOVT. INDEX - DURATION`, type = "l", ylab = "DURATION"))
with(alldata, plot(x = DATE, y = `US TOTAL 7-10 YEARS DS GOVT. INDEX - CONVEXITY`, type = "l", ylab = "CONVEXITY"))
with(alldata, plot(x = DATE, y = `US TOTAL 7-10 YEARS DS GOVT. INDEX - RED. YIELD`, type = "l", ylab = "RED. YIELD"))
dev.off()

# charts for macro vars
jpeg(file="charts/plot6.jpeg")
par(mfrow = c(2,2))
layout(matrix(c(1,2,3,3), 2, 2, byrow = TRUE))
with(alldata, plot(x = DATE, y = INFLATION_T5YIE, type = "l"))
with(alldata, plot(x = DATE, y = LIBOR_LAST, type = "l"))
with(alldata, plot(x = DATE, y = FEDFRATE_DFF, type = "l"))
dev.off()


# charts for YIELDs
jpeg(file="charts/plot7.jpeg")
par(mfrow = c(3,1))
with(alldata, plot(x = DATE, y = YIELD_AA, type = "l"))
with(alldata, plot(x = DATE, y = YIELD_AAA, type = "l"))
with(alldata, plot(x = DATE, y = YIELD_BBB, type = "l"))
dev.off()


# charts of ICAP
ggplot(alldata) + 
  geom_line(aes(x= DATE, y = US00Y00), colour = "red") +
  geom_line(aes(x= DATE, y = US00Y03), colour = "blue") +
  geom_line(aes(x= DATE, y = US00Y06), colour = "black") +
  geom_line(aes(x= DATE, y = US01Y00), colour = "red") +
  geom_line(aes(x= DATE, y = US02Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = US03Y00), colour = "black") +
  geom_line(aes(x= DATE, y = US05Y00), colour = "red") +
  geom_line(aes(x= DATE, y = US07Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = US10Y00), colour = "black") 
ggsave("charts/icap1.jpeg")

ggplot(alldata) + 
  geom_line(aes(x= DATE, y = EM00Y00), colour = "red") +
  geom_line(aes(x= DATE, y = EM00Y03), colour = "blue") +
  geom_line(aes(x= DATE, y = EM00Y06), colour = "black") +
  geom_line(aes(x= DATE, y = EM01Y00), colour = "red") +
  geom_line(aes(x= DATE, y = EM02Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = EM03Y00), colour = "black") +
  geom_line(aes(x= DATE, y = EM05Y00), colour = "red") +
  geom_line(aes(x= DATE, y = EM07Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = EM10Y00), colour = "black") 
ggsave("charts/icap2.jpeg")

ggplot(alldata) + 
  geom_line(aes(x= DATE, y = UK00Y00), colour = "red") +
  geom_line(aes(x= DATE, y = UK00Y03), colour = "blue") +
  geom_line(aes(x= DATE, y = UK00Y06), colour = "black") +
  geom_line(aes(x= DATE, y = UK01Y00), colour = "red") +
  geom_line(aes(x= DATE, y = UK02Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = UK03Y00), colour = "black") +
  geom_line(aes(x= DATE, y = UK05Y00), colour = "red") +
  geom_line(aes(x= DATE, y = UK07Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = UK10Y00), colour = "black") 
ggsave("charts/icap3.jpeg")

ggplot(alldata) + 
  geom_line(aes(x= DATE, y = AU00Y00), colour = "red") +
  geom_line(aes(x= DATE, y = AU00Y03), colour = "blue") +
  geom_line(aes(x= DATE, y = AU00Y06), colour = "black") +
  geom_line(aes(x= DATE, y = AU01Y00), colour = "red") +
  geom_line(aes(x= DATE, y = AU02Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = AU03Y00), colour = "black") +
  geom_line(aes(x= DATE, y = AU05Y00), colour = "red") +
  geom_line(aes(x= DATE, y = AU07Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = AU10Y00), colour = "black") 
ggsave("charts/icap4.jpeg")


ggplot(alldata) + 
  geom_line(aes(x= DATE, y = JP00Y00), colour = "red") +
  geom_line(aes(x= DATE, y = JP00Y03), colour = "blue") +
  geom_line(aes(x= DATE, y = JP00Y06), colour = "black") +
  geom_line(aes(x= DATE, y = JP01Y00), colour = "red") +
  geom_line(aes(x= DATE, y = JP02Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = JP03Y00), colour = "black") +
  geom_line(aes(x= DATE, y = JP05Y00), colour = "red") +
  geom_line(aes(x= DATE, y = JP07Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = JP10Y00), colour = "black") 
ggsave("charts/icap5.jpeg")

ggplot(alldata) + 
  geom_line(aes(x= DATE, y = CN00Y00), colour = "red") +
  geom_line(aes(x= DATE, y = CN00Y03), colour = "blue") +
  geom_line(aes(x= DATE, y = CN00Y06), colour = "black") +
  geom_line(aes(x= DATE, y = CN01Y00), colour = "red") +
  geom_line(aes(x= DATE, y = CN02Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = CN03Y00), colour = "black") +
  geom_line(aes(x= DATE, y = CN05Y00), colour = "red") +
  geom_line(aes(x= DATE, y = CN07Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = CN10Y00), colour = "black") 
ggsave("charts/icap6.jpeg")

ggplot(alldata) + 
  geom_line(aes(x= DATE, y = NW03Y00), colour = "black") +
  geom_line(aes(x= DATE, y = NW05Y00), colour = "red") +
  geom_line(aes(x= DATE, y = NW07Y00), colour = "blue") +
  geom_line(aes(x= DATE, y = NW10Y00), colour = "black") 
ggsave("charts/icap7.jpeg")





