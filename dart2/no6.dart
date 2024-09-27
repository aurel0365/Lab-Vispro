import 'dart:io';
void main () {
  const int gajiPokok = 4000000;
  const int Bonus = 200000;
  const int totaljamnormal = 40;

  stdout.write('Masukkan Total Jam Kerja per minggu : ');
  int TotalJampermgg = int.parse(stdin.readLineSync()!);

  int Totalgaji = gajiPokok;
   if (TotalJampermgg > totaljamnormal){
      Totalgaji += Bonus ;
   }
   
  print('Total Gaji $TotalJampermgg jam per minggu : $Totalgaji');
}
 
   


   