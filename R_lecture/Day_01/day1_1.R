#일반적으로 프로그래밍 언어에서 Statement(문장)를 종료하기 위한것 ;
#그러나 R은 ; 생략 
3+5 ; 3+6 ;3+6
#코드 실행을 위해서 컨트롤 + 엔터
#R은 대소문자 구분
#변수를 설정할 때 camelcase를 이용
result = 100;
myResult # camelcase notation
MyResult # pascal notation
my_result
myresult = 200 # 보기에 이상
#######################################################
myResult = 200 #assignment
myResult <- 300 #assignment
100 -> myResult #assignment
print(myResult) #출력
print("결과값은 :" + myResult)#작동 X
#여러개의 값을 출력하려면?, cat여러개의 값 함께 출력 , 로 잇는다
cat("결과값은 :",myResult)
cat("결과값은 :",myResult)

#######################################################
#멤버를 이용한 t변수 선언
good.price = 3000
good.code = "001"
good.name = "냉장고"

cat(good.code,good.name,good.price)

########################################################
#출력되는 형식을 살펴보자
mySeq = seq(100) # 1부터 100까지 1씩 증가하는 숫자의 집합
mySeq = seq(5,100) #범위의 시작과 끝또한 설정 가능
mySeq = seq(1,100, by =2) #by는 간격을 의미함 

mySeq #[n] 인뎃스 넘버, 출력되는 순서의 번호를 알려줌





