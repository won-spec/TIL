#이번에는 같은 작업을 xpath로 해보자
install.packages("rvest") #html을 관리를 위해
getwd()
library(rvest)
library(stringr)
#2. url을 준비
url <- "https://movie.naver.com/movie/point/af/list.nhn"
#page <- "page="
request_url = str_c(url, "?", "page=",1);request_url

html_page = read_html(request_url); html_page

nodes_title=html_nodes(html_page,"td.title>a.movie");nodes_title

title <- html_text(nodes_title, trim = T);title
#review부분은 xpath로 가져와 보자
#xpath에서 / 의 의미는 > (후손)의 의미

review = vector(mode = "character", length = 10)
for(idx in 1:10){
  myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                 idx,
                 ']/td[2]/text()')
  nodes_review=html_nodes(html_page,
                 xpath = myPath);nodes_review

  txt <- html_text(nodes_review, trim = T)
  review[idx] = txt[3]
};review
df = data.frame(title,review)
View(df)

nodes2=html_nodes(html_page,
                  xpath = '//*[@id="old_content"]/table/tbody/tr[1]/td[2]/text()'); nodes2 ## html에서 리뷰의 위치 3번째 벡터에 리뷰가 존재

############################################################################
#반복해서 page를 browsing하는 crawling까지 포함해보자
#CP949 유니코드가 아닌 예전 한글 처리 encoding방식
extract_comment <- function(idx){
  url <- "https://movie.naver.com/movie/point/af/list.nhn"
  request_url = str_c(url, "?", "page=",idx)
  html_page = read_html(request_url,
                        encoding = "CP949")#한글 인코딩 예전 페이지이기때문
  nodes_title=html_nodes(html_page,"td.title>a.movie")
  title <- html_text(nodes_title, trim = T);title
  review = vector(mode = "character", length = 10)
  for(idx in 1:10){
    myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                   idx,
                   ']/td[2]/text()')
    nodes_review=html_nodes(html_page,
                            xpath = myPath)
    txt <- html_text(nodes_review, trim = T)
    review[idx] = txt[3]
  };review
  
  df = data.frame(title,review)
  return(df) #호출한 함수를 수행했으면 함수를 수행한 결과값을 호출한 자리에               대체 /df값(결과값)을 호툴한 자리로 보내서 대체
}
#View(df)
###함수를 호출해서 Crawling 을 해보자
result_df = data.frame();
for(i in 1:10){
  tmp <- extract_comment(i)#return한 결과값을 받자
  #tmp <- df extract_comment(1)일 때 idx==1일때 함수의 결과값을 대체하는의미
  result_df = rbind(result_df,tmp)
}

View(result_df)
#페이지마다 나오는 DF를 하나의 DF로 만들자


















