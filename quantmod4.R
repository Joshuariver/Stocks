# Q과 Quant 투자 분석 기초
# https://tariat.tistory.com/628

rm(list=ls())
library(quantmod)

stock_data <- getSymbols(Symbols="096770.KS", src = "yahoo", from= "2018-01-01", to = "2019-12-31", auto.assign = FALSE)

# 096770.KS 는 삼성전자  https://finance.yahoo.com/ 에서 검색할 수 있다. 단 영문명으로 입력해야 한다.

ss_df <- stock_data

names(ss_df) <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")

plot(ss_df$Adjusted)



# 환율 데이터 가져오기
# 하기 데이터는 OANDA 에서 제공하는 데이터임.  https://www1.oanda.com/
# OANDA: Online Forex Trading & Forex Broker | OANDA
# 

# 달러 환율

usd_df <- getSymbols(Symbols="USD/KRW", src = "oanda", from=  Sys.Date() - 30, to =  Sys.Date(), auto.assign = FALSE)


plot(usd_df)

# 엔화 환율

jpy_df <- getSymbols(Symbols="JPY/KRW", src = "oanda", from=  Sys.Date() - 30, to =  Sys.Date(), auto.assign = FALSE)


plot(jpy_df)


# 유로 환율

eur_df <- getSymbols(Symbols="EUR/KRW", src = "oanda", from=  Sys.Date() - 30, to =  Sys.Date(), auto.assign = FALSE)

plot(eur_df)



# 원자재 가격.  원자재 가격은 아래 세인트루이스 fred 에서 얻을 수 있음.
# https://fred.stlouisfed.org/

oil_df <- getSymbols("DCOILWTICO",src="FRED",auto.assign = FALSE)

plot(oil_df)





# 대한민국 M2통화량
# 하기 데이터는 FRED (미국 연준위) 에서 제공하는 데이터임.
# https://fred.stlouisfed.org/


m2_df <- getSymbols("MYAGM2KRM189S",src="FRED",auto.assign = FALSE)


plot(m2_df)


# 대한민국 실업률


lost_df <- getSymbols("LRHUTTTTKRA156N",src="FRED",auto.assign = FALSE)

plot(lost_df)
