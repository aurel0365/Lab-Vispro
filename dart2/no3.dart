import 'dart:io';
void main () {
  const double pi = 3.14 ;
  
  stdout.write('Masukkan Diameter Lingkaran : ');
  double diameterL = double.parse(stdin.readLineSync()!);

  double diameter = (diameterL / 2);
  print('Total Diameter : $diameter');

  double luas = (pi * diameter * diameter);
  print ('Luas Lingkaran : $luas');

} 