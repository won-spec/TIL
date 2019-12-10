# 연습문제
# 사용할 데이터 : 2 3 5 6 7 10

# 1. 주어진 데이터로 vector x를 생성하세요
x <- c(2,3,5,6,7,10); x

# 2. 주어진 데이터 각각을 제곱해서 vector x를
# 생성하세요
x = c(2,3,5,6,7,10)^2; x

# 3. 주어진 데이터 각각을 제곱해서 합을 구하세요
sum(c(2,3,5,6,7,10)^2)

# 사용할 데이터 : 2 3 5 6 7 10
# 4. 주어진 데이터에서 5보다 큰 값들로 구성된 vector x를 구하세요
x = c(2,3,5,6,7,10)
var1 = c(2,3,5,6,7,10) > 5 # mask
x[var1]                    # fancy indexing

x = c(2,3,5,6,7,10)
# 5. vector x의 길이를 구하세요!
length(x)

# 6. R의 package중에 UsingR 이 있어요!
install.packages("UsingR")
# 설치된 package를 불러들여요!
library(UsingR)
# 데이터를 불러들일 수 있어요!
# 1부터 2003까지 숫자 중 prime number를 
# 가지고 있어요!
data("primes")
head(primes)  # 앞에서 6개만 출력
tail(primes)  # 뒤에서 6개만 출력

# 7. 1부터 2003까지 숫자 중 prime number는 몇개인가요?
length(primes)   # 총 304개

# 8. 1부터 200까지 숫자 중 prime number는
#몇개인가요?
sum(primes <= 200)

# 9. 평균을 구해보아요!
mean(primes)

# 10.500이상 1000 이하의 prime number만으로
# 구성된 vector p를 구하세요!~
# fancy indexing을 이용해 보아요!!
p = primes[primes >= 500 & primes <= 1000]
p

# 다음과 같은 형태의 데이터를 이용하여
# 아래의 문제를 풀어보아요!
# 1 5 9
# 2 6 10
# 3 7 11
# 4 8 12

# 11. 위의 데이터를 이용해서 matrix x를
# 생성하세요
x = matrix(seq(1,12),
           nrow=4,
           byrow = F)
x

# 12. 전치행렬을 만들어 보아요!
t(x)

# 13. matrix x에 대해 첫번째 행만 추출하세요
x[1,]

# 14. matrix x에 대해 6,7,10,11을 matrix형태로 추출하세요
x[2:3,-1]

# 15. matrix x에 대해 x의 두번째 열의 원소가
# 홀수인 행들만 뽑아서 matrix p를 생성하세요
p = x[x[,2] %% 2 == 1, ]
p

## 프로그래밍
## 홀수개의 숫자로 구성된 숫자문자열이
## 입력으로 제공됩니다. 문자열의 개수는
## 7개 이상 11개 이하로 제한됩니다.
## 입력 문자열의 길이는 7개, 9개 , 11개

## 중앙 숫자를 기준으로 앞과 뒤의 숫자를
## 분리한 후 분리된 두 수를 거꾸로
## 뒤집어서 두수의 차를 구해요!

## 예) 7648623
##     764 623   가운데를 기준으로 나눠요
##     467 326   각 숫자를 거꾸로 뒤집어요
##     141       (467-326) 두 수의 차

## 예) 7648620
##     764 620   가운데를 기준으로 나눠요
##     467 026   각 숫자를 거꾸로 뒤집어요
##               (467-26) 두 수의 차


library(stringr)
input = "7648623"
mid_input=(str_length(input) %/% 2) + 1
var1 = str_sub(input,
               1,
               mid_input-1)
var2 = str_sub(input,
               mid_input+1,
               str_length(input))
abs(
as.integer(paste(rev(str_split(var1,pattern = "")[[1]]),collapse = ""))
-
as.integer(paste(rev(str_split(var2,pattern = "")[[1]]),collapse = ""))
)
########################################

# 기본적인 R 사용
# data type (자료형)
# data structure (자료구조)
# control statement (제어문)

# Web
# 데이터를 구축
# Database로 부터 데이터를 얻어올 수 있어요
# Open API를 이용해서 데이터를 얻어올 수 있어요
# 파일로부터 데이터를 얻어올 수 있어요
# 프로그램적으로 web scraping, crawling을
# 통해 데이터를 구축

# HTML, CSS, JavaScript 
# HTML : 웹페이지의 내용, 구조를 담당
# CSS  : 웹페이지의 styling을 담당
# JavaScript : 웹페이지의 동적처리를 담당

# 기본적으로 Web은 CS구조로 되어 있어요
# CS구조 : client-server구조
# server쪽 프로그램 : web server
#           HTML,CSS,JAvaScript를 제공
# client쪽 프로그램 : chrome(browser)
# 서버로부터 HTML,CSS,JavaScript를 받아서
# 화면에 rendering을 해요!

# HTML, CSS, JavaScript를 이용해서
# 클라이언트에게 제공해주는 Web page를
# 만들어 보아요!
# 개발툴이 있어야 해요!
# WebStorm을 이용해서 개발해 보아요!
# 실행해보아요!

# 클라이언트에게 제공할 HTML을 작성했어요!
# 서버프로그램(web server)에게 우리 프로젝트를 알려줘야 해요!
# 우리 프로젝트를 web server에게 인지시켜야 해요!! (configure)
# web server 프로그램을 기동시켜서 우리 프로젝트를 웹에 deploy
# web client(browser)를 이용해서 URL(주소, 좌표) 서버쪽 프로그램에 접속해서 HTML을 받아가서 화면에 그려요(표시해요)

# Web server가 webstrom에 내장되어 있어요!












































