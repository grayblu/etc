import random
import requests
import json
from pprint import pprint

url = 'https://dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=860'
res = requests.get(url)
lottery = res.json()
# pprint(lottery)

winner = []
for i in range(1, 7):
    winner.append(lottery[f'drwtNo{i}'])
bonus = lottery['bnusNo']

print(winner)
print(bonus)

# 내가 자동으로 산 복권 번호와 당첨번호(winner) 교집합 개수 비교를 통해 등수 매기기



def inter(a,b):
    return len(list(set(a) & set(b)))


count = 0
# while True:
while True:
    count += 1
    numbers = random.sample(range(1, 46), 6)    # 해당 범위에서 랜덤한 숫자를 뽑기 때문에 중복 없다
    result = inter(winner, numbers)
    if result == 3:
        print(f'{count} 회에 5등입니다')
    elif result == 4:
        print(f'{count} 회에 4등입니다')
    elif result == 5:
        print(f'{count} 회에 3등입니다')
        if bonus in numbers:
            print(f'{count} 회에 2등입니다')
    elif result == 6:
        print(f'{count} 회에 1등입니다')
        break
