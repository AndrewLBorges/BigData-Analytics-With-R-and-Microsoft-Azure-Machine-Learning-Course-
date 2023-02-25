# http://www.quantmod.com
# Installing and loading packages
install.packages("quantmod")
install.packages("xts")
install.packages("moments")
library(quantmod)
library(xts)
library(moments)

# Selecting period for the analysis
startDate = as.Date("2018-01-21")
endDate = as.Date("2018-06-21")

# Downloading the data
# Obs: Yahoo Finance is going through changes and the price
# service might be unstable
?getSymbols
getSymbols("PETR4.SA", src = "yahoo", from = startDate, to = endDate, auto.assign = T)

# checking the returned datatype
class(PETR4.SA)
is.xts(PETR4.SA)

head(PETR4.SA)

# Analysing the close data
PETR4.SA.Close <- PETR4.SA[, "PETR4.SA.Close"]
is.xts(PETR4.SA.Close)
?Cl
head(Cl(PETR4.SA), 5)

# Plotting with candlestick
?candleChart
candleChart(PETR4.SA)

# close plot
plot(PETR4.SA.Close, main = "Fechamento Diário Ações Petrobras",
     col = "red", xlab = "Data", ylab = "Preço", major.ticks = 'months',
     minor.ticks = FALSE)

# Adding Bollinger Bands, with 20 period average and 2 sd
# Because sd is a volatility measure, bollinger bands adjust themselves to market conditions
# the more volatile markets have bands further from the average and less volatile ones have the bands
# closer to the average
?addBBands
addBBands(n = 20, sd = 2)

# adding ADX indicator, average 11 of exponential type
?addADX
addADX(n = 11, maType = "EMA")

# Calculating daily logs
?log
PETR4.SA.ret <- diff(log(PETR4.SA.Close), lag = 1)

# removing NA on position 1
PETR4.SA.ret <- PETR4.SA.ret[-1]

# Plotting the return rate
plot(PETR4.SA.ret, main = "Fechamento Diário das Ações da Petrobras",
     col = "red", xlab = "Data", ylab = "Retorno", major.ticks = 'months',
     minor.ticks = FALSE)

# Calculating some statistic measures
statNames <- c("Mean", "Standard Deviation", "Skewness", "Kurtosis")
PETR4.SA.stats <- c(mean(PETR4.SA.ret), sd(PETR4.SA.ret), skewness(PETR4.SA.ret), kurtosis(PETR4.SA.ret))
names(PETR4.SA.stats) <- statNames
PETR4.SA.stats

# Saving on a .rds file(binary R file)
# getSymbols("PETR4.SA", src = 'yahoo')
saveRDS(PETR4.SA, file = "PETR4.SA.rds") # saves the data in a binary format
Ptr = readRDS("PETR4.SA.rds")
dir()
head(Ptr)
