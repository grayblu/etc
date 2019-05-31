# 1
lunch = {
    '중국집':'02'
}

# print(lunch)

# 값 추가
lunch['분식집'] = '031'
print(lunch)

idol = {
    'bts' : {
        '지민' : 25,
        'RM' : 24
    }
}

result = idol['bts']['RM']
print(result)

# .items()
for key, value in lunch.items():
    print(key, value)

# value만 가져오기
for value in lunch.values():
    print(value)

# key만 가져오기
for key in lunch.keys():
    print(key)