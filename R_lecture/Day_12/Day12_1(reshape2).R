getwd()
setwd("C:/R_lecture")
library(dplyr)
library(ggplot2)
library(stringr)
# reshape2 로우데이터를 얻을 때 우리가 원하는 형태가 아님
# 우리가 원하는 형태의 데이터로 변환을 위해 사용
# 데이터의 형태를 바꿀수 있다.
# 가로로 되어있는 데이터를 세로로 바꿀 수 있다.
# col <-> row 데이터의 형태 변환

sample_mpg = read.csv("C:/R_lecture/Data/sample_mpg.csv",
                      sep = ",",
                      header = T,
                      fileEncoding = "UTF-8");sample_mpg

melt_sample_mpg = read.csv("C:/R_lecture/Data/melt_mpg.csv",
                    sep = ",",
                    header = T,
                    fileEncoding = "UTF-8");melt_sample_mpg
# 두개의 DF에서 평균도시 연비
sample_mpg %>%
  summarise(avg = mean(cty))

melt_sample_mpg %>%
  filter(variable == "cty") %>%
  summarise(avg = mean(value))

# 두개의 DF에 대해서 평균연비를 구하고 표시
sample_mpg %>% 
  mutate(avg = (cty+hwy)/2)

melt_sample_mpg # 평균연비를 구할 때 데이터의 형태때문에 까다롭다
### reshape2는 수집한 데이터를 분석하기 편한 형태로 가공할 때
### 사용하는 대표적인 패키지
### 2개의 함수만 기억하자!
# 1. melt() : col의 데이터를 row데이터로 변환 가로->세로
#             numeric(숫자)을 포함하고 있는 모든col을 row로 변환
# 간단한 예시
.libPaths()
install.packages("reshape2")
library(reshape2)
#R에 내장된 data set
df <- airquality #원본은 건드리지말자
head(df)
str(df)

melt(df) #df는 153행, 6열

nrow(melt(df, na.rm = T)) #결측치를 제외

melt(df, id.vars = "Month") #153*5 =765행
melt(df, id.vars = c("Month","Day")) #153*4
melt(df, id.vars = c("Month","Day"),
     measure.vars = "Ozone") # Month, Day를 기준으로 Ozone만 녹여라

melt_df<-melt(df, id.vars = c("Month","Day"),
              measure.vars = "Ozone",
              variable.name = "Item",
              value.name = "Item_value") #col의 이름 변경

# acast() : row형태의 데이터를 col로 변경 vector, array등에
# 2. dcast() : row형태의 데이터를 col로 변경 DF에 적용
dcast(melt_df,
      formula = Month ~ Item) # ... :나머지를 의미, col명을 기입해도됨
      
dcast(melt_df,
      formula = Month ~ Item, # ... :나머지를 의미, col명을 기입해도됨
      fun=mean,
      na.rm=T) 

##처음에 생성한 csv파일을 원상복구시켜보자
melt_sample_mpg

dcast(melt_sample_mpg,
      formula = manufacturer+model+class+trans+year ~ variable,
      value.var = "value")
# 제공된 파일을 이용한 melt형식의 data frame은 원상복귀 불가능
# 똑같은 row가 존재하면 불가능 / 하나의 항목에 중복되는 동일한 값이 존재

# melt()된 데이터를 생성해보자
# mpg를 가지고 melt data set을 생성해보자
df <- as.data.frame(mpg)
head(df)
audi_df <- df %>%
              filter(manufacturer == "audi",
                     model == "a4")
audi_df

melt_audi_df <- melt(audi_df,
                     id.vars = c("manufacturer",#기준컬럼
                                 "model",
                                 "year",
                                 "cyl",
                                 "trans"),
                     measure.vars = c("displ",#melt시킬 컬럼
                                      "cty",
                                      "hwy"))
melt_audi_df

dcast(melt_audi_df,
      formula = manufacturer+model+year+cyl+trans ~ variable,
      value.var = "value")
