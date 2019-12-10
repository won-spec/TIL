#실제로 DF를 핸들링할때는 plyr을 개량한 dplyr을 이용
#dplyr은 C++로 구현되었기 때문에 속도가 빠름
##dplyr은 코딩시 chaining을 사용할 수 있다.
var1 <- c(1,2,3,4,5)*2+5
var2 <- var1*2
var3 <- var2+5
getwd()
.libPaths("C:/R_lecture/Lib")
install.packages("dplyr")
library(dplyr)
library(xlsx) #엑셀 파일 불러들일 수 있는 패키지
#dplyr의 주요함수
#1. tbl_df : 현재 console크기에 맞추어 data frame을 추출하라는 함수
head(iris)
tbl_df(iris)

#2. rename() : col이름을 바꿀수 있다.
#   rename(data frame,
#         바꿀col명1 = 이전col명1,
#         바꿀col명2 = 이전col명2,.....)
# col명을 수정한 DF가 리턴
# 제공된 excel을 읽어들여서 data frame을 생성한후
# col명을 보니 통일안된 항목 통일시켜보자
data_excel=read.xlsx(file.choose(),
                     sheetIndex = 1,
                     encoding = "UTF-8");data_excel
ls(data_excel)
names(data_excel)

df <- rename(data_excel,
             CNT17 = Y17_CNT,
             CNT16 = Y16_CNT);df

#3. 하나의 DF에서 하나 이상의 조건을 이용해서 데이터를 추출하려면 어떻게 해야할까?
# filter(DF,
#        조건1,조건2,...)
data_excel
filter(data_excel,
       SEX == "M",
       AREA == "서울")

## 지역이 서울 혹은 경기인 남성들 중 40살 이상의 사람들의 정보를
## 출력해보자
filter(data_excel,
       AREA == "서울" | AREA == "경기",
       SEX == "M",
       AGE >= 40)

## 지역이 서울 혹은 경기혹은 제주 남성들 중 40살 이상의 사람들의 정보를
## 출력해보자
filter(data_excel,
       AREA %in% c("서울", "경기", "인천"), #조건을 한번에
       SEX == "F",
       AGE >= 40)

# 4. arrange(DF,
#            column1, desc(column2),...)
# 정렬의 기준은 오름차순 정렬
# 만약 내림차순으로 정렬하려면 desc()

## 서울살고 남자, 2017년도 처리금액이 400,000원 이상인 사람을 나이가 
## 많은 순으로출력(chaining 포함)
data_excel
df1 <- filter(data_excel,
              SEX == "M",
              AMT17>=400000,
              AREA == "서울") %>% #chaining  기호
  arrange(desc(AGE))
df1

# 5.select(DF, col1, col2,...)
# 추출하길 원하는col을 지정해서 해당 col만 추출할 수 있다
## 서울살고 남자, 2017년도 처리금액이 400,000원 이상인 사람을 나이가 
## 많은 순으로출력
# ID와 나이, 그리고 2017년도 처리 건수만 출력
data_excel
df1 <- filter(data_excel,
              SEX == "M",
              AMT17>=400000,
              AREA == "서울") %>% #chaining  기호
  arrange(desc(AGE)) %>%
  select("ID":"AREA");df1
  select(AGE,Y17_CNT)

select(-SEX)
select("ID:AREA")

# 6.$를 이용해 새로운 col을 생성할 수 있다.
##500000원 이상이면 VIP ifelse(조건, 참, 거짓)
data_excel$Grade = ifelse(data_excel$AMT17 >= 500000,
                          "VIP",
                          "Normal")
data_excel

# dplyr은 새로운 col을 생성하기 위한 함수 제공
# 6-1. mutate(DF, col1 = 수식1, col2 = 수식2)

