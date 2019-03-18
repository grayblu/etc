class HasPrivate:
    def __init__(self):
        self.public = "Public."
        self.__private = "Private."
    
    def print_from_internal(self):
        print(self.public)
        print(self.__private)

if __name__ == "__main__":
    obj = HasPrivate()
    obj.print_from_internal()
    print(obj.public)
    print(obj.__dict__)
    print(obj._HasPrivate__private)