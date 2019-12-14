getwd()
setwd("C:/R_lecture")
.libPaths("C:/R_lecture/Lib")
.libPaths()
#R에서 JSON데이터 처리
#NETwork을 통해서 JSON데이터를 받아 DataFrame으로 만들기 위해
#새로운 패키지를 이용해보자
install.packages("jsonlite") #JSon처리를 위한 패키지
install.packages("httr") #네트윜 연결하고 사용하기 위한 함수
library(httr)
library(jsonlite)
library(stringr) #문자열 처리를 위한 패키지

url <- "http://localhost:8080/bookSearch/search?keyword="
request_url <- str_c(url, #scan()콘솔창에서 직접입력하는 함수
                     scan(what=character()));request_url
#한글처리
URLencode(request_url)

url2 <- "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=a4eb22aba123ac92944e486b2b560f89&targetDt="
request_url2 <- str_c(url2, #scan()콘솔창에서 직접입력하는 함수
                     scan());request_url2

#주소가 완성
df <- fromJSON(URLencode(request_url)) # 검색어를 한글로 주면 오류
View(df)
str(df) #DF의 구조를 파악
names(df)#데이터의 key값을 뽑아냄

#찾은 도서제목만 console에 출력!
for( i in 1:nrow(df)){
  print(df$author[i])
}

#JSON을 이용해서 Data Frame을 생성할 수 있어요
#data frame을 csv형식으로 file에 저장

write.csv(df,
          file="C:/R_lecture/Data/book.csv", #불러온데이터프레임을 저장
          row.names = F, #행의 번호를 없앤다
          quote = F) #

#Data Frame을 JSON으로 변경하려면 어떻게 해야하나?
df_json <- toJSON(df) #그냥 JSON형태로 변경
df_json #용량을 위해 전송같은 경우 이상태로 전송
prettify(df_json) #구조화된 JSON형태

write(df_json,
      file="C:/R_lecture/Data/book.txt")
write(prettify(df_json),
      file="C:/R_lecture/Data/book.txt")

######################################################################
#2018.10.30 박스오피스 순위를 알아내서 csv파일로 제목과 누적관람객수저장
#두가지 방식존재 
#1.DF를 다시 만드는것

key=
url2 <- "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="key"&targetDt="
request_url2 <- str_c(url2, #scan()콘솔창에서 직접입력하는 함수
                      scan());request_url2
df <- fromJSON(request_url2)
df
names(df)
str(df)

names(df$boxOfficeResult$dailyBoxOfficeList)

df1=df$boxOfficeResult$dailyBoxOfficeList; df1
myDf = data.frame(df1$movieNm,
                  df1$audiAcc); myDf
names(myDf) = c("제목","누적관객수");myDf #matrix에서는 불가능

mat = matrix(1:12, nrow = 4);mat
DF = data.frame(mat);DF
names(DF) = c("1열","2열","3열");DF

#varname <- c("제목","누적관객수")
#myDf2 = `colnames<-`(myDf,varname);myDf2
#myDf2 = colnames(myDf,varname);myDf2

#myDf = data.frame("제목"=df1$movieNm,"누적관객수"=df1$audiAcc)
#myDf1 = data.frame(myDf,col.names=varname)

write.csv(myDf2,
          file = "C:/R_lecture/Data/Movie.csv")

#######################################################################
#2.for문을 이용해서 데이터를 추출해 text파일에 append하는것
var1 = length(df$boxOfficeResult$dailyBoxOfficeList$movieNm)

var2 = df$boxOfficeResult$dailyBoxOfficeList$movieNm
var3 = df$boxOfficeResult$dailyBoxOfficeList$audiAcc

for(i in 1:var1){
    cat("제목 :", var2[i], ", 관객수:",var3[i], "\n")
}














