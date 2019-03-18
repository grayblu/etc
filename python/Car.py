class Car:
    def __init__(self):
        self.color = 0xff0000
        self.wheel_size = 16
        self.displacement = 2000
    
    def forward(self):
        pass
    def backward(self):
        pass
    def turn_left(self):
        pass
    def turn_right(self):
        pass

if __name__=="__main__":
    my_car = Car()

    print('0x{:02X}'.format(my_car.color))

    my_car.forward()
    my_car.backward()