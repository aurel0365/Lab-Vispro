import 'dart:io';
void main () {
  stdout.write('Masukkan Suhu Celsius : ');
  double C = double.parse(stdin.readLineSync()!);

  double Fahrenheit = (9/5 * C + 32) ;
  print('Hasil Suhu Celsius yang telah dikonversi ke Farenheit: $Fahrenheit ');


} 