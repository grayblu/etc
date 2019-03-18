from abc import ABCMeta
from abc import abstractmethod
class AbstractDuck(metaclass = ABCMeta):
    @abstractmethod
    def Quack(self):
        pass

# class Duck(AbstractDuck): 규칙 위반
#     pass

class Duck(AbstractDuck):
    def Quack(self):
        print("[Duck] Quack")

def quack(obj):
    if isinstance(obj, AbstractDuck):
        obj.Quack()
    else:
        print("AbstractDuck이 아닙니다.")

if __name__ == "__main__":
    duck = Duck()
    quack(duck)

    quack("hello")