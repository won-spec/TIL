setwd("C:/R_lecture")
getwd()
#Data Type : 저장된 데이터의 성격(numeric, character, logical)
#Data Structure : 변수에 저장된 데이터의 메모리 구조
#R이 제공하는 자료구조 형태
#6가지 기억!
#2개의 분류로 나누어짐
#1. 같은 데이터 타입 2. 다른 데이터타입

#1 vector : 1차원, 같은 data type
#2 matrix : 2차원, 같은 data type
#3 array : 3차원, 같은 data type

#4 list : 1차원, 다른 data type, 중첩자료구조
#중첩자료구조? 다른자료구조를 안에 집어넣을 수 있다. ex)list(10,c("a","b"))
#5 data frame : 2차원, 다른 data type
#6 Factor : 범주형 자료구조

#같은 데이터 타입을 저장하는 자료구조
#vector(1차원), matrix(2차원), array(3차원 이상)
#다른데이터 타입을 저장하는 자료구조
#List(1차원), data frame(2차원)
#범주형 자료구조 => factor

#############################################################################

#data frame
#matrix와 같은 2타원 형태의 자료구조
#다른 데이터 타입을 사용할 수 있음
#column명을 이용할 수 있음
#Database의 Table의 형태와 유사

#간단한 예를 이용해보자
#vector를 이용한 dataframe 생성

no=1:3
name=c("홍","김","최")
age=c(10,20,30)
df
df = data.frame(s_no=no,
                s_name=name,
                s_age=age)
df$s_no
df$s_name # Levels: 김 최 홍 출력, access시 범주형으로 잡힘.
df$s_age # list 에서 $의 의미는 key의 의미, df에서는 column의 의미

#matrix를 바로 df에 적용가능 하다.
myMatrix = matrix(rep(1:12,1),
                  ncol = 3,
                  byrow = T); var_matrix
df_mat = data.frame(myMatrix)
df_mat

#키보드로부터 데이터를 받기 위해서 edit()함수를 이용할수 있어요
var1 = data.frame()

df = edit(var1)
df

#data frame의 함수
str(df) #df의 구조를 확인할수 있음
#'data.frame':	3 obs. of  3 variables: //출력값 obs => 열, variable => 행의 개수  
#'$ s_no  : int  1 2 3
#$ s_name: Factor w/ 3 levels "김","최","홍": 3 1 2
#$ s_age : num  10 20 30

summary(df) #df의 요약통계 확인가능

apply() #df에도 적용가능

df = data.frame(x=c(1:5),
                y=seq(2,10,2),
                z=c("a","b","c","d","e"))
df
#연습문제)주어진 df의 1,2번째 column에 대해 각각 합계를 구하시오
apply(df[,-c(3)], 2, sum)

df1 = data.frame(df$x,df$y)
df1

apply(df1, 2, sum)
mat1 = matrix(df1); mat1
apply(mat1, 2, sum)

#subset() : df에서 조건에 맞는 행을 추출해서 독립적인 df를 생성
#subset(데이터프레임, 열에 맞는 조건들)
df = data.frame(x=c(1:5),
                y=seq(2,10,2),
                z=c("a","b","c","d","e"),
                stringsAsFactors = F)


df
str(df)

subset(df, x > 1)
#연습문제) x가 3보다 작고 y가 4이상인 데이터를 추출하세요
subset(df, x<3 & y>=4 & z=="b")
subset(df, x<3 & y>=4 & z=="c") 
#조건에 맞지않는 subset추출 시 <0 행> <또는 row.names의 길이가 0입니다>출력