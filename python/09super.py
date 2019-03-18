class A:
    def __init__(self, message):
        print("A.__init__()")
        self.message = message

class B(A):
    def __init__(self):
        print("B.__init__()")

        super().__init__("Hello")  # 부모 클래스에 정의된 생성자 재정의
        # A.__init__(self)    위와 동일한 방법으로 부모 클래스의 멤버 호출
        print("self.message is " + self.message)

if __name__ == "__main__":
    b = B()
    