setwd("C:/R_lecture")
getwd()
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

#같은 데이터 타입을 저장하는 자료구조
#vector(1차원), matrix(2차원), array(3차원 이상)
#다른데이터 타입을 저장하는 자료구조
#List(1차원), data frame(2차원)
#범주형 자료구조 => factor

#############################################################################

#factor
#범주형 데이터를 저장하기 위한 자료구조
#범주형 데이터는 값의 항목별 빈도수를 쉽게 확인 가능
#예를 들어 방의 크기가 "대", "중", "소" = . level
#일반적으로 vector를 이용해서 factor를 만든다

#ex) 6명의 혈액형 데이터를  vector에 저장하고 factor로 변형해보자
var1 = c("A", "AB", "O", "A", "B", "B")
var1

factor_var1 = factor(var1)
factor_var1 #A AB O A B B levels A AB B O 출력
nlevels(factor_var1) # level의 개수 / 4 출력
levels(factor_var1) # level들만 / "A"  "AB" "B"  "O" 출력 

is.factor(factor_var1) # TRUE 출력

#factor의 사용시기?
#ex)남성과 여성의 성별데이터로 factor를 생성하고 빈도수를 구해보자
var1 = c("M", "F", "M", "M", "M", "F")
var1

factor_gender = factor(var1)
factor_gender

#데이터의 빈도수 확인시 table함수 사용
table(factor_gender)
plot(factor_gender)

##########################################################################
#List
#1차원 선형구조, 다른데이터 타입이 들어올 수 있음
#중첩 자료구조 이용
#지금까지 했던 여려 자료구조들을 생성해서 List안에 저장해 보자

var_scalar = 100
var_vector = c(10,20,30)
var_matrix = matrix(rep(1:12,1), ncol = 3, byrow = T); var_matrix

var_array = array(seq(1,12), dim = c(2,2,3)); var_array

var_df = data.frame(id=1:4, name=c("홍","김","최","이"), age=c(30,40,20,10))
var_df

myList = list(var_scalar,
              var_vector,
              var_matrix,
              var_array,
              var_df)
myList

myVector = seq(10,30,10)
myVector

#key와 value로 저장되는 자료구조이고 데이터를 출력할 때 key값도 같이 출력
myList[[3]]

#key값을 지정한 List작성
myList = list(name=c("홍길동", "김길동"),
              age=c(20,30),
              adress=c("서울","부산"))
myList[1] 
myList["name"] #"홍길동" "김길동" 출력
myList["adress"] #"서울" "부산" 출력
myList$name #"홍길동" "김길동" 출력 key값을 이용한 출력
myList$name[2] #"김길동" 출력 key값을 이용한 출력
myList[[2]] #20 30 출력 key값이 정해져도 인덱스번호로 access하는것 가능













