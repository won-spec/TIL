
# 1. 
# R은 통계계산을 위한 프로그래밍 언어이자 데이터 분석 소프트웨어

# R로 할 수 있는 일
# 기초 통계분석, 머신러닝 모델링, 텍스트 마이닝
# 일반적인 프로그램 (웹 프로그램, APP등)

# 2. R의 장점
# - 무료(Open Source)
# - 생태계가 잘 구성되어져 있다.
#   (굉장히 많은 package가 존재하고 개발되고 있다.)
# - 프로그래밍 방식으로 데이터분석이 가능

# 3. R을 이용해서 빅데이터를 분석
# 빅데이터의 정의(3V)
# - Volume : 데이터의 사이즈가 굉장히 크다!
# - Velocity : 데이터의 발생속도
# - Variety : 데이터의 종류가 굉장히 다양

# 4. Rstudio를 설치해서 실습진행

# 5. R코드를 작성할 때 기본적으로 알아두어야 할 사항
# 문장의 끝은 ;을 이용하지만 생략가능
# R은 대소문자를 구별함!

# 6. Operator (연산자)
# 대부분의 연산자는 다른 프로그래밍 언어와 동일하게 사용됨
# 몫을 구하기 위한 연산자 : %/%
# 나머지를 구하기위한 연산자 : %%
# 논리연산 기호는 다른언어와 동일하나
# 논리값은 다르게 표현 => TRUE(T), FALSE(F)  
# 할당연산자 ->, <- , = (assignment)
# &, |, &&, || (논리연산 기호) 
# 한개짜리랑 두개짜리는 단일 scalar연산에서는 차이가 없다.
# ex) TRUE & TRUE , TRUE && TRUE
# But, vector연산에서는 차이점이 발생
# 한개짜리는 벡터라이즈연산
# 두개짜리는 벡터의 첫번째 값 하나만 &연산

# 7. Data Type & Data Structure
# R의 Data Type은 4가지 종류
# 수치형(NUmeric), 문자형(character), 논리형(logical), 복소수형(complex)
# 특수한 형태의 데이터 타입도 존재!
# NA : Not Available => 결측치
# NaN : Not Available Number => 숫자이긴 하나 수학적으로 불가능한 수치
# NULL : 값이 존재하지 않음을 나타내는 객체(값)
# Inf : 무한대를 지칭
# Data Type의 우선순위(최적화된 표현은 아님)
# 여러데이터 타입을 캐스팅(데이터 타입을 변경)할 때 상위 데이터 타입으로 변경
# logical => Numeric => complex => character

# 8. R에는 package가 존재
# R언어가 가지고 있는 기능 외에 외부 프로그램(package)을 이용하면
# 외부 코드 모듈을 이용하면 더 쉽게 더 많은 기능을 사용할 수 있다.
# package를 설치하고 사용하기 위해서는
# install.packages("패키지명")
# library(), require() : 설치한 패키지를 메모리에 로딩

# 9. R의 작업공간 (workspace)
# 어떻게 설정하고 사용할까?

# 10. Data Structure 
# 자료구조 : 변수에 저장된 데이터의 메모리 구조를 지칭하는 용어
# class() : 변수의 자료구조를 알아내기 위해 사용하는 함수

# 같은 데이터 타입을 사용하는 자료구조
### Vector ( 1차원 ) ###
# -선형자료구조, 같은 데이터 타입을 이용
#  첨자방식을 이용 => [] / 시작은 1부터
# -vector생성방식
#  c() : 개별요소를 이용해서 vector를 생성 var1 = c(10,20,30)
#  var1 = 1:10 수치형에만 적용가능, 1씩 증가(감소)하는 형태의 vector를 생성
# seq() : ":"의 일반형
# rep() : rep(1:3,times=3), rep(1:3,each=3)
# -vector를 생성한 후 vector의 길이를 알려면? => length()함수
# -vector나 data frame의 이름을 설정하거나 알아낼수 있다.
# names()
# -vector연산방식에 대해서 알아보자
var1 = 1:3
var2 = 5:10
var1 + var2 # vector의 size가 안 맞을땐, recycle 룰을 적용해서 size를 맞춘다.
# -집합연산을 지원
#  union(), intersect(), setdiff()

### Matrix ( 2차원 ) ###
# 2차원형태의 자료구조, 같은 데이터 타입을 이용
# 생성하는 방법, indexing하는 방식
var1 = matrix(c(1:10),nrow=2,byrow=T)
var1[,3]

