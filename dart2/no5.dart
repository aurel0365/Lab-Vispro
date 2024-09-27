import 'dart:io';
void main () {
  const int DuaJamPertama = 2000;
  const int tiapJamBerikutnya = 1000;

  print('Selamat Datang!!');
  stdout.write('Silahkan Masukkan Total Jam Parkir : ');
  int TotalJam = int.parse(stdin.readLineSync()!);

  int TotalHarga;
   if (TotalJam == 2){
    TotalHarga = DuaJamPertama;
    print('Total Harga Parkir 2 Jam pertama : $TotalHarga'); 
   }else if (TotalJam > 2 ){
    TotalHarga = DuaJamPertama + ( TotalJam - 2)  * tiapJamBerikutnya ;
    print('Total Harga Parkir selama $TotalJam jam :$TotalHarga ');
   } else {TotalJam = 0; } {
    TotalHarga = 0;
   }
}
   