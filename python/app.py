from flask import Flask, render_template, request
import random
import pprint

app = Flask(__name__)

@app.route('/')
def index():    # 뷰 함수
    return 'hello world'

@app.route('/hello')
def hello():
    return '반갑습니다!!'

@app.route('/greeting/<name>')
def greeting(name):
    return f'반갑습니다! {name}님'

@app.route('/cube/<int:num>')
def cube(num):
    result = num ** 3
    return str(result)

# '/lunch/3' 으로 요청이 왔을 때
# 메뉴 리스트에서 랜덤으로 인원 수 만큼 메뉴 골라서
# 출력해주기
@app.route('/lunch/<int:num>')
def menu(num):
    menu_list = ['한식','중식','일식']
    order = random.sample(menu_list, num)
    return str(order)

@app.route('/html_line')
def html_line():
    return """
    <h1>여러 줄 보내기</h1>
    <ul>
        <li>1이요</li>
        <li>2이요</li>
    </ul>
    
    """

@app.route('/html_render')
def html_render():
    return render_template('index.html')

@app.route('/html_name/<name>')
def html_name(name):
    return render_template('hello.html', name=name)


# 숫자를 세제곱해야 하므로 타입을 int로 지정한다
# 기본 자료형이 string이므로 변수 전달을 가능하더라도 계산은 불가능함
@app.route('/question/<int:num>')
def question(num):
    result = num **3
    return render_template('hello.html', num=num, result=result)

# 저녁 메뉴 랜덤 뽑기
# '/dinner'로 요청이 들어왔을 때
# 저년 메뉴에서 하나를 뽑아서 이미지와 메뉴 이름을 응답해주자
# 출력은 이미지로

@app.route('/dinner')
def dinner():

    menu = {
            '한식':'https://i.pinimg.com/originals/26/d4/48/26d448f49ae1c6b8a8cca78184c8c5b6.jpg',
            '중식':'http://mblogthumb2.phinf.naver.net/MjAxODAxMjlfMjE4/MDAxNTE3MTkyMDg1NDc4.rNgJE0gWyDuZm0NIwAbxVSXtYUL0FwKcg0jAAcTUI0kg.WI0EFy0eIQPtCTDM3rxsxwFde8lNiIOJCdfKhIRvEdUg.PNG.tjek1/%EC%A4%91%EC%8B%9D%EC%A1%B0%EB%A6%AC%EA%B8%B0%EB%8A%A5%EC%82%AC2018%2C01%2C29-105147-02.png?type=w800',
            '일식':'http://imgnn.seoul.co.kr/img//upload/2016/03/24/SSI_20160324104448_V.jpg'

            }

    pick = random.choice(list(menu.keys()))
    url = menu.get(pick)

    '''
    url = menu['짜장면'] # key error
    url = menu.get('짜장면') # none
    '''



    '''
    pick = random.sample(menu.keys(), 1)
    pick = pick.pop()
    url = menu[pick]
    # url = menu[pick].value() 잘못된 표현임
    '''
    return render_template('hello.html', pick=pick, url=url)

@app.route('/lotto')
def lotto():
    number_list = list(range(1,46))
    lucky = random.sample(number_list, 6)
    return render_template('lotto.html', lucky=lucky)

@app.route('/naver')
def naver():
    return render_template('naver.html')

@app.route('/google')
def google():
    return render_template('google.html')


# ping에서 입력한 값을 /pong페이지로 보내고
# route()에서는 다시 해당 값을 가공하여 페이지에서 출력함
# 가장 기본적인 데이터 흐름
@app.route('/ping')
def ping():
    return render_template('ping.html')

@app.route('/pong')
def pong():
    user_name = request.args.get('name')
    return render_template('pong.html', user_name=user_name)


@app.route('/ping_new')
def ping_new():
    return render_template('ping_new.html')

@app.route('/pong_new', methods=['POST'])
def pong_new():
    user_name = request.form.get('name')
    return render_template('pong_new.html', user_name=user_name)


@app.route('/inputname')
def inputname():
    return render_template('inputname.html')

@app.route('/godmademe')
def godmademe():
    name = request.args.get('name')
    character = ['멍청함', '똑똑함', '똘끼', '귀여움', '섹시함', '잘생김', '못생김', '자상함', '의리', '카리스마', '허세', '병신력', '애교', '재력']
    random_obj = random.sample(character, 3)
    print(random_obj)
    return render_template('gotmademe.html', name=name, random_obj=random_obj)


# 파이썬 파일이 직접 실행된 코드라면 if문 코드를 실행
if __name__ == '__main__':
    app.run(debug=True)