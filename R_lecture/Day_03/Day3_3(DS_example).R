setwd("C:/R_lecture")
getwd()
# 1. 4,6,5,7,10,9,4 데이터를 이용해서 숫자형 vector x를 생성
x = c(4,6,5,7,10,9,4); x

# 2. e두 벡터의 연산 결과?
x1 = c(3,5,6,8)
x2 = c(3,3,4)
x1+x2 # 6 8 10 11출력 => recycle rule 

# 3. df을 이용해 다음의 결과를 도출하세요
Age = c(22,25,18,20); Age
Name = c("James", "matthew", "Olivia", "Stella")
Gender = c("M", "M","F","F")

##출력 형태?
##    Age     Name      Gender
##1   22      James     M
##2   25      Matthew   M

df = data.frame(Age = c(22,25,18,20),
                Name = c("James", "matthew", "Olivia", "Stella"),
                Gender = c("M", "M","F","F"))
df = data.frame(Age, Name, Gender)
df
subset(df,Gender=="M")
subset(df,Gender!="F")
subset(df,Age > 20)
df[c(1,2),]

# 4 아래의 구문을 실행한 결과?
x = c(1,2,3,4,5)
(x*x)[!is.na(x) & x > 2]
#(T T T T T) & (F F T T T)
#(1 4 9 16 25) na가 아닌 것 중 x가 2보다 큰값 추출 => 9 16 25
#(1 4 9 16 25)[(F F T T T)] => Fancy indexing
(x*x)[c()]

myLogi = vector(mode = "logical", 10); myLogi
# 5. 다음의 계산 결과는?
x = seq(2,8,2) #2 4 6 8
y = c(T,T,F,T)
sum(x[y])


# 6. 제공된 vextor에서 NA의 개수를 구하라
var1 = c(33,55,89,45,NA,22,12,NA,99,NA,100)
sum(is.na(var1))

# 6-1.결측치를 제외한 평균?
mean(var1[!is.na(var1)])

# 7. 두개의 벡터를 결합하려면?
x1 = c(1,2,3)
x2 = c(4,5,6)

# 7-1 벡터를 결합해서 matrix를 만드려면?
c(x1,x2)
rbind(x1,x2)
cbind(x1,x2)

# 8. 다음 코드의 실행결과는?
x = c("Blue", 10, TRUE,20)
is.character(x) #벡터는 동일한 데이터 타입 다른데이터타입이라면
                #상위의 데이터 타입으로 변환 TRUE출력