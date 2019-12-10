# keyword로 도서 검색 후 출력(실습)
#web crawling &web Scraping

### HTML, CSS, JavaScript : 웹 언어

#w3c
#HTML이 발전해서 1999년 4.01버전
#w3c가 1999년 12월에 HTML 4.01을 마지막으로 더이상 HTML의 버전업은 없다
#HTML언어는 기본적으로 2가지 문제점을 가지고 있다.
#1.정형성이 없다. => 유지보수시에 문제점이 발생함.
#2. 확장성이 없다. => 정해진 tag만 이용해서 사용하다보니
#                     배우고 쓰기에는 쉽지만 응용해서 확장하기는 부적합

#2000년부터 w3c는 Html 표준을 다른것을 가미해 위의 2가지 문제를 해결
#XML을 HTML에 도입해서 표준으로 만들려고함.
#XHTML 1.0이 시작
#XML사용에 회의적인 시각을 가지고 있는 몇몇 회사들이 컨소시엄 구성
#XML대신 HTML을 발전 => HTML5
#HTML5의 의의 : 웹 페이지 대신 웹어플리케이션이 대세가 될것이라 예측
#웹 페이지 대신 front-end web aplication 이 사용됨
#Angular, react.js, View,js => JavaScript사용해서 만듬

#########################################################################10.25연습문제
#입력으로 최대 100자의 문자열사용
#입력으로 사용된 문자열에서 숫자만을 추출해서 출력하세요
# ex) hi2567Hello23kaka890l34TT23
# 2567238903423
# 이렇게 추출한 숫자문자열에서 개수가 가장 많은 숫자를 찾아서 숫자와 
# 출현빈도를 출력하세요
# 2-> 3, 3->3, 4->1, 5->1, 6->1
# 만약 출현빈도가 같은 숫자가 여러개인경우 가장 작은 수 출력
library(stringr)

var1 = "hisdfsdfsadfds1243266663152124346546786879789870890987-934563sdfsdf56s56146515161sd2567Hello23kaka890l34TT23"
var2 = str_extract_all(var1,"[0-9]");var2
myTable = table(var2);myTable 
#테이블 사용시 각 항목의 데이터 형태가 character이여야함 
myDf = data.frame(myTable); myDf
myFreq = myDf[,2]; myFreq
var3 = max(myDf[,2]);var3
for(x in 1:length(myFreq)){
  if(myDf[x,2] == var3){
    var4 = myDf[x,]
    print(var4)
    return(0)
  }
  #print(var4)
  #return(0)
}
