setwd("C:/R_lecture")
getwd()
.libPaths("C:/R_lecture/Lib")
## 자연어 처리 기능을 이용해보자
#이것은 소리없는 아우성

## KoNLP package를 이용한다 o 는 소문자
# Korean Natural Language Process
# 해당패키지 않에 사전이 포함되어 있다

# 이것은 소리없는 아우성
# 3가지 사전이 포함
# 시스템사전(28만개), 세종사전(32만개), NIADIC사전(98만개)
# Java기능을 이용! 시스템에 JRE가 설치되어 있어야 함
# JRE를 설치한 위치를 R package에 알려주어야함
# JRE를 찾아서 사용하자자
# JAVA_HOME 환경변수를 설정해야함.
# 폴더 내피씨 우클릭 속성 고급시스템설정환경변수 새로만들기 
# 변수이름 JAVA_HOME , 변수값 JRE 파일 주소입력, 확인

# 영문 NLP는 openNLP, Snowball 패키지 이용
install.packages("KoNLP")
library(KoNLP)
useNIADic() #사전 선택

txt <- readLines("C:/R_lecture/Data/hiphop.txt",
                 encoding = "UTF-8")
head(txt) #  "\"보고 싶다" 두번재 큰따옴표는 파일에서의 문자
tail(txt)

#데이터가 정상적으로 들어옴
#특수문자가 포함되어 있으면 제거를 해야함!
#문자열 처리할때? stringr
library(stringr)
#정규 표현식을 이용해서 특수문자를 모두 찾아서 ""로 변환
txt <- str_replace_all(txt,"\\W"," ")
# \\W : 특수기호를 나타내는 정규표현식 대문자

#함수를 이요해서 명사만 뽑아보자
nouns <- extractNoun(txt)
head(nouns)

#명사를 추출해서 List형태로 저장
length(nouns)

#list형태를 vector로 변환
words <- unlist(nouns) #list를 vector로 변환
head(words)
length(words)

#워드클라우드를 만들기 위해 많이(빈도) 등장하는 명사만 추출
head(table(words))
wordCloud <- table(words)
df = as.data.frame(wordCloud,
                   stringsAsFactors = F)              
View(df)
ls(df)
#빈도수가 높은 상위 20개의 단어들만 추출
#한글자 짜리는 의미가 없다고 판단 => 제거
#두글자 이상만 추출
library(dplyr)

word_df <- df %>%
  filter(nchar(words) >= 2 ) %>% #nchar() :글자의 개수를 확인하는 함수
  arrange(desc(Freq)) %>%
  head(20)

#데이터가 준비되었으니 워드클라우드를 만들어보자
install.packages("wordcloud")
library(wordcloud)

#워드 클라우드에서 사용할 색상에 대한
#팔래트를 설정
# Dark2라는 색상목록에서 8개의 색상을 추출
pal <- brewer.pal(8,"Dark2")

#워드 클라우드는 만들때마다 랜덤하게 만들어진다.
#랜덤하게 생성되기 때문에 재현성을 확보할 수 없다.
#랜덤함수의 시드값을 고정시켜서 항상 같은 워드 클라우드가
#만들어지게 설정하자(재현성 확보하자)
set.seed(1) #시드값을 정해주는 것이 의미, 어떤숫자인지는 중요 X
wordcloud(words = word_df$words,
          freq = word_df$Freq,
          min.freq = 2,      #적어도 2이상의 빈도를 선택 
          max.words = 100,   #최대 입력하는 단어수
          random.order = F,  #고빈도 단어를 중앙배치?원하면 =>F  
          rot.per = 0.1,     #회전시킬 단어들의 정도
          scale = c(4,03),   #글자 크기의 범위
          colors = pal)      #색상설정?

### 네이버 영화 댓글 사이트에서 특정영화에 대한 review를
### crawling 해서 wordcloud를 만들어보자








