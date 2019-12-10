# KAKAO API(이미지 검색) + 찾은 image 파일로 저장
# network 연결을 통해 서버에 접속해서 결과를 받아올때 사용하는 package이용
setwd("C:/R_lecture")
getwd()
install.packages("httr")
library(httr)
install.packages("stringr")
library(stringr)

# open API의 주소를 알아야 호출하죠
url <- "https://dapi.kakao.com/v2/search/image" #검색창에 카카오디벨로퍼->검색->rest api->이미지
# example  
# curl -v -X GET "https://dapi.kakao.com/v2/search/image" \
#  --data-urlencode "query=설현" \
# -H "Authorization: KakaoAK kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
# "-H" header 안에 저걸 넣어야한다는걸 의미
keyword <- "query=아이유"

request_url <- str_c(url,
                     "?",
                     keyword)

request_url <- URLencode(request_url)
request_url # API 호출 주소를 만들었어요

# Open API를 사용할 때 거의 대부분 인증절차를 거쳐야 사용할 수 있어요
apikey <- "4f102b22e5fc99528ac44d9211f49861"

# web에서 클라이언트 서버쪽 프로그램을 호출할 때 호출방식이라는게 있어요
# GET, POST, PUT, DELETE (크게 4가지)
# 일반적으로 GET, POST를 이용
# GET 방식 : 서버 프로그램을 호출할 때 전달 데이터를 URL뒤에 붙여서 전달 (지금까지 계속 이 방식을 이용했음)
# POST방식 : 서버 프로그램을 호출할 때 전달 데이터가 request header에 붙어서 전달 

result <- GET(url = request_url,
    add_headers(Authorization = paste("KakaoAK",
                                       apikey)))
# header 안에 인증키를 넣어야 되기 때문에 jasonlite를 안쓰고 httr 패키지를 사용한것

http_status(result)  # 접속상태 결과 success 떠야함

result_data <- content(result);result_data

View(result_data)

for(i in 1:length(result_data$documents)) {
  req = result_data$documents[[i]]$thumbnail_url;
  res = GET(req) # 이미지에 대한 응답
  imgData = content(res,"raw") # 문자열이 아니라 이번엔 이미지(binary file) 이기때문데 "raw"라고 해줘야함
  writeBin(imgData,
           paste("C:/R_lecture/아이유/img",#아이유 파일안에 img 사진 만들기
           i, # img1 ,img2, img3 .....
           ".png")) #확장자
}

###########################################################################
# 위에서 실습한 방법으로 데이터를 구축할 수 없는 상황이 있다
# 우리가 작업한 상황은 
# 1. 네이버 영화 댓글 사이트, 로튼 토마토
# 클라이언트가 reuest(요청)을 보냄 -> 서버프로그램이 요청을 받음 -> 서버프로그램이 결과HTML page를 생성해서 클라이언트 에게 response로 전달 -> 클라이언트는 Selector와 xpath를 이용해서 전달된 HTML에 있는 필요한 데이터를 추출

# 2. KAKAO 이미지 검색 API(Open API를 이용해서 데이터 구축하는방식), 영화진흥위원회 Open Api
# 클라이언트(R)가 request를 보내고 서버 프로그램이 요청을 받아요 -> 서버프로그램이 결과 JSON문자열을 생성해서 클라이언트에게 response로 전달 -> 이 결과 데이터를 data frame으로 받아요 -> data frame을 이용해서 결과를 추출

# => 이 두가지 방식으로 해결할 수 없는 상황이 발생 (ex 도서검색)
# Open API를 사용하지 않는(공개되지 않은 API를 사용)
# AJAX방식의 Web는 위의 방법으로 데이터를 가져올 수 없어요

# Selenium을 이용한 동적 데이터 Crawling

# Selenium sever program 다운로드
# chorme 설정가서 업데이트 하고
# chrome driver 다운받고
# 내 pc 속성 환경변수 path 추가
# Selenium이 Chrome browser를 자동으로 제어하게되요
# chrome을 자동으로 제어하려면 chrome driver가 필요
# 이 chrome driver 프로그램을 selenium이 사용할 수 있도록 PATH환경변수에 경로를 설정

# Selenium Server기동 순서
# java-jar파일명-port4445
#cmd창 입력
#cd C:\Users\student\Desktop\selenium
#java -jar selenium-server-standalone-3.141.59.jar -port 4445

#제공된 도서검색 프로그램을 이용
#MySQL DBMS 시작


#Selenium을 이용한 동적 pag scraping
#Selenium을 R에서 사용할 수 있도록 도와즈는 package를 설치
#손으로 하나하나 해야할 것을 코드를 작성해서 자동화시키는 과정
install.packages('RSelenium')
library(RSelenium)

#R 프로그램에서 Selenim Server에 접속한 후 remote driver객체를 return 받음

remDr <- remoteDriver(remoteServerAddr = "localhost",
             port = 4445, #Selenium 프로그램 포트넘버
             browserName="chrome");remDr
remDr$open()

#접속이 성공하면 remote driver를 이용해서 chrome browser를 R코드로 제어가능

#open된 browse의 주소를 변경해요
remDr$navigate("http://localhost:8080/bookSearch/index.html")
#Selenium을 이용햇 R프로그램을 컨트롤중!

#html코드중에 원하는 element를 찾는다 인풋박스 찾자
inputBox <- remDr$findElement(using = "css","[type=text]")
#css 쓸래? xpath쓸래?

#찾은 입력상자에 검색어를 넣자. 입력박스에 키워드를 입력하자
inputBox$sendKeysToElement(list("여행")) #대소문자 구별

#AJAX호출을 하기위해 버튼을 먼저 찾아야함. 클릭을 위해 버튼의 위치를 찾자
btn <- remDr$findElement(using = "css","[type=button]")

#찾은 버튼에 click event를 발생 버튼클릭함수
btn$clickElement()

#AJAX 호출이 발생해서 출력된 화면에서 필요한 내요을 추출. li를 찾자
li_element <- remDr$findElements(using = "css", "li")

#이렇게 얻어온 element가가에 대해서 함수를 호출
myList <- sapply(li_element,function(x){
  x$getElementText() #li 사이에 있는 text들 가져오라는 함수
});myList #얻어온 el들 각각에 함수를 적용

for(i in 1:length(myList)){
  print(myList[[i]])
}
##########################################################################
# 공공데이터포탈(www.data.go.kr)

#지금까지 데이터를 구축하는 방법을 배웠다.









