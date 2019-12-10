getwd()
setwd("C:/R_lecture")
#######################################################################

var1 = c("홍길동") #scalar
var2 = c(10,20,30)
ls() #  "var1" "var2" 출력
rm(list = ls()) #ls()환경창에 있는 객체를 얻을 수 있다

cat("\014") #console창 정리

#######################################################################

#파일로 부터 데이터를 읽어들일때, 일반 txt형식은 많이 사용하지 않음
#컴퓨터간에 데이터를 주고받으려고함.
#Process 간에 데이터 통신을 하기 위해서 특정 형식을 이용해 데이터를
#주고받는다.

# [1]. CSV( comma seperated value ) 
# comma기호를 이용해서 데이터를 구분, 해당문자열을 전달해서 데이터통신
# ex) "홍길동, 20, 서울, 김길동, 30, 부산, 최길동, 50, 인천...."

# CSV방식의 장점? 
# =>1.구조적간단함 / 2.부가적인 데이터가 적다 / 
#   3. 상대적으로 크기가 작다 => 많은양의 데이터 처리가능

# CSV방식의 단점?
# =>1.구조적 다양성에 대한 포용성이 적음
# 2. 구조적데이터를 표현하기에 적합하지 않음. => parsing작업이 복잡
# 3. 유지보수 문제가 발생

# [2]. XML방식
# tag를 이용해서 데이터를 표현하는 방식
# 예) <name>홍길동</name><age>20</age><address>서울</address>
#     <phone>
#         <mobile>00-2222-8888</mobile>
#         <home>02-555-6666</home>
#     </phone>
# 장점?
# => 1.구조적데이터를 표현하기에 적합,
# 2.사용하기에 편리, 데이터의 의미를 표현할 수 있다
# 단점?
# => 1.부가적인 데이터 사이즈가 너무 크다

# [3]. JSON( JavaScript Object Notation )
# 예) { name : "홍길동", age : 20, address : 서울, ...... }
# 구조적 표현이 가능하면서 XML보다 크기가 작다

#######################################################################

#read.table() : sep를 반드시 설정해야함
#read.csv() : sep가 ","이기 때문에 생략 / header = T 가 기본값

df = read.csv(file.choose(),
              fileEncoding = "UTF-8")
df              

# Excel 파일을 불러올수 있다. / 확장 package를 설치해야함.
# R을 설치하면.. => base system이 설치됨
# base package, recommended package
# other package

# xlsx  package를 설치하고 로드하자
install.packages("xlsx")
library(xlsx)
.libPaths("C:/R_lecture/Lib")
# JAVA.HOME 환경변수 설정
Sys.setenv(JAVA.HOME="C:\\Program Files\\Java\\jre1.8.0_231")

student_midterm = read.xlsx("C:/R_lecture/Data/Student_info.xlsx",
                            sheetIndex = 1,
                            encoding = "UTF-8")

student_midterm

#########################################################################

# 처리한 결과를 file에 write 하자
# write.table() : data frame을 file에 저장
# cat() : 분석결과(vector)를 file에 저장
# capture.output() : 분석결과(List.table)를 file에 저장


cat("처리한 결과는 :","\n","\n",
    file="C:/R_lecture/Data/report.txt",
    append=T)

write.table(student_midterm,
            file="C:/R_lecture/Data/report.txt",
            row.names = F, # 행번호 삭제
            quote =F,     # "" 삭제
            append=T)

capture.output(summary(student_midterm),
               file="C:/R_lecture/Data/report.txt",
               append = T)

# write.xlsx()

df = data.frame(x=c(1:5),
                y= seq(1,10,2),
                z=c("a","b","c","d","e"),
                stringsAsFactors = T)
df

write.xlsx(df,file="C:/R_lecture/Data/report.xlsx")












