# from contacts.ContactInfo import ContactInfo # 패키지 사용 시

from ContactInfo import ContactInfo # 단독으로 실행 시

class ConatctList:
    def __init__(self):
        self.contact_list  = []
    
    def __iter__(self):
        self.current = 0
        return self

    def __next__(self):
        if (self.current < len(self.contact_list)):
            current = self.current
            self.current += 1
            return self.contact_list[current]
        
        raise StopIteration()

    def add(self, ci):
        self.contact_list.append(ci)

    def find(self, name):
        return [ci for ci in self.contact_list if ci.name==name]

    def getList(self, start = 0, end = None):
        return self.contact_list[start:end]




if __name__ == "__main__":
    contactList = ConatctList()
    contactList.add(ContactInfo('홍길동1', 'hong1@gmail.com'))
    contactList.add(ContactInfo('홍길동2', 'hong1@gmail.com'))
    contactList.add(ContactInfo('홍길동3', 'hong1@gmail.com'))
    contactList.add(ContactInfo('홍길동4', 'hong1@gmail.com'))
    contactList.add(ContactInfo('홍길동5', 'hong1@gmail.com'))

    # list1 = contactList.getList(end=3)
    # for ci in list1:
    #     ci.print_info()
    
    for ci in contactList:
        ci.print_info()
   
