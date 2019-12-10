# 데이터 전처리
# 우리가 얻는 raw data는 항상 오류를 포함하고 있다.
# 분석하기 전에 데이터 오류를 수정해야 함

# 1. 결측치 처리(NA)
# 결측치는 누락된 값을 지칭. 비어있는 값
# 결측치가 있으면 함수적용이 잘못될 수 있다.
# 분석자체가 잘못 될 수 있다.

# NA 가 전체 데이터에 차지하는 비중을 확인
# 결측치를 제거할 것인지 판단

# 결측치를 찾아야함.
sum(is.na(airquality))

df <- data.frame(id=c(1,2,NA,4,5,NA,7),
                 score = c(20,30,90,NA,60,NA,99)) 
sum(is.na(df))

table(is.na(df$id))

# 결측치를 제거해보자
# DF에서 결측치가 있는 행을 삭제하자
# dplyr을 이용해서 필터를 쓰자
library(dplyr)
library(ggplot2)
library(stringr)
df %>% filter(!is.na(id),
              !is.na(score))
na.omit(df) #NA를 찾아서 해당 행 삭제

###행을 지우는 행위는 그다지 좋지 않은 행위
###행을 지우게 되면 결측치 뿐만 아니라 정상데이터도
###같이 삭제되기 때문에 분석시 문제가 될 수 있다
df
mean(df$id) #NA와의 연산결과는 무조건 NA
mean(df$score, na.rm = T) #NA를 제외하고 연산

#결측치가 포함된 행을 삭제하기에는 부담
#score안에 있는 결측치(NA)값을 다른 값으로 대치해서
#score의 평균을 구해보자
#score에서 NA를 제외한 값들의 평균을 구하고, 
#이 평균을 NA값을 대체하자.
mean(df$score,na.rm = T)
df$score = ifelse(is.na(df$score),
                  mean(df$score,na.rm = T),
                  df$score);df
####################################################################################
# 데이터 정제 과정 : 이상치 -> 결측치 -> 제거? , 조정?
# 1.결측치 (NA)
# 결측치 -> 제거,조정?
# 2.이상치
# 존재할 수 없는 값이 포함된 경우
df <- data.frame(id=c(1,2,NA,4,5,NA,7),
                 score = c(20,30,90,NA,60,NA,99),
                 gender=c("M","F","M","F","M","F","^^"),#일반적으로 factor로 읽힘
                 stringsAsFactors = F)# character처리하고 싶으면 factor설정 F로
df
#일반적으로 이상치가 존재하면 결측치로 바꿔준다.
df$gender = ifelse(df$gender=="M"|df$gender=="F",
                   df$gender,
                   NA)

df$gender = ifelse(df$gender %in% c("M","F"),
                   df$gender,
                   NA)

# 3.극단치 => 머신러닝의 경우 극단치에 가중치 부여 전체가 이상해짐, 제거필요
# 이상치 중에 값이 극단저긍로 크거나 작은 값을 의미
# 자료구조상 이상이 없지만, 논리적으로 이상한경우
# ex)성인 남성의 몸무게 데이터에서 5kg
# 정상적인 범주는 어떻게 정할까? 기준이 존재한다.
# 극단치를 분류하는 기준은 IQR을 이용한다.
# interqualtile range , 4분위부터 알아보자!!

#극단치를 알아보기 위한 sample 작성
data = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,22.1)
#기본통계값을 이용해서 4분위 값을 알아보자
summary(data) #Median :8
# IQR : 데이터 중간 위쪽의 mid point -
#       데이터 중간 아래쪽의 mid point

lower_data = c(1,2,3,4,5,6,7,8)
upper_data = c(8,9,10,11,12,13,14,22)
iqr_value = median(upper_data)-median(lower_data)

#극단치를 결정하는 기준값 : IQR*1.5
deter_value = iqr_value*1.5; deter_value

#3사분위 값 + 기준값 = 11.5 +10.5 = 22 => 22보다 크다면 극단치
#1사분위 값 - 기준값
#계산을 통해서 극단치를 판단하는 방법
#그래프를 이용하면 극단치를 눈으로 확인 가능
boxplot(data)$stats








