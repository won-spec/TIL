#데이터 분석업무에서 raw data를 얻은 다음.
#머신러닝 모델링을 위해 또는 시각화를 위해
#이 raw data를 적절한 형태로 변형
#데이터 변환, 필터링, 전처리 작업이 필요

#이런작업(데이터 조작)에 특화된 package들이 존재
#1. plyr => pliers + R => 구현한 언어가 R언어로 구현
#단점? R은 인터프리터 방싱이라 처리 속도가 느림
#2. dplyr => data frame + Pliers + r
#vector나 data frame에 적용할 수 있는 기본 함수

#실습할 데이터가 필요함!
#iris(아이리스) : 붓꽃의 종류와 크기에 대해측정한 데이터
View(iris)
names(iris)
# Species : 종
# Sepal.Length : 꽃받침의 길이
# Sepal.Width : 꽃받침의 너비
# Petal.Length : 꽃잎의 길이
# Petal.Width : 꽃잎의 너비

# 기본함수
# 1. head() : 데이터 set의 앞에서부터 6개의 데이터를 추출해요
#             데이터프레임이 아닌 경우에도 적용 e됨
head(iris)
var1 = c(1:100)
head(var1,101) #뒤에 해당 숫자를 입력하면 입력한 수만큼 띄워줌
# 2. tail() : head함수의 반대 뒷쪽의 숫자를 불러옴 순서는 변하지않음
tail(var1, 2) #99 100출력
# 3. View() : View창에 데이터를 출력하는 함수, 데이터확인용
#              구간별 확인 가능

# 4. dim() : data frame에 적용할 때 행과 열의 개수를 알려줌
dim(iris)
dim(var1) #1차원 선형자료구조(vec,list)에 적용시 => 사용 불가(NULL값)

# 5. nrow() : DF의 행의 개수를 알려줌 행=레코드=observation
# 6. ncol() : DF의 열의 개수를 알려줌 변수=col=열
# 7. str() : data frame의 일반적인 정보를 추출
str(iris)
# 8. summary() : dataframe의 요약 통계량을 보여줌
summary(iris)
#Min, Max, 사분위, 평균(Mean), 중간값(Median)

# 9. ls() : data frame의 col명을 vector로 뽑아줌
ls(iris) #정렬시 오름차순으로 sort되서 vec에 정렬
names(iris)

# 10. rev() : 선형자료구조의 index순서를 역으로 정렬
rev(var1)

# 11. length() : 길이를 구하는 함수
length(iris)# 5출력 / DF적용시 col의 개수를 알려줌
mat1 = matrix(1:12, nrow = 3)
length(mat1)# matrix에 적용시 요소의 개수를 알려줌

############################################################################
#plyr package => dplyr 개량형
.libPaths("C:/R_lecture/Lib")
install.packages("plyr")
library(plyr)

#1. key값을 이용해서 두개의 dataframe을 병함 (세로, 열 방향으로)
x = data.frame(id = 1:5,
               height = c(150,190,170,188,167))
y = data.frame(id = c(1,2,3,6),
               weight = c(50,100,80,78))
join(x,y, by = "id", type="left") # key값과 조인 type을 명시
join(x,y, by = "id", type="right") # key값과 조인 type을 명시
join(x,y, by = "id", type="full") # key값과 조인 type을 명시
join(x,y, by = "id", type="inner") # key값과 조인 type을 명시

# 두개이상의 key를 이용해서 조인해보자
x = data.frame(id = 1:5,
               gender=c("M","F","M","F","M"),
               height = c(150,190,170,188,167));x
y = data.frame(id = c(1,2,3,6),
               gender=c("F","F","M","F"),
               weight = c(50,100,80,78));y

join(x,y, by = c("id","gender"), type="inner") # key값과 조인 type을 명시
#key값이 중복되는 결과값 출력

# dplyr에서는 join() => left_join()

#2. 범주형 변수를 이용해서 그룹별 통계량 구하기
str(iris)
unique(iris$Species)
table(iris$Species)
# iris의 종별 꽃잎 길이의 평균을 구하세요
# tapply(대상 column, 범주형 column, 적용할 함수)
#tapply는 한번에 1개의 통계만 구할 수 있음
tapply(iris$Petal.Length,
       iris$Species,
       mean)
tapply(iris$Petal.Length,
       iris$Species,
       max)
tapply(iris$Petal.Length,
       iris$Species,
       min)
#종별 꽃잎 길이의 평균과 표준편차를 구하시오
#두개이상의 통계량을 한번에 구학 위해서?
#ddply() : 한번에 여러개의 통계치를 구할 수 있다.
#ddply(어떤?data set, 
#      어떤 범주?, 
#      col 이름 지정과 어떤함수?(어떤 요소?))
df <- ddply(iris,
      .(Species),
      summarise,
      avg=mean(Petal.Length),
      sd=sd(Petal.Length))
class(df)
View(iris)

#plyr에서는 join과 통계량을 구하는 tapply 와 ddply를 알아두자


















