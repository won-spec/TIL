#web Crawling : 인터넷 상에서 필요한 정보를 읽어와 수잡하는 작업
#web scrapong
#=> 하나의 web page에서 내가 원하는 부분을 추출하는 행위
#web crawling(web spidering) : 
#자동화 봇인 crawler가 정해진 규칙에 따라 복수개의 web page를 browsing 하는 행위

#scraping을 할 때  CSS(Jquery) selector를 이용해서 필요한 정보를 추출
#selector를 이용해서 추출하기 힘든 것들도 있다.
#추가적으로 xpath(xml기반)도 이용해보자

#특정사이트를 활용해서 데이터를 추출해보자
#서버에 접속해서 HTML을 받아온뒤 거기에서 데이터를 추출하자
#1. 서버로부터 받은 HTML 태그로 구성된 문자열을 자료구조화 시키는
#   패키지를 이용해야함!.
install.packages("rvest") #html을 관리를 위해
library(rvest)
library(stringr)
#2. url을 준비
url <- "https://movie.naver.com/movie/point/af/list.nhn"
#page <- "page="
request_url = str_c(url, "?", "page=",1)
request_url = str_c(url, "?", "page=",scan())
request_url

#3. 준비된 URL로 서버에 접속해서 HTML을 읽어온 후 자료구조화 시킨다.
html_page = read_html(request_url); html_page

#원하는 html의 요소 찾기위해 사용하는 함수
html_nodes()
          
#4. Selector를 이용해서 추출하기 원하는 요소(element)를 선택
nodes=html_nodes(html_page,"td.title>a.movie");nodes

#5. tag사이에 들어있는 text를 추출
title <- html_text(nodes);title

#6. selector를 이용해서 리뷰요소(element)를 선택해요요
nodes=html_nodes(html_page,"td.title");nodes

review <- html_text(nodes, trim = T);review

#7.필요없는 문자들을 제거
review = str_remove_all(txt,"\t")
review = str_remove_all(txt,"\n")
review = str_remove_all(txt,"신고")
review

#8.영화제목과 리뷰에 대한 내용을 추출
df = cbind(title,review)
View(df)

#9. 이렇게 구축한 데이터를 파일에 저장하자

#######################################################################











