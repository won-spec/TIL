.libPaths()
.libPaths("C:/R_Lecture/Lib")
install.packages("foreign")

library(foreign)
library(stringr)
library(ggplot2)
library(dplyr)
library(xlsx)

# 사용할 raw data 불러오기
raw_data_file = "C:/R_Lecture/data/Koweps_hpc10_2015_beta1.sav"
raw_welfare <- read.spss(file=raw_data_file,
                         to.data.frame = T)

# 원본 raw파일은 보존
welfare <- raw_welfare

str(welfare)

# 데이터 분석에 필요한 컬럼은 컬럼명을 변경
welfare <- rename(welfare,
                  gender=h10_g3, # 성별 
                  birth=h10_g4,  # 출생연도
                  marriage=h10_g10, # 혼인상태
                  religion=h10_g11, # 종교유무
                  code_job=h10_eco9, # 직업코드
                  income=p1002_8aq1, # 평균월급
                  code_region=h10_reg7) # 지역코드

################################## 준비완료

# 1. 성별에 따른 월급 차이
table(welfare$gender)

# 1은 male로 변경하고 2는 female로 변경
welfare$gender = ifelse(welfare$gender == 1,
                        "male",
                        "female")
table(welfare$gender)

# 월급에 대한 이상치부터 처리
welfare$income = ifelse(welfare$income %in% c(0,9999),
                        NA,
                        welfare$income)
# NA가 몇개 있는지 확인
table(is.na(welfare$income))

#### 분석을 하기 위한 준비가 끝나요!
gender_income <- welfare %>%
    filter(!is.na(income)) %>%
    group_by(gender) %>%
    summarise(mean_income = mean(income))

gender_income = as.data.frame(gender_income)
gender_income

## 결과 데이터 프레임을 그래프로 표현
ggplot(data=gender_income,
       aes(x=gender,
           y=mean_income)) +
    geom_col(width=0.5) + 
    labs(x="성별",
         y="평균 월급",
         title="성별에 따른 월급",
         subtitle="남성이 여성보다 150만원 많이 벌어요!!",
         caption="Example 1 Fig.")

################################## 

# 2. 나이와 월급의 관계 파악
# 몇살때 월급을 가장 많을 받을까?
# 2015년도를 기준으로 53살에 318.6777만원을
# 받아요!!
class(welfare$birth)  # 출생연도(숫자)
summary(welfare$birth)
qplot(welfare$birth)  # 빈도를 알수있어요
# 나이에 대해 결측치가 있나 확인
table(is.na(welfare$birth)) # 결측치 없어요

# 이상치(9999)도 check해야 해요
welfare$birth = ifelse(welfare$birth == 9999,
                       NA,
                       welfare$birth)
table(is.na(welfare$birth))

# 나이에 대한 column이 존재하지 않기 때문에
# column을 생성해야 해요!
welfare <- welfare %>%
    mutate(age = 2015 - birth + 1)

summary(welfare$age)
qplot(welfare$age)

age_income <- welfare %>%
    filter(!is.na(income)) %>%
    group_by(age) %>%
    summarise(mean_income = mean(income))

head(age_income)

age_income = as.data.frame(age_income)
# 가장 월급을 많이 받는 나이는?
age_income %>% arrange(desc(mean_income)) %>%
    select(age) %>% head(1)

# 나이에 따른 월급을 선그래프로 표현
ggplot(data=age_income,
       aes(x=age,
           y=mean_income)) + 
    geom_line()

################################## 

# 3. 연령대에 따른 월급 차이
# 30대 미만 : 초년(young)
# 30~59세 : 중년(middle)
# 60세 이상 : 노년(old)

# 위의 범주로 연령대에 따른 월급 차이 분석
# 위에서 했던 나이에 따른 월급 차이와
# 크게 다른점은 없어요..

# 연령대라는 새로운 column을 추가해야 해요!
welfare <- welfare %>%
    mutate(age_group = ifelse(age < 30,
                              "young",
                              ifelse(age<60,
                                     "middle",
                                     "old")))
table(welfare$age_group)

age_group_income <- welfare %>%
    filter(!is.na(income)) %>%
    group_by(age_group) %>%
    summarise(mean_income = mean(income))

age_group_income = as.data.frame(age_group_income)

ggplot(data=age_group_income,
       aes(x=age_group,
           y=mean_income)) + 
    geom_col(width=0.5)

# ggplot은 막대 그래프를 그릴때
# 기본적으로 x축 데이터에 대해 
# 알파벳 오름차순으로 정렬해서 출력