##경기사는 여자를 기준으로 2017년도 처리금액을 이용하여
##처리금액의 10%를 가산한 값으로 새로운 col/AMT17_REAL
##AMT17_REALdl 45만원 이상인경우 VIP col을 만들어서 T,F입력
data_excel
df2 <- filter(data_excel,
              SEX == "F",
              AREA == "경기") %>%
  mutate(AMT17_REAL = AMT17*0.1 + AMT17,
         VIP = ifelse(AMT17_REAL>=450000,
                      T,
                      F)); df2

# 7. group_by() & summaries()
df <- filter(data_excel,
             AREA == "서울" & AGE > 30) %>%
  group_by(SEX) %>%
  summarise(sum=sum(AMT17), #각각의 AMT17값 더함
            cnt=n()) #n() : 개수를 세는 함수
df

# 8. plyr package의 join함수가 각 기능별 독립적인 함수로 제공
# >left_join()
# >right_join()
# >inner_join()
# >full_join()

# 9. bind_rows(df1,df2)
#    주의할 점을 컬럼명이 같아야 우리가 생각하는 것처럼 결합
#    컬럼명이 같지 않으면 컬럼을 생성해서 결합이 됨.
df1 <- data.frame(x=c("a","b","c"))
df1
df2 <- data.frame(y=c("d","e","f"))
df2
bind_rows(df1,df2)

#########################################################################
##연습문제
library(plyr)
library(dplyr)
#movieLens Data Set을 이용해서 처리해보자
#영화에 대한 평점 정보 기록 평점을 1점~5점
#사람이 한두사람이 아님
#영화도 굉장히 많다. 구글에서 검색
#timestamp : 숫자로 날짜를 표현하는 방식
#    1     : 1970년 1월 1일 0시 0분 1초
#    2     : 1970년 1월 1일 0시 0분 2초 1초당 1씩 증가

#데이터를 받았으면 데이터의 구조 확인
#컬럼의 의미를 파악
DS1 = read.csv(file.choose(),
              encoding = "UTF-8")
DS2 = read.csv(file.choose(),
               encoding = "UTF-8")

# 1. 사용자가 평가한 모든 영화의 전체평균평점
mean(DS2$rating)
# 2. 각 사용자별 평균 평점
df1 <- ddply(DS2,
            .(userId),
            summarise,
            avg=mean(rating))
head(df1) #사용자 별 평균 평점
# 3. 각 영화별 평균 평점
df2 <- ddply(DS2,
            .(movieId),
            summarise,
            avg=mean(rating))
head(df2) #영화별 평균 평점
# 4. 평균 평점이 가장 높은 영화의 제목을 내림차순으로 정렬, 출력
#    만약 동률인 경우 모두출력
# arrange(DF,column1, desc(column2),...)
head(DS1)
head(DS2)
head(inner_join(DS1,df2, by="movieId"))
df3 <- inner_join(DS1,df2, by="movieId")#영화 ID기준
head(df3)
df4 <- arrange(df3,desc(avg))
df44 <-filter(df4,
              avg == 5)
df444 <- arrange(df44, desc(title))
head(df444)
tail(df444)
sum(is.na(df444)) #=> na의 개수 확인
# 5. comedy영화 중 가장 평점이 낮은 영화의 제목 오름차순, 출력
#    동률이 있는 경우 모두출력
tail(df4)
df5 <- filter(df4,
              grepl("Comedy",df4$genres))
head(df5)
df6 <- arrange(df5,avg)
df66 <-filter(df6,
              avg==0.5)
length(df66$movieId)
df666 <- arrange(df66,title)
df666
tail(df666,30)
# 6. 2015년도에 평가된 모든 Romance영화의 평균평점
tail(df4)

df7 <- inner_join(DS1,DS2, by="movieId")
head(df7)

df8 <- filter(df7,
              as.numeric(as.POSIXct("2015-01-01 00:00:01"))
              <=timestamp &
              timestamp<=as.numeric(as.POSIXct("2015-12-31 23:59:59")),
              grepl("Romance",df7$genres)
              )
head(df8)
mean(df8$rating)

as.numeric(as.POSIXct("2015-01-01 00:00:01"))
as.numeric(as.POSIXct("2015-12-31 23:59:59"))
