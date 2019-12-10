getwd()
# R은 프로그래밍 언어/ 제어문도 가지고있다
#[1]if문
var1 = 100
var2 = 20
#조건에 따라서 실행되는 code block을 제어할 수 있음

if(var1>var2){
  cat("참")#조건문이 참일 때 실행
}else{ 
  cat("거짓")#조건문이 거짓일 때 실행
}

#[2]ifelse : 3항 연산자
ifelse(var1>var2,"참","거짓")

#[3]반복문 ( for, while )
#for : 반복횟수만큼 반복
#while : 조건이 TRUE일 동안 반복실행

for( var1 in seq(1:5)){
  print(var1)
}

idx = 1
mySum = 0

while (idx < 10) {
  mySum =mySum + idx
  idx = idx + 1
}

#로직(제어문을 이용해서) 1부터 100사이에 있는 3의 배수를 출력
for( var1 in seq(1,100)) {
  if( var1 %% 3 == 0 ) {
    print(var1)
 }
}
for(x in 1:100){
  if(x %% 3 == 0){
    print(x)
  }
}

#1부터 100까지 있는 소수를 출력하세요

for( a in 2:100 ){
  b = 2
  if( a %% b == 0 & a == b){
    print(a)
    b = b+1
  }else{
    b = b+1
  }
}

#사용자 정의 함수( User Define Function )
#제공된 함수말고 우리가 함수를 만들 수 있을까?
#함수명 = function(x){...}
#입력받은 숫자를 제곱해서 돌려주는 함수를 만들어보자
myFunc = function(x){
  x = x*x
  return(x)
}
var1 = myFunc(5)
var1

var1 = c(1:10)
sum(var1)
#sum 함수와 동일한 역할을 하는 mySum을 만들어 보자
#vector를 입력받아 합하는 mySum을 만들자
mySum = function(x){
  result = 0
  for (t in x) {
    result = result + t
  }
  return(result)
}
var1 = c(1:10)
mySum(var1)







