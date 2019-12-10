#영화 제목 ,user rating, 장르 3개 데이터 프레임
.libPaths()
.libPaths("C:/R_lecture/lib")
install.packages("rvest") #html을 관리를 위해
getwd()
setwd("C:/R_lecture")
remove.packages("rvest")
library(rvest)
library(stringr)
.libPaths("D:/R_lecture/library")
.libPaths()
url <- "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
#request_url = str_c(url, "?", "year=",scan());request_url
html_page = read_html(url); html_page

nodes_movieNm = html_nodes(html_page,"td>a.unstyled.articleLink");nodes_movieNm
movieNm = html_text(nodes_movieNm, trim=T);movieNm

myLink=html_nodes(html_page, "td>a.unstyled.articleLink") %>% html_attr('href');myLink
myLink[100]

#여기서부터 시작
Rating = vector(mode="character", length=100)
for( idx in 1:100){
  html_page1 = read_html(str_c("https://www.rottentomatoes.com",myLink[idx]));html_page1
  node_Rating =  html_nodes(html_page1,
                            " div.mop-ratings-wrap__half.audience-score > div > 
                            strong.mop-ratings-wrap__text--small")
  userRating = html_text(node_Rating)
  Rating[idx] = userRating;
};Rating

Genre = vector(mode = "character", 100)
for (idx in 1:100) {
  html_page1 = read_html(str_c("https://www.rottentomatoes.com",myLink)[idx])
  node_Genre = html_nodes(html_page1,
                          "li:nth-child(2) > div.meta-value > a ")
  userGenre = html_text(node_Genre, trim = T)
  Genre[idx] = paste(userGenre, collapse = ", ")
};head(Genre)
View(Genre)

myDF = data.frame(movieNm,Rating,Genre);View(myDF)
############################################################################
html_page1 = read_html(str_c("https://www.rottentomatoes.com",myLink)[100]);html_page1

node_Rating =  html_nodes(html_page1,
                          "div.mop-ratings-wrap.score_panel.js-mop-ratings-wrap > section > section > div.mop-ratings-wrap__half.audience-score > div > strong")

userRating = html_text(node_Rating);userRating

html_page1 = read_html(str_c("https://www.rottentomatoes.com",myLink)[1]);html_page1
node_Genre = html_nodes(html_page1,
                         "li:nth-child(2) > div.meta-value > a ");node_Genre
Genre = html_text(node_Genre, trim = T);Genre
for( idx in 1:length(Genre)){
  x = str_c("Genre : ",Genre[1])
  x = str_c(x,", ",Genre[2])
  x = str_c(x,", ",Genre[3])
}; userGenre

Genre = paste(Genre, collapse = ",");Genre
cat("Genre : ",Genre)


