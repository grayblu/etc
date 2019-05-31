from flask import Flask, render_template, request
import requests
import json
import random
app = Flask(__name__)

@app.route('/lotto_check')
def lotto_check():
    return render_template('lotto_check.html')

@app.route('/lotto_result')
def lotto_result():
    lotto_round = request.args.get('lotto_round')
    response = requests.get(f'https://dhlottery.co.kr/common.do?method=getLottoNumber&drwNo={lotto_round}')
    lotto = response.json()

    # winner = []
    # for i in range(1,7):
    #     winner.append(lotto[f'drwNo{i}'])

    # list comprehension
    # 당첨번호 6개 가져오기
    winner = [lotto[f'drwtNo{i}'] for i in range(1,7)]

    # 내 번호 리스트 만들기
    my_num = random.sample(range(1, 46), 6)
    # 당첨번호와의 교집합
    s1 = set(winner)
    s2 = set(my_num)
    result = list(s1.intersection(s2))
    # 조건에 따라 1등부터 꽝까지 결과값을 lotto_result로 보내준다.

    bonus = lotto["bnusNo"]

    if len(result) == 3:
        my_result = '5등'
    elif len(result) == 4:
        my_result = '4등'
    elif len(result) == 5:
        my_result = '3등'
        if bonus in my_num == True:
            my_result = '2등'
    elif len(result) == 6:
        my_result = '1등'
    else:
        my_result = '꽝!'

    return render_template('lotto_result.html', lotto_round=lotto_round, winner=f'{winner} + {lotto["bnusNo"]}', my_num=my_num, my_result=my_result)

if __name__ == '__main__':
    app.run(debug=True)