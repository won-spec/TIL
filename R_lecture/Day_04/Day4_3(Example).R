#연습문제
#사용할 데이터 : 2 3 5 6 7 10

#1. 주어진 데이터로 vector x를 생성하세요
x<-c(2,3,5,6,7,10); x #실제작업할 때에는 = 대신 <- 사용권장

#2. 주어진 데이터 각각을 제곱해서 vector x를 생성
var1 = c(2,3,5,6,7,10)
x = c(var1^2); x
x = c(2,3,5,6,7,10)^2
x

#3. 주어진 데이터 각각을 제곱해서 합을 구하시오
sum(x)

#4. 5보다 큰값들로 구성된 vextor x 생성 
x = c(2,3,5,6,7,10)
var1 = c(2,3,5,6,7,10) > 5 #mask
var1
x[var1]
rm(x)

# 4-1. 아래의 구문을 실행한 결과?
x = c(1,2,3,4,5)
(x*x)[!is.na(x) & x > 2]
#(T T T T T) & (F F T T T)
#(1 4 9 16 25) na가 아닌 것 중 x가 2보다 큰값 추출 => 9 16 25
#(1 4 9 16 25)[(F F T T T)] => Fancy indexing
(x*x)[c()]

myLogi = vector(mode = "logical", 10); myLogi
# 4-2. 다음의 계산 결과는?
x = seq(2,8,2) #2 4 6 8
y = c(T,T,F,T)
sum(x[y])

#5. vector x의 길이?
x = c(2,3,5,6,7,10)
length(x)

#6. R의 패키지중에 UsingR 이 있다.
install.packages("UsingR")
library(UsingR)
.libPaths()
#data를 불러들일 수 있다.
#1부터 2003까지의 정수중 소수만을 들고있음
data("primes")
head(primes) #앞에서부터 6개의 값만 출력
tail(primes) #뒤에서부터 6개의 값만 출력

#7. 1부터 2003까지 소수의 개수
length(primes)

#8. 1부터 200까지 소수의 개수
x = c(500:1000)
var = length(c(!is.na(x[primes])))
length(c(!is.na(x[primes])))
c(!is.na(x[primes]))
!is.na(x[primes])
x[primes]
var
primes
sum(primes <= 201)
primes <= 201

#9. 평균을 구해보자
mean(primes)

#10. 500이상 1000이하의 소수로 구성된 vector
x = (500:1000)
var1 =c(!is.na(x[primes])); var1
sum(var1)
sum(primes<=1000 & 500<=primes)
var1 = primes[500<=primes]
var2 = primes[primes<=1000]
a = intersect(var1,var2); a
length(a)

p = primes[500<=primes & primes<=1000 ]; p

#11. 다음과 같은 형태의 데이터를 이용하여 아래의 문제를 풀어보세요
#1 5 9
#2 6 10
#3 7 11
#4 8 12

myMat = matrix(1:12, nrow = 4); myMat

#12. 전치행렬?
t(myMat)

#13. matrix에서 첫번째 행만 추출
myMat[1,]

#14.
myMat[c(2,3),-1]

#15. 두번째열의 원소가 홀수인 핻ㄹ만 뽑아서 새로운 매트릭스 p생성
p = myMat[c(1,3),]; p
p = myMat[myMat[,2] %% 2 == 1,];p

p = subset(myMat, c(,1) %/% 2 ==0) ##subset은 matrix에서 사용불가

##프로그래밍
#홀수개의 숫자로 구성된 숫자문자열이 입력으로 제공됩니다.
#문자열의 개수는 7개이상 11개 이하로 제한됩니다.
#문자열의 길이는 7, 9, 11 중 하나

##중앙 숫자를 기준으로 앞과 뒤의 숫자를 분리한 후 분리된 두 수를 거꾸로 뒤집어서 두수의 차를 구하시오
#ex)예 7648623 764 / 623 => 467 / 326 => 467-326
install.packages("stringr")
library(stringr)
.libPaths()
getwd()
input = "7648623"

part1 = (str_length(input) %/% 2) ; part1
part2 = (str_length(input) %/% 2) +2 ; part2
last = str_length(input)

as.numeric((str_sub(input,1,3)))
as.numeric((str_sub(input,5,7)))

rev(str_split(str_sub(input,1,part1),""))
rev(str_split(str_sub(input,part2,last),""))

var1 = as.numeric(str_split(str_sub(input,1,part1),""))
var2 = as.numeric(str_split(str_sub(input,part2,last),""))

str_sub(input,1,3) 

str_split(str_sub(input,1,3),"")
var1 = str_split(str_sub(input,5,7),"")

var2 = [[1]]


if(str_length(input)=7){
  as.numeric((str_sub(input,1,3)))-as.numeric((str_sub(input,5,7)))
}else{}
if(str_length(input)=9){
  as.numeric((str_sub(input,1,4)))-as.numeric((str_sub(input,6,9)))
}else
if(str_length(input)=11){
  as.numeric((str_sub(input,1,5)))-as.numeric((str_sub(input,7,11)))
}

































