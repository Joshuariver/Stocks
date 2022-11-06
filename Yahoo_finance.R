# Introducing yahoofinancer
# https://www.r-bloggers.com/2022/11/introducing-yahoofinancer/

# With yahoofinancer, you can fetch the following data related to:
  
#  company
# quote
# summary
# statistics
# historical data
# profile
# financials
# analysis
# options
# index
# summary
# historical data
# currency
# market summary


## Installation

# Install release version from CRAN
# install.packages("yahoofinancer")

# Install development version from GitHub
# install.packages("devtools")
# devtools::install_github("rsquaredacademy/yahoofinancer")

library(yahoofinancer)
library(purrr)

# Ticker (검색하고자 하는 기업을 정하기: 기업코드 적용)

aapl <- Ticker$new('aapl')  # 애플

# 현재 주가
aapl$quote$regularMarketPrice

# 일일 주식 거래 현황 요약
aapl$summary_detail  

# Yahoo 의 Statistics 탭에 있는 정보를 가져오려면면
head(map(aapl$key_stats, 'raw'))  #  raw data 형태로

head(map(aapl$key_stats, 'fmt'))  # format 된 형태로


# 최근 4분기의 가치평가 지수를 가지고 옴옴
aapl$valuation_measures

# 1년 동안의 주가 변동 정보
head(aapl$get_history())

# 특정 일자부터의 주가정보를 가져오려면
aapl$get_history(start = '2022-10-20', interval = '1d')

# 특정 기간동안의 주가정보를 가져오려면
aapl$get_history(start = '2022-10-01', end = '2022-10-14', interval = '1d')

# 어느 시점부터 현재까지 특정 기간동안의 주가정보를 가져오려면
aapl$get_history(period = '1mo', interval = '1d')


# 프로필:: Yahoo Finance 의 Profile 탭에 있는 정보를 가지고 오기

aapl$summary_profile

# 프로필:: Yahoo Finance 의 경영진 정보를 가지고 오기
aapl$company_officers


# Financials: 장부 정보 가지고 오기

aapl$get_balance_sheet('annual')  # 최근 4개년 동안 분기별 대차대조표 정보

aapl$get_income_statement('annual') # 수입

aapl$get_cash_flow('annual') # 현금흐름표



## 분석지표들

# Earning estimate
aapl$earnings_trend$earnings_estimate

# REvenus Estimate
aapl$earnings_trend$revenue_estimate

# Earning History
aapl$earnings_history

# EPS Trend
aapl$earnings_trend$eps_trend

# EPS Revision
aapl$earnings_trend$eps_revision

# Growth Estimates
aapl$earnings_trend$growth

## Options

# Option Chain
head(aapl$option_chain)

# Option Expiration Dates
aapl$option_expiration_dates


## Holding Pattern

# Data showing breakdown of owners of given symbol(s), insiders, institutions, etc.
aapl$major_holders


# Top 10 owners of a given symbol.  애플 주식을 소유한 주체 심볼별 리스트
aapl$institution_ownership



## Others

# Data related to historical recommendations (buy, hold, sell) for a given symbol.
# 사라, 팔아라, 보유하라 신호
aapl$recommendation_trend


# Technical indicators for given symbol.  기술적 지표들들
aapl$technical_insights$secReports[[1]]


# Symbols displayed in the People Also Watch sidebar.  애플을 본 사람들이 같이본 주식들
aapl$recommendations



## Indices

# Use the Index
# class for getting all data related to indices from Yahoo Finance API.
# Instantiate Index Class

# We can instantiate the Index
# class by passing the index symbol. For instance, to get data for Nifty 50, pass ^NSEI
# as the first argument to the Index class.
nifty <- Index$new('^NSEI')


# Summary

# Use the summary_detail
# property to retrieve data from the Summary tab.
nifty$summary_detail

# Historical Data

# Use the get_history()
# method to retrieve historical data for a given index. By default, it returns YTD data.
nifty$get_history(start = '2022-10-20', interval = '1d')


nifty$get_history(start = '2022-10-01', end = '2022-10-14', interval = '1d')

nifty$get_history(period = '1mo', interval = '1d')



# Currency
# Summary

# currency_summary()
# retrieve information available via the Summary tab in Yahoo Finance.. View the documentation to learn more.
currency_summary(from = "USD", to = "INR")


# Converter

# currency_converter()
# retrieve current conversion rate between two currencies as well as historical rates.
currency_converter('GBP', 'USD', '2022-07-01', '2022-07-10')


currency_converter('GBP', 'USD', period = '1mo', interval = '1d')
