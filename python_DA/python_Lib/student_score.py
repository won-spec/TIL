
## class 정의
class Student:
    # 1. class variable
    # 학생들이 가지고 있는 공통적인 변수
    
    # 2. 생성자 : instance variable
    def __init__(self,n,k,e,m): #인자 개수? 4개설정하자 왜? 이름, 국어, 영어, 수학
        self.sName = n
        self.sKor = int(k)      #입력으로 들어온 str을 int로 변환해서저장
        self.sEng = int(e)
        self.sMath = int(m)     
        self.sAvg = self.calculate_avg() # 내가 가지고 있는 함수중 calculate_avg함수 호출
        
    # 3. method
    def calculate_avg(self):   # self입력 필수 내가 가지고 있는 함수
        return (self.sKor + self.sEng + self.sMath) / 3
    
    def print_student(self):
        print("학생의 이름은 : {}, 평균은 : {:.2f}".format(self.sName,self.sAvg))