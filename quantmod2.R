rm(list=ls())


library(quantmod)
## Loading required package: xts
## Loading required package: zoo
## 
## Attaching package: 'zoo'
## The following objects are masked from 'package:base':
## 
##     as.Date, as.Date.numeric
## Loading required package: TTR
## Version 0.4-0 included new data defaults. See ?getSymbols.

getSymbols("^GSPC", from = "2000-01-01")
## 'getSymbols' currently uses auto.assign=TRUE by default, but will
## use auto.assign=FALSE in 0.5-0. You will still be able to use
## 'loadSymbols' to automatically load data. getOption("getSymbols.env")
## and getOption("getSymbols.auto.assign") will still be checked for
## alternate defaults.
## 
## This message is shown once per session and may be disabled by setting 
## options("getSymbols.warning4.0"=FALSE). See ?getSymbols for details.
## [1] "^GSPC"

head(GSPC)

tail(GSPC)

chartSeries(GSPC, theme = chartTheme("white"), subset = "last 10 months", show.grid = TRUE)

addSMA(20)

addEMA(20)
