# data : excel 파일(exec1105.xlsx)

# 만약 결측값이 존재하면 결측값은 결측값을 제외한 
# 해당 과목의 평균을 이용합니다.

# 만약 극단치가 존재하면 하위 극단치는 극단치값을 제외한
# 해당 과목의 1사분위 값을 이용하고 
# 상위 극단치는
# 해당 과목의 3사분위 값을 이용합니다.

# 1. 전체 평균이 가장 높은 사람은 누구이며 평균값은 얼마인가요?
# 81.11111
# 2. 남자와 여자의 전체 평균은 각각 얼마인가요?
# 40.7 / 54.6
# 3. 수학성적이 전체 수학 성적 평균보다 높은 남성은 누구이며
#    수학성적은 얼마인가요?
# 이순신 : 68, 강감찬 : 78.666667
library(xlsx)
library(stringr)
library(dplyr)
library(ggplot2)

DS1 <- read.xlsx("C:/R_lecture/Data/exec1105.xlsx",
                sheetIndex = 1,
                header = F,
                encoding = "UTF-8");DS1
DS2 <- read.xlsx("C:/R_lecture/Data/exec1105.xlsx",
                 sheetIndex = 2,
                 header = F,
                 encoding = "UTF-8");DS2
# 파일 인코딩시 CSV와 달리 fileEncoding이 아니라 
# Encoding 사용
class(DS1)
class(DS2)
names(DS1) <- c("Id","Sub","Score");DS1
names(DS2) <- c("Id","Name","Gender");DS2

DS3 <-dcast(DS1,
           formula = Id ~ Sub,
           value.var = "Score");DS3
DS4 <- full_join(DS3,DS2, by="Id");DS4

#결측치 변경??
for (i in 1:nrow(DS4)) {
  for (j in 1:ncol(DS4)) {
    if(is.na(DS4[i,j])==TRUE){
      avg=mean(DS4[,j],na.rm = T)
      DS4[i,j]=avg
    }
  }
};DS4
summary(DS4$eng)

for (i in 1:ncol(DS4)) {
  for (j in 1:nrow(DS4)) {
    if(max(boxplot(DS4$eng)$stats)<DS4[j,i]){
      DS4[j,i] = summary(DS4$eng)[5]
    }
    if(min(boxplot(DS4$kor)$stats)>DS4[j,i]){
      DS4[j,i] = summary(DS4$kor)[2]
    }
    if(max(boxplot(DS4$math)$stats)<DS4[j,i]){
      DS4[j,i] = summary(DS4$math)[5]
    }
  }
};DS4
DS4

# 1. 전체 평균이 가장 높은 사람은 누구이며 평균값은 얼마인가요?
DS4 %>%
  mutate(avg = (eng+kor+math)/3) %>%
  arrange(desc(avg)) %>%
  head(1)

# 2. 남자와 여자의 전체 평균은 각각 얼마인가요?
DS4 %>%
  mutate(avg = (eng+kor+math)/3) %>%
  arrange(desc(avg)) %>%
  group_by(Gender) %>%
  summarise()


# 3. 수학성적이 전체 수학 성적 평균보다 높은 남성은 누구이며
#    수학성적은 얼마인가요?




