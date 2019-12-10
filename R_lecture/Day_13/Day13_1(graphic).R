# R그래프
# 숫자나 문자로 표현하는 것보다는 그래프로 
# 표현하면 변수의 관계 데이터 경향을 좀더 쉽게
# 파악할 수 있다.

# reshape2, dplyr
# ggplot2 패키지 R에서 가장 많이 사용
library(ggplot2)

#mpg data set을 사용하자
#################산점도(scatter) - 변수간의 관계를 파악##########################
# 데이터의 경향을 보는데 효과적
# ggplot2는 3단계로 그래프를 그린다.
###################################
# 1. 축을 정한다. =>배경을 설정함 #
# 2. 그래프를 추가한다.           #
# 3. 축 범위, 배경설정            #
###################################
df <- as.data.frame(mpg);head(df)
# 1. 배경설정
# data설정 : 그래프를 그리는데 필요한 데이터
# aes(x= ,y= )

# 배기량에 따른 고속도로 연비
ggplot(data = df,
       aes(x=displ,
           y=hwy))
# 우리가 원하는 그래프를 그리자
# dplyr 에서 %>% 의 의미 : + 넘겨받아서 그린다.
ggplot(data = df,
       aes(x=displ,
           y=hwy)) +
  geom_point()     #산점도 그리는 함수

#그래프를 그린후, 설정을 추가할 수 있다
ggplot(data = df,
       aes(x=displ,
           y=hwy)) +
  geom_point(size=3,color="red") + #산점도를 그리는 함수
  xlim(3,5) +  # x의 범위설정
  ylim(20,30)  # y의 범위설정

plot.new() #plot창 초기화 시켜주는 함수

#######################막대그래프 - 집단간의 비교를 할때 #########################
# 막대그래프를 그려보자
#구동방식(drv) : f(전륜), r(후륜), 4(전륜)
#각 집단에 대해 연비를 구해보자
#구동방식별 고속도로 연비 차이를 구해보자
library(dplyr)
head(df)
df %>%
  group_by(drv) %>%
  summarise(avg=mean(hwy)) -> result
class(result) # group_by와 summarise를 하면 보통 테이블데이터
as.data.frame(result) #로 변경됨. Df로 바꿔주자자

ggplot(result,
       aes(drv,
           avg)) +
  geom_col(width = 0.5, color="red")

#막대그래프에 대해 순서를 정렬하고 싶다면?
ggplot(result,
       aes(reorder(drv, -avg), # - 를 붙이면 역순의 의미
           avg)) +
  geom_col(width = 0.5, color="red")
plot.new()
#빈도 막대그래프
#사용하는 함수는 geom_bar()
#raw data frame 을 직접이용해서 처리
ggplot(data=df,
       aes(x=drv)) +
  geom_bar()

head(df)
#그래프 선 내에서 다른 변수들의 밀도를 알고싶을때
ggplot(data=df,
       aes(x=drv)) +
  geom_bar(aes(fill=factor(cyl))) #bar안에 factor 형태의 데이터를 넣어 
                                  #누적빈도수를 알 수 있다.

ggplot(data=df,
       aes(x=drv)) +
  geom_bar(aes(fill=factor(manufacturer)))

ggplot(data=df,
       aes(x=drv)) +
  geom_bar(aes(fill=factor(class)))

#히스토그램(연속적 구간당 분포를 확인)
#범주형 데이터에는 사용 불가능 / x축이 연속형데이터여야함.
#구간 설정 따로 안하면, 30개로 설정
ggplot(data=df,
       aes(x=cty)) +
  geom_histogram()

########################## 선그래프 - 시계열 데이터를 표현 ######################
# 일반적으로 환율, 주식, 경제동향
# mpg는 시간에 대한 데이터가 없음/ 다른데이터를 활용하자
# line chart를 위해서 economics data set을 활용하자
df <- economics
help("economics")

#월별 실업률
ggplot(df,
       aes(date,
           unemploy)) +
  geom_line()
#월별 개인저축률
ggplot(df,
       aes(date,
           psavert)) +
  geom_line()
