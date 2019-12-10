#3주차
#데이터 조작, 데이터 정제방식(NA값?)
#시각화 ggplot2 
setwd("C:/R_lecture")
getwd()
.libPaths("C:/R_lecture/Lib")
# mpg data set을 이용해서 데이터 조작, 정제에 대한 내용을 학습해 보아요
#특정패키지 설치 필요 mpg data set을 이용하기 위해서!
install.packages("ggplot2")
library(ggplot2)
head(mpg)
tail(mpg)
str(mpg) #자료구조를 조사해 보자
class(mpg) #자료구조를 조사해 보자
#tbl_df() : 프린팅을 했을 때 직관적인 인식을 위해 사용
## mpg는 table data frame형태
##console 크기에 맞춰서 DF를 출력해줌

df <- as.data.frame(mpg) 
head(df,3)
class(df)
#사용할 DF을 준비완료
ls(df) # datafram의 col명을 알아보는 함수 오름차순 출력
names(df) # datafram의 col명을 알아보는 함수 DF의 순서대로
# mpg에 대한 document를 확인 해서 col의 의미를 먼저 파악하자
# help(mpg)
View(df)
dim(df) #DF의 행과 열의 개수를 알려줌
nrow(df) ; ncol(df)
length(df) # DF의 length를 구하면 col의 개수를 알려줌
           # mat의 length를 구하면 요소의 개수를 알려줌
str(df) # 자료의 개수, 행과 열의 개수, col명, 데이터 타입
        # 종합적 정보제공
summary(df) # 가장 기본적인 통계데이터를 활용함.
rev() #vector에 대해서 데이터를 역순으로 변환
##여기까지가 데이터 확인하는 절차
####################################################################################
##여기부터 데이터 조작!(dplyr)
library(dplyr)
#속도에 강점 : 컴파일러 방식 C++로 구현되어 빠른 속도
#chaining 가능 %>%
#여러개의 함수를 이용해서 우리가 원하는 데이터를 추출가능

# 1. tbl_df() 출력을 위한용도
head(df)
df <- tbl_df(df)  #table data frame
df <- as.data.frame(mpg) #data frame

# 2. rename() :col의 이름을 변경할 수 있다.
# raw data를 이용 할 경우 col명이 없을 때,
# col명을 새로 명시해서 사용해야함.
# 컬럼명에 대소문자가 같이 있는 경우
# 모두 소문자, 대문자로 변경해서 사용하면 편하다.=> 오류방지
# df의 col명을 모두 소문자(대문자)로 변경하자
names(df) = toupper(names(df));df
#rename()은 DF를 리턴, 새로운 DF를 원한다면 새로운 변수에 저장
rename(df,
       model = MODEL) # (df, 바꿀명 = 기존명)

# 3. filter() : 조건을 만족하는 행을 추출하는 함수
# filter(data frame,
#        조건 1, 조건2, 조건3, ... )
### mpg data set에서 2008년도에 생산된 차량의 대수?
tail(df)
df1 <- filter(df,
              year == 2008)
nrow(df1)
###모든 차량에 대해 평균 도시연비보다 도시연비가 높은 차량의 model명
head(df)
#data set중에 na값이 들어있으면 연산불가.
df2 <- filter(df,
              mean(cty) < cty)
modelNm = table(df2$model)
length(table(df2$model))
names(modelNm)

#data set중에 na값이 들어있으면 연산불가.
#na값을 제외하고 계산해라
avg_cty <- mean(df$cty, na.rm = T); avg_cty
unique(filter(df,
              cty > avg_cty)$model)
#unique함수 사용 동일한것들 중 하나씩만 출력

###고속도로 연비가 상위 75% 이상인 차량을 제조하는 제조사 개수?
head(df)
class(df)
summary(df$hwy)[5]
length(unique(filter(df,
                     27 <= hwy)$manufacturer))
length(unique(filter(df,
                     hwy >= summary(df$hwy)[5])$manufacturer))

### 오토 차량 중 배기량이 2500cc 이상인 차량의 대수?
nrow(filter(df,
            grepl("auto",trans), # 
            displ >= 2.5))
#원하는 문자열을 찾을 때? stringR 사용해봐
library(stringr)
nrow(filter(df,
            str_detect(df$trans,"auto"),
            displ >= 2.5))
str_detect(df$trans,"auto")#T,F 형태로 

# 4. arrange() : 정렬하는 함수
# arrange(data frame,
#         col1,
#         desc(col2))
avg_cty <- mean(df$cty, na.rm = T); avg_cty
arrange_(unique(filter(df,
                  cty > avg_cty)$model))

arrange(df_model)


#모든차량 대해 평균도시연비보다 도시연비가 높은 차량의
#모델명을 오름차순으로 정렬
head(df)
avg_cty <- mean(df$cty, na.rm = T); avg_cty
unique(filter(df,cty > avg_cty)$model)

df2 <- filter(df,
              mean(cty) < cty)
modelNm = table(df2$model)
length(table(df2$model))
names(modelNm)

df %>% filter(cty > mean(cty)) %>%
  select(model) %>%
  unique() %>%
  arrange(model)

# 5. select() : DF에서 원하는 col만 추출하는 함수

# 6. mutate() : 새로운 col을 생성하기 위한 함수
# 도시연비와 고속도로 연비를 합쳐서 평균연비 col을 만들어보자
head(df)
df$mean_rate = (df$cty+df$hwy)/2 #R의 일반적인 방식
data.frame(df,)
###############################

df <- as.data.frame(mpg)
new_df = df %>% mutate(mean_rate = (cty+hwy)/2); new_df

# 7. summarise : 통계량을 구해서 새로운 컬럼으로 생성하는 함수
###모델명이 a4이고 배기량이 2000cc이상인 차들의 평균연비?
head(new_df)
new_df %>% filter(displ >= 2.0,
                  model =="a4") %>% summarise(mean(mean_rate))
#일반적인 함수사용
result <- df %>%
           mutate(mean_rate = (cty+hwy)/2) %>%
           filter(displ >= 2.0,
                  model =="a4") %>%
           select(mean_rate)
mean(result$mean_rate)
#summarise 함수 사용시
df %>%
  filter(displ >= 2.0,
         model =="a4") %>%
  summarise(mean_rate = mean(c(cty,hwy)), hihihihi = max(cty))

 df %>%
  mutate(mean_rate = (cty+hwy)/2) %>%
  filter(displ >= 2.0,
         model =="a4") %>%
  summarise(mean(mean_rate))
 
# 8. group_by() : 범주형 변수에 대한 Grouping
 df %>%
   filter(displ >= 2.0)%>%
   group_by(manufacturer)%>%
   summarise(mean_rate = mean(c(cty,hwy)))
   # 제조사별 평균 연비 

#9. left_join, right_join, inner_join, full_join 
 
 
