setwd("C:/R_lecture")
getwd()
#문자열 처리
#빅데이터 : 많은양의 데이터
#         : 3V
#         : 1. Volume 일반적인 처리과정으로 정해진시간내에 처리할 수 없는                       양의 데이터
#         : 2. Velocity 빠른속도로 계속해서 생성되는 데이터
#         : 3. Variety 데이터의 종류가 다양

#일반적으로 빅데이터 처리는 '문자열 처리'를 동반하는 경우가 많다
#문자열 처리를 위한 함수 패키지 stringr
install.packages("stringr")
library(stringr)

var1 = "Honggd1234Leess398548454홍길동3202"
var2 = "가나나"
#1. 문자의 길이?
str_length(var2) #한글1글자도 1개로 계산

#2. 찾는 문자열의 시작과 끝을 알려줌 
str_locate(var1,"홍") ## start end 25  25
str_locate(var1,"Leess") ##start end  11  15
class(str_locate(var1,"홍")) 
##class는 자료구조 확인,mode는 데이터 형태확인

#3. 부분문자열을 구해보자
str_sub(var1, 시작, 끝)
str_sub(var1, 3, 8) #시작과 끝 둘다 inclusive

#4. 대소문자 변경
str_to_lower(var1)
str_to_upper(var1)

#5. 문자열 교체
var1 = "Honggd1234HongLeess398548454홍길동3202"
str_replace(var1, "Hong", "Kim") ##앞에 있는 것만 변환
str_replace_all(var1,"Hong", "Kim") ##찾은 것 모두 변환

#6. 문자열 결합
var1 = "Honggd1234HongLeess398548454홍길동3202"
var2 = "가나나"
var3 = "다다"

str_c(var1,var2,var3)

#7. 문자열 분할
var1 = "Honggd1234, Leess9032, YOU25, 최길동2009"
str_split(var1, ",") ##list 형태로 분할

#8. 문자열결합
var1 = c("홍길동","김길동","최길동")
str_c(var1) #하나의 변수 => 연결 X
paste(var1, collapse = " ") #  "홍길동 김길동 최길동" 출력

######################################################################
#문자열 처리를 쉽고 편하게 하기 위해서? => 정규표현식

var1 = "Honggd1234, Leess9032, YOU25, 최길동2034"

#조건에 부합하는 문자열 추출
str_extract_all(var1, "[A-Z]")
#"H" "L" "Y" "O" "U" 출력 list형태로 제공
str_extract_all(var1, "[A-Z]{2}")
#"YO" 출력
str_extract_all(var1, "[a-z]{4}") #영문 소문자 4개인것 출력
# "ongg" "eess" 출력
str_extract_all(var1, "[a-z]{2,}") #영문 소문자 2개 이상인것 출력
#"onggd" "eess" 출력
str_extract_all(var1, "[a-z]{2,3}") #영문 소문자 2개 이상 3개이하
#"ong" "gd"  "ees"
#{} : 조건하 개수의 반복 의미
str_extract_all(var1, "34")

#한글만 추출해보자
str_extract_all(var1, "[가-힣]")
#한글 전체를 지칭하는 범위[가-힣]  "최" "길" "동" 출력
str_extract_all(var1, "[가-힣]{2,}")
#"최길동" 출력
str_extract_all(var1, "[0-9]{2,}")
# "1234" "9032" "25"   "2034" 출력

#한글을 제외한 나머지 추출?
str_extract_all(var1, "[^가-힣]{5}") #한글아닌게 5개연속인거 찾아라
##!의 의미 = ^의 의미 not의 의미 : ^

paste(str_extract_all(var1, "[a-z]"), collapse = "")

# 주민등록번호를 검사해 보아요
myId = "801112-1210419222"

str_extract_all(myId, "[0-9]{6}-[1234][0-9]{6}")
#주민등록번호에 적합한 조건들 적용
