# 그래프를 중복해서 그릴수도 있다.
ggplot(df,
       aes(date,
           unemploy)) +
  geom_point(color="red") +
  geom_line()

###################### 박스 그래프 - 데이터의 분포를 파악 ############################
# 산점도( 변수간의 관계, 데이터 경향 )
# 막대그래프( 일반, 빈도(누적), 히스토그램)
# 선그래프 ( 시계열 데이터 표현 )
# Box plot( 데이터의 분포를 파악)
df <- as.data.frame(mpg);head(df)
#구동방식별 hwy 상자그림을 그려보자
ggplot(df,
       aes(drv,
           hwy)) +
  geom_boxplot()

#####################################################################################

# 이렇게 ggplot2를 이용해서 4가지 종류의 그래프를 그릴 수 있다.
# 여기에 추가적인 객체를 포함시켜서
# 그래프를 좀 더 이해하기 쉬운형태로 만들어 보자

# mpg : 자동차 연비에 대한 data set
# economics : 월별 경제 지표에 대한 data set 

### 날짜별 개인저축률에 대한 선그래프를 그려보자
# 일반적인 직선을 그릴 수 있다.
# 추세에 적합한 직선을 그어보자, 회귀분석
ggplot(data = economics,
        aes(date,
            psavert)) +
  geom_line() +
  geom_abline(intercept = 12, #기울기와 절편을 입력해주면 직석을 그려줌
              slope = -0.0004) 

### x축과 수평인 선을 그릴수 있다. 데이터 값에대한 평균으로
# 가장저출률이 낮은 날짜를 수직선으로 표현하자
df <- economics
head(df)
df %>%
  filter(min(psavert) == psavert) %>%
  select(date) -> tmp
tmp <-as.data.frame(tmp)
result <- tmp$date

ggplot(data = economics,
       aes(date,
           psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert)) +
  geom_vline(xintercept = result) #hline : 수평선, vline : 수직

###만약 직접날짜를 입력해서 수직선을 표현하려면?
ggplot(data = economics,
       aes(date,
           psavert)) +
  geom_line() +
  geom_vline(xintercept = as.Date("2005-05-01"))
# 데이터 타입을 맞춰주어야 함!

### 그래프 안에 텍스트를 같이 표현해보자
#어떻게 해야 하나요?
ggplot(data = economics,
       aes(date,
           psavert))+
  geom_point(size = 1) +
  xlim(as.Date("1990-01-01"),   #해당영역 설정
       as.Date("1992-12-01")) +
  ylim(7,10) +
  geom_text(aes(label=psavert,  #text를 달자
                vjust=-0.2,
                hjust=-0.5)) #just : label의 위치설정
  
####
# 특정영역 하이라이트
ggplot(data = economics,
       aes(date,
           psavert))+
  geom_point() +
  annotate("rect", 
           xmin = as.Date("1991-01-01"),
           xmax = as.Date("2005-01-01"),
           ymin = 5,
           ymax = 10,
           alpha = 0.3, #투명도 1=불투명, 0=투명
           fill="red")

###여기에 추가적으로 "화살표"를 넣어보자
ggplot(data = economics,
       aes(date,
           psavert))+
  geom_point() +
  annotate("rect",
           xmin = as.Date("1991-01-01"),
           xmax = as.Date("2005-01-01"),
           ymin = 5,
           ymax = 10,
           alpha = 0.3, #투명도 1=불투명, 0=투명
           fill="red")+
  annotate("segment", #화살표 넣기
           x=as.Date("1985-01-01"),
           xend = as.Date("1995-01-01"),
           y=7.5,
           yend = 8.5,
           arrow=arrow(),color="blue",size=1) +
  annotate("text", #text넣기
           x=as.Date("1985-01-01"),
           y=15,
           label="소리없는 아우성",size=5) +
  labs(x="년도",  #x,y축 라벨달기, 타이틀 달기
       y="개인별 저축률",
       title="연도별 개인저축률 추이") +
  theme_light()   #테마 설정 
  



