#package
#R은 기본적으로 처음 설치할 때 base package가 같이 설치됨
#추가적인 기능을 위해서는 외부 package인스톨필요
#그래프를 그리기 위해 인스톨할 패키지 => ggplot2
#package설치를 위한 명령어
install.packages("ggplot2")
installed.packages()
#설치된 package를 메모리에 load해야 사용할 수 있다
library(ggplot2)
require(ggplot2)

#간단한 빈도를 나타내는 막대그래프 그리기위해 vector설정
var1 = c("a","b","c","a","b","a")
qplot(var1) #qplot vector속 데이터값의 빈도를 나타내는 그래프 그려줌

#설치된 패키지 삭제하기
remove.packages("ggplot2") 
#수동으로 package가 설치된 폴더를 삭제해도 삭제됨
#package가 설치된 경로를 알아보자
.libPaths() #설치경로 출력 로그인계정

#패키지 설치경로 변경?
.libPaths("C:/R_lecture/Lib")

#package를 설치하면 package에서 지원하는 함수를 이용할 수 있다!
#함수사용법을 모른다? => help()함수 사용
#사용법의 구체적인 예를 알고 싶다? -> example()함수 사용
help(qplot)
example(qplot)
example(qqplot2)

#workig directory
getwd() # "C:/R_lecture" 출력
setwd("C:/R_lecture") #wd 변경가능
