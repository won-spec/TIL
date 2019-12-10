install.packages("rvest") #html을 관리를 위해
getwd()
library(rvest)
library(stringr)

url <- "https://www.rottentomatoes.com/top/bestofrt"

request_url = str_c(url, "?", "year=",2019);request_url

html_page = read_html(url); html_page

nodes_movieNm = html_nodes(html_page,"td>a.unstyled articleLink");nodes_movieNm

node=html_nodes(html_page,
                  xpath = '//*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a')



movieNm = html_text(nodes_movieNm)
