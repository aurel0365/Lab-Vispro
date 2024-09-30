class animal {
  void suara(){
    print('this animal makes a sound');
  }
  void makan (){
    print('this animal is eating');
  }
}
class Dog extends animal {
  @override
  void suara() {
    print('Woof! Woof!');
  }

  @override
  void makan() {
    print('The dog is eating dog food.');
  }
}

class Cat extends animal {
  @override
  void suara() {
    print('Meow! Meow!');
  }

  @override
  void makan() {
    print('The cat is eating cat food.');
  }
}


 