import 'animalsound.dart';
void main() {
  Dog dog = Dog();
  Cat cat = Cat();

  print('Dog:');
  dog.suara();
  dog.makan();

  print('\nCat:');
  cat.suara();
  cat.makan();
}