# 막대그래프 크기로 순서를 바꿀려면
ggplot(data=age_group_income,
       aes(x=reorder(age_group,-mean_income),
           y=mean_income)) + 
    geom_col(width=0.5)

# 막대그래프의 x축 순서를 내가 원하는 순서로
# 바꿀려면 어떻게 해야 하나요??

ggplot(data=age_group_income,
       aes(x=age_group,
           y=mean_income)) + 
    geom_col(width=0.5) + 
    scale_x_discrete(limits=c("young","middle","old"))


#####################################

# 4. 연령대 및 성별의 월급 차이를 알아보아요
# 성별의 월급차이는 연령대에 따라 다른
# 양상을 보일 수도 있을듯 함. 그걸 알아보자

# 초년 여자
# 초년 남자
# 중년 여자
# 중년 남자
# 노년 여자
# 노년 남자
gender_age_income <- welfare %>%
    filter(!is.na(income)) %>%
    group_by(age_group, gender) %>%
    summarise(mean_income = mean(income))

gender_age_income = as.data.frame(gender_age_income)

gender_age_income

plot.new()
# 누적 차트로 표현해야 될 듯 해요!!
ggplot(data=gender_age_income,
       aes(x=age_group,
           y=mean_income)) +
    geom_col(aes(fill=gender))

# 누적차트를 이렇게도 만들 수 있어요!
ggplot(data=gender_age_income,
       aes(x=age_group,
           y=mean_income,
           fill=gender)) +
    geom_col(position="dodge")


#######################################

# 5. 나이 및 성별에 따른 월급 차이 분석
gender_age <- welfare %>%
    filter(!is.na(income)) %>%
    group_by(age,gender) %>%
    summarise(mean_income = mean(income))

gender_age = as.data.frame(gender_age)

gender_age

ggplot(gender_age,
       aes(age,
           mean_income,
           col=gender))+
    geom_line(size = 1)

##########################################################

#6. 직업별 월급의 차이를 분석 가장월급을 많이받는직업?
#   가작 적게 받는 직업?
code_data <- read.xlsx("C:/R_lecture/Data/Koweps_Codebook.xlsx",
                       sheetIndex = 2,
                       header = T,
                       encoding = "UTF-8")
head(code_data)
head(welfare$code_job)

#welfare$code_job에서 이상치를 결측치로 변환
welfare$code_job <-ifelse(welfare$code_job==9999,
                          NA,
                          welfare$code_job)
#welfare$code_job결측치 개수확인
sum(is.na(welfare$code_job))

#welfare$code_job에서 결측치 제거
code_job_welfare <- welfare %>%
    filter(!is.na(code_job))
#welfare$code_job에서 결측치 제거되었는지 확인
sum(is.na(code_job_welfare$code_job))

#code_job을 기준으로 조인
join_welfare <- left_join(code_data, code_job_welfare, by="code_job")

job_income<-join_welfare %>%
    filter(!is.na(income)) %>%
    group_by(code_job,) %>%
    summarise(job_mean_income = mean(income)) %>%
    arrange(desc(job_mean_income))

result_job_income<-left_join(job_income,
                             code_data,
                             by="code_job")

result_job_income<-as.data.frame(result_job_income)
head(result_job_income,5)
tail(result_job_income,10)

ggplot(result_job_income,
       aes(job,
           job_mean_income)) +
    geom_col() +
    coord_flip()

#####################################################################
#7.종교 유무에 따른 이혼률
#종교가 있는 사람이 이혼을 덜할까?
sum(is.na(welfare$religion))
sum(is.na(welfare$marriage))

#0 비해당 1유배우 2사별 3이혼 4별거 5미혼 6기타
table(welfare$religion)
sum(is.na(welfare$religion))
welfare$religion <- ifelse(welfare$religion==1,
                           "종교있음",
                           "종교없음")
table(welfare$marriage)
table(welfare$religion)

religion_marriage1_4 <- welfare %>%
    filter(marriage %in% c(1:4)) %>%
    select(religion,marriage) %>%
    group_by(religion)

x<-table(religion_marriage1_4)
x
result_df<-data.frame(x)
result_df

result_df %>%
    filter(religion == "종교있음") %>%
    summarise("종교가 있는사람의 이혼율"=result_df[1,3]/sum(Freq))

result_df %>%
    filter(religion == "종교없음") %>%
    summarise("종교가 없는사람의 이혼율"=result_df[1,3]/sum(Freq))

ggplot(result_df,
       aes(religion,
           Freq,
           fill=marriage)) +
    geom_col(width = 0.5) +
    labs(x="종교유무",
         y="이혼빈도",
         title="종교 유무에 따른 이혼빈도",
         caption="Example 1 Fig.")
