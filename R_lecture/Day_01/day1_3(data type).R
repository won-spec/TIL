#R의 Data type
#크게 2가지의 타입이 존재
#1. 기본데이터타입, 2. 특수 데이터타입

################################################################

#기본데이터타입
#1. 슷자형(numeric) : 숫자로 되어 있고 정수형과 실수형을 의미
#100->실수형 100L -> 정수형
#"L"기호를 사용해 정수와 실수를 구분함

#2. 문자열(character) : 하나 혹은 둘이상의 문자의 집합
#=> 글자가 하나라도 있으면 문자'열'임
#"홍" , '홍'
#"홍길동", '홍길동'  '과 "이 같은 의미

#3. 논리형(logical) : TRUE(T), FALSE(F)

#4. 복소수형(complex) : 4-3i

#################################################################

#특수 데이터 타입
#1. NULL : 객체ㄱ 존재하지 않음을 지칭하는 객체
var1 = NULL

#2. NA : Not Available. => 결측치를 표현, 데이터 자체가 비어있음

#3. NaN : Not Available Number, Not A Number => 연산이 불가능한 숫자
sqrt(-3) #EX

#4. Inf : 양의 무한대

#5. -Inf : 음의 무한대
(0.1)^Inf
(0.1)^-Inf

#################################################################
var1 = 100
var2 = 100L
var3 = "hello"
var4 = TRUE
var5 = 4-3i
var6 = NULL
var7 = sqrt(-9)

#데이터타입을 조사하기 위해 제공된 함수는 mode()

mode(var1) #"numeric"
mode(var2) #"numeric"
mode(var3) #character
mode(var4) #logical
mode(var5) #complex
mode(var6) #Null
mode(var7) #"numeric"

#is 계열의 함수가 제공됨 =>데이터 타입을 물어보는 함수 is.xxxxx?
is.numeric(var1) # T
is.numeric(var2) # T
is.integer(var1) # F 100은 실수형 100L이 정수형
is.integer(var2) # T

#데이터타입에 우선순위가 존재!
#기본 데이터타입 4가지중 가장 우선순위가 높은 것은?
# 1. character 2. complex 3. numeric 4. logical

myVector = c(TRUE, 10, 30) #numeric  1 10 30
myVector = c(TRUE, 10, 30, "hello") # "TRUE"  "10"    "30"    "hello"
myVector

#하나의 데이터 타입을 다른 데이터 타입으로 바꿀 수 있음
# -> type casting
var1 <- 3.141592
var2 <- 0
var3 <- "3.145"
var4 = "hello"

#데이터 타입을 변환할 때에는 as.함수를 사용
as.character(var1)
as.character(var2)
as.character(x)
as.integer(x)
as.integer(var1)
as.numeric(var2)
as.logical(var1)#T
as.logical(var2)#F
as.logical(var3)#NA
as.logical(var4)#NA
