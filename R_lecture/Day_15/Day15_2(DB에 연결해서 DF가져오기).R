# R에서 DB에 연결해보자
# MySQL에 연결해서 데이터를 가져오자

#1. MySQL DBMS를 기동 : mysqld
#2. R에서 DBMS에 접근하려면 몇개의 package가 필요

# Java언어를 사용
# Java가 설치되어 있어야함
# JAVA_HOME 환경변수도 잡아줘야함

#1.자바언어사용 2.DB연결 3.R에서 DB조작
install.packages("rJava") #R언어에서 Java언어를 사용하기 위한 package
install.packages("RJDBC") #R언어에서 JDBC언어를 사용하기 위한 package
# Java로 DB를 사용하기 위한  library

install.packages("DBI") #DB를 사용하기 위한 package
library(rJava)
library(RJDBC)
library(DBI)

##필요한 패키지와 로딩이 끝나고
#driver가 필요
#Java언어가 DB에 접속하고 사용하기 위한 기능이 들어있는 library
#사용하는 DB마다 설정방법이 다르다

#Mysql 설정방법
#java가 DB를 접속, 이용하기 위한 설정
drv = JDBC(driverClass = "com.mysql.jdbc.Driver",
           classPath = "C:/R_lecture/mysql-connector-java-5.1.48-bin.jar")

# R언어에서 DB연결
conn <- dbConnect(drv,
                  "jdbc:mysql://localhost:3306/library",
                  "data",  #MySQL id
                  "data")  #MySQL pw

# Query 실행 (SQL : 데이터베이스를 제어하기 위한 언어)

sql = "select btitle from book" #btitle col을 뽑아와
sql = "select*from book" #book이라는 table전부 뽑아와
df <- dbGetQuery(conn,sql); #연결된 DBMS에서 가져와

head(df)
View(df)

library(dplyr)

df %>%
  filter(bprice > 55000) %>%
  select(btitle)

########################여기까지가 R의 기본 & EDA################################
# ==> R 샤이니 (웹 프레임웤) => python flask로 대체

# ==> python 시작 (로직작성...)
# => data type & data structure & 로직
# => Numpy & Pandas를 이용한 EDA
# => 통계 개념, python에서 처리, R에서 처리
# => 통계적 데이터 분석
# => Tensorflow를 이용한 machine learning  > AI
# => Deep Learning(CNN)
# => R에서는 어떻게 하는지? 확인






