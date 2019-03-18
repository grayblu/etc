class Calculator:
    PI = 3.14

    @staticmethod
    def plus(a, b):
        return a+b
    
    @staticmethod
    def minus(a,b):
        return a-b
    
    @classmethod
    def area(cls,r):
        return r*r*cls.PI
    

if __name__ == "__main__":
    print("{0} + {1} = {2}".format(7,3, Calculator.plus(7,3)))
    print("{0} - {1} = {2}".format(7,3, Calculator.minus(7,3)))
    print("{0}".format(Calculator.PI))
    print("{0}".format(Calculator.area(5)))