### Array  ( 3차원 이상 ) ###
# 이런게 있다

# 다른 데이터 타입을 사용할 수 있는 자료구조
### List ( 1차원 ) ###
# 중첩자료구조를 만들 수 있다.
# key와 value의 쌍으로 이루어져 있다.
# dict와 같은 구조. 순서개념을 가지고 있다.
# [[]](key), [](value) 형채로 사용
# list에서 key를 표현할 때 "$"를 이용할수 있다!

### DataFrame ( 2차원 ) ###
# 2차원 형태의 자료구조, list와 vector를 혼합한 자료구조.
# 일반적으로 가장많이 사용됨.
# data frame의 col을 표현할 때 $기호를 이용
# data frame의 기본함수들
# str() : DF의 기본구조를 파악
# summary() : DF에 대한 기본 통계자료를 알수 있다.
# apply() : data frame에 대해 특정함수를 호출
# subset() : DF의 부분집합을 구할 때 사용

### 범주형 데이터 구조 => factor

# 11. 문자열 처리
# stringr package를 이용해서 처리
# 문자열 처리가 필요하면 참조해서 사용!
# 정규표현식에 대한 내요도 나왔다.

# 12. 데이터 입출력
# 파일로 부터 데이터를 읽어들인다.
# txt(csv), xlsx, Open API를 이용한 JSON
# Open API사용하기 위해서 여러가지 selector, AJAX처리에 대한 내용
# selenium을 이용한 crawling처리

# 13. Crawling & Scraping
# Web Crawling(Web Spidering) : 규칙에 따라 특정 웹페이지를 반복적으로
#                               browsing 하는 행위
# Web Scraping : 원하는 부분을 selector나 xpath를 이용해서 데이터를 얻어올 수 있다.

# 14. 데이터 조작
# DF를 생성한 후 사용하는 함수
# head(), tail()
# View() : 창을 띄워 데이터를 확인
# dim() : data frame의 행과 열을 구하는 함수
#         선형 자료구조에서는 사용할 수 없다.
# nrow(), ncol()
# str()
# summary()
# ls() : DF의 col을 vector로 출력

# 15. 시각화
# ggplot2 package를 이용해서 시각화를 많이해요
# 기본적인 그래프에 대해서 알아보자

# 데이터를 x축과 y축에 점으로 표현하는 방식
# 연속데이터를 이용해서 두 변수의 관계를 표현하기 적합한 형태의 그래프
# => 산점도 

# 일반적으로 집단간의 차이를 그래프로 표현하기에 적합한 형태
# =>막대그래프(barplot)

# 일반적으로 시계열 데이터를 표현하기에 적합한 형태는 
# => lineplot(선 그래프)

# boxplot => 데이터의 분포를 표현하기에 적합
# 형태, 이상치 파악가능

# ggplot2를 이용해서 실제 그래프를 이쁘게 그려보아요

# ggplot()을 이용해서 x 축과 y축을 설정
# aes()를 이용해서 축을 설정

# 축을 설정한 후 실제 그래프를 그리게 되는데
# 다른함수를 이용해서 처리 => "+"기호를 이용해서 마치 chaining처럼 사용

# 16. 기본통계함수
# 평균(mean), 최대(max), 최소(min)
# 분산(var), 표준편차(sd), 사분위, median

# 17. NLP( 자연어 처리 )
# KoNLP를 이용해서 한글 형태소 분석처리를 해보았어요!
# KoNLP : R에서 한글 형태소 분석을 할 수 있는 유일한 package
#         3가지 사전을 들고있다.
#         Java기능을 이용하기 때문에 JDK를 설치해야함.

# 18. 결측치와 이상치 처리
# is.na() : NA를 파악하기 위해서 사용하는 함수
# 이상치 중에 극단치 : 존재할 수 있는 값이기는 하지만, 
#                      정상범주에서 많이 벗어나있는 데이터
# boxplot을 이용하면 극단치를 쉽게 찾아낼 수 있다.

# 수행평가 3가지
# 1. 로튼토마토 크롤링
# 2. mpg data set EDA 연습문제
# 3. 한국복지패널데이터 연습문제




df <- read.spss(file = "C:/R_Lecture/kor_data_20090024.sav",
          encoding = "UTF-8")

table(df$sq2a1)





