#영화 제목 ,user rating, 장르 3개 데이터 프레임
install.packages("rvest") #html을 관리를 위해
getwd()
library(rvest)
library(stringr)

url <- "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
#request_url = str_c(url, "?", "year=",scan());request_url
html_page = read_html(request_url); html_page

nodes_movieNm = html_nodes(html_page,"td>a.unstyled.articleLink");nodes_movieNm

movieNm = html_text(nodes_movieNm, trim=T);movieNm
myLink=html_nodes(html_page, "td>a.unstyled.articleLink") %>% html_attr('href');x

#여기서부터 시작
Rating = vector(mode="character", length=100)
for( idx in 1:100){
  html_page1 = read_html(str_c("https://www.rottentomatoes.com",x)[idx]);html_page1
  node_Rating =  html_nodes(html_page1,
                            " div.mop-ratings-wrap__half.audience-score > div > 
                            strong.mop-ratings-wrap__text--small")
  userRating = html_text(node_Rating)
  Rating[idx]==userRating
};Rating

############################################################################
html_page1 = read_html(str_c("https://www.rottentomatoes.com",x)[4]);html_page1

node_Rating =  html_nodes(html_page1,
                     " div.mop-ratings-wrap__half.audience-score > div > strong.mop-ratings-wrap__text--small")
userRating = html_text(node_Rating);userRating

html_page1 = read_html(str_c("https://www.rottentomatoes.com",x)[2]);html_page1
node_Genre = html_nodes(html_page1,
                         "li:nth-child(2) > div.meta-value > a ");node_Genre
Genre = html_text(node_Genre, trim = T);Genre
Genre = paste(Genre, collapse = ",");Genre
cat("Genre : ",Genre)



#mainColumn > section.panel.panel-rt.panel-box.movie_info.media > div > div > ul > li:nth-child(2) > div.meta-value

#mainColumn > section.panel.panel-rt.panel-box.movie_info.media > div > div > ul > li:nth-child(2) > div.meta-value > a:nth-child(1)



