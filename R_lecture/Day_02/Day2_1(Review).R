ID = c(1,2,3,4,5)
MId_EXAM = c(10,25,100,75,30)
CLASS = c("1반","2반","3반","4반","5반")
example_test = data.frame(ID, MId_EXAM, CLASS)
View(example_test)
#변수입력
myVar = 100
myVar <- 100
100 -> myVar
myVar
print(myVar)
cat("변수의 값 : ",myVar)
mySeq = seq(1,100,3)
#연산자
Var1 = 100
Var2 = 3
result = Var1/Var2
result
option(digits = 5) #계산 후5자리까지만 출력

sprintf("%.7f" , Var1/Var2) #소수점 7자리까지 출력
sprintf("%2.9f" , Var1/Var2)
#실수 2자리 소수점 9자리까지 출력 chr로 출력 "33.333333333"

Var1 %/% Var2 #몫의 값 33
Var1 %% Var2 #나머지 값 1

#비교연산자
Var1 == Var2 #F
Var1 != Var2 #T
# & 연산과 | 연산
# & && | || 의 차이 두개짜리는vector연산시 첫번째 요소만 을 비교
v1 = c(T,T,T)
v2 = c(T,F,T)
v1&v2

#Data type
#numeric, character,logical, complex
#Null, NA, NAN, Inf
#R이 제공하는 기본함수 중에 데이터 타입을 알아보는 함수?
#1. mode()
var1 = 
mode(var1)
#2. is.계열의 함수
is.character(v1)

#R의 데이터 탐입은 우선순위를 가진다
#1. character, 2. complex, 3. numeric, 4. logical

#R은 as.함수를 통해 다른 데이터 타입으로 바꿀 수 있다.
as.double(var1)  #로지컬 타입을 정수로 바꾸면 TRUE->1 , FALSE->0
as.logical(var1) #as.logical로 실수 변환시 1->TRUE. 0-> FALSE



