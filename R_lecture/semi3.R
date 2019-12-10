.libPaths("C:/R_Lecture/lib")
.libPaths()

install.packages("corrplot")
install.packages("rgl")
install.packages("psych")
install.packages("plotly")
install.packages("readxl")
library(readxl)
library(corrplot)
library(xlsx)
library(stringr)
library(dplyr)


df1 <- read_excel(path = "C:/R_Lecture/data/semi/서울시_CCTV_11_18.xlsx",
                 col_names = T)
df1 <- as.data.frame(df1)
df1 <- rename(df1,"자치구"="지역")
df1 <- df1 %>%
    select('자치구','2014','2015','2016','2017','2018')

df2 <- read.csv(file = "C:/R_Lecture/data/semi/criminal.csv",
                fileEncoding = "UTF-8")
df2 <- df2%>%
    arrange(자치구)
df2 <- df2[-26,]

df3 <- df2%>%
    select('자치구')
df4 <- df1%>%
    select(-'자치구')
df5 <- cbind(df3,df4)

cri <- rename(df2,'2014'='r_2014',
              '2015'='r_2015',
              '2016'='r_2016',
              '2017'='r_2017',
              '2018'='r_2018')
cctvNm <- df5
cri_t <- as.data.frame(t(cri), stringsAsFactors = F)

cctvNm_t <- as.data.frame(t(cctvNm), stringsAsFactors = F)


cri_t2 <- cri_t[-1,]
cctvNm_t2 <- cctvNm_t[-1,]

#g01 <- data.frame(cri_t2[1],cctvNm_t2[1])
for( i in 1:25){
    x=str_c('g',i,'<- data.frame(cri_t2[',i,'],cctvNm_t2[',i,'])')
    #print(x)
    eval(parse(text=x))
}

#cor(as.numeric(g1$X1),as.numeric(g1$X1.1))
myList = c()
for( i in 1:25){
    x = str_c('cor(as.numeric(g',i,'$X',i,'),as.numeric(g',i,'$X',i,'.1))')
    myList <- append(myList,eval(parse(text=x)))
};myList

corDF <- data.frame(df3,myList)
corDF <- corDF %>%
    arrange(myList)
corDF

