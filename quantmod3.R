rm(list=ls())


# Step 1: Load libraries and data
library(quantmod)
library(PerformanceAnalytics)
## 
## Attaching package: 'PerformanceAnalytics'
## The following object is masked from 'package:graphics':
## 
##     legend

getSymbols('NFCI', src = 'FRED', , from = '2000-01-01')
## [1] "NFCI"

NFCI <- na.omit(lag(NFCI)) # we can only act on the signal after release, i.e. the next day
getSymbols("^GSPC", from = '2000-01-01')
## [1] "^GSPC"

data <- na.omit(merge(NFCI, GSPC)) # merge before (!) calculating returns)
data$GSPC <- na.omit(ROC(Cl(GSPC))) # calculate returns of closing prices

# Step 2: Create your indicator
data$sig <- ifelse(data$NFCI < 1, 1, 0)
data$sig <- na.locf(data$sig)

# Step 3: Use indicator to create equity curve
perf <- na.omit(merge(data$sig * data$GSPC, data$GSPC))
colnames(perf) <- c("Stress-based strategy", "SP500")

# Step 4: Evaluate strategy performance
table.DownsideRisk(perf)

table.Stats(perf)

charts.PerformanceSummary(perf)

chart.RelativePerformance(perf[ , 1], perf[ , 2])

chart.RiskReturnScatter(perf)
