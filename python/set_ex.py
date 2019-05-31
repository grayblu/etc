s1 = set([1,2,3,4,5,6])
s2 = set([4,5,6,7,8,9])

# 교집합
print(s1 & s2)
print(s1.intersection(s2))

# 합집합
print(s1 | s2)
print(s1.union(s2))

# 차집합
print(s1 - s2)
print(s1.difference(s2))    # 대입 순서 주의!

# set은 생성 시 반드시 함수를 사용해야 한다
s3 = set()
print(type(s3))
# {}로 선언 시 dict 생성된다
s4 = {}
print(type(s4))