#Operator(연산자)

var1 <- 100
var2 <- 100
var2 <- 3

var1 / var2 #일반 언어의 값은 33출력
            #R은 실생활 연산처럼 수행
#몫을 구해보자 => 33
var1 %/% var2 #몫만 구하는 것 %/%

#나머지를 구해보자 %%
var1 %% var2

#비교연산자
var1 == var2 #FALSE (F)
var1 != var2 #TRUE (T)
var1 >= var2
var1 <= var2

#논리연산자
#& , && : 양쪽 값이 TRUE이면 TRUE
TRUE & FALSE
TRUE & TRUE
TRUE && TRUE ##&와 &&의 차이? 둘다 논리연산자 AND 연산
#|, || : 하나라도 TRUE이면 TRUE
TRUE | FALSE
TRUE || FALSE  #|와 ||의 차이? 둘다 논리연산자 OR 연산
#단일변수는 1개짜리 공간
#R은 여러가지 자료구조가 존재
#데이터를 저장하는 가장 대표적인 자료구조? -> vector
#1.vector 1차원 자료구조, 여러개의 연속적인 저장공간
#저장공간안에 같은 데이터 타입이 들어감!

#vector형성? 어떻게?
#함수를 이용해서 vector형성
# c() => combine의 약자
c(10,20,30)
x = c(10,20,30)
print(x)

c(TRUE,20,3.14) #데이터값에는 우선순위가 있음. 다른 형태의
                #데이터형태를 입력하면 운선순위의 타입으로 출력
                #1.00 20.00 3.14 출력

c(TRUE,FALSE) & c(TRUE,TRUE) #각 벡터마다 연산 후 벡터의 형태로 출력
c(TRUE,FALSE) && c(TRUE,TRUE)#첫번째 요소만 &연산 수행
c(TRUE,FALSE) | c(TRUE,TRUE)
c(TRUE,FALSE) || c(TRUE,TRUE)

c(TRUE,T,FALSE) & c(TRUE,F) #연산 불가 vector의 칸이 맞지않기때문
c(TRUE,T,FALSE) && c(F,T) #연산 가능

!c(T,T,F,F) #연산을 반대로 FFTT출력

########################################################
#다른언어와 마찬가지로 다양한 수학함수내장

abs(-6) #절댓값
round(3.1254) #반올림
sqrt(100) #제곱근








