import requests
from bs4 import BeautifulSoup

# 1. 페이지에 요청을 보내서  HTML 문서를 문자열 형태로 가져온다.
url = 'https://finance.naver.com/sise/'

html = requests.get(url).text

# 2. HTML 문서에서 손쉽게 데이터를 가져오기 위해 BeautifulSoup 클래스 객체를 받아온다.

soup = BeautifulSoup(html, 'html.parser')
print(type(soup)) # <class 'bs4.BeautifulSoup'> 출력

# 3. 가져올 태그의 선택자를 넣고 결과물을 가져온다.
# 기본적인 사용법
# 1.  .select_one(선택자) : 해당하는 태그하나
# 2.  .select(선택자) : 해당하는 모든태그
kospi = soup.select_one('#KOSPI_now')
print(kospi) # <span class="num" id="KOSPI_now">2,105.62</span> 출력

kospi = soup.select_one('#KOSPI_now').text
print(kospi) # 2,105.62 출력