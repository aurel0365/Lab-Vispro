import 'dart:io';
import 'studentclass.dart';
void main(){
  print('Student Name : ');
  String? name = stdin.readLineSync();

  print('Student ID : ');
  String? studentID = stdin.readLineSync();

  print('Student Grade : ');
  double grade = double.parse(stdin.readLineSync()!);

Studentinfo student1 =Studentinfo(name!, studentID!, grade);

student1.displayinfo();

if (student1 .passthegrade()){
  print('$student1 has passed the grade ');
}else {
  print('$student1 has failed the grade ');
}

}