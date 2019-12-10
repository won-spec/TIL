### 네이버 영화 댓글 사이트에서 특정영화에 대한 review를
### crawling 해서 wordcloud를 만들어보자
remove.packages()
install.packages("rvest")
install.packages("stringr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("KoNLP")
install.packages("wordcloud")
library(rvest)
library(stringr)
library(dplyr)
library(ggplot2)
library(KoNLP)
library(wordcloud)
.libPaths("C:/R_lecture/Lib")
.libPaths()

#https://movie.naver.com/movie/bi/mi/review.nhn?code=167613&page=1
# //*[@id="reviewTab"]/div/div/ul/li[1]/p/a/text()
#############################################################################
extract_comment <- function(idx){
  url <- "https://movie.naver.com/movie/bi/mi/review.nhn?code=167613&page="
  request_url = str_c(url,idx)
  html_page = read_html(request_url,
                        encoding = "UTF-8")
  review = vector(mode = "character", length = 10)
  for(idx in 1:10){
    myPath = str_c('//*[@id="reviewTab"]/div/div/ul/li[',
                   idx,
                   ']/p/a/text()')
    nodes_review=html_nodes(html_page,
                            xpath = myPath)
    txt <- html_text(nodes_review, trim = T)
    review[idx] = txt
  }
  df = data.frame(review, stringsAsFactors = T)
  return(df)
}

###함수를 호출해서 Crawling 을 해보자
result_df = data.frame();
for(i in 1:10){
  tmp <- extract_comment(i)#return한 결과값을 받자
  #tmp <- df extract_comment(1)일 때 idx==1일때 함수의 결과값을 대체하는의미
  result_df = rbind(result_df,tmp)
}
DF<-result_df

View(result_df)
head(result_df)
class(result_df)
###############################데이터 불러옴#################################
#wordcloud를 만들어보자
install.packages("KoNLP")
library(KoNLP)
useNIADic()

head(DF)
class(DF)
DF <- as.list(DF)
class(DF)
DF <- unlist(DF)
class(DF)
txt <- str_replace_all(DF,"\\W"," ")
class(txt)

nouns <- extractNoun(txt)
head(nouns)
class(nouns)
nouns

words <- unlist(nouns)
class(words)
head(words)

wordCloud<-table(words)
head(wordCloud)
class(wordCloud)

df = as.data.frame(wordCloud,
                stringsAsFactors = F)
class(df)
head(df)
View(df)
class(df) #nchar() :글자의 개수를 확인하는 함수
word_df <- df %>%
  filter(nchar(as.character(words)) >= 2 ) %>%
  arrange(desc(Freq)) %>%
  head(20)

class(word_df)
head(word_df)

pal <- brewer.pal(8,"Dark2")

set.seed(1) #시드값을 정해주는 것이 의미, 어떤숫자인지는 중요 X
wordcloud(words = word_df$words,
          freq = word_df$Freq,
          min.freq = 2,      #적어도 2이상의 빈도를 선택 
          max.words = 20,   #최대 입력하는 단어수
          random.order = F,  #고빈도 단어를 중앙배치?원하면 =>F  
          rot.per = 0.1,     #회전시킬 단어들의 정도
          scale = c(3,03),   #글자 크기의 범위
          colors = pal)  



