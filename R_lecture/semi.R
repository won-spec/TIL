.libPaths()
.libPaths("C:/R_Lecture/Lib")

install.packages("foreign")
install.packages("dplyr")
install.packages("xlsx")
library(foreign)

# 필요한 package를 미리 로딩
library(stringr)
library(ggplot2)
library(dplyr)
library(xlsx)

# 사용할 raw data를 불러와요!
raw_data_file1 = "C:/R_Lecture/data/semi/KCYPS2010_e1w7.sav"

raw_grade_1_2015 <- read.spss(file=raw_data_file1,
                 to.data.frame = T,
                 fileEncoding = "UTF-8")



preDF <- raw_grade_1_2015 %>%
    select(ID,SURVEY1w7,PARENTw7,BRT1Aw7,BRT2Aw7,BRT2Bw7,ARA2Aw7,ARA2Bw7,HOUSEw7,HAK2Aw7,HAK2Bw7,JOB1Aw7,JOB1Bw7,JOB4Aw7,
           JOB4Bw7,
           INCOMEw7,
           INCOME1w7,
           PAR2w7,
           PHY1Aw7,
           PHY1Bw7,
           PHY3Aw7,
           PSY1A06w7,
           PSY1A07w7,
           PSY1B01w7,
           PSY1B02w7,
           PSY1B03w7,
           PSY1B04w7,
           PSY1B05w7,
           PSY1B06w7,
           PSY1D01w7,
           PSY1D02w7,
           PSY1D03w7,
           PSY1D04w7,
           PSY1D05w7,
           PSY1E01w7,
           PSY1E02w7,PSY1E03w7,PSY1E04w7,PSY1E05w7,PSY1E06w7,PSY1E07w7,PSY1E08w7,
           PSY1E09w7,PSY1E10w7,PSY1E03w7,PSY2A01w7,PSY2A02w7,PSY2A03w7,PSY2A04w7,
           PSY2A05w7,PSY2A06w7,PSY2A07w7,PSY2A08w7,PSY2A09w7,PSY2A10w7,
           PSY3B01w7,PSY3B02w7,PSY3B03w7,
           FAM1Aw7,FAM1Bw7,FAM1Cw7,FAM1Dw7,FAM3A04w7,FAM3B01w7,FAM3B02w7,FAM3B03w7,FAM3B04w7)
    

#write.csv(preDF,
#          file="C:/R_lecture/child_abuse.csv",
#          fileEncoding = "UTF-8")

df <- subset(preDF, SURVEY1w7 == "조사성공")
summary(df)

sum(is.na(df$FAM3B04w7))


df$FAM3B01w7 <- ifelse(df$FAM3B01w7 == "매우 그렇다",
                       4,
                       ifelse(df$FAM3B01w7 == "그런 편이다",
                              3,
                              ifelse(df$FAM3B01w7 == "그렇지 않은 편이다",
                                     2,
                                     1)))

df$FAM3B02w7 <- ifelse(df$FAM3B02w7 == "매우 그렇다",
                       4,
                       ifelse(df$FAM3B02w7 == "그런 편이다",
                              3,
                              ifelse(df$FAM3B02w7 == "그렇지 않은 편이다",
                                     2,
                                     1)))

df$FAM3B03w7 <- ifelse(df$FAM3B03w7 == "매우 그렇다",
                       4,
                       ifelse(df$FAM3B03w7 == "그런 편이다",
                              3,
                              ifelse(df$FAM3B03w7 == "그렇지 않은 편이다",
                                     2,
                                     1)))

df$FAM3B04w7 <- ifelse(df$FAM3B04w7 == "매우 그렇다",
                       4,
                       ifelse(df$FAM3B04w7 == "그런 편이다",
                              3,
                              ifelse(df$FAM3B04w7 == "그렇지 않은 편이다",
                                     2,
                                     1)))

df <- df %>% mutate(abuse_sum=df$FAM3B01w7+df$FAM3B02w7+df$FAM3B03w7+df$FAM3B04w7)

ggplot(data = df1,
       aes(x=df1$abuse_sum,
           y=df1$FAM1Bw7))+
    geom_point()

ggplot(data = df1,
       aes(x=df1$abuse_sum)) +
    geom_bar(aes(fill=factor(df1$FAM1Bw7)))+
    ylim(0,550)


sum(is.na(df1$FAM1Bw7))
sum(is.na(df$abuse_sum))

df1 <- df %>% 
    filter(!is.na(df$FAM1Bw7))

length(df1$abuse_sum)

data.frame(table(df$FAM1Bw7))

install.packages("readxl")
library(readxl)
raw_data_file2 = "C:/R_Lecture/data/semi/KCYPS2010_e1w7.xlsx"

raw_grade_2_2015 <- read_excel(path = raw_data_file2,
                               col_names = T)

df1 <- subset(raw_grade_2_2015, SURVEY1w7 == "1")



