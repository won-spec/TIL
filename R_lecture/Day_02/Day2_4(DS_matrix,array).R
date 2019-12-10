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

#########################################################################
#matrix : 동일한 data type을 가지는 2차원 형태의 자료구조
#matrix의 생성
var1 = matrix(c(1:5)) #matrix의 생성 기준은 열!! 열은 고정 행이 늘어남
                      #5행 1열짜리 matrix생성
var1

var1 = matrix(c(1:10), nrow = 2, byrow = T) #1 2 3 4 5
var1 = matrix(c(1:10), ncol = 5, byrow = T) #6 7 8 9 10

var1
var1[1,] #1 2 3 4 5
var1[,2] #2 7

#vector를 연결해서 matrix를 만들 수 있다 rbind, cbind
#vextor를 가로, 세로방향으로 붙여서 2차원 형태로 생성
var1 = c(1,2,3,4)
var2 = c(5,6,7,8)

mat1 = rbind(var1,var2); mat1
mat2 = cbind(var1,var2); mat2

var1 = matrix(seq(1,100,3), nrow = 3, ncol = 7)
var1 = matrix(c(1:21), nrow = 3, ncol = 7)
var1 = matrix(1:21, nrow = 3, ncol = 7)
var1 = matrix(rep(1:7,3), nrow = 3, ncol = 7)
var1 = matrix(rep(1:6,each=2), nrow = 3, byrow = T)
var1

#11 12 14 15추출?
var1[c(2,3),c(4:5)]
var1[c(1:2),c(1,2)]

#원소의 개수는?
length(var1)
#행의 개수?   열의 개수?
nrow(var1);   ncol(var1)

#matrix에 적용할 수 있는 함수
#apply()를 이용해서 matrix의 특정 함수를 적용
#apply()함수는 속성이 3가지 들어감
#1. X => 적용할 matrix 대소문자 구별
#2. MARGIN => 1이면 행 기준, 2이면 열기준
#3. FUN => 적용할 함수명
var1 = matrix(c(1:21), nrow = 3, ncol = 7)
apply(X=var1, MARGIN = 1, FUN = max)
apply(X=var1, MARGIN = 2, FUN = max)
apply(X=var1, MARGIN = 1, FUN = min)
apply(X=var1, MARGIN = 1, FUN = mean)

var1

#matrix의 연산
#matrix의 요소단위 곱연산
#전치행렬을 구하기
#행렬곱 (matrix product)
#역행렬 => 가우스 소거법이용

var1 = matrix(c(1:6), ncol = 3); var1
var2 = matrix(c(1,-1,2,-2,1,-1), ncol = 3); var2
var3 = matrix(c(1,-1,2,-2,1,-1), ncol = 2); var3

#elementwise product 요소단위 곱
var1*var2
#matrix product 행렬곱 %*%
var1 %*% var3

#전치행렬 transpose t()함수 사용 2*3 => 3*2
var1
t(var1)

#역행렬 : matrix A가 nxn일 때 다음의 조건을 만족하는 행렬 B가 존재하면
#         B를 A의 역행렬이라 한다.
#         AB = BA = E  solve()함수 사용
var4 = matrix(c(1,5,6,9), nrow = 2)
var4
solve(var4)

#######################################################################
#Array : 3차원 이상. 같은 데이터타입으로 구성, 차원이 정해져 있지 않기 때문에 차원을 정해주어야함
var1 = array(c(1:24), dim = c(3,2,4)) #3차원 3행 2열 4개의 판
var1 = array(c(1:24), dim = c(2,2,2,4)) #4차원
var1







