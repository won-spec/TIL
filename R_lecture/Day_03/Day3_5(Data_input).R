setwd("C:/R_lecture")
getwd()
#데이터 입출력
#키보드로부터 데이터를 받을 수 있다.
#scan()함수를 이용해서 숫자데이터를 받을 수 있다
myNum <- scan()
myNum

#scan()을 이용해서 문자열도 입력받을 수 있어요!!
var1 = scan(what = character())
var1
#1. scan()함수 돌리기 2. 콘솔창에 데이터 입력 3. 변수입력 및 출력

#키보드로부터 데이터를 받기 위해서 edit()함수를 이용할수 있어요
var1 = data.frame()

df = edit(var1)
df

#######################################################################

#파일로부터 데이터를 읽어보자

#text파일에 ","로 구분된 데이터들을 읽어들여 보자
#read.table()사용
getwd()
setwd("C:/R_lecture/Data")
#한글을 사욜할 경우 fileEncoding = "UTF-8" 설정)
#파일에 header가 있는 경우 Header = T설정

student_midterm = read.table("C:/R_lecture/Data/Student_info.txt", sep=",", header = T , fileEncoding = "UTF-8")

student_midterm = read.table(file.choose(), sep=",", fileEncoding = "UTF-8")
student_midterm





