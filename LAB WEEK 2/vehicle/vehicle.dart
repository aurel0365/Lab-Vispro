class Vehicle {
  String name;
  double speed;

  Vehicle(this.name, this.speed);

  void move() {
    if (speed >60){
      print('$name nya berjalan dengan cepat.');
  }else{
    print('$name nya berjalan dengan lambat');
  }
  }
}

class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  void move() {
    if (speed >60){
      print('$name nya berjalan dengan cepat.');
  }else{
    print('$name nya berjalan dengan lambat.');
}
  }
}

class Bus extends Vehicle {
  Bus(String name, double speed) : super(name, speed);

   @override
  void move() {
    if (speed >60){
      print('$name nya berjalan dengan cepat melewati kemacetab.');
  }else{
    print('$name nya berjalan dengan lambat melewati kemacetan');
}
  }
}


