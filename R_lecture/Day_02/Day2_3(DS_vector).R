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

#######################################################################
#1. vector
#vector는 scalar의 확장, scalar는 하나의 공간을 차지하는 데이터 값
#1차원 선형구조, 같은 data type으로 구성된
#vector는 첨자형태로 access가 가능([])
#첨자(index)의 시작은 1

#vector의 생성 방법
#1. combine 함수를 사용해서 생성! (c())
#일반적으로 규칙성이 없는 데이터를 이용해서 vector를 생성할 때 이용
#vector를 이용해서 다른 vector를 만들수 있다.
var1 = c(1,2,33,41,15); var1
mode(var1)
var2 = c(T,F,F); var2
var3 = c("홍길동", "김길동","최길동"); var3
var4 = c(22,T,"dkdkdk"); var4
var5 = c(var1,var2); var5 # 1 2 33 41 15 1 0 0 출력
#새로은 vector가 만들어짐, 다른 data type이라면 우선순위의 data type

#2." : "을 이용해서 vector를 생성할 수 있다.
#numeric에서만 사용가능하고 1씩 증가하거나 감소하는 숫자의 집합을 
#vector로 만들 때 사용
#start:end 형태로 사용되고 둘 다 inclusive하다.
var1 = 1:5; var1 #1 2 3 4 5 출력
var2 = 5:1; var2 #5 4 3 2 1 출력
var3 = 3.4:10; var3 #반드시 정수에 해당하는 것은 아님

#3. seq()를 이용해서 vector를 생성할 수 있다.
#" : " 의 일반형으로 등차수열을 생성해서 vector화 시킬 때 사용
var1 = seq(from = 1, to = 10, by = 3) 
var1

#4. rep()를 이용해서 vector를 생성할 수 있다. replicate의 약자
#지정된 숫자만큼 반복해서 vector를 생성
var1 = rep(1:3, times = 3)
var1 = rep(1:3, 3)
var1 #1 2 3 1 2 3 1 2 3 출력
var2 =rep(1:3, each = 3)
var2 #1 1 1 2 2 2 3 3 3 출력

#vector의 데이터 타입을 확인해 보자
mode(var1) #numeric

#vector안 데이터의 개수(size)를 알아내려면? length()함수 사용
var1 = c(1:10); var1
length(var1) #10출력

#length의 다른 사용 => n-1 구간 분할
var1 = seq(1,100, by=3); var1 #1 4 7 10 .... 94 97 100 출력
var1 = seq(1,100, length=3); var1 #1부터 100까지를 3(2구간)으로 나눔
var1 = seq(1,100, length=7); var1 #1부터 100까지를 7(6구간)으로 나눔

#vecor에서 데이터 추출
#vector의 사용은 []를 이용해서 데이터 추출
var1 = c(67,90,87,50,100)
var1
var1[1]   #67출력
var1[length(var1)] #마지막 값 추출
var1[2:4] #90 87 50출력 

#vector생성을 위한 : , c(),seq(), req()를 vector요소를 access하기위한 용도로 사용가능
var1[c(1,5)] #67 100 출력
var1[seq(1,4)] #67 90 87 50 출력
var1[6] #NA 출력
var1[-1] # [1]번째 항을 제외한 90 87 50 100 출력
var1[-c(1,3)] #90 50 100 출력
var1[-c(1:3)] #50 100 출력

#vector 데이터의 이름
var1 = c(67,90,50)
names(var1) #vector에 이름이 붙어있는지 확인하는 함수
names(var1) = c("국어","영어","수학") #2차원이 아님 단순 이름붙임
var1

var1[2] #90 영어 출력        
var1["영어"] #같은 값 출력


#vector의 연산
#수치형 vector는 scalar와 함께 사칙연산을 할 수 있다
#vector와 vector간의 연산도 수행할 수 있다.
var1 = (1:3)
var2 = (4:6)
var1; var2
var1 * 2 #2 4 6 출력
var1+var2 #5 7 9
var1*var2 #4 10 18

var3 = 5:10 #5 6 7 8 9 10
var1 + var3 #6 8 10 9 11 13 => recycling rule
var1 * var3 #5 12 21 8 18 30

var4 = 5:9 #5 6 7 8 9 
var1 + var4 #결과값이 나오기는 하나 warning 메세지가 출력

#vector간의 집합연산
#union() : 합집합
#intersect : 교지합
#setdiff : 차집합

var1 = 1:5 #1 2 3 4 5
var2 = 3:7 #3 4 5 6 7 
union(var1,var2) #1 2 3 4 5 6 7
intersect(var1,var2) #3 4 5
setdiff(var1,var2) # 1 2

#vector간의 비교
#1. identical : 두 vector의 요소(개수, 순서, 내용)이 완전히 같아야 TRUE
var1 = 1:3
var2 = 1:3
var3 = c(1,3,2)
identical(var1,var2) # TRUE 출력
identical(var1,var3) # FALSE 출력

#2. setequal : 비교하는 두 vector의 크기, 순서와 상관없이 내용만 비교

var4 = c(1,2,3,2,3)
var5 = c(1,2,3,4,5)
setequal(var1,var2) #TRUE 출력
setequal(var1,var3) #TRUE 출력
setequal(var1,var4) #TRUE 출력
setequal(var1,var5) #FALSE 출력

#공백 vector생성방법
var1 = vector(mode = "numeric", length = 10); var1
#0 0 0 0 0 0 0 0 0 0 출력
var2 = vector(mode = "character", length = 10); var2
var3 = vector(mode = "logical", length = 10); var3
#F F F F F F F F F F출력 logical의 초기값은 FALSE



