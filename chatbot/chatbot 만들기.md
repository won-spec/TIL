chatbot 만들기

1. 파이썬 설치

path 설정 클릭 후 인스톨

disable path limit 클릭후 close

2. 바탕화면에서 bash 창 띄운후 

파이썬 설치 버젼 확인

3. 작업폴더 내에 들어가 우클릭 -> 코드뷰

컨트롤 + 쉬프트 + p -> shell 입력 -> select default shell -> gitbash -> 컨트롤 + `

4. 챗봇 생성에만 사용할 가상환경을 만들자

```bash
# 명령어 입력, venv 라는 가상환경 폴더 생성
$ python -m venv venv 
# 가상환경 진입
$ source venv/Scripts/activate
# 자동가상환경 진입이 되게 하자
좌측 상자 이미지 클릭 -> python 검색 및 가장 위의 항목 설치

컨트롤 + 쉬프트 + p -> interpreter 검색 -> 우리가 작업할 만든 가상환경 선택 venv 

test 해보자 콘솔창을 다시 띄워보자 : 컨트롤 + `
```

5. gitignore를 활용하자

gitignore 에 들어가서 Flask, venv, Visualstudio code 에 관한 코드 복사해서 

작업 파일에 gitignore파일을 만들자

##########################가상환결 설정 셋팅 ######################