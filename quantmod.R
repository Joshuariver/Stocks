# 재무데이터 수집
# Google Finance 에서 2018년 이후 더 이상 주가정보를 제공하지 않아 작동하지 않는 코드임.

rm(list=ls())
setwd("~/R/Stock Analysis/Stock analysis")


# 미국에 상장된"엔비디아"(코드 : NVDA) 라는 회사의 재무 데이터를 보여드리겠습니다.

# 1) quantmod가 필요하죠
require(quantmod)

library(BatchGetSymbols)

# 2) NVDA의 Finance 객체를 가져옵니다.
NVDA=getFinancials("KRX: 066570",src='google', auto.assign = FALSE)

# 3) Balance Sheet를 볼까요?
  # 연간, 분기

  NVDA.BS.A = viewFinancials(NVDA, type='BS', period='A')
  NVDA.BS.Q = viewFinancials(NVDA, type='BS', period='Q')
  
#  4) Income Statement를 볼까요?
  NVDA.IS.A = viewFinancials(NVDA, type='IS', period='A')
  NVDA.IS.Q = viewFinancials(NVDA, type='IS', period='Q')
  
  #5) Cash flow 를 볼까요?
  NVDA.CF.A = viewFinancials(NVDA, type='CF', period='A')
  NVDA.CF.Q = viewFinancials(NVDA, type='CF', period='Q')
  
#  6) 계정을 한번 확인해 볼까요? 당기순이익을 보겠습니다.

rownames(NVDA.IS.A)



## Not run: 
# All 3 getSymbols calls return the same
# MSFT to the global environment
# The last example is what NOT to do!

## Method #1
getSymbols('MSFT',src='yahoo')

## Method #2
setDefaults(getSymbols,src='yahoo')
# OR
setSymbolLookup(MSFT='google')

getSymbols('MSFT')



getFX("USD/KRW",
      from = "2007-01-01", to = Sys.Date(),
      env = .GlobalEnv,
      verbose = FALSE,
      warning = TRUE,
      auto.assign = TRUE)

getFX("USD/ARS",
      from = "2007-01-01", to = Sys.Date(),
      env = .GlobalEnv,
      verbose = FALSE,
      warning = TRUE,
      auto.assign = TRUE)

getFX("USD/MXN",
      from = "2007-01-01", to = Sys.Date(),
      env = .GlobalEnv,
      verbose = FALSE,
      warning = TRUE,
      auto.assign = TRUE)

plot(USDKRW)
plot(USDARS)
plot(USDEUR)
plot(USDMXN)

summary(USDKRW)

x <- read.csv("API_NY.GDP.MKTP.CD_DS2_en_csv_v2.csv")
m <- read.csv("major3exchange.csv")

plot(m$Brazil)
