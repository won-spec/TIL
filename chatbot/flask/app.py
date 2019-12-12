from datetime import datetime
from flask import Flask, render_template, request
import random
app = Flask(__name__)

# @app.route('/')
# def hello_world():
#     return 'Hello, 하하하핳ㅎ'

@app.route('/')
def hello_world():
    return render_template('index.html')
    # flask사이트에서 quick start에서 복붙해옴

@app.route('/mulcam')
def mulcam():
    return '20층 스카이라운지'

@app.route('/dday')
def dday():
    today = datetime.now()
    new_year = datetime(2020,1,1)
    result = new_year -today
    return f'<h1>28살까지 {result.days}일 남았다.....</h1>'

@app.route('/greeting/<string:name>')
def greeting(name):
    # return f'반갑습니다,{name}님'
    return render_template('greeting.html', html_name = name )

@app.route('/cube/<int:number>')
def cube(number):
    # return f'{number}의 세제곱 값은 {number**3}입니다.'
    return render_template('cube.html', html_number=number, result=number**3)

@app.route('/lunch/<int:people>')
def lunch(people):
    menu = ['보쌈','치킨','덮밥','초밥','햄버거','브리또']
    order = random.sample(menu,people)
    return str(order)

@app.route('/movie/<int:movie_id>')
def movie():
    movies = ['나이브스 아웃','조커','엔드게임']
    return render_template('movie.html', html_movies=movies)

@app.route('/ping')
def ping():
    return render_template('ping.html')

@app.route('/pong')
def pong():
    age = request.args.get('age')
    return render_template('pong.html', age=age)

@app.route('/naver')
def naver():
    return render_template('naver.html')

@app.route('/google')
def google():
    return render_template('google.html')

#사용자로부터 입력받을 페이지를 렌더링
@app.route('/vonvon')
def vonvon():
    return render_template('vonvon.html')

@app.route('/godmade')
def godmade():
    name = request.args.get('name')
    first_option = ['매력','키','돈']
    second_option = ['sdfds','sdfsdf','eee']
    third_option = ["qqqq",'eee','fsgg']

    first = random.choice(first_option)
    second = random.choice(second_option)
    third =random.choice(third_option)
    
    return render_template('godmade.html', name = name, first = first, second = second, third =third)

# app.py 가장 하단에 위치
# 1.앞으로 flask run으로 서버를 켜는게 아니라. python app.py로 서버를 실행한다.
# 2.내용이 바뀌어도 서버를 껐다 켜지 않아도 된다.
if __name__ == '__main__':
    app.run(debug=True)