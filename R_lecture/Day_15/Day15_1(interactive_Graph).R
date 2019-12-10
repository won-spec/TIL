#구글 지도 서비스를 이용해 보자

#Google map platform을 사용하기 위해서는 
#특정 package가 필요

#이 package가 CRAN에 등록이 아직 안되어 있다.
#github에 공유되어 있다.

#VCS(Version Control System)

#원본 : A
#홍길동 : A1
#최길동 : A2

##이런 공동작업에 대한 문제를 해결하기 위해서 나온게 VCS
##CVCS( Centralized VCS )
##소스원본을 중앙서버가 1개 들고있고 나머지 사람이 복사본을 
##가져다가 작업, 서버문제에 따라서 작업에 차질

##DVCS( Distributed VCS )
##소스원본을 여러군데에서 보관
##Git을 이용하면 공동처리가 쉬워져요
##Git repository (저장소): 웹상에 존재하는 공용창고
##이런 Git repository를 서비스해주는 회사가 존재
##Github

##############################################################################
#1. Github에 공유되어 있는 구글맵 package를 설치하자.

#문제가 있다. 버젼특성을 탄다
#package들은 dependency에 신경을 써야함.
sessionInfo() #현재 R버젼확인용
#현재 R버젼은 3.6.1 / 그런데 사용하려는 패키지가
#3.5.1버젼에서 실행됨 => 버젼을 내리자
#cran들어가서 다운로드 시작이름 3.5.1로 변경해주자 그리고
#파일을 3.5.1구동할수 있게 그대로 진행

#이제 버젼을 맞췄으니 필요한 package를 Github에서
#다운받자

# install_github()를 사용할 수 있게하는 패키지를 다운받자
install.packages("devtools") 
library(devtools)
install.packages() #CRAN에서 받아서 설치
#github에서 구글맵을 받아오자
install_github("dkahle/ggmap")
library(ggmap)
#https://cloud.google.com/maps-platform/terms/. 사이트 접속
#get strated 클릭 
#내 구글맵 API 키 :AIzaSyDrTy9sIMPOvXZLffYeW5JlMHuv--XYD_I
#생성한 구글 API key
googleAPIkey = "AIzaSyDrTy9sIMPOvXZLffYeW5JlMHuv--XYD_I"
#구글 API key를 이용해서 인증을 받자
register_google(key = googleAPIkey)

#API들어가서 Geocoding API, Geolocation API 사용설정하자
#구글맵에서 서울의 위치를 땡겨오자
gg_seoul <- get_googlemap("seoul",
                          maptype = "roadmap")
ggmap(gg_seoul)

library(dplyr)
library(ggplot2)
#위도 경도의 정보를 들고오자
geo_code = geocode(enc2utf8("공덕역")) #한글이면 유니코드로 변환
geo_code
geo_data = as.numeric(geo_code)#숫자로 변환
geo_data
#구글맵을 그리려면 위도, 경도가 숫자형태의
#vector로 되어있어야함.
#구글지도를 띄우고 그위에 ggplot2로 그림을 그릴수 있음
get_googlemap(center = geo_data,
              maptype = "roadmap",
              zoom = 10) %>%
  ggmap() +
  geom_point(data = geo_code,
             aes(x=lon,
                 y=lat),
             size=1,
             color = "red")

#####################################################################

addr <- c("공덕역","역삼역")
gc <- geocode(enc2utf8(addr)) # gc보통 좌표 변수
gc

df <- data.frame(lon=gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat));cen

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 13,
                     markers = gc)
ggmap(map)
ggplotly(map)

#지하철역 주변 아파트 정보 : 서울 열린 데이터광장
#아파트 실거래 금액 데이터 : 국토부실거래가 공개시스템

#######################################################################
# EDA
#MoviesLens(영화제목,정형데이터)
#로튼토마토 크롤링(반정형)
#kakao API(반정형)
#네이버 댓글 크롤링 후 워드 클라우드(비정형데이터)
#페널데이터 실습(정형데이터)

# Interactive Gragh

# package 설치
install.packages("plotly")
library(plotly)

#mpg data set을 이용해서 배기량과 고속도로 연비에 대한
#산점도를 그려보자
library(ggplot2)
df <- mpg
head(df)

ggplot(df,
       aes(displ,
           hwy)) +
  geom_point(size=3,
             color = "blue") -> g

ggplotly #확대가능 더블클릭시 원상복귀
# HTML파일로 export가능

#interactive map
addr <- c("공덕역","역삼역")
gc <- geocode(enc2utf8(addr)) # gc보통 좌표 변수
gc

df <- data.frame(lon=gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat));cen#지도 중심 계산

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 13,
                     markers = gc)
result <- ggmap(map)
ggplotly(result) #interactve 맵이 되게 만들어줌

############################ 확대, 값 확인

###시계열 그래프
###시간에 따른 선그래프는 단순 확대만으로는 사용이 힘듬
###특정고간에 대한 자세한 사항을 보기 위해서
###다른 package를 이용

install.packages("dygraphs")
library(dygraphs)

#예제로 사용할 데이터는 economics
#시계열 그래프는 데이터를  xts라는 형식으로
#변환시켜줘야함!

#시간에 따른 개인 저축률 변환 추이를 선그래프로 그리자
ggplot(economics,
       aes(date,
           psavert)) +
  geom_line()
#df안에 들어있는 데이터형태를 xts형식으로 변환시켜
library(xts)
save_rate = xts(economics$psavert,
                order.by=economics$date) #앞에 날짜를 index로 지정
head(save_rate)#컬럼 한개짜리 데이터

unemploy_rate = xts(economics$unemploy/1000, #단위차이 맞춰주기위해
                order.by=economics$date)

unemploy_save = cbind(save_rate,unemploy_rate)

dygraph(unemploy_save) %>%
  dyRangeSelector()

#####################################################################